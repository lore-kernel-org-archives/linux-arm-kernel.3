Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173CBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhP4oZStKzwiG8Lvd6+4d8700PbT8XUQVZtWvGg83hY=; b=4wXeXKoJzodzWAKhwKxke1D5M5
	6i0I82MIDesEv52TWDXfWDsHX8peFhVbexWltgjQQBHevVmIRsBhAZpCRAHj9X2vJz3txoNnnWerF
	lqr1xmv/b82WSSNOG3FjuGxFbv6C/rt6meJZhP9kJe6kW7ykCpz65zM/QJZ4V5ZFQBMhkClGXCp4+
	lhry/sfPSjHf4l0ZO4h3vqAzvf3PGZI/pNTNHX+DVW3NbsqdFPAfNc79MK20Fo1LhXN2ahx77Nkgh
	l1lJGKY9F86dbkoVZ4TMe3QrB51l/GDWk0QYojk3cleJQSQSFZbBhQnjRzeqw6sd6rH1j3GUVNdrk
	gT4WloWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrI-00000007zrX-2IZV;
	Tue, 17 Jun 2025 17:12:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYp2-00000007pbU-1jcQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:06:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMBXv69shz6M4SN;
	Wed, 18 Jun 2025 00:05:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B53611402F5;
	Wed, 18 Jun 2025 00:05:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:05:53 +0200
Date: Tue, 17 Jun 2025 17:05:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id
 into 32 bits for cache-id
Message-ID: <20250617170550.0000621b@huawei.com>
In-Reply-To: <20250613130356.8080-3-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-3-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_090604_599591_63FEA128 
X-CRM114-Status: GOOD (  19.40  )
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

On Fri, 13 Jun 2025 13:03:53 +0000
James Morse <james.morse@arm.com> wrote:

> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest CPU h/w id of the
> CPUs associated with that cache.
> 
> CPU h/w ids may be larger than 32 bits.
> 
> Add a hook to allow architectures to compress the value from the devicetree
> into 32 bits. Returning the same value is always safe as cache_of_set_id()
> will stop if a value larger than 32 bits is seen.
> 
> For example, on arm64 the value is the MPIDR affinity register, which only
> has 32 bits of affinity data, but spread across the 64 bit field. An
> arch-specific bit swizzle gives a 32 bit value.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Looks fine to me
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/base/cacheinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 9888d87840a2..d8e5b4c7156c 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -184,6 +184,10 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>  	return of_property_read_bool(np, "cache-unified");
>  }
>  
> +#ifndef arch_compact_of_hwid
> +#define arch_compact_of_hwid(_x)	(_x)
> +#endif
> +
>  static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  {
>  	struct device_node *cpu;
> @@ -193,6 +197,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  		struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
>  		u64 id = of_get_cpu_hwid(cpu, 0);
>  
> +		id = arch_compact_of_hwid(id);
>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>  			of_node_put(cpu);
>  			return;


