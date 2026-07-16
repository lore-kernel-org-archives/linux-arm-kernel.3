Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B084AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBgQLJoWIrp6n9tPjBRkaU8xKOqMrnxXi4OkMm84RIg=; b=jiTcGAOIX1GEpIfhIT+SVqqUqT
	E/J1GnS5N8DIP9VkI+k2VlWLPDgPgijIVUOfxleAPqpDb/19kWP9BApv5DSk+LIY9dZ4Qb6mpJOnf
	oG2LLkdpRi/w0A4O8GpAayC7hCC8+eODNHQJt34vlmP/fw2wB4+0I/Ibw2fZzgWaV6QsYNmS7lkc7
	pDF7XMqitE0ZawLRNLE6GG23N9QLcaloo678EFK2cMS6aP7+0hbi5xxkAbwYA60AW8i8bCe3tfi/e
	jVtC3q0tnSHqjgLvDRB3IoAK9zENI0kqhe8jHwV1AZujfTwpnQ89zf8yxwfgMA8h9USDFJsX1PNKc
	wO4xr2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGQ6-0000000GdwG-3C7A;
	Thu, 16 Jul 2026 07:22:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGQ5-0000000Gdw2-18dM;
	Thu, 16 Jul 2026 07:22:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00EBC43CDC;
	Thu, 16 Jul 2026 07:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4181F00A3A;
	Thu, 16 Jul 2026 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784186528;
	bh=yBgQLJoWIrp6n9tPjBRkaU8xKOqMrnxXi4OkMm84RIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DryU336EAmjujWSTE3CBCKKu7HVPVtKAXpTTV4i8Z9lSEFeJJpBgi5WXzojM26ogD
	 7yOqNKEmsgmR1DrQPSSWHb9HkKROBus8XmwgF1XrUNMRgpIcxkqx+8qMUVbg+zVnaJ
	 KjlWDho6C/clvd9kVBgVICWlDoK/GVmAI5xbmMmahbrCrf7MdtVTet7cbCd48SNpPn
	 U1aYkcFENVyyz13yR4y8vBJWJY3Lp+q8Ld9aJRKXSix923WbqB/QYKqLEOyNIYPMuY
	 X+3Pz8tImHDjApLJWbuwHGayNrn6Sx7/dPIUUud13xmydlSLPg11v0SJ68whqKz2XG
	 4KbY0GJLi5aRQ==
Message-ID: <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
Date: Thu, 16 Jul 2026 10:22:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eugen Hristev
 <ehristev@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@redhat.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
 <178046930079.1525445.16102733967737177325@freya>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <178046930079.1525445.16102733967737177325@freya>
Content-Type: text/plain; charset=UTF-8
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

On 6/3/26 09:48, Jai Luthra wrote:
> Hi Eugen,
> 
> Quoting Eugen Hristev (2026-05-20 21:07:00)
>> The commit
>> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
>> introduced a check to see whether the format requested is the same as the
>> fourcc in the format list.
>>
>> However, this breaks the case when userspace requested an unpacked fourcc,
>> e.g. RG10.
>>
>> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
>> on what userspace requests.
>> In the unpacking case, a dedicated register is being set.
>>
>> If the userspace requests pRAA, this works, because the check validates the
>> pipeline:
>>
>> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
>>  --stream-mmap --stream-count=1 --stream-to=frame.raw
>>
>> but, with
>> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
>> --stream-mmap --stream-count=1 --stream-to=frame.raw
>>
>> unicam complains at validation level:
>>
>> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
>>
>> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
>> RG10 or pRAA depending on the packing register.
>>
>> To fix this, modified the condition check to also allow in the case when
>> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
>>
>> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..cc7627e9a51a 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
>>                  * In order to allow the applications using the old behaviour to
>>                  * run, let's accept the old combination, but warn about it.
>>                  */
>> -               if (fmtinfo->fourcc != fmt->pixelformat) {
>> +               if (fmt->pixelformat != fmtinfo->fourcc &&
>> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
>>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
>>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
>>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
>>
> 
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> 

Hi Sakari,

I saw you taking some of the patches on unicam, this one is the most
important as all unpacked formats are basically broken for a very long
time (months) and the patch is pending for quite some time.

This should also go in stable as some older versions also affected.

Thanks,
Eugen

> Thanks,
> Jai
> 
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260520-bcmpi-2c4850314e21
>>
>> Best regards,
>> --  
>> Eugen Hristev <ehristev@kernel.org>
>>
>>


