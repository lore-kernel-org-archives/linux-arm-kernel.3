Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA61FE67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBRUg+4Qb7okmxOYh3kLMzKaVVwRJ/8o83coAVZieEg=; b=lgJK67UubFGmjEk198YO0CJWXp
	VU6YS57oq52d80O/3Znc2JlhEBFc8QA62669z8jIVbRSjv3R5ea9JW7qHWpXbnVeb2+pa7o3ZLD8d
	nyIbB7E/POLNHJqsGan5mzQiUbu8nh/xyPeZkeN44brZUOsKFOo6NfYPg7QENosqM218Yw0B2h3hU
	F/1hGBKUP1kr7uETXt3ggpip51pvBuG8rpyNoXYLG7qfStXu5TwGyEw++NGXEWeODYrGWrpexljjN
	XoU08GLal6Cc2qfDRJlPsw3Qf4jFz+SV1AJmqxej9lVLK14RQTGkXAwE268yIXdqrWm0ZguNS11zB
	6Wcpcr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXIAm-0000000CQ0c-2jmp;
	Sun, 21 Dec 2025 12:04:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXIAl-0000000CPyx-0z73;
	Sun, 21 Dec 2025 12:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C31A060007;
	Sun, 21 Dec 2025 12:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBF7C4CEFB;
	Sun, 21 Dec 2025 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766318665;
	bh=vYJHXTF57S2uWIWZSnj37Cbd8d3rIPZwHikEoAhE4qM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kSjOlOk3h9BEnPlVU+aF/hIoaQV4c+oE2pmS+dEjUHl1yr+qW1KFlR8WM8sJ2bVd4
	 qG9vydCViH89KPRGzVk6N89j4gByJknCPPjmfXkB/xfnei0gPVtOQLaxmc2CEMYYAW
	 4cO6SbQTlo0TdXY/UrnfGdQ/rPWYIR9bfyysAGRF8P8CKYk+83V7PnQN5jvsJZorgO
	 gcY2l+ehX46+G4byGX25XLKjXZhj9K+AiEiiV7IJCP3myCkXSVy4Z4uhTxvXMDcOB3
	 3hmzaUdRhhnfbZzIM5IbaNdiEk6GEPy41lgxBviQenD55MuAM07dW2xJJNV66itTvr
	 GH0Ltqv4LgQ7A==
Date: Sun, 21 Dec 2025 12:04:13 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Heiko
 Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/5] iio: adc: aspeed: Simplify with dev_err_probe
Message-ID: <20251221120413.7f1fa877@jic23-huawei>
In-Reply-To: <20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
	<20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 19 Dec 2025 15:31:50 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use dev_err_probe() to make error code handling simpler and handle
> deferred probe nicely (avoid spamming logs).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Not a comment on this patch as such, but this would benefit from a local
struct device *dev


> ---
>  drivers/iio/adc/aspeed_adc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index bf2bfd6bdc41..1ae45fe90e6c 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -535,11 +535,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  		return PTR_ERR(data->clk_scaler);
>  
>  	data->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
> -	if (IS_ERR(data->rst)) {
> -		dev_err(&pdev->dev,
> -			"invalid or missing reset controller device tree entry");
> -		return PTR_ERR(data->rst);
> -	}
> +	if (IS_ERR(data->rst))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(data->rst),
> +				     "invalid or missing reset controller device tree entry");
> +
>  	reset_control_deassert(data->rst);
>  
>  	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,
> 


