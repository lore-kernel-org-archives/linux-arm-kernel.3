Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF817C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7mWHBw7QzLSxFbq6GSMeD2CyKFXPOF7QCXIVBF4Q70=; b=p6CBzHAARbAgHpRyc87CaRIleG
	qxvltgyOs6hldaIm9wIbIxyAxNaNBcWzh1LbnhB4m50ndwtQ/p8wpnSJhOyPy/eZr2rlZQc/j4li/
	7mA4OVDr0q/qMI2brRYo6Siei8Ay+neeDEIjD562A5nWLfRVfl0J67YjUQYwTFaee72wzvOalNKow
	W6h0osMDZ50Dxl39VPqz3Gp7YoBnVKQrLqWMyLMX9QTUB3QmoPmkeYIm076VE3/uVoh3kzp4mGcRg
	2IuCuWF9ZZu6WZQ2x+5wL2LGtYxmEyz/+K+Wc6GEHIFZGe/zgjpk02Ni2Fe6KGjzUimywnBeEpYdc
	0/vvLRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65lj-00000003XOd-2R2y;
	Mon, 14 Sep 2026 12:26:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65lf-00000003XNb-24Ck
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:26:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86AD71570;
	Mon, 14 Sep 2026 05:26:34 -0700 (PDT)
Received: from [10.57.9.62] (unknown [10.57.9.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A34EA3F86F;
	Mon, 14 Sep 2026 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789388798; bh=3SiEUD+FLTR5IU8WjLwWUJt6wQejk4v6fFAbtoxbr0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FEkTsBBZjdpjEMHPF1DPcXgmXQhjctfyM28rgUv4e3OqPOhNBAxaAoinvg40kDb+T
	 lghqQ6dI4q/7uAkMqKM/Y+8KnvL5y84rGZJJ7IO8My7wrnEQQjX1g/1My8k82qmhnu
	 lXyt3EhlA7XIbK0OVxt38Ep08gUhH2dAF0MVTB5I=
Message-ID: <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
Date: Mon, 14 Sep 2026 14:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
 Rob Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Ben Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_052639_660648_16D816DE 
X-CRM114-Status: GOOD (  27.67  )
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

On 9/14/26 11:37, Yin Li wrote:
> From: James Morse <james.morse@arm.com>
> 
> The MPAM driver identifies caches by id for use with resctrl. It
> needs to know the cache-id when probe-ing, but the value isn't set
> in cacheinfo until device_initcall(). Even after device_initcall(),
> the cache-id is only available if at least one CPU associated with
> the cache is online.
> 
> Instead of making the driver wait, expose the code that generates the
> cache-id. The parts of the MPAM driver that run early can use this to
> set up the resctrl structures before cacheinfo is ready in
> device_initcall().
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> [ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
>    cache_of_calculate_id() declaration with CONFIG_OF to prevent build
>    errors when CONFIG_OF is not set ]

You can shorten that part in square brackets: doing adjustments due to 
rebasing is surely implied, and you can shorten the rest, like:
[ Yin Li: guard cache_of_calculate_id() prototype ]

Speaking of which ...

> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>   include/linux/cacheinfo.h |  3 +++
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 9f9c72727a05..f75e7f64038b 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
>   #define arch_compact_of_hwid(_x)	(_x)
>   #endif
>   
> -static void cache_of_set_id(struct cacheinfo *this_leaf,
> -			    struct device_node *cache_node)
> +u32 cache_of_calculate_id(struct device_node *cache_node)
>   {
>   	struct device_node *cpu;
>   	u32 min_id = ~0;
> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>   		id = arch_compact_of_hwid(id);
>   		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>   			of_node_put(cpu);
> -			return;
> +			return ~0;
>   		}
>   
>   		if (match_cache_node(cpu, cache_node))
>   			min_id = min(min_id, id);
>   	}
>   
> -	if (min_id != ~0) {
> -		this_leaf->id = min_id;
> +	return min_id;
> +}
> +
> +static void cache_of_set_id(struct cacheinfo *this_leaf,
> +			    struct device_node *cache_node)
> +{
> +	u32 id = cache_of_calculate_id(cache_node);
> +
> +	if (id != ~0) {
> +		this_leaf->id = id;
>   		this_leaf->attributes |= CACHE_ID;
>   	}
>   }
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index fc879ac4cc4f..c33bb3c8bd63 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>   #endif
>   
>   const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
> +#ifdef CONFIG_OF

Why is that, exactly? First IIUC it's quite uncommon to use #ifdef 
guards around prototypes (unless they are stubbed without the symbol 
defined). Using types protected by those symbols if certainly another 
reason, and it looks like this would be the case here, but I had no 
trouble building the kernel for x86, where CONFIG_OF is not defined.
So can you share a .config example (or give a hint) as to where this 
fails building?
And if it does, wouldn't it be better to always include <linux/of.h> in 
that file instead? I think I see a similar pattern elsewhere 
(rfkill-gpio.c, sound/ac97/bus.c).

Cheers,
Andre


> +u32 cache_of_calculate_id(struct device_node *np);
> +#endif
>   
>   /*
>    * Get the cacheinfo structure for the cache associated with @cpu at
> 


