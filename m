Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1CC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv90/4Ii7oHU4TLhsDR0XOWXVnCVpBGLvijyzK1ZPiM=; b=zFMG6d7gKjkV88UGC7iflVEENG
	y2rqDoyAB2LJYYF8pONQb6/gSJ83QJwzC+1oA9crXTIqX9mtV7B/XmqGcewuWKGpJ+4M8EZqP9DDQ
	TzIoDsZxBIcMidza1RYjzqA9H1t25h8LY9q1cuGp+Tp6J/bzt+GhyPNz6EjiNmehI2NFrU0gMsThT
	m49NWyvIgF6vaEm8cJ7JkcxzrVM5f7bGZCMYcF4D0KoI0U6OkQ6wW171WkKTaiMj1PeVU6wl0R7+7
	pZLaep1Lxml6XTByx5VJ19OHlDCSFAGNIXG5MWzFWXIU/6uiXq/mFWO63E0jJJYUTWfitA4ur4nuq
	n+tmzzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPdj-00000009vwm-1gby;
	Fri, 07 Feb 2025 14:47:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPcJ-00000009vQP-1qNn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:46:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436a03197b2so14687415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738939562; x=1739544362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hv90/4Ii7oHU4TLhsDR0XOWXVnCVpBGLvijyzK1ZPiM=;
        b=kB26pp6eTj4MqJ3+eTmaz2jdgqYEB4xZ5ptLehGwZQU0K9ggFtokIJF0rKKgWl/qZb
         gQw2SEbVpsGJF3HdpTXuM1iFUVSBnogeOSN819KWh+agXaPY5AW47KUEm4CO+XHaJ8s+
         hdVAwKRpbIfU0uebo2uh912RohgISsJbZeEqACF08XdTDn5Y9bPZICLpbuMXWC+OqfCf
         pUGrOVgsk+iHP6lb3h2i/SsN8nIxo330s0yi6IZpDgSGjMXSZpIjDwpp2/7rXoxcf+RT
         CHw2ygkSlRDt6clx3mKeuICLywTDQ8Wk7MRlsA0jIcQJgePAaI/TxE1ckbt7W56eANQ4
         xCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738939562; x=1739544362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv90/4Ii7oHU4TLhsDR0XOWXVnCVpBGLvijyzK1ZPiM=;
        b=CAkpo9S2f13FvR2jLdc60hhb/S+x1s7gvuSwoIREyO0mijD7jziqTuSsJvUeXnT+RV
         Lpk/gskNbCX9eo9mDiDfOfc/0LvR1FF/8heBJN6U5hDcCYro0IsAc6vy0ii3VQduCfk9
         UtE1PxngcAM4PnJ4P3HXgD/SzfqvX6Gr1vxvGlL0jgiHMVPjQotbytPO6/rParPlxVP1
         S8g9PJWjNBc9R03YDLzcxwo0WsgzA9achfQ+ZZwKePPtj3mDxNXrqcJlKDpnH/otyVpV
         E4oc3qkrxnrHiy6zJ6aBVekRrr0oalr8xAX0Rb6haXmH5uEU9rNOEcXARBYY9x7rE7eR
         +4gA==
X-Forwarded-Encrypted: i=1; AJvYcCU2FlmkMT38raJZks2i+FOJWUKPD0ZTmSaU/sm6NYtFWujrgpxKqgmoCwCzsFYCIN0YlnyZ1uZ8K9IcYG5BxonK@lists.infradead.org
X-Gm-Message-State: AOJu0YxNP7mXh6noEaHiqYmrT4/7tZg9P/HThhPYjfz4zb8NhNT3o7j+
	gPl5w+O5GvfYlNatyPn3O2Txf1EgQUABa9coapoSBwHODE5G1rfB5C2RZhfBD8c=
X-Gm-Gg: ASbGnctnyU9/P5/jT8HkEQ4GLZfnDoQg2RrsA7jR+Of/hEobC8N3OKtK5ZveiOIzjDN
	VweoljKldebfLvBqKCuPyZ4KOOU4guC5+eFNAwg0sq4fde0fKvgYw0ghpGnvbxZwZdgejVqb5VG
	rw8pwFMbPB4v78Ax8uk5XWXv3CHfUBou2G7gLCQGb+/15IeX+HXdOn5/oEnykRIyoTeIZMhCHxo
	5a9F/23JaRG50fwt7pHbwHUm5Pkv4T1eHa2qxkWcEvOXW/1PhwBuSMYXJUTIcJ3fGDMF+JsVIfI
	fkau4ghEJF88coawmhPsqr3NmrTn7nDQQr25sqH4YjWM7L2p5cYlQuX9IJXyt+A=
X-Google-Smtp-Source: AGHT+IHFc+CaRU85moSCDGrb/7WzOtXGy8Znz1lNZW2tGN9O7ngj6L2f+YkxFTgGpjCIR2UBQc+Nww==
X-Received: by 2002:a05:6000:188b:b0:38d:c58f:4ceb with SMTP id ffacd0b85a97d-38dc9374960mr2633679f8f.43.1738939561733;
        Fri, 07 Feb 2025 06:46:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5839877sm3206265f8f.3.2025.02.07.06.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:46:01 -0800 (PST)
Message-ID: <18fd9544-f9ef-4f58-9a8a-026737c26b94@baylibre.com>
Date: Fri, 7 Feb 2025 15:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/34] drm/mediatek: mtk_hdmi: Move CEC device parsing
 in new function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064603_500261_826EF546 
X-CRM114-Status: GOOD (  24.11  )
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



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> Move the CEC device parsing logic to a new function called
> mtk_hdmi_get_cec_dev(), and move the parsing action to the end
> of mtk_hdmi_dt_parse_pdata(), allowing to remove gotos in this
> function, reducing code size and improving readability.

Why CEC device parsing logic isn't done mtk_cec.c driver ? Then add "mtk_cec_get_dev" function to 
mtk_cec.c too. Finally, call this new function in mtk_hdmi_probe after mtk_hdmi_dt_parse_pdata().

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 84 ++++++++++++++---------------
>   1 file changed, 40 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 48c37294dcbb..eb285ec394a3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1367,24 +1367,16 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>   	.edid_read = mtk_hdmi_bridge_edid_read,
>   };
>   
> -static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> -				   struct platform_device *pdev)
> +static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
>   {
> -	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
> -	struct device_node *remote, *i2c_np;
>   	struct platform_device *cec_pdev;
> -	struct regmap *regmap;
> +	struct device_node *cec_np;
>   	int ret;
>   
> -	ret = mtk_hdmi_get_all_clk(hdmi, np);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> -
>   	/* The CEC module handles HDMI hotplug detection */
>   	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");

If it's done in mtk_cec.c, the hardcoded compatible string method will be replaced by of_match_table 
(mtk_cec_of_ids), which is scalable and consistent.

>   	if (!cec_np)
> -		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
> +		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
>   
>   	cec_pdev = of_find_device_by_node(cec_np);
>   	if (!cec_pdev) {
> @@ -1393,65 +1385,69 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   		return -EPROBE_DEFER;
>   	}
>   	of_node_put(cec_np);
> -	hdmi->cec_dev = &cec_pdev->dev;
>   
>   	/*
>   	 * The mediatek,syscon-hdmi property contains a phandle link to the
>   	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>   	 * registers it contains.
>   	 */
> -	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
> -	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
> -					 &hdmi->sys_offset);
> -	if (IS_ERR(regmap))
> -		ret = PTR_ERR(regmap);
> -	if (ret) {
> -		dev_err_probe(dev, ret,
> -			      "Failed to get system configuration registers\n");
> -		goto put_device;
> -	}
> -	hdmi->sys_regmap = regmap;
> +	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
> +	if (IS_ERR(hdmi->sys_regmap))
> +		return PTR_ERR(hdmi->sys_regmap);
> +
> +	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get system configuration registers\n");
> +
> +	hdmi->cec_dev = &cec_pdev->dev;
> +	return 0;
> +}
> +
> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> +				   struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *remote, *i2c_np;
> +	int ret;
> +
> +	ret = mtk_hdmi_get_all_clk(hdmi, np);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
>   
>   	hdmi->regs = device_node_to_regmap(dev->of_node);
> -	if (IS_ERR(hdmi->regs)) {
> -		ret = PTR_ERR(hdmi->regs);
> -		goto put_device;
> -	}
> +	if (IS_ERR(hdmi->regs))
> +		return PTR_ERR(hdmi->regs);
>   
>   	remote = of_graph_get_remote_node(np, 1, 0);
> -	if (!remote) {
> -		ret = -EINVAL;
> -		goto put_device;
> -	}
> +	if (!remote)
> +		return -EINVAL;
>   
>   	if (!of_device_is_compatible(remote, "hdmi-connector")) {
>   		hdmi->next_bridge = of_drm_find_bridge(remote);
>   		if (!hdmi->next_bridge) {
>   			dev_err(dev, "Waiting for external bridge\n");
>   			of_node_put(remote);
> -			ret = -EPROBE_DEFER;
> -			goto put_device;
> +			return -EPROBE_DEFER;
>   		}
>   	}
>   
>   	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>   	of_node_put(remote);
> -	if (!i2c_np) {
> -		ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
> -		goto put_device;
> -	}
> +	if (!i2c_np)
> +		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>   
>   	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>   	of_node_put(i2c_np);
> -	if (!hdmi->ddc_adpt) {
> -		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
> -		goto put_device;
> -	}
> +	if (!hdmi->ddc_adpt)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
> +
> +	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
> -put_device:
> -	put_device(hdmi->cec_dev);
> -	return ret;
>   }
>   
>   /*

-- 
Regards,
Alexandre

