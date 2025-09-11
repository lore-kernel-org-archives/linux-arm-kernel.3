Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E411CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJBOYBviiAkHEGuAebJYs1rSMwBP/rg8f5sw3Y1zhrU=; b=NCtkBes3yW5lsnZR/cJNGtOT1y
	iBsgUJpaz8u1UTPElLMiS8QRk4QuFzoMzSZPp+NYrae6SNBS0XHVboiuphfTroHMLeroVC2C5jh3i
	unQL66U0sKB3TAFgLfqO0rd2v/Lov+PiZ5w9uT9A2Rsg7TYODQMPWGqcxtxgoS42kp6ZVC0+Fx1JN
	cTFzZGhLDktvouKmGzma+EJfgUoNJ/UvriLODHn93DGFPrTaCZAQMwB/v8ar+CiBUrri6YzAWx9w4
	kz1adleO6rekBLHLgV1fZO/dqema5/YAQYmipxwYYjgIVSHZqtZWsPIhDBDXQCjxsz2Z0U79HNcp9
	s+nygdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgG-00000003LMV-44dS;
	Thu, 11 Sep 2025 13:49:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgE-00000003LL8-2XsU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45df09c7128so5951115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598581; x=1758203381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJBOYBviiAkHEGuAebJYs1rSMwBP/rg8f5sw3Y1zhrU=;
        b=A5UD+EmoRvJjQULKG/LjK1PLdP8hi8Mt5QO72oZNGGK2yCzV4GhL7qiu/r8Ua1wYw6
         2Ut8aaby2DUUvOINB6C2eZ7H7gblZDYEVGHKwRvF28n7XtVC2WnF0Z5/C4Nh25ncVp/3
         OmNt4r7iGO40Dz1kEpAzWVvjuSkrzz/f9ST+NvL1t7Gm2/z59R5CBrh597pgL51g/oBk
         I7+6uYynBKHFgIwrULcJjsUnqxxbuKRUZ8muvt+biNhhnQReXKgdllurEnZa1eJJ67Il
         I+nKBuqKAcc24mcRH7UFxwpgmLN8sHwauthGVMIqJS8S3CoGVZGoe4Y7tOL1WC1OMmWo
         0GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598581; x=1758203381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJBOYBviiAkHEGuAebJYs1rSMwBP/rg8f5sw3Y1zhrU=;
        b=QqCQGgLtFfsdFlst24py0Yp1uQoEfaLFICxrCJx7LCaB7RxM+ufeVf6UJs0tZ1fN5c
         XVBa13Yj7RrtM1mSASuly8Tdd6VBqCbLFs/Pg3a/FyQoRYLsDonzLb/5IdOW4BPSPV4h
         2fTV21SleVZRvWl4zPs5BDTXQrZX7L4QvQtwZsZUKC29KKYkbF+QvtfnNQ1FQS+3g3BX
         +A1MQkihOl3Xv1Lm/evESCsbS1UpwrIM6cbXa0obb/WT0ryAgKzA0BDND/f0GApm8X8O
         wTZXopZLY6LwUux/XD3rDF1+TAZIolEV4Cy6akWjBhzqNfYG6Y9pmwxpNMirMzfjDUQa
         6x8A==
X-Forwarded-Encrypted: i=1; AJvYcCWLaHnhB4WpONoDlETXZIfuzU8JtYC1PcrpDtKsTKi/EfNNDEwebqBBWwxYqugrENVe6nQK9uQNODzxzSeusxfB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+DT+9yFblKbz1XC6J0cNk3Tg6VMPZXiz7e+Z+bSgHM6y4JaQl
	EMsZAt/rBiJoUc2OQloiyf/ta8sen3ObrTvuRLSPnsbTXEPqUFMT+Dkd
X-Gm-Gg: ASbGnctsMfK2iclG+izSYxRHNui+VTjGbbFRKTDHGb49PxXmHOlvWhM3qouDuH7qMEY
	1tzZe5fi4J8H4k4aLDVvlnSLoQmjfk5xxiZLDZVurGnYxhb9lbbjUurtr35kymyvsrvgCLk9zYv
	9Kk0srajY6DSNtmHAJ8J6CM5FrS+ZMr89ta0b9zN2QygnKFGvCJinnB3Wl7kJPALRopr9sia1+u
	UBPfAxKHsPfo/EJLYCjll4K0KgqWnV/mcdMKVeEkhpyVRtWXVHjnEOTbfvGWg7Ky7InkBkt9PG+
	8O3j5ROk4jXWufhxZUdjLrsOJ4FpS2pc4CX3BVOFt7muZpQrEVsrQACnuXxyQ0D3GuEjlVZUwcz
	5Ly4vZ6yyfsvDBolGR5NrQhiRTDkGGiJC4fAPD1F4Y24o03DTGn/hZ4wOsuh1eQ==
X-Google-Smtp-Source: AGHT+IF9gYWYpXj1cgrspFLvRu0yrW6lKAr/MmACXhsm2WBvm6knLxYnlrbbjGF1EG0D4ZDyCrnxvA==
X-Received: by 2002:a05:600c:a103:b0:45b:910c:adf with SMTP id 5b1f17b1804b1-45dfd5e3d68mr29948455e9.12.1757598580729;
        Thu, 11 Sep 2025 06:49:40 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:40 -0700 (PDT)
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
Subject: [PATCH 1/6] KVM: arm64: Add __gmem_abort and __user_mem_abort
Date: Thu, 11 Sep 2025 14:46:43 +0100
Message-Id: <20250911134648.58945-2-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064942_667191_F1A33E07 
X-CRM114-Status: GOOD (  13.22  )
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

Adding __gmem_abort and __user_mem_abort that preserve -EAGAIN results.
These will be used by the pre-fault implementation which needs to retry
on -EAGAIN.

Also add an optional page_size output parameter to __user_mem_abort to
return the VMA page size, which will be needed for pre-faulting.

No functional changes are intended

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 arch/arm64/kvm/mmu.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a36426ccd9b5..082e7d8ae655 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1521,9 +1521,9 @@ static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
 
 #define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
 
-static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-		      struct kvm_s2_trans *nested,
-		      struct kvm_memory_slot *memslot, bool is_perm)
+static int __gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			struct kvm_s2_trans *nested,
+			struct kvm_memory_slot *memslot, bool is_perm)
 {
 	bool write_fault, exec_fault, writable;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
@@ -1592,13 +1592,22 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
+	return ret;
+}
+
+static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+		      struct kvm_s2_trans *nested,
+		      struct kvm_memory_slot *memslot, bool is_perm)
+{
+	int ret = __gmem_abort(vcpu, fault_ipa, nested, memslot, is_perm);
 	return ret != -EAGAIN ? ret : 0;
 }
 
-static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			    struct kvm_s2_trans *nested,
+			    struct kvm_memory_slot *memslot,
+			    long *page_size, unsigned long hva,
+			    bool fault_is_perm)
 {
 	int ret = 0;
 	bool topup_memcache;
@@ -1871,10 +1880,23 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	kvm_fault_unlock(kvm);
 
+	if (page_size)
+		*page_size = vma_pagesize;
+
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
+	return ret;
+}
+
+static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			  struct kvm_s2_trans *nested,
+			  struct kvm_memory_slot *memslot, unsigned long hva,
+			  bool fault_is_perm)
+{
+	int ret = __user_mem_abort(vcpu, fault_ipa, nested, memslot, NULL,
+			    hva, fault_is_perm);
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.43.0


