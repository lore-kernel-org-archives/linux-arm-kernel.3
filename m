Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CFCE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSMKPr218zjQZP8gl2Xn0SkINEtcf07/ruTFBToN5tY=; b=xTZ2lieGzb3ih1QCuRuyaYwYft
	iShFMBeDY0CV+VnLsz4fUlnvnX6fljpD5fDl6pWE8bWLMqi6gMkCGoLKizl5DBEYXePv94gtwuFPl
	xAFnOL8NMKEdtMZklozwhg4LveWgcvELh3gKenW8UH5RcKArmWj1Ik7gsVheD7bOjHS0qJJFiiMRS
	dGPX/FWt2734I+AgsUiuNnRMYKVluMNnZzdiJrCppN0snTurV4DGZCiZmgOb58fTzAxWcSD6KbNDX
	vCk3lj7yBWzOCCb7rCLjd2Lz3GYgRtJyGD4HskzAJTMeeTMVYw8+tS5GzSUMBMyBrN4aNNbaYZxUx
	BRo76JXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfLl-0000000Eu5M-0oIa;
	Tue, 17 Dec 2024 21:43:29 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf32-0000000EqzS-2QD5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:24:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SSMKPr218zjQZP8gl2Xn0SkINEtcf07/ruTFBToN5tY=;
	b=VA67n1iq+co1LRtOkonRL8hQMfYqG8eeihPXIot35jdV2OqnM0IjIoEclBz4iiySst4K0O
	LpbiaLE1FVTaMHBQwCzSQ5mBlfh37Ts9KNZjGnmfFVXlJQjc0cOLHDRXz9b+O2BGfhJIK0
	0sykWNf2bqTb28Q1+oNUBAVGbdQCK7U=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [HACK PATCH 18/18] KVM: arm64: selftests: Add test for probing PMUv3 sysregs
Date: Tue, 17 Dec 2024 13:23:58 -0800
Message-Id: <20241217212358.3709634-1-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132408_899712_D0160980 
X-CRM114-Status: GOOD (  14.01  )
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

Add a test for sniffing out PMUv3 register traps.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---

Not intended to be applied, just sharing in case someone finds it
useful.

 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/aarch64/pmuv3_register_probe.c        | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/aarch64/pmuv3_register_probe.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 41593d2e7de9..739542928306 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -159,6 +159,7 @@ TEST_GEN_PROGS_aarch64 += aarch64/debug-exceptions
 TEST_GEN_PROGS_aarch64 += aarch64/hypercalls
 TEST_GEN_PROGS_aarch64 += aarch64/mmio_abort
 TEST_GEN_PROGS_aarch64 += aarch64/page_fault_test
+TEST_GEN_PROGS_aarch64 += aarch64/pmuv3_register_probe
 TEST_GEN_PROGS_aarch64 += aarch64/psci_test
 TEST_GEN_PROGS_aarch64 += aarch64/set_id_regs
 TEST_GEN_PROGS_aarch64 += aarch64/smccc_filter
diff --git a/tools/testing/selftests/kvm/aarch64/pmuv3_register_probe.c b/tools/testing/selftests/kvm/aarch64/pmuv3_register_probe.c
new file mode 100644
index 000000000000..859b0162dbeb
--- /dev/null
+++ b/tools/testing/selftests/kvm/aarch64/pmuv3_register_probe.c
@@ -0,0 +1,135 @@
+#include <perf/arm_pmuv3.h>
+
+#include "vgic.h"
+#include "test_util.h"
+#include "processor.h"
+
+static bool undef_taken;
+
+#define test_read(sr)							\
+do {									\
+	u64 __val = read_sysreg(sr);					\
+									\
+	if (READ_ONCE(undef_taken))					\
+		GUEST_PRINTF("read_sysreg("#sr"): UNDEFINED\n");	\
+	else								\
+		GUEST_PRINTF("read_sysreg("#sr"): %lx\n", __val);	\
+	WRITE_ONCE(undef_taken, false);					\
+} while (0)
+
+#define test_write(val, sr)							\
+do {										\
+	write_sysreg(val, sr);							\
+										\
+	if (READ_ONCE(undef_taken))						\
+		GUEST_PRINTF("write_sysreg(%x, "#sr"): UNDEFINED\n", val);	\
+	else									\
+		GUEST_PRINTF("write_sysreg(%x, "#sr"): OK\n", val);		\
+	WRITE_ONCE(undef_taken, false);						\
+} while (0)
+
+static void guest_undef_handler(struct ex_regs *regs)
+{
+	WRITE_ONCE(undef_taken, true);
+	regs->pc += 4;
+}
+
+#define READ_PMEVCNTRN(n)	test_read(pmevcntr##n##_el0)
+static void test_read_evcntr(int n)
+{
+	PMEVN_SWITCH(n, READ_PMEVCNTRN);
+}
+
+#define READ_PMEVTYPERN(n)	test_read(pmevtyper##n##_el0);
+static void test_read_evtyper(int n)
+{
+	PMEVN_SWITCH(n, READ_PMEVTYPERN);
+}
+
+static void guest_code(void)
+{
+	test_read(pmcr_el0);
+	test_read(pmcntenset_el0);
+	test_read(pmcntenclr_el0);
+	test_read(pmovsset_el0);
+	test_read(pmovsclr_el0);
+	test_read(pmintenset_el1);
+	test_read(pmintenclr_el1);
+	test_read(pmceid0_el0);
+	test_read(pmceid1_el0);
+
+	test_read(pmccntr_el0);
+	test_read(pmccfiltr_el0);
+	test_write(0, pmswinc_el0);
+
+	test_write(0, pmselr_el0);
+	test_read(pmxevcntr_el0);
+	test_read(pmxevtyper_el0);
+
+	test_read(pmuserenr_el0);
+
+	for (int i = 0; i < 31; i++) {
+		test_read_evcntr(i);
+		test_read_evtyper(i);
+	}
+
+	GUEST_DONE();
+}
+
+static void run_test(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	while (true) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_PRINTF:
+			REPORT_GUEST_PRINTF(uc);
+			break;
+		case UCALL_DONE:
+			return;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+	}
+}
+
+int main(void)
+{
+	struct kvm_device_attr attr;
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	int irq = 23;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+
+	vm = vm_create(1);
+	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+
+	__TEST_REQUIRE(vgic_v3_setup(vm, 1, 64) >= 0,
+		       "Failed to create vgic-v3, skipping");
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_UNKNOWN,
+				guest_undef_handler);
+
+	attr = (struct kvm_device_attr) {
+		.group	= KVM_ARM_VCPU_PMU_V3_CTRL,
+		.attr	= KVM_ARM_VCPU_PMU_V3_IRQ,
+		.addr	= (u64)&irq,
+	};
+	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &attr);
+
+	attr = (struct kvm_device_attr) {
+		.group	= KVM_ARM_VCPU_PMU_V3_CTRL,
+		.attr	= KVM_ARM_VCPU_PMU_V3_INIT,
+	};
+	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &attr);
+
+	run_test(vcpu);
+}
-- 
2.39.5


