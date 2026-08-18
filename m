Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E730AC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJNDxw4YwLiT6RLarIpaZvjqLzSJMNgnKXM7LBt3+is=; b=Lyipy8bSCDGW2PnR8IiKYiCCed
	qT2IakWn7S3LnGXbGDeh/XdIxQB09JEZVcHkX1v/Cza+/2aSOKP5go0Z8jGlBdjTYtOYHR3PNIJIc
	0dJrtL0rJFYLV2UvGnv068vsN61PRlkyLCwtfkT1bBXYOpvZlYtysv0SXmGmTyScbI25GTlQtr4pZ
	3mKiGA+ykUkALQG80BwSDmqxRyw3r+hFz2lj3PBt2pVnqfVeOB7LuJLI7RUqBFhb3Z457dz7fQlYz
	FEVf92sm564gmItZP6a7LquzIPphyMfPzPrjHy91k0OGw9rdbbe1Ff2+qc532HCxx0f8tG+2xRm1/
	x0coDBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLyp-00000008I0T-37l4;
	Tue, 18 Aug 2026 15:43:59 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLym-00000008Hzn-0Syl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:43:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xqCmZn8IMffi1+IzepnqMRv/vTN47LqYxZG5/JsvG8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787067834; v=1; x=1787672634;
 b=ODeemdVM3TPY7vPwZaWJayKjcn4XIYkktZg9f2ccJEoi/8Q3RrrE6F3kU4enktZ66iVxIePc
 CPAZvp5MXVjc+w7Ra6k3IhjBkqi8b1iuoD7u0rn8ASU0SPq1lgNDSNpRX7t3BnYI9z4DfEClS2E
 L5w2rVNuj55/ntn4fdwh7A3E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f49.google.com (209.85.167.49)
	by smtp.migadu.com with ESMTPS id 26e133c209c9b88e;
	Tue, 18 Aug 2026 15:43:53 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso9684e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 08:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpBaXWjUpColyaZr9lxwvWpWIbb5Gk8bxDBetf3rSQMBjEF7cW9wlp03ov8RvlaWFdKHeQAwOaie3ZWzUkz6LHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YytQ4LdY1qulL0qLVv7xBG2Y2tPPgRmW1DpPh38b6/BbuYCofqm
	Iw0NvQEKL8tFGASM/NPkZL7Ay8ct0XhOVvF7ohYjBv7dKpLKEkuXBCsa45yXhWyxW6msoounK8U
	f7uQGm1os9t+RfP8zMyGXHn9AWseYH5SALD0E63Of
X-Received: by 2002:a05:6512:39d2:b0:5aa:79d6:b559 with SMTP id
 2adb3069b0e04-5b471d7c3afmr252829e87.0.1787067832468; Tue, 18 Aug 2026
 08:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-10-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-10-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 18 Aug 2026 16:43:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy7SUFsE3N5ERV_FQw-3GyEo17mqe2=RbV1wz8bVT+JXw@mail.gmail.com>
X-Gm-Features: AcwNN1U_P4-IFma-j9U4XnVKaABI9s42IM8oaP9t3k1XNqFyc34ZYFaR_aP_vmU
Message-ID: <CA+EHjTy7SUFsE3N5ERV_FQw-3GyEo17mqe2=RbV1wz8bVT+JXw@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] KVM: arm64: Add selftests for the pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_084356_442177_02444113 
X-CRM114-Status: GOOD (  28.59  )
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

Hi Vincent,

On Fri, 31 Jul 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Introduce a comprehensive runtime selftest for the pKVM hypervisor heap
> allocator, executed during init when CONFIG_NVHE_EL2_DEBUG is enabled.
>
> The selftest runs entirely at EL2 and exercises allocator's core
> mechanisms:
>
>   * over-sized allocations
>   * basic allocation and alignment
>   * chunk recycling, splitting, merging
>   * memory reclaiming
>   * memory topup
>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 0c3126179704..08466f608d1f 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -92,6 +92,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
>         __KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
>         __KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_selftest,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 99daa985856f..73c8881e14ec 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -19,8 +19,10 @@
>
>  enum pkvm_topup_id {
>         PKVM_TOPUP_HYP_ALLOC,
> +       PKVM_TOPUP_HYP_ALLOC_SELFTEST,
>  };
>
> +void pkvm_selftests(void);
>  int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
>  int pkvm_create_hyp_vm(struct kvm *kvm);
>  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
> @@ -206,6 +208,7 @@ struct pkvm_mapping {
>  enum pkvm_hyp_req_type {
>         PKVM_HYP_NO_REQ = 0,
>         PKVM_HYP_REQ_HYP_ALLOC,
> +       PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
>         __PKVM_HYP_REQ_TYPE_MAX,
>  };
>
> @@ -233,6 +236,7 @@ static inline size_t pkvm_hyp_req_arg_size(u8 type)
>         case PKVM_HYP_NO_REQ:
>                 return 0;
>         case PKVM_HYP_REQ_HYP_ALLOC:
> +       case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
>                 return sizeof(req->mem);
>         default:
>                 WARN_ON(1);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..750862705a70 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2883,6 +2883,8 @@ static int __init init_hyp_mode(void)
>                         kvm_err("Failed to init hyp memory protection\n");
>                         goto out_err;
>                 }
> +
> +               pkvm_selftests();
>         }
>
>         return 0;
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/alloc.h b/arch/arm64/kvm/hyp/include/nvhe/alloc.h
> index 8f87a63f8946..329250dad6f6 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/alloc.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/alloc.h
> @@ -14,4 +14,11 @@ int hyp_alloc_init(size_t size);
>  int hyp_alloc_topup(struct kvm_hyp_memcache *host_mc);
>  unsigned long hyp_alloc_reclaimable(void);
>  void hyp_alloc_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target);
> +
> +#ifdef CONFIG_NVHE_EL2_DEBUG
> +int hyp_allocator_selftest(void);
> +u32 hyp_alloc_selftest_topup_needed(void);
> +int hyp_alloc_selftest_topup(struct kvm_hyp_memcache *host_mc);
> +void hyp_alloc_selftest_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target);
> +#endif
>  #endif
> diff --git a/arch/arm64/kvm/hyp/nvhe/alloc.c b/arch/arm64/kvm/hyp/nvhe/alloc.c
> index af4ab53784f7..de636fdf976b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/alloc.c
> @@ -1015,9 +1015,17 @@ int hyp_alloc_errno(void)
>         return hyp_allocator_errno(&hyp_allocator);
>  }
>
> +static int selftest_init(void);
> +
>  int hyp_alloc_init(size_t size)
>  {
> -       return hyp_allocator_init(&hyp_allocator, size);
> +       int ret;
> +
> +       ret = hyp_allocator_init(&hyp_allocator, size);
> +       if (ret)
> +               return ret;
> +
> +       return selftest_init();
>  }
>
>  void hyp_alloc_reclaim(struct kvm_hyp_memcache *mc, unsigned long target)
> @@ -1039,3 +1047,179 @@ u32 hyp_alloc_topup_needed(void)
>  {
>         return hyp_allocator_topup_needed(&hyp_allocator);
>  }
> +
> +#ifdef CONFIG_NVHE_EL2_DEBUG
> +#define SELFTEST_MAX_PAGES 6
> +#define SELFTEST_MAX_SIZE (PAGE_SIZE * SELFTEST_MAX_PAGES)
> +
> +static DEFINE_PER_CPU(int, __selftest_errno);
> +static DEFINE_PER_CPU(u32, __selftest_topup_needed);
> +
> +static struct hyp_allocator selftest_allocator = {
> +       .errno = &__selftest_errno,
> +       .topup_needed = &__selftest_topup_needed,
> +       .lock = __HYP_SPIN_LOCK_UNLOCKED,
> +};
> +
> +int hyp_alloc_selftest_topup(struct kvm_hyp_memcache *host_mc)
> +{
> +       return hyp_allocator_topup(&selftest_allocator, host_mc);
> +}
> +
> +void hyp_alloc_selftest_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target)
> +{
> +       hyp_allocator_reclaim(&selftest_allocator, host_mc, target);
> +}
> +
> +u32 hyp_alloc_selftest_topup_needed(void)
> +{
> +       return hyp_allocator_topup_needed(&selftest_allocator);
> +}
> +
> +static int selftest_init(void)
> +{
> +       return hyp_allocator_init(&selftest_allocator, SELFTEST_MAX_SIZE);
> +}
> +
> +static void *selftest_alloc(size_t size)
> +{
> +       return hyp_allocator_alloc(&selftest_allocator, size);
> +}
> +
> +static void selftest_free(void *addr)
> +{
> +       hyp_allocator_free(&selftest_allocator, addr);
> +}
> +
> +static int selftest_errno(void)
> +{
> +       return hyp_allocator_errno(&selftest_allocator);
> +}
> +
> +int hyp_allocator_selftest(void)
> +{
> +       struct hyp_allocator *allocator = &selftest_allocator;
> +       static DEFINE_HYP_SPINLOCK(selftest_lock);
> +       struct kvm_hyp_memcache host_mc = { };
> +       void *addr1, *addr2, *addr3, *addr4;
> +       int ret;
> +
> +       guard(hyp_spinlock)(&selftest_lock);
> +
> +       if (allocator->mc.nr_pages < SELFTEST_MAX_PAGES) {
> +               *this_cpu_ptr(allocator->topup_needed) = SELFTEST_MAX_PAGES -
> +                                                        allocator->mc.nr_pages;
> +               return -ENOMEM;
> +       }
> +
> +       selftest_alloc(SELFTEST_MAX_SIZE);
> +       if (selftest_errno() != -E2BIG)
> +               return -EINVAL;
> +
> +       selftest_alloc(SIZE_MAX);
> +       if (selftest_errno() != -E2BIG)
> +               return -EINVAL;
> +
> +       /* Test first chunk */
> +       addr1 = selftest_alloc(0);
> +       if (!addr1 || addr1 != (void *)allocator->start + chunk_hdr_size())
> +               return -EINVAL;
> +
> +       /* Test second contiguous chunk with unaligned size */
> +       addr2 = selftest_alloc(MIN_ALLOC_SIZE + 1);
> +       if (!addr2)
> +               return -EINVAL;
> +       addr3 = selftest_alloc(0);
> +       if (!addr3 ||
> +           addr3 != addr2 + (2 * MIN_ALLOC_SIZE) + chunk_hdr_size())
> +               return -EINVAL;
> +
> +       selftest_free(addr3);
> +
> +       /* Test chunk recycling */
> +       selftest_free(addr1);
> +       if (addr1 != selftest_alloc(0))
> +               return -EINVAL;
> +
> +       /* Test chunk forward merging */
> +       addr3 = selftest_alloc(0);
> +       selftest_free(addr2);
> +       selftest_free(addr1);
> +       if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 2))
> +               return -EINVAL;
> +
> +       selftest_free(addr1);
> +
> +       /* Test chunk splitting */
> +       if (addr1 != selftest_alloc(0))
> +               return -EINVAL;
> +       if (addr2 != selftest_alloc(0))
> +               return -EINVAL;
> +
> +       /* Test chunk backward merging */
> +       selftest_free(addr1);
> +       selftest_free(addr2);
> +       if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 2))
> +               return -EINVAL;
> +
> +       selftest_free(addr1);
> +
> +       /* Test chunk 3-way merging */
> +       addr1 = selftest_alloc(0);
> +       addr2 = selftest_alloc(0);
> +       addr4 = selftest_alloc(0);
> +       selftest_free(addr1);
> +       selftest_free(addr3);
> +       selftest_free(addr2);
> +       if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 3))
> +               return -EINVAL;
> +
> +       selftest_free(addr4);
> +       selftest_free(addr1);
> +
> +       /* Test reclaiming */
> +       if (addr1 != selftest_alloc(0))
> +               return -EINVAL;
> +       if (addr2 != selftest_alloc(PAGE_SIZE * 2))
> +               return -EINVAL;
> +       addr3 = selftest_alloc(0);
> +       addr4 = selftest_alloc(PAGE_SIZE);
> +
> +       /* Test reclaiming the last chunk of the list */
> +       selftest_free(addr4);
> +       hyp_allocator_reclaim(allocator, &host_mc, SELFTEST_MAX_PAGES);
> +       if (host_mc.nr_pages != SELFTEST_MAX_PAGES - 3)
> +               return -EINVAL;
> +
> +       /* Test punching a hole in the middle of a free chunk ... */
> +       selftest_free(addr2);
> +       hyp_allocator_reclaim(allocator, &host_mc, SELFTEST_MAX_PAGES);
> +       if (host_mc.nr_pages != SELFTEST_MAX_PAGES - 2)
> +               return -EINVAL;
> +
> +       if (selftest_alloc(PAGE_SIZE))
> +               return -EINVAL;
> +       if (selftest_errno() != -ENOMEM)
> +               return -EINVAL;
> +
> +       /* ... and to refill this hole */
> +       ret = hyp_allocator_topup(allocator, &host_mc);
> +       if (ret)
> +               return ret;
> +       /* Chunk at addr2 was made smaller by the reclaim */
> +       if (addr2 != selftest_alloc(PAGE_SIZE))
> +               return -EINVAL;
> +
> +       /* Test reclaiming the entire allocator from the host */
> +       selftest_free(addr3);
> +       selftest_free(addr2);
> +       selftest_free(addr1);
> +       if (addr1 != selftest_alloc(SELFTEST_MAX_PAGES * PAGE_SIZE - chunk_hdr_size()))
> +               return -EINVAL;
> +       selftest_free(addr1);
> +
> +       return 0;
> +}
> +#else
> +static int selftest_init(void) { return 0; }
> +#endif
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 346365e76ef2..d99c9b1b0c82 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -633,6 +633,28 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
>         cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
>  }
>
> +#ifdef CONFIG_NVHE_EL2_DEBUG
> +static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
> +{
> +       struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
> +       int ret;
> +
> +       ret = hyp_allocator_selftest();
> +       if (ret == -ENOMEM) {
> +               req.type = PKVM_HYP_REQ_HYP_ALLOC_SELFTEST;
> +               req.mem.nr_pages = hyp_alloc_selftest_topup_needed();
> +       }
> +
> +       cpu_reg(host_ctxt, 1) = ret;
> +       pkvm_hyp_req_to_smccc(host_ctxt, &req);
> +}
> +#else
> +static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
> +{
> +       cpu_reg(host_ctxt, 1) = -EPERM;
> +}
> +#endif

My tag stands, but thought about this while going through Sashiko's reviews.

The other arm writes x2 through pkvm_hyp_req_to_smccc(), this one does
not, and -EPERM is an error so pkvm_call_hyp_req() goes and decodes
x2. Nothing initialises it on a call with no arguments.

It is inert because pkvm_selftests() sits behind the same #ifdef, but
the handler is registered either way and nothing states the rule.
errno_to_smccc(-EPERM, host_ctxt) here would write the zero, and it
may be worth saying on pkvm_call_hyp_req() that any handler reached
through it has to set x2.

Cheers,
/fuad

> +
>  static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
> @@ -648,6 +670,11 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
>         case PKVM_TOPUP_HYP_ALLOC:
>                 ret = hyp_alloc_topup(&host_mc);
>                 break;
> +#ifdef CONFIG_NVHE_EL2_DEBUG
> +       case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
> +               ret = hyp_alloc_selftest_topup(&host_mc);
> +               break;
> +#endif
>         default:
>                 ret = -EINVAL;
>         }
> @@ -668,6 +695,11 @@ static void handle___pkvm_hyp_reclaim(struct kvm_cpu_context *host_ctxt)
>         case PKVM_TOPUP_HYP_ALLOC:
>                 hyp_alloc_reclaim(&host_mc, target);
>                 break;
> +#ifdef CONFIG_NVHE_EL2_DEBUG
> +       case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
> +               hyp_alloc_selftest_reclaim(&host_mc, target);
> +               break;
> +#endif
>         default:
>                 ret = -EINVAL;
>         }
> @@ -804,6 +836,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_hyp_topup),
>         HANDLE_FUNC(__pkvm_hyp_reclaim),
>         HANDLE_FUNC(__pkvm_hyp_reclaimable),
> +       HANDLE_FUNC(__pkvm_hyp_alloc_selftest),
>
>         HANDLE_FUNC(__pkvm_host_share_hyp),
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index a82e773a1c2d..d28422f5c3d6 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -326,6 +326,22 @@ static int __init pkvm_drop_host_privileges(void)
>         return ret;
>  }
>
> +void __init pkvm_selftests(void)
> +{
> +#ifdef CONFIG_NVHE_EL2_DEBUG
> +       int ret = pkvm_call_hyp_req(__pkvm_hyp_alloc_selftest);
> +       unsigned long reclaimed;
> +
> +       reclaimed = pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC_SELFTEST, ULONG_MAX);
> +
> +       /* On failure, not all the pages may be reclaimable */
> +       if (!ret)
> +               WARN_ON(reclaimed != 6 /* SELFTEST_MAX_PAGES */);
> +       else
> +               kvm_err("pKVM hyp allocator selftest failed (%d)\n", ret);
> +#endif
> +}
> +
>  static int __init finalize_pkvm(void)
>  {
>         int ret;
> @@ -652,6 +668,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
>         case PKVM_HYP_REQ_HYP_ALLOC:
>                 ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
>                 break;
> +       case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
> +               ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC_SELFTEST, req->mem.nr_pages);
> +               break;
>         }
>
>         trace_kvm_handle_pkvm_hyp_req(req, ret);
> --
> 2.55.0.508.g3f0d502094-goog
>

