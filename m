Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C66EA3F0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 06:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:From:References:
	Content-Type:Message-Id:In-Reply-To:Date:Subject:Cc:Content-Transfer-Encoding
	:Mime-Version:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8lLyQsuCZGvaPXxcEDtf7RNvxTLmSi8xokdUUVNsXM=; b=Nz7Mx+oz+ssRV9bylbLTqeLPxq
	bn3EiEJWU8jQ37qoCL1hoRKD9zMZW+TYiSfOBdchYWSC5R1Fcz3pOV0Uzt2IwRKuXCdWd88RgDDUS
	Ir8k7Z/RKVaBKYvZxyqbtTg16n04epR2B6CjzvevuJySLbV2NmiQN1t8mlGF2WgOURAR1WSNkoVAY
	o7GmUKA3e4+0uhzx/ReNDY7Ax8fnusecKUtXIClRg1leYNzaj9dB6hOEQGheMFoGsMcs6c9UMUWX5
	2rXWL/Hvfe5F+TGuz38F9Q+Pv8l4krMOWdFnKzdgwatBWxVT8D3fk4ffPc4MselwSguGpQk2QAv6s
	Xvfp4aFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphWq-0000000GYOC-3jBy;
	Tue, 10 Feb 2026 06:47:21 +0000
Received: from sg-1-19.ptr.blmpb.com ([118.26.132.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphWn-0000000GYMf-1S1b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 06:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1770706025;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=B8lLyQsuCZGvaPXxcEDtf7RNvxTLmSi8xokdUUVNsXM=;
 b=THTV2M7jKe4aQpu+v+JWKmpgqac2BexFS/TquKhUs0M8JcLDUxtUemuSWDJCmE8GSVYjqp
 tKEJYJNOmvB4ZQvCWwLT98fY7qEUPRny7z/+ljvGknIzrDrsrVYqSGwX/2K4oTgclbgR0L
 nwnNum/zcJyJHE486QPhLFKZ9ix/H4Xw9dfDD7U0u217R+Gp1GO3A50LLdwUI/LfIvSGD9
 hv4IJ6pJimN/s59KwTLNBXgWNxQo9EFYmrI5SBn1b1xYtdnwMQ4jElh4Wy1wNdcl/ZydCx
 5ZIYNwwyNOygzjjeVxGBjx3obBMcs4is35i1/tV6ZdX41wDbNzhMHqjeXG+K/g==
To: "Keith Busch" <kbusch@kernel.org>, "Christoph Hellwig" <hch@lst.de>
Mime-Version: 1.0
X-Original-From: Yu Kuai <yukuai@fnnas.com>
X-Lms-Return-Path: <lba+2698ad467+166bb1+lists.infradead.org+yukuai@fnnas.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Cc: <axboe@kernel.dk>, <sagi@grimberg.me>, <sven@kernel.org>, <j@jannau.net>, 
	<linux-block@vger.kernel.org>, <linux-nvme@lists.infradead.org>, 
	<tj@kernel.org>, <nilay@linux.ibm.com>, <ming.lei@redhat.com>, 
	<neal@gompa.dev>, <asahi@lists.linux.dev>, 
	<linux-arm-kernel@lists.infradead.org>, <yukuai@fnnas.com>
Subject: Re: [PATCH 3/4] nvme-apple: move blk_mq_update_nr_hw_queues after nvme_unfreeze
Date: Tue, 10 Feb 2026 14:47:00 +0800
Received: from [192.168.1.104] ([39.182.0.137]) by smtp.feishu.cn with ESMTPS; Tue, 10 Feb 2026 14:47:02 +0800
In-Reply-To: <aYn-xwFHCpd7sITJ@kbusch-mbp>
Message-Id: <e3e7d95b-2712-4365-922d-731449e7193a@fnnas.com>
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
References: <20260209082953.3053721-1-yukuai@fnnas.com> <20260209082953.3053721-4-yukuai@fnnas.com> <20260209145832.GC18315@lst.de> <aYn-xwFHCpd7sITJ@kbusch-mbp>
From: "Yu Kuai" <yukuai@fnnas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_224718_435442_8C84DE0C 
X-CRM114-Status: GOOD (  18.53  )
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
Reply-To: yukuai@fnnas.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

=E5=9C=A8 2026/2/9 23:35, Keith Busch =E5=86=99=E9=81=93:
> On Mon, Feb 09, 2026 at 03:58:32PM +0100, Christoph Hellwig wrote:
>> On Mon, Feb 09, 2026 at 04:29:52PM +0800, Yu Kuai wrote:
>>> blk_mq_update_nr_hw_queues() freezes and unfreezes queues internally.
>>> When the queue is already frozen before this call (from nvme_start_free=
ze
>>> in apple_nvme_disable), the freeze depth becomes 2. The internal unfree=
ze
>>> only decrements it to 1, leaving the queue still frozen when
>>> debugfs_create_files() is called.
>>>
>>> This triggers WARN_ON_ONCE(q->mq_freeze_depth !=3D 0) in
>>> debugfs_create_files() and risks deadlock.
>>>
>>> Fix this by moving nvme_unfreeze() before blk_mq_update_nr_hw_queues()
>>> so the queue is unfrozen before the call, allowing the internal
>>> freeze/unfreeze to work correctly.
>>>
>>> Signed-off-by: Yu Kuai <yukuai@fnnas.com>
>>> ---
>>>   drivers/nvme/host/apple.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
>>> index 15b3d07f8ccd..1835753ad91a 100644
>>> --- a/drivers/nvme/host/apple.c
>>> +++ b/drivers/nvme/host/apple.c
>>> @@ -1202,8 +1202,8 @@ static void apple_nvme_reset_work(struct work_str=
uct *work)
>>>  =20
>>>   	nvme_unquiesce_io_queues(&anv->ctrl);
>>>   	nvme_wait_freeze(&anv->ctrl);
>>> -	blk_mq_update_nr_hw_queues(&anv->tagset, 1);
>>>   	nvme_unfreeze(&anv->ctrl);
>>> +	blk_mq_update_nr_hw_queues(&anv->tagset, 1);
>> Looks good on it's own, but it would also good to align the
>> apple driver with the PCI one here more.
> I'm pretty sure this series would deadlock nvme-pci, as that driver
> still leaves the queue frozen when calling blk_mq_update_nr_hw_queues.

Yeah, thanks for the letting me know. It's true I didn't realize nvme-pci
still leaves the queue frozen.

>
> We've left it frozen on purpose, though. The idea was to prevent new IO
> from entering a hw context that's no longer backed by a hardware
> resourse. Unfreezing prior opens that window up again. Maybe it's not a
> big deal; I don't often encounter scenarios where the queue count
> changes after a reset.

Do you think if there are new IO coming between nvme_unfreeze() and
blk_mq_update_nr_hw_queues(), will be any race problems? If so, will it
be helpful to move nvme_unquiesce_io_queues() after
blk_mq_update_nr_hw_queues() so that new IO won't be issued to driver
during the race window.

I'm not quite familiar with nvme drivers, details will be quite helpful. :)

--=20
Thansk,
Kuai

