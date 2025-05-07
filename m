Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A392C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf6t6m3UzjOjQqBtIkrrADeHvo58X2zFNTMCoBeF4hc=; b=wioiokWNa41unRLzq5eZ0VfHkU
	7Aq8DhYphmrFAUBZYqk8fZGLDi8MDggV3K/QwMwQ6vm9hwfznSGZgOB9zF/uyk7zm98t57TTqIN7Z
	OojI+tlIvMDZiS+Lvqwd75kQsm7DI0AQcenrwVuruQom1LiWIPBtcRU4u+tt0J117J05a/4qrMpxH
	n91YEHF8iMMxqaqWbXS4aOFlyrLc8QkeI+TTd/5F1Jbj1bIo7piTQvABDf8jdwrWn3/tZoQPMLKkx
	fxfTnBUjHj+SHu+yqBFWUh5kyKT1NeW8uvKvGd4CKkThA7wCHOUpT8GCItvlJKWJ8HsRGtCdzPgog
	JSQnnG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVk2-0000000E7KX-3mlF;
	Wed, 07 May 2025 03:46:42 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSIL-0000000DlGz-2YJO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 00:05:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so4883139a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 17:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576352; x=1747181152; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kf6t6m3UzjOjQqBtIkrrADeHvo58X2zFNTMCoBeF4hc=;
        b=3a9RMONXqj9T+UGQ75oSrKl/2w4PBjBkSP7Gy6FEJIx6PBQZ69xB2UV0EWoNvc0bV4
         ZOnXBNzOVANqskXqQCm2QVcVbOLGBtPM2WtjHEHd67a9EoqhvEpTvNOFwOlnPw4bbpmg
         M8AUlaXIQfzK0E8t1RAx5hBMBMTuWWwN5CaNyZn9kz/jLstsvIFonFZBIKs7E3HhbPWT
         smaI2qL4sDjZYa1qZ9kDy3BJgTESmFCjKB7JJOQfjTUfZaT2nvbVDKCJvsc+G1KOysVG
         GCk+rAfOD3YpigLf19MpnF2A+j0e3bf7/BDMFnGE+UF19HvqCr0/YvskBOC+fWWKCd1s
         4lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576352; x=1747181152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kf6t6m3UzjOjQqBtIkrrADeHvo58X2zFNTMCoBeF4hc=;
        b=LZlIk0Mk+5oa4TmZTPBdT7x6WMSN93ovQMbenbsTgnKpklC629VH5tg6tHWgqb9lrU
         9FVS0H1ZQHIm00gF9mDvPLqTdorwAeDUKZ43nctA6MqIJ92c1Z7j1ILYrRXDe6RzRC5S
         Qqp9hlxgPoFFnpibImt0aD3sGuljb54nqEQ0dyPzuyQaJwwSXTv2Pi7b98SMnvuF7EHQ
         MvyPVqp0Yq4tE9J5RCaebW1iGMQmQq3DypedOn5/1E6emlYrmsqsQZiD3ghmEwOLRQvX
         kUNjpDUlvcE7OonCQhBNIHX5aRK3WCyDIMVGcmM823DK+6r25DwYgOaovLHIx9X9t4ke
         F2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXgc63KldUVuaeuzwZ2krH5zEBpsxunj/bU7WY0Kl7q568kWM1biyoePm2w3Sljj1si7LMZS6WZpUUgoRKiKbl@lists.infradead.org
X-Gm-Message-State: AOJu0YzgiV0LGWc04PUmJR0boNBwsMaW4k5r8NIl5ZyYQQEoX/G6Ww4D
	Jn++fY/NQ8Z1M7xlY4r28pYopafkqOYF6xRXBffMo/Ijjg/dMZYYmy3SX0k0k/WH/hd0BDeF+2c
	BFw==
X-Google-Smtp-Source: AGHT+IFMFJ1FHxkmhNJJNI7L8Ht1/2Wzfj8wbIGxb39Uyx2QJZM+bpzpV88A2XUmDg8f6OQLimWa7W0pTy4=
X-Received: from pjbnd2.prod.google.com ([2002:a17:90b:4cc2:b0:2f5:63a:4513])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da87:b0:2fe:b907:3b05
 with SMTP id 98e67ed59e1d1-30aac29bf2bmr1865902a91.29.1746576352169; Tue, 06
 May 2025 17:05:52 -0700 (PDT)
Date: Tue, 6 May 2025 17:05:50 -0700
In-Reply-To: <20250109204929.1106563-6-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <20250109204929.1106563-6-jthoughton@google.com>
Message-ID: <aBqj3s8THH9SFzLO@google.com>
Subject: Re: [PATCH v2 05/13] KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_170553_650931_13C4A285 
X-CRM114-Status: GOOD (  29.83  )
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

On Thu, Jan 09, 2025, James Houghton wrote:
> Adhering to the requirements of KVM Userfault:
> 
> 1. Zap all sptes for the memslot when KVM_MEM_USERFAULT is toggled on
>    with kvm_arch_flush_shadow_memslot().
> 2. Only all PAGE_SIZE sptes when KVM_MEM_USERFAULT is enabled (for both
>    normal/GUP memory and guest_memfd memory).
> 3. Reconstruct huge mappings when KVM_MEM_USERFAULT is toggled off with
>    kvm_mmu_recover_huge_pages(). This is the behavior when dirty logging
>    is disabled; remain consistent with it.
> 
> With the new logic in kvm_mmu_slot_apply_flags(), I've simplified the
> two dirty-logging-toggle checks into one, and I have dropped the
> WARN_ON() that was there.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  arch/x86/kvm/Kconfig            |  1 +
>  arch/x86/kvm/mmu/mmu.c          | 27 +++++++++++++++++++++----
>  arch/x86/kvm/mmu/mmu_internal.h | 20 +++++++++++++++---
>  arch/x86/kvm/x86.c              | 36 ++++++++++++++++++++++++---------
>  include/linux/kvm_host.h        |  5 ++++-
>  5 files changed, 71 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index ea2c4f21c1ca..286c6825cd1c 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -47,6 +47,7 @@ config KVM_X86
>  	select KVM_GENERIC_PRE_FAULT_MEMORY
>  	select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
>  	select KVM_WERROR if WERROR
> +	select HAVE_KVM_USERFAULT
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support"
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 2401606db260..5cab2785b97f 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4280,14 +4280,19 @@ static inline u8 kvm_max_level_for_order(int order)
>  	return PG_LEVEL_4K;
>  }
>  
> -static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> -					u8 max_level, int gmem_order)
> +static u8 kvm_max_private_mapping_level(struct kvm *kvm,
> +					struct kvm_memory_slot *slot,
> +					kvm_pfn_t pfn, u8 max_level,
> +					int gmem_order)
>  {
>  	u8 req_max_level;
>  
>  	if (max_level == PG_LEVEL_4K)
>  		return PG_LEVEL_4K;
>  
> +	if (kvm_memslot_userfault(slot))

Unless I'm missing something, this can go in kvm_mmu_hugepage_adjust():

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a4439e9e0726..49eb6b9b268c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3304,7 +3304,7 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
        if (is_error_noslot_pfn(fault->pfn))
                return;
 
-       if (kvm_slot_dirty_track_enabled(slot))
+       if (kvm_slot_dirty_track_enabled(slot) || kvm_is_userfault_memslot(slot))
                return;
 
>  static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 1b04092ec76a..2abb425a6514 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13053,12 +13053,36 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
>  	u32 new_flags = new ? new->flags : 0;
>  	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
>  
> +	/*
> +	 * When toggling KVM Userfault on, zap all sptes so that userfault-ness
> +	 * will be respected at refault time. All new faults will only install
> +	 * small sptes. Therefore, when toggling it off, recover hugepages.
> +	 *
> +	 * For MOVE and DELETE, there will be nothing to do, as the old
> +	 * mappings will have already been deleted by
> +	 * kvm_arch_flush_shadow_memslot().
> +	 *
> +	 * For CREATE, no mappings will have been created yet.
> +	 */

Eh, trim this down and the reference the comment below to explain why FLAGS_ONLY
is the only case that needs to be handled.

> +	if ((old_flags ^ new_flags) & KVM_MEM_USERFAULT &&
> +	    (change == KVM_MR_FLAGS_ONLY)) {
> +		if (old_flags & KVM_MEM_USERFAULT)
> +			kvm_mmu_recover_huge_pages(kvm, new);
> +		else
> +			kvm_arch_flush_shadow_memslot(kvm, old);

The call to kvm_arch_flush_shadow_memslot() should definitely go in common code.
The fancy recovery logic is arch specific, but blasting the memslot when userfault
is toggled on is not.

