Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1D2C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtZpVD+c3rEb0z9kPtnuF7Xmt0s3q4Ts6qjSmqh3PZU=; b=H8F9VxfNC7Qfma2+yKqYDjgwwA
	3nGKfFqNS+k+J+ByM2/kaCq3Zv+Uzq14e03bne7KCq/y1+lP8DTrk03RI9QKOBmXJG7nTx1T+vszD
	HehoQXSDkftmjKrSOA3wmyCV/arQYndrkuua5N0tncBPRtb8plSO0dT/TeM4gOZ/f7N+ibT2nf7b/
	MNHrDDbYGMC9xIAdnJjfiaQ2uGp8AQvDB3orjs4I0cwf8W6VRvqVNF0yXNvF834tR1Dl9y+nVWfG1
	b65XESIul2REG/zHmhZC9410uYXCPIBOfLTiNHKHANsv1O9d5JNBIEywqN1wP5Kni03epqjzRKhgH
	0Z/Du6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FcQ-0000000HLq0-0aP3;
	Sun, 20 Sep 2026 11:22:02 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FcO-0000000HLpE-1SgZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:22:01 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36i088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:18 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=TtZpVD+c3rEb0z9kPtnuF7Xmt0s3q4Ts6qjSmqh3PZU=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902978; v=1;
        b=knbWzXqg8NGeKxxhNW04XuYdUmIIlyxOVRVcxJSJvJ9rPqczPdFOHatE3ABD5YFh
         cosIOiiP3gvshNhdlb4jY5Qm6kEbit1xoU616ejx8GZrR4RlQPPcaCqvJazYdFUx
         tlabv8FYQZhC2JcUYnaJzy+Tfq+HY2yLaPgnFhKSEUEhO5OOL8g+gd4sDnqFCoos
         mJzlwIX3BgiLB3lSthVIVbEWs73/92JGukf7Q38yBHldW2BQ7wsU1jhTsxHPRyAV
         OQ0uY9VoHuFufi0fl/x6gxYwe9lgugbAznnJ3ZIlfeyBzxuEkWLqiahdM2zw/7vt
         O/hy7puc/Ge+CirW1Z694g==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:16:02 +0900
Subject: [PATCH v11 21/21] KVM: arm64: selftests: Test
 PMU_V3_FIXED_COUNTERS_ONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-21-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11665;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=z4iUiM9bC55rfw6jduOct1366YhypIYol3KPCgIE8E8=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A8VvJ3Qf+/Dv8eKyjJOhy///YDpYOX+l8BO51bM2P
 /vzPn6+XkcpC4MYF4OsmCJLStFubo3o2k+FCfEtMHNYmUCGMHBxCsBEZm1iZPijnHTtUdfBDQFp
 D6qd0zlfRjZNS6pJYIvXXHw2eFJa+yaG/1HvK5isJxUJVDypvCfvP8k+02lJoVLr7QkcIqJG02T
 O8QMA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_042200_644869_5151663F 
X-CRM114-Status: GOOD (  21.38  )
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

Assert the following:
- FIXED_COUNTERS_ONLY is unset at initialization.
- FIXED_COUNTERS_ONLY can be set.
- Setting an event filter when FIXED_COUNTERS_ONLY has already been set
  results in EBUSY.
- Setting FIXED_COUNTERS_ONLY when an event filter has already been set
  results in EBUSY.
- Setting FIXED_COUNTERS_ONLY when a VCPU has already run results in
  EBUSY.

Also verify that strict PMUv3 initialization requires a PMU selection
and succeeds after selecting fixed-counters-only mode.

Run the existing PMU and MDCR_EL2 tests in fixed-only mode. Verify that
enabling the mode preserves the userspace MDCR_EL2 value until a
subsequent KVM_ARM_VCPU_INIT resets HPMN to zero.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 202 ++++++++++++++++++---
 1 file changed, 173 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 73b4f1870d3d..637653f7a25b 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -411,12 +411,7 @@ static void create_vpmu_vm(void *guest_code)
 {
 	struct kvm_vcpu_init init;
 	u8 pmuver, ec;
-	u64 dfr0, irq = 23;
-	struct kvm_device_attr irq_attr = {
-		.group = KVM_ARM_VCPU_PMU_V3_CTRL,
-		.attr = KVM_ARM_VCPU_PMU_V3_IRQ,
-		.addr = (u64)&irq,
-	};
+	u64 dfr0;
 
 	/* The test creates the vpmu_vm multiple times. Ensure a clean state */
 	memset(&vpmu_vm, 0, sizeof(vpmu_vm));
@@ -442,8 +437,6 @@ static void create_vpmu_vm(void *guest_code)
 	TEST_ASSERT(pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF &&
 		    pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP,
 		    "Unexpected PMUVER (0x%x) on the vCPU with PMUv3", pmuver);
-
-	vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &irq_attr);
 }
 
 static void destroy_vpmu_vm(void)
@@ -493,13 +486,22 @@ static void set_nr_counters(struct kvm_vcpu *vcpu,
 }
 
 static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
+						 bool fixed_counters_only,
 						 bool expect_fail)
 {
 	struct kvm_vcpu *vcpu;
+	u64 irq = 23;
 
 	create_vpmu_vm(guest_code);
 	vcpu = vpmu_vm.vcpu;
 
+	if (fixed_counters_only)
+		vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
+
 	set_nr_counters(vcpu, nr_counters, expect_fail);
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
@@ -509,15 +511,15 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
  * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
  * and run the test.
  */
-static void run_access_test(u64 pmcr_n)
+static void run_access_test(u64 pmcr_n, bool fixed_counters_only)
 {
 	u64 sp;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vcpu_init init;
 
-	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
+	pr_debug("Test with pmcr_n %lu, fixed_counters_only %d\n", pmcr_n, fixed_counters_only);
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, fixed_counters_only, false);
 	vcpu = vpmu_vm.vcpu;
 
 	/* Save the initial sp to restore them later to run the guest again */
@@ -553,14 +555,14 @@ static struct pmreg_sets validity_check_reg_sets[] = {
  * Create a VM, and check if KVM handles the userspace accesses of
  * the PMU register sets in @validity_check_reg_sets[] correctly.
  */
-static void run_pmregs_validity_test(u64 pmcr_n)
+static void run_pmregs_validity_test(u64 pmcr_n, bool fixed_counters_only)
 {
 	int i;
 	struct kvm_vcpu *vcpu;
 	u64 set_reg_id, clr_reg_id, reg_val;
 	u64 valid_counters_mask, max_counters_mask;
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, fixed_counters_only, false);
 	vcpu = vpmu_vm.vcpu;
 
 	valid_counters_mask = get_counters_mask(pmcr_n);
@@ -605,13 +607,15 @@ static void run_pmregs_validity_test(u64 pmcr_n)
 	destroy_vpmu_vm();
 }
 
-static void run_mdcr_el2_validity_test(u64 pmcr_n)
+static void run_mdcr_el2_validity_test(u64 pmcr_n, bool fixed_counters_only)
 {
 	struct kvm_vcpu_init init;
 	struct kvm_vcpu *vcpu;
 	u64 expected_mdcr, mdcr;
+	u64 irq = 23;
 
-	pr_debug("MDCR_EL2 test with pmcr_n %lu\n", pmcr_n);
+	pr_debug("MDCR_EL2 test with pmcr_n %lu, fixed_counters_only %d\n",
+		 pmcr_n, fixed_counters_only);
 
 	create_vpmu_vm(guest_code);
 	if (!vm_supports_el2(vpmu_vm.vm)) {
@@ -632,6 +636,16 @@ static void run_mdcr_el2_validity_test(u64 pmcr_n)
 		    "MDCR_EL2 was not properly updated after HPMN write (expected 0x%lx, got 0x%lx)",
 		    expected_mdcr, mdcr);
 
+	if (fixed_counters_only) {
+		vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+
+		mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+		TEST_ASSERT(mdcr == expected_mdcr,
+			    "MDCR_EL2 changed after PMU_V3_FIXED_COUNTERS_ONLY (expected 0x%lx, got 0x%lx)",
+			    expected_mdcr, mdcr);
+	}
+
 	set_nr_counters(vcpu, pmcr_n, false);
 
 	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
@@ -639,6 +653,9 @@ static void run_mdcr_el2_validity_test(u64 pmcr_n)
 		    "MDCR_EL2 changed after PMU_V3_SET_NR_COUNTERS (expected 0x%lx, got 0x%lx)",
 		    expected_mdcr, mdcr);
 
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
+
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
 			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
 
@@ -673,11 +690,11 @@ static void run_mdcr_el2_validity_test(u64 pmcr_n)
  * the vCPU to @pmcr_n, which is larger than the host value.
  * The attempt should fail as @pmcr_n is too big to set for the vCPU.
  */
-static void run_error_test(u64 pmcr_n)
+static void run_error_test(u64 pmcr_n, bool fixed_counters_only)
 {
 	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, true);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, fixed_counters_only, true);
 	destroy_vpmu_vm();
 }
 
@@ -738,25 +755,152 @@ static void test_set_nr_counters_after_vcpu_run(void)
 	kvm_vm_free(vm);
 }
 
-int main(void)
+static void test_config(u64 pmcr_n, bool fixed_counters_only)
+{
+	u64 i;
+
+	for (i = 0; i <= pmcr_n; i++) {
+		run_access_test(i, fixed_counters_only);
+		run_pmregs_validity_test(i, fixed_counters_only);
+		run_mdcr_el2_validity_test(i, fixed_counters_only);
+	}
+
+	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
+		run_error_test(i, fixed_counters_only);
+}
+
+static void test_fixed_counters_only_strict(void)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u64 irq = 23;
+	int ret;
+
+	if (!kvm_has_cap(KVM_CAP_ARM_PMU_V3_STRICT))
+		return;
+
+	vm = vm_create(1);
+	kvm_get_default_vcpu_target(vm, &init);
+	init.features[0] |= BIT(KVM_ARM_VCPU_PMU_V3) |
+			    BIT(KVM_ARM_VCPU_PMU_V3_STRICT);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code_done);
+	kvm_arch_vm_finalize_vcpus(vm);
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
+
+	/* STRICT still requires a PMU selection before initialization. */
+	ret = __vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	TEST_ASSERT(ret == -1 && errno == ENXIO,
+		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+
+	kvm_vm_free(vm);
+}
+
+static void test_fixed_counters_only(void)
 {
-	u64 i, pmcr_n;
+	struct kvm_pmu_event_filter filter = { .nevents = 0 };
+	struct kvm_vm *vm;
+	struct kvm_vcpu *running_vcpu;
+	struct kvm_vcpu *stopped_vcpu;
+	struct kvm_vcpu_init init;
+	int ret;
+	u64 irq = 23;
+
+	create_vpmu_vm(guest_code);
+	ret = __vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY);
+	if (ret) {
+		TEST_ASSERT(ret == -1 && errno == ENXIO,
+			    KVM_IOCTL_ERROR(KVM_HAS_DEVICE_ATTR, ret));
+		destroy_vpmu_vm();
+		return;
+	}
+
+	/* Assert that FIXED_COUNTERS_ONLY is unset at initialization. */
+	ret = __vcpu_device_attr_get(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+	TEST_ASSERT(ret == -1 && errno == ENXIO,
+		    KVM_IOCTL_ERROR(KVM_GET_DEVICE_ATTR, ret));
+
+	/* Assert that setting FIXED_COUNTERS_ONLY succeeds. */
+	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+
+	/* Assert that FIXED_COUNTERS_ONLY is set. */
+	vcpu_device_attr_get(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+
+	/*
+	 * Setting an event filter when FIXED_COUNTERS_ONLY has already been set
+	 * results in EBUSY.
+	 */
+	ret = __vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FILTER, &filter);
+	TEST_ASSERT(ret == -1 && errno == EBUSY,
+		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+
+	destroy_vpmu_vm();
+
+	create_vpmu_vm(guest_code);
+
+	/*
+	 * Assert that setting FIXED_COUNTERS_ONLY when an event filter has
+	 * already been set results in EBUSY.
+	 */
+	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_FILTER, &filter);
+
+	ret = __vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+	TEST_ASSERT(ret == -1 && errno == EBUSY,
+		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+
+	destroy_vpmu_vm();
+
+	/*
+	 * Assert that setting FIXED_COUNTERS_ONLY when a VCPU has already run
+	 * results in EBUSY.
+	 */
+	vm = vm_create(2);
+	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code_done);
+	stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code_done);
+	kvm_arch_vm_finalize_vcpus(vm);
+	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
+	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	run_vcpu(running_vcpu);
+
+	ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
+	TEST_ASSERT(ret == -1 && errno == EBUSY,
+		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+
+	kvm_vm_free(vm);
+
+	test_fixed_counters_only_strict();
 
+	test_config(0, true);
+}
+
+int main(void)
+{
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
 	TEST_REQUIRE(kvm_supports_vgic_v3());
 	TEST_REQUIRE(kvm_supports_nr_counters_attr());
 
 	test_set_nr_counters_after_vcpu_run();
-
-	pmcr_n = get_pmcr_n_limit();
-	for (i = 0; i <= pmcr_n; i++) {
-		run_access_test(i);
-		run_pmregs_validity_test(i);
-		run_mdcr_el2_validity_test(i);
-	}
-
-	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
-		run_error_test(i);
+	test_config(get_pmcr_n_limit(), false);
+	test_fixed_counters_only();
 
 	return 0;
 }

-- 
2.55.0


