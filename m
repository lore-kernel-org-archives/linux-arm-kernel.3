Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB67C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ca5XEEBBkHI7wnxKesidI9Ic1vb2lLJagV9Bw44j+oc=; b=fYfzNq1WcCmSYUBiLnMINpIoy0
	QC90Hp9XslpvbfwmI+nevGQoaYsqOt2hdgNdDJ90mxDwtb5Aomq2bymaYAqJNXBTEq7An0NWgGE+P
	5bx+Z86mF6LnSPhC/KWjNhrEh7CO4SB4NdjSHJmczebC/zs6hEiS3S9NL8d1u6q+eYVeGa7HguuOA
	IJY45qG1loLRD9TJqYBQh5eS7myxe4fN9JY0jse25KYbY5S4jXYebv5vvYAFdR1KjMQvcsxTZUtTG
	XHL1JL89JUzq2sdzm91atVbeOekW3rXtQwiuvfpK/AKkEkebjInF96aduDgeX30GI2WqKNNsrnW9i
	QJFcX9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgZx-0000000CcbV-49PF;
	Wed, 04 Jun 2025 05:22:21 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgNE-0000000CbKu-427Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:09:14 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-747ddba7c90so2576940b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 22:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013752; x=1749618552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca5XEEBBkHI7wnxKesidI9Ic1vb2lLJagV9Bw44j+oc=;
        b=bo44J4bqeXG7p2vjJUF2VsivqDK9vx+zZ2oMoI1vZKQKvgPkgqxK7Hz9OfP6KiNodD
         M5kM3zICI3XKrjFWMpZLbWf7Z8OlFpfHTbRRBt/db2QVwQhGwaKI2U+11lHnwyFDm9aP
         DKsDWkSQL3DgJJ64ytU+iMDUiOTGCh53pD3pRnGOREa5w+qsA8dNDpqlgZu/35UbB0Uq
         k27EIaWaLmPmwpyG/jZphG4RWOd4pZVQYaSvuBeDiWaSGaS4OoiAhXBdCfn4TybSUaMb
         e+zaMuKNpxr73IfTuDzCM3uEgPiMwFYNbhu/q+CfOMb4r6dtcF3PcNK033YmSYPLBz9t
         J56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013752; x=1749618552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca5XEEBBkHI7wnxKesidI9Ic1vb2lLJagV9Bw44j+oc=;
        b=xQu9LbVVO+ndQNm2w035mY5+tXSYrRVl7iKW0aa7svJda8nKwXVu6WFrRpE8rhm8Ej
         suGOUAgDvb+HsKhTPTdtEr2EsbI4Nff0Tog91zd0X2yRkjlqTUYkB9hX6MRyxnAg9Ncx
         yxsc50VI+oHy9xBpRw5BnfEJLc1I3of2V7tSv337Fm6+yvTOUZQMERhSgoGVssNx/lVn
         K879o51TPqwabCMsnGfdOL3aYFb0CNqYu5p/rjMqLA2ZX/U5L/p+FwHnqTkREIbR/Cdd
         nDWuT3Og/SmtlJ3tUJNQgxTPco076SAvX17SOpE6Xtn2r8R0qS78iFdNwZNpzzNy76Eh
         gEEw==
X-Forwarded-Encrypted: i=1; AJvYcCUVpfbZyOoLB8L2sKi3g0XcKQLApXokqUMgGyQaXc1c47gAmPgrVv6t8bi0dyvKWbH9O8iPOs3mi3njyKOmsziF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6kq0lFDkF9hZ2gRvn9jlf2+NWEaH6Uap9yuzn4MKbaC2Su444
	Gymt+lonut6QZH9uo13UoZSA9xSNs2oo9jpVURFB685KexZH6vfgpN0r0iuXYdhSO+T8hOBQyzA
	JWaEfgtecp4gcqg==
X-Google-Smtp-Source: AGHT+IGY9FewZRutQWX3kPabe7vpLnmhGCzy5qRwLJrwts22IIPU9KOO/oVkiPw3lXzpgoETazm1TXUFA3gKDg==
X-Received: from pfblr56.prod.google.com ([2002:a05:6a00:73b8:b0:747:a8ac:ca05])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e18:b0:730:9946:5973 with SMTP id d2e1a72fcca58-7480b200bf5mr2177985b3a.5.1749013751697;
 Tue, 03 Jun 2025 22:09:11 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:09:00 +0000
In-Reply-To: <20250604050902.3944054-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-6-jiaqiyan@google.com>
Subject: [PATCH v2 5/6] KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_220912_998109_AC0AAC24 
X-CRM114-Status: GOOD (  16.38  )
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
instruction abort into guest. The test injects instruction abort at an
arbitrary time without real SEA happening in the guest VCPU, so only
certain ESR_EL1 bits are expected and asserted.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 tools/arch/arm64/include/uapi/asm/kvm.h       |  3 +-
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/arm64/inject_iabt.c | 98 +++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c

diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index af9d9acaf9975..d3a4530846311 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -184,8 +184,9 @@ struct kvm_vcpu_events {
 		__u8 serror_pending;
 		__u8 serror_has_esr;
 		__u8 ext_dabt_pending;
+		__u8 ext_iabt_pending;
 		/* Align it to 8 bytes */
-		__u8 pad[5];
+		__u8 pad[4];
 		__u64 serror_esr;
 	} exception;
 	__u32 reserved[12];
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9eecce6b8274f..e6b504ded9c1c 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -149,6 +149,7 @@ TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
 TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
 TEST_GEN_PROGS_arm64 += arm64/host_sve
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
+TEST_GEN_PROGS_arm64 += arm64/inject_iabt
 TEST_GEN_PROGS_arm64 += arm64/mmio_abort
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
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
2.49.0.1266.g31b7d2e469-goog


