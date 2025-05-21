Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24392C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGZfeDYhBuc4vhNajfnpIXKSyHn6ximO9eXqlA2STQI=; b=x/jh7GAwFLrCO32DGzBh5aWFo7
	nH64btnah1DpZNWYxSZUdRo9Sn1hpwVM+XWJ2hSBlCfaDzjUO/5sH+CSFgW9klkvU/0V8NabNo6yp
	NueGjlsYnmgHdpBtYajkdMoyStKpbxg8LBoOYpn5LbDH/7QaYntFR5f4N9jTWIA91PSp2K8ZC4Iqx
	K5v4hX/UCeOwkYRWuykgauvlfIa5hlqz8G1ztELL+lUNyGsDdQKryq5QaaPvD0SvIRqElx0gH4jUe
	rgVOoMHEW+NSJT84Te83rFQzxO1llRZ2cCl3hacxuOZfAX3uAOEn42l+bahCt1M71Sf+j5QHTpp33
	yunowZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhMY-0000000FasC-0XkB;
	Wed, 21 May 2025 11:11:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhGC-0000000Fa2R-3v36
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6365D629D5;
	Wed, 21 May 2025 11:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E54C4CEE4;
	Wed, 21 May 2025 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747825520;
	bh=42u/zmytvqbcX3xApId5MoKd0PTEG2SAmeYvKU2zQd4=;
	h=From:To:Cc:Subject:Date:From;
	b=AqN4FMLB6wqzCn4JgVF9n7vZaP+jMQ81756k1kI9Fu6P03YWo/fNGAGaqnTfLmqX7
	 xCqnx5ZJLDb7AK5RW31f4rstkckzyXVgdm7aKrJbtK0wj5tTFQo3oweG6cAVPCtrVv
	 d3CeRIM2BP9Vv8bKCGugkK3TsB9UAxRvvkj8/PbHnaFRw+gs8kwTKDKAWfb4T+GYyO
	 VkromKhPXv5Qf/INpi5E5r5SQHQZYJWQG/1F8FxLSzJkwB73QoJTegrhmE0Wexf5H9
	 7O2a6ya/+TvH1qePD1vLeKdk8J384+TO4iYQ5fOJovVekjTGyJUH6b1huidRezsaGn
	 Bs7g2ND+Rnzzw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uHhG9-00GuFW-OT;
	Wed, 21 May 2025 12:05:17 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: nv: Handle TLBI S1E2 for VNCR invalidation with mmu_lock held
Date: Wed, 21 May 2025 12:05:14 +0100
Message-Id: <20250521110514.66305-1-maz@kernel.org>
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

Calling invalidate_vncr_va() without the mmu_lock held for write
is a bad idea, and lockdep tells you about that.

Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 56b732003caa7..2381663d2ee98 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1044,6 +1044,8 @@ void kvm_handle_s1e2_tlbi(struct kvm_vcpu *vcpu, u32 inst, u64 val)
 	struct s1e2_tlbi_scope scope = {};
 
 	compute_s1_tlbi_range(vcpu, inst, val, &scope);
+
+	guard(write_lock)(&vcpu->kvm->mmu_lock);
 	invalidate_vncr_va(vcpu->kvm, &scope);
 }
 
-- 
2.39.2


