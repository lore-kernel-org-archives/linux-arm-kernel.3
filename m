Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EA9C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZn04UeoiDms2sEn2q0eKs+Ld4SHq+fvwl5Lkqnnmx0=; b=zNp9J2NSiEZhqsEyFag2OJPq6J
	XujVh/GKoor9b9s9uVi7Z7M/j/BbMZ2Ry736sRqVAO5iLrTJVLjAyhw8qWJxAgCqQI7xWtaHDoG7U
	wZoZHp1/CaYE6e29p4KN02yxa2r4wGMaVthkb50P5egJMuH8igtPtEWw4XfwiFaX0RLuU53D8aLyw
	MteGP31K766FHJg8eIgC8TncDyyicw/IU+ZtBzxdOD4bsunhy4W0DdiBzFTZhijmUAQArSm1BMNK5
	7wLG2OFgdOAcZW2w2rTVPwlrp3iyiofeEcrBjoUG8UysGCQi2gFO+HvCzYS/jfF9cw4mMVIAjcA9N
	uOFfYL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TLg-0000000661T-1TaV;
	Mon, 07 Sep 2026 07:01:00 +0000
Received: from out-207.mta0.migadu.com ([2001:41d0:1004:224b::cf] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TLZ-000000065wr-3ynB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:00:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=byzrIzXiIto5vqIivIvQsXBpKzK08ekgpobIyjg0Z2w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764451; v=1; x=1789369251;
 b=hOYxwo/g8QE8rVGryq5bPShOg1ua6Rr4sB0uPra1ry0MqY6e0WSSoh+etzatrbIFgwDG6ozq
 sHFO64aNm4/69u1301H5O5v0mhfZdenMiQK47qxjuIMr4+pAotU40Wgcm18XDo/RnwFHG0X6zPi
 kn2yBl2RvSz4jTtwssxd/944=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 24c7a88dbdd550de;
	Mon, 07 Sep 2026 07:00:51 +0000
X-Mizu-Trace-ID: 24c7a88dbdd550de
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 07/17] KVM: arm64: Implement HVC handling for protected guests at EL2
Date: Mon,  7 Sep 2026 07:59:52 +0100
Message-Id: <20260907070002.3333525-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000054_153513_17FFB5B2 
X-CRM114-Status: GOOD (  14.65  )
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

Extend kvm_handle_pvm_hvc64() to handle SMCCC_VERSION,
SMCCC_ARCH_FEATURES and the vendor hypervisor call UID at EL2, so
these queries don't reach the host. ARCH_FEATURES is mandatory from
SMCCC 1.1, the version EL2 reports: it returns SUCCESS for itself and
for SMCCC_VERSION, NOT_SUPPORTED for anything else, and handles the
ARCH_WORKAROUND_1/2/3 queries as the host does, from a copy of the
host's mitigation state taken at init with the sanitised ID registers.
The workaround calls themselves are already handled on hyp entry.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hyp.h |  4 ++
 arch/arm64/kvm/arm.c             |  4 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c   | 70 ++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 4974492744cc8..7609c78c68f34 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -10,6 +10,7 @@
 #include <linux/compiler.h>
 #include <linux/kvm_host.h>
 #include <asm/alternative.h>
+#include <asm/spectre.h>
 #include <asm/sysreg.h>
 
 DECLARE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
@@ -150,6 +151,9 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 
 extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
+extern enum mitigation_state kvm_nvhe_sym(spectre_v2_state);
+extern enum mitigation_state kvm_nvhe_sym(spectre_v4_state);
+extern enum mitigation_state kvm_nvhe_sym(spectre_bhb_state);
 extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
 extern unsigned long kvm_nvhe_sym(hyp_nr_cpus);
 extern unsigned int kvm_nvhe_sym(hyp_gicv3_nr_lr);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90b..dbe2b6c9670a9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2622,6 +2622,10 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(__icache_flags) = __icache_flags;
 	kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
 
+	kvm_nvhe_sym(spectre_v2_state) = arm64_get_spectre_v2_state();
+	kvm_nvhe_sym(spectre_v4_state) = arm64_get_spectre_v4_state();
+	kvm_nvhe_sym(spectre_bhb_state) = arm64_get_spectre_bhb_state();
+
 	/* Propagate the FGT state to the nVHE side */
 	kvm_nvhe_sym(hfgrtr_masks)  = hfgrtr_masks;
 	kvm_nvhe_sym(hfgwtr_masks)  = hfgwtr_masks;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index af334318d0a03..69f13362b7ab0 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -16,6 +16,11 @@
 #include <nvhe/pkvm.h>
 #include <nvhe/trap_handler.h>
 
+/* The host's Spectre mitigation state, for SMCCC_ARCH_FEATURES. */
+enum mitigation_state spectre_v2_state;
+enum mitigation_state spectre_v4_state;
+enum mitigation_state spectre_bhb_state;
+
 /* Used by icache_is_aliasing(). */
 unsigned long __icache_flags;
 
@@ -1144,8 +1149,73 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
 	bool handled = true;
+	u32 feature;
+	uuid_t uuid;
 
 	switch (smccc_get_function(vcpu)) {
+	case ARM_SMCCC_VERSION_FUNC_ID:
+		/* Nothing to be handled by the host. Go back to the guest. */
+		val[0] = ARM_SMCCC_VERSION_1_1;
+		val[1] = 0;
+		val[2] = 0;
+		val[3] = 0;
+		break;
+	case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
+		/* The workaround calls themselves are handled on hyp entry. */
+		val[0] = SMCCC_RET_NOT_SUPPORTED;
+		feature = smccc_get_arg1(vcpu);
+		switch (feature) {
+		case ARM_SMCCC_VERSION_FUNC_ID:
+		case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
+			val[0] = SMCCC_RET_SUCCESS;
+			break;
+		case ARM_SMCCC_ARCH_WORKAROUND_1:
+			switch (spectre_v2_state) {
+			case SPECTRE_VULNERABLE:
+				break;
+			case SPECTRE_MITIGATED:
+				val[0] = SMCCC_RET_SUCCESS;
+				break;
+			case SPECTRE_UNAFFECTED:
+				val[0] = SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED;
+				break;
+			}
+			break;
+		case ARM_SMCCC_ARCH_WORKAROUND_2:
+			switch (spectre_v4_state) {
+			case SPECTRE_VULNERABLE:
+				break;
+			case SPECTRE_MITIGATED:
+				/* With SSBS advertised the guest's default is safe. */
+				if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SSBS, IMP))
+					break;
+				fallthrough;
+			case SPECTRE_UNAFFECTED:
+				val[0] = SMCCC_RET_NOT_REQUIRED;
+				break;
+			}
+			break;
+		case ARM_SMCCC_ARCH_WORKAROUND_3:
+			switch (spectre_bhb_state) {
+			case SPECTRE_VULNERABLE:
+				break;
+			case SPECTRE_MITIGATED:
+				val[0] = SMCCC_RET_SUCCESS;
+				break;
+			case SPECTRE_UNAFFECTED:
+				val[0] = SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED;
+				break;
+			}
+			break;
+		}
+		break;
+	case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
+		uuid = ARM_SMCCC_VENDOR_HYP_UID_KVM;
+		val[0] = smccc_uuid_to_reg(&uuid, 0);
+		val[1] = smccc_uuid_to_reg(&uuid, 1);
+		val[2] = smccc_uuid_to_reg(&uuid, 2);
+		val[3] = smccc_uuid_to_reg(&uuid, 3);
+		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
 		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
-- 
2.39.5


