Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D42D3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OO7cJ6ksLx9Lnaeh3F3HehR+EVr9hpHn1qOsghRoek=; b=4jexviRQuEOPLNr1GTdmuRofKH
	2nWazHp6HZflKqtdRPE0HzkzULv3oscJMcZk53oossKQ5aWGaL0i7Enan32Gen1/eAYjvToA/mpav
	0wOk6Ze0XA0446J13JuyF/tAUs2vNd71nQjEeMofhF49jVQDDtRW6QlHh4hAcIgAp6AZkpGM4btuX
	vl0x9qeP11dI8WuL9rTbtI2QndV9xtXKgsyRa5A/g/d7pBEqswZqvOy9YjUIek5FWPwb0Lc2L9w9m
	G16aS+srnOI6PQMMIOvw/s6e/2kwr2P7XTG4y6+1xDm/QYHJqksMF7Byta219lVSLTEsVewDJMBWT
	S4GWuWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsDU-0000000ADen-3LcY;
	Tue, 26 Nov 2024 09:50:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs6n-0000000ACNW-2BjY;
	Tue, 26 Nov 2024 09:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732614228;
	bh=QTvnyqwGjjWVyPYPOq20hf9RRJbA0UUZwRQxa1GhjMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NNT+0d4F3zVyNDComwEHZiFfeYnXHDdTzC0yn29gej+aWe6VyDEXRSJ5mmUAx/MhP
	 IqMPKO67Ib0yOsnTaT1b8bJcBEip2fFve3yC0fdjUA2gAaworD55mlS+qxYKE2emTv
	 whb0LhPSHBvHupJ+PKPA35tZLE23ghLt1Q6h1yyV4qEZkUshFa0QJV2hZxCuYgq9WC
	 kNIcVczflIb1DJ/b78RukpNC/1REt6FA5v8A2QhAcpg2dlzv0Jr7jr8A6/eBNoaFaT
	 /TI3ncRovqJx18ucCom9gqbiFwAcTvyyk/zEBcjh0vsfzOPrRYb4Edbpit0hNyZ0xV
	 mhUYTNIu/pYmw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DDA617E35DC;
	Tue, 26 Nov 2024 10:43:47 +0100 (CET)
Message-ID: <78f440ff-1247-4d97-a170-fe2412e75d4a@collabora.com>
Date: Tue, 26 Nov 2024 10:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] thermal/drivers/mediatek/lvts: Disable low offset IRQ
 for minimum threshold
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-3-42e3c0528c6c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-3-42e3c0528c6c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_014349_702980_368BC6D9 
X-CRM114-Status: GOOD (  23.79  )
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

Il 25/11/24 22:20, Nícolas F. R. A. Prado ha scritto:
> In order to get working interrupts, a low offset value needs to be
> configured. The minimum value for it is 20 Celsius, which is what is
> configured when there's no lower thermal trip (ie the thermal core
> passes -INT_MAX as low trip temperature). However, when the temperature
> gets that low and fluctuates around that value it causes an interrupt
> storm.
> 
> Prevent that interrupt storm by not enabling the low offset interrupt if
> the low threshold is the minimum one.
> 
> Cc: stable@vger.kernel.org
> Fixes: 77354eaef821 ("thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 48 ++++++++++++++++++++++++---------
>   1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 6ac33030f015c7239e36d81018d1a6893cb69ef8..2271023f090df82fbdd0b5755bb34879e58b0533 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -67,10 +67,14 @@
>   #define LVTS_CALSCALE_CONF			0x300
>   #define LVTS_MONINT_CONF			0x0300318C
>   
> -#define LVTS_MONINT_OFFSET_SENSOR0		0xC
> -#define LVTS_MONINT_OFFSET_SENSOR1		0x180
> -#define LVTS_MONINT_OFFSET_SENSOR2		0x3000
> -#define LVTS_MONINT_OFFSET_SENSOR3		0x3000000
> +#define LVTS_MONINT_OFFSET_HIGH_SENSOR0		BIT(3)

Yeah it's longer, but that's more readable:

#define LVTS_MONINT_OFFSET_HIGH_INTEN_SENSOR0

...because what this BIT does is enabling the high offset interrupt for the
sensing point 0 (which in this driver we call sensor 0).

That name would make it (imo) way less likely to need any datasheet to understand
what is actually going on with that setting :-)

> +#define LVTS_MONINT_OFFSET_HIGH_SENSOR1		BIT(8)
> +#define LVTS_MONINT_OFFSET_HIGH_SENSOR2		BIT(13)
> +#define LVTS_MONINT_OFFSET_HIGH_SENSOR3		BIT(25)
> +#define LVTS_MONINT_OFFSET_LOW_SENSOR0		BIT(2)

Of course, the comment is valid for the LOW ones as well!

Everything else is good for me, and since it is just about simple renaming, I can
already give you my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +#define LVTS_MONINT_OFFSET_LOW_SENSOR1		BIT(7)
> +#define LVTS_MONINT_OFFSET_LOW_SENSOR2		BIT(12)
> +#define LVTS_MONINT_OFFSET_LOW_SENSOR3		BIT(24)
>   
>   #define LVTS_INT_SENSOR0			0x0009001F
>   #define LVTS_INT_SENSOR1			0x001203E0
> @@ -326,11 +330,17 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   
>   static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
>   {
> -	u32 masks[] = {
> -		LVTS_MONINT_OFFSET_SENSOR0,
> -		LVTS_MONINT_OFFSET_SENSOR1,
> -		LVTS_MONINT_OFFSET_SENSOR2,
> -		LVTS_MONINT_OFFSET_SENSOR3,
> +	u32 high_offset_masks[] = {
> +		LVTS_MONINT_OFFSET_HIGH_SENSOR0,
> +		LVTS_MONINT_OFFSET_HIGH_SENSOR1,
> +		LVTS_MONINT_OFFSET_HIGH_SENSOR2,
> +		LVTS_MONINT_OFFSET_HIGH_SENSOR3,
> +	};
> +	u32 low_offset_masks[] = {
> +		LVTS_MONINT_OFFSET_LOW_SENSOR0,
> +		LVTS_MONINT_OFFSET_LOW_SENSOR1,
> +		LVTS_MONINT_OFFSET_LOW_SENSOR2,
> +		LVTS_MONINT_OFFSET_LOW_SENSOR3,
>   	};
>   	u32 value = 0;
>   	int i;
> @@ -339,10 +349,22 @@ static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
>   
>   	for (i = 0; i < ARRAY_SIZE(masks); i++) {
>   		if (lvts_ctrl->sensors[i].high_thresh == lvts_ctrl->high_thresh
> -		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh)
> -			value |= masks[i];
> -		else
> -			value &= ~masks[i];
> +		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh) {
> +			/*
> +			 * The minimum threshold needs to be configured in the
> +			 * OFFSETL register to get working interrupts, but we
> +			 * don't actually want to generate interrupts when
> +			 * crossing it.
> +			 */
> +			if (lvts_ctrl->low_thresh == -INT_MAX) {
> +				value &= ~low_offset_masks[i];
> +				value |= high_offset_masks[i];
> +			} else {
> +				value |= low_offset_masks[i] | high_offset_masks[i];
> +			}
> +		} else {
> +			value &= ~(low_offset_masks[i] | high_offset_masks[i]);
> +		}
>   	}
>   
>   	writel(value, LVTS_MONINT(lvts_ctrl->base));
> 


