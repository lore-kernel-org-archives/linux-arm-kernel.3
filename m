Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D7E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTvijDpe0+9dsCs3BTNBSBTmfxJ/q0zTpQ4GnoSlcsg=; b=S5veFbPjKVCFNAPvEvz0T8+aaX
	/rUsBs88CQX+pObplrMq1ts8vR0raBrDnQwk9MTOKxWM4HiQySmaJnMmAgQTw5lF+X493OPlxGjZ0
	ryg9CoHnrFCgi1rnhzRDQbDT7QhQtgAU8fV5sja4lhjhqwrwScxRhLK14RYcGFltZaf/zdPeWCRR3
	gxomnWggv5AesdUBLiS9RJsgMGFHNTIQsm5ZBOmkmbiGeCPhDMxOVR8nVlhGyfptvhBh4YOjyPQtr
	Z+gngw4Lbl5+s+nUKwTA6Y/zvZObDFQeiyXYvIzmeLnR6jE1iiCQen7xTWmCkPG5Sg7xHLhvDHYo/
	P1z6v1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFmc-00000004O2n-3gSZ;
	Mon, 13 Jan 2025 08:26:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFlB-00000004Ni1-1c4T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 08:25:23 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5nWlh026600;
	Mon, 13 Jan 2025 09:25:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	lTvijDpe0+9dsCs3BTNBSBTmfxJ/q0zTpQ4GnoSlcsg=; b=RSWIZTmresEmufVo
	A+0rYK5fd83+7wbwXbty79TKSeiiBgWBwvkjjF9/wU3lh3SEIEzlRrRSZYxmQwB0
	j0ggAQYPpQTv2On3hkGyHd3u1tF6K9UFWF1i8iEKAe3g756GWZF1xgPnujUSQylj
	0qov0hj1E6SO7Kz0itHy8qHS9jrmEUvM9vVeaOdPsXkUsP2cDDsQYCuuwJls3m9B
	ZLCVcJMpzvo95WcEpkhpczZXOnxSVZnEDQycy26wHEO92iOQEBZ85Ky+nIxCcONn
	At18/nyzn/n282eAS4XJBVsKdR5LfKU+Wrab0BJwM+27E7QoE+DD9zIZvKVhG7Uq
	UCmkYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444w17ghmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:25:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4339C40053;
	Mon, 13 Jan 2025 09:24:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 840E22303C4;
	Mon, 13 Jan 2025 09:23:46 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:23:46 +0100
Message-ID: <5209f7b9-0e72-492f-bd5d-93726a9e1c41@foss.st.com>
Date: Mon, 13 Jan 2025 09:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] remoteproc: st: Simplify with dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
 <20250111-b4-syscon-phandle-args-remoteproc-v1-3-73ed6fafa1e3@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-3-73ed6fafa1e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_002521_992953_C3A165F8 
X-CRM114-Status: GOOD (  15.44  )
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



On 1/11/25 19:42, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error code handling simpler and handle
> deferred probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/st_remoteproc.c | 44 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 5df99bae7131a832c0c03c9bf8619812d9eb570d..d1f35e8a83ba525613ed4e54d2269b7e9f427e46 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -290,26 +290,23 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  	if (ddata->config->sw_reset) {
>  		ddata->sw_reset = devm_reset_control_get_exclusive(dev,
>  								   "sw_reset");
> -		if (IS_ERR(ddata->sw_reset)) {
> -			dev_err(dev, "Failed to get S/W Reset\n");
> -			return PTR_ERR(ddata->sw_reset);
> -		}
> +		if (IS_ERR(ddata->sw_reset))
> +			return dev_err_probe(dev, PTR_ERR(ddata->sw_reset),
> +					     "Failed to get S/W Reset\n");
>  	}
>  
>  	if (ddata->config->pwr_reset) {
>  		ddata->pwr_reset = devm_reset_control_get_exclusive(dev,
>  								    "pwr_reset");
> -		if (IS_ERR(ddata->pwr_reset)) {
> -			dev_err(dev, "Failed to get Power Reset\n");
> -			return PTR_ERR(ddata->pwr_reset);
> -		}
> +		if (IS_ERR(ddata->pwr_reset))
> +			return dev_err_probe(dev, PTR_ERR(ddata->pwr_reset),
> +					     "Failed to get Power Reset\n");
>  	}
>  
>  	ddata->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ddata->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		return PTR_ERR(ddata->clk);
> -	}
> +	if (IS_ERR(ddata->clk))
> +		return dev_err_probe(dev, PTR_ERR(ddata->clk),
> +				     "Failed to get clock\n");
>  
>  	err = of_property_read_u32(np, "clock-frequency", &ddata->clk_rate);
>  	if (err) {
> @@ -318,10 +315,9 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  	}
>  
>  	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> -	if (IS_ERR(ddata->boot_base)) {
> -		dev_err(dev, "Boot base not found\n");
> -		return PTR_ERR(ddata->boot_base);
> -	}
> +	if (IS_ERR(ddata->boot_base))
> +		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
> +				     "Boot base not found\n");
>  
>  	err = of_property_read_u32_index(np, "st,syscfg", 1,
>  					 &ddata->boot_offset);
> @@ -395,32 +391,32 @@ static int st_rproc_probe(struct platform_device *pdev)
>  		 */
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_rx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 0\n");
>  			goto free_clk;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_RX] = chan;
>  
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_tx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 0\n");
>  			goto free_mbox;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_TX] = chan;
>  
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_rx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 1\n");
>  			goto free_mbox;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_RX] = chan;
>  
>  		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_tx");
>  		if (IS_ERR(chan)) {
> -			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
> -			ret = PTR_ERR(chan);
> +			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
> +					    "failed to request mbox chan 1\n");
>  			goto free_mbox;
>  		}
>  		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_TX] = chan;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

