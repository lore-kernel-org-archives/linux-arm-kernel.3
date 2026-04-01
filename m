Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B142D35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zASGTfZ+33JbgJ3D/s05Alqau2X58Ns03AI3j5bS3pg=; b=hMu24TykCNu8A+G0HRJ+x0qe3X
	Q3sg5V3knXHbd92QHVoZDof5TI/JbVBll1ZjFbJRrLp3K3XjCmkgEn1eFFiUdl5VtHAIfHc+/xkE9
	gtKyN1U7Mj5AmY4XOO3YCjsBk6PSwvSGjYMXVgersZa3tUdHwWTGLlxv2qeqXv75nGZMKCSlqZyFr
	sJy5JGb0Yu+SarDh16fiDmHiT0lqRfqAFjidLOBI2d8mVQFvwBYChetZD+OTxKr6H8d0MpyCGAdPl
	04HFdY4FvV+/Oi4XoabEnI1sYmZrEyLH8kAVXANo/rXGyDMmH08O6C8agC7Mnjesc1PgQyhMLj4oA
	g+4Q9I+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw9-0000000EWHF-19Jx;
	Wed, 01 Apr 2026 10:36:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw4-0000000EWBQ-31fk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B4EC40805;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54070C2BC9E;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039791;
	bh=0Dwza5wtWzXLnzyMRtfcuvqkajZMUXf1iFoYojfEAEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfusRmbS0ULclFjgxQqLhWPcuON1OM3epb1skIZ0d+Ht4hxnGN68orOf2TAmq2EIu
	 z0fTQmxVqbupBLjXkA2qlEpLVWlkI8hyN2luuyW/gqS5yDnYPKmNEQ6Y5L0QVLm2v9
	 1hMxiNrJoARgvrFAlTpBdGJxtGzvnDGkEUSVP1oBqWi3mqZF7gehXoPUiIMh++3rOm
	 UQKAQBh2/8YM0qe2BmXa6P0g7/43zvnwBCBfusYvT1gR1jhn8Z710uaD3vZleUjjby
	 LzrO05SqkfGY8k7avmzNF2VGZ/EHFURlwwOo+2pVdwNdQS/zv/lMBaDm/EvPs3kh6R
	 jy7dqQd6ngTFg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw1-00000007oRQ-1rpa;
	Wed, 01 Apr 2026 10:36:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 01/16] KVM: arm64: vgic: Don't reset cpuif/redist addresses at finalize time
Date: Wed,  1 Apr 2026 11:35:56 +0100
Message-ID: <20260401103611.357092-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_033632_797615_EC7FCFB0 
X-CRM114-Status: GOOD (  12.70  )
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

Although we are OK with rewriting idregs at finalize time, resetting
the guest's cpuif (GICv3) or redistributor (GICv3) addresses once
we start running the guest is a pretty bad idea.

Move back this initialisation to vgic creation time.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: a258a383b9177 ("KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE")
Link: https://patch.msgid.link/20260323174713.3183111-1-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 47169604100f2..fd872079f2a24 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -147,6 +147,15 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 	kvm->arch.vgic.implementation_rev = KVM_VGIC_IMP_REV_LATEST;
 	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
 
+	switch (type) {
+	case KVM_DEV_TYPE_ARM_VGIC_V2:
+		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
+		break;
+	case KVM_DEV_TYPE_ARM_VGIC_V3:
+		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
+		break;
+	}
+	
 	/*
 	 * We've now created the GIC. Update the system register state
 	 * to accurately reflect what we've created.
@@ -684,10 +693,8 @@ void kvm_vgic_finalize_idregs(struct kvm *kvm)
 
 	switch (type) {
 	case KVM_DEV_TYPE_ARM_VGIC_V2:
-		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
 		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V3:
-		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
 		aa64pfr0 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
 		pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
 		break;
-- 
2.47.3


