Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C34ECAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3yqBmrGyKXsf/T8CuHToVBBkVGZWtPe1OjIf2jw5rM=; b=eEdWQWwAoAaZuiaNQal7F5CL5j
	qks49IpohbehXTsoZMEVm1Dm2UwtLgI0ENHEJPuYA8HVEUy+0TJB3s22JD9nugk9YxND9tuGpHsmQ
	IAr/UnpknEZKedwxgrvqfX48sUSKOhOAzYWe6oZ+oz3d0xNUOL1kxYwks0qBqSKKXKjqo9sbfkIXJ
	8FIvTL7PN7MMg9uTZFiSmgouqKc3zaftf6YXU0v8qDmFbkSc96xdCXGyGWInFXJJL2hj4NvZYI7Vc
	or2J+VQ56z2yEhETu2uwoQk2JWtwdzIQH9jY+6DDjYokDfRXt6BMAqcSuZBCEz7DvfiArYxuTw+a+
	swyQD0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BPp-00000002EHC-0TiK;
	Mon, 29 Sep 2025 10:47:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BPl-00000002EG7-35zg;
	Mon, 29 Sep 2025 10:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759142847;
	bh=3KmaPLC7fpBhdiaNP8bZ9DxwULE49IaCJfAvqvOZqCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a18tkNhs8rEVCzUajMFURtTiYu4uii4sccPRHMv5nnFwxi7/UthxKEr1Tdkvv83S0
	 bLDSJCQ+rYDdrISBVqbUnxFUaU/yNfediqXKLYxH1x8EARDOlXjAIrVqM9b+CMk6JX
	 fwAoo07WUL3604SqoyPHJLGaa5wkgTruAvMHXdZoLwBMC7Pbz+kOqj79XdA8LMVgXC
	 iJbsJUaavV8F1TXVS7q1cJ49lTnPZ7ZCETN5+alcs7bj0c1pfAo0C8IscgWxFBb8Vu
	 9K3Td/ZcHVwbqLlSLFg8nmZ41jR4ttUdibT7Z8IAlABo4S+sV6hNZIXT2+aqKU6ElY
	 NGXvTt0KHBMWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4286417E003B;
	Mon, 29 Sep 2025 12:47:27 +0200 (CEST)
Message-ID: <e9992ba9-bf5b-4533-948a-e19778bb6f50@collabora.com>
Date: Mon, 29 Sep 2025 12:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Use devm_alloc for clk_data allocation to
 fix memory leak on probe error
To: Haotian Zhang <vulab@iscas.ac.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250929023621.1968-1-vulab@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250929023621.1968-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_034729_923270_315C5C39 
X-CRM114-Status: GOOD (  17.43  )
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

Il 29/09/25 04:36, Haotian Zhang ha scritto:
> The probe functions for the mt6765 apmixed, top, and infrasys clocks
> use mtk_alloc_clk_data() to allocate memory. This requires manual
> freeing of the memory in all error handling paths and in the driver's
> remove function.
> 
> Switch to mtk_devm_alloc_clk_data() in order to fix the memory leak in the
> probe function.
> 
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

You have to resend this to the correct recipients, and you have to fix the
commit title; something like

clk: mediatek: mt6765: Switch to mtk_devm_alloc_clk_data to fix memleak

For the code:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregnoòcollabora.com>

> ---
>   drivers/clk/mediatek/clk-mt6765.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
> index d53731e7933f..5cfb9a3a5ee3 100644
> --- a/drivers/clk/mediatek/clk-mt6765.c
> +++ b/drivers/clk/mediatek/clk-mt6765.c
> @@ -736,7 +736,7 @@ static int clk_mt6765_apmixed_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> +	clk_data = mtk_devm_alloc_clk_data(CLK_APMIXED_NR_CLK);
>   	if (!clk_data)
>   		return -ENOMEM;
>   
> @@ -770,7 +770,7 @@ static int clk_mt6765_top_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +	clk_data = mtk_devm_alloc_clk_data(CLK_TOP_NR_CLK);
>   	if (!clk_data)
>   		return -ENOMEM;
>   
> @@ -810,7 +810,7 @@ static int clk_mt6765_ifr_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	clk_data = mtk_alloc_clk_data(CLK_IFR_NR_CLK);
> +	clk_data = mtk_devm_alloc_clk_data(CLK_IFR_NR_CLK);
>   	if (!clk_data)
>   		return -ENOMEM;
>   



