Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ABCCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwVXkjHzQwuD6UI26QCYSy12w0F8layTWf1voEls3E8=; b=L913ij6OHzUF1u9zTgKVjAEkCc
	OY+NABD5DnNkRoHl+HyE6FundWTaUoxVAEEfLlgHyxro5M6MhmQvjnIu9Ny/GI09TtXcDLgoUwv8G
	9Gcix1qGZTuuqhUg2WsKM0Nua3a1KMPl4pQwkMyMtuJZ0W856+E4ZawaotNdKJkDEjOjcxZddU4QJ
	Bwev4LrEvnYagA8kXvvhz66wHH8zIcXe0H9lzcL+//x0UGIJ0c5NUg7WSDZ1vXpF9gTRoLZbao9i9
	EiEil8Rae1ynzoHKGetzDUHEbBbdviN4dw+ehBnsr3AOjVeOnDkcJjlO9ItOuwwJK6PsPavHoIH9l
	67ynlAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lyT-00000005WK1-1fLV;
	Thu, 09 Oct 2025 08:26:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lyQ-00000005WJU-1TEO;
	Thu, 09 Oct 2025 08:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759998364;
	bh=wSWyJi0/TAO8GU/SWsIP6i2YbWjUCFhoiqvW6k3QEso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dxxWF89a8zWRFH2gqgMnQGPculxLXFfzfHKak7sxhi81EWQh1toN1aJFOVF4g49MD
	 ktYlB5mOK10wkFBcTFE4XmBdPIVT4TQbZzK/L83/d2dGEpUdkmJOA0nBvc8FsnSgqo
	 rGnTc5nk2bb3U3q7GyqnmA9bGhSK2dmkdqAizPVzBTGa/zv3fMpub7ulV684L2AClp
	 BozDZ8XSoxEyiFY6ZSQhBeR5ST7lAn6syDT4C5asgfzDPBwP50fq7TemyfRKEN4ZNe
	 9rIxvTJLQVivzOQps6YOZHt3RhkacMQ0uERdFYtkmcUicuDHH30wsXSCoYYQ6pubBs
	 iRPjr1FwSfdHQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 152ED17E12DA;
	Thu,  9 Oct 2025 10:26:03 +0200 (CEST)
Message-ID: <c8cf6ce8-87e9-41ef-875f-e1f8f103ac78@collabora.com>
Date: Thu, 9 Oct 2025 10:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/17] media: rockchip: rkcif: add support for px30
 vip dvp capture
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-10-af0eada54e5d@collabora.com>
 <aOV0SrQWlVUTx1-R@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aOV0SrQWlVUTx1-R@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_012606_575370_BE520E7E 
X-CRM114-Status: GOOD (  20.50  )
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

Hi Sakari,

Thanks for the review.

On 10/7/25 22:12, Sakari Ailus wrote:
> [...]
>>  
>>  static const char *const rk3568_vicap_clks[] = {
>> @@ -62,11 +64,21 @@ MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
>>  
>>  static int rkcif_register(struct rkcif_device *rkcif)
>>  {
>> +	int ret;
>> +
>> +	ret = rkcif_dvp_register(rkcif);
>> +	if (ret && ret != -ENODEV)
>> +		goto err;
> 
> 	return ret == -ENODEV ? 0 : ret;

This is written in that way so that the patch 12/17 does not need to
modify recently added lines and simply needs to add new lines. OK with that?

> 
>> +
>>  	return 0;
>> +
>> +err:
>> +	return ret;
>>  }
>>  
>>  static void rkcif_unregister(struct rkcif_device *rkcif)
>>  {
>> +	rkcif_dvp_unregister(rkcif);
>>  }
>>  
>>  static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
>> @@ -111,6 +123,9 @@ static irqreturn_t rkcif_isr(int irq, void *ctx)
>>  {
>>  	irqreturn_t ret = IRQ_NONE;
>>  
>> +	if (rkcif_dvp_isr(irq, ctx) == IRQ_HANDLED)
>> +		ret = IRQ_HANDLED;
>> +
>>  	return ret;
>>  }
>>  
>> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
>> new file mode 100644
>> index 000000000000..d50b6e14b5af
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
>> @@ -0,0 +1,131 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Rockchip Camera Interface (CIF) Driver
>> + *
>> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
>> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
>> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
>> + */
>> +
>> +#ifndef _RKCIF_REGS_H
>> +#define _RKCIF_REGS_H
>> +
>> +#define RKCIF_REGISTER_NOTSUPPORTED	      0x420000
>> +#define RKCIF_FETCH_Y(VAL)		      ((VAL) & 0x1fff)
>> +#define RKCIF_XY_COORD(x, y)		       (((y) << 16) | (x))
> 
> Why the use of spaces for alignment to a column not divisible by 8? For a
> new header that doesn't seem to make sense.

Hm. I use clang-format to format my code and apparently it looks for the
longest define name (RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES ex aequo
with others) and adds a space there. The other defines are aligned to
that one. I don't think this behavior of clang-format can be adjusted
(only option would be not to align anything, i.e.,

#define RKCIF_REGISTER_NOTSUPPORTED 0x420000
#define RKCIF_FETCH_Y(VAL) ((VAL) & 0x1fff)
#define RKCIF_XY_COORD(x, y) (((y) << 16) | (x))
...

If you don't find what clang-format produces appropriate, I'll change it
manually. Is there any strict rule? What should it look like in the end?
Align with tabs only to something divisible by 8?

Best regards,
Michael

> 
>> +
>> +/* DVP register contents */
>> +#define RKCIF_CTRL_ENABLE_CAPTURE	       BIT(0)
>> +#define RKCIF_CTRL_MODE_PINGPONG	       BIT(1)
>> +#define RKCIF_CTRL_MODE_LINELOOP	       BIT(2)
>> +#define RKCIF_CTRL_AXI_BURST_16		       (0xf << 12)
>> +
>> +#define RKCIF_INTEN_FRAME_END_EN	       BIT(0)
>> +#define RKCIF_INTEN_LINE_ERR_EN		       BIT(2)
>> +#define RKCIF_INTEN_BUS_ERR_EN		       BIT(6)
>> +#define RKCIF_INTEN_SCL_ERR_EN		       BIT(7)
>> +#define RKCIF_INTEN_PST_INF_FRAME_END_EN       BIT(9)
>> +
>> +#define RKCIF_INTSTAT_CLS		       0x3ff
>> +#define RKCIF_INTSTAT_FRAME_END		       BIT(0)
>> +#define RKCIF_INTSTAT_LINE_END		       BIT(1)
>> +#define RKCIF_INTSTAT_LINE_ERR		       BIT(2)
>> +#define RKCIF_INTSTAT_PIX_ERR		       BIT(3)
>> +#define RKCIF_INTSTAT_DFIFO_OF		       BIT(5)
>> +#define RKCIF_INTSTAT_BUS_ERR		       BIT(6)
>> +#define RKCIF_INTSTAT_PRE_INF_FRAME_END	       BIT(8)
>> +#define RKCIF_INTSTAT_PST_INF_FRAME_END	       BIT(9)
>> +#define RKCIF_INTSTAT_FRAME_END_CLR	       BIT(0)
>> +#define RKCIF_INTSTAT_LINE_END_CLR	       BIT(1)
>> +#define RKCIF_INTSTAT_LINE_ERR_CLR	       BIT(2)
>> +#define RKCIF_INTSTAT_PST_INF_FRAME_END_CLR    BIT(9)
>> +#define RKCIF_INTSTAT_ERR		       0xfc
>> +
>> +#define RKCIF_FRAME_STAT_CLS		       0x00
>> +#define RKCIF_FRAME_FRM0_STAT_CLS	       0x20
>> +
>> +#define RKCIF_FORMAT_VSY_HIGH_ACTIVE	       BIT(0)
>> +#define RKCIF_FORMAT_HSY_LOW_ACTIVE	       BIT(1)
>> +
>> +#define RKCIF_FORMAT_INPUT_MODE_YUV	       (0x00 << 2)
>> +#define RKCIF_FORMAT_INPUT_MODE_PAL	       (0x02 << 2)
>> +#define RKCIF_FORMAT_INPUT_MODE_NTSC	       (0x03 << 2)
>> +#define RKCIF_FORMAT_INPUT_MODE_BT1120	       (0x07 << 2)
>> +#define RKCIF_FORMAT_INPUT_MODE_RAW	       (0x04 << 2)
>> +#define RKCIF_FORMAT_INPUT_MODE_JPEG	       (0x05 << 2)
>> +#define RKCIF_FORMAT_INPUT_MODE_MIPI	       (0x06 << 2)
>> +
>> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY      (0x00 << 5)
>> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU      (0x01 << 5)
>> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY      (0x02 << 5)
>> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV      (0x03 << 5)
>> +#define RKCIF_FORMAT_YUV_INPUT_422	       (0x00 << 7)
>> +#define RKCIF_FORMAT_YUV_INPUT_420	       BIT(7)
>> +
>> +#define RKCIF_FORMAT_INPUT_420_ORDER_ODD       BIT(8)
>> +
>> +#define RKCIF_FORMAT_CCIR_INPUT_ORDER_EVEN     BIT(9)
>> +
>> +#define RKCIF_FORMAT_RAW_DATA_WIDTH_8	       (0x00 << 11)
>> +#define RKCIF_FORMAT_RAW_DATA_WIDTH_10	       (0x01 << 11)
>> +#define RKCIF_FORMAT_RAW_DATA_WIDTH_12	       (0x02 << 11)
>> +
>> +#define RKCIF_FORMAT_YUV_OUTPUT_422	       (0x00 << 16)
>> +#define RKCIF_FORMAT_YUV_OUTPUT_420	       BIT(16)
>> +
>> +#define RKCIF_FORMAT_OUTPUT_420_ORDER_EVEN     (0x00 << 17)
>> +#define RKCIF_FORMAT_OUTPUT_420_ORDER_ODD      BIT(17)
>> +
>> +#define RKCIF_FORMAT_RAWD_DATA_LITTLE_ENDIAN   (0x00 << 18)
>> +#define RKCIF_FORMAT_RAWD_DATA_BIG_ENDIAN      BIT(18)
>> +
>> +#define RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV     (0x00 << 19)
>> +#define RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU     BIT(19)
>> +
>> +#define RKCIF_FORMAT_BT1120_CLOCK_SINGLE_EDGES (0x00 << 24)
>> +#define RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES BIT(24)
>> +#define RKCIF_FORMAT_BT1120_TRANSMIT_INTERFACE (0x00 << 25)
>> +#define RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS  BIT(25)
>> +#define RKCIF_FORMAT_BT1120_YC_SWAP	       BIT(26)
>> +
>> +#define RKCIF_SCL_CTRL_ENABLE_SCL_DOWN	       BIT(0)
>> +#define RKCIF_SCL_CTRL_ENABLE_SCL_UP	       BIT(1)
>> +#define RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS BIT(4)
>> +#define RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS BIT(5)
>> +#define RKCIF_SCL_CTRL_ENABLE_32BIT_BYPASS     BIT(6)
>> +#define RKCIF_SCL_CTRL_DISABLE_32BIT_BYPASS    (0x00 << 6)
>> +
>> +#define RKCIF_INTSTAT_F0_READY		       BIT(0)
>> +#define RKCIF_INTSTAT_F1_READY		       BIT(1)
>> +
>> +/* GRF register offsets and contents */
>> +#define RK3568_GRF_VI_CON0		       0x340
>> +#define RK3568_GRF_VI_CON1		       0x344
>> +#define RK3568_GRF_VI_STATUS0		       0x348
>> +
>> +#define RK3568_GRF_VI_CON1_CIF_DATAPATH	       BIT(9)
>> +#define RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM    GENMASK(6, 0)
>> +
>> +#define RK3568_GRF_WRITE_ENABLE(x)	       ((x) << 16)
>> +
>> +enum rkcif_dvp_register_index {
>> +	RKCIF_DVP_CTRL,
>> +	RKCIF_DVP_INTEN,
>> +	RKCIF_DVP_INTSTAT,
>> +	RKCIF_DVP_FOR,
>> +	RKCIF_DVP_LINE_NUM_ADDR,
>> +	RKCIF_DVP_FRM0_ADDR_Y,
>> +	RKCIF_DVP_FRM0_ADDR_UV,
>> +	RKCIF_DVP_FRM1_ADDR_Y,
>> +	RKCIF_DVP_FRM1_ADDR_UV,
>> +	RKCIF_DVP_VIR_LINE_WIDTH,
>> +	RKCIF_DVP_SET_SIZE,
>> +	RKCIF_DVP_SCL_CTRL,
>> +	RKCIF_DVP_CROP,
>> +	RKCIF_DVP_FRAME_STATUS,
>> +	RKCIF_DVP_LAST_LINE,
>> +	RKCIF_DVP_LAST_PIX,
>> +	RKCIF_DVP_REGISTER_MAX
>> +};
>> +
>> +#endif
>>
> 


