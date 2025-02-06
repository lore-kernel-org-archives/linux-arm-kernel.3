Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C621C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlMIJqQF4z3BBJ73lUfyXi6ssyZWkajHGv/LvBu697U=; b=imVjaL5Cg8YcavozYJ67VFvSop
	u/cYk1sfC+qq1VJWj8ELbxtz9iqKIlYjRz9U0vS2HY1qRbid2USDmJI4EwQ7dyrkESrlDsu97PDqx
	NBa25ic5nxuo1A8NAPXW0t9Mky7/JjD4OVGNLCNI1v/zpln0/zaUAIapbbqmKo9BumBwy/MzCUqXE
	r1h/xA5HrqWOB3HblOP0XqcAoe9QIBh2KuM43ID2hXaimt1KRz9d2LJ5oTO4idBBJ0E3VLw/Cuwoq
	PDjkUGLebhBgN0mHQxEWz75rrpskBFEvRbWygfsB5Vv8YVx5DxnC1D/6A839NCZwnZeQdv3hQO/Fw
	2920PIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg49l-00000006lOE-01cD;
	Thu, 06 Feb 2025 15:51:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg48M-00000006kvv-1jLf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 082B45C5F88;
	Thu,  6 Feb 2025 15:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58277C4CEE2;
	Thu,  6 Feb 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856981;
	bh=KqTJJJlKyqMVc2PH2Cuiz0NayHv0pDB4bXBKnTulMnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKHgdf14Ipisv38fommf66EG/+DN6ljWknxx5BLnOOE6SYiMYbephsoHP1IueeL6c
	 jLvD4c5n2NYuweMY8ahN78JFtNGSJSRaUFIDZFXp7HvoEI5ASBxok24Hf2RYRYPkbY
	 UqaaG6raUw9vG0gq5t/QxJ87NZFh22A1nGKeL5z0RV53ZBBbxV8Chuu0nClOSch4Ly
	 cdUilwBkOg/WEGmm/1Mk5Q2KrEH38S5hwnxAu584iEPiWcOZAQvkcWpx4rdKi4AJe0
	 4kxLFTw3v01IxSLseRMmdmygEacGMvozf0xH+YeytFSom5TCZl/bD+NKtf42t7ewSR
	 Nyvaz7MEimV0Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg48J-001BOX-C8;
	Thu, 06 Feb 2025 15:49:39 +0000
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
Subject: [PATCH v3 02/16] arm64: sysreg: Add layout for ICH_VTR_EL2
Date: Thu,  6 Feb 2025 15:49:11 +0000
Message-Id: <20250206154925.1109065-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206154925.1109065-1-maz@kernel.org>
References: <20250206154925.1109065-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_074942_533400_E60CE960 
X-CRM114-Status: GOOD (  15.49  )
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


