Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uv4tFulsNiPMlPTOYPgO5fxapV7GH8mlELnn979IaNI=; b=Q7mhrObE81QFdgwRNqbCgZvwSK
	hRst081g8dXKEZdTNVN/pQGsGJeEckaw1p0GNHsiszBbxK3f7scSnCFx8fE1ovsIFrRvsGmJc78Do
	H/HAlhsa1780RJjs9CXHf794eqUIVO4TZTQ4jgSJtS3Fva3wELJDApYMa2FSRz9NiSFPeaGoculom
	ew2x8EuSTEdHErQxxnmF8RLu1328hUm9H+g9s4i4D3aKB7iMFudr5FEeC8iAtaSUKnOMP5x+Cs/EP
	EZ0CZnaPv/OpLaf1lf/Ux5mK7+i/Yu+5aVT2U51bUYgTh+yFl9dk91yqcxJpTGdcIEfxFQqvk6NY0
	I1zLwipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsf-00000004uYD-0hzn;
	Thu, 02 Jul 2026 16:03:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsW-00000004uGB-1331
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F33D143F55;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F5E1F01567;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008183;
	bh=uv4tFulsNiPMlPTOYPgO5fxapV7GH8mlELnn979IaNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MVZavD/KrqwrDZVGsf41nm92OCBkMV5XoohBvzKIz+M7gOv/VqdoZrtC5EO09I0S3
	 FHqQMKVwt5IOILoMsc06JUcWqsMuwxMPIMTLs1gK95mZaGYSAjHylbQfd04ZSFAgzb
	 LrZE+Ly+ngPV5r/vJGxtNyvyTMqr8TcUIn9A91oJgZKk+Iq1Hug+7egBCKlOdUE/yr
	 i/5psThji7sl+FoQPPCA/OvDMxnUHWKeICJ4eRxNQlLMcZg4BMSzuhkh8SjOwUPZxm
	 99uW+eLLCcDWDX3C9ZpDeqTVdIZ4RvVCO2WhL1ebOdwnMw240qATpD9TL3Hl1dGT8f
	 FZkyWVKmOwNgA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsU-00000000ojd-0llR;
	Thu, 02 Jul 2026 16:03:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 20/28] KVM: arm64: Add sanitisation for NVHCR_EL2
Date: Thu,  2 Jul 2026 17:02:40 +0100
Message-ID: <20260702160248.1377250-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

Just like any other VNCR-based register, NVHCR_EL2 requires some
level of sanitisation. Being specified as a live copy of HCR_EL2,
it adopts the exact same format, but depends on FEAT_NV3 instead.

A subtle aspect is that we only want to apply the sanitisation if
FEAT_NV3 is actually present, as the VNCR location is otherwise
used to back accesses to HCR_EL2.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 15 +++++++++++++++
 arch/arm64/kvm/nested.c |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index b9a9d65b973e6..7e86479142723 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1017,6 +1017,9 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
 			      hcr_feat_map, FEAT_AA64EL2);
 
+static const DECLARE_FEAT_MAP(nvhcr_desc, NVHCR_EL2,
+			      hcr_feat_map, FEAT_NV3);
+
 static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
 	NEEDS_FEAT(SCTLR2_EL1_NMEA	|
 		   SCTLR2_EL1_EASE,
@@ -1391,6 +1394,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hdfgwtr2_desc);
 	check_reg_desc(&hcrx_desc);
 	check_reg_desc(&hcr_desc);
+	check_reg_desc(&nvhcr_desc);
 	check_reg_desc(&sctlr2_desc);
 	check_reg_desc(&tcr2_el2_desc);
 	check_reg_desc(&sctlr_el1_desc);
@@ -1590,6 +1594,17 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 	case HCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
 		break;
+	case NVHCR_EL2:
+		/*
+		 * Only apply sanitisation if we do have FEAT_NV3.
+		 * Otherwise, the register aliases with HCR_EL2 in VNCR,
+		 * and we're better off relying on data transfers between
+		 * NVHCR_EL2 and HCR_EL2 to sanitise things.
+		 */
+		resx = (kvm_has_nv3(kvm) ?
+			compute_reg_resx_bits(kvm, &nvhcr_desc, 0, 0) :
+			(typeof(resx)){});
+		break;
 	case SCTLR2_EL1:
 	case SCTLR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 9972dea42d12a..c9bf04944f9cb 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1830,6 +1830,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	resx = get_reg_fixed_bits(kvm, HCR_EL2);
 	set_sysreg_masks(kvm, HCR_EL2, resx);
 
+	/* NVHCR_EL2 */
+	resx = get_reg_fixed_bits(kvm, NVHCR_EL2);
+	set_sysreg_masks(kvm, NVHCR_EL2, resx);
+
 	/* HCRX_EL2 */
 	resx = get_reg_fixed_bits(kvm, HCRX_EL2);
 	set_sysreg_masks(kvm, HCRX_EL2, resx);
-- 
2.47.3


