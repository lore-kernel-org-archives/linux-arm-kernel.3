Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D8DC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQkpLh+uoqHRFSYXAvuZpj/m3K4A+XSF/7uSzFTLQ4w=; b=teyzGX8U8Vs780/UmYAduu81Ej
	Fasr6c1L7D8dqcWTbRp1uSB4XWhZE+9XtWSuV81A7dmYcyQqDmNsc5h2BaVSx9WFVKXbp88uvaPJx
	BUBZOYdRin7DerAMO144iuFQKVW41u9UJ4ZHL8pDOdbc+COmanc/ODPDbFYUc8miNBs5bdxk8X+Oa
	OiSqqRake8eEBqE6z9bSFjBNFXgKraj6Uuw1qAev143OZ8AlE6craUpG2fXGud735oAUCuJQA1pXS
	Nans97ZKc23ZsNq2hr/3GWLbxQyvFJ5NU9YwdnxBuvH4q4lxXTQ7PNgbfLfclR8xVFhwq1t1jNToK
	wS/Ht1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rf6-00000009BKd-1G7g;
	Wed, 23 Sep 2026 18:25:44 +0000
Received: from out-92.mta1.migadu.com ([95.215.58.92] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rf3-00000009BJv-3rUo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:25:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mMdmK/9FycFUxVc3A/OffoN2VrdlqvuqAa1VcwPdc94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790187940; v=1; x=1790792740;
 b=INIfyzctB4HR/E1KSy8sYzOpiES9CZqAjeJBezb2AtqXciqaQ+Fr0z8uwuS8LTJ9brOCD8nP
 W1jFNgVFxR/S4dnKcMeZ8EA5gy280yqd5CTuk3IWZkQX+XwKMwk7l70dJvxmJK59NrZHNvBx4Kq
 vlDIVovRG9rEFQzOun/47J1E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2bd7d8622127b9ff;
	Wed, 23 Sep 2026 18:25:40 +0000
X-Mizu-Trace-ID: 2bd7d8622127b9ff
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b8c42da963so1405e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxFudp5vqg/tgqQl4wLzXfoNXZfSJMdmpKqEJXM12Zjua28y2zRP0eyMbRmuTfRm4RdaohmQ5OaXHJZA+ww65u@lists.infradead.org
X-Gm-Message-State: AFuF++lYWcrbKNQ7AtbC8lX3iO9A1zEzmCu+X2Ni06laOOaLDEM8esn7
	1y7kn03crAXQWtBzRPC1o1lFlTHDkfUKzTw/cu1BSBpuXwsdVTH5tSdMGr/LEro3X43KU3cXa+s
	skFZsc60qsi8p+xS0GqehF5REjFBqyK9AqxUXAwsG
X-Received: by 2002:a05:6512:3dac:b0:5b8:9d6d:21b3 with SMTP id
 2adb3069b0e04-5b8dda16235mr43733e87.6.1790187937034; Wed, 23 Sep 2026
 11:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-6-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-6-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:25:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0TtqA=7d_H8MJPrjSC8LorA8eAoQV2iNq92vyhc4MDA@mail.gmail.com>
X-Gm-Features: AclHuK-RIUiERhmleh7yaYY2uX18OLxNzJklGSRzD4NKIMEsTg5kd5iC90vfRLg
Message-ID: <CA+EHjTy0TtqA=7d_H8MJPrjSC8LorA8eAoQV2iNq92vyhc4MDA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] KVM: arm64: Propagate and use
 kvm_s2_fault_result on S2 fault
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_112542_163473_2589F8EB 
X-CRM114-Status: GOOD (  29.48  )
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

On Wed, 23 Sept 2026 at 16:17, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> When stage 2 page tables fault the net result may either be that a page is
> mapped, an error occurred or the fault should be retried (-EAGAIN).
>
> When a fault succeeds it may be upgraded to a PMD size via
> transparent_hugepage_adjust().
>
> In order to support KVM pre-faulting the outcome of the fault and the
> mapping size must be recorded.
>
> Track the mapping size via new kvm_s2_fault_result struct, which is
> threaded through gmem_abort(), user_mem_abort() and kvm_s2_fault_map().
>
> PKVM and SEA aren't relevant to synthetic pre-faulting so neither
> kvm_inject_sea() nor pkvm_mem_abort() are altered.
>
> Actual hardware faulting doesn't require this information, so
> kvm_handle_guest_abort() simply passes NULL kvm_s2_fault_result to
> gmem_abort() and user_mem_abort().
>
> A non-NULL result also tells the abort handlers that the caller is
> pre-faulting rather than a vcpu, in which case -EAGAIN is propagated to the
> caller to allow the pre-fault to be retried.
>
> Likewise, only prepare a KVM_EXIT_MEMORY_FAULT in gmem_abort() when a real
> fault is being handled, as this updates vcpu state.
>
> No functional change intended.
>
> Suggested-by: Vincent Donnefort <vdonnefort@google.com>
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 43 +++++++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9d799f7c1e62..ee2a4f0faa14 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1659,6 +1659,10 @@ struct kvm_s2_fault_desc {
>         struct kvm_s2_mmu       *mmu;
>  };
>
> +struct kvm_s2_fault_result {
> +       unsigned long mapping_size;
> +};
> +
>  static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
>  {
>         return esr_fsc_is_permission_fault(s2fd->esr);
> @@ -1684,7 +1688,8 @@ static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
>         return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
>  }
>
> -static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
> +static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
> +                     struct kvm_s2_fault_result *result)
>  {
>         bool write_fault, exec_fault;
>         bool perm_fault = kvm_s2_fault_is_perm(s2fd);
> @@ -1728,8 +1733,10 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>
>         ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
>         if (ret) {
> -               kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
> -                                             write_fault, exec_fault, false);
> +               /* If result is non-NULL this is a synthetic fault. */
> +               if (!result)
> +                       kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
> +                                                     write_fault, exec_fault, false);
>                 kfree(mapping);
>                 return ret;
>         }
> @@ -1784,7 +1791,13 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>         if ((prot & KVM_PGTABLE_PROT_W) && !ret)
>                 mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
>
> -       return ret != -EAGAIN ? ret : 0;
> +       if (ret == -EAGAIN)
> +               return result ? ret : 0;
> +
> +       if (result && !ret)
> +               result->mapping_size = PAGE_SIZE;
> +
> +       return ret;
>  }
>
>  struct kvm_s2_fault_vma_info {
> @@ -2108,7 +2121,8 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                             const struct kvm_s2_fault_vma_info *s2vi,
>                             enum kvm_pgtable_prot prot,
> -                           void *memcache)
> +                           void *memcache,
> +                           struct kvm_s2_fault_result *result)
>  {
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         struct kvm_guest_s2_mapping *mapping = NULL;
> @@ -2209,12 +2223,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                 mark_page_dirty_in_slot(kvm, s2fd->memslot,
>                                         gpa_to_gfn(canonical_ipa));
>
> -       if (ret != -EAGAIN)
> -               return ret;
> -       return 0;
> +       if (ret == -EAGAIN)
> +               return result ? ret : 0;
> +
> +       if (result && !ret)
> +               result->mapping_size = mapping_size;
> +
> +       return ret;
>  }
>
> -static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
> +                         struct kvm_s2_fault_result *result)
>  {
>         bool perm_fault = kvm_s2_fault_is_perm(s2fd);
>         struct kvm_s2_fault_vma_info s2vi = {};
> @@ -2253,7 +2272,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>                 return ret;
>         }
>
> -       return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
> +       return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache, result);
>  }
>
>  /* Resolve the access fault by making the page young again. */
> @@ -2532,9 +2551,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                                 !kvm_s2_fault_is_exec(&s2fd));
>
>                 if (kvm_slot_has_gmem(memslot))
> -                       ret = gmem_abort(&s2fd);
> +                       ret = gmem_abort(&s2fd, NULL);
>                 else
> -                       ret = user_mem_abort(&s2fd);
> +                       ret = user_mem_abort(&s2fd, NULL);
>         }
>
>         if (ret == 0)
>
> --
> 2.55.0
>

