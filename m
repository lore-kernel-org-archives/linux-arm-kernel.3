Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861BFC47BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnwfbAHF0PCbdtqYfWOE4YUYyRoOfTU/WzuQ296CXfU=; b=cjfU/pxZwtOIOHH61Gy4Bkmnk6
	DKIGA7UEdo5vX0clxUJnUh7s8rl0YV0VD26sCj8nv0wzTJ/wRI7xmz6hzd5CN0fHk/mIXVVg9U8MT
	38Gz3UHxq6K+G3KiCbIZZjhVaxxdUfxGMSOjbSsR8f1V75Tunf4mjT9mxtyRv1ZljAHyT04neHuqB
	EhpayS6G8G0PYxJPRLBuQAO9RyvdZno9x8zTAd31BIZxKf38Jr5vEWdBrVYnnEeN2nkDc4pch1S+B
	Tnzuovts1FHVjZNgjoOwuJ86MJ5GRKLBcP4zELNPZvA0sYHOFG3r68m1/XwtYi6I1VUdbTO3QXXEX
	O12qbATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Ir-0000000Ci7Z-43A4;
	Tue, 06 Jan 2026 09:24:37 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Im-0000000Chzt-1wko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so8971445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691470; x=1768296270; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GnwfbAHF0PCbdtqYfWOE4YUYyRoOfTU/WzuQ296CXfU=;
        b=YbgPRwn2MCdvr7gVUXuaLgwl8s6uQjyx65olSTeyrRmGv6huY/X9kTIrmYY48tvkyw
         Esfjtzzc81Ds/WGVSrz9Me8anIXJBdo+4cQKgHWxvbh427XUP+ZUBKl1JMHRH5m9xZ8t
         8K91J2Tc+jeQv/b/ZusvTvg+XCNf1ntldQSsnK5/qK9iyAiLMb3+uCTR7nOOuDXyedWX
         B6MEeJUC8pTlUDoYgY6s9+e+qSiuf38kcS1/+QQ/iyx2uFS7egHf24GFcwLVAN/65RH/
         F3z3mnvPmxalWCQgE7tot2weQc0X6otwL81IuQgWVCyWljMb3CWjK0b0I5ghGqyPuIGq
         slbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691470; x=1768296270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnwfbAHF0PCbdtqYfWOE4YUYyRoOfTU/WzuQ296CXfU=;
        b=GYsylRHDY6o+O9Iqoux46XKEMwQvLacxWM828w+QtowfjGvBUN2ijEonsbnykGI3kt
         YMHJcETFhOxNhJnwvrIPKuZ2rInmlsRh2zYL485T9qkkS1c5sv3Rz1L/lKo/AFg7SI3z
         y1Hr+vTxmi/S+GeLh0AqIgluObkE/yotyQFpmCELv/Tb7dZOaKkFKbeSSfg45oaqyejp
         WMDGTbfsFLv3G9Q8GJs4LhrOiIxFJf3MMGpT/f3Qs3zgbiczoMUkJ0oLJkDxVOEhPVxp
         NdVXoTFF9V+RRtcvPeE3P4yb33QA8sqHpv9OH6Mou8ZyBBYg9CZo9TBy5BlCIELnPvxq
         Ag5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdKFLbj7/SzTji27tgKTASldvw6FAbxOY9zd6U21vc9+Jd4ESD+1SFCKH8Pkwum2EyjE08b2iiGhqr79E/UdDO@lists.infradead.org
X-Gm-Message-State: AOJu0YwY3hdyqrttCNDrQAyA9d/LsDZCeJfk42taBQUM898czJ1Rmism
	HrW+RENOeTjjU/hrD5Osh2fKEcBVk/DxF4FJjS/w945s4/+YDoMLRErwvYhQFRjxAhAO1zg9gn9
	Ntw==
X-Google-Smtp-Source: AGHT+IFcux+MH2/SnWRN59yd/EeqV0PSeYuceHIifCar56w5WkrXGG2T9nSrUb58DNoCU0or4EnrLtHc9A==
X-Received: from wmbdn5.prod.google.com ([2002:a05:600c:6545:b0:477:9fac:c456])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a16:b0:477:58af:a91d
 with SMTP id 5b1f17b1804b1-47d7f06b874mr27945865e9.5.1767691470261; Tue, 06
 Jan 2026 01:24:30 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:24 +0000
In-Reply-To: <20260106092425.1529428-1-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-5-tabba@google.com>
Subject: [PATCH v3 4/5] KVM: selftests: Move page_align() to shared header
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012432_524536_34525137 
X-CRM114-Status: GOOD (  10.84  )
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

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
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
2.52.0.351.gbe84eed79e-goog


