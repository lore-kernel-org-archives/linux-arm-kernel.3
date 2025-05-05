Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5281C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoM9DcHdqZBj+rk9l05sHHopuoPZxH677juEX9RJpMg=; b=RJed2Bza6HcNSxbCs4Yb4whxb7
	RrSgpe5y0lIHHIDuJA7l2sPVe0fs6z0TZHg+e6NauZ5Q96sD3QGUTMJhqsUFKAtZqYhudKfnacd5M
	N3XLwTjL49C+2ozu6XpaRvjcHVKkmWtx0HVmw7ymh6g7EjvnYb/F5R1Q7OGmPLnxAH4P6QFEpzLwk
	NAFK3LB1VSQ5ZQ0KpUAeliRBSNR7887EosPOkxwM/k+RDnQe87faV/eZDCQ9NTefBaXfamaYZQGu7
	reJM8TVNcwBAnXJfHJaLpAd2HH0On9lDvqlutqQtGy7auQV8uwRPNIPVyJ2aS04P5o4CQsbI3i91a
	iCYqyhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByly-000000080GY-1RM2;
	Mon, 05 May 2025 16:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySd-00000007wNj-22Lp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 May 2025 16:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qoM9DcHdqZBj+rk9l05sHHopuoPZxH677juEX9RJpMg=; b=iYaqHq3VW+MYqa/QEXPPDThVYJ
	31vxJNDSmUozQkX5dRAbIs0IAGfmL0SnKX6AGJZ5xHLLz9FE9hBEwJR3efZ6jVJfwhOklpTyXQc6k
	E18TqFHS3DDkoOHI4jx/gk2eW1r20+L+DoDe7HDMRJEFD4s2ubz2VTyQEvsGrUh1chajqgpNRqEGB
	PluBZW/pJYIzsZiAkh72eyP8TTWqacW7krxgFgRGbZf+ZYwbbCe43bZhmLduqxpQUgHDYAA57rCF7
	2s4lAReLKL2LbpX+fjmlwQuYw9OIIROChsCUFj1pm5j7ANT6CbsYlou4T546AbbpAEeiXbQ5o1rR/
	deQ+XfaQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uBySZ-0000000FVjh-1WNG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:29 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-224347aef79so63718265ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461663; x=1747066463; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qoM9DcHdqZBj+rk9l05sHHopuoPZxH677juEX9RJpMg=;
        b=4Voxu91TshS7v0v6V044TMNKvQRpnbMZ9ezAyy4apodNDPaVnl8mKZgu3MwGE5QHcE
         fawuDr/ytgLYrL704jOe4LQsdAkyAi2ohoD2MSHEbHsa5XPsQouDN4oX2Utf02dqJrrW
         xNPKSrdnCwrlkmjla5/Bylnm//ILsxCk8aThNtnG9axIcmZTzY80S45XpWeUG5+7G0z/
         EZTYuJkkE1DDSBfwITFijQzUi79pELF7xHR40XdeEMZKgDIw9+dz7rZuq52EI3WP6+fM
         g3I9srcEoT9Msw9nQ5lqoVHuYv6uYKhq47r1bfg0yKMmLnJv5w5TFlWydzzUwi0OixA2
         0a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461663; x=1747066463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoM9DcHdqZBj+rk9l05sHHopuoPZxH677juEX9RJpMg=;
        b=lU+eaXHkSVFhu77jKwvsQoZDzlDm6t0VJ4l/mA7c4TmItVSONZ983ijaZBb4ppfE7f
         M+d0OfJQM1pxAzE+lpNWLtEP2oT1ql/1OeDZ365DTSzieS6f0x++T+mbugugTsqVaS4x
         5Kk37wF/45nMgIaWdVlRuQw8fzAp9pzViqgojVOac10egQLov+u7WQ4EygN6tJ8bo2X6
         PKRpWFt7SKHjHNuTIK0XVggakugnk5gCL6r0K7mAQa+2eHlzAwEhwp9a/DDbXBUtaqYm
         LOyTiuc8dvRwUQlEiEBbzOycKdmwrRAXnbB/pHoIdO9fv+z6pvD0BLC9D5qmhdWyJhJy
         e3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUXsc1q8qEHt9hhMKK3H7Szi7sqt/W+JGA0cyMzTsaKbK4tJ/fSKZJZCWiFdjd12Hrpc4mpeUr6RBXjyCklbGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZevcJe14kySLa0F0arQ4P3NxEenYWp4kq4RVISvXBfGbIax35
	JK6zTBwGEckwA0mUrWl8NzoSYUKpmxaxgRkJMdn+t8a72vCjATZ55FY5m6QJ+Iyf14tfQ0+Vcrx
	Ikq6cFeUDBg==
X-Google-Smtp-Source: AGHT+IFZMxB5zKbz0DCB224XcS28TLNRLHuTk3G5CmkpWtkGxQ7uQKT12C81gz2CRUWIcDMNDv5x3jsR5vZQHg==
X-Received: from pfbdh13.prod.google.com ([2002:a05:6a00:478d:b0:739:485f:c33e])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2383:b0:21f:52e:939e with SMTP id d9443c01a7336-22e18bc4033mr159804055ad.28.1746461662677;
 Mon, 05 May 2025 09:14:22 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:11 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-6-jiaqiyan@google.com>
Subject: [PATCH v1 5/6] KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
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
X-CRM114-CacheID: sfid-20250505_171427_748747_831A00AA 
X-CRM114-Status: GOOD (  17.96  )
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
certain ESR_EL1 value can be expected, but not the case for FAR_EL1.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 tools/arch/arm64/include/uapi/asm/kvm.h       |   3 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/inject_iabt.c | 100 ++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
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
index 16d2e9f32619f..708fd126a36dd 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -148,6 +148,7 @@ TEST_GEN_PROGS_arm64 += arm64/aarch32_id_regs
 TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
 TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
+TEST_GEN_PROGS_arm64 += arm64/inject_iabt
 TEST_GEN_PROGS_arm64 += arm64/mmio_abort
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
diff --git a/tools/testing/selftests/kvm/arm64/inject_iabt.c b/tools/testing/selftests/kvm/arm64/inject_iabt.c
new file mode 100644
index 0000000000000..43b701e9143c2
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/inject_iabt.c
@@ -0,0 +1,100 @@
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
+	GUEST_PRINTF("Guest SEA esr_el1=%#lx\n", esr);
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_IABT_CUR);
+	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+	/*
+	 * We inject IABT but there is no SEA in guest at all,
+	 * so guest should see FnV == 1, which is set by KVM.
+	 */
+	GUEST_ASSERT(esr & ESR_ELx_FnV);
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
+		case UCALL_DONE:
+			ksft_print_msg("Guest done gracefully!\n");
+			guest_done = true;
+			break;
+		default:
+			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
+	}
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
2.49.0.967.g6a0df3ecc3-goog


