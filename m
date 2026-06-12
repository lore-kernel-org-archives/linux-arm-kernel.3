Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DA0CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tuh44YqrjzSlLd6mm7aQwU0y2sKDDLs9iqICVctwKS8=; b=iez3ArIsFzxmnZLW7WlAyFpppR
	ZeTf0e8Ldo9rXMOgl0qSndWVCzo76PTWz39kf9EbkPkwrhSKm7dUPIjtiR8cmDpwR7Aj0LIkXVRxH
	wgzDdOGHUWVB41KJy4VhmrwnFYZ7G1tX2ndnRx0xG0WE/sNkKJg5umv4R8c6BVvJ0Ol2V3yfXNzE4
	ByGc3RwIJd6MMXOcTDb18FD6yaEVRuB4dSyDUf+9atBLPHd3C07BUAsLTNthnFVwStdubXEsj9VGM
	c/7UT0CLFb0D05kfaOdwIyrSzQhsELaVvTXmok9UDVVLde+rQtxYus8ma9zvouP2BO7lv8CkYbifH
	Pm51QdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4gI-0000000BGaE-11M2;
	Fri, 12 Jun 2026 16:24:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4g8-0000000BGS2-1p02
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 16:24:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso4769425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281458; x=1781886258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tuh44YqrjzSlLd6mm7aQwU0y2sKDDLs9iqICVctwKS8=;
        b=fkliRqw5AE44mxa04S9mMdGD6hDJ7Vud/QB3OhpPPKQK3uzaOdHxJANUZ8c0PnIp4e
         uIZLVXsghVbw9lrh0y61lhVcuSNNcHt6fXr45Bkp4UHocZKbwy9MN85ET/KBpOI8s5Ti
         45fGDP8v39TEvBhtLktiUgYsEEhdperys+CYZjAqlJXOngZyg4QWg1+GLyhfrm5Re1cN
         pF2cyvgGmZMWlQROuvi9QCByGS3DJ2itvO/704+9AQoQdyWEaj4iA7VQIBJla6ldRj6v
         6AAr3rCXd9ZNJdTIzU1Drf4m+xIzSA/aCEYCCFDzaLdTNdzzPIWNwzBwWX5aW/bL9GQu
         Qg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281458; x=1781886258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tuh44YqrjzSlLd6mm7aQwU0y2sKDDLs9iqICVctwKS8=;
        b=MnaUEXIDg+YDwasyOQL1Z0DNredsewyZF16ZixGwY54vYOq2SxknzJ2YyitqX1WpJT
         EoNvj8VV+m2QABCbALBNzOaw5GMceF4uE5aS9uAiK4skEU8SfbQakoAq5aEG0ZO5F/BX
         9C+YxUoCCO13QlRx7Nw2S/CZcB8jbYIDAWUwhZYkOsOYUidhxyoL7cpTetb70ZLID3lc
         Dr7drGVt5fvEMNXNFrfcLE/QliLD9CkWeyFmBPSsOpcThNqdWdt60gyjM5q1TXoULnow
         bypVNMuwyIO8095rdD+uapBS6Dy+9VX+ir4oJ2KVmCU6D9ctWck7k9QLGj0ZclynB4m0
         2ziQ==
X-Forwarded-Encrypted: i=1; AFNElJ999vIDrsm5vOfi10LK/3IooMrgVULrT08zTIGfHGJU2EkW3VV3y5WcPwmYkWk2+5JNnN4EAw0y95llg/4S7w2Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJm9xXoKC29qnSZtIGJQVMycjxTVqpbZUejlel9AIBQ3jFYSM
	bTGETtFG70vxZUGOb3CdcX6kRG9cTpJlkTutVlrhCiiwvSlzgL8U6QU2
X-Gm-Gg: Acq92OFMJGlhRk0ayDXjYG2xANk4/heL6H4ZvRK0QWYc455qnu2HZeRRSwReFwfwVsN
	RpiZ27PfDIbh7YhhDNp8joKakPPMTXhspn8pV0nAkLYFdWbMXIJDxAUSW+OqA3zqZs9AwgEGzOy
	6EhDYbCaP7/HD2xG/WsRGzKHgJ9x/bnKoaii8xySAvFew7NTvuQH63RlYZCX+rw+HBPj/end1iy
	WrK7aMvV2W8KChMb/Mkrs1D8i146NE/NTNWhBkSq+B+hUE5VouYsgbVUS9BKmOAD4KRwQyUReuu
	CrBpvc7tNTmYExbYI+F+rGL/5OfaNti+LtQ6+QRBmPXbzdYYHUXIwGH1P0vwGgnLqcce4oapmcv
	wl05hyeq58t1AM+yx67K6gvMTdBqaR4iOwx6Jpd5Z9jVj4shXDUfYhJfDAxtorOM+g+L/NU8XTV
	SXcSlGgP41eS+HngG2uauj+zhNVeL1rGVOREcO5yB2AGxdjWw0OFb/fdqplItzKA==
X-Received: by 2002:a05:600c:468d:b0:490:9588:bdae with SMTP id 5b1f17b1804b1-490ec4ee664mr53299705e9.18.1781281458289;
        Fri, 12 Jun 2026 09:24:18 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c51dsm57620935e9.1.2026.06.12.09.24.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 12 Jun 2026 09:24:18 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net,
	vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com,
	Jack Thomson <jackabt@amazon.com>
Subject: [PATCH v5 4/5] KVM: selftests: Add option for different backing in pre-fault tests
Date: Fri, 12 Jun 2026 17:23:52 +0100
Message-ID: <20260612162354.73378-5-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260612162354.73378-1-jackabt.amazon@gmail.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092420_518371_0DF4F4C6 
X-CRM114-Status: GOOD (  15.05  )
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

Add a -s option to specify different memory backing types for the
pre-fault tests (e.g. anonymous, hugetlb), allowing testing of the
pre-fault functionality across different memory configurations.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 .../selftests/kvm/pre_fault_memory_test.c     | 51 +++++++++++++------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 9f5f0d1a5db1..c850cf28e86a 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -45,6 +45,7 @@ struct slot_worker_data {
 	struct kvm_vm *vm;
 	gpa_t gpa;
 	u32 flags;
+	enum vm_mem_backing_src_type mem_backing_src;
 	bool worker_ready;
 	bool prefault_ready;
 	bool recreate_slot;
@@ -65,14 +66,16 @@ static void *delete_slot_worker(void *__data)
 	while (!READ_ONCE(data->recreate_slot))
 		cpu_relax();
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, data->gpa,
+	vm_userspace_mem_region_add(vm, data->mem_backing_src, data->gpa,
 				    TEST_SLOT, test_config.test_num_pages, data->flags);
 
 	return NULL;
 }
 
 static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
-			     u64 size, u64 expected_left, bool private)
+			     u64 size, u64 expected_left,
+			     enum vm_mem_backing_src_type mem_backing_src,
+			     bool private)
 {
 	struct kvm_pre_fault_memory range = {
 		.gpa = base_gpa + offset,
@@ -83,6 +86,7 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 		.vm = vcpu->vm,
 		.gpa = base_gpa,
 		.flags = private ? KVM_MEM_GUEST_MEMFD : 0,
+		.mem_backing_src = mem_backing_src,
 	};
 	bool slot_recreated = false;
 	pthread_t slot_worker;
@@ -172,11 +176,13 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 struct test_params {
 	unsigned long vm_type;
 	bool private;
+	enum vm_mem_backing_src_type mem_backing_src;
 };
 
 static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 {
 	gpa_t gpa, gva, alignment, guest_page_size, host_page_size;
+	gpa_t backing_src_pagesz, mem_page_size;
 	struct test_params *p = arg;
 	const struct vm_shape shape = {
 		.mode = guest_mode,
@@ -188,24 +194,28 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	struct ucall uc;
 
 	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(guest_mode));
+	pr_info("Testing memory backing src type: %s\n",
+		vm_mem_backing_src_alias(p->mem_backing_src)->name);
 
 	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
 	guest_page_size = vm_guest_mode_params[guest_mode].page_size;
 	host_page_size = getpagesize();
+	backing_src_pagesz = get_backing_src_pagesz(p->mem_backing_src);
+	mem_page_size = max(host_page_size, backing_src_pagesz);
 
 	test_config.page_size = guest_page_size;
 	test_config.test_size = align_up(TEST_BASE_SIZE + test_config.page_size,
-					 host_page_size);
+					 mem_page_size);
 	test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
 
 	gpa = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
 	alignment = SZ_2M;
-	alignment = max(alignment, host_page_size);
+	alignment = max(alignment, mem_page_size);
 	gpa = align_down(gpa, alignment);
 	gva = gpa & ((1ULL << (vm->va_bits - 1)) - 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+	vm_userspace_mem_region_add(vm, p->mem_backing_src,
 				    gpa, TEST_SLOT, test_config.test_num_pages,
 				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
 	virt_map(vm, gva, gpa, test_config.test_num_pages);
@@ -213,14 +223,18 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	if (p->private)
 		vm_mem_set_private(vm, gpa, test_config.test_size);
 
-	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0, p->private);
+	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0,
+			 p->mem_backing_src, p->private);
 	/* Retry the same range after the first prefault attempt. */
-	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0, p->private);
+	pre_fault_memory(vcpu, gpa, 0, test_config.test_size, 0,
+			 p->mem_backing_src, p->private);
 	pre_fault_memory(vcpu, gpa,
 			 test_config.test_size - host_page_size,
-			 host_page_size * 2, host_page_size, p->private);
+			 host_page_size * 2, host_page_size,
+			 p->mem_backing_src, p->private);
 	pre_fault_memory(vcpu, gpa, test_config.test_size,
-			 host_page_size, host_page_size, p->private);
+			 host_page_size, host_page_size,
+			 p->mem_backing_src, p->private);
 
 	vcpu_args_set(vcpu, 1, gva);
 
@@ -249,11 +263,13 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
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
@@ -267,23 +283,28 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 static void help(char *name)
 {
 	puts("");
-	printf("usage: %s [-h] [-m mode]\n", name);
+	printf("usage: %s [-h] [-m mode] [-s mem-type]\n", name);
 	puts("");
 	guest_modes_help();
+	backing_src_help("-s");
 	puts("");
 }
 
 int main(int argc, char *argv[])
 {
+	enum vm_mem_backing_src_type backing = DEFAULT_VM_MEM_SRC;
 	int opt;
 
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "hm:")) != -1) {
+	while ((opt = getopt(argc, argv, "hm:s:")) != -1) {
 		switch (opt) {
 		case 'm':
 			guest_modes_cmdline(optarg);
 			break;
+		case 's':
+			backing = parse_backing_src_type(optarg);
+			break;
 		case 'h':
 		default:
 			help(argv[0]);
@@ -293,10 +314,10 @@ int main(int argc, char *argv[])
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
 
-	test_pre_fault_memory(0, false);
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


