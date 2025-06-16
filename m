Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED95C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gtV1rZVMGwEdKZN2cNY4PElvgVuiPb0Q4ZvaOK51qQ=; b=AFSoT6rR21g24wf5CyMeMk95DA
	cb+QS/tleixuawsZ2A0idqRnUc2ZBw4rB5M//XujuRB231rsUy7N1S3qpZU1YJak/24WoGFs+FR3i
	BXZ7HzzZoVwgIF4bcpmYn2pviBamA7jN+a3ZZpLhsX6h8lbcJjUphdw7KWNBZvRff+LQ0PWj4moJS
	PQzFvAXcgln4ci5p9KMewDgeUPDQojfRL3ULAhcBmSOPTSEB17JZ6zRUZaGA/V9WcMKsr++yO15D2
	obLsr7g1hiF2yU/noU6tWWWl7AGtP4rMKYIXCXq8rIdH5fLX3itP/zD7tXyr6FtxPQOZT2FXEEY6a
	8xZo0sEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3uL-00000003abB-3jpy;
	Mon, 16 Jun 2025 07:05:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3mk-00000003ZXF-1Hps
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:57:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso613676966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750057056; x=1750661856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gtV1rZVMGwEdKZN2cNY4PElvgVuiPb0Q4ZvaOK51qQ=;
        b=Qi0DMvUlZfnsZerh3iVE1WMPgQfRceWWUnFspgINZM+K/T9AyaIDhw/mrmsPP3VMao
         gh50Cs1NeGwvcH/h31vzyJ+KZ8NgGSR7H+iPS45LPnStSXrJgPXMaS0uKQkHmr8372Vt
         biaE/L9TRWSO4/seJ7qSXb6zz5M48yepQ0Z2ZYbGkTW4Kjwtm8QDQcTaPrJzOdUDm5NR
         VznkRi66kgOBcVPm3Pz4tZ7e7S2LB02S9eyvV8kz72bHqzvo+yZzvZzM5Y0zgLk1kc7f
         Q6XzEZH15NNrClaAribiIbSPhoud2IiXjRnONUrRZmWsKVhgKu93i9J8TZtU2qo/vKR1
         lTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057056; x=1750661856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gtV1rZVMGwEdKZN2cNY4PElvgVuiPb0Q4ZvaOK51qQ=;
        b=o56cqyywDyLv+ixTfXwn2HiOjtJOyvSO0BloOVrEZTxTFARteYWZfkTHwwBzP8yOjS
         BEGjcSW6jzhIyhNrPEB5r8ajwTWfxcfHg9pLd3tw0XfFGo9oHTIFlzln4rAO8Fiv+Hjg
         sA5GbKEEByWid4sbekMSsmfzwGDVBEtHctpQOwowckcsa4KalUOr9NOkB+sYdn5OH7pW
         YZdf2R0RWGFBDe+NLSYx/Mkg2R0BSbepvA0UVXhidoLTpAIzpQHQpPquOtqer6AZprkR
         JXZzI5I7fQh6iOkCxXA55XlhGat7OLrSHZBRS9o2rChfTxTJzaxYhDfJozK3qbGv2SCs
         xBGg==
X-Forwarded-Encrypted: i=1; AJvYcCUiaZ/14qE/XHUdEwzdSuwmySu3qyXIH/QLVWN0eJH0tdg4zfe7CNyiXte3cPBsP1Dqwivd/gpv8uxww9kNFnCY@lists.infradead.org
X-Gm-Message-State: AOJu0YwweD33PrHs0wNYx6/06DdjubISveE5VrXKBr7pkj3WevPS9BIq
	/wxDaiXlpnAD2vvALf85rz7ifsDLrM1tPZbK14F6Y3JmYLdV+phHpzrb7faIZcM3pAU=
X-Gm-Gg: ASbGnct+g0oe+UaK2REx/1wySOXccGx1znwAIxSDEXeEzMyi1NuftdqykfEVnZo6N9H
	TcSp45iDj7ddW5Eh8TnOAL9huu56pGc85mxE7dZqOObBTm/KfJcwb2dn/okC832l6l+yM0pa01T
	MNSi6Nw0yWY3U0o8Y9OhVBrKsJpRtT5/Cq8kEfMbOVTfVOoNHoChSDaqEXgRe71t7hUjIf2X3K7
	i7mBxOOcWkvdVeQfzLHbSjCnOk5oe6OiDAmmvqbg0Cki1ZD3QjsKJcxbSwuFwS35bus1bhiJXZm
	An/oGPPwqTt7VkW4lBeQZh5CSDuvc8tZyx0B7ZqpM2hd5Q6Vtg1GLl4RTf/zjU4zKqFrWw==
X-Google-Smtp-Source: AGHT+IHOPqpWs/bEljRavIVMEjqIgNiUcWesMvNiRC3Z2rgdIApjZ4oCO/f0xQlOdJfvEukvSCkvSw==
X-Received: by 2002:a17:907:c25:b0:ade:470b:d5ac with SMTP id a640c23a62f3a-adfad4f6209mr738394066b.56.1750057056147;
        Sun, 15 Jun 2025 23:57:36 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c5bedsm602221266b.66.2025.06.15.23.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 23:57:35 -0700 (PDT)
Message-ID: <dd2bf2eb-d0a0-4bc4-b4be-a60a671222f9@linaro.org>
Date: Mon, 16 Jun 2025 09:57:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: Add NULL check in lpc18xx_dmamux_reserve()
To: Charles Han <hanchunchao@inspur.com>, vkoul@kernel.org, vz@mleia.com,
 manabian@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616060212.1560-1-hanchunchao@inspur.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250616060212.1560-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_235738_356732_4C273D48 
X-CRM114-Status: GOOD (  20.14  )
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



On 6/16/25 09:02, Charles Han wrote:
> The function of_find_device_by_node() may return NULL if the device
> node is not found or CONFIG_OF not defined.
> Add  check whether the return value is NULL and set the error code
> to be returned as -ENODEV.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/dma/lpc18xx-dmamux.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index 2b6436f4b193..ef9aed4ba173 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -53,11 +53,16 @@ static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
>  static void *lpc18xx_dmamux_reserve(struct of_phandle_args *dma_spec,
>  				    struct of_dma *ofdma)
>  {
> -	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> -	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
>  	unsigned long flags;
>  	unsigned mux;
>  
> +	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> +
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);

I believe you should still declare all the variables at the beginning of
the function, even if you initialize them later.

> +
>  	if (dma_spec->args_count != 3) {
>  		dev_err(&pdev->dev, "invalid number of dma mux args\n");
>  		return ERR_PTR(-EINVAL);


