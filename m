Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1BDD39007
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/sewLRpBf86AunBfKVmA/0VbLyi/wDArFs0Pgue5Yg=; b=qg5twvMOAagicBivLYwx6SbE9K
	F5tWKd3ZxHU//6p9oXTO4IkFRGquaOA2PbpTTcCONMA258GaPjE4YM3C+7MhSLiFv3BOJolKW0UG5
	YgdbHUqFtwoyPyyeklrVaikia9DDRVK7nGI6ZcxzKX4K6+V9rszJarXyG2Uw+tZAyIKWn18m70i4S
	FL1ilni/a3OKAFLM0UHBvFJ0N04cU5ZilxsHqY9DofXVJ1ogmdE8dexhC0PFVqbf2Za6/qt/ele5K
	rkupHGwSNcbUaPuM0Jrl714mHjqLQ23+iVC4+IhiOoGTi08MzAkkB9QABZ0HoOhCTu4V2dVWnlfan
	v18dNocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5YP-0000000AJg7-2Gdl;
	Wed, 14 Jan 2026 18:25:13 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5YN-0000000AJfT-2IRq;
	Wed, 14 Jan 2026 18:25:11 +0000
Message-ID: <d10116ae-fc21-42e3-8ee0-a68d3bb72425@infradead.org>
Date: Wed, 14 Jan 2026 10:25:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: errata: Workaround for SI L1 downstream
 coherency issue
To: Lucas Wei <lucaswei@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: sjadavani@google.com, stable@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260114145243.3458315-1-lucaswei@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260114145243.3458315-1-lucaswei@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,
I have a few comments/questions, please.

On 1/14/26 6:52 AM, Lucas Wei wrote:
> When software issues a Cache Maintenance Operation (CMO) targeting a
> dirty cache line, the CPU and DSU cluster may optimize the operation by
> combining the CopyBack Write and CMO into a single combined CopyBack
> Write plus CMO transaction presented to the interconnect (MCN).
> For these combined transactions, the MCN splits the operation into two
> separate transactions, one Write and one CMO, and then propagates the
> write and optionally the CMO to the downstream memory system or external
> Point of Serialization (PoS).
> However, the MCN may return an early CompCMO response to the DSU cluster
> before the corresponding Write and CMO transactions have completed at
> the external PoS or downstream memory. As a result, stale data may be
> observed by external observers that are directly connected to the
> external PoS or downstream memory.
> 
> This erratum affects any system topology in which the following
> conditions apply:
>  - The Point of Serialization (PoS) is located downstream of the
>    interconnect.
>  - A downstream observer accesses memory directly, bypassing the
>    interconnect.
> 
> Conditions:
> This erratum occurs only when all of the following conditions are met:
>  1. Software executes a data cache maintenance operation, specifically,
>     a clean or clean&invalidate by virtual address (DC CVAC or DC
>     CIVAC), that hits on unique dirty data in the CPU or DSU cache.
>     This results in a combined CopyBack and CMO being issued to the
>     interconnect.
>  2. The interconnect splits the combined transaction into separate Write
>     and CMO transactions and returns an early completion response to the
>     CPU or DSU before the write has completed at the downstream memory
>     or PoS.
>  3. A downstream observer accesses the affected memory address after the
>     early completion response is issued but before the actual memory
>     write has completed. This allows the observer to read stale data
>     that has not yet been updated at the PoS or downstream memory.
> 
> The implementation of workaround put a second loop of CMOs at the same
> virtual address whose operation meet erratum conditions to wait until
> cache data be cleaned to PoC. This way of implementation mitigates
> performance penalty compared to purely duplicate original CMO.
> 
> Cc: stable@vger.kernel.org # 6.12.x
> Signed-off-by: Lucas Wei <lucaswei@google.com>
> ---
> 
> Changes in v3:
> 
>  1. Fix typos
>  2. Remove 'lkp@intel.com' from commit message
>  3. Keep ARM within a single section
>  4. Remove workaround of #4311569 from `cache_inval_poc()`
> 
> Changes in v2:
> 
>  1. Fixed warning from kernel test robot by changing
>     arm_si_l1_workaround_4311569 to static
>     [Reported-by: kernel test robot <lkp@intel.com>]
> 
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  1 +
>  arch/arm64/Kconfig                          | 19 +++++++++++++
>  arch/arm64/include/asm/assembler.h          | 10 +++++++
>  arch/arm64/kernel/cpu_errata.c              | 31 +++++++++++++++++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  5 files changed, 62 insertions(+)
> 

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..89326bb26f48 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1155,6 +1155,25 @@ config ARM64_ERRATUM_3194386
>  
>  	  If unsure, say Y.
>  
> +config ARM64_ERRATUM_4311569
> +	bool "SI L1: 4311569: workaround for premature CMO completion erratum"
> +	default y
> +	help
> +	  This option adds the workaround for ARM SI L1 erratum 4311569.
> +
> +	  The erratum of SI L1 can cause an early response to a combined write
> +	  and cache maintenance operation (WR+CMO) before the operation is fully
> +	  completed to the Point of Serialization (POS).
> +	  This can result in a non-I/O coherent agent observing stale data,
> +	  potentially leading to system instability or incorrect behavior.
> +
> +	  Enabling this option implements a software workaround by inserting a
> +	  second loop of Cache Maintenance Operation (CMO) immediately following the
> +	  end of function to do CMOs. This ensures that the data is correctly serialized
> +	  before the buffer is handed off to a non-coherent agent.
> +
> +	  If unsure, say Y.
> +
>  config CAVIUM_ERRATUM_22375
>  	bool "Cavium erratum 22375, 24313"
>  	default y

[snip]

> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 8cb3b575a031..5c0ab6bfd44a 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
>  	return (ctr_real != sys) && (ctr_raw != sys);
>  }
>  
> +#ifdef CONFIG_ARM64_ERRATUM_4311569
> +static DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
> +static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
> +{
> +	static_branch_enable(&arm_si_l1_workaround_4311569);
> +	pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
> +
> +	return 0;
> +}
> +early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
> +

It looks like all other errata don't use early_param() -- are they auto-detected?
Could this one be auto-detected?

> +/*
> + * We have some earlier use cases to call cache maintenance operation functions, for example,
> + * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
> + * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
> + * safe to have the workaround off by default.

But it's not off by default...

[snip]

thanks.
-- 
~Randy


