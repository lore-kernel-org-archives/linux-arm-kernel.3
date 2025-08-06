Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6388C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNChbfwbJxu1p5jME8+k/YzZo2FzwjCcltFsF+wNolE=; b=LeOHjWRKGOCsOOkmr66hbvZdRq
	YMCjBGucJcyMSvlaCnvQozoF+pt3Jzur5L9lXWz+ePgfp2iIMQqAUl757lwvLjDTIJ+TcS9ScI8Q0
	Li7by8NbvjgNnMnyWs4IamGmExbb55TmKlJAeuhy1mvDe0gLK4IAFa4yrGGxnbAmQJVbRlTlgrF1Q
	jxcQuyO4QBnewodiqc8B6fz/nWYDknLqfAgA2f444zbYoR0VLWcc9RBC4e6RtrMMNiF/VvuGx1oi0
	+BWMocu3StKGODOumqEs7EmxV6uvyCBIJzWr7iYjABm0NqRb0Fh9HlfmWhuM9QJWx5jhA65dOx5of
	OkoMV6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaJR-0000000Ekbg-1d3r;
	Wed, 06 Aug 2025 09:19:57 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaAm-0000000Ej9d-3I6Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:11:02 +0000
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5769A4Q5005818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 6 Aug 2025 18:10:13 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=cNChbfwbJxu1p5jME8+k/YzZo2FzwjCcltFsF+wNolE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Date:Subject:Message-Id:To;
        s=rs20250326; t=1754471413; v=1;
        b=ILovQubZMvdmX4JupMk0+o5hS9d1oHFD/LOTYDhCE9Rx1fIWftCeY+n5oeAPTDYg
         Eqe74MSJsTncKg9JzaZL0QyvCPj7JSZZa2UiLlIl7jlL+uOSgFkVy7uXaPfZ6M3c
         J8x/BLWE36onnKZWuL9r/H/RR9Dlkpvari6SP8pmN2kV8Fi69UNiMRWWonyQl6sX
         /nwbnxU4dYSURcWsDjE6AYKC+eQuZ3eCWXfVca8QcDRuDzZOVw2FT0+AIeVweHoI
         CiWev08DGiq7qgq+19v+7R3R0zABjK5m6+pOau/HIL1Odsj8SwCTXfxoddYAILOO
         zs6v7mRu1+ZJs3BowaDHYA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 06 Aug 2025 18:09:55 +0900
Subject: [PATCH RFC v2 2/2] KVM: arm64: selftests: Test guest PMUv3
 composition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-hybrid-v2-2-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
References: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_021101_057168_E9819821 
X-CRM114-Status: GOOD (  19.39  )
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

Test the following:
- KVM_ARM_VCPU_PMU_V3_COMPOSITION is unset at initialization.
- KVM_ARM_VCPU_PMU_V3_COMPOSITION can be set.
- Setting KVM_ARM_VCPU_PMU_V3_COMPOSITION for the first after setting
  an event filter results in EBUSY.
- KVM_ARM_VCPU_PMU_V3_COMPOSITION can be set again even if an event
  filter has already been set.
- Setting KVM_ARM_VCPU_PMU_V3_COMPOSITION after running a VCPU results
  in EBUSY.
- The composite guest PMUv3 behaves as a PMUv3 whose PMCR.N is 0.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 148 ++++++++++++++++-----
 1 file changed, 118 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32ed7ca57481f27d689d47783aa0345..8d91d8017aea6a190be4a11e5abedb3324d93989 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -409,16 +409,7 @@ static void create_vpmu_vm(void *guest_code)
 {
 	struct kvm_vcpu_init init;
 	uint8_t pmuver, ec;
-	uint64_t dfr0, irq = 23;
-	struct kvm_device_attr irq_attr = {
-		.group = KVM_ARM_VCPU_PMU_V3_CTRL,
-		.attr = KVM_ARM_VCPU_PMU_V3_IRQ,
-		.addr = (uint64_t)&irq,
-	};
-	struct kvm_device_attr init_attr = {
-		.group = KVM_ARM_VCPU_PMU_V3_CTRL,
-		.attr = KVM_ARM_VCPU_PMU_V3_INIT,
-	};
+	uint64_t dfr0;
 
 	/* The test creates the vpmu_vm multiple times. Ensure a clean state */
 	memset(&vpmu_vm, 0, sizeof(vpmu_vm));
@@ -445,10 +436,6 @@ static void create_vpmu_vm(void *guest_code)
 	TEST_ASSERT(pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF &&
 		    pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP,
 		    "Unexpected PMUVER (0x%x) on the vCPU with PMUv3", pmuver);
-
-	/* Initialize vPMU */
-	vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &irq_attr);
-	vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &init_attr);
 }
 
 static void destroy_vpmu_vm(void)
@@ -475,14 +462,26 @@ static void run_vcpu(struct kvm_vcpu *vcpu, uint64_t pmcr_n)
 	}
 }
 
-static void test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
+static void test_init_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool composition,
+					  bool expect_fail)
 {
 	struct kvm_vcpu *vcpu;
 	uint64_t pmcr, pmcr_orig;
+	uint64_t irq = 23;
 
 	create_vpmu_vm(guest_code);
 	vcpu = vpmu_vm.vcpu;
 
+	if (composition)
+		vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
+
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+
 	pmcr_orig = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
 	pmcr = pmcr_orig;
 
@@ -508,15 +507,15 @@ static void test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
  * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
  * and run the test.
  */
-static void run_access_test(uint64_t pmcr_n)
+static void run_access_test(uint64_t pmcr_n, bool composition)
 {
 	uint64_t sp;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vcpu_init init;
 
-	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
+	pr_debug("Test with pmcr_n %lu, composition %d\n", pmcr_n, composition);
 
-	test_create_vpmu_vm_with_pmcr_n(pmcr_n, false);
+	test_init_vpmu_vm_with_pmcr_n(pmcr_n, composition, false);
 	vcpu = vpmu_vm.vcpu;
 
 	/* Save the initial sp to restore them later to run the guest again */
@@ -550,14 +549,14 @@ static struct pmreg_sets validity_check_reg_sets[] = {
  * Create a VM, and check if KVM handles the userspace accesses of
  * the PMU register sets in @validity_check_reg_sets[] correctly.
  */
-static void run_pmregs_validity_test(uint64_t pmcr_n)
+static void run_pmregs_validity_test(uint64_t pmcr_n, bool composition)
 {
 	int i;
 	struct kvm_vcpu *vcpu;
 	uint64_t set_reg_id, clr_reg_id, reg_val;
 	uint64_t valid_counters_mask, max_counters_mask;
 
-	test_create_vpmu_vm_with_pmcr_n(pmcr_n, false);
+	test_init_vpmu_vm_with_pmcr_n(pmcr_n, composition, false);
 	vcpu = vpmu_vm.vcpu;
 
 	valid_counters_mask = get_counters_mask(pmcr_n);
@@ -607,11 +606,11 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  * the vCPU to @pmcr_n, which is larger than the host value.
  * The attempt should fail as @pmcr_n is too big to set for the vCPU.
  */
-static void run_error_test(uint64_t pmcr_n)
+static void run_error_test(uint64_t pmcr_n, bool composition)
 {
 	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
 
-	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
+	test_init_vpmu_vm_with_pmcr_n(pmcr_n, composition, true);
 	destroy_vpmu_vm();
 }
 
@@ -629,20 +628,109 @@ static uint64_t get_pmcr_n_limit(void)
 	return get_pmcr_n(pmcr);
 }
 
-int main(void)
+static void test_config(uint64_t pmcr_n, bool composition)
 {
-	uint64_t i, pmcr_n;
-
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+	uint64_t i;
 
-	pmcr_n = get_pmcr_n_limit();
 	for (i = 0; i <= pmcr_n; i++) {
-		run_access_test(i);
-		run_pmregs_validity_test(i);
+		run_access_test(i, composition);
+		run_pmregs_validity_test(i, composition);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
-		run_error_test(i);
+		run_error_test(i, composition);
+}
+
+static void test_composition(void)
+{
+	struct kvm_pmu_event_filter filter = { .nevents = 0 };
+	struct kvm_vm *vm;
+	struct kvm_vcpu *running_vcpu;
+	struct kvm_vcpu *stopped_vcpu;
+	struct kvm_vcpu_init init;
+	int ret;
+
+	create_vpmu_vm(guest_code);
+	ret = __vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_COMPOSITION);
+	if (ret) {
+		TEST_ASSERT(ret == -1 && errno == ENXIO,
+			    KVM_IOCTL_ERROR(KVM_GET_DEVICE_ATTR, ret));
+		destroy_vpmu_vm();
+		return;
+	}
+
+	/* Assert that composition is unset at initialization. */
+	ret = __vcpu_device_attr_get(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+	TEST_ASSERT(ret == -1 && errno == ENXIO,
+		    KVM_IOCTL_ERROR(KVM_GET_DEVICE_ATTR, ret));
+
+	/* Assert that setting composition succeeds. */
+	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+
+	/* Assert that getting composition succeeds. */
+	vcpu_device_attr_get(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+
+	/*
+	 * Assert that setting composition again succeeds even if an event
+	 * filter has already been set.
+	 */
+	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_FILTER, &filter);
+
+	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+
+	destroy_vpmu_vm();
+
+	create_vpmu_vm(guest_code);
+
+	/*
+	 * Assert that setting composition results in EBUSY if an event filter
+	 * has already been set while composition has not.
+	 */
+	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_FILTER, &filter);
+
+	ret = __vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+	TEST_ASSERT(ret == -1 && errno == EBUSY,
+		    KVM_IOCTL_ERROR(KVM_GET_DEVICE_ATTR, ret));
+
+	destroy_vpmu_vm();
+
+	/*
+	 * Assert that setting composition after running a VCPU results in
+	 * EBUSY.
+	 */
+	vm = vm_create(2);
+	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code);
+	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	vcpu_run(running_vcpu);
+
+	ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_COMPOSITION, NULL);
+	TEST_ASSERT(ret == -1 && errno == EBUSY,
+		    KVM_IOCTL_ERROR(KVM_GET_DEVICE_ATTR, ret));
+
+	kvm_vm_free(vm);
+
+	test_config(0, true);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+
+	test_config(get_pmcr_n_limit(), false);
+	test_composition();
 
 	return 0;
 }

-- 
2.50.1


