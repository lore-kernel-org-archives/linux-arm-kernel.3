Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2CBCF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxA90nGyzmSaiY6A5XGVLVAHyvsgTHRyJZyrvZboKIE=; b=M6aQ+EIUlLXwwZ6Nxqwj4Yy6Hp
	LVCNlvAx9T/wAy7yjxBMnrn1hvj4aLif5/XaVyWsZuf7LDBnfB5j75bHcBGUuhdo0BxAETVJvMV1H
	nxm2svo+DWq5lzbh7WU6kkMw1zIqgk4DmgJ30liT32Qta6ws46HUPyiDexvJNGBoY80yk2ABvLxV0
	7MVZVVleYjKlMjCun93gJGUAcZIxtxSdTljFQ3erjW/M7Tq6cVXa2tulHxgJqJTvWrVs+OgaVFX5O
	jNxCJtSWVrEHGGQZdLtqVbYjP6tKfdFXr8XR0lJqO9ToMx+OF3lTzLUNA3WcvcF8shIV55KG+LA8Q
	OUGFV43Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRQ-00000003Z6o-1IfH;
	Wed, 19 Nov 2025 15:49:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR9-00000003YoV-1b8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b31c610fcso5928709f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763567377; x=1764172177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxA90nGyzmSaiY6A5XGVLVAHyvsgTHRyJZyrvZboKIE=;
        b=U73SUbg1QROr95/Us5VYhu2B5SQlEXHMglBUPUq6+FLsXXnvm57O3pAVnFfuFzxWa0
         9ew8q0udWX6ZsQdZBft7WgFL/1TOhDO02//as1oQCBgi1AicCBEEbz8N16VGQ6ozsgQe
         rLYcoCzc6kI+eMqOa8CuRvdKcxJstGNyuUofLUey7NEs7O6HltvN9RQlYS/T3adWRcq8
         GDDcfLLz7n7TUboMSnPQvspm5zUhlpxj5HlTPfn8MY261P+tWQXExSeI7zIQM2GvYZAd
         vuYUk9oiV5YzVK9Pa7YylAKUO+EAxhsDmMtIVNUac+zmEdBcj4BPKsmsVYiJsTHNf2u2
         r1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567377; x=1764172177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxA90nGyzmSaiY6A5XGVLVAHyvsgTHRyJZyrvZboKIE=;
        b=t/DsWZ6mmYRAvghmKFE1EVemtYP6eRu5CQjUOcwHQJqswKlwKEPlsSsOU+Op92M8Ex
         o4znWSV5LdITYxr6BY2lJhnjxlt9+BDXzEDdH1oSmCZZabwXr+3yEGYskjKoMe5OOAu8
         yzPyMSA64TOB0Ope2PxsK88nw72f/A9kKTFZhOyiEJXR3P9cRZN41AAb96rg3HBK775f
         AmbNFMsp3+S0qJMUpiO/r5MsaNEewg5NBvhijhHnIg6i/wsG6TtH1LEWo+YAi6xFO+t+
         rDvNQ2pJttcjpKpgwS/pKTCzlOQO+ZUUG6GeqS95UIeEAPrYiNE+XzJiqg4ErJCpMO8/
         XWWw==
X-Forwarded-Encrypted: i=1; AJvYcCUOjOyn3yvSOPfjRAh+Q6ZtMNxGKL9pbHxw+GYO2+WnugIQwCzMJ3Rs0UrN08tQrTJKJeUL2Wv6QVlh7bozRRTS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc+2kOcY+AfZtjAY0mANR2O9xwrM0ch+0ywnhY6ky53oJ+V1YO
	rw0B8TJTM0V2uXsixUExe/s+Wc+46y9hZ+jfOL2Qty8oVUZgEOLYmOvi
X-Gm-Gg: ASbGncv+pZqx7p3SHZuzcuk/Rdu5iUdrNr8VdOwbdOHJ2lROyPvtAejHPK8ycwkjhxv
	F64K3gmBkbj96EKVwxBKFhxDOfiA9zxfF1nqkp3BkwaSgjls8JbBtdKrY7KGODiWvecEpGM7Yke
	RNAe3uUKnCX3h/RSolpgajygOkgpURXGyeB01o+Gw7kgZsv9PTe/pT1EtY9mrwzL/jCm5cIuPmj
	fKjummmViFm5yEqmec0ZKsGAK25x0YJ4xW22Uhh0BWdekV70TEhE4y7Roh0wIP/ifjYs0CWB8F2
	wwGQcO4/a8tkuzi2LMi/2FRv4cPlyJ0IkUKuUOtcxED1Qd37hFr+m+NyXe1Ql26vzBea0OiDg1c
	y/3BsOKrtBbLxOuPgdu2S1ThHnLDYShNhTOx34+wW5cVlLP80i5dN1yMRNNdkIDFImxeUEPgTfr
	bnAKgJBamyO94D9AN5VcMtWfR8vLK65p84+/J5VQuV885UB7EgBOj2QBum2rS3EJHgMg==
X-Google-Smtp-Source: AGHT+IEHRSEOlV/PjXO/es3oQjzN6p04w3tM9GnKGrsmunlZpgWhO8lg57u4CtlSOr65Ov1n2stQfw==
X-Received: by 2002:a05:6000:288d:b0:42b:5567:854b with SMTP id ffacd0b85a97d-42b59394d6cmr19768291f8f.45.1763567376680;
        Wed, 19 Nov 2025 07:49:36 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c9628ebacsm25969755f8f.30.2025.11.19.07.49.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Nov 2025 07:49:36 -0800 (PST)
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
Subject: [PATCH v3 3/3] KVM: selftests: Add option for different backing in pre-fault tests
Date: Wed, 19 Nov 2025 15:49:10 +0000
Message-ID: <20251119154910.97716-4-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119154910.97716-1-jackabt.amazon@gmail.com>
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074939_479299_C5A8F406 
X-CRM114-Status: GOOD (  13.74  )
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
index 674931e7bb3a..e1111c4df748 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -172,6 +172,7 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 base_gpa, u64 offset,
 struct test_params {
 	unsigned long vm_type;
 	bool private;
+	enum vm_mem_backing_src_type mem_backing_src;
 };
 
 static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
@@ -190,14 +191,19 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	uint64_t guest_test_virt_mem;
 	uint64_t alignment, guest_page_size;
 
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
 
 	guest_test_phys_mem = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
@@ -206,20 +212,23 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 #else
 	alignment = SZ_2M;
 #endif
+	alignment = max(alignment, backing_src_pagesz);
 	guest_test_phys_mem = align_down(guest_test_phys_mem, alignment);
 	guest_test_virt_mem = guest_test_phys_mem & ((1ULL << (vm->va_bits - 1)) - 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+	vm_userspace_mem_region_add(vm, p->mem_backing_src,
 				    guest_test_phys_mem, TEST_SLOT, test_config.test_num_pages,
 				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
 	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, test_config.test_num_pages);
 
 	if (p->private)
 		vm_mem_set_private(vm, guest_test_phys_mem, test_config.test_size);
-	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0, p->private);
+
+	pre_fault_memory(vcpu, guest_test_phys_mem, test_config.test_size, 0, p->private);
 	/* Test pre-faulting over an already faulted range */
-	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0, p->private);
-	pre_fault_memory(vcpu, guest_test_phys_mem + TEST_BASE_SIZE,
+	pre_fault_memory(vcpu, guest_test_phys_mem, test_config.test_size, 0, p->private);
+	pre_fault_memory(vcpu, guest_test_phys_mem +
+			 test_config.test_size - test_config.page_size,
 			 test_config.page_size * 2, test_config.page_size, p->private);
 	pre_fault_memory(vcpu, guest_test_phys_mem + test_config.test_size,
 			 test_config.page_size, test_config.page_size, p->private);
@@ -251,7 +260,8 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	kvm_vm_free(vm);
 }
 
-static void test_pre_fault_memory(unsigned long vm_type, bool private)
+static void test_pre_fault_memory(unsigned long vm_type, enum vm_mem_backing_src_type backing_src,
+				  bool private)
 {
 	if (vm_type && !(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type))) {
 		pr_info("Skipping tests for vm_type 0x%lx\n", vm_type);
@@ -261,6 +271,7 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 	struct test_params p = {
 		.vm_type = vm_type,
 		.private = private,
+		.mem_backing_src = backing_src,
 	};
 
 	for_each_guest_mode(__test_pre_fault_memory, &p);
@@ -270,10 +281,23 @@ int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
 
-	test_pre_fault_memory(0, false);
+	int opt;
+	enum vm_mem_backing_src_type backing = VM_MEM_SRC_ANONYMOUS;
+
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


