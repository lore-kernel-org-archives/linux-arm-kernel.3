Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F42BD5B857
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=; b=zmgAd/mGRk5fcNm15N8pJiGjgd
	uJhB6aqPHzdFzQx3jokl2nIfy6dIGNhPrz43go4jPcdZ4OY0yAhc9J/pRPBk8h8x1VcfYYwQKrdHt
	pf8UMfVsRmfeEHoYMi3iQvgyyUQmtcDm0BG9XNBUSNzmCFvcmg4j4TGps13kqt3Ryss/27MbK5d+v
	4KyAHofCiwyqbW9d3XpQazNOvELW7ux8RzPZ0vhWHU1GyilZGlwHSUyTrysY58xZLOKR21il5dn2Q
	q4ZBTxQ1UJ91wbw9jxORK27QslqyEXe0jUKanUuMa3hS5MUP2QR4NaOFMYIzFHu3PU38yiC/Hu3ek
	3yO87PNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnq-000000041gR-12jo;
	Mon, 15 Dec 2025 16:52:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnl-000000041Zj-1Ymf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:03 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so35923095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817520; x=1766422320; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=ttkhw10ZUZGvTOT0IyEYmWyH7lBNiD9FgEUWjbN6lXBBlgiJHHata7KwI8aLg1EhVK
         Xc7eubhQZTAC80oIbAUMSayqwu7m87fyr0dVBNlVd7ME0v0SoQkt65VjKPylUxSJ2r2C
         StzwhCugFBLgtoQM8c4g4+rTsZir9DSJewkej6Fjd3jmQ6Lex9SsOMq5dT+dJvSw62Y6
         1L8YZMWh59686pcliDh/zpqSsR9nr8cUBZNAXD8kiom1NGxeEG9Rql+ukhOBroAcoUve
         ylvBE2276XLtVmZ5Xmud1Ic0uPEpo6uN0VkgdVYfzXONnM9jJQKPvTY2FJL8p1x9JYJz
         dFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817520; x=1766422320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=MbFBAI7+sWlP8yc0LUjvHm1mJjc7GmKHBp76HbpNSHNkZHum6VVo0DwWf8xgZptwiy
         i6pItlxBYsKHbOn/OGq6m960zvZTi69H+JFPjbBC25NCib8KA/V9qvRS/LeEPWrMVDbD
         k/wncVIKazlqFW8s3n8NJbIisKibiswNADTIjI/cu6yuPD+/8DU4YU1ZrAhr69FKwM4E
         tgEgws2mKy8Ny8O3bMrLDlLKRWkHnn9jjU8x1thCyRWRHkEpTZ+QnUIDF74M8MBk6r2D
         AkEv/0RELRyk8He2lGdfmjd4YE2VNYl70pS3MaUVUT0og/GtvGu3fniZSsDeRGgaXg8v
         jWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW/1uo7QeQQHZML3KZ1N33POijcO+UvV9xBOcJFCrIheyajpu0FMZNc2z3oWeEVR+MWQKBvXqlhJ8apQ9ycIc9@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPwOEveLzj2sA95uBEzvqZWQu3CgTyEL+cI//TulnAhRvrtkJ
	9nxVqx+k6O+Dwb6F8a676eXgQw9S2vG0Q195KB6w3ZEVFv9+L5hO/ltu5+PvLlt5hCK7EsvYTQD
	RpA==
X-Google-Smtp-Source: AGHT+IHdmoXymTwmtDhUo4OPKD55NjfIa2ZaYkUMxOGs0DQTenx1wSRtOp2+NPGnkVJnbSiUoA2tLeeLYg==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:47a:8fa6:6a57])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f89:b0:477:7a95:b971
 with SMTP id 5b1f17b1804b1-47a8f90c5b0mr124657005e9.31.1765817519823; Mon, 15
 Dec 2025 08:51:59 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:54 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-5-tabba@google.com>
Subject: [PATCH v2 4/5] KVM: selftests: Move page_align() to shared header
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085201_432985_A83F7DE8 
X-CRM114-Status: GOOD (  10.66  )
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

To avoid code duplication, move page_align() to the shared `kvm_util.h`
header file.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
 tools/testing/selftests/kvm/lib/arm64/processor.c | 5 -----
 tools/testing/selftests/kvm/lib/riscv/processor.c | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 81f4355ff28a..dabbe4c3b93f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
 	return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
 }
 
+static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
+{
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
+}
+
 /*
  * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
  * to allow for arch-specific setup that is common to all tests, e.g. computing
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 607a4e462984..143632917766 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -21,11 +21,6 @@
 
 static vm_vaddr_t exception_handlers;
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d5e8747b5e69..f8ff4bf938d9 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 	return !ret && !!value;
 }
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
 {
 	return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
-- 
2.52.0.239.gd5f0c6e74e-goog


