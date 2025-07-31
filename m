Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3291C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7whMSj4GW59YuO3bK58f0y4iIovKl3vCWboamrKQYI=; b=Qb9nuNL7MlKKV3N4OZlWwqIrF+
	ajYNXVgYF0iEXZQCdXXGk7iTIj4w/XYmqSoU1Dc98LarhEhasEyU8IoPaRuvKCUF9H4Hm0tLRsC/J
	r28y/BjDsO7LTavFVsnWz/Wus8X+VvGM+lyQviyE0HVhSvFyAJf7nF5mDQRFTMVZDTlXUGzvHVytf
	x3HDz4vFi5XajC6gOgo/vcGAatL2E0YlC5Xv1EfA1z5FODc7zLiQPdgDJqp0qCJMVRgr5y/P+0IVI
	r7y05a9l/JdYGUcbJyP99AiZSKRoPZcL4g8C/4dm6WQ2TF6elvBHafrOzJKWb+ReD8r8xtImBEsg3
	j/qfHjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhb29-00000004ULt-3PuN;
	Thu, 31 Jul 2025 21:41:53 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhahB-00000004SAW-3xi0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 21:20:16 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b423aba05feso50730a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753996812; x=1754601612; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7whMSj4GW59YuO3bK58f0y4iIovKl3vCWboamrKQYI=;
        b=gr6ZnoAjbDkSA89sr+4cb479ptz+yAakgAcUAfqt0EWIh8ppOZ1YzR6Jke63r42jjK
         DukIOoLcI7xCzookJjutljfrr+cGT6Jlugv9j/GLYJH0vYRrW7NQmEN71Y8runZPdnKQ
         zpl9XzoWZzqscfgw7JvpGRcKNDSbxvqgytSN1CZRJMDnaZqjHQpSfr4Qv673jFPqJavZ
         8hLCPs39Ic5UAWeIfkw5hZquAPONi+QsWFtI2cR6PiXLA1YaTpytnV0NMB4Z44m6V5GR
         GwFyyPs3AKSizgPODHWK4t/0HSaIdNerZFJd85nCgAC9vL2LST0MiDqiwQRYL/TR7pus
         oQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753996812; x=1754601612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7whMSj4GW59YuO3bK58f0y4iIovKl3vCWboamrKQYI=;
        b=eDj1C08aW5nmdHRrMr4v1nBd0C3pRjamZmChwt9I9lnWltQQjzBnk3PTu5t+2w8YNZ
         YCd5h23rAZR/zw1sFP4YAVmurIeP10HQ1NNlfY8Bm/j48h8VSEhpDdRVeKDcwd+ehnLb
         zNK087GBRhEBM5qvYYc8dLQxytjbSwtS1/xjNp15WF7/ec3ZiTWQ+iaDzEsmpcfgGKwz
         sbEshxtgsmZKC7GErSW0GZz3SguEPqjDFhmN5gwB31+4KVZoMsyR6H0XBcUcrXKJtsRC
         4kWsYgGXCiile7nC/O775tVOPMUEjRI15ihdv6KaZ+T7a8iQDg6OZsdLsXGZRuK25Yd4
         AlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6gyKo/CAGU8zRSwpfSZj66tIgXF7awxezHbSkvpueFdZU6d8chqV9T4N2UGMhmmdL4609dxWjfl7kPwZV6xjQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzmC5kn9LMV3goh4cyzdRzb3AsOFPo2CfB9z8LapedjDo0yYuzl
	aVQ8t05t2DYwd2jBd5KRFnEuXw60+gx5onMuLKvGa21JFACzMVSwx5dxBC8hWtXETGAjWP5sReF
	+bRbWqSyFe9vvAA==
X-Google-Smtp-Source: AGHT+IG3d5WxcS5Lhh7Yi0TSfL5o13oztWxshjglDCP/OQyqEPXNyDBcj9eLVkgSsHcYZ16+/AhhWRYIXQGu9A==
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:311:d79d:e432])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:6c4:b0:31f:44a:229c with SMTP id 98e67ed59e1d1-31f5dde6ae1mr13618876a91.12.1753996812385;
 Thu, 31 Jul 2025 14:20:12 -0700 (PDT)
Date: Thu, 31 Jul 2025 21:20:03 +0000
In-Reply-To: <20250731212004.1437336-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250731212004.1437336-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731212004.1437336-4-jiaqiyan@google.com>
Subject: [PATCH v1 3/4] KVM: selftests: Test injecting external abort with ISS
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rananta@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_142013_990435_ECC0A4AD 
X-CRM114-Status: GOOD (  20.43  )
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

Test userspace can use KVM_SET_VCPU_EVENTS to inject an external
instruction or data abort with customized ISS if provided.

The test injects fake external aborts without real instruction or
data abort happening to VCPU, and only certain ESR_EL1 bits are
expected and asserted.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 tools/arch/arm64/include/uapi/asm/kvm.h       |   7 +-
 .../selftests/kvm/arm64/external_aborts.c     | 191 +++++++++++++++---
 .../testing/selftests/kvm/arm64/inject_iabt.c |  98 +++++++++
 3 files changed, 264 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c

diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c7..406d6e67df822 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -184,11 +184,14 @@ struct kvm_vcpu_events {
 		__u8 serror_pending;
 		__u8 serror_has_esr;
 		__u8 ext_dabt_pending;
+		__u8 ext_iabt_pending;
+		__u8 ext_abt_has_esr;
 		/* Align it to 8 bytes */
-		__u8 pad[5];
+		__u8 pad[3];
 		__u64 serror_esr;
+		__u64 ext_abt_esr;
 	} exception;
-	__u32 reserved[12];
+	__u32 reserved[10];
 };
 
 struct kvm_arm_copy_mte_tags {
diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index 062bf84cced13..a6396ff4f84da 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -9,10 +9,14 @@
 
 #define MMIO_ADDR		0x8000000ULL
 #define EXPECTED_SERROR_ISS	(ESR_ELx_ISV | 0x1d1ed)
+#define FAKE_DABT_ISS		(ESR_ELx_ISV | ESR_ELx_SAS | ESR_ELx_SF | \
+				 ESR_ELx_AR | ESR_ELx_CM | ESR_ELx_FnV | \
+				 ESR_ELx_EA)
+#define FAKE_IABT_ISS		(ESR_ELx_ISV | ESR_ELx_FnV | ESR_ELx_EA)
 
 static u64 expected_abort_pc;
 
-static void expect_sea_handler(struct ex_regs *regs)
+static void expect_dabt_handler(struct ex_regs *regs)
 {
 	u64 esr = read_sysreg(esr_el1);
 
@@ -23,19 +27,60 @@ static void expect_sea_handler(struct ex_regs *regs)
 	GUEST_DONE();
 }
 
+static void expect_dabt_esr_handler(struct ex_regs *regs)
+{
+	u64 esr = read_sysreg(esr_el1);
+
+	GUEST_PRINTF("Handling guest instruction abort\n");
+	GUEST_PRINTF("  ESR_EL1=%#lx\n", esr);
+
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
+	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+	GUEST_ASSERT_EQ(esr & FAKE_DABT_ISS, FAKE_DABT_ISS);
+
+	GUEST_DONE();
+}
+
+static void expect_iabt_esr_handler(struct ex_regs *regs)
+{
+	u64 esr = read_sysreg(esr_el1);
+
+	GUEST_PRINTF("Handling guest instruction abort\n");
+	GUEST_PRINTF("  ESR_EL1=%#lx\n", esr);
+
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_IABT_CUR);
+	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+	GUEST_ASSERT_EQ(esr & FAKE_IABT_ISS, FAKE_IABT_ISS);
+
+	GUEST_DONE();
+}
+
 static void unexpected_dabt_handler(struct ex_regs *regs)
 {
 	GUEST_FAIL("Unexpected data abort at PC: %lx\n", regs->pc);
 }
 
-static struct kvm_vm *vm_create_with_dabt_handler(struct kvm_vcpu **vcpu, void *guest_code,
-						  handler_fn dabt_handler)
+static void unexpected_iabt_handler(struct ex_regs *regs)
+{
+	GUEST_FAIL("Unexpected instruction abort at PC: %lx\n", regs->pc);
+}
+
+static struct kvm_vm *vm_create_with_extabt_handler(struct kvm_vcpu **vcpu,
+						    void *guest_code,
+						    handler_fn dabt_handler,
+						    handler_fn iabt_handler)
 {
 	struct kvm_vm *vm = vm_create_with_one_vcpu(vcpu, guest_code);
 
 	vm_init_descriptor_tables(vm);
 	vcpu_init_descriptor_tables(*vcpu);
-	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_DABT_CUR, dabt_handler);
+
+	if (dabt_handler)
+		vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+					ESR_ELx_EC_DABT_CUR, dabt_handler);
+	if (iabt_handler)
+		vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+					ESR_ELx_EC_IABT_CUR, iabt_handler);
 
 	virt_map(vm, MMIO_ADDR, MMIO_ADDR, 1);
 
@@ -50,6 +95,26 @@ static void vcpu_inject_sea(struct kvm_vcpu *vcpu)
 	vcpu_events_set(vcpu, &events);
 }
 
+static void vcpu_inject_dabt_esr(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+
+	events.exception.ext_dabt_pending = true;
+	events.exception.ext_abt_has_esr = true;
+	events.exception.ext_abt_esr = FAKE_DABT_ISS;
+	vcpu_events_set(vcpu, &events);
+}
+
+static void vcpu_inject_iabt_esr(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+
+	events.exception.ext_iabt_pending = true;
+	events.exception.ext_abt_has_esr = true;
+	events.exception.ext_abt_esr = FAKE_IABT_ISS;
+	vcpu_events_set(vcpu, &events);
+}
+
 static bool vcpu_has_ras(struct kvm_vcpu *vcpu)
 {
 	u64 pfr0 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1));
@@ -79,17 +144,24 @@ static void __vcpu_run_expect(struct kvm_vcpu *vcpu, unsigned int cmd)
 {
 	struct ucall uc;
 
-	vcpu_run(vcpu);
-	switch (get_ucall(vcpu, &uc)) {
-	case UCALL_ABORT:
-		REPORT_GUEST_ASSERT(uc);
-		break;
-	default:
-		if (uc.cmd == cmd)
-			return;
-
-		TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
-	}
+	do {
+		vcpu_run(vcpu);
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			ksft_print_msg("From guest: %s", uc.buffer);
+			break;
+		default:
+			if (uc.cmd == cmd) {
+				ksft_print_msg("Expect ucall: %lu\n", uc.cmd);
+				return;
+			}
+
+			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
+		}
+	} while (true);
 }
 
 static void vcpu_run_expect_done(struct kvm_vcpu *vcpu)
@@ -122,8 +194,10 @@ static noinline void test_mmio_abort_guest(void)
 static void test_mmio_abort(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_mmio_abort_guest,
-							expect_sea_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_mmio_abort_guest,
+							  expect_dabt_handler,
+							  unexpected_iabt_handler);
 	struct kvm_run *run = vcpu->run;
 
 	vcpu_run(vcpu);
@@ -157,8 +231,10 @@ static void test_mmio_nisv_guest(void)
 static void test_mmio_nisv(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_mmio_nisv_guest,
-							unexpected_dabt_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_mmio_nisv_guest,
+							  unexpected_dabt_handler,
+							  unexpected_iabt_handler);
 
 	TEST_ASSERT(_vcpu_run(vcpu), "Expected nonzero return code from KVM_RUN");
 	TEST_ASSERT_EQ(errno, ENOSYS);
@@ -173,8 +249,10 @@ static void test_mmio_nisv(void)
 static void test_mmio_nisv_abort(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_mmio_nisv_guest,
-							expect_sea_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_mmio_nisv_guest,
+							  expect_dabt_handler,
+							  unexpected_iabt_handler);
 	struct kvm_run *run = vcpu->run;
 
 	vm_enable_cap(vm, KVM_CAP_ARM_NISV_TO_USER, 1);
@@ -205,8 +283,10 @@ static void test_serror_masked_guest(void)
 static void test_serror_masked(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_serror_masked_guest,
-							unexpected_dabt_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_serror_masked_guest,
+							  unexpected_dabt_handler,
+							  unexpected_iabt_handler);
 
 	vm_install_exception_handler(vm, VECTOR_ERROR_CURRENT, unexpected_serror_handler);
 
@@ -240,8 +320,10 @@ static void test_serror_guest(void)
 static void test_serror(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_serror_guest,
-							unexpected_dabt_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_serror_guest,
+							  unexpected_dabt_handler,
+							  unexpected_iabt_handler);
 
 	vm_install_exception_handler(vm, VECTOR_ERROR_CURRENT, expect_serror_handler);
 
@@ -264,8 +346,10 @@ static void test_serror_emulated_guest(void)
 static void test_serror_emulated(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_serror_emulated_guest,
-							unexpected_dabt_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_serror_emulated_guest,
+							  unexpected_dabt_handler,
+							  unexpected_iabt_handler);
 
 	vm_install_exception_handler(vm, VECTOR_ERROR_CURRENT, expect_serror_handler);
 
@@ -290,8 +374,10 @@ static void test_mmio_ease_guest(void)
 static void test_mmio_ease(void)
 {
 	struct kvm_vcpu *vcpu;
-	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_mmio_ease_guest,
-							unexpected_dabt_handler);
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_mmio_ease_guest,
+							  unexpected_dabt_handler,
+							  unexpected_iabt_handler);
 	struct kvm_run *run = vcpu->run;
 	u64 pfr1;
 
@@ -305,7 +391,7 @@ static void test_mmio_ease(void)
 	 * SCTLR2_ELx.EASE changes the exception vector to the SError vector but
 	 * doesn't further modify the exception context (e.g. ESR_ELx, FAR_ELx).
 	 */
-	vm_install_exception_handler(vm, VECTOR_ERROR_CURRENT, expect_sea_handler);
+	vm_install_exception_handler(vm, VECTOR_ERROR_CURRENT, expect_dabt_handler);
 
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_MMIO);
@@ -318,6 +404,49 @@ static void test_mmio_ease(void)
 	kvm_vm_free(vm);
 }
 
+static void test_ext_abt_guest(void)
+{
+	GUEST_FAIL("Guest should only run (I|D)ABT handler");
+}
+
+static void test_inject_data_abort(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_ext_abt_guest,
+							  expect_dabt_esr_handler,
+							  unexpected_iabt_handler);
+	vcpu_inject_dabt_esr(vcpu);
+	vcpu_run_expect_done(vcpu);
+	kvm_vm_free(vm);
+}
+
+static void vcpu_inject_invalid_abt(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+	int r;
+
+	events.exception.ext_iabt_pending = true;
+	events.exception.ext_dabt_pending = true;
+
+	r = __vcpu_ioctl(vcpu, KVM_SET_VCPU_EVENTS, &events);
+	TEST_ASSERT(r && errno == EINVAL,
+		    KVM_IOCTL_ERROR(KVM_SET_VCPU_EVENTS, r));
+}
+
+static void test_inject_instruction_abort(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm = vm_create_with_extabt_handler(&vcpu,
+							  test_ext_abt_guest,
+							  unexpected_dabt_handler,
+							  expect_iabt_esr_handler);
+	vcpu_inject_invalid_abt(vcpu);
+	vcpu_inject_iabt_esr(vcpu);
+	vcpu_run_expect_done(vcpu);
+	kvm_vm_free(vm);
+}
+
 int main(void)
 {
 	test_mmio_abort();
@@ -327,4 +456,6 @@ int main(void)
 	test_serror_masked();
 	test_serror_emulated();
 	test_mmio_ease();
+	test_inject_instruction_abort();
+	test_inject_data_abort();
 }
diff --git a/tools/testing/selftests/kvm/arm64/inject_iabt.c b/tools/testing/selftests/kvm/arm64/inject_iabt.c
new file mode 100644
index 0000000000000..0c7999e5ba5b3
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/inject_iabt.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * inject_iabt.c - Tests for injecting instruction aborts into guest.
+ */
+
+#include "processor.h"
+#include "test_util.h"
+
+static void expect_iabt_handler(struct ex_regs *regs)
+{
+	u64 esr = read_sysreg(esr_el1);
+
+	GUEST_PRINTF("Handling Guest SEA\n");
+	GUEST_PRINTF("  ESR_EL1=%#lx\n", esr);
+
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_IABT_CUR);
+	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+
+	GUEST_DONE();
+}
+
+static void guest_code(void)
+{
+	GUEST_FAIL("Guest should only run SEA handler");
+}
+
+static void vcpu_run_expect_done(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+	bool guest_done = false;
+
+	do {
+		vcpu_run(vcpu);
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			ksft_print_msg("From guest: %s", uc.buffer);
+			break;
+		case UCALL_DONE:
+			ksft_print_msg("Guest done gracefully!\n");
+			guest_done = true;
+			break;
+		default:
+			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
+		}
+	} while (!guest_done);
+}
+
+static void vcpu_inject_ext_iabt(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+
+	events.exception.ext_iabt_pending = true;
+	vcpu_events_set(vcpu, &events);
+}
+
+static void vcpu_inject_invalid_abt(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+	int r;
+
+	events.exception.ext_iabt_pending = true;
+	events.exception.ext_dabt_pending = true;
+
+	ksft_print_msg("Injecting invalid external abort events\n");
+	r = __vcpu_ioctl(vcpu, KVM_SET_VCPU_EVENTS, &events);
+	TEST_ASSERT(r && errno == EINVAL,
+		    KVM_IOCTL_ERROR(KVM_SET_VCPU_EVENTS, r));
+}
+
+static void test_inject_iabt(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+				ESR_ELx_EC_IABT_CUR, expect_iabt_handler);
+
+	vcpu_inject_invalid_abt(vcpu);
+
+	vcpu_inject_ext_iabt(vcpu);
+	vcpu_run_expect_done(vcpu);
+
+	kvm_vm_free(vm);
+}
+
+int main(void)
+{
+	test_inject_iabt();
+	return 0;
+}
-- 
2.50.1.565.gc32cd1483b-goog


