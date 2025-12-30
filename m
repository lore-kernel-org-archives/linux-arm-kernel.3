Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDD1EE57C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkXelmu7bqFxndg8qpo6pKIzfvXDHv9zHII5ienX1m4=; b=k4kSqFsrcDdAzTWnFpLAfEnlhl
	H2A3Q+8mnSCFrfGDtIT6mBJP88r4TUNafpYwi75gw3RyWEQth6Hd5qLAXltGZ4bILJWZ5iU7d9Rxv
	oVa/+f/XpE7qMsC6FyEHTZaBMf5dBFn3tbUgWat6KmAkYGVlohkI932XJOvngsWuJlSldLaQW/nZO
	u0/nIyrqiBchCwHVAIpTKUDlH5D9wqQ1FDW0aqBSkaUaUqvV72cioX5Rag6q2UEo79QeFE6whm1bT
	rnRYeUtSWCK8l3l5EH9nMnB/XApNNfodPTUydsmr1dv9HhVoGjTkcBwHgnIds5S9N5V8+sNKFHnHA
	+y3O1QBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vailH-00000005PPV-2w0n;
	Tue, 30 Dec 2025 23:04:19 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijU-00000005N6l-0Uy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:29 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso23582151b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135747; x=1767740547; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DkXelmu7bqFxndg8qpo6pKIzfvXDHv9zHII5ienX1m4=;
        b=pRNwwcMYMnJFIrL3H1L/3walyg8FeNdVtbvJVcyX+RVCzfWCHUqCxfHVAJkChTP9Ov
         7ydLv4+z0Q/bECbmcW+uWewUFt7UVaU4s3KzJwGc1Gaz8GeNVU39hNPqmaibbGakOwph
         xLmt8QmFPgrIs+5dJJDJuXVRTN8lplpCdtMSI4gCmd9JRZjTS5I1cuPtq9WGCcFUM01+
         t6BoYDSTyy/nk2VEAvhF7OVbzAStzSWuIDNwNssQxvmd4bBq/btCH+ONvnxvYuKZJqWn
         Nd1chCd/XJEL1ZiOKGUIfN2fR3ixULhZMTe3WPyrqCEpdKdQ36yy7tvqm2Ua+aDMgD2a
         e//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135747; x=1767740547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkXelmu7bqFxndg8qpo6pKIzfvXDHv9zHII5ienX1m4=;
        b=kxO5BBksAWDlI+/Awwpu86KAPzgc/23BWHt3PBPPRyN3AyzraldbS3zczOK6QVyN7L
         x5CFdKeGz/oM2MseRqEDiuzgQ2GxHEQdcLuNUVE/xEFxgD91uOOD8v/ve7RFpxa0RFrx
         7quQA2p+roqTK7Q2F7/raFwTWz4f5YHJLuEKl7H+R1SA9teZxVu+IF/RmXvNzHTqW6rV
         WpamyOF+5YpNd2iY01OOnnTa5nPh86jrRolc5YhIo5f3ehTpmlt8DJ5T7MoGLch5dVl3
         RafRq0U+7yyATq6Ko/VFxXVHWoSDm+IdopYqnH5PWWibqYEdW18OEPFWbwwR8nOO2P1c
         936w==
X-Forwarded-Encrypted: i=1; AJvYcCVhIl2Qv4fqfXp67MevviGFblNsKyFIMH2zPc/fDkf3kFtvURrsMthLnmUgznhucTIu6dCEBfqccfClAvj4kQNa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4z5VgP6qDfTNEmnltpnLkbFRcmgDajt9vV/C5Z/6mUd4Od9BD
	BNZut3U4IEppjzqAg8W13A9ZR9A5JpZxm/OzL0jHbLHHI9/5s5HVSI7iYG/kP6nrIAjHIt8wUqK
	qawNr9g==
X-Google-Smtp-Source: AGHT+IEInX/hcWFTn62wzbw74nK2yGoqn05dsItc6QCyzO/aFUt0jVk0kLNXelUPHMxHCU04rbTUsERgFgA=
X-Received: from pgav5.prod.google.com ([2002:a05:6a02:2dc5:b0:b55:6eb3:fd4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7346:b0:319:fc6f:8adf
 with SMTP id adf61e73a8af0-376a81e2c20mr34940934637.12.1767135747025; Tue, 30
 Dec 2025 15:02:27 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:48 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-20-seanjc@google.com>
Subject: [PATCH v4 19/21] KVM: selftests: Extend memstress to run on nested SVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150228_208082_4F23DD71 
X-CRM114-Status: GOOD (  12.79  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yosry Ahmed <yosry.ahmed@linux.dev>

Add L1 SVM code and generalize the setup code to work for both VMX and
SVM. This allows running 'dirty_log_perf_test -n' on AMD CPUs.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/lib/x86/memstress.c | 42 +++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
index 407abfc34909..86f4c5e4c430 100644
--- a/tools/testing/selftests/kvm/lib/x86/memstress.c
+++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
@@ -13,6 +13,7 @@
 #include "kvm_util.h"
 #include "memstress.h"
 #include "processor.h"
+#include "svm_util.h"
 #include "vmx.h"
 
 void memstress_l2_guest_code(uint64_t vcpu_id)
@@ -29,9 +30,10 @@ __asm__(
 "	ud2;"
 );
 
-static void memstress_l1_guest_code(struct vmx_pages *vmx, uint64_t vcpu_id)
-{
 #define L2_GUEST_STACK_SIZE 64
+
+static void l1_vmx_code(struct vmx_pages *vmx, uint64_t vcpu_id)
+{
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
 	unsigned long *rsp;
 
@@ -45,10 +47,34 @@ static void memstress_l1_guest_code(struct vmx_pages *vmx, uint64_t vcpu_id)
 	prepare_vmcs(vmx, memstress_l2_guest_entry, rsp);
 
 	GUEST_ASSERT(!vmlaunch());
-	GUEST_ASSERT(vmreadz(VM_EXIT_REASON) == EXIT_REASON_VMCALL);
+	GUEST_ASSERT_EQ(vmreadz(VM_EXIT_REASON), EXIT_REASON_VMCALL);
 	GUEST_DONE();
 }
 
+static void l1_svm_code(struct svm_test_data *svm, uint64_t vcpu_id)
+{
+	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
+	unsigned long *rsp;
+
+
+	rsp = &l2_guest_stack[L2_GUEST_STACK_SIZE - 1];
+	*rsp = vcpu_id;
+	generic_svm_setup(svm, memstress_l2_guest_entry, rsp);
+
+	run_guest(svm->vmcb, svm->vmcb_gpa);
+	GUEST_ASSERT_EQ(svm->vmcb->control.exit_code, SVM_EXIT_VMMCALL);
+	GUEST_DONE();
+}
+
+
+static void memstress_l1_guest_code(void *data, uint64_t vcpu_id)
+{
+	if (this_cpu_has(X86_FEATURE_VMX))
+		l1_vmx_code(data, vcpu_id);
+	else
+		l1_svm_code(data, vcpu_id);
+}
+
 uint64_t memstress_nested_pages(int nr_vcpus)
 {
 	/*
@@ -78,15 +104,17 @@ static void memstress_setup_ept_mappings(struct kvm_vm *vm)
 void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vcpus[])
 {
 	struct kvm_regs regs;
-	vm_vaddr_t vmx_gva;
+	vm_vaddr_t nested_gva;
 	int vcpu_id;
 
-	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX));
 	TEST_REQUIRE(kvm_cpu_has_tdp());
 
 	vm_enable_tdp(vm);
 	for (vcpu_id = 0; vcpu_id < nr_vcpus; vcpu_id++) {
-		vcpu_alloc_vmx(vm, &vmx_gva);
+		if (kvm_cpu_has(X86_FEATURE_VMX))
+			vcpu_alloc_vmx(vm, &nested_gva);
+		else
+			vcpu_alloc_svm(vm, &nested_gva);
 
 		/* The EPTs are shared across vCPUs, setup the mappings once */
 		if (vcpu_id == 0)
@@ -99,6 +127,6 @@ void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vc
 		vcpu_regs_get(vcpus[vcpu_id], &regs);
 		regs.rip = (unsigned long) memstress_l1_guest_code;
 		vcpu_regs_set(vcpus[vcpu_id], &regs);
-		vcpu_args_set(vcpus[vcpu_id], 2, vmx_gva, vcpu_id);
+		vcpu_args_set(vcpus[vcpu_id], 2, nested_gva, vcpu_id);
 	}
 }
-- 
2.52.0.351.gbe84eed79e-goog


