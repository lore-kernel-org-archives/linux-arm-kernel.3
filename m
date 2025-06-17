Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3ECC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVh2YaVH6s2xsA/xltN9wTTjv9RAdQiVBo76lbMcwHY=; b=B/NAxu8Jeuv5hdbQD/tP7nV4Cf
	P7RB+V+oILNQ33GRb1/dvvOhHgMRzQ78RnkeQidTHYZs86GSPcKb7W4ebykGmcvtXdgnqmDIadiNc
	33OQB9vyQ3GdmMci4Y5jISwl0G4ipTCQuxq38S7L+Atrj4cjPiUw4Xina78pRcJcR4IcreDxy8J/d
	3HqeOpRpvUVHGyQ3h/HpksY1fX7m9pSGJmXEQL6aCBd2JtBjN70byAEwUt1K6vpNsUskHAvPPwfju
	qgESJN4EVuBkJyUShu0id2S5pHAemo6pZy8TZgTtdDGprkMVZgVEWyYAKVKiNUsP3QB42f06dwPFT
	Wz4DoIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrV-000000080C3-2aQG;
	Tue, 17 Jun 2025 17:12:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYx3-00000007qez-45TL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:14:23 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMBkX4PRVz6M4HK;
	Wed, 18 Jun 2025 00:13:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6906814011D;
	Wed, 18 Jun 2025 00:14:14 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:14:13 +0200
Date: Tue, 17 Jun 2025 17:14:10 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 3/5] arm64: cacheinfo: Provide helper to compress MPIDR
 value into u32
Message-ID: <20250617171410.000004cf@huawei.com>
In-Reply-To: <20250613130356.8080-4-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-4-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_091422_304095_9D080436 
X-CRM114-Status: GOOD (  25.46  )
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

On Fri, 13 Jun 2025 13:03:54 +0000
James Morse <james.morse@arm.com> wrote:

> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest MPIDR of the CPUs
> associated with that cache. The cache-id exposed to user-space has
> historically been 32 bits.
> 
> MPIDR values may be larger than 32 bits.
> 
> MPIDR only has 32 bits worth of affinity data, but the aff3 field lives
> above 32bits. The corresponding lower bits are masked out by
> MPIDR_HWID_BITMASK and contain an SMT flag and Uni-Processor flag.
> 
> Swizzzle the aff3 field into the bottom 32 bits and using that.
> 
> In case more affinity fields are added in the future, the upper RES0
> area should be checked. Returning a value greater than 32 bits from
> this helper will cause the caller to give up on allocating cache-ids.
Hi James,

I'd mention that in the code via a comment, not just the commit message.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Seems a few unrelated tiny things snuck in here.

Otherwise seems fine to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/include/asm/cache.h | 14 ++++++++++++++
>  arch/arm64/kernel/sleep.S      |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
> index 99cd6546e72e..f8798dc96364 100644
> --- a/arch/arm64/include/asm/cache.h
> +++ b/arch/arm64/include/asm/cache.h
> @@ -42,6 +42,7 @@
>  
>  #include <asm/cputype.h>
>  #include <asm/mte-def.h>
> +#include <asm/suspend.h>
That seems a little random?  Why?
>  #include <asm/sysreg.h>
>  
>  #ifdef CONFIG_KASAN_SW_TAGS
> @@ -87,6 +88,19 @@ int cache_line_size(void);
>  
>  #define dma_get_cache_alignment	cache_line_size
>  
> +/* Compress a u64 MPIDR value into 32 bits. */
> +static inline u64 arch_compact_of_hwid(u64 id)
> +{
> +	u64 aff3 = MPIDR_AFFINITY_LEVEL(id, 3);
> +
> +	/* These bits are expected to be RES0 */
> +	if (FIELD_GET(GENMASK_ULL(63, 40), id))
> +		return id;

I would add a comment that the way this fails is to ensure
there are bits in the upper bits.  It is a little unusual
as APIs go but matches the not defined variant so sort of
makes sense.

> +
> +	return (aff3 << 24) | FIELD_GET(GENMASK_ULL(23, 0), id);
> +}
> +#define arch_compact_of_hwid	arch_compact_of_hwid
> +
>  /*
>   * Read the effective value of CTR_EL0.
>   *
> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> index f093cdf71be1..ebc23304d430 100644
> --- a/arch/arm64/kernel/sleep.S
> +++ b/arch/arm64/kernel/sleep.S
> @@ -50,6 +50,7 @@
>  	lsr	\mask ,\mask, \rs3
>  	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>  	.endm
> +

Stray change.

>  /*
>   * Save CPU state in the provided sleep_stack_data area, and publish its
>   * location for cpu_resume()'s use in sleep_save_stash.


