Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B328BC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lniNaSo1hUoB3R0uLY0fE5jF1IOAjXaMQncZzAQRLI=; b=BFfvCUZn16CsQfCXOE18GuGbwG
	vXsgF2gxqYZ30KWxbydCa9VTW8SUAFx+qR5iL4+2hEGJ5o8U0Tqjkp/UkQxYb3y2H41h54FrBEPH3
	g6SJWZl/kTqIMsmIm6tp89baC7gqzqJQQaNtrnLAkngtjeF3v7rGBxJyp3r7Icx8YcrjfQka10Asc
	Ol4Npw9HBoHQ0HXB7o6kn9GuT52gf25NQgFGFk5dm68ETuD9smpnV0QBtrU+j/yduwRsFX3CaNU8a
	6pGCjozsvAcWDGEmRhPpTXBO/1QnP0/EuybxZIayiDSJUutyl3T0j88+JNyiGQC7U2L62afOR3Njt
	5E4dJaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655O-00000003LYS-1qPc;
	Mon, 14 Sep 2026 11:42:58 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6552-00000003LG9-0aR2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:41 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjsE084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:55 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=6lniNaSo1hUoB3R0uLY0fE5jF1IOAjXaMQncZzAQRLI=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386115; v=1;
        b=MqZjC3Q631qgf/D/9saoaop9848yJFFlTUCVHWBOLPo7ufsEDgJ6Zl2a4Dx69uBO
         kx0zDaZ0HpT7ZXyxUGvrl/OjdF8z/MigpX7pgMsqam8jPv+nwtpzOveFHW4lHeC+
         g8jYVyc/TBV5kJ2aMBkTauEOCxu0sft9MtWM1jUeyDwjKO5CX5Diu5yS7ll0dAHb
         2HbLl6mEJWCoNkVzerQp6b6S/7cj7W16sktrOhc/osoP/D+e2sn70o7c3eMm91e2
         74OQ1HMcsnhi/z3yiARU0qnWZZj3hrvUruavx25cCe8PvyK0tfHbE9RPg/w2/9WS
         DLIy5T8c8FchsSxwLJC0Ag==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:51 +0900
Subject: [PATCH v10 12/20] KVM: arm64: selftests: Cover PMU state in
 MDCR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-12-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5050;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=Tfgm9WXcmRxelzdJdDKljVp7Ced7YFV3TbgyJMrdSII=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu0WrlkQy797y2fZu7CkTbVnO9ks34wInvSgWvPkgq
 Xht5PbCjlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgInw2TIyHNY815t6MXHTtJtL
 l9psvGup/1+UJ6r7+7Xf3wIqD7X8OszI8Hr/yjDG0DXzl/8RM8wpOX3Q4sKtLua/72ZujT7qFDg
 nmBUA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044236_713485_CA510AA6 
X-CRM114-Status: GOOD (  15.97  )
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

Add MDCR_EL2 coverage to vpmu_counter_access when EL2 is available.

For each configured PMCR_EL0.N value, verify that an arbitrary HPMN
value, including one above the configured counter count, round-trips
through KVM_SET_ONE_REG and survives SET_NR_COUNTERS. Also verify that
HPME can be toggled without disturbing HPMN and that KVM_ARM_VCPU_INIT
resets HPMN from the configured count.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 90 ++++++++++++++++++++--
 1 file changed, 85 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 05135bcdb462..73b4f1870d3d 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -25,6 +25,14 @@
 /* The cycle counter bit position that's common among the PMU registers */
 #define ARMV8_PMU_CYCLE_IDX		31
 
+#ifndef MDCR_EL2_HPMN
+#define MDCR_EL2_HPMN			GENMASK_ULL(4, 0)
+#endif
+
+#ifndef MDCR_EL2_HPME
+#define MDCR_EL2_HPME			BIT_ULL(7)
+#endif
+
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
@@ -465,15 +473,12 @@ static void guest_code_done(void)
 	GUEST_DONE();
 }
 
-static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
+static void set_nr_counters(struct kvm_vcpu *vcpu,
+			    unsigned int nr_counters, bool expect_fail)
 {
-	struct kvm_vcpu *vcpu;
 	unsigned int prev;
 	int ret;
 
-	create_vpmu_vm(guest_code);
-	vcpu = vpmu_vm.vcpu;
-
 	prev = get_pmcr_n(vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0)));
 
 	ret = __vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
@@ -485,6 +490,17 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool
 			    nr_counters, prev);
 	else
 		TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+}
+
+static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
+						 bool expect_fail)
+{
+	struct kvm_vcpu *vcpu;
+
+	create_vpmu_vm(guest_code);
+	vcpu = vpmu_vm.vcpu;
+
+	set_nr_counters(vcpu, nr_counters, expect_fail);
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
 }
@@ -589,6 +605,69 @@ static void run_pmregs_validity_test(u64 pmcr_n)
 	destroy_vpmu_vm();
 }
 
+static void run_mdcr_el2_validity_test(u64 pmcr_n)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	u64 expected_mdcr, mdcr;
+
+	pr_debug("MDCR_EL2 test with pmcr_n %lu\n", pmcr_n);
+
+	create_vpmu_vm(guest_code);
+	if (!vm_supports_el2(vpmu_vm.vm)) {
+		destroy_vpmu_vm();
+		return;
+	}
+
+	vcpu = vpmu_vm.vcpu;
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	expected_mdcr = u64_replace_bits(mdcr, FIELD_MAX(MDCR_EL2_HPMN),
+					 MDCR_EL2_HPMN);
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+		     expected_mdcr);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 was not properly updated after HPMN write (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	set_nr_counters(vcpu, pmcr_n, false);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 changed after PMU_V3_SET_NR_COUNTERS (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 changed after PMU_V3_INIT (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	expected_mdcr = mdcr ^ MDCR_EL2_HPME;
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+		     expected_mdcr);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 was not properly updated after HPME write (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	kvm_get_default_vcpu_target(vpmu_vm.vm, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	aarch64_vcpu_setup(vcpu, &init);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(FIELD_GET(MDCR_EL2_HPMN, mdcr) == pmcr_n,
+		    "MDCR_EL2.HPMN is not reset after INIT (expected %lu, got %lu)",
+		    pmcr_n, FIELD_GET(MDCR_EL2_HPMN, mdcr));
+
+	destroy_vpmu_vm();
+}
+
 /*
  * Create a guest with one vCPU, and attempt to set the PMCR_EL0.N for
  * the vCPU to @pmcr_n, which is larger than the host value.
@@ -673,6 +752,7 @@ int main(void)
 	for (i = 0; i <= pmcr_n; i++) {
 		run_access_test(i);
 		run_pmregs_validity_test(i);
+		run_mdcr_el2_validity_test(i);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)

-- 
2.55.0


