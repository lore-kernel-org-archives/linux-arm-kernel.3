Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFFC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26CTSmqDyxITTH+s3Gb/2J4B5NVYM/QmbIppKLMrdxo=; b=BHyvv0ElsGyvIOCvAxTJvxD+i2
	DXAo4oUFBTpid8wOD/WMRP3Y4ydJGoge3fIq9d0PGB7Ubw+Hk69PsUxrfH0IwWjnl1E68ujVYPxDZ
	IlmZyZtEh8trGTdhJbG+O6h1kzhS++I0jXAw8+nLr8eXDUjBCN1xOlgfGZ5lO4rBZ8XKtBLNMoAGv
	hpTI7e+MdF/sDkQWRfZ6DT3uoW1oUFdageDjPrNtXpgPdWCqEyw3/weaxkU+AhchnwWWBFezwd5jf
	tRcoSYpzP+vTrhVqYXL9XDvBajH2FEe40nsWgeD63xyfC49TFxicWllSMtZpCL/Dj5C2x9LzbO3z4
	RCZUHvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBTk-00000008gXc-0KBO;
	Mon, 02 Jun 2025 20:09:52 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqT-00000008UOK-0iWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:18 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-4067106dd65so1185429b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892555; x=1749497355; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=26CTSmqDyxITTH+s3Gb/2J4B5NVYM/QmbIppKLMrdxo=;
        b=Zl027NyZnQ/fr6lLnHk9J2q2fRV8iZehV0o/+UwUgT+R6j82QJtEUQ3sMgEdrVa+k3
         SKIICWq9c5VMDREAsa4dfqlUcNWnuVSYH1wLmsEtm4Ubg5yooaFyjCYMIoSYGfOvuTzD
         T/UIRIWN1QM9CJMxfoCQ2NWSs9r2n8FOw/Oi3Rk6kqYgJPhbD/gD9uuJ48iCeZn3ra+x
         kzOoHeHs6cCNXKvkRgQZ+HcPxgi1qDvGnvtax34G1B4VlD10+ArR7MfYsBBPmNQTJ2VI
         Gb8YoAXi57zeyuCYymOLRyZEA/Qmi7WD+lfIGMeEvrJ8a+hAl964daMHCa08uUEoYkh9
         YHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892555; x=1749497355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26CTSmqDyxITTH+s3Gb/2J4B5NVYM/QmbIppKLMrdxo=;
        b=EbOh/qBAMRDAhF56NJa0tl1RBZAAeDTjvlWwcvmbKGE14NB9FCxPCp3CQBEJW6JDDr
         84x0Ai8m3ahe79AUkC42V1WwIknPnfe4soaz5oLlCZqipCZYCPGO+1+7dg1BcHRghPlj
         +IFL6EZh0o8lVodbikmmeOv+HD1fPaRX7hroYJtwgS8xXFdQqMWCh84FgGau76iqRLAV
         oh/xoQplw0e3oSRAP3rBsMk5mZRaHgs1Izp0soF16bsUU6if8G7gbmHpxJU46C7JioOD
         1bJVpvEzv60f4UTBb0E19vvYkY79ETTs2Ka23ekRNFKz8zvo+CI2uVUSQbOXI5OJd/ZZ
         TPWA==
X-Forwarded-Encrypted: i=1; AJvYcCVLeGRLKLvxSo4zThL9c/OneLEoq2y04chqYh0KQNqba4/RPckWccflUAtmPu2sVT8AqUsAIoiBh7LNM7cGzdpC@lists.infradead.org
X-Gm-Message-State: AOJu0YziXag8RCqTa3MBujSnoAP4JJk0lZvg2zSw7lCG5HhpsK7499nd
	CMMprd85hz5iULHQCx4sn0Tn1MLod8SqtdBqBZCjL3axMSQsyDml7rD0hfd+zaAqk6YN7qK5Jzz
	YItGpgLrE4ibA2SJ6afyZXUsCMQ==
X-Google-Smtp-Source: AGHT+IGRQ3tQu2xw3SSP0wfqw8hVdXkUiNnwLp3FSZDPtlEdZWrls30MkwdnKq2FbM4pg171i7/WNDJ2D1arVSPVXw==
X-Received: from oibbo14.prod.google.com ([2002:a05:6808:228e:b0:406:4510:b017])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6b8d:b0:403:3e86:ab4c with SMTP id 5614622812f47-4067e6d94d1mr7758695b6e.39.1748892555108;
 Mon, 02 Jun 2025 12:29:15 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:27:02 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-18-coltonlewis@google.com>
Subject: [PATCH 17/17] KVM: arm64: selftests: Add test case for partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122917_212155_5132E130 
X-CRM114-Status: GOOD (  21.24  )
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

Run separate test cases for a partitioned PMU in
vpmu_counter_access. Notably, partitioning the PMU untraps PMCR_EL0.N,
so that is no longer settable by KVM.

Add a boolean argument to run_access_test() that will partition the
PMU by reserving one host counter if true then run the test for the
PMCR_EL0.N value that implies, one less than the number of counters on
the host system.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/include/uapi/linux/kvm.h                |  2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c | 40 ++++++++++++++++---
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index b6ae8ad8934b..cb72b57b9b6c 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -930,6 +930,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_PARTITION_PMU 242
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1356,6 +1357,7 @@ struct kvm_vfio_spapr_tce {
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
 /* Memory Encryption Commands */
 #define KVM_MEMORY_ENCRYPT_OP      _IOWR(KVMIO, 0xba, unsigned long)
+#define KVM_ARM_PARTITION_PMU	_IOWR(KVMIO, 0xce, u8)
 
 struct kvm_enc_region {
 	__u64 addr;
diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32e..e06448c1fbb5 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -369,6 +369,7 @@ static void guest_code(uint64_t expected_pmcr_n)
 	pmcr = read_sysreg(pmcr_el0);
 	pmcr_n = get_pmcr_n(pmcr);
 
+	/* __GUEST_ASSERT(0, "Expect PMCR: %lx", pmcr); */
 	/* Make sure that PMCR_EL0.N indicates the value userspace set */
 	__GUEST_ASSERT(pmcr_n == expected_pmcr_n,
 			"Expected PMCR.N: 0x%lx, PMCR.N: 0x%lx",
@@ -508,16 +509,18 @@ static void test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
  * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
  * and run the test.
  */
-static void run_access_test(uint64_t pmcr_n)
+static void run_access_test(uint64_t pmcr_n, bool partition)
 {
 	uint64_t sp;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vcpu_init init;
+	uint8_t host_counters = (uint8_t)partition;
 
 	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, false);
 	vcpu = vpmu_vm.vcpu;
+	vcpu_ioctl(vcpu, KVM_ARM_PARTITION_PMU, &host_counters);
 
 	/* Save the initial sp to restore them later to run the guest again */
 	sp = vcpu_get_reg(vcpu, ARM64_CORE_REG(sp_el1));
@@ -529,6 +532,8 @@ static void run_access_test(uint64_t pmcr_n)
 	 * check if PMCR_EL0.N is preserved.
 	 */
 	vm_ioctl(vpmu_vm.vm, KVM_ARM_PREFERRED_TARGET, &init);
+	vcpu_ioctl(vcpu, KVM_ARM_PARTITION_PMU, &host_counters);
+
 	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
 	aarch64_vcpu_setup(vcpu, &init);
 	vcpu_init_descriptor_tables(vcpu);
@@ -609,7 +614,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  */
 static void run_error_test(uint64_t pmcr_n)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
 	destroy_vpmu_vm();
@@ -629,20 +634,45 @@ static uint64_t get_pmcr_n_limit(void)
 	return get_pmcr_n(pmcr);
 }
 
-int main(void)
+void test_emulated_pmu(void)
 {
 	uint64_t i, pmcr_n;
 
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+	pr_info("Testing Emulated PMU\n");
 
 	pmcr_n = get_pmcr_n_limit();
 	for (i = 0; i <= pmcr_n; i++) {
-		run_access_test(i);
+		run_access_test(i, false);
 		run_pmregs_validity_test(i);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
 		run_error_test(i);
+}
+
+void test_partitioned_pmu(void)
+{
+	uint64_t i, pmcr_n;
+
+	pr_info("Testing Partitioned PMU\n");
+
+	pmcr_n = get_pmcr_n_limit();
+	run_access_test(pmcr_n - 1, true);
+
+	/* Partitioning implies only one PMCR.N allowed */
+	for (i = 0; i < ARMV8_PMU_MAX_COUNTERS; i++)
+		if (i != pmcr_n)
+			run_error_test(i);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+
+	test_emulated_pmu();
+
+	if (kvm_has_cap(KVM_CAP_ARM_PARTITION_PMU))
+		test_partitioned_pmu();
 
 	return 0;
 }
-- 
2.49.0.1204.g71687c7c1d-goog


