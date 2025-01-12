Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB8FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xacPXW9rqAfnMZm/CyNw88KrEktUJeXaL0gGaag0FF8=; b=o5iWuTEos/VXMr+dO4GHnGMjxk
	AOuCgRC8IQPTb7eDZrAKPk+S08Jvg+VEYQDd2sIh+dBmBT3JEAdX11gtPY6gSM25c7FQVE5dXSpBK
	y/nhaUFntBVQzH/BAnR7j3h69DZu4sVb7iEJpF+SM6omOl1OEUCbc1blG9dsTGrm3rGlcYqEDMO8/
	UyqY0Rm/980PVtz53BAV+2tGZ7M0+naOxQPSzLJUwkEMKKdRy+F9kUYORanMHUP8T/uN31RT+IC44
	G2Nj7ryJwrsfOGx6XHKbW4baHP5MmyE3MUbYs9dPiDFXGPwiKQmuBrmp0FETwGjXVgrUlpmbtJ8Bz
	JDbeG4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Ze-000000038yA-0MAR;
	Sun, 12 Jan 2025 17:16:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SG-000000037ev-2biR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 458D2A408DD;
	Sun, 12 Jan 2025 17:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11205C4CEE5;
	Sun, 12 Jan 2025 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701731;
	bh=k4zd0+92+vTENw2V6ehlfzPFY0qjPTy8ivaAl3XmJ68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUNHFvsSatMbYGcP3JabQJJkMbYnt0HsAk57CyHDV2PxKoRAsDMABvwpUvblnU85n
	 6V+Ikp6CrDJ1aCpzxN8R5/CV8ExtcRB6NIpUf2Z7zlXQxEoK4nxiWTwsoBqbxnU4Or
	 KhFq8nnpfvSrBzhGFkSrcqgyE3Td7q8RkkFAlTL5ohHJ1L1tUHx1omfgWqKQWQL6UN
	 /gB45EEoB2xo6qEn0D3O530s5EhUTuIYOoZ0W/podFxRVZml2KI8Oz+oNsJZ5Xo+uk
	 vY1iK2pK0wyhTo187Fb80pQrDva5mW27W4i+Z3PUDXzsn+54b6U01a3QSOIK0MoGvZ
	 5mpynFf/QIozg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SC-00BNxR-V5;
	Sun, 12 Jan 2025 17:08:49 +0000
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
Subject: [PATCH v2 02/17] arm64: sysreg: Add layout for ICH_VTR_EL2
Date: Sun, 12 Jan 2025 17:08:30 +0000
Message-Id: <20250112170845.1181891-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090852_834275_4FD16D78 
X-CRM114-Status: GOOD (  15.63  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h       | 13 -------------
 arch/arm64/kvm/vgic-sys-reg-v3.c      |  8 ++++----
 arch/arm64/kvm/vgic/vgic-v3.c         | 16 +++++++---------
 arch/arm64/tools/sysreg               | 14 ++++++++++++++
 tools/arch/arm64/include/asm/sysreg.h | 13 -------------
 5 files changed, 25 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 3e84ef8f5b311..cf74ebcd46d95 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -561,7 +561,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_VTR_EL2			sys_reg(3, 4, 12, 11, 1)
 #define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
@@ -1030,18 +1029,6 @@
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
index 6c21be12959d6..0bdecbbe74898 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -283,12 +283,10 @@ void vgic_v3_enable(struct kvm_vcpu *vcpu)
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
@@ -632,7 +630,7 @@ static const struct midr_range broken_seis[] = {
 
 static bool vgic_v3_broken_seis(void)
 {
-	return ((kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_SEIS_MASK) &&
+	return ((kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_SEIS) &&
 		is_midr_in_range_list(read_cpuid_id(), broken_seis));
 }
 
@@ -706,10 +704,10 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
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
index 9938926421b5c..f5927d345eea3 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2960,6 +2960,20 @@ Field	1	UIE
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
index d314ccab7560a..f43e303d31d25 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -420,7 +420,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_VTR_EL2			sys_reg(3, 4, 12, 11, 1)
 #define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
 #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
@@ -673,18 +672,6 @@
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


