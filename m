Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0F1C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apPuGix0U1l8NbuF2RfEV7srsEyy+YpkXLnEoKgNuME=; b=iAE6r4b02LF6EFuwGq+GMKMEme
	Ggc4cKWYB4TECIqZjH4f+Vik1Hime2NExGEOe++5BfjwaNj5ihI/uFqQXF7Mu0dP3y2k+Ac55BUBr
	qo2Lzn+1EYFrPhmbn0sqA/PoEezR7kYn2cXqM1ypLoNP/09OylDV2PcdV5uyXOR22rbKzoKUQzaaI
	xMakeGrWbN8eP9qm3nBzqEBbse3UcwiRoaDC5R6Z467MrjDhsMr/5stQqC9CBRVWiNEKRGeQSTysR
	xMa1bXvQ8gx7+TZxo0A7kQHg8AQrkH2vrFXFSVnXW/DCf359jeDKFxu5E5LhbkKKxgqXhxU+VPj1g
	QASoHqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4B-0000000F0qq-0Eiy;
	Wed, 14 May 2025 12:18:31 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Tq-0000000Eg16-3qvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:32:52 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7vt3p023085;
	Wed, 14 May 2025 11:32:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	apPuGix0U1l8NbuF2RfEV7srsEyy+YpkXLnEoKgNuME=; b=REUcSlsDCyI8Hyf1
	Dx5Y5boK9tw1Of6eJxcNtODLpy/xFNDPh/YLxIBUnW7KGAKOruHD7IUgQSjI4S7i
	CBVc0zCDej1aWz31I9mo/NeQ3/eVjsNJnJ1iIdKHCnSfvbxIOxrPrvIzfrYt/P2e
	nrrwse+lwg2bwLxhLn4qU7Z0sWttRjd/lJ671EWcDAWey286hEKr27RTU384YVMo
	UIt+RNh+MkahVlKYt0jc4HsIZo+pHIJ/JalIXzCu1wfGqvKSgPFFsaGTFY6qpuyU
	Fd3/Ro2LO3nrED4ScbRf0eonPqPp5JZH4xxm0YkeMbEH5nS9yulK0pv3kI7MDrJs
	WrLA3w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdxtwvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 11:32:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A901540054;
	Wed, 14 May 2025 11:31:44 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC64DB4C73F;
	Wed, 14 May 2025 11:30:15 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 11:30:15 +0200
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 11:30:14 +0200
Message-ID: <5268ec60-ae2e-425e-a4af-a55cb0c3a1f9@foss.st.com>
Date: Wed, 14 May 2025 11:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] counter: stm32-timer-cnt: add support for
 stm32mp25
To: <jic23@kernel.org>, <wbg@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <lee@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <ukleinek@kernel.org>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023251_472944_D3E9A58B 
X-CRM114-Status: GOOD (  18.72  )
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

On 1/10/25 10:19, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. There are new counter modes that may be
> implemented in later. Still, use newly introduced compatible to handle
> this new HW variant and avoid being blocked with existing compatible
> in SoC dtsi file. Modes supported currently still remains compatible.
> New timer 20 has encoder capability, add it to the list.
> 
> Acked-by: William Breathitt Gray <wbg@kernel.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Hi,

The first patches of this series have been merged.

I'm not sure who shall pick this one ? (I think there's no dependency).
Or do I need to resend it separately ?

Please advise,
BR,
Fabrice

> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index e75b69476a00..3d3384cbea87 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -669,12 +669,14 @@ static void stm32_timer_cnt_detect_channels(struct device *dev,
>  	dev_dbg(dev, "has %d cc channels\n", priv->nchannels);
>  }
>  
> -/* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 */
> -#define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7))
> +/* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 TIM20 */
> +#define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7) | \
> +					 BIT(19))
>  
>  static const char * const stm32_timer_trigger_compat[] = {
>  	"st,stm32-timer-trigger",
>  	"st,stm32h7-timer-trigger",
> +	"st,stm32mp25-timer-trigger",
>  };
>  
>  static int stm32_timer_cnt_probe_encoder(struct device *dev,
> @@ -846,6 +848,7 @@ static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
>  
>  static const struct of_device_id stm32_timer_cnt_of_match[] = {
>  	{ .compatible = "st,stm32-timer-counter", },
> +	{ .compatible = "st,stm32mp25-timer-counter", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_timer_cnt_of_match);

