Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA318CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbUJHuak2u5MhS/qm2dIicmSf5kMrLrrJoF5h7UvVAU=; b=jLDjyjmUKB1wAQ66ZQQLzQN2Rh
	Cwb07JR46AY+9svrqdnCUhCtecS8AblNUyo6+VE1iav/+APNJdxsfTc5TNomKuInSj8zuP+l5ZcH7
	svqtjuTghVLvd80PFMk9jIMOBWNkeGiVADEUTyjXtMQklpYmXLYqRVNhd+y1yrL8GlQwuX85A8AcU
	cU0LG7j/qtLALFB6iVALhPKfsN7Dqzjv5clv5IoLFzskVCxS47wy8B9OW0I6n5PS8PAh8fuEsU9/W
	mytp5NVIzv4hBRsL7vv4wNrUXmq37HwbLN5rE2oMLfk08vkflIOskPbteo0uHA6KX6S5qV8gT5Uwh
	U2iYg43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuXA-00000002ak6-1j9x;
	Fri, 15 Aug 2025 13:31:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsND-00000002Ivs-1EkR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2547F43A44;
	Fri, 15 Aug 2025 11:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B8BC4CEEB;
	Fri, 15 Aug 2025 11:13:21 +0000 (UTC)
Date: Fri, 15 Aug 2025 12:13:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com, corbet@lwn.net,
	will@kernel.org, akpm@linux-foundation.org,
	scott@os.amperecomputing.com, jhubbard@nvidia.com,
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com,
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] kasan/hw-tags: introduce kasan.store_only option
Message-ID: <aJ8WTyRJVznC9v4K@arm.com>
References: <20250813175335.3980268-1-yeoreum.yun@arm.com>
 <20250813175335.3980268-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813175335.3980268-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041327_381171_F77461F0 
X-CRM114-Status: GOOD (  22.62  )
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

On Wed, Aug 13, 2025 at 06:53:34PM +0100, Yeoreum Yun wrote:
> diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
> index 2e98028c1965..3e1cc341d47a 100644
> --- a/arch/arm64/include/asm/mte-kasan.h
> +++ b/arch/arm64/include/asm/mte-kasan.h
> @@ -200,6 +200,7 @@ static inline void mte_set_mem_tag_range(void *addr, size_t size, u8 tag,
>  void mte_enable_kernel_sync(void);
>  void mte_enable_kernel_async(void);
>  void mte_enable_kernel_asymm(void);
> +int mte_enable_kernel_store_only(void);
>  
>  #else /* CONFIG_ARM64_MTE */
>  
> @@ -251,6 +252,11 @@ static inline void mte_enable_kernel_asymm(void)
>  {
>  }
>  
> +static inline int mte_enable_kenrel_store_only(void)
				^^^^^^
This won't build with MTE disabled (check spelling).

> +{
> +	return -EINVAL;
> +}
> +
>  #endif /* CONFIG_ARM64_MTE */
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9ad065f15f1d..7b724fcf20a7 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2404,6 +2404,11 @@ static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
>  
>  	kasan_init_hw_tags_cpu();
>  }
> +
> +static void cpu_enable_mte_store_only(struct arm64_cpu_capabilities const *cap)
> +{
> +	kasan_late_init_hw_tags_cpu();
> +}
>  #endif /* CONFIG_ARM64_MTE */
>  
>  static void user_feature_fixup(void)
> @@ -2922,6 +2927,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.capability = ARM64_MTE_STORE_ONLY,
>  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>  		.matches = has_cpuid_feature,
> +		.cpu_enable = cpu_enable_mte_store_only,

I don't think we should add this, see below.

>  		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTESTOREONLY, IMP)
>  	},
>  #endif /* CONFIG_ARM64_MTE */
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index e5e773844889..8eb1f66f2ccd 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -157,6 +157,20 @@ void mte_enable_kernel_asymm(void)
>  		mte_enable_kernel_sync();
>  	}
>  }
> +
> +int mte_enable_kernel_store_only(void)
> +{
> +	if (!cpus_have_cap(ARM64_MTE_STORE_ONLY))
> +		return -EINVAL;
> +
> +	sysreg_clear_set(sctlr_el1, SCTLR_EL1_TCSO_MASK,
> +			 SYS_FIELD_PREP(SCTLR_EL1, TCSO, 1));
> +	isb();
> +
> +	pr_info_once("MTE: enabled stonly mode at EL1\n");
> +
> +	return 0;
> +}
>  #endif

If we do something like mte_enable_kernel_asymm(), that one doesn't
return any error, just fall back to the default mode.

> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index 9a6927394b54..c2f90c06076e 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -219,6 +246,20 @@ void kasan_init_hw_tags_cpu(void)
>  	kasan_enable_hw_tags();
>  }
>  
> +/*
> + * kasan_late_init_hw_tags_cpu_post() is called for each CPU after
> + * all cpus are bring-up at boot.

Nit: s/bring-up/brought up/

> + * Not marked as __init as a CPU can be hot-plugged after boot.
> + */
> +void kasan_late_init_hw_tags_cpu(void)
> +{
> +	/*
> +	 * Enable stonly mode only when explicitly requested through the command line.
> +	 * If system doesn't support, kasan checks all operation.
> +	 */
> +	kasan_enable_store_only();
> +}

There's nothing late about this. We have kasan_init_hw_tags_cpu()
already and I'd rather have it all handled via this function. It's not
that different from how we added asymmetric support, though store-only
is complementary to the sync vs async checking.

Like we do in mte_enable_kernel_asymm(), if the feature is not available
just fall back to checking both reads and writes in the chosen
async/sync/asymm way. You can add some pr_info() to inform the user of
the chosen kasan mode. It's really mostly an performance choice.

-- 
Catalin

