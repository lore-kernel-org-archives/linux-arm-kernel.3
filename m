Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F8CD58CB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=; b=3Guh9Zyoe6hrw7mRK30eNvKfO1
	jQSTKotCq47mDyidqNlf6Ac2RFEyftUgoypGuREe3OY3czT6oyYClcM6fs/BGldrQ4uBK9dPTZbiK
	SmO0Q8hDGyW+iY3d67OZvAE1hlJqOhbs0RP5NF9fzM+s00eu8zPiWBZ/dO44V/5UeDTctajESDAPR
	V52eXMc3ntg5TDFJxD2a7r90AfH0Gkbcdn3ec2p6EOh3vZasL9bfCG5oREyrsKaeA6fdfbryGa2DE
	C6wmUXruVUzP11vauIUv/YcAh7pzJEX811XrR2Cp3NoZoGQzj1NqZflhNUF5Q1u7air9xADDucnjK
	lx/5Dn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Yok-0000000G84U-3ySF;
	Mon, 23 Mar 2026 06:31:15 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Yoh-0000000G848-3tz1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 06:31:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8296dabef74so3201579b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774247470; x=1774852270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
        b=Fz6pcCM5woJqsruSSqIG6ow8ogYyeMjdhEJsz3gf1i6fDe9QlSmw88T1yAYwMWyTWP
         L5QqGX40XGiAC52yQpcRpQ9mCm/7pJB4nObuCHi4pWK3EalBloET8r21NoRdNzQk5Ebq
         qWWVfBQbjmfCBJyxLw8GSaziRrzBsxiF31EFihnh1LJRkYBVfvAVSKZY3TZNdZOcNmIm
         V7zMHebCQ2X8FaLZ76VwRlRbTCs0VvClXXRNZ0QQoHKzqhTuPYLcX9LBYDq0zURwihHk
         OvHnM9oTe7olNXgo70rI/lZABovQy/7+3q7ILOszbZktHdrVYhBPqul/V4TMUck8m1PZ
         V+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247470; x=1774852270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
        b=Xcl05F98WRZHh7fZD/rve7rszLY6FwCirc+VlWh0NvB+YjehIx37OEbIINPbuvxic2
         Fv2PdIpdfqMkguGXRKOPSRTnxs3kYQwVmlRuAxugbywHuNmnUAt/P2c3BG0Oh8mqpJhx
         FeQdNAedV05Opo0V/8a0vF7qxH8ZKW4QroUE7kLBiv42TJHs+AcdnpolsFLhW7CjNnbm
         iGoBZ2xtAmXyQwdtvzQV6tADsCKx0j9LUq/eFr6/2ZHZlAfjlwPegeNXSCDji5XTSiBL
         Do8iUCXLE/RGAsr5pM42t8eGQxcGK0iI3jO2ISPB6LXbpDsac8h4GaQkuXzd1kyiruiF
         rh2w==
X-Forwarded-Encrypted: i=1; AJvYcCUWpHsa3TTLzqfFYWlYGoCfnBjrzuEDH8J0m8AmE8KbzKhpIC92aaM3bRJWphwBRYGbAAfVja/55LWcXs7pUvoD@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmxG9y510WBIbrKzBg9kOR2AG8possGurFu7lDwwgh3y8aYfG
	bm17PX24AeeV+Sa/MU7JKiNvQoEfkwpzAzoV6E2dhmkOvcZbDGb7131m
X-Gm-Gg: ATEYQzxpGMBFpexhfV12HZ6vWsRLPssoYFi83HmZVsXwrn5p0qj9ImephfCRStRNg/r
	XIzNcj4ethyZuTjzgKUSpsxj6wvTtffjdhqLGMwA71/Z2ga2P4/jw6sgDmZY4xgRnvxd79QqZ4c
	czUfeV89ZGn+QnpmrDT+MymCnYr7TwUZmgWlCeRJVbRbkko7633uqakf2ptuHHcumlpUG4rz46q
	t7ikGzidegez0YFqVmlUp9Gy/4JRa7sZ9EoO7/1seilg9azZtKsqMPoi7IiTNe3TdIjZxwajgp6
	6QQ1ll/2hsxS27eDKPypY+FXiOSAuw+xAt65Nq32X7VbRu3oL9ZRNiG7im9BBDdYLcGkl1bvjda
	MTXz6PEVrQd8A/w7ekShI2KaaoQ9QIOb+rJfQTUcaNC2TKozu+KEMlmYzLqVAqffERN86bceacd
	NkHR7CkX9B3OXFoSN6YRISoBqsk/Oq+4OPyNhA5pwz4B5PvHVPk/3T4ptnrPcJ/gtr8cFa6+Srx
	lA6
X-Received: by 2002:a05:6a20:7f82:b0:398:919a:ddf5 with SMTP id adf61e73a8af0-39bce9e9efemr10260089637.24.1774247470439;
        Sun, 22 Mar 2026 23:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a938743sm6476741a12.19.2026.03.22.23.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:31:09 -0700 (PDT)
Message-ID: <e381ce59-c13d-4cb4-b0d3-70f15a500999@gmail.com>
Date: Mon, 23 Mar 2026 14:31:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v14,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Simon Horman <horms@kernel.org>
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, conor+dt@kernel.org, schung@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, davem@davemloft.net, robh@kernel.org,
 yclu4@nuvoton.com, andrew@lunn.ch, mcoquelin.stm32@gmail.com,
 ychuang3@nuvoton.com, openbmc@lists.ozlabs.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com
References: <20260316055427.1310569-4-a0987203069@gmail.com>
 <20260318082346.1825390-1-horms@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260318082346.1825390-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_233112_001962_252EFA75 
X-CRM114-Status: GOOD (  18.84  )
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


On 3/18/2026 4:23 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
> driver.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> @@ -0,0 +1,136 @@
> [ ... ]
>
>> +static int nvt_gmac_probe(struct platform_device *pdev)
>> +{
>> +	struct plat_stmmacenet_data *plat_dat;
>> +	struct stmmac_resources stmmac_res;
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *priv;
>> +	int ret;
>> +
>> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
>> +
>> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat))
>> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
>> +
>> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
>> +							    1, &priv->macid);
>> +	if (IS_ERR(priv->regmap))
>> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>> +
>> +	if (priv->macid > 1)
>> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>>                                                                                    ^^^^
> Does this code return the error on failure? The dev_err_probe() result is
> assigned to ret but the function continues execution without returning.
>
> Russell King's v12 review suggested using set_phy_intf_sel callback,
> which led to significant refactoring in v12. This refactoring appears to
> have inadvertently broken the error handling here and below.
>
> The code should be:
> 	if (IS_ERR(priv->regmap))
> 		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>
> 	if (priv->macid > 1)
> 		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>
> See Russell's v12 review:
> https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

Sorry for missing that, I'll fix it so that function properly returns 
failure.

Joey

>
>> +
>> +	plat_dat->bsp_priv = priv;
>> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
>> +
>> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>> +}
> [ ... ]

