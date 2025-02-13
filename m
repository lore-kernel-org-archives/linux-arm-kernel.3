Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F63C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcBsUFzAZMljmZ4NC4Z5IEFcNRgYURr7hnhkjXK+pYM=; b=3JyuAQrPzmcH5jPuUfbk6k9my6
	5YkHzp97u634c5gOtp+t/TfeyG+VliWiQevo9z5hSGB/c2Tm4TcdMAPFcy1PzcvwXu5Zer3xVpbqU
	raiCKPZlY1JINfcwyBYSdMP34sHFbWEPDe3gwIeyb0iuJrMoO/c6vI0bzXBSPIhQCArn8ATioDbAT
	xE+Rm199rfcjeVzs4Cw4p1DLI5LEZQ8l3jMVCTzBPu2S/lvJeI0Z6OfNl39JzQ6NwcmBiKBz5e6QL
	5UqSQdw/Xay3UexuwaGxNBk2P//uGeAlnfBr/hyWvpcPj7vgvUzfcmkPdiF84wCqfIYtI7/xf4LQK
	zb3SpDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibrS-0000000BiLb-2gx2;
	Thu, 13 Feb 2025 16:14:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibeV-0000000Bf4b-2nJR;
	Thu, 13 Feb 2025 16:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739462481;
	bh=AELVohWuzqv0J7A48Oikubot5SUmdrGfFnK7WLpvZuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVYbwMYEOtW5ofaUzNvBnfgvSIRGa7YKHOH7eS2VboFXzc4V3pIMzNTRkGndYSEg3
	 O6YPH6mxC41x/wZJ+su4EbiJOX1IfNaHFhfzvFwqZ7uFZALiJL9xZEyRwttc1qq8xi
	 0dqubT3pG2Q8Qz8BlblK1IExKD98ZQ337x+cLs+pp0FuNrK9DE8L2S8Z+hOLZnflIj
	 nROJzUaFiUxqBBU4hw2kdZrCpaQ+j/E280RG0cIbENa44XufDhzBAEKzCd8zTCTWr8
	 cseXxf1G5Eh/zCf08awRZDXmha4XpUdFW12IgxOFRf0jX51b8DcP7YN1uT3Vac9UXK
	 ZTWLKXmgys9Bg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB56C17E153C;
	Thu, 13 Feb 2025 17:01:20 +0100 (CET)
Message-ID: <ceb1cb01-78b8-4ed4-b4fc-23fdac78ab21@collabora.com>
Date: Thu, 13 Feb 2025 17:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] i2c: mt7621: Use i2c_10bit_addr_*_from_msg()
 helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_080123_872204_247BD727 
X-CRM114-Status: GOOD (  14.74  )
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

Il 13/02/25 15:07, Andy Shevchenko ha scritto:
> Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Can we please do the helper conversion as one commit and the (much needed)
cleanup of assigning len and de-duplicating the call to mtk_i2c_cmd() as
two commits?

One with just the conversion, one with the cleanup (or in inverse order,
as you wish).

Thanks,
Angelo

> ---
>   drivers/i2c/busses/i2c-mt7621.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 2103f21f9ddd..0a288c998419 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -164,22 +164,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   		/* write address */
>   		if (pmsg->flags & I2C_M_TEN) {
>   			/* 10 bits address */
> -			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
> -			addr |= (pmsg->addr & 0xff) << 8;
> -			if (pmsg->flags & I2C_M_RD)
> -				addr |= 1;
> -			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
> -			if (ret)
> -				goto err_timeout;
> +			addr = i2c_10bit_addr_hi_from_msg(pmsg);
> +			addr |= i2c_10bit_addr_lo_from_msg(pmsg) << 8;
> +			len = 2;
>   		} else {
>   			/* 7 bits address */
>   			addr = i2c_8bit_addr_from_msg(pmsg);
> -			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
> -			if (ret)
> -				goto err_timeout;
> +			len = 1;
>   		}
> +		iowrite32(addr, i2c->base + REG_SM0D0_REG);
> +		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
> +		if (ret)
> +			goto err_timeout;
>   
>   		/* check address ACK */
>   		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {


