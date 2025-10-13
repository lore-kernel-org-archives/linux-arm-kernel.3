Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB81CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzQnDluOQWqcbRXyu07+4Pf89SEymkI9ph5TfK7+5co=; b=RmR+52fPliEivK+AkEqUZT4DST
	esc401vCnjSGNXTxCBtMVL3lK853LrgNMkVt7hvEtiZ4VOP4sLS/c55jaP8Fzy0IKC9lzUqsKpg5b
	Av5+ff2qQ+I7PScpcCwbcHpKKxJmABXHW+yIbI6fwaPzCi47CiacNNwjPTCz/WqFRcHom/DNl4bp1
	s0YYyrMmI8tv6Tbsxz+gI0R98jzN1nWru1rL1DMPoVIvP5u1jV2ieAPKJRdin89/TeT8CuRF30LR4
	gE5ZbfevqtK5lsGxSGBXsZ1ReLLMwEoYxfs+uRDRtr7d1GGPOZhjyKnCsckY5IzpSffEeXeRMK5Rt
	Ilth/Fkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH9-0000000DbAE-0XpC;
	Mon, 13 Oct 2025 15:15:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KH6-0000000Db75-2bFI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:15:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46f53f88e0bso24181275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760368547; x=1760973347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzQnDluOQWqcbRXyu07+4Pf89SEymkI9ph5TfK7+5co=;
        b=hmKw15BwbU680WCbcoBNjMNx8w75GcH1PBMdbry5XukaQqEaYfWMEHWYt0pRp7SsRJ
         5qMG2Xd8LkWEQxshLAmGII0pfQNYl1ZwLiyFz79MUnW3u0SkzcPP931fHcNmrZLEdtZ9
         cCO5sJiI8QCDGJbOM9IsodvcOpZGzcQlmHsg7xfIXmOZ8X80Ru2xTBQuddnFZSBwzGgu
         2XBStDXaNGmMp9J4Fvf0UCjt3qdVLLH4Atm13N8bR5kHvXBFHGm1TaCUPeuQBWHtr9iB
         IgwrTSkyXVe32EkE7PS6JnggLpw2kxnYlHFdWtpLfedF1k8weatKEVd+8pzq9UXO0FoM
         X5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368547; x=1760973347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzQnDluOQWqcbRXyu07+4Pf89SEymkI9ph5TfK7+5co=;
        b=aj+oninpEze8YxqYMC+keyj9X5LTZlgCqM7STp6SR9+6Pm6zXQcYcEjeaoW16n9jlB
         6o+HJPeFhq/vOnlqgygO9N+iM+DRdqkUaQto0BYWGf9BIKbAeTMYqIanJdSZGQ9rKHEx
         3ImTzLI69xgcVfhsgyJWs8XNHD8Ak4IaHOYRLgg1jzPrMpPR+CurjX7A4PTtTiXAhxF2
         /Ab3tSru5M3zSW0Vbc+cIX3JqfWyTD5Wjlu06Jz7RS+pOWn+zznwgZT4FJwIM0Shac1h
         eOcCq2DmFhV8mb7sF3IizH9+pN3OmHZ5IlUvhx7mNnbAH+pp5H6S/nZuY3olznGU92oG
         G4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX7gnvRsjCt1k+SVSIT/KetrC7UTs8Tz7+MVgZ047zxyjvI+QIMLfZzbWP5eIkAhcdgF8z0cwxMvJs95ZA9EpQu@lists.infradead.org
X-Gm-Message-State: AOJu0YxxCyjZF5LyWAnK5Y2/qI9kPfBd270SjJq4d9F41bxcDIZoLu82
	e46GvHsDvkaj0KS8mkpffyHcJHTqsm/q27yxNFkwkgOTPiJch2pG4LCg
X-Gm-Gg: ASbGncuKv53SmCwf55VGtGZLfQwmUZ1l5ugbXF2bEk7bKqSyDa9ZEdjBW3I8RRsP+X6
	zayM2ypv7NIur+4jPRoQNzeVeiboKLSfWiyumf0S9vCpOWWJBLW+1whQ5bEtemtOHZXJ86+raO2
	i1tYA1A9PGVwqybjHLzb3E3YnaWlaMLaeTvaNCJYFM3otcLl7QpjixmJ7ysr1oV585jqav4DRNX
	f/Gn04uDGg8s0J14eZkOYiW85JOI94kj93dq39ELDt8l3HQFwTaXTE4OxA4/yMyAaaPW2w58a6L
	SmIFK52K6grFYwReqquHlkMAdjwle7QlAem9/f9RAA3eM7DVV1UmLq6dxPzViGWsTb7VF6SG6wb
	zMmwRh36losLzPb+lvhLj4JHIWIkbdGiyhBtjAiY45WMKObjFcWaSU9GgU3ZufYeVTuLQMJ1g77
	D3q8pGVItWSBW0im4Ez3hfIzKO3Q==
X-Google-Smtp-Source: AGHT+IHgTeXKHH2vcpsvzOcBDeWFCxx7j6NWXF765EtO+25xvlfpvrezTIu3A7FfM3RO5CiMYA9Vog==
X-Received: by 2002:a05:600c:1e85:b0:46e:39e4:1721 with SMTP id 5b1f17b1804b1-46fa9aa261amr141333095e9.12.1760368546663;
        Mon, 13 Oct 2025 08:15:46 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36a773sm135545825e9.0.2025.10.13.08.15.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 08:15:46 -0700 (PDT)
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
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v2 4/4] KVM: selftests: Add option for different backing in pre-fault tests
Date: Mon, 13 Oct 2025 16:15:01 +0100
Message-ID: <20251013151502.6679-5-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013151502.6679-1-jackabt.amazon@gmail.com>
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_081548_687161_924BADFF 
X-CRM114-Status: GOOD (  13.51  )
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
 .../selftests/kvm/pre_fault_memory_test.c     | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index ed9848a8af60..22e2e53945d9 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -76,6 +76,7 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 gpa, u64 size,
 struct test_params {
 	unsigned long vm_type;
 	bool private;
+	enum vm_mem_backing_src_type mem_backing_src;
 };
 
 static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
@@ -94,7 +95,11 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	uint64_t guest_test_virt_mem;
 	uint64_t alignment, guest_page_size;
 
+	size_t backing_src_pagesz = get_backing_src_pagesz(p->mem_backing_src);
+
 	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(guest_mode));
+	pr_info("Testing memory backing src type: %s\n",
+		vm_mem_backing_src_alias(p->mem_backing_src)->name);
 
 	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
@@ -110,10 +115,11 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
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
@@ -155,7 +161,8 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 	kvm_vm_free(vm);
 }
 
-static void test_pre_fault_memory(unsigned long vm_type, bool private)
+static void test_pre_fault_memory(unsigned long vm_type, enum vm_mem_backing_src_type backing_src,
+				  bool private)
 {
 	if (vm_type && !(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type))) {
 		pr_info("Skipping tests for vm_type 0x%lx\n", vm_type);
@@ -165,6 +172,7 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 	struct test_params p = {
 		.vm_type = vm_type,
 		.private = private,
+		.mem_backing_src = backing_src,
 	};
 
 	for_each_guest_mode(__test_pre_fault_memory, &p);
@@ -174,10 +182,23 @@ int main(int argc, char *argv[])
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


