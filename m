Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04227CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3WUpioTqTeLQl/EiFm/Ll2GqsQinrWIJKqgIS4qAv8=; b=HbL4kN7v1IBexwHXHxtSYXwxnl
	AbzhPQ1c1q0uY4TRTfhvASS9qMgM1QPdlrGWteFOH6DmkvHSEPv1cg3ErfJKII+ALmW4ZzEBTwo9/
	DkaDxJeY6d7kvkL5k88ai3a/V8q21MqFFrID8wlguRxZTpXnrN+RZRMhXHfvM2/+FmYgdvVl+/Hd9
	FhIRDRP90smLk320qp169B3vqIB1zzsRJRhZyyFaRHBeSWP25UKUzvgSpxXG89Gzt7MpRjj7SFqNV
	wPDLCOSSsJT9HQYFs2dDiLBy2c1d857nvrbkdkW24MYWmfOse7daf7H1grlyYuAGbXgpL8YRh3bcj
	03m2aGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ayc-000000029kr-2uZi;
	Mon, 29 Sep 2025 10:19:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AyZ-000000029kD-3GUL;
	Mon, 29 Sep 2025 10:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141161;
	bh=uM45QtBn2WkfbUnPuyU78VZp3d+wVITSNdBrjE11qNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GyiWhITq98tH44d7S5usBLHJen2tc/eXRgP5Yjq+Gq35KcSMyD2JpvcN7ADRc4KDM
	 NxsGK4H6NFnr6PAhKQFNhgjcq7RIM+ahuFu7sFEonc3bwrE8C13pw4wXz42PBPbqAx
	 Uk6/KtciEcZGhtvkKIsTnDWQ/DRKgTnrrf7VNfD/pnFeCtvJG/mEXrI2iGnumcBP/n
	 /IsSuokA7tN2EFHaK+PAFom4Sn6nIp5K7/wjh/rC1CrRL5SlRHUtNP0oRePtLUhuYa
	 EOZZy1g45ehwTH2RRAXOBoR31/5ja4GevqgqlQ306qK5lQHDi4TXyiIslNpkkwLyb8
	 P5zw+0o7QfzMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7080417E0125;
	Mon, 29 Sep 2025 12:19:21 +0200 (CEST)
Message-ID: <0b4d16a1-e125-4d99-babc-a08aa6fb9cbf@collabora.com>
Date: Mon, 29 Sep 2025 12:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mt65xx: convert set_speed function to void
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031923_985610_7E4D0C70 
X-CRM114-Status: GOOD (  15.97  )
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

Il 25/09/25 23:05, Wolfram Sang ha scritto:
> cppcheck rightfully reports:
> drivers/i2c/busses/i2c-mt65xx.c:1464:6: warning: Condition 'ret' is always false [knownConditionTrueFalse]
> 
> Make the function void and simplify the code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index dee40704825c..aefdbee1f03c 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -868,7 +868,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
>   	return 0;
>   }
>   
> -static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
> +static void mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   {
>   	unsigned int clk_src;
>   	unsigned int step_cnt;
> @@ -938,9 +938,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   
>   		break;
>   	}
> -
> -
> -	return 0;
>   }
>   
>   static void i2c_dump_register(struct mtk_i2c *i2c)
> @@ -1460,11 +1457,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	strscpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
>   
> -	ret = mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to set the speed.\n");
> -		return -EINVAL;
> -	}
> +	mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
>   
>   	if (i2c->dev_comp->max_dma_support > 32) {
>   		ret = dma_set_mask(&pdev->dev,


