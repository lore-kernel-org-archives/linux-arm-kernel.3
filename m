Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87EFCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rG5wySvs2oUZJVF6HVTs7KPDzE7lZ9sNXiGfKf/Pxg=; b=a93QcxRnPRcn+Mnnje2/eOfPNr
	CuVwy9YksfCMUQ6Ned/qm2nq4d46fAOyZiW8Sqm5rAAqN+ES4wWl7MvS/WXS05ZxkwW+gowB7v3FC
	Tll7djIdh3YOvAyA4et3uXO+DWEVJaoiBpN4ZpSkSH3fJX63/HLPMHDCfYkv1BF2IQHRHC2sV0Ehl
	RxWvKaAA4sukDuKBhxa+ff1lsC7PCkclgbCT3QDhqWxTVdEfpajG5Nbb3aVDu4CyVwHLq80GC+nfK
	C53k7Hi6SxoxmYwuSSAWIYBwg14smhjlAzKLdQdOULIXvvoAHGEnbfDcNocht4VIid3pqfA7pc6Kp
	F+r9yJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCyr-00000008Lbw-1SNS;
	Thu, 01 Oct 2026 09:21:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCyo-00000008LbD-1sqd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:21:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F063497;
	Thu,  1 Oct 2026 02:21:25 -0700 (PDT)
Received: from [10.57.54.170] (unknown [10.57.54.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7853F86F;
	Thu,  1 Oct 2026 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790846489; bh=itx6cg5qF4Phs7uk7aKvZIOuwEWTRzAVMUPugNJgUbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AJ/AeVQ0yhcreVDbIHMyfPEQNqg8WCn89+CA3IJEow5+s37U6hMg/z8mFMLaQ/q7M
	 EfVFkHyC28IvgMQPaidSn2v5IgSTKUJBzPtnw+hglTcT2uUHiehe0PmBEkuvaossKS
	 E9BVG8FIGSsTHcvnj971+AoJpL2qIk9GItzFP0Kg=
Message-ID: <7a0ae99a-2ee2-4247-b703-8d5922787e40@arm.com>
Date: Thu, 1 Oct 2026 11:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] cache: add SMCCC-backed cache invalidate provider
To: Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, treding@nvidia.com,
 jonathanh@nvidia.com, bence.csokas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
 <20260910082142.1522865-3-smadhavan@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260910082142.1522865-3-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_022130_584322_B54F1AD8 
X-CRM114-Status: GOOD (  31.32  )
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

On 9/10/26 10:21, Srirangan Madhavan wrote:
> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
> 
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.

Is there any chance you could hook this up to the new Arm SMCCC bus? 
Looks like Aneesh's series[1] is now queued for v7.4. You would just 
need to pick the first two patches, then replicate the work that's done 
in patch 2/8.

The rest looks okay on a first glance, but can you please mention the 
respective spec document (Arm DEN0028) somewhere, ideally at the top of 
the file and maybe in the commit message?

Cheers,
Andre

[1] 
https://lore.kernel.org/linux-arm-kernel/179026658584.3654431.7189876471375206962.b4-ty@b4/

> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>
> ---
>   drivers/cache/Kconfig           |  11 +++
>   drivers/cache/Makefile          |   2 +
>   drivers/cache/arm_smccc_cache.c | 149 ++++++++++++++++++++++++++++++++
>   3 files changed, 162 insertions(+)
>   create mode 100644 drivers/cache/arm_smccc_cache.c
> 
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 1518449d47b5..57fd1823dec5 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
>   
>   if CACHEMAINT_FOR_HOTPLUG
>   
> +config ARM_SMCCC_CACHE
> +	bool "Arm SMCCC cache maintenance provider"
> +	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
> +	help
> +	  Enable support for the Arm SMCCC cache clean+invalidate
> +	  interface as a provider for memory hotplug-like cache
> +	  maintenance operations.
> +	  The provider registers only when firmware advertises the
> +	  SMCCC calls and attributes, so systems without firmware support
> +	  continue without this registered provider.
> +
>   config HISI_SOC_HHA
>   	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
>   	depends on (ARM64 && ACPI) || COMPILE_TEST
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index b3362b15d6c1..55736a032d6f 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
>   obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
>   obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
>   
> +# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
> +obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
>   obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
> new file mode 100644
> index 000000000000..1cfa8f8809d0
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/cache_coherency.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/nmi.h>
> +
> +#define SMCCC_CACHE_MAX_RETRIES		5
> +#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
> +#define SMCCC_CACHE_MAX_DELAY_US	20000UL
> +
> +struct smccc_cache {
> +	/* Must be first member */
> +	struct cache_coherency_ops_inst cci;
> +	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
> +	u64 rate_limit;
> +	u32 latency_us;
> +};
> +
> +static int smccc_cache_status_to_errno(s32 status)
> +{
> +	switch (status) {
> +	case SMCCC_RET_SUCCESS:
> +		return 0;
> +	case SMCCC_RET_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case SMCCC_RET_INVALID_PARAMETER:
> +		return -EINVAL;
> +	case SMCCC_RET_RATE_LIMITED:
> +		return -EAGAIN;
> +	case SMCCC_RET_BUSY:
> +		return -EBUSY;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
> +{
> +	unsigned long delay_us = 0;
> +
> +	if (cache->rate_limit)
> +		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
> +
> +	if (cache->latency_us)
> +		delay_us = max(delay_us, (unsigned long)cache->latency_us);
> +
> +	/*
> +	 * Firmware may advertise neither a rate limit nor a latency hint; use
> +	 * a small bounded backoff instead of retrying in a tight loop.
> +	 */
> +	if (!delay_us)
> +		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
> +
> +	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
> +}
> +
> +static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +			     struct cc_inval_params *invp)
> +{
> +	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
> +	unsigned long delay_us = smccc_cache_delay_us(cache);
> +	struct arm_smccc_res res = {};
> +	int ret;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Serialize the full retry sequence. With the default bounds, a caller
> +	 * may hold the mutex across up to five 20ms backoff sleeps.
> +	 */
> +	guard(mutex)(&cache->lock);
> +
> +	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
> +		/* Long firmware operations can trigger watchdog checks. */
> +		touch_nmi_watchdog();
> +
> +		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
> +				     invp->addr, invp->size, 0UL, &res);
> +
> +		ret = smccc_cache_status_to_errno((s32)res.a0);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret != -EBUSY && ret != -EAGAIN)
> +			return ret;
> +
> +		fsleep(delay_us);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct cache_coherency_ops smccc_cache_ops = {
> +	.wbinv = smccc_cache_wbinv,
> +};
> +
> +static int __init smccc_cache_init(void)
> +{
> +	struct arm_smccc_res res = {};
> +	struct smccc_cache *cache;
> +	int ret;
> +
> +	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_1)
> +		return -ENODEV;
> +
> +	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE)
> +		return -ENODEV;
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
> +			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION, &res);
> +	if ((s32)res.a0 < 0)
> +		return -ENODEV;
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
> +			     &res);
> +	if ((s32)res.a0)
> +		return -ENODEV;
> +
> +	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
> +						   struct smccc_cache, cci);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	mutex_init(&cache->lock);
> +	cache->latency_us = lower_32_bits(res.a2);
> +	cache->rate_limit = res.a3;
> +
> +	ret = cache_coherency_ops_instance_register(&cache->cci);
> +	if (ret) {
> +		mutex_destroy(&cache->lock);
> +		cache_coherency_ops_instance_put(&cache->cci);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +arch_initcall(smccc_cache_init);


