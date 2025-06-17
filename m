Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5987C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XEcwPhn1HOgqrf21uPS++Wugj5vvBQMXMA6YzsQ1bw=; b=I0Xw7LoigQTyDnPjdpQoQW9WlD
	RRapIpgdroz+Y+LLueHRhZouK5FKwrkoO/5pRpONFLf5B3Al0W/46ug2h0Mq1Lwym8ilaC0bgJNRQ
	C/mChM9b8epDvHkvJU5DbUStB1+fwbpNzzIR3qcvLNELZk/U1iqyj3Q6RM3R7ZLp7rSi19pNqySVJ
	DgYkxHsMuygDO6VMFn59W7S1k42LdbmCnl/kKLOLKdlqzY3YBIkCLwcT1uPj4MpMyhFz4tm6j9Wos
	R8CYEHOLI2CMv/Dftg+lPXEJrjQzYi7flikpF8uxFLkLN4BoRwoGvULYrCS309G2Ody/Kq0tk0Q6x
	VEI15vrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrX-000000080Ef-0bGL;
	Tue, 17 Jun 2025 17:12:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZ48-00000007rZj-30n3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:21:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMBs74qxvz6L5Sh;
	Wed, 18 Jun 2025 00:19:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 31098140119;
	Wed, 18 Jun 2025 00:21:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:21:33 +0200
Date: Tue, 17 Jun 2025 17:21:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Message-ID: <20250617172132.00002844@huawei.com>
In-Reply-To: <20250613130356.8080-5-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-5-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092141_044062_69E7089B 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, 13 Jun 2025 13:03:55 +0000
James Morse <james.morse@arm.com> wrote:

> The MPAM driver identifies caches by id for use with resctrl. It
> needs to know the cache-id when probe-ing, but the value isn't set
> in cacheinfo until the corresponding CPU comes online.
> 
> Expose the code that generates the cache-id. This allows the MPAM
> driver to determine the properties of the caches without waiting
> for all CPUs to come online.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Feels to me like this needs to come with the user.
The earlier patches at least expose it via existing infrastructure
this isn't used at all yet...

> ---
>  drivers/base/cacheinfo.c  | 15 +++++++++++----
>  include/linux/cacheinfo.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index d8e5b4c7156c..6316d80abab8 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>  #define arch_compact_of_hwid(_x)	(_x)
>  #endif
>  
> -static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
> +unsigned long cache_of_get_id(struct device_node *np)
Bit confusing to have cache_of_set_id() call cache_of_get_id() like this because
they are in no way mirrors of each other.   Rename?
(and naturally I'm providing no suggestions :)

>  {
>  	struct device_node *cpu;
>  	u32 min_id = ~0;
> @@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  		id = arch_compact_of_hwid(id);
>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>  			of_node_put(cpu);
> -			return;
> +			return ~0UL;
>  		}
>  		while (1) {
>  			if (!cache_node)
> @@ -214,8 +214,15 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  		}
>  	}
>  
> -	if (min_id != ~0) {
> -		this_leaf->id = min_id;
> +	return min_id;
> +}
> +
> +static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
> +{
> +	unsigned long id = cache_of_get_id(np);
> +
> +	if (id != ~0UL) {
> +		this_leaf->id = id;
>  		this_leaf->attributes |= CACHE_ID;
>  	}
>  }
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index c8f4f0a0b874..9c959caf8af8 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,
>  #endif
>  
>  const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
> +unsigned long cache_of_get_id(struct device_node *np);
>  
>  /*
>   * Get the cacheinfo structure for the cache associated with @cpu at


