Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9F7E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsZBVzl3myhMdckZz1QV5Ei4zH2nd2KfYzCW/8M2/4M=; b=i5PsaKJTrQ8uz/OF/ltQJARuLv
	nQ6p+PF+wsaxTlSe/c6WE341LjLsZXie4XV2ku18yzMZuWyXyjLkL2dxjKmqwoQFgdjJbcAObhfNl
	dB4j1DkjitOdJtZrnao78DFtkAsFybMZjaRrCqC0idaqPRSHyci41FEPMY9zyZ0t1CUF2byrikCWS
	gZPJbmQrLj5IgVWBQnBMekEl9aENHYKbUFVXu5MXDAJsL5oK4EnpIgmB0VDw6/N6PwGD0Ebn1wqON
	0gYUEZZbTeUOA4apr3trieTFKnekQEL+/Rba8J3Fv2SDybCd8NW5EniLqoll5Jc+fkGlUXjMtHM9B
	vsTuahXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJnp-000000058gI-3rMc;
	Mon, 13 Jan 2025 12:44:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJlR-0000000581s-25Zc;
	Mon, 13 Jan 2025 12:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736772111;
	bh=0regcGnIiOmQotfiGELt5jiaeJOWuIi22iTIBQAFX6Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mthwYCH9BDqTa6lcFAbSQZQ5FP4QTeiwXGOOyLe4ArVITbuDL3fwwtoqazrU/Bua+
	 eLrUqtGBEpWkZ5aLMe9QTqzYPfPERMqReB8+3TWGf4qfyHZ2GRHXumzZf0mX1Q5xME
	 lkxPMEk2fkWAivWK+gTqIi2MhAi42cp4f1jgxxGEyEu1dqWa/E6SqGXhN8wHhSU+HQ
	 QMuH0zunkGC6MzfphecAFRloluvs9QHnqQ4zWrnQKasDVkW5dPp2UPdPYqcwkZbkHC
	 TeOIIutCrSBcBR4HDYvHQ1+BBQtXxY/RdJv96c+5dpJqwJ+O121X1EHhAlWVzHvUfL
	 i1tIwT+Y8sGug==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC05217E09AF;
	Mon, 13 Jan 2025 13:41:50 +0100 (CET)
Message-ID: <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
Date: Mon, 13 Jan 2025 13:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044153_710208_E3D752C9 
X-CRM114-Status: GOOD (  14.28  )
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

Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
> Use dev_err_probe() to make error code and deferred probe handling
> simpler.
> 

That's already done in [1] so you can drop this commit.

[1]: 
https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com

Cheers,
Angelo

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 4b0eb7dc25d8..22935fdc5afe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1429,19 +1429,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	int ret;
>   
>   	ret = mtk_hdmi_get_all_clk(hdmi, np);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get clocks: %d\n", ret);
> -
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
>   
>   	/* The CEC module handles HDMI hotplug detection */
>   	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
> -	if (!cec_np) {
> -		dev_err(dev, "Failed to find CEC node\n");
> -		return -EINVAL;
> -	}
> +	if (!cec_np)
> +		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
>   
>   	cec_pdev = of_find_device_by_node(cec_np);
>   	if (!cec_pdev) {
> @@ -1492,10 +1486,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   
>   	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>   	if (!i2c_np) {
> -		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
> -			remote);
> +		ret = dev_err_probe(dev, -EINVAL, "Failed to find ddc-i2c-bus node in %pOF\n",
> +				    remote);
>   		of_node_put(remote);
> -		ret = -EINVAL;
>   		goto put_device;
>   	}
>   	of_node_put(remote);
> @@ -1503,8 +1496,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>   	of_node_put(i2c_np);
>   	if (!hdmi->ddc_adpt) {
> -		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
> -		ret = -EINVAL;
> +		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
>   		goto put_device;
>   	}
>   


