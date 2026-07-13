Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548CFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz5yvTcQXFks2sdiyYqdqrK3YmhgCtxhQzxI6OD2Ifs=; b=13WqXgBbcvxZFlgRAuGNxAeJ4v
	lAVayqNncxFVs6VQvX0dkWIGbtX/u3BIcu3t0YF28Is5G/WZvHVBWbrfi+TPR+VYuBVpu3tuhUJsk
	lOuwSZHz8hubvZiawxBwNzGsjl34DVmLalRc8wtYu85nj6cpCR7WIzugasFBudQxVCWL96DcIkmYy
	scSh4r2EgRZYeOp2ddyCVqVN0bQHM9seZuPzVga6kadQCUaENVnDNoQKll331P1mFdNXqrieb6NM9
	6ZKQxxbciqxnmT2n4whO26sbRjyjfVPekxia2Ski+rLy+035Rx3TAj8FnfKbScDuN1Ty5/C3sHZGe
	eo93pQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBzs-00000008ZoI-2YOE;
	Mon, 13 Jul 2026 08:26:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBzp-00000008Zmp-33ew;
	Mon, 13 Jul 2026 08:26:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783931190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ber3P3DsFBHilhRzneGtUCB89qv6Ejky7sGcNuHcex5G7jLctbPoHfAUiAmuRsdUn1cfY9FuO17sO9e3wJM2UQLvMFJsKHLZ6LTKulH43BvJ1AlP3l3ICmBb5DEQ8P4BGUWRjNPSc0OF68E2fy0VNIh40Jjt9F5OQcxSO5jAg+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783931190; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sz5yvTcQXFks2sdiyYqdqrK3YmhgCtxhQzxI6OD2Ifs=; 
	b=h/o6BaqsmEB6W/Lt3lKDjLlEWEh8nfj0onoInCrq+9l7u4g+InqifU0+HTfLWJx6vF7aSyqDDGVwNcm+64ztODqvOXiRoPuy0Rz7iX4MDQemosOqb+NdhGE+yfI5O7uK1BIjgm/7Vomms3W2c4ajyJeI+z6wb0ZJZPh6pgCQOzg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783931190;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Sz5yvTcQXFks2sdiyYqdqrK3YmhgCtxhQzxI6OD2Ifs=;
	b=jTbOslw1SXOHr7DTrR85gIjIiR666fKDOzYo7JTMsuguyoXJQPnX3L3LUYmoRyhq
	M7zsPVScOR7telvXdJdoH7BKFM152SxfmLznLX55guMWJ9EEJmPnB8z49qV9uXUVVUt
	0BoqXVqZIf50iAMNM5aAEL50HrQC4f7fZDC3mlNw=
Received: by mx.zohomail.com with SMTPS id 1783931183818309.7919113288565;
	Mon, 13 Jul 2026 01:26:23 -0700 (PDT)
Message-ID: <fe2a557c-c83e-494e-ac4d-c389dc26562d@collabora.com>
Date: Mon, 13 Jul 2026 10:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
To: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com,
 kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
 nicolas.dufresne@collabora.com, ribalda@chromium.org,
 sakari.ailus@linux.intel.com
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
 <e5f16200-3881-4f25-b67d-7053b3b8af19@collabora.com>
 <178390772961.8891.12325171786588563297@neptunite.rasen.tech>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <178390772961.8891.12325171786588563297@neptunite.rasen.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012637_936888_73609580 
X-CRM114-Status: GOOD (  57.56  )
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

Hi Paul,

On 7/13/26 03:55, Paul Elder wrote:
> [...]
>>
>> <rubberducking>
>> IIUC there could be devices A -> B -> C that share a DT graph (and thus
>> should share a media device), but suppose the probe order is driver A,
>> C, B then A would rightfully create a new shared media device, but C
>> would not see it and create yet another shared media device. Thus, the
>> the find_match() function needs to traverse C -> B -> A to find the
>> correct shared media device.
>> </rubberducking>
> 
> Yeah I guess traversing the graph is kind of a critical feature.
> 
>>
>> Just saying that with one and only one media device to rule them all we
>> wouldn't have to deal with this. Another option would be to assume that
> 
> Hm yeah that's true; we'd just have a sea of media entities and we can link
> whoever we want...
> 
> We didn't really discuss that part very hard last time.
> 
>> each driver knows to which shared media device it belongs. For example,
>> the rkcif driver could be aware that it belongs to the
>>     {
>>         .id = MEDIA_SHARED_ROCKCHIP_CAMERA,
>>         .name = "Rockchip Camera Subsystem",
>>      }
> 
> The problem is where would this information go? We can't put it in the driver;
> it *must* come from the device tree. And I don't think we can just add a new
> property that defines a media subsystem. So I think our only option is to
> traverse the endpoint graph in the device tree.

Just to sketch the rough idea: A list of known shared media graphs in
drivers/media/mc/mc-shared-graph.c:

struct mcshgr_info { ... } known_graphs  = {
	{
		.id = MEDIA_SHARED_ROCKCHIP_RK3588_CAMERA,
		.name = "Rockchip Camera Subsystem",
		// TODO fill me with other things
	},
	{
		.id = MEDIA_SHARED_ROCKCHIP_RK3576_CAMERA,
		.name  = "whatever",
		// TODO fill me with other things
	},
};

The IDs need to go into a enum in include/media/mc-shared-graph.h.

The drivers would then call e.g.
	mdev = media_device_shared_join(rkcif->dev,
		MEDIA_SHARED_ROCKCHIP_RK3588_CAMERA);
and of course this parameter could vary with the individual driver DT
compatible, e.g., "rockchip,rk3588-vicap" =>
MEDIA_SHARED_ROCKCHIP_RK3588_CAMERA.

I am sketching this for the sake of completeness. This would provide a
place to store information, but I am not convinced at all that this is a
nice solution.

Alternatively, the list of known shared media graphs could store some DT
compatibles

struct mcshgr_info { ... } known_graphs  = {
	{
		.id = MEDIA_SHARED_ROCKCHIP_RK3588_CAMERA,
		.name = "Rockchip Camera Subsystem",
		.compatibles = {
			"rockchip,rk3588-isp",
			"rockchip,rk3588-vicap",
		},
		// TODO fill me with other things
	},
};
and I guess there could be a way to get the compatible from struct
device, then
	mdev = media_device_shared_join(rkcif->dev);
would remain the same.

This just occurred to me -- not sure whether I like it.

> [...]
>>
>> OK, what options do we have?!
> 
> (Just in general or with respect to this function...?)

How to get information that the media device requires or at least
contains as of today.

>> We could pick one device of many. But based on what criteria? If there
>> was a good way to pick one, we could equally pick a driver that
>> registers the media device and move on. We conclude that apparently
>> that's not the case, otherwise we wouldn't be doing this exercise. Next.
> 
> Yes; given that both rkcif and rkisp2 could potentially exist on devices where
> the other does not, this is not realistically doable. (I mean if we really want
> to we could but it would be a high-cost mess)
> 
>>
>> We could introduce a pseudo device that provides the umbrella. But
>> again, that would be close to creating an umbrella driver that registers
>> the media device. And at some point we decided not to do that. Next.
> 
> Similar problem as above (can't choose main driver), the one above that (no
> place to put group member list).
> 
>>
>> We move from the notion of a media **device** to a media **graph**
>> (which is in alignment with the subject of this mail). The media graph
> 
> I always thought that media device and media graph were the
> same/interchangable...

They may be, at least as of today. I was asking myself how our view on
the new (shared) media device should look like. And I think that the
concept of the graph is important, and that the focus should be on which
entities there are and how the are connected (i.e, the topology, the
graph). This also means that we should not rely on other information and
assumptions (other information such as media device name, hw version,
... and assumptions such as "there is a single v4l2 driver that owns the
graph", "there is a single media device that owns the graph", ...)

In the end, what should user space do? Does libcamera actually do
anything with e.g. the HW revision of a media device? Is the name of the
media device actually used?

Or does it simply iterate over all media devices and scan for entities
with a certain name (e.g. look for a RK3588 ISP)? Because if it does, or
if it could do it that way, there is no point in crafting together this
additional information in the kernel.

> 
>> is something owned by the subsystem, not by any device/driver. The media
>> entities therein, however, could be owned by devices/drivers. Maybe
>> struct media_entity should feature a struct device *dev; member.
>>
>> I could imagine that the dev member is used mostly for
>> dev_{info,err,...}, we would need to get rid of them. If there is
> 
> afaict that's the case.
> 
>> actually something with devm_ then this requires more thought.
>>
>> IMHO the third option is the way to go.
> 
> I'm glad we agree :)

Then we set the dev member of the media_device to NULL, right?

> 
>>
>>> +
>>> +// TODO figure out how to resolve the identifiers (model, driver name, etc);
>>> +// atm it's racy and whoever gets it last wins
>>> +struct media_device *media_device_shared_join(struct device *dev)
>>> +{
>>> +     struct media_device *mdev;
>>> +
>>> +     mutex_lock(&media_device_shared_lock);
>>> +
>>> +     mdev = __media_device_shared_get(dev);
>>> +     if (!!mdev) {
>>> +             dev_dbg(dev, "%s: found media device for %pfwf", __func__, dev_fwnode(dev));
>>> +             mutex_unlock(&media_device_shared_lock);
>>> +             return mdev;
>>> +     }
>>> +
>>> +     mdev = __media_device_shared_create(dev);
>>> +     if (!mdev) {
>>> +             dev_warn(dev, "%s: failed to create media device for %pfwf", __func__, dev_fwnode(dev));
>>> +             mutex_unlock(&media_device_shared_lock);
>>> +             return ERR_PTR(-ENOMEM);
>>> +     }
>>> +
>>> +     dev_dbg(dev, "%s: created media device for %pfwf", __func__, dev_fwnode(dev));
>>> +     mutex_unlock(&media_device_shared_lock);
>>> +     return mdev;
>>> +}
>>> +EXPORT_SYMBOL_GPL(media_device_shared_join);
>>
>> Similarly, we have to bid farewell to the notion of a media **device**.
>> Can we agree on making
>>     struct device *dev;
>>     char driver_name[32];
>>     char serial[40];
>>     char bus_info[32];
>>     u32 hw_revision;
>> optional for shared media devices (or, better, graphs)?
> 
> Well I think driver_name and (maybe) hw_revision are still useful to have. The
> only problem is I have no clue where to put/get that information.
> 
> The only good-ish idea I could come up with was something like
> "shared_media_graph_{board compatible}_{smallest base address of media graph
> member}". So like "shared_media_graph_rockchip,rk3588_fdcb0000" for the rk3588
> since between the csi receivers and vicap and isp, the isp has the smallest
> address. That way:
> - the information comes from the device tree
> - the name is persistent
> - it can identify separate shared media graphs on the same platform
> 
> idk about the hardware revision though. I think probably only driver match data
> can hold that information. But then we'd probably have duplicate information
> since otherwise if one of the member drivers doesn't probe then we'd be missing
> the hw_revision. Or maybe we don't care about hardware revision since it
> doesn't make sense for the shared media graph part and it only makes sense for
> the individual IP cores. In which case that information is lost unless we move
> it somewhere else. Or maybe it's not used anyway so we can indeed just drop it.

Crafting together a name from device tree information... could work..
and could be reasonable I guess. Just saying that if some joker removes
the connection between ISP and VICAP in device tree, the media graph
could end up with the same name for different things or different things
with the same name and... I just think I this all is not something I
would rely on from user space, and I would look at the graph rather than
making assumptions based on the graph name.

The real question is whether this is actually needed. As you stated
above, maybe this simply doesn't make sense for a shared media graph.
And we still have the individual IP core information.

I would recommend to ignore the fields listed above for shared media
devices.

> [...]

Thanks and best regards,
Michael



