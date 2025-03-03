Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9496DC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGtV8bSTSxWJLobjXTfer0pbpczhF1xLoAXWif7ULao=; b=sUDdHVQO+h+rmElXg2HjUk0xXC
	ai5ObaiOmXnDWefPAD/4DytDwOp3YoJ/eqG3j8e0TC6GpKQGfqtPwJRkgG3kIbSp/wY6VpIgdR2W1
	FjX1cHo1PvtbSEBp6ITEcb2jNVfEnIwBMcW12DhLYVlCvQVdZe+50NuYHzM6EZtIeUoaw4y4e5EZK
	XEv5S+hiResa+XyI6l2KJh85XYbcT4GJlfjN+w9AEPL3JCg3dw3j0z265n9TedJwIPuFGxfWQAGow
	+j1pMVVzj1lCUqOJWHuLmflydt4MDN7tpZYLARhnU4p3LXS18hz96tkh/MtaaB/0uObhj3TIgmrPA
	wTN44PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5BC-00000000nQ2-34ku;
	Mon, 03 Mar 2025 12:45:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp50B-00000000lLE-2j4n;
	Mon, 03 Mar 2025 12:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741005270;
	bh=JHN5XUVVnQv9cvYemNLq5jso/MbQRX5go/vqQODxWS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ED/TNXm+3mmkw04O9PxoovNVGMKrA5Fe9qigZQWTOY+bD7MGMhkPtlbh0/YWyyzNQ
	 LypOt+jOFhvs37SITmauEnXctcDbJymnsiI6BeagOjVN4a3pPOWezQf1zgfTY3mxtD
	 y2aBDM1c6fr3+n6XQlD4nWyJFT89Pw1DcpqvxKB/28yrXjyDfmO6kVRgh6SQQjWh3c
	 Pdj7SIsufBMNaes6Z2v1NdIUz+/UJ3T2Eh8NRHcYyQOFIFOvnY0L6KnEl7wxIPEUST
	 ROIXu9NdBJNlXqKUMTnyjj5dF2KUAsloaCUvepT1sL6IlddaQVVdPFbp1cw/dqP7sk
	 eZ/Qf0JmTsvCA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81DC417E0607;
	Mon,  3 Mar 2025 13:34:29 +0100 (CET)
Message-ID: <12c5ba3e-a151-44a8-ace7-3d944a09ae5e@collabora.com>
Date: Mon, 3 Mar 2025 13:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] spi: spi-mtk-nor: Modify the clock architecture of nor
 controller
To: mtk22730 <Cloud.Zhang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250303114540.1617-1-Cloud.Zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250303114540.1617-1-Cloud.Zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_043431_848508_D91BCAE2 
X-CRM114-Status: GOOD (  26.81  )
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

Il 03/03/25 12:45, mtk22730 ha scritto:
> The clocks used by different platforms are not same. So it is
> necessary to modify the clock architecture to be adaptable to more
> platforms.
> 
> Signed-off-by: Cloud Zhang <cloud.zhang@mediatek.com>

You really shall fix your identity on outgoing emails: your name appears as
"mtk22730", that's not right.

Also, the title could be clarified a bit...

spi: spi-mtk-nor: Migrate to clk_bulk API

...and then: this should be a series, and the first commit shall be adjusting
the dt-binding for this driver accordigly, otherwise whatever you're doing here
will turn out to be unusable.

> ---
> Changes in v2:
>    -Use clk_bulk_xxx related functions to enable/disable clocks.
> 
> Changes in v1:
>    -Add new function mtk_nor_parse_clk() to parse nor clock parameters.
> ---
> ---
>   drivers/spi/spi-mtk-nor.c | 103 ++++++++++++++++++++------------------
>   1 file changed, 54 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 85ab5ce96c4d..4863b9cb2706 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -99,6 +99,8 @@
>   
>   #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
>   
> +#define MAX_CLOCK_CNT		6
> +
>   struct mtk_nor_caps {
>   	u8 dma_bits;
>   
> @@ -116,10 +118,8 @@ struct mtk_nor {
>   	void __iomem *base;
>   	u8 *buffer;
>   	dma_addr_t buffer_dma;
> -	struct clk *spi_clk;
> -	struct clk *ctlr_clk;
> -	struct clk *axi_clk;
> -	struct clk *axi_s_clk;
> +	struct clk_bulk_data clocks[MAX_CLOCK_CNT];

What about having this as a pointer?

	struct clk_bulk_data *clks;

...Then you count the clocks, and devm allocate the number of clks that you need.

> +	int clock_cnt;

u8 clock_cnt;

>   	unsigned int spi_freq;
>   	bool wbuf_en;
>   	bool has_irq;
> @@ -703,44 +703,68 @@ static int mtk_nor_transfer_one_message(struct spi_controller *host,
>   
>   static void mtk_nor_disable_clk(struct mtk_nor *sp)

A function with one call means that you don't need a function at all.

>   {
> -	clk_disable_unprepare(sp->spi_clk);
> -	clk_disable_unprepare(sp->ctlr_clk);
> -	clk_disable_unprepare(sp->axi_clk);
> -	clk_disable_unprepare(sp->axi_s_clk);
> +	clk_bulk_disable_unprepare(sp->clock_cnt, sp->clocks);
>   }
>   
>   static int mtk_nor_enable_clk(struct mtk_nor *sp)
>   {

You can also remove this function and transfer the contents into mtk_nor_probe():
it's just something like 6 lines and even called only once, so... :-)

>   	int ret;
> +	int i;
>   
> -	ret = clk_prepare_enable(sp->spi_clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(sp->ctlr_clk);
> +	ret = clk_bulk_prepare_enable(sp->clock_cnt, sp->clocks);
>   	if (ret) {
> -		clk_disable_unprepare(sp->spi_clk);
> +		dev_err(sp->dev, "enable clk failed\n");
>   		return ret;
>   	}
>   
> -	ret = clk_prepare_enable(sp->axi_clk);
> -	if (ret) {
> -		clk_disable_unprepare(sp->spi_clk);
> -		clk_disable_unprepare(sp->ctlr_clk);
> -		return ret;
> -	}
> +	for (i = 0; i < sp->clock_cnt; i++) {
> +		if (IS_ERR(sp->clocks[i].clk)) {
> +			dev_err(sp->dev, "get %s fail\n", sp->clocks[i].id);
> +			return PTR_ERR(sp->clocks[i].clk);
> +		}
>   
> -	ret = clk_prepare_enable(sp->axi_s_clk);
> -	if (ret) {
> -		clk_disable_unprepare(sp->spi_clk);
> -		clk_disable_unprepare(sp->ctlr_clk);
> -		clk_disable_unprepare(sp->axi_clk);
> -		return ret;
> +		if (!strcmp(sp->clocks[i].id, "spi"))
> +			sp->spi_freq = clk_get_rate(sp->clocks[i].clk);
>   	}
>   
>   	return 0;
>   }
>   
> +static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
> +{
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +	const char *name;
> +	int cnt, i;

	struct device_node *np = dev->of_node;
	const char *name;
	int cnt, i, ret;


> +
> +	cnt = of_property_count_strings(np, "clock-names");
> +	if (!cnt || (cnt == -EINVAL)) {
> +		dev_err(dev, "Unable to find clocks\n");

return -EINVAL;

> +		ret = -EINVAL;
> +		goto out;
> +	} else if (cnt < 0) {
> +		dev_err(dev, "Count clock strings failed, err %d\n", cnt);

return cnt;

> +		ret = cnt;
> +		goto out;
> +	}
> +
> +	sp->clock_cnt = cnt;
> +	for (i = 0; i < cnt; i++) {
> +		ret = of_property_read_string_index(np, "clock-names", i, &name);
> +		if (ret) {
> +			dev_err(dev, "failed to get clock string\n");
> +			return ret;
> +		}
> +
> +		sp->clocks[i].id = name;
> +	}
> +
> +	ret = devm_clk_bulk_get(dev, sp->clock_cnt, sp->clocks);

	if (ret)
		return ret;

	return 0;

> +
> +out:
> +	return ret;
> +}
> +

Cheers,
Angelo


