Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71988C83F0C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrAOKWc4RrY33zHTPsbAjylJe6VV8MkhmQH51ANmBqo=; b=rBfH5/nle+jYsyEol4fppxhCCe
	uNQg+HX38LQyO8LtQRFZUTLjcc0bXZCTTYZ4ZOPecKOFGg41ZGjljQcdlWeaVfz7DVwFHJ7WsAvRX
	FfXJ/IcJ7Jym3hYXn1AmnJHngDRgqpkZOqcveoMHJyF18veieXpvqRvDNMjNx19Yg9MlxMNv0sYzl
	omuwTAmWxfBlUi44Ofpj0nSmG6OYZrSz93GyDJbp1EabyC++FuRE/L9JpeS79PoxcxIB4puOY5dfh
	OeNTBqSgSeUMwQnZ3PviKomXsvstjariKKF73gVj/fPS/r0tohCgm/VQFLWvqooHvwMmkSDkNhcdX
	pkGERHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRs-00000002TNv-2g5c;
	Mon, 07 Jul 2025 12:59:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYl17-00000002QbQ-2JLT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 12:32:19 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbNrV45T2z6M56Q;
	Mon,  7 Jul 2025 20:31:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DB1B1402F8;
	Mon,  7 Jul 2025 20:32:09 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 7 Jul
 2025 14:32:08 +0200
Date: Mon, 7 Jul 2025 13:32:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <WillDeaconwill@kernel.org>
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
Message-ID: <20250707133207.00001b88@huawei.com>
In-Reply-To: <9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
	<20250704173826.13025-2-james.morse@arm.com>
	<9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_053217_882139_B2C71700 
X-CRM114-Status: GOOD (  35.66  )
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

On Mon, 7 Jul 2025 11:27:06 +0100
Ben Horgan <ben.horgan@arm.com> wrote:

> Hi James,
> 
> On 7/4/25 18:38, James Morse wrote:
> > From: Rob Herring <robh@kernel.org>
> > 
> > Use the minimum CPU h/w id of the CPUs associated with the cache for the
> > cache 'id'. This will provide a stable id value for a given system. As
> > we need to check all possible CPUs, we can't use the shared_cpu_map
> > which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> > we have to walk all CPU nodes and then walk cache levels.
> > 
> > The cache_id exposed to user-space has historically been 32 bits, and
> > is too late to change. This value is parsed into a u32 by user-space
> > libraries such as libvirt:
> > https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> > 
> > Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> > is found.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [ ben: converted to use the __free cleanup idiom ]
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> > Use as a 32bit value has also been seen in DPDK patches here:
> > http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> > 
> > Changes since v1:
> >   * Remove the second loop in favour of a helper.
> >   
> > An open question from v1 is whether it would be preferable to use an
> > index into the DT of the CPU nodes instead of the hardware id. This would
> > save an arch specific swizzle - but the numbers would change if the DT
> > were changed. This scheme isn't sensitive to the order of DT nodes.
> > 
> > ---
> >   drivers/base/cacheinfo.c | 38 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> > 
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index cf0d455209d7..df593da0d5f7 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -8,6 +8,7 @@
> >   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >   
> >   #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> >   #include <linux/bitops.h>
> >   #include <linux/cacheinfo.h>
> >   #include <linux/compiler.h>
> > @@ -183,6 +184,42 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
> >   	return of_property_read_bool(np, "cache-unified");
> >   }
> >   
> > +static bool match_cache_node(struct device_node *cpu,
> > +			     const struct device_node *cache_node)
> > +{
> > +	for (struct device_node *cache __free(device_node) = of_find_next_cache_node(cpu);  
> Looks like the creation of this helper function has upset the 
> device_node reference counting. This first __free(device_node) will only 
> cause of_node_put() to be called in the case of the early return from 
> the loop. You've dropped the second __free(device_node) which accounts 
> for 'cache' changing on each iteration.

Good catch - this behaves differently from many of the of_get_next* type
helpers in that it doesn't drop the reference to the previous iteration
within the call.

Maybe it should?

I checked a few of the call sites and some would be simplified if it did
others would need some more complex restructuring but might benefit as
well.

> > +	     cache != NULL; cache = of_find_next_cache_node(cache)) {
> > +		if (cache == cache_node)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static void cache_of_set_id(struct cacheinfo *this_leaf,
> > +			    struct device_node *cache_node)
> > +{
> > +	struct device_node *cpu;
> > +	u32 min_id = ~0;
> > +
> > +	for_each_of_cpu_node(cpu) {
> > +		u64 id = of_get_cpu_hwid(cpu, 0);
> > +
> > +		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> > +			of_node_put(cpu);
> > +			return;
> > +		}
> > +
> > +		if (match_cache_node(cpu, cache_node))
> > +			min_id = min(min_id, id);
> > +	}
> > +
> > +	if (min_id != ~0) {
> > +		this_leaf->id = min_id;
> > +		this_leaf->attributes |= CACHE_ID;
> > +	}
> > +}
> > +
> >   static void cache_of_set_props(struct cacheinfo *this_leaf,
> >   			       struct device_node *np)
> >   {
> > @@ -198,6 +235,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
> >   	cache_get_line_size(this_leaf, np);
> >   	cache_nr_sets(this_leaf, np);
> >   	cache_associativity(this_leaf);
> > +	cache_of_set_id(this_leaf, np);
> >   }
> >   
> >   static int cache_setup_of_node(unsigned int cpu)  
> 
> 
> Thanks,
> 
> Ben
> 
> 


