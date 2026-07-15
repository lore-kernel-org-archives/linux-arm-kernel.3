Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E030CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJsZ3i2gDUlzaSHHJETUg/wNazIwtjRRWDNlME1KGMw=; b=rJYNGHOdHhG/VzSJLa/YVAYjmX
	bhnL0pQXD1LPzzSWUTN6QMc4y6S8TAFBl3UdLrtz2y++YMGnt7DRbf3KVTM3fiEeLyJ0CGh6Fznnf
	Fj8O8Kn3daCjyQ0QRhBCZUW+fJ1HckwyCGcC0BbXQ6ub2v4LmW1ALwIT5cNRt28YrKnd6I3Hdp9d2
	v5hAS8FvPYzSwwZP3JJEjemU/emwAECccowXyozHBhFLB4h93XnF6qg/2LSkTQjv2WejaHlzCdFY/
	zv5IYd4TiOrcWsBckIoSVYpc5AQEJl+ccup+VGIoXhBJF5eD1njWCVzwEqTuV+91wiaTrTmIYDw9e
	/loZ3pNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxU5-0000000EXTB-0MtN;
	Wed, 15 Jul 2026 11:09:01 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxU2-0000000EXSC-0lYv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:09:00 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqKwgSw5ZmHlvFEMUbmRL+X974v2oa0fSNtaExMBkYxX32j9jobYMFJKWjweZJNHFmv9NV63QEWeUdZIbe9tWa+@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784113735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LJsZ3i2gDUlzaSHHJETUg/wNazIwtjRRWDNlME1KGMw=;
	b=erIEkCzTJA9n2zmJso6/CH7T6FvaiIWIFF1YOvEVcBqQpfJIIIuQT6T17GS6MTjKVOHBCm
	izEnkZ1RyoQbagBZ1jQ+yaE2b0avTNGCqu1iTD66vnfWRoJX0DLW5PR8vaHUJnEZKhexiw
	t2bgn5gKRHMg8JkxPbnL1txBv4eaVKA=
X-Gm-Message-State: AOJu0YwugGCIkjyZGfavUxBAyUePYEe8R606xEukjHOdjCyACe6S3Hc/
	vC607e8avbbTXJYzJ95lOFY4c8/rnL6JeYzz2Hymx6RVTFV4a/cYdpRQzIWPNlZ4FfuHgyp9gbk
	UajvjNmMwLahpeDEoVlcG/ZvtNjYZbl5z621NkRPa
X-Received: by 2002:ac8:5884:0:b0:51c:7a8b:c401 with SMTP id
 d75a77b69052e-51d7bdc0864mr24995131cf.26.1784113702326; Wed, 15 Jul 2026
 04:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-11-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-11-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 12:07:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyN9ZO728fkcBQf5QR95_uHnZ9xEF8Uf4NJccQKhSKvoQ@mail.gmail.com>
X-Gm-Features: AUfX_mzvujg6cg9nw2ENEYM5m0ry-kDJyaAU1QoIf2SLznR0ilMmAO3syHrI2AA
Message-ID: <CA+EHjTyN9ZO728fkcBQf5QR95_uHnZ9xEF8Uf4NJccQKhSKvoQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] KVM: arm64: Add selftests for the pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040858_817924_0A67D142 
X-CRM114-Status: GOOD (  26.01  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
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
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index b427ef790b15..07a46860c8b2 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -117,6 +117,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
>         __KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
>         __KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_selftest,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
>  };
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 3a8590d1793e..5837c2d7928a 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -19,6 +19,7 @@
>
>  enum pkvm_topup_id {
>         PKVM_TOPUP_HYP_ALLOC,
> +       PKVM_TOPUP_HYP_ALLOC_SELFTEST,
>  };
>
>  unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target);
> @@ -209,6 +210,7 @@ struct pkvm_mapping {
>  enum pkvm_hyp_req_type {
>         PKVM_HYP_NO_REQ = 0,
>         PKVM_HYP_REQ_HYP_ALLOC,
> +       PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
>         __PKVM_HYP_REQ_TYPE_MAX,
>  };
>
> @@ -236,6 +238,7 @@ static inline size_t pkvm_hyp_req_arg_size(u8 type)
>         case PKVM_HYP_NO_REQ:
>                 return 0;
>         case PKVM_HYP_REQ_HYP_ALLOC:
> +       case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
>                 return sizeof(req->mem);
>         default:
>                 WARN_ON(1);
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
> index 07ef0a13855f..e7114dde9142 100644
> --- a/arch/arm64/kvm/hyp/nvhe/alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/alloc.c
> @@ -1007,9 +1007,17 @@ int hyp_alloc_errno(void)
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
> @@ -1031,3 +1039,179 @@ u32 hyp_alloc_topup_needed(void)
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
> index 8fbebe64a93d..105313bb3dd9 100644
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
> @@ -826,6 +858,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_hyp_topup),
>         HANDLE_FUNC(__pkvm_hyp_reclaim),
>         HANDLE_FUNC(__pkvm_hyp_reclaimable),
> +       HANDLE_FUNC(__pkvm_hyp_alloc_selftest),
>  };
>
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index eb4c60a0db5a..f7e1846d6093 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -137,6 +137,7 @@ unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
>  {
>         return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
>  }
> +
>  static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
>  {
>         if (pkvm_hyp_vm_is_created(kvm)) {
> @@ -325,6 +326,22 @@ static int __init pkvm_drop_host_privileges(void)
>         return ret;
>  }
>
> +static void __init pkvm_selftests(void)
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
> @@ -345,6 +362,9 @@ static int __init finalize_pkvm(void)
>         if (ret)
>                 pr_err("Failed to finalize Hyp protection: %d\n", ret);
>
> +       if (!ret)
> +               pkvm_selftests();
> +
>         return ret;
>  }
>  device_initcall_sync(finalize_pkvm);
> @@ -651,6 +671,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
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
> 2.55.0.rc2.803.g1fd1e6609c-goog
>
>

