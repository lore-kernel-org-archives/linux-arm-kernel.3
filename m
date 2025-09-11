Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558E4CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzQnDluOQWqcbRXyu07+4Pf89SEymkI9ph5TfK7+5co=; b=Zc1rLZ+E+C86RyksNzkLdLbxeA
	AjrnN2+vokAJHZadTtN2ZEqgG1bIXFxjwDi8vrwDwGeaRAGFT5hkJ3BKQzYWo9KeEqFmcjPhruVLa
	nrAfBa6rZRk0UQxnOSerkzXUOWWp393Rs8S+3MUMbSQ6oxi/4vw50CiUZVqt098vgPza5kuPRcFyT
	eKzYmmoJ0dwEfK75+EDJoEfMp34Mnmxb+W9579EehoA3Bcbk5Qo2toD8h8HbrYKJj5msgpTIc0Jtb
	W8Cxg76s/SaiqIDOOfmH52TX/xMawuqemlb0HcB387oCe4ytjMZkVnP6FrwPE9pcj5Um6GRkBFVi+
	5Ls4pL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgW-00000003LaA-09DV;
	Thu, 11 Sep 2025 13:50:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgS-00000003LVb-37Cr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3e2055ce973so428697f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598595; x=1758203395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzQnDluOQWqcbRXyu07+4Pf89SEymkI9ph5TfK7+5co=;
        b=K7kJwfQIEuycC/i8Ap90KeTsE2TroZLFlHnl91OCTygGGBRLpdKfUI/q1G7NGIY3Fq
         FagEISfa7eDlwh9ch1GOgXXTtkizTGc8dlEyl0M/fVUwIMO82VtG99obNzvTleIvnBRb
         T7WWXlMkyvvqLsLf7dRLTX/S+QlR/hOPWpm6euIpu+jAD6LvwjMy9ySYN4ylRhXhg87Z
         0mkZqgPjtXSH05zWt6PT+Qf/vsgd8M0rpqnrYDtv+x8ILaPN6jok8YNFgNC1SNsGjUOs
         j+cWUPNZkSlvs3J2Vfl8gbCx4FUvOY5aIAEi907mh6l02rilx2i/IfVb9/S7S4X7RQYX
         Vuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598595; x=1758203395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzQnDluOQWqcbRXyu07+4Pf89SEymkI9ph5TfK7+5co=;
        b=DKaa670zfydUtGlIYqeisOfdY0OAJPWgQeCXLoaXW2M3AEs73tKHiUtqEdV1amXmap
         lehhYu3ljSC6rE4Rvfcy3YuzMVnPSVf60AOXoPolnOd8bZzX/eJHRaj/n9fCk3krKxM3
         1zdusPjtN3K1MV+0h4lz7D6QXIvqKg+eeobgB+MYDJJrcL7uyglLi44kCyajckgXLhKB
         2oeFgpURCNCrCEW+O4dzqDnmdwEKE7JUzDx7XGqVFxbyi3hDeuUJSswrkTD8alZql26g
         DWAd6XZhg1jkozyvrlIMo8hPsRR5JAPmmMFPjhdzT0eOr9kqbbdRvggaUTpUe7P/na47
         s4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs4i0Dfc1YZabt3bPhKBQTJKXCZzTpLGh2ycLuLMOOwoQWVLwFLAxkm/ysqi9ZJ2o7QJLlC6BxH7GEsoJatXAZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Basbgjw4c9W6cpfNKMEqxihGxdM/LS0s/GQ8ZSnzXhCwSYPz
	vvXtl97KTcyuCcEk2IGDPvKhgKRirc9RQiJ8tLiiL+LR4JeUZ6Mrn45X
X-Gm-Gg: ASbGncvS8s45rAgjVccf2jfWmNawlpZVAPTkWrbcWxTnKpB02PVwf3x+4HBVf+bc0Rm
	3ssxZPbl9RV3I55aelQVK9fKbwBYLplmY8qDvafouB13JLWk7AOi9fs/QIK/KcxdWmpB3oDSvzA
	ZYmpOuzGUwvmGz4kpU3UxnD0lmpyrwQVZEFBcps2a7K9qqJQjDfxNyhuzjQcumPGw2BijLVXWXS
	tywdLg9kAvU1q5SimiWXKzFSo6WCL9u4bFZGBHADYLf8gx23hcJtfqd9j6YTJt4GaJgvQkN0br+
	z/zW70+A8oETIo31NFXViSfv+aAPhRrmpMj6YM1BGB12t1BuylD59MnONMU4Jv0l0IFbqxg3e8h
	xd4UbdEESsitX/HyVNscWZSwOETWRZdcYkjLh39bQ8b8TmIdKE8xBX2p+jSSr5afWYBaerOH2
X-Google-Smtp-Source: AGHT+IG/J8P3rse6GJgnSeKVDJySxFHBWlgnLhBSgwpmqxWIY8gC4wxlNuo/9KWFNfyudpaEFtWD+g==
X-Received: by 2002:a5d:5d02:0:b0:3e1:2d70:674e with SMTP id ffacd0b85a97d-3e643e08071mr16467931f8f.47.1757598594539;
        Thu, 11 Sep 2025 06:49:54 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:54 -0700 (PDT)
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
Subject: [PATCH 6/6] KVM: selftests: Add option for different backing in pre-fault tests
Date: Thu, 11 Sep 2025 14:46:48 +0100
Message-Id: <20250911134648.58945-7-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064956_812310_849107D7 
X-CRM114-Status: GOOD (  13.60  )
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


