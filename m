Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEED1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlMIJqQF4z3BBJ73lUfyXi6ssyZWkajHGv/LvBu697U=; b=E6Um0dS6eb4B6LUQEh9+qv0PPm
	FVGkOwHVZ2qCYF//3CjZuPOTh0/oz9ETqKEIIpNRApWk7W+VPgYdkIGMsGnE5evq0IPtRkQc7TXnR
	g2OWrkRcGguRiHtHJYvFowdBzLbSdDFgDQI4mGlanf6xr+0KmPJIIkliUXZs6v8dJR1K+aaL05tQ8
	lm5cM2i4uyJrLsdpsK2ieky9JKo/F5/OZCJkbnvus9TKoBHeL8iUBSJSALeeUqENhDZzLHyRvm7QX
	8va/vNvtgWCbd7Y6tV4xWw6Hhs/hJ9HTU4VTgFoMi2YDpQvtXbRlWO24ylzn0tEheypZD7X/R9KMF
	aOwcZoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzL4-00000000pjT-3Szb;
	Tue, 25 Feb 2025 18:07:26 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykd-00000000e9o-0tvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5E2E612B2;
	Tue, 25 Feb 2025 17:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21712C4CEE8;
	Tue, 25 Feb 2025 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504586;
	bh=KqTJJJlKyqMVc2PH2Cuiz0NayHv0pDB4bXBKnTulMnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hu3nkEtrImmU6oN9zOZH9GRDCiBDx2joFi6/djszJU8WZnG7Sv7bBjQfSX4GCUBsr
	 6VW+WVeI0H0S718ucIx1WEWqiGxCsAwKqgbgayAQtk3gx1l8bl5p0mOG6j33GG1VI2
	 RnKB5+JdfiMR2vcm+IYvTZHnvu+K9sxYitYFYOG1URU3E0sppOkj9XIF20x+e72eOo
	 akTK0qQx50NTADkAzz32Tp1HMGd5VdLrXExuPwLVsEMwCMZZLj8iIyETx4mhleTUai
	 uuYZHQUUpQa6we2m8NYlLucbbbJ8TwpmezlN9agx7qOWuDeefTjjdK27c1O6evpqyJ
	 DgrHXE7RWgqYg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmyka-007rKs-2H;
	Tue, 25 Feb 2025 17:29:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 02/16] arm64: sysreg: Add layout for ICH_VTR_EL2
Date: Tue, 25 Feb 2025 17:29:16 +0000
Message-Id: <20250225172930.1850838-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

The ICH_VTR_EL2-related macros are missing a number of config
bits that we are about to handle. Take this opportunity to fully
describe the layout of that register as part of the automatic
generation infrastructure.

This results in a bit of churn to repaint constants that are now
generated with a different format.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h       | 13 -------------
 arch/arm64/kvm/vgic-sys-reg-v3.c      |  8 ++++----
 arch/arm64/kvm/vgic/vgic-v3.c         | 16 +++++++---------
 arch/arm64/tools/sysreg               | 14 ++++++++++++++
 tools/arch/arm64/include/asm/sysreg.h | 13 -------------
 5 files changed, 25 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 76a88042390f3..b59b2c680e977 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -562,7 +562,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_VTR_EL2			sys_reg(3, 4, 12, 11, 1)
 #define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
@@ -1022,18 +1021,6 @@
 #define ICH_VMCR_ENG1_SHIFT	1
 #define ICH_VMCR_ENG1_MASK	(1 << ICH_VMCR_ENG1_SHIFT)
 
-/* ICH_VTR_EL2 bit definitions */
-#define ICH_VTR_PRI_BITS_SHIFT	29
-#define ICH_VTR_PRI_BITS_MASK	(7 << ICH_VTR_PRI_BITS_SHIFT)
-#define ICH_VTR_ID_BITS_SHIFT	23
-#define ICH_VTR_ID_BITS_MASK	(7 << ICH_VTR_ID_BITS_SHIFT)
-#define ICH_VTR_SEIS_SHIFT	22
-#define ICH_VTR_SEIS_MASK	(1 << ICH_VTR_SEIS_SHIFT)
-#define ICH_VTR_A3V_SHIFT	21
-#define ICH_VTR_A3V_MASK	(1 << ICH_VTR_A3V_SHIFT)
-#define ICH_VTR_TDS_SHIFT	19
-#define ICH_VTR_TDS_MASK	(1 << ICH_VTR_TDS_SHIFT)
-
 /*
  * Permission Indirection Extension (PIE) permission encodings.
  * Encodings with the _O suffix, have overlays applied (Permission Overlay Extension).
diff --git a/arch/arm64/kvm/vgic-sys-reg-v3.c b/arch/arm64/kvm/vgic-sys-reg-v3.c
index 9e7c486b48c2e..5eacb4b3250a1 100644
--- a/arch/arm64/kvm/vgic-sys-reg-v3.c
+++ b/arch/arm64/kvm/vgic-sys-reg-v3.c
@@ -35,12 +35,12 @@ static int set_gic_ctlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 
 	vgic_v3_cpu->num_id_bits = host_id_bits;
 
-	host_seis = FIELD_GET(ICH_VTR_SEIS_MASK, kvm_vgic_global_state.ich_vtr_el2);
+	host_seis = FIELD_GET(ICH_VTR_EL2_SEIS, kvm_vgic_global_state.ich_vtr_el2);
 	seis = FIELD_GET(ICC_CTLR_EL1_SEIS_MASK, val);
 	if (host_seis != seis)
 		return -EINVAL;
 
-	host_a3v = FIELD_GET(ICH_VTR_A3V_MASK, kvm_vgic_global_state.ich_vtr_el2);
+	host_a3v = FIELD_GET(ICH_VTR_EL2_A3V, kvm_vgic_global_state.ich_vtr_el2);
 	a3v = FIELD_GET(ICC_CTLR_EL1_A3V_MASK, val);
 	if (host_a3v != a3v)
 		return -EINVAL;
@@ -68,10 +68,10 @@ static int get_gic_ctlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	val |= FIELD_PREP(ICC_CTLR_EL1_PRI_BITS_MASK, vgic_v3_cpu->num_pri_bits - 1);
 	val |= FIELD_PREP(ICC_CTLR_EL1_ID_BITS_MASK, vgic_v3_cpu->num_id_bits);
 	val |= FIELD_PREP(ICC_CTLR_EL1_SEIS_MASK,
-			  FIELD_GET(ICH_VTR_SEIS_MASK,
+			  FIELD_GET(ICH_VTR_EL2_SEIS,
 				    kvm_vgic_global_state.ich_vtr_el2));
 	val |= FIELD_PREP(ICC_CTLR_EL1_A3V_MASK,
-			  FIELD_GET(ICH_VTR_A3V_MASK, kvm_vgic_global_state.ich_vtr_el2));
+			  FIELD_GET(ICH_VTR_EL2_A3V, kvm_vgic_global_state.ich_vtr_el2));
 	/*
 	 * The VMCR.CTLR value is in ICC_CTLR_EL1 layout.
 	 * Extract it directly using ICC_CTLR_EL1 reg definitions.
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 5e9682a550460..51f0c7451817d 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -284,12 +284,10 @@ void vgic_v3_enable(struct kvm_vcpu *vcpu)
 		vgic_v3->vgic_sre = 0;
 	}
 
-	vcpu->arch.vgic_cpu.num_id_bits = (kvm_vgic_global_state.ich_vtr_el2 &
-					   ICH_VTR_ID_BITS_MASK) >>
-					   ICH_VTR_ID_BITS_SHIFT;
-	vcpu->arch.vgic_cpu.num_pri_bits = ((kvm_vgic_global_state.ich_vtr_el2 &
-					    ICH_VTR_PRI_BITS_MASK) >>
-					    ICH_VTR_PRI_BITS_SHIFT) + 1;
+	vcpu->arch.vgic_cpu.num_id_bits = FIELD_GET(ICH_VTR_EL2_IDbits,
+						    kvm_vgic_global_state.ich_vtr_el2);
+	vcpu->arch.vgic_cpu.num_pri_bits = FIELD_GET(ICH_VTR_EL2_PRIbits,
+						     kvm_vgic_global_state.ich_vtr_el2) + 1;
 
 	/* Get the show on the road... */
 	vgic_v3->vgic_hcr = ICH_HCR_EL2_En;
@@ -633,7 +631,7 @@ static const struct midr_range broken_seis[] = {
 
 static bool vgic_v3_broken_seis(void)
 {
-	return ((kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_SEIS_MASK) &&
+	return ((kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_SEIS) &&
 		is_midr_in_range_list(read_cpuid_id(), broken_seis));
 }
 
@@ -707,10 +705,10 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
 	if (vgic_v3_broken_seis()) {
 		kvm_info("GICv3 with broken locally generated SEI\n");
 
-		kvm_vgic_global_state.ich_vtr_el2 &= ~ICH_VTR_SEIS_MASK;
+		kvm_vgic_global_state.ich_vtr_el2 &= ~ICH_VTR_EL2_SEIS;
 		group0_trap = true;
 		group1_trap = true;
-		if (ich_vtr_el2 & ICH_VTR_TDS_MASK)
+		if (ich_vtr_el2 & ICH_VTR_EL2_TDS)
 			dir_trap = true;
 		else
 			common_trap = true;
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index fa77621aba1a3..3e82a072eb493 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3057,6 +3057,20 @@ Field	1	UIE
 Field	0	En
 EndSysreg
 
+Sysreg	ICH_VTR_EL2	3	4	12	11	1
+Res0	63:32
+Field	31:29	PRIbits
+Field	28:26	PREbits
+Field	25:23	IDbits
+Field	22	SEIS
+Field	21	A3V
+Field	20	nV4
+Field	19	TDS
+Field	18	DVIM
+Res0	17:5
+Field	4:0	ListRegs
+EndSysreg
+
 Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
 Fields	CONTEXTIDR_ELx
 EndSysreg
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index 0ce8fc540fe22..5d9d7e394b254 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -558,7 +558,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_VTR_EL2			sys_reg(3, 4, 12, 11, 1)
 #define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
@@ -1018,18 +1017,6 @@
 #define ICH_VMCR_ENG1_SHIFT	1
 #define ICH_VMCR_ENG1_MASK	(1 << ICH_VMCR_ENG1_SHIFT)
 
-/* ICH_VTR_EL2 bit definitions */
-#define ICH_VTR_PRI_BITS_SHIFT	29
-#define ICH_VTR_PRI_BITS_MASK	(7 << ICH_VTR_PRI_BITS_SHIFT)
-#define ICH_VTR_ID_BITS_SHIFT	23
-#define ICH_VTR_ID_BITS_MASK	(7 << ICH_VTR_ID_BITS_SHIFT)
-#define ICH_VTR_SEIS_SHIFT	22
-#define ICH_VTR_SEIS_MASK	(1 << ICH_VTR_SEIS_SHIFT)
-#define ICH_VTR_A3V_SHIFT	21
-#define ICH_VTR_A3V_MASK	(1 << ICH_VTR_A3V_SHIFT)
-#define ICH_VTR_TDS_SHIFT	19
-#define ICH_VTR_TDS_MASK	(1 << ICH_VTR_TDS_SHIFT)
-
 /*
  * Permission Indirection Extension (PIE) permission encodings.
  * Encodings with the _O suffix, have overlays applied (Permission Overlay Extension).
-- 
2.39.2


