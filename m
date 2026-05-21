Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8542FCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p+8Nr6E0VL6GhBOYJY06nl62Yjz51huI/JrQA0+jhE=; b=YdhSszqPOpR+BuqOTA6Qw2lMqh
	5KXZsBdJihdomUgL/kRcDPqnYxJpNutwxvHpSwysoySSACYLEkUhT3BAHgM6by6XxA+t33kJTUpiJ
	0pRqJX6EQYR90QgUwVnqgpOZHxAzQmEQVPOQvq5uyOe1fEbqA+c6jwrTtC3LY8dFa2ArGW1X+z6um
	NyPv9ny8jKvucpvI6bToOZ2HfV8YnxFP5Ykfr+euA3RIwGqN9ARc1/q9rEsTq8bRH4IM5ohNLbo+L
	6ZqMqknhIgvw6c6KB2+aimFiSDYhcN/mG9tq2bOX9HlgymZyPVYNeuyZZ0cQ6eyc1v1Bmmj+xdLX7
	XJ7jO1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1Q2-00000007ZnA-1YMH;
	Thu, 21 May 2026 11:18:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1Q0-00000007Zmj-3Lqp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:18:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C579660172;
	Thu, 21 May 2026 11:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67561F000E9;
	Thu, 21 May 2026 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779362303;
	bh=4p+8Nr6E0VL6GhBOYJY06nl62Yjz51huI/JrQA0+jhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TaiCVkxq1y7ekuIuH/7x0ZvnwIrKupHl+2ZUl3WcHTgg1Ef+h13eRzdEm0ow+5eGN
	 ew7zdWBXI+MUL24vVIY88jTUJmcuM3mj7Jil1QisebFrZNWYwV2cC3F//rhL6uZMK4
	 WV3zSURyqr01jUKv162G++0B6FGnsQ6uSia5jZuXnmXz194OEr0FtijvKQozoNLvMq
	 +QSwvzKFfTmn3aiaUCiFS+Ti4+PFp+lZ8xeHPOdXDbAjP360t9EE8UDkhJP1ubfAJp
	 TplIHPJugCTUJtmlw8XogDTFjdObYrF36eLqDpwHgMBKSgvymMRELm/4Irvq6Mlsd+
	 obLa1LcvQjhaA==
Date: Thu, 21 May 2026 12:18:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@arm.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vsethi@nvidia.com, jevans@nvidia.com, raghupathyk@nvidia.com,
 srikars@nvidia.com, nbenech@nvidia.com, alwilliamson@nvidia.com, Dan
 Williams <danwilliams@nvidia.com>
Subject: Re: [RFC PATCH 2/2] arm64: mm: add SMCCC-backed cache invalidate
 provider
Message-ID: <20260521121812.2e4abd71@jic23-huawei>
In-Reply-To: <20260521073047.320614-3-smadhavan@nvidia.com>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
	<20260521073047.320614-3-smadhavan@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 21 May 2026 07:30:47 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add an arm64 cache maintenance backend that discovers SMCCC cache
> clean+invalidate support, queries attributes, handles transient BUSY and
> RATE_LIMITED responses with bounded retries, and registers with the generic
> cache coherency framework.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Hi Srirangan,

Other than the file location and Kconfig option comments, everything else
is really trivial. + some musings about maybe being worth more clever
fusing of ops in the future if it turns out to be useful.

Thanks,

Jonathan


> ---
>  MAINTAINERS                 |   1 +
>  arch/arm64/mm/Makefile      |   1 +
>  arch/arm64/mm/cache_maint.c | 180 ++++++++++++++++++++++++++++++++++++

File location wise, this is a driver for a subsystem, be it one closely
coupled to arm.  Arm maintainers, do you want it in there or in drivers/cache ?
My personal preference is always to keep drivers with subsystems but I don't
care that much.

>  3 files changed, 182 insertions(+)
>  create mode 100644 arch/arm64/mm/cache_maint.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..33c35f8e6e40 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25383,6 +25383,7 @@ M:	Jonathan Cameron <jic23@kernel.org>
>  S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/cache/
> +F:	arch/arm64/mm/cache_maint.c

I wonder if this should just have a separate maintainers entry? 
We did that for the hisi driver.

If not maybe add yourself as at least a Reviewer so that you get +CC'd
on relevant changes.

Conor, what do you think makes sense here.
 
>  F:	drivers/cache
>  F:	include/linux/cache_coherency.h
>  F:	lib/cache_maint.c
> diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
> index c26489cf96cd..b247dc5dfd45 100644
> --- a/arch/arm64/mm/Makefile
> +++ b/arch/arm64/mm/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
>  obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
>  obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
>  obj-$(CONFIG_ARM64_GCS)		+= gcs.o
> +obj-$(CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION) += cache_maint.o

I think this should have a separate CONFIG because it is only one option
for how to do it on arm64.  The Hisi driver being the other one already
upstream.  That will be easier if this is in drivers/cache as can go
in the existing menu.



>  KASAN_SANITIZE_physaddr.o	+= n
>  
>  obj-$(CONFIG_KASAN)		+= kasan_init.o
> diff --git a/arch/arm64/mm/cache_maint.c b/arch/arm64/mm/cache_maint.c
> new file mode 100644
> index 000000000000..ea7dd30d5dfa
> --- /dev/null
> +++ b/arch/arm64/mm/cache_maint.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm64 cache maintenance provider using SMCCC cache clean+invalidate calls.
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
> +#define SMCCC_CACHE_MAX_DELAY_US	20000
> +
> +/* DEN0028 v1.7: bit[0] == 1 means implementation flushes all caches globally */
> +#define SMCCC_CACHE_ATTR_GLOBAL_OP	BIT(0)
> +
> +struct arm64_smccc_cache {
> +	/* Must be first member */
> +	struct cache_coherency_ops_inst cci;
> +	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
> +	u32 latency_us;
> +	u32 rate_limit;
> +	bool global_op;
> +	u64 global_flush_gen;
> +};
> +
> +static struct arm64_smccc_cache *arm64_smccc_cache;

Whilst it is harmless, why do we need the global?  I don't think anything outside
of init() ever uses it.  Given there is no exit() anyway, might as well just leak
the pointer.

> +
> +static int smccc_cache_status_to_errno(s32 status)
> +{
> +	switch (status) {
> +	case SMCCC_RET_SUCCESS:
> +		return 0;
> +	case SMCCC_RET_NOT_SUPPORTED:
> +	case SMCCC_RET_NOT_REQUIRED:

I'm not seeing this in the list of possible errors and
I'm far from sure what it would mean in this case if we got it!
Maybe it would indicate that the cache was known not dirty for
some reason. I'd left default deal with this one probably.


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
> +static int smccc_cache_delay_us(const struct arm64_smccc_cache *cache)
> +{
> +	u64 delay_us = 0;
> +
> +	if (cache->rate_limit)
> +		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
> +
> +	if (cache->latency_us)
> +		delay_us = max_t(u64, delay_us, cache->latency_us);

max() should be fine here I think.

> +
> +	if (!delay_us)
> +		delay_us = 1000;

Why?  Needs a comment I think.

> +
> +	return min_t(u64, delay_us, SMCCC_CACHE_MAX_DELAY_US);

The type forcing needed?  I might be missing why min() isn't fine here.
Doesn't seem to be in the list in the minmax.h docs for when you can't
just use min().

> +}
> +
> +static int arm64_smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +				   struct cc_inval_params *invp)
> +{
> +	struct arm64_smccc_cache *cache =
> +		container_of(cci, struct arm64_smccc_cache, cci);
> +	struct arm_smccc_res res = {};
> +	int delay_us = smccc_cache_delay_us(cache);
> +	u64 gen = 0;
> +	s32 status;
> +	int ret;
> +	int i;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	if (cache->global_op)
> +		gen = READ_ONCE(cache->global_flush_gen);
> +
> +	guard(mutex)(&cache->lock);
> +
> +	/*
> +	 * If firmware reports a global operation type, a successful operation
> +	 * covers every request that was already waiting behind it. Skip if the
> +	 * generation advanced while this request was waiting to enter the
> +	 * serialized firmware call path.

Perhaps call out that the serialization is on the lock. I read this as
there being another level of serialization going on and got confused ;)

Can see there might be further improvements to the non global case
using same principle you have here. I guess leave those until we have
any info on whether they are useful.

> +	 */
> +	if (cache->global_op && gen != READ_ONCE(cache->global_flush_gen))
> +		return 0;
> +
> +	for (i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {

Can drag the int i in here, maybe make it unsigned too.
	for (unsigned int i = 0; i <...
This is becoming widely accepted in kernel code these days.

> +		/* Long firmware operations can trigger watchdog checks. */
> +		touch_nmi_watchdog();
> +
> +		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
> +				     invp->addr, invp->size, 0UL, &res);
> +		status = (s32)res.a0;
> +		ret = smccc_cache_status_to_errno(status);
Given status isn't used for anything else - tiny bit neater perhaps as
		ret = smccc_cache_status_to_errno((s32)res.a0);

> +		if (!ret) {
> +			if (cache->global_op) {
> +				WRITE_ONCE(cache->global_flush_gen,
> +					   cache->global_flush_gen + 1);
> +			}
> +			return 0;
> +		}
> +
> +		if (ret != -EBUSY && ret != -EAGAIN)
> +			return ret;
> +
> +		usleep_range(delay_us, delay_us + 100);

fsleep() for this sort of thing in modern code.

> +	}
> +
> +	return -EBUSY;
> +}

> +
> +static int __init arm64_smccc_cache_init(void)
> +{
> +	struct arm_smccc_res res = {};
> +	s32 status;
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
> +	status = (s32)res.a0;
> +	if (status < 0)
> +		return -ENODEV;

Maybe there is convention for this, but feels a bit odd to return -ENODEV
for a feature check on a 'device' we are talking to.  Maybe -EOPNOTSUPP?
Anyhow, that's a question for SMCCC folk.   The only error that could
be returned is NOT_SUPPORTED and you do that above for the returns from
actual calls.
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
> +			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES, &res);
> +	status = (s32)res.a0;
> +	if (status < 0)
> +		return -ENODEV;
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES, &res);
> +	status = (s32)res.a0;
> +	if (status)
> +		return -ENODEV;
> +
> +	arm64_smccc_cache =
> +		cache_coherency_ops_instance_alloc(&arm64_smccc_cache_ops,
> +						   struct arm64_smccc_cache,
> +						   cci);

I'd go long on that just for readability but not important.

> +	if (!arm64_smccc_cache)
> +		return -ENOMEM;
> +
> +	mutex_init(&arm64_smccc_cache->lock);
> +	arm64_smccc_cache->latency_us = lower_32_bits(res.a2);
> +	arm64_smccc_cache->rate_limit = lower_32_bits(res.a3);
> +	arm64_smccc_cache->global_op = !!(res.a1 & SMCCC_CACHE_ATTR_GLOBAL_OP);
> +
> +	ret = cache_coherency_ops_instance_register(&arm64_smccc_cache->cci);
> +	if (ret) {
> +		cache_coherency_ops_instance_put(&arm64_smccc_cache->cci);
> +		arm64_smccc_cache = NULL;
> +		return ret;
> +	}
> +
> +	pr_info("SMCCC cache clean+invalidate provider registered\n")

Trivial: blank line here.  Just helps the error path stand out vs the
print.



> +	return 0;
> +}
> +arch_initcall(arm64_smccc_cache_init);


