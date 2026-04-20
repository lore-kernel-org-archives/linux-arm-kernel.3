Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A7EF5A8C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jearMQMOM45vciFPdayTOFGaCCeoL5RElweUFZze4JY=; b=GnJYt1Twb4k8exSuqpVt0ulY3s
	qMhzQdfcVKy8iflrDPmo3jW2CxFfvaToM9dEpGWEC+HkyT0KU5c9eWOG9rYua4PwElS4riStgvvoc
	WT10ZSElKLLYffzhb4OgA9aNxNTE2xVTli7gje2/RAKakki1VlLHxx/FajRoXxZ3WaKoda8kBbRHv
	kKT0rnQkA5R1lfVgbchBbLBWGTKmmf7yUFKN033hhbcFveMku5OU214XsaQINbYQaL6wmP3kkGork
	7OFJl5M9V8nQEKr3rPSGbMSKg/QEKnWp8upen+hcCx9EK8hoG7O8EQjlkZV+lG/ds7nwkfF8CIOsc
	48GkxMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3J-00000007gaM-2Hc0;
	Mon, 20 Apr 2026 21:21:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2p-00000007fyB-17cw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jearMQMOM45vciFPdayTOFGaCCeoL5RElweUFZze4JY=; b=is4g4Zoxs7Onygn6rjQr8dE4wc
	F+fzjcXK4tcrslS6UmOTNVtlKT6pNYZcI+RQHKAqGIAnQsIBIklk+/v/JJyV3sgCWwlvhp5nhKgE9
	jeAotFLX9EkQHW2cSjhxD7lBGfHk6A7gdkGpt9g2604CIWJTHpZbFBJ4/HnlrLbb/zsGA1K1HOqE5
	RloGHNB9Cw0jV74mseGMvpTGYmhtUUiyjA5dP7qMHqB+1iFaTnATI5vuZcvSIw1xJ/OrUsrxLXi/r
	a6CkKD76O07pzwla1RftgPyOzJSkMAvLrP1devMDWpdj6y+0xLfbIqZpJFpNKMe65KWcCz70OoJtT
	aQ5Ocy4Q==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2m-000000093N1-0uuf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:37 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so4309512b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720031; x=1777324831; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jearMQMOM45vciFPdayTOFGaCCeoL5RElweUFZze4JY=;
        b=M2OlCJ+NzHmPcXPlDLV6kbXECMIxmn9ywNOOnmc8sWCpM8AurlJzYq7NF1CKjeaybZ
         NFxdwGG0KT5urL/gsiAcw+ig136ymyH2gVn2zG9oQSYjLLeuTpIxu8uQ0njr3knudfGx
         DS5bAb4H0vXOjAiFJ7wbGHnBFyQWBccZu9oPzCQYN0Pg6aRcYqklzYwWTt22z/FM0bGx
         4boC0lIyeyzVk0cCJKQr8Zm5HdKAMG5UWelgl4lqY/lgq0ytwQrXmiWZBRh7sqYWzk0e
         hOQw+JG8eCZennHT25LVrgm5Rcn5TB/G9SWTjEoc11v4j210OQf3tVclwu/FpuKUObrp
         ivKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720031; x=1777324831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jearMQMOM45vciFPdayTOFGaCCeoL5RElweUFZze4JY=;
        b=LzVdndu9SrzQ7WeCiP+FOnCTQ9pOOmPFDoeoLs/1oo8++hWVWfNvdDUyr7J9G1jasj
         3251de2m3nzHgnEOh8xgk9jEi236wKSvG3ytNa9IDNj+LQKmhLfMnJ3T0wSwe/c8OYqf
         51Mlfj9eWBdi02Mo88Da1byb67KtRSs+n/Bxd8Y8Vu5LFDJJbz+NSDw9AS1n7pUPLkRU
         XSn8vPdROApCCg9KKMCthszbnEc3Tl3ujBzWV0q8IpizNrZCsPHx179VI1WxMvSWwRaJ
         pWZJjtMvRqjr2mXHV4SNAkaYNkaI6d1iOL1uxPWmVDfYIZrxywjEW8MFV0+Z6feB7Ih2
         54MA==
X-Forwarded-Encrypted: i=1; AFNElJ9vHnwkTt/qGiCMNIQ5hJhcjPvmB7+xjR4kwnNfWMO2/amUXTPrlcUEdVKcSChn1k3HUzluZlXA1spdyByXYKkp@lists.infradead.org
X-Gm-Message-State: AOJu0YyOF6iKu3Z0Z56BeFVjU5JoWtwVOoajNRDhkPYismK4kk7ltdgI
	rSnW/yuYXlKXwsqxZSAs6Kdc7cumz1O/9L2+ARQ5z4sbkYP4EVcULy/VLJR0pqt1tudiF6anbqF
	YjanYaQ==
X-Received: from pfbhx21.prod.google.com ([2002:a05:6a00:8995:b0:82f:8b22:bc77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a1:b0:82c:e83d:a9b0
 with SMTP id d2e1a72fcca58-82f8c850e93mr15532322b3a.21.1776720031083; Mon, 20
 Apr 2026 14:20:31 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:58 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-14-seanjc@google.com>
Subject: [PATCH v3 13/19] KVM: selftests: Rename vm_vaddr_populate_bitmap() => vm_populate_gva_bitmap()
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
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222036_293721_422A6E20 
X-CRM114-Status: GOOD (  10.72  )
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

Now that KVM selftests use gva_t instead of vm_vaddr_t, rename the helper
for populating the initial GVA bitmap to drop the defunct terminology and
use "vm" for the scope.

Opportunistically fixup the declaration of the API, which has been broken
since day 1.  The flaw went unnoticed because the sole caller is defined
after the weak version, i.e. can see the prototype without a previous
declaration.

No functional change intended.

Fixes: e8b9a055fa04 ("KVM: arm64: selftests: Align VA space allocator with TTBR0")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 2 +-
 tools/testing/selftests/kvm/lib/arm64/processor.c | 2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 0239e89320e5..0fbfb2a28767 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -714,7 +714,7 @@ void vm_mem_region_reload(struct kvm_vm *vm, u32 slot);
 void vm_mem_region_move(struct kvm_vm *vm, u32 slot, u64 new_gpa);
 void vm_mem_region_delete(struct kvm_vm *vm, u32 slot);
 struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, u32 vcpu_id);
-void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
+void vm_populate_gva_bitmap(struct kvm_vm *vm);
 gva_t vm_unused_gva_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
 gva_t vm_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
 gva_t __vm_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index c4f0e37f2907..384b6c80b1e7 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -671,7 +671,7 @@ void kvm_selftest_arch_init(void)
 	guest_modes_append_default();
 }
 
-void vm_vaddr_populate_bitmap(struct kvm_vm *vm)
+void vm_populate_gva_bitmap(struct kvm_vm *vm)
 {
 	/*
 	 * arm64 selftests use only TTBR0_EL1, meaning that the valid VA space
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8c82b40a7448..1a1b41021cc7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -267,7 +267,7 @@ _Static_assert(sizeof(vm_guest_mode_params)/sizeof(struct vm_guest_mode_params)
  * based on the MSB of the VA. On architectures with this behavior
  * the VA region spans [0, 2^(va_bits - 1)), [-(2^(va_bits - 1), -1].
  */
-__weak void vm_vaddr_populate_bitmap(struct kvm_vm *vm)
+__weak void vm_populate_gva_bitmap(struct kvm_vm *vm)
 {
 	sparsebit_set_num(vm->vpages_valid,
 		0, (1ULL << (vm->va_bits - 1)) >> vm->page_shift);
@@ -385,7 +385,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 
 	/* Limit to VA-bit canonical virtual addresses. */
 	vm->vpages_valid = sparsebit_alloc();
-	vm_vaddr_populate_bitmap(vm);
+	vm_populate_gva_bitmap(vm);
 
 	/* Limit physical addresses to PA-bits. */
 	vm->max_gfn = vm_compute_max_gfn(vm);
-- 
2.54.0.rc1.555.g9c883467ad-goog


