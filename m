Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF0DD78783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dpxgpVjronVSwUPCPFj5OzYc6xfTN7Fz/RJWrifxaw=; b=aaSHDpHzw7pSHLL1Scb0xEha3h
	G4F4kclO3q1hYwYAuXpW2iEYTA2De7quMg2WsddALCbwXCSX6BvK2p9SCs0qPsBSADucZiqICB9k6
	udyJhFY8NUREhBguDsIbL4I5cY6i5a67DkvOW05MmmVP47eZj1MFyQlN220/5W0PPdO0I+0eIdrMQ
	orwvyvRYu7b/rAgzccdN5WTbkcjOb1VXAYvTH/SBjkszkzPQ4Gmkw2jkmm63egUz8bT396jRSQY9J
	FRG3e297R28NA9xheLssRXczdxmoMMMuQu07FROLUsAOZNCQIqBd7ZJttwfss8etSo7KM/4xL2SrS
	diiTmYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbpw-0000000ASZL-0keb;
	Fri, 19 Dec 2025 14:52:08 +0000
Received: from mail-m15566.qiye.163.com ([101.71.155.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbpr-0000000ASW2-2ckn;
	Fri, 19 Dec 2025 14:52:06 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2de8ecb5a;
	Fri, 19 Dec 2025 22:51:48 +0800 (GMT+08:00)
Message-ID: <1ca8f181-7784-469a-b498-622a39737e1e@rock-chips.com>
Date: Fri, 19 Dec 2025 22:51:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/5] iio: adc: rockchip: Simplify with dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
 <20251219-iio-dev-err-probe-v1-4-bd0fbc83c8a0@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-4-bd0fbc83c8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b371876c109cckunm523b6161c55b6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkpLQlZISkxISh9MSUxPTUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=L3Mqft++QW1keeakifFX4r26Bo0K6b98n4bO3SkNmgCq8A7i7LaIGFWE33BuWDvjygTygfaTOhEhZeN8KwRErxShB2KrucqxNKw+Kd0nc3xTFXibEhJOhbcD08iJuqEY8SBejR1zFuRW/6LxVsItsK6il0sxsFTK4A2FeCidGBw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+dpxgpVjronVSwUPCPFj5OzYc6xfTN7Fz/RJWrifxaw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_065204_192420_FBCFAA9C 
X-CRM114-Status: GOOD (  15.20  )
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

在 2025/12/19 星期五 22:31, Krzysztof Kozlowski 写道:
> Use dev_err_probe() to make error code handling simpler and handle
> deferred probe nicely (avoid spamming logs).
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/iio/adc/rockchip_saradc.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
> index 6721da0ed7bb..263d80c5fc50 100644
> --- a/drivers/iio/adc/rockchip_saradc.c
> +++ b/drivers/iio/adc/rockchip_saradc.c
> @@ -492,10 +492,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
>   	 */
>   	info->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
>   								"saradc-apb");
> -	if (IS_ERR(info->reset)) {
> -		ret = PTR_ERR(info->reset);
> -		return dev_err_probe(&pdev->dev, ret, "failed to get saradc-apb\n");
> -	}
> +	if (IS_ERR(info->reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->reset),
> +				     "failed to get saradc-apb\n");
>   
>   	init_completion(&info->completion);
>   
> @@ -505,10 +504,8 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
>   
>   	ret = devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
>   			       0, dev_name(&pdev->dev), info);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed requesting irq %d\n", irq);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "failed requesting irq %d\n", irq);
>   
>   	info->vref = devm_regulator_get(&pdev->dev, "vref");
>   	if (IS_ERR(info->vref))
> 


