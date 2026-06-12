Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F92CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoa2MBSo9kga5/tD04xH7yC0HmQp8XOYPJ9Cv6PxsrI=; b=QEYYcc3MJU02Dq5u/K00aIkmW5
	ailYXN+yEDd8fxVP0XIH7XyOrg9jP0ePC8wvz3KZlu+CvystvnIWTAgce3WfD+ME3qEL3xHSfl1Uc
	qSFLEU0KkKrYVLXhdri3goHrulhzAh/qY9ArRdeEvG2qvE3X9bu1Mz2CO2Ix+pvG/FTIvptpGAUOk
	BHvMrbGL75V9R39paVbbJFEAJMWQgORRKovRnc8ugPljxpTZlVoFGiI4ItyzuV11Qk0G/25dsMAZq
	yu6vTBH7De/izFRn7Gl72/JgRJAMS8PRpT+VdUIKFkdnkU/8BR8b0EJIryg3p4/bvbWTUwIe0WblZ
	KUOfTpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Zq-0000000BTVE-05Lk;
	Fri, 12 Jun 2026 19:30:02 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZK-0000000BSXd-1bRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:31 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-48661b2ef8eso1179196b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292569; x=1781897369; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zoa2MBSo9kga5/tD04xH7yC0HmQp8XOYPJ9Cv6PxsrI=;
        b=GSRMTUKFhr7xw0vySIJ+f1dyfntOiFsL7EnAtSBUpK4qo98UuKeKY0yN1VcPDJgatc
         DhhhSjOLwDJr651E+LS7KzWMbRC1hmm7vM8s/SD069+a0B5aS2Rv2utDiDg3vZgDRjYF
         0nE9wfo6Ll2mA5GTXd9FOLp1fZRexszWJsL6IylFQQOAIOHQ/neczc430BzYcigmIoMc
         N07nfFKiA8T+PxXRq6oExYRo4LdcRQwFJeP7zbgW4yQ61NaUv+oTrnUS489xvZ9AC5lE
         LuhBRpoSxM9jvd++NR/FeZZagiUPkbJfoVb98ld0YMYA2UTrrxmr9yF8XHZCKKjoZFSc
         FHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292569; x=1781897369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoa2MBSo9kga5/tD04xH7yC0HmQp8XOYPJ9Cv6PxsrI=;
        b=STeK2COB4xyTA3jX0ulCRwHgUPtyOmLgBrAJdxFTMxFThOCgiFceBMMe97D3d7idwF
         VBMNPJGwSPEuxUjwFaa7n/9DzCWqHSmtv7JiU3qJNHpMvZPzkSm3V5Ze/L2QTwvePD4Q
         CzEVW40srmQ8kdGD8zax1s6QW7JLJwC86SBKPtCNpvBg9V2lyUOSf4zrsu94gXBusg+C
         qfjf+J3zjRHZxgEkNGVweUoeBlt0eRflN07Bf2a+CApBs2nlCsILeZHQvNdxbFcgyHZj
         EfCt4KK/rR5Yl6Upbqggj41d0/oyHG4zTRSQ8GtJCKY5tpEPnIuOC6KU/QSqO0M3/7os
         tF8g==
X-Forwarded-Encrypted: i=1; AFNElJ96nWdHLj/8Qng1FP1jxqF2cN11X6XKVapV8QygCmebMSlHVk0/mVJBRv81fNV3JXh4KHlOOkEVd3whX1Zvivqf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgo9y5IbPRVSAc/tc0nScw8/PX9eF+Neajid0x0FZ82xvEtK3t
	+2axdja53qsLj5UHYm1kN8FqNVM+A8HRgAgXPh4d4qjkZR0zM+ALqNt1OQsd+CO7ekl3lfdErja
	4HmVzab7tsePrYspQ21KcJWlr/w==
X-Received: from iloo16-n2.prod.google.com ([2002:a05:6e02:6110:20b0:500:79fa:9c92])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1707:b0:486:4892:d55c with SMTP id 5614622812f47-4872f3c6289mr2573236b6e.11.1781292568836;
 Fri, 12 Jun 2026 12:29:28 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:08 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-21-coltonlewis@google.com>
Subject: [PATCH 20/21] KVM: arm64: selftests: Add test case for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122930_444664_5E86652D 
X-CRM114-Status: GOOD (  21.61  )
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

Rerun all tests for a Partitioned PMU in vpmu_counter_access.

Create an enum specifying whether we are testing the emulated or
Partitioned PMU and all the test functions are modified to take the
implementation as an argument and make the difference in setup
appropriately.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c | 94 ++++++++++++++-----
 1 file changed, 73 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 22223395969e0..9be6034335283 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -25,9 +25,20 @@
 /* The cycle counter bit position that's common among the PMU registers */
 #define ARMV8_PMU_CYCLE_IDX		31
 
+enum pmu_impl {
+	EMULATED,
+	PARTITIONED
+};
+
+const char *pmu_impl_str[] = {
+	"Emulated",
+	"Partitioned"
+};
+
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
+	bool pmu_partitioned;
 };
 
 static struct vpmu_vm vpmu_vm;
@@ -399,7 +410,7 @@ static void guest_code(u64 expected_pmcr_n)
 }
 
 /* Create a VM that has one vCPU with PMUv3 configured. */
-static void create_vpmu_vm(void *guest_code)
+static void create_vpmu_vm(void *guest_code, enum pmu_impl impl)
 {
 	struct kvm_vcpu_init init;
 	u8 pmuver, ec;
@@ -409,6 +420,13 @@ static void create_vpmu_vm(void *guest_code)
 		.attr = KVM_ARM_VCPU_PMU_V3_IRQ,
 		.addr = (u64)&irq,
 	};
+	u32 partition = (impl == PARTITIONED);
+	struct kvm_device_attr part_attr = {
+		.group = KVM_ARM_VCPU_PMU_V3_CTRL,
+		.attr = KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION,
+		.addr = (uint64_t)&partition
+	};
+	int ret;
 
 	/* The test creates the vpmu_vm multiple times. Ensure a clean state */
 	memset(&vpmu_vm, 0, sizeof(vpmu_vm));
@@ -436,6 +454,15 @@ static void create_vpmu_vm(void *guest_code)
 		    "Unexpected PMUVER (0x%x) on the vCPU with PMUv3", pmuver);
 
 	vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &irq_attr);
+
+	ret = __vcpu_has_device_attr(
+		vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
+	if (!ret) {
+		vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &part_attr);
+		vpmu_vm.pmu_partitioned = partition;
+		pr_debug("Set PMU partitioning: %d\n", partition);
+	}
+
 }
 
 static void destroy_vpmu_vm(void)
@@ -461,13 +488,14 @@ static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
 	}
 }
 
-static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
+static void test_create_vpmu_vm_with_nr_counters(
+	unsigned int nr_counters, enum pmu_impl impl, bool expect_fail)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned int prev;
 	int ret;
 
-	create_vpmu_vm(guest_code);
+	create_vpmu_vm(guest_code, impl);
 	vcpu = vpmu_vm.vcpu;
 
 	prev = get_pmcr_n(vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0)));
@@ -489,7 +517,7 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool
  * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
  * and run the test.
  */
-static void run_access_test(u64 pmcr_n)
+static void run_access_test(u64 pmcr_n, enum pmu_impl impl)
 {
 	u64 sp;
 	struct kvm_vcpu *vcpu;
@@ -497,7 +525,7 @@ static void run_access_test(u64 pmcr_n)
 
 	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, impl, false);
 	vcpu = vpmu_vm.vcpu;
 
 	/* Save the initial sp to restore them later to run the guest again */
@@ -531,14 +559,14 @@ static struct pmreg_sets validity_check_reg_sets[] = {
  * Create a VM, and check if KVM handles the userspace accesses of
  * the PMU register sets in @validity_check_reg_sets[] correctly.
  */
-static void run_pmregs_validity_test(u64 pmcr_n)
+static void run_pmregs_validity_test(u64 pmcr_n, enum pmu_impl impl)
 {
 	int i;
 	struct kvm_vcpu *vcpu;
 	u64 set_reg_id, clr_reg_id, reg_val;
 	u64 valid_counters_mask, max_counters_mask;
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, impl, false);
 	vcpu = vpmu_vm.vcpu;
 
 	valid_counters_mask = get_counters_mask(pmcr_n);
@@ -588,11 +616,11 @@ static void run_pmregs_validity_test(u64 pmcr_n)
  * the vCPU to @pmcr_n, which is larger than the host value.
  * The attempt should fail as @pmcr_n is too big to set for the vCPU.
  */
-static void run_error_test(u64 pmcr_n)
+static void run_error_test(u64 pmcr_n, enum pmu_impl impl)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, true);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, impl, true);
 	destroy_vpmu_vm();
 }
 
@@ -600,11 +628,11 @@ static void run_error_test(u64 pmcr_n)
  * Return the default number of implemented PMU event counters excluding
  * the cycle counter (i.e. PMCR_EL0.N value) for the guest.
  */
-static u64 get_pmcr_n_limit(void)
+static u64 get_pmcr_n_limit(enum pmu_impl impl)
 {
 	u64 pmcr;
 
-	create_vpmu_vm(guest_code);
+	create_vpmu_vm(guest_code, impl);
 	pmcr = vcpu_get_reg(vpmu_vm.vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
 	destroy_vpmu_vm();
 	return get_pmcr_n(pmcr);
@@ -614,7 +642,7 @@ static bool kvm_supports_nr_counters_attr(void)
 {
 	bool supported;
 
-	create_vpmu_vm(NULL);
+	create_vpmu_vm(NULL, EMULATED);
 	supported = !__vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
 					    KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS);
 	destroy_vpmu_vm();
@@ -622,22 +650,46 @@ static bool kvm_supports_nr_counters_attr(void)
 	return supported;
 }
 
-int main(void)
+static bool kvm_supports_partition_attr(void)
+{
+	bool supported;
+
+	create_vpmu_vm(NULL, EMULATED);
+	supported = !__vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+					    KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
+	destroy_vpmu_vm();
+
+	return supported;
+}
+
+void test_pmu(enum pmu_impl impl)
 {
 	u64 i, pmcr_n;
 
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
-	TEST_REQUIRE(kvm_supports_vgic_v3());
-	TEST_REQUIRE(kvm_supports_nr_counters_attr());
+	pr_info("Testing PMU: Implementation = %s\n", pmu_impl_str[impl]);
+
+	pmcr_n = get_pmcr_n_limit(impl);
+	pr_debug("PMCR_EL0.N: Limit = %lu\n", pmcr_n);
 
-	pmcr_n = get_pmcr_n_limit();
 	for (i = 0; i <= pmcr_n; i++) {
-		run_access_test(i);
-		run_pmregs_validity_test(i);
+		run_access_test(i, impl);
+		run_pmregs_validity_test(i, impl);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
-		run_error_test(i);
+		run_error_test(i, impl);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+	TEST_REQUIRE(kvm_supports_vgic_v3());
+	TEST_REQUIRE(kvm_supports_nr_counters_attr());
+
+	test_pmu(EMULATED);
+
+	if (kvm_supports_partition_attr())
+		test_pmu(PARTITIONED);
 
 	return 0;
 }
-- 
2.54.0.1136.gdb2ca164c4-goog


