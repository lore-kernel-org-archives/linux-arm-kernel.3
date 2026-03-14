Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BAC10706C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecIC7Cx0+X4PyCdNszbHSRQ/JqEk6Yq8c3tc3oyYojk=; b=gMv+I8Y+Kgt0nzutv1NPGiqdEP
	NgDB7wyzw629F7Iz5KrfIPYcheUku5MHaVRU3W+3bbOLr7f48P5SM3jpkHeHMv6pfxLsghmmdKZWH
	JO6D4QM0coLsEEqDL50CnYF34daB2gC6VMZr9+zDty9tHJW09LlD1PD4Y5D6+WS3XhqtqMIpRdvLS
	kTuj9zjHL5pmqh08mES+ys2bAeS0TQqkaRKe0FXwwGwc29725q9WHbEPsOKwjkgckKby99NiUzUpJ
	WWCo53rMbdGCKihaZKActpqFInrAPGRb+oU4+iG9TU3MMfpXlJiSqnxZk8e4BKqERGRMSsmnKUbJO
	iQiGWdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MA4-00000001k6u-2moh;
	Sat, 14 Mar 2026 10:24:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1M9z-00000001k6a-3gJm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 10:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7426013A;
	Sat, 14 Mar 2026 10:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDDCC116C6;
	Sat, 14 Mar 2026 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483834;
	bh=9tW88wtC23Nu5H1ydEbU0qbXKKzXQG4pyrrMW/FnfBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQfZyiSMrQ8sCNW+FgXGj8pS7B2I71bND85ID+aaX+dyaNsrK6Z2WF/Yzq8rtLc3z
	 lNaSGk7qEyKg8lTXtkndoebnJx74Dqadt3FXTYRtREm/THj6j5Avdy41R5Cxk2d1h3
	 mesHyl4ABmGIceuHiM7EXsWb9UPDGrFIRoTe5JMnsvzThU4FAdtKZKhgG9oECf5wiX
	 ulYn08uz4fXLtcA/kVRXmLW7ttkpPwe3ljwaMQEzlhicaKrmih08Kc6z8F3TqHuvTN
	 JWeKzyYRcIXCWoZHTqBB8VWbu1OTO4Q4TgOd2WBc6U3hzsQ9tTa1ZdBQ7wgdEUJaC1
	 51rErr4AXPbPA==
Date: Sat, 14 Mar 2026 11:23:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
Message-ID: <20260314-flat-topaz-peacock-440a9c@quoll>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
 <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
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

On Fri, Mar 13, 2026 at 01:27:57PM +0800, Ryan Chen wrote:
> Add support for the AST2700 SOC in the sd controller driver. AST2700 sd
> controller requires an reset line, so hook up the optional reset control
> and deassert it during probe.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ca97b01996b1..91c36245e506 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -520,6 +520,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>  
>  {
>  	struct device_node *parent, *child;
> +	struct reset_control *reset;
>  	struct aspeed_sdc *sdc;
>  	int ret;
>  
> @@ -529,6 +530,15 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&sdc->lock);
>  
> +	reset = reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +				     "unable to acquire reset\n");
> +	ret = reset_control_deassert(sdc->rst);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "reset deassert failed\n");
> +
>  	sdc->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(sdc->clk))
>  		return PTR_ERR(sdc->clk);
> @@ -577,6 +587,7 @@ static const struct of_device_id aspeed_sdc_of_match[] = {
>  	{ .compatible = "aspeed,ast2400-sd-controller", },
>  	{ .compatible = "aspeed,ast2500-sd-controller", },
>  	{ .compatible = "aspeed,ast2600-sd-controller", },
> +	{ .compatible = "aspeed,ast2700-sd-controller", },

So devices are fully compatible. You must express it in the bindings and
drop this hunk.

Best regards,
Krzysztof


