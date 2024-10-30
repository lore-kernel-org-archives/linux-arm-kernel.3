Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B18D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zn2848PFWVFgNTO4V1r5Y+eZBa7c3R1bG4mdEm/V6c=; b=3Ia9DEwQKcrV3P6GmJjAAS402x
	4aRaLnJmT5XK1MM3Y4frx9sMEOGMlS/Q0gsd5H7tW80wLjMGR8wMGEGd7vQGCM449f3YNK5jgr1Q7
	R3+c0yqLnTfl5ykv+tFMgvJlBhxvv4FUpJxizPrTXWv12ahZrpKubZupVuYMo6hDfvNcBQoHgjWTh
	SjGwH+ZWpgboH6pQPH81mgjOx7njnSiMDYC//pbZnA++oakLJzMdEPNfmKiqjyYQS2WGqm9QysFc2
	fz3z6EfN2g/Ivj+4Sp+2IutUAojdXVGAsN38oKbCvFKhNrcAKEHKN2CbVaT4i9A6VLuw18jbIr5tl
	DbvTFF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BFt-000000011aw-32vr;
	Wed, 30 Oct 2024 16:09:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAZ-0000000106J-45it
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBCFA11FB;
	Wed, 30 Oct 2024 09:04:08 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 312A83F528;
	Wed, 30 Oct 2024 09:03:37 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 6/7] KVM: arm64: Disable MPAM visibility by default and ignore VMM writes
Date: Wed, 30 Oct 2024 16:03:16 +0000
Message-Id: <20241030160317.2528209-7-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090340_129633_D50343D7 
X-CRM114-Status: GOOD (  17.94  )
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

From: James Morse <james.morse@arm.com>

commit 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits in
ID_AA64PFR0 register") exposed the MPAM field of AA64PFR0_EL1 to guests,
but didn't add trap handling. A previous patch supplied the missing trap
handling.

Existing VMs that have the MPAM field of ID_AA64PFR0_EL1 set need to
be migratable, but there is little point enabling the MPAM CPU
interface on new VMs until there is something a guest can do with it.

Clear the MPAM field from the guest's ID_AA64PFR0_EL1 and on hardware
that supports MPAM, politely ignore the VMMs attempts to set this bit.

Guests exposed to this bug have the sanitised value of the MPAM field,
so only the correct value needs to be ignored. This means the field
can continue to be used to block migration to incompatible hardware
(between MPAM=1 and MPAM=5), and the VMM can't rely on the field
being ignored.

Signed-off-by: James Morse <james.morse@arm.com>
Co-developed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/kvm/sys_regs.c | 45 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 86ce783a54a6..7dc4a5ce5292 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1544,6 +1544,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_DF2);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_PFAR);
+		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);
 		break;
 	case SYS_ID_AA64PFR2_EL1:
 		/* We only expose FPMR */
@@ -1730,6 +1731,13 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 
 	val &= ~ID_AA64PFR0_EL1_AMU_MASK;
 
+	/*
+	 * MPAM is disabled by default as KVM also needs a set of PARTID to
+	 * program the MPAMVPMx_EL2 PARTID remapping registers with. But some
+	 * older kernels let the guest see the ID bit.
+	 */
+	val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
+
 	return val;
 }
 
@@ -1838,9 +1846,39 @@ static int set_id_dfr0_el1(struct kvm_vcpu *vcpu,
 }
 
 static int set_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
-			       const struct sys_reg_desc *rd, u64 val)
+			       const struct sys_reg_desc *rd, u64 user_val)
 {
-	return set_id_reg(vcpu, rd, val);
+	u64 hw_val = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+	u64 mpam_mask = ID_AA64PFR0_EL1_MPAM_MASK;
+
+	/*
+	 * Commit 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits
+	 * in ID_AA64PFR0 register") exposed the MPAM field of AA64PFR0_EL1 to
+	 * guests, but didn't add trap handling. KVM doesn't support MPAM and
+	 * always returns an UNDEF for these registers. The guest must see 0
+	 * for this field.
+	 *
+	 * But KVM must also accept values from user-space that were provided
+	 * by KVM. On CPUs that support MPAM, permit user-space to write
+	 * the sanitizied value to ID_AA64PFR0_EL1.MPAM, but ignore this field.
+	 */
+	if ((hw_val & mpam_mask) == (user_val & mpam_mask))
+		user_val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
+
+	return set_id_reg(vcpu, rd, user_val);
+}
+
+static int set_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
+			       const struct sys_reg_desc *rd, u64 user_val)
+{
+	u64 hw_val = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
+	u64 mpam_mask = ID_AA64PFR1_EL1_MPAM_frac_MASK;
+
+	/* See set_id_aa64pfr0_el1 for comment about MPAM */
+	if ((hw_val & mpam_mask) == (user_val & mpam_mask))
+		user_val &= ~ID_AA64PFR1_EL1_MPAM_frac_MASK;
+
+	return set_id_reg(vcpu, rd, user_val);
 }
 
 /*
@@ -2399,7 +2437,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		      ID_AA64PFR0_EL1_RAS |
 		      ID_AA64PFR0_EL1_AdvSIMD |
 		      ID_AA64PFR0_EL1_FP)),
-	ID_WRITABLE(ID_AA64PFR1_EL1, ~(ID_AA64PFR1_EL1_PFAR |
+	ID_FILTERED(ID_AA64PFR1_EL1, id_aa64pfr1_el1,
+				     ~(ID_AA64PFR1_EL1_PFAR |
 				       ID_AA64PFR1_EL1_DF2 |
 				       ID_AA64PFR1_EL1_MTEX |
 				       ID_AA64PFR1_EL1_THE |
-- 
2.25.1


