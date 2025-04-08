Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB871C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RQmySbuo/UCyRNQmzbHNRcOJc6ylALW0myadTLuAJI=; b=fJxDcx+NA2a4LeVzU4Eh25gZ04
	1xNqIi3RLm3VjiE6tMqvk9n8ekcr/jcIq9xrspxTM/YhYV3+MtPcin639SUlA8bGP1E0A+AeVxanN
	rDU6/DuSdZAypViONpdUlG/Okyw4kIMYvZ0PZ6K+ISoB+rcCyWH7iKkYLja5Q01EgOQjSSFPP7dwi
	rAgIOzQoUi5BRmQP0Cy38ONWdUNS6uRxADWl/vfvA28P+Nb5c4gAn3sVXKhrZGjYPIuljcrumCaKp
	EaixKc60IGfagtdqt9jp6Gacv/oHcG4C/e9MrjqTXls0+fkTz92yMO+vvuUuGAv1RCEO8ZQTAW3vG
	XRWkqAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ALN-00000004TLB-2KIS;
	Tue, 08 Apr 2025 14:54:29 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AIX-00000004SnC-17Zz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:51:35 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AxRGf008721;
	Tue, 8 Apr 2025 16:51:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3RQmySbuo/UCyRNQmzbHNRcOJc6ylALW0myadTLuAJI=; b=oO1x1MwF4IqH7lel
	i7TxuO7cgSSQ2R1sZZWjEkr09m7XArQeSZ3GF5TRsACoc0jhtT9lnauTQRF0qSrR
	zxvQ8MUe+KMXhpetm4bw+9cJ4hjautcsdL6MWFc8L1M5etZUhZW9hOgV40hA9/xC
	7HewaMMiBZpYYE5CQ9BTbg+O5+/CnTc0UJLfg9nBeoZ/0PwUoXzFAWktktQPQsk1
	5nA/ovi6Rkd9Ualzuk0+s7EzZqeSxJt+J3QOaXxd+9iCs6YnsX+6VBFklsP5R/9F
	nXUtFZ9J4lHj1mQq3BUxFgmHk28f7sOIH2nnaY1ib7CywwEy91aCU3POrtXM0DSy
	3fm8cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw2gwmpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 16:51:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A351040045;
	Tue,  8 Apr 2025 16:50:02 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 196509245C5;
	Tue,  8 Apr 2025 16:48:52 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 16:48:51 +0200
Received: from [10.252.0.136] (10.252.0.136) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 16:48:50 +0200
Message-ID: <d66bd978-820a-4700-92c2-ba52d7db4efb@foss.st.com>
Date: Tue, 8 Apr 2025 16:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] clocksource: stm32-lptimer: add support for
 stm32mp25
To: <lee@kernel.org>, <alexandre.torgue@foss.st.com>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <krzk+dt@kernel.org>, <jic23@kernel.org>, <conor+dt@kernel.org>,
        <ukleinek@kernel.org>, <robh@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-5-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250314171451.3497789-5-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.0.136]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_075133_810538_73FD1478 
X-CRM114-Status: GOOD (  29.18  )
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

On 3/14/25 18:14, Fabrice Gasnier wrote:
> On stm32mp25, DIER (former IER) must only be modified when the lptimer
> is enabled. On earlier SoCs, it must be only be modified when it is
> disabled. There's also a new DIEROK flag, to ensure register access
> has completed.
> Add a new "set_evt" routine to be used on stm32mp25, called depending
> on the version register, read by the MFD core (LPTIM_VERR).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V4:
> - Daniel suggests to encapsulate IER write into a separate function
>   that manages the enabling/disabling of the LP timer. In addition,
>   DIEROK and ARROK flags checks have been added. So adopt a new routine
>   to set the event into ARR register and enable the interrupt.

Hi all, Daniel,

Does anybody else have additional remarks on this driver ?

I think Lee is waiting for review, before merging the MFD part (at least).

Best Regards,
Thanks,
Fabrice

> Changes in V2:
> - rely on fallback compatible as no specific .data is associated to the
>   driver. Use version data from MFD core.
> - Added interrupt enable register access update in (missed in V1)
> ---
>  drivers/clocksource/timer-stm32-lp.c | 51 +++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index 928da2f6de69..e58932300fb4 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -27,6 +27,7 @@ struct stm32_lp_private {
>  	u32 psc;
>  	struct device *dev;
>  	struct clk *clk;
> +	u32 version;
>  };
>  
>  static struct stm32_lp_private*
> @@ -47,12 +48,37 @@ static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
>  	return 0;
>  }
>  
> -static int stm32_clkevent_lp_set_timer(unsigned long evt,
> -				       struct clock_event_device *clkevt,
> -				       int is_periodic)
> +static int stm32mp25_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
>  {
> -	struct stm32_lp_private *priv = to_priv(clkevt);
> +	int ret;
> +	u32 val;
> +
> +	/* Enable LPTIMER to be able to write into IER and ARR registers */
> +	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
> +	/* set next event counter */
> +	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
> +	/* enable ARR interrupt */
> +	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
> +
> +	/* Poll DIEROK and ARROK to ensure register access has completed */
> +	ret = regmap_read_poll_timeout_atomic(priv->reg, STM32_LPTIM_ISR, val,
> +					      (val & STM32_LPTIM_DIEROK_ARROK) ==
> +					      STM32_LPTIM_DIEROK_ARROK,
> +					      10, 500);
> +	if (ret) {
> +		dev_err(priv->dev, "access to LPTIM timed out\n");
> +		/* Disable LPTIMER */
> +		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +		return ret;
> +	}
> +	/* Clear DIEROK and ARROK flags */
> +	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_DIEROKCF_ARROKCF);
> +
> +	return 0;
> +}
>  
> +static void stm32_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
> +{
>  	/* disable LPTIMER to be able to write into IER register*/
>  	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>  	/* enable ARR interrupt */
> @@ -61,6 +87,22 @@ static int stm32_clkevent_lp_set_timer(unsigned long evt,
>  	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
>  	/* set next event counter */
>  	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
> +}
> +
> +static int stm32_clkevent_lp_set_timer(unsigned long evt,
> +				       struct clock_event_device *clkevt,
> +				       int is_periodic)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +	int ret;
> +
> +	if (priv->version == STM32_LPTIM_VERR_23) {
> +		ret = stm32mp25_clkevent_lp_set_evt(priv, evt);
> +		if (ret)
> +			return ret;
> +	} else {
> +		stm32_clkevent_lp_set_evt(priv, evt);
> +	}
>  
>  	/* start counter */
>  	if (is_periodic)
> @@ -176,6 +218,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	priv->reg = ddata->regmap;
> +	priv->version = ddata->version;
>  	priv->clk = ddata->clk;
>  	ret = clk_prepare_enable(priv->clk);
>  	if (ret)

