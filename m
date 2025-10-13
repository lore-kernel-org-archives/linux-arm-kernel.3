Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9C2CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 18:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvobYsVlBb2o7Y5J338z2BQP424zimokrcjRbYHnyKc=; b=0FPIF5Gq7om1tfI4KK4rGymwfs
	YzwFgXQVpf/QKVPan28HSyaS1jr+JyiOoaAfxAWyvfQBYxnM55Wp3M/BtDGxcx/261+yJY+6BZVir
	TfaaRipl/1Q2o+bPT9IlmtvvqItlWObmFiEfmsSQmNdE9ia+xPjg9ZlRMTJlQRnKTWR1R3xnRHE0t
	8Szxm+L2c/rMK1Ud4W5+fnmWkuXEND7Lhw2PnYcGs/u+SsgYiDP9C+2pXzN8kTZ2FfQE2vMB6y7g3
	q+l3dRb1jx+1+glwPLCMJQPU9YAYbPmlWulG27RRCgzqEHDreyCOPkRY/9+UeNoGZ92ijYlOMpcbH
	yEmCC/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NlO-0000000ED92-2Z4y;
	Mon, 13 Oct 2025 18:59:18 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NlK-0000000ED5Y-0GgC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 18:59:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso7935053a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760381953; x=1760986753; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uvobYsVlBb2o7Y5J338z2BQP424zimokrcjRbYHnyKc=;
        b=AcVQtHE1WJjoh9GQViRYY+lR4DjP/zoUTd5K66gg+d8HDDIkPV35RW14AawqBEAefh
         NjLxP19xFr4WU/5JYfo/jeRGalQyuRINiAr5nYY9ISr+8KpRIghTBKurTOq0pqDz8Q8j
         aQFdk+i0HNNxCppG8RBghcmcfU9WM+orjUPimlm8DOGUVJVcSHEhqbi8B/f4choTeLUh
         ILUxWMVINGmwFot8f7imzENPfkQxsY/slADx5jmPlRSk4ZpkCrs8hEJ/g+djK64oheN4
         JIXtzcXtbR4X6xmNPXEJQx6BLBZvaXt/hDGF7j5cAJbi09kGRoJy2bFmdjCYKLovIzlt
         AqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381953; x=1760986753;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvobYsVlBb2o7Y5J338z2BQP424zimokrcjRbYHnyKc=;
        b=ZL+wB1b88PX41Nh2DS3wnXo2iWno1CrTtw9hSvH/zKJ3Z/HIQnQ9vF+uskE2C/hQU8
         fnMu2pwpZjQxQAqxuNPQKDUGtw6xldo3gV/ZAVZJiAYR/Vg7qvMAj7ozca73w+4q1Smp
         Hjx/t4taKHLYSucEnMWbGZqaNgj1r77JtNaigoGrXbd/lUVztATQPIWJPJ0MfQsi176J
         /vxuMu0VPDjrZT6VABbNenO7KzdUGOL+qUX8qMvQS90IfCvjIC3oKaF1WKhXpPmTKmdY
         FGs9/upZQCyi15N80nNAfvrLWraMfMkMLiNh8antg2Od8ved2V0lvSa9BRg0LHz4S5C7
         BqTA==
X-Forwarded-Encrypted: i=1; AJvYcCVdwoGW7cEf1O5CK8ms/L33VTb3QGFFC6N5CHALVuo0HVRJ9iNShy/PVU9hdyFO8mUMephKGeyAPZZxMZ8vZ/OG@lists.infradead.org
X-Gm-Message-State: AOJu0YxSuX/u1DHh549Kutm7qgIJMlOf9qhs1+k5WXAC00MNikpCirII
	TisnrphxeyT02j3B9J7SBM+p1gpaI6AWI6Ykv0oiFvNdDIg9UZXed2klIFipHNxN3lLQnfHquw+
	QqIXSpH35HoIMJQ==
X-Google-Smtp-Source: AGHT+IGXzu1uuUUNHIfEuQ7Bv+IaS8mwobBqhH+hz1ImvjWzLVVf0E0HPZaRHZIIdMum3CR/W4zQiZ/ph1aztg==
X-Received: from pjzr23.prod.google.com ([2002:a17:90b:517:b0:32e:bd90:3e11])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e81:b0:338:2ed3:affb with SMTP id 98e67ed59e1d1-33b5138e372mr28359263a91.26.1760381953021;
 Mon, 13 Oct 2025 11:59:13 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:59:02 +0000
In-Reply-To: <20251013185903.1372553-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
Message-ID: <20251013185903.1372553-3-jiaqiyan@google.com>
Subject: [PATCH v4 2/3] KVM: selftests: Test for KVM_EXIT_ARM_SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	vsethi@nvidia.com, jgg@nvidia.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_115914_119701_EA304080 
X-CRM114-Status: GOOD (  26.30  )
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

Test how KVM handles guest SEA when APEI is unable to claim it, and
KVM_CAP_ARM_SEA_TO_USER is enabled.

The behavior is triggered by consuming recoverable memory error (UER)
injected via EINJ. The test asserts two major things:
1. KVM returns to userspace with KVM_EXIT_ARM_SEA exit reason, and
   has provided expected fault information, e.g. esr, flags, gva, gpa.
2. Userspace is able to handle KVM_EXIT_ARM_SEA by injecting SEA to
   guest and KVM injects expected SEA into the VCPU.

Tested on a data center server running Siryn AmpereOne processor
that has RAS support.

Several things to notice before attempting to run this selftest:
- The test relies on EINJ support in both firmware and kernel to
  inject UER. Otherwise the test will be skipped.
- The under-test platform's APEI should be unable to claim the SEA.
  Otherwise the test will be skipped.
- Some platform doesn't support notrigger in EINJ, which may cause
  APEI and GHES to offline the memory before guest can consume
  injected UER, and making test unable to trigger SEA.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 tools/arch/arm64/include/asm/esr.h            |   2 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/sea_to_user.c | 331 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
 4 files changed, 335 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/sea_to_user.c

diff --git a/tools/arch/arm64/include/asm/esr.h b/tools/arch/arm64/include/asm/esr.h
index bd592ca815711..0fa17b3af1f78 100644
--- a/tools/arch/arm64/include/asm/esr.h
+++ b/tools/arch/arm64/include/asm/esr.h
@@ -141,6 +141,8 @@
 #define ESR_ELx_SF 		(UL(1) << ESR_ELx_SF_SHIFT)
 #define ESR_ELx_AR_SHIFT	(14)
 #define ESR_ELx_AR 		(UL(1) << ESR_ELx_AR_SHIFT)
+#define ESR_ELx_VNCR_SHIFT	(13)
+#define ESR_ELx_VNCR		(UL(1) << ESR_ELx_VNCR_SHIFT)
 #define ESR_ELx_CM_SHIFT	(8)
 #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)
 
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 148d427ff24be..02a7663c097b5 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -163,6 +163,7 @@ TEST_GEN_PROGS_arm64 += arm64/hypercalls
 TEST_GEN_PROGS_arm64 += arm64/external_aborts
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
+TEST_GEN_PROGS_arm64 += arm64/sea_to_user
 TEST_GEN_PROGS_arm64 += arm64/set_id_regs
 TEST_GEN_PROGS_arm64 += arm64/smccc_filter
 TEST_GEN_PROGS_arm64 += arm64/vcpu_width_config
diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
new file mode 100644
index 0000000000000..573dd790aeb8e
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test KVM returns to userspace with KVM_EXIT_ARM_SEA if host APEI fails
+ * to handle SEA and userspace has opt-ed in KVM_CAP_ARM_SEA_TO_USER.
+ *
+ * After reaching userspace with expected arm_sea info, also test userspace
+ * injecting a synchronous external data abort into the guest.
+ *
+ * This test utilizes EINJ to generate a REAL synchronous external data
+ * abort by consuming a recoverable uncorrectable memory error. Therefore
+ * the device under test must support EINJ in both firmware and host kernel,
+ * including the notrigger feature. Otherwise the test will be skipped.
+ * The under-test platform's APEI should be unable to claim SEA. Otherwise
+ * the test will also be skipped.
+ */
+
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+#include "guest_modes.h"
+
+#define PAGE_PRESENT		(1ULL << 63)
+#define PAGE_PHYSICAL		0x007fffffffffffffULL
+#define PAGE_ADDR_MASK		(~(0xfffULL))
+
+/* Group ISV and ISS[23:14]. */
+#define ESR_ELx_INST_SYNDROME	((ESR_ELx_ISV) | (ESR_ELx_SAS) | \
+				 (ESR_ELx_SSE) | (ESR_ELx_SRT_MASK) | \
+				 (ESR_ELx_SF) | (ESR_ELx_AR))
+
+#define EINJ_ETYPE		"/sys/kernel/debug/apei/einj/error_type"
+#define EINJ_ADDR		"/sys/kernel/debug/apei/einj/param1"
+#define EINJ_MASK		"/sys/kernel/debug/apei/einj/param2"
+#define EINJ_FLAGS		"/sys/kernel/debug/apei/einj/flags"
+#define EINJ_NOTRIGGER		"/sys/kernel/debug/apei/einj/notrigger"
+#define EINJ_DOIT		"/sys/kernel/debug/apei/einj/error_inject"
+/* Memory Uncorrectable non-fatal. */
+#define ERROR_TYPE_MEMORY_UER	0x10
+/* Memory address and mask valid (param1 and param2). */
+#define MASK_MEMORY_UER		0b10
+
+/* Guest virtual address region = [2G, 3G).  */
+#define START_GVA		0x80000000UL
+#define VM_MEM_SIZE		0x40000000UL
+/* Note: EINJ_OFFSET must < VM_MEM_SIZE. */
+#define EINJ_OFFSET		0x01234badUL
+#define EINJ_GVA		((START_GVA) + (EINJ_OFFSET))
+
+static vm_paddr_t einj_gpa;
+static void *einj_hva;
+static uint64_t einj_hpa;
+static bool far_invalid;
+
+static uint64_t translate_to_host_paddr(unsigned long vaddr)
+{
+	uint64_t pinfo;
+	int64_t offset = vaddr / getpagesize() * sizeof(pinfo);
+	int fd;
+	uint64_t page_addr;
+	uint64_t paddr;
+
+	fd = open("/proc/self/pagemap", O_RDONLY);
+	if (fd < 0)
+		ksft_exit_fail_perror("Failed to open /proc/self/pagemap");
+	if (pread(fd, &pinfo, sizeof(pinfo), offset) != sizeof(pinfo)) {
+		close(fd);
+		ksft_exit_fail_perror("Failed to read /proc/self/pagemap");
+	}
+
+	close(fd);
+
+	if ((pinfo & PAGE_PRESENT) == 0)
+		ksft_exit_fail_perror("Page not present");
+
+	page_addr = (pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT;
+	paddr = page_addr + (vaddr & (getpagesize() - 1));
+	return paddr;
+}
+
+static void write_einj_entry(const char *einj_path, uint64_t val)
+{
+	char cmd[256] = {0};
+	FILE *cmdfile = NULL;
+
+	sprintf(cmd, "echo %#lx > %s", val, einj_path);
+	cmdfile = popen(cmd, "r");
+
+	if (pclose(cmdfile) == 0)
+		ksft_print_msg("echo %#lx > %s - done\n", val, einj_path);
+	else
+		ksft_exit_fail_perror("Failed to write EINJ entry");
+}
+
+static void inject_uer(uint64_t paddr)
+{
+	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1)
+		ksft_test_result_skip("EINJ table no available in firmware");
+
+	if (access(EINJ_ETYPE, R_OK | W_OK) == -1)
+		ksft_test_result_skip("EINJ module probably not loaded?");
+
+	write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
+	write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
+	write_einj_entry(EINJ_ADDR, paddr);
+	write_einj_entry(EINJ_MASK, ~0x0UL);
+	write_einj_entry(EINJ_NOTRIGGER, 1);
+	write_einj_entry(EINJ_DOIT, 1);
+}
+
+/*
+ * When host APEI successfully claims the SEA caused by guest_code, kernel
+ * will send SIGBUS signal with BUS_MCEERR_AR to test thread.
+ *
+ * We set up this SIGBUS handler to skip the test for that case.
+ */
+static void sigbus_signal_handler(int sig, siginfo_t *si, void *v)
+{
+	ksft_print_msg("SIGBUS (%d) received, dumping siginfo...\n", sig);
+	ksft_print_msg("si_signo=%d, si_errno=%d, si_code=%d, si_addr=%p\n",
+		       si->si_signo, si->si_errno, si->si_code, si->si_addr);
+	if (si->si_code == BUS_MCEERR_AR)
+		ksft_test_result_skip("SEA is claimed by host APEI\n");
+	else
+		ksft_test_result_fail("Exit with signal unhandled\n");
+
+	exit(0);
+}
+
+static void setup_sigbus_handler(void)
+{
+	struct sigaction act;
+
+	memset(&act, 0, sizeof(act));
+	sigemptyset(&act.sa_mask);
+	act.sa_sigaction = sigbus_signal_handler;
+	act.sa_flags = SA_SIGINFO;
+	TEST_ASSERT(sigaction(SIGBUS, &act, NULL) == 0,
+		    "Failed to setup SIGBUS handler");
+}
+
+static void guest_code(void)
+{
+	uint64_t guest_data;
+
+	/* Consumes error will cause a SEA. */
+	guest_data = *(uint64_t *)EINJ_GVA;
+
+	GUEST_FAIL("Poison not protected by SEA: gva=%#lx, guest_data=%#lx\n",
+		   EINJ_GVA, guest_data);
+}
+
+static void expect_sea_handler(struct ex_regs *regs)
+{
+	u64 esr = read_sysreg(esr_el1);
+	u64 far = read_sysreg(far_el1);
+	bool expect_far_invalid = far_invalid;
+
+	GUEST_PRINTF("Handling Guest SEA\n");
+	GUEST_PRINTF("ESR_EL1=%#lx, FAR_EL1=%#lx\n", esr, far);
+
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
+	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+
+	if (expect_far_invalid) {
+		GUEST_ASSERT_EQ(esr & ESR_ELx_FnV, ESR_ELx_FnV);
+		GUEST_PRINTF("Guest observed garbage value in FAR\n");
+	} else {
+		GUEST_ASSERT_EQ(esr & ESR_ELx_FnV, 0);
+		GUEST_ASSERT_EQ(far, EINJ_GVA);
+	}
+
+	GUEST_DONE();
+}
+
+static void vcpu_inject_sea(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+
+	events.exception.ext_dabt_pending = true;
+	vcpu_events_set(vcpu, &events);
+}
+
+static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+	bool guest_done = false;
+	struct kvm_run *run = vcpu->run;
+	u64 esr;
+
+	/* Resume the vCPU after error injection to consume the error. */
+	vcpu_run(vcpu);
+
+	ksft_print_msg("Dump kvm_run info about KVM_EXIT_%s\n",
+		       exit_reason_str(run->exit_reason));
+	ksft_print_msg("kvm_run.arm_sea: esr=%#llx, flags=%#llx\n",
+		       run->arm_sea.esr, run->arm_sea.flags);
+	ksft_print_msg("kvm_run.arm_sea: gva=%#llx, gpa=%#llx\n",
+		       run->arm_sea.gva, run->arm_sea.gpa);
+
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_ARM_SEA);
+
+	esr = run->arm_sea.esr;
+	TEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_LOW);
+	TEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+	TEST_ASSERT_EQ(ESR_ELx_ISS2(esr), 0);
+	TEST_ASSERT_EQ((esr & ESR_ELx_INST_SYNDROME), 0);
+	TEST_ASSERT_EQ(esr & ESR_ELx_VNCR, 0);
+
+	if (!(esr & ESR_ELx_FnV)) {
+		ksft_print_msg("Expect gva to match given FnV bit is 0\n");
+		TEST_ASSERT_EQ(run->arm_sea.gva, EINJ_GVA);
+	}
+
+	if (run->arm_sea.flags & KVM_EXIT_ARM_SEA_FLAG_GPA_VALID) {
+		ksft_print_msg("Expect gpa to match given KVM_EXIT_ARM_SEA_FLAG_GPA_VALID is set\n");
+		TEST_ASSERT_EQ(run->arm_sea.gpa, einj_gpa & PAGE_ADDR_MASK);
+	}
+
+	far_invalid = esr & ESR_ELx_FnV;
+
+	/* Inject a SEA into guest and expect handled in SEA handler. */
+	vcpu_inject_sea(vcpu);
+
+	/* Expect the guest to reach GUEST_DONE gracefully. */
+	do {
+		vcpu_run(vcpu);
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_PRINTF:
+			ksft_print_msg("From guest: %s", uc.buffer);
+			break;
+		case UCALL_DONE:
+			ksft_print_msg("Guest done gracefully!\n");
+			guest_done = 1;
+			break;
+		case UCALL_ABORT:
+			ksft_print_msg("Guest aborted!\n");
+			guest_done = 1;
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		default:
+			TEST_FAIL("Unexpected ucall: %lu\n", uc.cmd);
+		}
+	} while (!guest_done);
+}
+
+static struct kvm_vm *vm_create_with_sea_handler(struct kvm_vcpu **vcpu)
+{
+	size_t backing_page_size;
+	size_t guest_page_size;
+	size_t alignment;
+	uint64_t num_guest_pages;
+	vm_paddr_t start_gpa;
+	enum vm_mem_backing_src_type src_type = VM_MEM_SRC_ANONYMOUS_HUGETLB_1GB;
+	struct kvm_vm *vm;
+
+	backing_page_size = get_backing_src_pagesz(src_type);
+	guest_page_size = vm_guest_mode_params[VM_MODE_DEFAULT].page_size;
+	alignment = max(backing_page_size, guest_page_size);
+	num_guest_pages = VM_MEM_SIZE / guest_page_size;
+
+	vm = __vm_create_with_one_vcpu(vcpu, num_guest_pages, guest_code);
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(*vcpu);
+
+	vm_install_sync_handler(vm,
+		/*vector=*/VECTOR_SYNC_CURRENT,
+		/*ec=*/ESR_ELx_EC_DABT_CUR,
+		/*handler=*/expect_sea_handler);
+
+	start_gpa = (vm->max_gfn - num_guest_pages) * guest_page_size;
+	start_gpa = align_down(start_gpa, alignment);
+
+	vm_userspace_mem_region_add(
+		/*vm=*/vm,
+		/*src_type=*/src_type,
+		/*guest_paddr=*/start_gpa,
+		/*slot=*/1,
+		/*npages=*/num_guest_pages,
+		/*flags=*/0);
+
+	virt_map(vm, START_GVA, start_gpa, num_guest_pages);
+
+	ksft_print_msg("Mapped %#lx pages: gva=%#lx to gpa=%#lx\n",
+		       num_guest_pages, START_GVA, start_gpa);
+	return vm;
+}
+
+static void vm_inject_memory_uer(struct kvm_vm *vm)
+{
+	uint64_t guest_data;
+
+	einj_gpa = addr_gva2gpa(vm, EINJ_GVA);
+	einj_hva = addr_gva2hva(vm, EINJ_GVA);
+
+	/* Populate certain data before injecting UER. */
+	*(uint64_t *)einj_hva = 0xBAADCAFE;
+	guest_data = *(uint64_t *)einj_hva;
+	ksft_print_msg("Before EINJect: data=%#lx\n",
+		guest_data);
+
+	einj_hpa = translate_to_host_paddr((unsigned long)einj_hva);
+
+	ksft_print_msg("EINJ_GVA=%#lx, einj_gpa=%#lx, einj_hva=%p, einj_hpa=%#lx\n",
+		       EINJ_GVA, einj_gpa, einj_hva, einj_hpa);
+
+	inject_uer(einj_hpa);
+	ksft_print_msg("Memory UER EINJected\n");
+}
+
+int main(int argc, char *argv[])
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_SEA_TO_USER));
+
+	setup_sigbus_handler();
+
+	vm = vm_create_with_sea_handler(&vcpu);
+	vm_enable_cap(vm, KVM_CAP_ARM_SEA_TO_USER, 0);
+	vm_inject_memory_uer(vm);
+	run_vm(vm, vcpu);
+	kvm_vm_free(vm);
+
+	return 0;
+}
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 6743fbd9bd671..3e2f249e88271 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2039,6 +2039,7 @@ static struct exit_reason {
 	KVM_EXIT_STRING(NOTIFY),
 	KVM_EXIT_STRING(LOONGARCH_IOCSR),
 	KVM_EXIT_STRING(MEMORY_FAULT),
+	KVM_EXIT_STRING(ARM_SEA),
 };
 
 /*
-- 
2.51.0.760.g7b8bcc2412-goog


