Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD45CFD647
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VW6IuDGs7AeVFHck8k9JU2WuLisZSWO4cosMsM1/pY=; b=nMLK4mITbGBCZo0vumi4C7N0fE
	moXXvNw6knL8hBOCdolzO6jO7ReFPxoe9G+diIXYst0BDb/jPBxIB2UBDDQvG9//Ba4fDNmuyFL26
	wEEVJQ8g0CCDzpvlBunvTRRcvLno5fqNSsUEGg6g9jpgjKxrgnyuU5vIMEzuSSRGWtLRwbIyOaZaY
	sg2v1Z8tPVlUn4kiU6Xk2Zm7bQaA5XC5wHJubn2jV4GVm+OrbI9C0uyagjHEhfF4v9WohuwQPRgt3
	n7gBUuoRciAYuj0lWI8ZCke9OlYFQjfBUSRFC673t4akk4ancttQSq8C7RWPef5z+JPkzBajfUg0D
	p+xEqgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUtb-0000000F81g-236j;
	Wed, 07 Jan 2026 14:52:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUtZ-0000000F80t-1Kzp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:52:22 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vdUtK-0002O9-IV; Wed, 07 Jan 2026 15:52:06 +0100
Message-ID: <1f4720ea-fa9c-41b7-9a6c-24abffa4bd77@pengutronix.de>
Date: Wed, 7 Jan 2026 15:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/22] media: rockchip: rga: move rga_fmt to rga-hw.h
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
 <20251203-spu-rga3-v2-18-989a67947f71@pengutronix.de>
 <de09023e7bdb1698c0bcdeb8d625101cbf647595.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <de09023e7bdb1698c0bcdeb8d625101cbf647595.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_065221_350397_21B0CF51 
X-CRM114-Status: GOOD (  16.74  )
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

On 12/24/25 4:59 PM, Nicolas Dufresne wrote:
> Le mercredi 03 décembre 2025 à 16:52 +0100, Sven Püschel a écrit :
>> Move rga_fmt to rga-hw in preparation of the RGA3 addition, as the struct
>> contains many RGA2 specific values. They are used to write the correct
>> register values quickly based on the chosen format. Therefore the
>> pointer to the rga_fmt struct is kept but changed to an opaque void
>> pointer outside of the rga-hw.h.
[...]
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index fffcab0131225..3bc4b1f5acba2 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -6,6 +6,8 @@
>>   #ifndef __RGA_HW_H__
>>   #define __RGA_HW_H__
>>   
>> +#include <linux/types.h>
>> +
>>   #define RGA_CMDBUF_SIZE 0x20
>>   
>>   /* Hardware limits */
>> @@ -431,4 +433,14 @@ union rga_pat_con {
>>   	} data;
>>   };
>>   
>> +struct rga_fmt {
>> +	u32 fourcc;
>> +	int depth;
>> +	u8 uv_factor;
>> +	u8 y_div;
>> +	u8 x_div;
>> +	u8 color_swap;
>> +	u8 hw_format;
>> +};

[...]

>>   
>> -struct rga_fmt {
>> -	u32 fourcc;
>> -	int depth;
>> -	u8 uv_factor;
>> -	u8 y_div;
>> -	u8 x_div;
>> -	u8 color_swap;
>> -	u8 hw_format;
>> -};
> Ah! here's the removal of the unused variable. Not review friendly, but at last
> removed.

I've just moved it, so your review comments are still right. x_div/y_div 
is still used at one place in rga_hw.c, but I'll remove it too in my v3 
(and have these removals in the other commits to keep this reviewed-by).

Sincerely
     Sven

>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>> -
>>   struct rga_frame {
>>   	/* Crop */
>>   	struct v4l2_rect crop;
>>   
>>   	/* Image format */
>> -	struct rga_fmt *fmt;
>> +	void *fmt;
>>   	struct v4l2_pix_format_mplane pix;
>>   };
>>   
>> @@ -145,8 +135,6 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
>>   struct rga_hw {
>>   	const char *card_type;
>>   	bool has_internal_iommu;
>> -	struct rga_fmt *formats;
>> -	u32 num_formats;
>>   	size_t cmdbuf_size;
>>   	u32 min_width, min_height;
>>   	u32 max_width, max_height;
>> @@ -158,6 +146,9 @@ struct rga_hw {
>>   		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
>>   	bool (*handle_irq)(struct rockchip_rga *rga);
>>   	void (*get_version)(struct rockchip_rga *rga);
>> +	void *(*adjust_and_map_format)(struct v4l2_pix_format_mplane *format,
>> +				       bool is_output);
>> +	int (*enum_format)(struct v4l2_fmtdesc *f);
>>   };
>>   
>>   static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)

