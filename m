Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B14C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbV9M4aDHf72M9H3YVkYBz+teJq6aW3dMMcIgDjIjB0=; b=QFl25XqF9ncoaSxBi8Tcg7n5Tn
	f2CGACZynbBVfM6ZOycP7Ahrs9l1JikcbivmE7MeNZG5fOCqx6eW3Rnik9mxNl9bYDfT2Mu/SOjd1
	YiBws76NXpumVEcgu0uO68VF/OYd0PQXqVGhb2JTnpb8RQ7um4eJXoFbPOTlqoLVFSsl1GLgPpiRL
	2xtIfLdm4RsgdcxNFoUGiJDvafy01+f6QqQDPlY1btCA8wMwhJys6T53xf9i5BrnAxNue6UFxLY9E
	5jgbEgk3/u4hNGZZuoDsvy0PWrKtfO3gIl8hJFWVn8ajmJ3yMHLdy15KmjPDFlNbvd/WukUVrtEuG
	Std0T92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8pq-00000004MBR-0jI2;
	Mon, 16 Jun 2025 12:21:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7wn-00000004Blt-3pzq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:24:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad574992fcaso679582966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750073056; x=1750677856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbV9M4aDHf72M9H3YVkYBz+teJq6aW3dMMcIgDjIjB0=;
        b=S9MEhYypaT49rcpgMx4NypMypF323FDvH9FFt7b9FSXXoh0nK8E+/iC+MFlhZN2fLA
         XiwRSGl8RIELvEEe9oGJoaQSqFXGJ9mT6KgnKHB/tV0rAAvKzr6t1IWQTNPTVNShcCls
         Cv12TRmGd47G0Z7VyiXnyWP8Ck02ut2e3tT6vZPe9bId7SXXWuGHw12vHYXVKB/b1s4J
         1LUNvOqmoPaRqPnPVKOe8XHMpL+UP5gQXYMBC5aDLigdgIxQq+8jvhDSw5f/HZbgNz6H
         7czpKgxl81s2I0CSIFiofXipZ7hZVTJvMqy6jRi7XeVFa6/hTWau/KkzGZk++acXpEGn
         hskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073056; x=1750677856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbV9M4aDHf72M9H3YVkYBz+teJq6aW3dMMcIgDjIjB0=;
        b=XMVhqEUN4ZsaJTEPgzSv3ijce8StdKi0PKudL0KL6ERep40ArMvdUZFhiTgIeEwbVr
         6iJj73wBBifEczm9Fp+2PEaCTNne0OOwMq0JjjeOewa/jInsaehML1r5ef2oKLhMuS7J
         tCn2mhltqKsZ2WElw1YbGqYtixwmNMwRAin8qhr9MsttAPeNBHU3FiE0uETSEoal2ey4
         cs4wEOsFE8pmpvMVQjr8/iSo1s9dVZnDNffLUbl7auSNSwDkAhKRUldgKTywDFeBwovl
         HFxPlm2GqLzzBMSVEJThMHg7r5B5GXGd0sVjoW/muMsx1PTvxOi3S6dD4qW3IuDCChNU
         +2oA==
X-Forwarded-Encrypted: i=1; AJvYcCVCp1mjKR1BQNT8U5+X1X1o5pe61XIJBjmhPFSTVgxW3SfUufZBH+Ay/sMjE8UA0YtUKwi/NJQotsIwqihg0VDS@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3yRzM4Kjf/UCINCEvd40CSKgolrQQi5LudwhEbG3on2qAV0J
	w9dtFhRJHCVoEqa+5/M6iWJgd4zWwyal7eDbtaZK937NvxP8PmfZSeygCCMgkzRfrGua5TrzDHc
	v/RQW
X-Gm-Gg: ASbGncuzKM/PcDaAYnPHgINWMRmYmVZMHRoEXVXawFjy4BvNHA2WMKFGmScDJZQ4/qw
	MnIhRKz9edbtC1i5Vx49aawd9ZWUyptFbsVzGTsM//WHstBvkW9IE2+S7PawBpf36YueV0SJWTE
	dJyaOor/rYEM26a0hLAZLnnpduNJM9sLhEuS+wB9ZGQb8mxKQb9fOyq+J6vBiACwIZ5jkcmgbBE
	J4u5jqRl70MMcBtGoTSL6tPzZ1P3MuchwsSgmpbnEybtIPdt4RSgRa/iC7CgxrgPSgK/9H7q+7T
	R8xOy9KRWHL8H7VB1rilOA9P1pox24KzfIfbaqhQX7iBqvESCJwIlvsq1urmbODZKD62BQRTvrQ
	l7uB3
X-Google-Smtp-Source: AGHT+IHPuq9aBuI6TRaihWL5uiY5RCyARuy/T3/fbEewo0xAONkAM9tB5ptUeAG85+/kjuw1/rSxAA==
X-Received: by 2002:a17:907:2d9f:b0:add:ed0d:a581 with SMTP id a640c23a62f3a-adfad31a905mr894228766b.17.1750073056200;
        Mon, 16 Jun 2025 04:24:16 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8929307sm638202566b.113.2025.06.16.04.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:24:15 -0700 (PDT)
Message-ID: <fb1dcbcf-0467-4a68-9d17-2a75dfcdc1d1@linaro.org>
Date: Mon, 16 Jun 2025 14:24:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dmaengine: Add NULL check in lpc18xx_dmamux_reserve()
To: Charles Han <hanchunchao@inspur.com>, vkoul@kernel.org, vz@mleia.com,
 manabian@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616104420.1720-1-hanchunchao@inspur.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250616104420.1720-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042417_963756_3E497EFA 
X-CRM114-Status: GOOD (  22.54  )
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



On 6/16/25 13:44, Charles Han wrote:
> The function of_find_device_by_node() may return NULL if the device
> node is not found or CONFIG_OF not defined.
> Add  check whether the return value is NULL and set the error code
> to be returned as -ENODEV.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Can you have the subject include the driver which you are modifying ? if
you say `dmaengine: Add...` it looks like you are modifying the core.
> ---
>  drivers/dma/lpc18xx-dmamux.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index 2b6436f4b193..f61183a1d0ba 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -53,11 +53,17 @@ static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
>  static void *lpc18xx_dmamux_reserve(struct of_phandle_args *dma_spec,
>  				    struct of_dma *ofdma)
>  {
> -	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> -	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
> +	struct platform_device *pdev;
> +	struct lpc18xx_dmamux_data *dmamux;
>  	unsigned long flags;
>  	unsigned mux;
>  
> +	pdev = of_find_device_by_node(ofdma->of_node);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	dmamux = platform_get_drvdata(pdev);
> +
>  	if (dma_spec->args_count != 3) {
>  		dev_err(&pdev->dev, "invalid number of dma mux args\n");
>  		return ERR_PTR(-EINVAL);


As I see it, the function lpc18xx_dmamux_reserve is only used as passed
to of_dma_router_register . In every driver, functions that have a
similar role are written in the same way, not checking if
of_find_device_by_node fails.
Can you detail what happens in your case that of_find_device_by_node
would fail ?
Would it be required to have this check in all the other drivers ?

Eugen

