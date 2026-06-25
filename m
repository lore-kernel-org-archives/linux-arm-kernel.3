Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6292CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbrQiqoxsl8WhIHD+LeV4P6XnZdN+WMJ7f67o9JPdMA=; b=tfGlUYCA5n7udtEcz+ZsSSFVLk
	7ookwsM0ef2tbWoZQDIxpdE+bWS//IfNmFIs4pbA542QVeeWGGmNnhBduksLTLkvLLDj9/X+LTqtU
	BK/B76i+rAa05sq/BQ90TTLKtgAM6VTnNeiuEUGllRSWbQclFQssdjdrxbYIzM7JmeMl/Tz2pT6Ha
	qAOswhUA5VJX4FXKdDSklYMAsXwQ8affG6KdJYQHcmp/sikJsIHKnrC0DLv03JBteTR+cC0USSQTc
	F1sgMEmRL7fZeQEutRxvPYfCr+4EcH4n/IvbnWClRSQJ3VtfIpsM6tSH+IyK+kLViJL7qWxOKFgzL
	Qsc7Dx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclSG-00000009MRK-2NiJ;
	Thu, 25 Jun 2026 14:53:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclSD-00000009MQn-2hEL;
	Thu, 25 Jun 2026 14:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1782399188; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WmuNy7DOl2kIWdkDhViAxrZRU/cJ7wBTa322xVY1CK8Pk3C40ur0DO9M6N4ZjPGTD0+iQnhwR1PF0Sa2vTRB0xrIj55SAKZqTGBx8xI7ysmrTmnOHij9ya09zNNzEp5LnNgvW0kM0TMbwuEnuhH4YN2erVpMp8qtXF2WWAZxThM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782399188; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MbrQiqoxsl8WhIHD+LeV4P6XnZdN+WMJ7f67o9JPdMA=; 
	b=I/XIghwJuqB8wvNCKRiqFyu79Tew0PoHDAeKlWpsQdVhRMxVWQm+EHNGmpJBqgSmTjDvRAqCZN6VKLq8jCZt90rNTzuuUztzXkct5Y/2Hfa0+MJYdgoyQbUfE7azsJwct6qmi09oUOmMz/Nza1VAmbl2tjnMN2waUEQxJIvQod8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782399188;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MbrQiqoxsl8WhIHD+LeV4P6XnZdN+WMJ7f67o9JPdMA=;
	b=hOXJDn/A/Xkc15506+TTFkdBmzhPbTOkiy6iKSZfl5moM/WdDs70DEqW+K7O8dUg
	Wzl2YLMDRZLJCM+DFIP3NFf9sPkek9llYc00LGEQYt8GBJFCa7PYEFk9KJzq1H+dyTQ
	X9qn3rVNHHZG/3FVJ25yQOb6dx3d2bGWOOfZijx0=
Received: by mx.zohomail.com with SMTPS id 1782399185495703.3163955828122;
	Thu, 25 Jun 2026 07:53:05 -0700 (PDT)
Message-ID: <4787dfe9-edec-4983-9ecb-6ac60502afd7@collabora.com>
Date: Thu, 25 Jun 2026 10:53:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: v4l2-core: Add v4l2-stats interface
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-3-d298e98ce06a@collabora.com>
 <0d2576f8-7773-419e-be0f-0bb37a776bc0@kernel.org>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <0d2576f8-7773-419e-be0f-0bb37a776bc0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_075321_819574_C99479F2 
X-CRM114-Status: GOOD (  27.08  )
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

Hi Hans,

On 6/19/26 09:05, Hans Verkuil wrote:
> On 17/06/2026 20:10, Detlev Casanova wrote:
>> Provide helpers for media drivers to set fdinfo data and print the
>> key:value pairs in a standard way.
>>
>> User drivers can set stats values with helpers like:
>>   - v4l2_stats_update_hw_usage
>>   - v4l2_stats_set_media_dev_type
>>
>> And also call the show helpers from their show_fdinfo callback with:
>>   - v4l2_stats_show -- Shows the values set previously
>>   - v4l2_stats_show_clock -- Shows the main clock state.
>>
>> The show_clock helper is used instead of updating a clock value in
>> v4l2_stats for the following reasons:
>>   - Clocks are at the device level, this is not a per-fd information
>>   - This avoids having clock references in v4l2-core
>>   - Drivers can use different approaches to manage clocks
>>     (e.g.: bulk_data or not: A set helper wouldn't please all drivers)
>>   - Arguably, clocks could be exposed elsewhere (like a debugfs), but we
>>     want something close to what DRM does and centralizing information has
>>     its advantages for userspace tooling.
>>
>> In DRM the key:value pair format for clocks is documented and each driver
>> can write them directly based on that.
>> In this case, provide a helper and document the format.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   drivers/media/v4l2-core/Makefile     |  2 +-
>>   drivers/media/v4l2-core/v4l2-dev.c   |  2 ++
>>   drivers/media/v4l2-core/v4l2-fh.c    |  3 ++
>>   drivers/media/v4l2-core/v4l2-stats.c | 65 ++++++++++++++++++++++++++++++++++++
>>   include/media/v4l2-fh.h              |  2 ++
>>   include/media/v4l2-stats.h           | 44 ++++++++++++++++++++++++
>>   6 files changed, 117 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
>> index 329f0eadce99..20e1ab74ac09 100644
>> --- a/drivers/media/v4l2-core/Makefile
>> +++ b/drivers/media/v4l2-core/Makefile
>> @@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
>>   tuner-objs	:=	tuner-core.o
>>   
>>   videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>> -			v4l2-event.o v4l2-subdev.o v4l2-common.o \
>> +			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-stats.o \
>>   			v4l2-ctrls-core.o v4l2-ctrls-api.o \
>>   			v4l2-ctrls-request.o v4l2-ctrls-defs.o
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 3878fa2ff73e..3e7a6876dffd 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
>>   {
>>   	struct video_device *vdev = video_devdata(filp);
>>   
>> +	seq_printf(m, "media-driver:\t%s\n", vdev->v4l2_dev->name);
>> +
>>   	if (vdev->fops->show_fdinfo)
>>   		vdev->fops->show_fdinfo(m, filp);
>>   }
>> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
>> index b184bed8aca9..1b655672c718 100644
>> --- a/drivers/media/v4l2-core/v4l2-fh.c
>> +++ b/drivers/media/v4l2-core/v4l2-fh.c
>> @@ -17,6 +17,7 @@
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/v4l2-mc.h>
>> +#include <media/v4l2-stats.h>
>>   
>>   void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>>   {
>> @@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>>   	INIT_LIST_HEAD(&fh->subscribed);
>>   	fh->sequence = -1;
>>   	mutex_init(&fh->subscribe_lock);
>> +	v4l2_stats_init(&fh->stats);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_fh_init);
>>   
>> @@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
>>   	v4l2_event_unsubscribe_all(fh);
>>   	mutex_destroy(&fh->subscribe_lock);
>>   	fh->vdev = NULL;
>> +	v4l2_stats_exit(&fh->stats);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_fh_exit);
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-stats.c b/drivers/media/v4l2-core/v4l2-stats.c
>> new file mode 100644
>> index 000000000000..93e64ef2e7bb
>> --- /dev/null
>> +++ b/drivers/media/v4l2-core/v4l2-stats.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * v4l2-stats.c
>> + *
>> + * V4L2 statistics management.
>> + *
>> + * Maintain a per-file handle list of statistics about the hardware and handle
>> + * exposing it in the fdinfo.
>> + *
>> + * Copyright (C) 2026 Collabora.
>> + *
>> + * Contact: Detlev Casanova <detlev.casanova@collabora.com>
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/clk.h>
>> +#include <media/v4l2-stats.h>
>> +
>> +static const char * const dev_type_name[] = {
>> +	[MEDIA_DEV_TYPE_V4L2] = "media",
>> +	[MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER] = "encoder",
>> +	[MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER] = "decoder",
>> +};
>> +
>> +void v4l2_stats_init(struct v4l2_stats *stats)
>> +{
>> +	stats->hw_usage_time = 0;
>> +	stats->media_dev_type = MEDIA_DEV_TYPE_V4L2;
>> +}
>> +
>> +void v4l2_stats_exit(struct v4l2_stats *stats)
>> +{
>> +}
>> +
>> +void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time)
>> +{
>> +	stats->hw_usage_time += usage_time;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_update_hw_usage);
>> +
>> +void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type)
>> +{
>> +	if (type >= MEDIA_DEV_TYPE_COUNT)
>> +		return;
>> +
>> +	stats->media_dev_type = type;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_set_media_dev_type);
>> +
>> +void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m)
>> +{
>> +	seq_printf(m, "media-type:\t%s\n", dev_type_name[stats->media_dev_type]);
>> +	seq_printf(m, "media-engine-usage:\t%llu ns\n", stats->hw_usage_time);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_show);
>> +
>> +void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk)
>> +{
>> +	seq_printf(m, "media-maxfreq:\t%lu Hz\n",
>> +		   clk_get_rate(clk));
>> +	seq_printf(m, "media-curfreq:\t%lu Hz\n",
>> +		   clk_get_rate(clk));
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_stats_show_clock);
>> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
>> index aad4b3689d7e..ae6688722bee 100644
>> --- a/include/media/v4l2-fh.h
>> +++ b/include/media/v4l2-fh.h
>> @@ -17,6 +17,7 @@
>>   #include <linux/kconfig.h>
>>   #include <linux/list.h>
>>   #include <linux/videodev2.h>
>> +#include <media/v4l2-stats.h>
>>   
>>   struct video_device;
>>   struct v4l2_ctrl_handler;
>> @@ -43,6 +44,7 @@ struct v4l2_fh {
>>   	struct list_head	list;
>>   	struct video_device	*vdev;
>>   	struct v4l2_ctrl_handler *ctrl_handler;
>> +	struct v4l2_stats	stats;
>>   	enum v4l2_priority	prio;
>>   
>>   	/* Events */
>> diff --git a/include/media/v4l2-stats.h b/include/media/v4l2-stats.h
>> new file mode 100644
>> index 000000000000..d580933c4181
>> --- /dev/null
>> +++ b/include/media/v4l2-stats.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * v4l2-stats.h
>> + *
>> + * V4L2 statistics management.
>> + *
>> + * Maintain a per-file handle list of statistics about the hardware and handle
>> + * exposing it in the fdinfo.
>> + *
>> + * Copyright (C) 2026 Collabora.
>> + *
>> + * Contact: Detlev Casanova <detlev.casanova@collabora.com>
>> + */
>> +#ifndef V4L2_STATS_H
>> +#define V4L2_STATS_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct clk;
>> +struct seq_file;
>> +
>> +enum v4l2_media_dev_type {
>> +	MEDIA_DEV_TYPE_V4L2 = 0,
>> +	MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER,
>> +	MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER,
>> +
>> +	MEDIA_DEV_TYPE_COUNT,
> I'm a bit unhappy about introducing yet another type. Do we need it?
I didn't want it either, but this will extend to other kind of drivers 
and I couldn't find a type enum to rule them all.
Maybe just using Device Capabilities Flags ?

It still won't differentiate encoder from decoder.
I wouldn't super mad if we loose that information (userspace can simply 
see it as a capture device) but it'd still be nice to have it.
>
>> +};
>> +
>> +struct v4l2_stats {
> Poor name, and it conflicts with ISP statistics.
>
> How about v4l2_pdinfo? And v4l2-fdinfo.h etc. That avoids any confusion and
> also clearly says what this is about.
As mentioned in the other patch, "v4l2_metrics" is more accurate.

Detlev.
>
>> +	u64 hw_usage_time;
>> +	enum v4l2_media_dev_type media_dev_type;
> This should be the first field.
>
>> +};
>> +
>> +void v4l2_stats_init(struct v4l2_stats *stats);
>> +void v4l2_stats_exit(struct v4l2_stats *stats);
>> +
>> +void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time);
>> +void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type);
>> +
>> +void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m);
>> +void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk);
>> +
>> +#endif /* V4L2_STATS_H */
>>
> Regards,
>
> 	Hans


