Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12F7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 06:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS8PvSfwRlhjZGN6jsgBRmNG5LhO25xsjz5q3ncqIDU=; b=ecsuROpezeXH0t+X9oTS8dfWhy
	JcR0l39qWJ40fK5qfdEnV/nf6NY9VZDYD2pYa+wAjLzqxF8bbMGw1Xc2o9wvOyAIdWKL7htCTyEz0
	7Mfzos/KDyPJjU5dVa2legAAjjz3U5aMT7V3PWcRGCGdA9DcWvslHkbbcXovovn/xTr9wKylPDe8i
	q4ja47CJ8dxeYbmHaHAi/MexzYPpYsY010G/SLaClCRL1K+hrBaOknFb7vSghbcIdueXO+llp5AIX
	C1sZfJ0yYEfHHfLZlh9PX1Z77+ktaTyU6DUGujxhFzX7hWUo27Z4RuhcASNanpied/5xzWqUS4Kvr
	W99A22Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRaf-00000008EJq-0H2b;
	Mon, 26 May 2025 06:45:41 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRYW-00000008Dun-1i67
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 06:43:30 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q6SNec021065;
	Mon, 26 May 2025 08:43:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OS8PvSfwRlhjZGN6jsgBRmNG5LhO25xsjz5q3ncqIDU=; b=NkJRz0lf3bhigiZE
	eaVdiOwH0if/ejdiiR5pcQ7fSr7JwOushQIUk00jA3tcubbaQGZDwj8Tq4epNT1d
	3YrhJ2BQLBBNSymYHLhaZB/T/sg7D8KoY0lhcwWDujtb8W/+74wyotC7eflbuqkD
	3cVO1Ra83+u//xwjbLRAZGCxjeBsH2sA2zZGt60FOO2qyvCa91I2oqWrU+E82Z/D
	T8dxWsF4qJC7AgZLSXxV/wbuOkIBNzdjYD+mXbJY3ODl+YBrwPlqOBs6Xr1LJDxD
	N022icQCA/bO9rgSkVE/6OD25sP3b9zESQt41nfytHGvKaJ+fvVide+buAXh2GWs
	x8GhFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4bbub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 08:43:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C73B440044;
	Mon, 26 May 2025 08:42:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1FEEB1D8AA;
	Mon, 26 May 2025 08:41:55 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 08:41:55 +0200
Message-ID: <8f948025-a40e-417c-bbc1-a43356118ce4@foss.st.com>
Date: Mon, 26 May 2025 08:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: stm32_omm: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_234329_050264_F033DC91 
X-CRM114-Status: GOOD (  16.17  )
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



On 5/25/25 21:13, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on hardware.
> ---
>  drivers/memory/stm32_omm.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> index 79ceb1635698..bee2ecc8c2b9 100644
> --- a/drivers/memory/stm32_omm.c
> +++ b/drivers/memory/stm32_omm.c
> @@ -46,7 +46,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
>  	struct regmap *syscfg_regmap;
>  	struct device_node *node;
>  	struct resource res, res1;
> -	u32 amcr_base, amcr_mask;
> +	unsigned int syscon_args[2];
>  	int ret, idx;
>  	unsigned int i, amcr, read_amcr;
>  
> @@ -98,29 +98,20 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
>  		of_node_put(node);
>  	}
>  
> -	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
> +	syscfg_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg-amcr",
> +							     2, syscon_args);
>  	if (IS_ERR(syscfg_regmap))
>  		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
>  				     "Failed to get st,syscfg-amcr property\n");
>  
> -	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
> -					 &amcr_base);
> -	if (ret)
> -		return ret;
> -
> -	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
> -					 &amcr_mask);
> -	if (ret)
> -		return ret;
> -
>  	amcr = mm_ospi2_size / SZ_64M;
>  
>  	if (set)
> -		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
> +		regmap_update_bits(syscfg_regmap, syscon_args[0], syscon_args[1], amcr);
>  
>  	/* read AMCR and check coherency with memory-map areas defined in DT */
> -	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
> -	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
> +	regmap_read(syscfg_regmap, syscon_args[0], &read_amcr);
> +	read_amcr = read_amcr >> (ffs(syscon_args[1]) - 1);
>  
>  	if (amcr != read_amcr) {
>  		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

