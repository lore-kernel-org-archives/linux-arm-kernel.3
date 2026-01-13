Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87860D2F33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClV6xb3uKauwGoOx6LpIuCiwNxs8C5+P0pKaRtPxBMQ=; b=POKTOJB1HCksLxwwXqxA82VTZJ
	sBGgwT8h1mbF37VR9UqahGgPNmsWsRZ12V++Gdc2IG6fjIWFGtuAmt6ez7AOIrg7aWxi7aHq9shl2
	CeWl0upZnY4xRFG88x5y/4QYuHWuEb6wNCweYYCN4ucXYUwbyTsGVJCuRVTmYD55gPNaJvuJAfbqD
	fYBsFk5vl07LZnF9kaDEI7qaPdDBWsvjSF2/hr2QUfoeyyUyn6PW/5zhGzANH3Ww+f2meraP0BfG1
	+6xKeboLzPyIrJxaaCS+6ZNy/EcTLGRAhNXSEuuv4Xh2MCNiIdXnjT1qmH4ZBdUadOTTPuawKWTaB
	PyQrDNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJG-00000007Mlk-2x98;
	Tue, 13 Jan 2026 15:27:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJ8-00000007Mfa-1XGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:27:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47774d3536dso56925995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318065; x=1768922865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClV6xb3uKauwGoOx6LpIuCiwNxs8C5+P0pKaRtPxBMQ=;
        b=iU0/ImPP3wl+/EiFu20dFqtMWCgz2pFxFGphfKOI+GgTT6F13haiakPsZ9I4qIuLYJ
         /ONt7upJaOAw6epN45M8Ha+peKCjllVLzq6fOoPbCyAUdvWXhQdtF3tARN6k1cKQSb/l
         pTtaHyawwwwPchBa31miBhOzOgJgioWQYFuiF7e89Mvpn6ph5ihQzrBs+y5lp4SPQ51H
         n3LJ/cjtB0QezKKwHzCWCXVjOQmzG0LNXeNUBLR5tCN20kvEo+YeBNt0w732m0gwUPuX
         1DkxMN5gEjxjNlcp3aJrZ8tBCLhhbQXf1H44ReOykIz667VTD8N5iQmxHIcfNL/KXeBd
         SwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318065; x=1768922865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClV6xb3uKauwGoOx6LpIuCiwNxs8C5+P0pKaRtPxBMQ=;
        b=WdwIHiNNxDirpZsJWtbqQgMoHwtB4IpFsUiMhgd6e+HXrp5ld1wSwupW3kHakITSoM
         vXGSuQbNAy02b6d17ZI41x1eXIKKBwJAGWvC2MTX+JwhKsWpE9aFKce9c7tPW4YaLUjp
         HRJvnicKLr0KLCWhwkv5TnfU1scgGB+7fmfbFTe/9YU3oMBeOvcmM7kVniU9FTZvLpgT
         2gxlR6M4VuS4eh4M9smTwlBvFvvPIUUQljY4YYEjgqttfwYcaPUuu7JD8YbXLanFgl6A
         9mwzvxl8HrW2B4/1gCjBcM7F8afn1Y7TYHe5eXrryl+5mQQ6BRSokDLDqKqUH0uIaE2A
         tHUg==
X-Forwarded-Encrypted: i=1; AJvYcCXPro25sQf1LwukBoc6fOtpgmoP5jsW9ELxZEyUJpWur1s8LIyv80JwCV2NsSgFybRXoG2MFVv1sfU1YtrIxZgI@lists.infradead.org
X-Gm-Message-State: AOJu0YwOzsAMIL5zWDwW6Z/72pKXmzXuU7tGc00yymV5r0mLYfjH6Fa8
	YcB2aIskwVSU/MTlpk32lSMEWTiBlhEDP7qgcF8S5DCSvH2DS0CoVJMj
X-Gm-Gg: AY/fxX44U5x/yasGIIe64IOqaHd5v1Zu3/heEqcRRPdX6nTpjHYktwxwY9EOUg5ZtVM
	cHBpODNxm04et1inA9wDQULtrJJV3S3ZtdqM1q6ZR0BoR+z3jQw/tmvvvse+B/yV8hx86YwkwtE
	czQVGoJcPYYxMQh5ZVCFk/4IKx5CeqVmi0cKrs3jP0oqwlav5XnfWQzgdVyJ6BT7pifjwxCD1Im
	8kRTyeBArr2tBf1tgPbsq+MHvS/cCp7r18BXA4GmkBZsxfg2H+kdXgZxLBDH1mROSWBfVu6WWqk
	6c3R47XnD9Qt2tZo6vrZ3Zbm1sv9vHeB+DzEJHEie0+g09IigzlgZJKZ8pPHbEEB+l0tnxOmU8v
	cJ8eJjjY7amE2NjW9wF2PA+DsJi907Q4NtI9glYD5IVekhOH3t5gz56uq+GXUtcEJCSdt81qOu2
	qbnx2buIvy+oa5g0AJsXmVmw+Ne84Gp2z4sk7rDVfvKFwqDLLRsnvTlTwPLC13YwKfGQ==
X-Google-Smtp-Source: AGHT+IFPYD4aUkgLw+ElK2nCfQAn3fMA8ZdORSxU/HjmPMO8JbFroHKdhuJYQgeH2rPGmtTppuBJ8Q==
X-Received: by 2002:a05:600c:1391:b0:477:a219:cdc3 with SMTP id 5b1f17b1804b1-47ed7cccaa3mr41796735e9.12.1768318064610;
        Tue, 13 Jan 2026 07:27:44 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm421025325e9.2.2026.01.13.07.27.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 07:27:44 -0800 (PST)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v4 3/3] KVM: selftests: Add option for different backing in pre-fault tests
Date: Tue, 13 Jan 2026 15:26:42 +0000
Message-ID: <20260113152643.18858-4-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152643.18858-1-jackabt.amazon@gmail.com>
References: <20260113152643.18858-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072747_294436_D6BA4884 
X-CRM114-Status: GOOD (  13.65  )
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

From: Jack Thomson <jackabt@amazon.com>

Add a -m option to specify different memory backing types for the
pre-fault tests (e.g., anonymous, hugetlb), allowing testing of the
pre-fault functionality across different memory configurations.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 .../selftests/kvm/pre_fault_memory_test.c     | 42 +++++++++++++++----
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index be1a84a6c137..1a177f89bc43 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -172,6 +172,7 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 struct test_params {
 	unsigned long vm_type;
 	bool private;
+	enum vm_mem_backing_src_type mem_backing_src;
 };
 
 static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
@@ -187,14 +188,19 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	struct kvm_vm *vm;
 	struct ucall uc;
 
+	size_t backing_src_pagesz = get_backing_src_pagesz(p->mem_backing_src);
+
 	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(guest_mode));
+	pr_info("Testing memory backing src type: %s\n",
+		vm_mem_backing_src_alias(p->mem_backing_src)->name);
 
 	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
 	guest_page_size = vm_guest_mode_params[guest_mode].page_size;
 
 	test_config.page_size = guest_page_size;
-	test_config.test_size = TEST_BASE_SIZE + test_config.page_size;
+	test_config.test_size = align_up(TEST_BASE_SIZE + test_config.page_size,
+					 backing_src_pagesz);
 	test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
 
 	gpa = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
@@ -203,20 +209,23 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 #else
 	alignment = SZ_2M;
 #endif
+	alignment = max(alignment, backing_src_pagesz);
 	gpa = align_down(gpa, alignment);
 	gva = gpa & ((1ULL << (vm->va_bits - 1)) - 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+	vm_userspace_mem_region_add(vm, p->mem_backing_src,
 				    gpa, TEST_SLOT, test_config.test_num_pages,
 				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
 	virt_map(vm, gva, gpa, test_config.test_num_pages);
 
 	if (p->private)
 		vm_mem_set_private(vm, gpa, test_config.test_size);
-	pre_fault_memory(vcpu, gpa, 0, TEST_BASE_SIZE, 0, p->private);
+
+	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0, p->private);
 	/* Test pre-faulting over an already faulted range */
-	pre_fault_memory(vcpu, gpa, 0, TEST_BASE_SIZE, 0, p->private);
-	pre_fault_memory(vcpu, gpa, TEST_BASE_SIZE,
+	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0, p->private);
+	pre_fault_memory(vcpu, gpa,
+			 test_config.test_size - test_config.page_size,
 			 test_config.page_size * 2, test_config.page_size, p->private);
 	pre_fault_memory(vcpu, gpa, test_config.test_size,
 			 test_config.page_size, test_config.page_size, p->private);
@@ -248,11 +257,13 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	kvm_vm_free(vm);
 }
 
-static void test_pre_fault_memory(unsigned long vm_type, bool private)
+static void test_pre_fault_memory(unsigned long vm_type, enum vm_mem_backing_src_type backing_src,
+				  bool private)
 {
 	struct test_params p = {
 		.vm_type = vm_type,
 		.private = private,
+		.mem_backing_src = backing_src,
 	};
 
 	if (vm_type && !(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type))) {
@@ -265,14 +276,27 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 
 int main(int argc, char *argv[])
 {
+	enum vm_mem_backing_src_type backing = VM_MEM_SRC_ANONYMOUS;
+	int opt;
+
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
 
 	guest_modes_append_default();
 
-	test_pre_fault_memory(0, false);
+	while ((opt = getopt(argc, argv, "m:")) != -1) {
+		switch (opt) {
+		case 'm':
+			backing = parse_backing_src_type(optarg);
+			break;
+		default:
+			break;
+		}
+	}
+
+	test_pre_fault_memory(0, backing, false);
 #ifdef __x86_64__
-	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, false);
-	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, true);
+	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, backing, false);
+	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, backing, true);
 #endif
 	return 0;
 }
-- 
2.43.0


