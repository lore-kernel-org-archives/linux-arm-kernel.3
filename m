Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F967C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eqnSca8eJzqmZ6YsrF+7WoFJa9dofdUpXG/pyLmPj9Y=; b=DgM2nS7AYaRFOBtivd1SinKOQZ
	sroWs3ksLnBW32r07j3sN4tVwqr6yX4EKNioGvpBfBH2KYbVJjfPzqxAZJURGhy4X7hSGYQRq9BgC
	oWwRgirSEgdD3FYcjiYyydHf96CX+Vo6nGkbbV8ULwiU4hS6aZtJMqpcanlLZC3ROqL+ClyAmMsVW
	yNBLSN66def0wawW+LFrfVg0xOyAYUw44FQETS4JEyyaQLVk71kp06FQSK1xByj7sH/q2KTAA7xvN
	PYTWS74eJUTE/70aXw1dMbppG5IwZI+mLR8geRezowF+tw/9i+6o7pTz2hJjIRXSlI2cVtgmDhTJr
	9rQBSgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhKW-0000000FaXW-1ZE3;
	Wed, 21 May 2025 11:09:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhFn-0000000Fa0n-3KC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0EBC6000A;
	Wed, 21 May 2025 11:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8672CC4CEE4;
	Wed, 21 May 2025 11:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747825492;
	bh=WJdu57W6UhDvcHCfpgC+UA9weTaVsrZwvOCeKead1G0=;
	h=From:To:Cc:Subject:Date:From;
	b=f2db5NFhShu2tICwJNJQFax1HAv25M/sDmZZRWTxQsEPnxBJ8HCEWWC77Sj+kfS3n
	 yQHXYydq8WtpxCjpmlUeizYLrSs0NQ36I1EcDoYj5QMxk55tXWa0NIHnkkmpwbXMzy
	 kfJYEEmMWA6odT5O7UdPZ5h/4T2iMp7mVipKM4jscO3pd6QeXmj3Rk10OMoA/sgyHS
	 z4VDlw1O+z+Ewo4xv5cWDTy+/BhaK8+1ZnfWgjmxLHnTFyCszOrA5882mOIRccLR+c
	 lsD+TXJp8ObQZPghLFMdSMU36zwZvnOEcJWWFZTgqqu9X8mdGc6emjKDp9uAWdLPOz
	 fBKdtbK6ZRVIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uHhFi-00GuEZ-Ca;
	Wed, 21 May 2025 12:04:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: nv: Release faulted-in VNCR page from mmu_lock critical section
Date: Wed, 21 May 2025 12:04:35 +0100
Message-Id: <20250521110435.66273-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The conversion to kvm_release_faultin_page() missed the requirement
for this to be called within a critical section with mmu_lock held
for write. Move this call up to satisfy this requirement.

Fixes: 069a05e535496 ("KVM: arm64: nv: Handle VNCR_EL2-triggered faults")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 2381663d2ee98..e7e71f1615f19 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1228,9 +1228,9 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
 		vt->cpu = -1;
 
 		kvm_make_request(KVM_REQ_MAP_L1_VNCR_EL2, vcpu);
+		kvm_release_faultin_page(vcpu->kvm, page, false, vt->wr.pw);
 	}
 
-	kvm_release_faultin_page(vcpu->kvm, page, false, vt->wr.pw);
 	if (vt->wr.pw)
 		mark_page_dirty(vcpu->kvm, gfn);
 
-- 
2.39.2


