Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AA2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbzdNbMuPcQgyg/32v679V2kcITSnqgFdSJKF+onCu4=; b=Z/5qID9xbKRvILsOftqgCbizYb
	5vw+a+9gHzDfckDZCsgfcfp0DfyYyOqKxd1krf1omyhu3MAknn+98D/GhJjSPS4PtBpYus0Xew8CY
	vLYHbYsj05aZHLhO5saRb0iBtWbVZh08FylUKOqsvxOKKpnPkUEUx5gBn8wcsToAk8J4MY5W7+hsW
	0MlPOAu2biNlvyHm3dUlOw8pBf5shYfZ4sw++l3TClmHnh2/ldfMERR9Hg87cSomo/nUBabGZK6Ti
	eRnifetJa0yf2niLc1Sp6fOxmMcuMX4okhuSykJTPJUAJ7KUDQgwPHj3vYEDhwJQhTbIZju3v/g4M
	e+kd1D5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6Y-0000000EfBv-3gPQ;
	Thu, 24 Apr 2025 16:07:15 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7y8D-0000000ERvc-2KDJ;
	Thu, 24 Apr 2025 15:04:55 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBPMk1019163;
	Thu, 24 Apr 2025 17:04:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EbzdNbMuPcQgyg/32v679V2kcITSnqgFdSJKF+onCu4=; b=bGNZrkbgM7hP0A4d
	0huWCtfENxlTtZ2hD9QWgmb98DIFXK5fBmBupMzY6axYs0FrA/0LWmfz0WhsStka
	AUXFj0pYsKuCM2wNw3Noz8aYCKXGStw8mUCIHn1PU8SS3MuLYegugGWwOdnCglQS
	so57zD+/Q1kPH+lUcNiN2fR6/+s7xU5O1AjiWYlDUID34TOZerwOJJCOsxm/73wD
	AKWfN54uWLHEgaWECt+7UHmgOfzc5a9lH3nXnAz3hT37RZh9W27f0QUDHzBg/F3h
	2H+eskpgY2tz9SOoLS7XLLDm437GAqrqDrmqZ4wiJvlEm8NsT0+VsUGPYke1l5R3
	kW1R0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvg1q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 17:04:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7BB1040046;
	Thu, 24 Apr 2025 17:01:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4E6D9C40B5;
	Thu, 24 Apr 2025 16:59:49 +0200 (CEST)
Received: from [10.48.86.196] (10.48.86.196) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 16:59:48 +0200
Message-ID: <fe3323d0-161c-498d-92e8-7a723f8d9780@foss.st.com>
Date: Thu, 24 Apr 2025 16:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 03/12] pinctrl: stmfx: use new GPIO line
 value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
	<afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Steen Hegelund
	<Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>,
        Ludovic Desroches
	<ludovic.desroches@microchip.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <linux-samsung-soc@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-actions@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.196]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_080454_248105_A0094201 
X-CRM114-Status: GOOD (  15.38  )
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



On 4/24/25 10:35, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/pinctrl/pinctrl-stmfx.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index aae01120dc52..f4fdcaa043e6 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -115,14 +115,14 @@ static int stmfx_gpio_get(struct gpio_chip *gc, unsigned int offset)
>   	return ret ? ret : !!(value & mask);
>   }
>   
> -static void stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +static int stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>   {
>   	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
>   	u32 reg = value ? STMFX_REG_GPO_SET : STMFX_REG_GPO_CLR;
>   	u32 mask = get_mask(offset);
>   
> -	regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
> -			  mask, mask);
> +	return regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
> +				 mask, mask);
>   }
>   
>   static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> @@ -161,8 +161,11 @@ static int stmfx_gpio_direction_output(struct gpio_chip *gc,
>   	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
>   	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
>   	u32 mask = get_mask(offset);
> +	int ret;
>   
> -	stmfx_gpio_set(gc, offset, value);
> +	ret = stmfx_gpio_set(gc, offset, value);
> +	if (ret)
> +		return ret;
>   
>   	return regmap_write_bits(pctl->stmfx->map, reg, mask, mask);
>   }
> @@ -694,7 +697,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>   	pctl->gpio_chip.direction_input = stmfx_gpio_direction_input;
>   	pctl->gpio_chip.direction_output = stmfx_gpio_direction_output;
>   	pctl->gpio_chip.get = stmfx_gpio_get;
> -	pctl->gpio_chip.set = stmfx_gpio_set;
> +	pctl->gpio_chip.set_rv = stmfx_gpio_set;
>   	pctl->gpio_chip.set_config = gpiochip_generic_config;
>   	pctl->gpio_chip.base = -1;
>   	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
> 

