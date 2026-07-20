Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CC3C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gktMd1z97qKRm65uykxL7tkOFdtPf+UvDzjJVptox4=; b=lp/elm7j+aof3T0iLx8nVnp8b0
	e4ruaXTzs6Ih5ljhWVMommUrWbd8YnYnBjxfDH8RUZ+LSJDPlWYuaa438uG15XUXFT+9gX5QPWgTo
	O9HmFqfk5d2JwL/nAqPGsImADUVJgP+6V45CBWVq1vbKsFkfUnlYxg5xMTlp84/2lLCIKLd+bDgds
	ui8t6RJ2y3vwCOAVDms7a1Y2bZxolHMGJvM3gSvuT8XgZ0oYLdMRBQgm7M1Cilb7MuPu93Y8ZOAeb
	CKHLFeVHpLZT04jFFFMHkYpmlMLFQKw1daO+RMbGL7L2grU7GutqqRxGt3t8Gs1MOCfeBCpD2DsYf
	Mcf45SkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxC-00000006mpq-3q1B;
	Mon, 20 Jul 2026 13:22:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxB-00000006mnx-3Mf0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CA7043C42;
	Mon, 20 Jul 2026 13:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E091F00ACA;
	Mon, 20 Jul 2026 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553761;
	bh=4gktMd1z97qKRm65uykxL7tkOFdtPf+UvDzjJVptox4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AtQQlf8H8Pw+B272nhx53brEQt1RRgoy9wVSajVdF6Tj32zR6DpdKpOQislBHhkOu
	 qhzrG6xBxvdlNGBZR2qFdJ6js7fWZwrQZ5sqwnIv2FCWHByZ+rCw+6+z+xkgE9tXdo
	 s+61+yC3l1nVB7BcPmILND7e49ui0Uv5MlMxRuSiqrVG6LYDn6z/aeT5gd8XN6Bpw3
	 XWHA36oBZFQmbnboUcWhcdWHgI5I75FSz9/BVsj1MNViQ0GC49WqAmBi3rNKD0p9Oi
	 v9lauV175+kGfkZzIW4Ryvn5qhPxI++whZ2nedPZID69wvdaTBBBwfdBuY10CdL6Gf
	 7Wps0P89ImF/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wlnx9-00000006oKK-20dx;
	Mon, 20 Jul 2026 13:22:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 4/5] KVM: arm64: vgic-v3: Simplify initial GICv3 configuration sampling
Date: Mon, 20 Jul 2026 14:22:19 +0100
Message-ID: <20260720132220.2143486-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720132220.2143486-1-maz@kernel.org>
References: <20260720132220.2143486-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

Now that we have our magic inline helper for ICH_VTR_EL2, we can
get rid of the hack that was reporting a combination of that
register and of the indication of the CPU interface supporting
GICv2 compatibility. We now only report the latter.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c |  9 ++-------
 arch/arm64/kvm/vgic/vgic-v3.c   | 13 +++++++------
 arch/arm64/kvm/vgic/vgic-v5.c   |  2 +-
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 3e5d5ddf35a19..8a15d6854d1bd 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -439,8 +439,6 @@ void __vgic_v3_init_lrs(void)
 
 /*
  * Return the GIC CPU configuration:
- * - [31:0]  ICH_VTR_EL2
- * - [62:32] RES0
  * - [63]    MMIO (GICv2) capable
  */
 u64 __vgic_v3_get_gic_config(void)
@@ -455,7 +453,7 @@ u64 __vgic_v3_get_gic_config(void)
 	 * system, so we first check if we have GICv5 support.
 	 */
 	if (cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF))
-		return vgic_ich_vtr();
+		return 0;
 
 	sre = read_gicreg(ICC_SRE_EL1);
 	/*
@@ -497,10 +495,7 @@ u64 __vgic_v3_get_gic_config(void)
 		isb();
 	}
 
-	val  = (val & ICC_SRE_EL1_SRE) ? 0 : (1ULL << 63);
-	val |= vgic_ich_vtr();
-
-	return val;
+	return (val & ICC_SRE_EL1_SRE) ? 0 : (1ULL << 63);
 }
 
 static void __vgic_v3_compat_mode_enable(void)
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index ef62dd498f5cf..68d4a486df0a1 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -906,6 +906,9 @@ void noinstr kvm_patch_ich_vtr_el2(struct alt_instr *alt,
 
 	vtr = res.a1;
 
+	if (vgic_v3_broken_seis())
+		vtr &= ~ICH_VTR_EL2_SEIS;
+
 	/* Compute target register */
 	oinsn = le32_to_cpu(*origptr);
 	rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, oinsn);
@@ -950,12 +953,12 @@ void vgic_v3_enable_cpuif_traps(void)
  */
 int vgic_v3_probe(const struct gic_kvm_info *info)
 {
-	u64 ich_vtr_el2 = kvm_call_hyp_ret(__vgic_v3_get_gic_config);
+	u64 ich_vtr_el2;
 	bool has_v2;
 	int ret;
 
-	has_v2 = ich_vtr_el2 >> 63;
-	ich_vtr_el2 = (u32)ich_vtr_el2;
+	has_v2 = kvm_call_hyp_ret(__vgic_v3_get_gic_config) >> 63;
+	ich_vtr_el2 = vgic_ich_vtr();
 
 	/*
 	 * The ListRegs field is 5 bits, but there is an architectural
@@ -1010,10 +1013,8 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
 	if (has_v2)
 		static_branch_enable(&vgic_v3_has_v2_compat);
 
-	if (vgic_v3_broken_seis()) {
+	if (vgic_v3_broken_seis())
 		kvm_info("GICv3 with broken locally generated SEI\n");
-		kvm_vgic_global_state.ich_vtr_el2 &= ~ICH_VTR_EL2_SEIS;
-	}
 
 	vgic_v3_enable_cpuif_traps();
 
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index d4789ff3e7402..16bc0a670d3e5 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -83,7 +83,7 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
 	}
 
 	kvm_vgic_global_state.has_gcie_v3_compat = true;
-	ich_vtr_el2 =  kvm_call_hyp_ret(__vgic_v3_get_gic_config);
+	ich_vtr_el2 = vgic_ich_vtr();
 	kvm_vgic_global_state.ich_vtr_el2 = (u32)ich_vtr_el2;
 
 	/*
-- 
2.47.3


