Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DBFC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7esEd3ailkeF/Q/XQhi2QK9gaqyy6WqycrTHKBNRAs=; b=bQ21c+706MWlPnnkKiTjOdx3Rm
	OHzeipPIk9tm/lnMkWLYb0U5VJSjzW/R0nbmYYkejWzX+FGljpm9cJH+2M1dT1wsvh6DYKWqCo8d0
	HnlGJfuPrkAKd4g7V9/Sd1TmMn71KWVMkNFUcN6TtXRnJyzUKQBX59WTZ9oULIEgmzD3aSBPzqsM6
	obj4HH/6IlvMlDPVW8jODqyZQbPeUmSwf/M//nsHmReSs73cELmuxjPFUiXPOtKaQXMLRLxSgyzVO
	FZ/xM4e6ItQTrGQMVPhN5kE/sGTEftasYqzNQd96oa1zDtbW3NGjvcLEbdY8TmFvUDrbzzPsqMo5f
	KIyfODjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEfO-0000000F1EW-3wO3;
	Fri, 11 Jul 2025 14:23:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEd2-0000000F0xJ-2M4f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:21:34 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdv273Qt7z6L55H;
	Fri, 11 Jul 2025 22:18:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BABF81402EF;
	Fri, 11 Jul 2025 22:21:25 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 16:21:25 +0200
Date: Fri, 11 Jul 2025 15:21:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <WillDeaconwill@kernel.org>
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
Message-ID: <20250711152123.00002153@huawei.com>
In-Reply-To: <9a1ae272-3128-425b-828d-50b2289a6cb8@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
	<20250704173826.13025-2-james.morse@arm.com>
	<9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
	<20250707133207.00001b88@huawei.com>
	<89c6f2a2-e084-4899-a6d6-819917eb6324@arm.com>
	<9a1ae272-3128-425b-828d-50b2289a6cb8@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_072132_893763_4BA93A5F 
X-CRM114-Status: GOOD (  30.91  )
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

On Thu, 10 Jul 2025 12:24:01 +0100
Ben Horgan <ben.horgan@arm.com> wrote:

> Hi James and Jonathan,
> 
> On 7/10/25 12:15, James Morse wrote:
> > Hi Ben, Jonathan,
> > 
> > On 07/07/2025 13:32, Jonathan Cameron wrote:  
> >> On Mon, 7 Jul 2025 11:27:06 +0100
> >> Ben Horgan <ben.horgan@arm.com> wrote:  
> >>> On 7/4/25 18:38, James Morse wrote:  
> >>>> From: Rob Herring <robh@kernel.org>
> >>>> Use the minimum CPU h/w id of the CPUs associated with the cache for the
> >>>> cache 'id'. This will provide a stable id value for a given system. As
> >>>> we need to check all possible CPUs, we can't use the shared_cpu_map
> >>>> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> >>>> we have to walk all CPU nodes and then walk cache levels.
> >>>>
> >>>> The cache_id exposed to user-space has historically been 32 bits, and
> >>>> is too late to change. This value is parsed into a u32 by user-space
> >>>> libraries such as libvirt:
> >>>> https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> >>>>
> >>>> Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> >>>> is found.  
> >   
> >>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> >>>> index cf0d455209d7..df593da0d5f7 100644
> >>>> --- a/drivers/base/cacheinfo.c
> >>>> +++ b/drivers/base/cacheinfo.c
> >>>> @@ -183,6 +184,42 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
> >>>>    	return of_property_read_bool(np, "cache-unified");
> >>>>    }
> >>>>    
> >>>> +static bool match_cache_node(struct device_node *cpu,
> >>>> +			     const struct device_node *cache_node)
> >>>> +{
> >>>> +	for (struct device_node *cache __free(device_node) = of_find_next_cache_node(cpu);  
> >>> Looks like the creation of this helper function has upset the
> >>> device_node reference counting. This first __free(device_node) will only
> >>> cause of_node_put() to be called in the case of the early return from
> >>> the loop. You've dropped the second __free(device_node) which accounts
> >>> for 'cache' changing on each iteration.  
> > 
> > Heh, I just took this hunk verbatim. Fixing this up with the __free() magic is tricky as
> > the existing patterns all drop the reference to cpu, which we don't want to do here. I
> > think at this point the __free() magic is just making this harder to understand. How about
> > the old fashioned way:
> > 
> > | static bool match_cache_node(struct device_node *cpu,
> > |                              const struct device_node *cache_node)
> > | {
> > |         struct device_node *prev, *cache = of_find_next_cache_node(cpu);
> > |
> > |         while (cache) {
> > |                 if (cache == cache_node) {
> > |                         of_node_put(cache);
> > |                         return true;
> > |                 }
> > |
> > |                 prev = cache;
> > |                 cache = of_find_next_cache_node(cache);
> > |                 of_node_put(prev);
> > |         }
> > |
> > |         return false;
> > | }  
> Ok with me.
Agreed. 

> > 
> >   
> >> Good catch - this behaves differently from many of the of_get_next* type
> >> helpers in that it doesn't drop the reference to the previous iteration
> >> within the call.
> >>
> >> Maybe it should?
> >>
> >> I checked a few of the call sites and some would be simplified if it did
> >> others would need some more complex restructuring but might benefit as
> >> well.  
> > 
> > If it did, we'd end up dropping the reference to cpu on the way in, which
> > of_get_next_cpu_node() in for_each_of_cpu_node() was expecting to do.  
> 
> Yes, I think the blurring of the lines between a cpu node and cache node 
> is at least partially to blame for the confusion here.
Yes.  That is more than a little ugly!

> > 
> > 
> > Thanks,
> > 
> > James  
> 
> Thanks,
> 
> Ben
> 
> 


