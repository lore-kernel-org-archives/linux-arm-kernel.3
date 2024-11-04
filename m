Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D7AD132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTcx+OtPjGb9e4h+RTNoGpGZkyPv0DP+3tRsN7gnqPw=; b=i6ke6v0c2NqfokMWjbQb/p3/vq
	CGvd16Tdx88i5o1c3cWBy5UutIMyVgIN3/symmLrMucuTXVzxjZ52APB338QvR6TeW1OCpqvibN3f
	h8BFy7Xl4p/BEU32Kms6nv+N+OhvNtbK4MexS6DFEEe/AShsKbOQC/TWUY/e43ZYVu1GBWp+RRg4J
	Xr/mgKCQBqLPnTEzOecr/dEuO1ZW/htiz9jW1g4pEGtREGfJQse3qjZ5aTOi8dwmQ6QgHdSZjQHaj
	x+siUa/uaL4wDTBk5quV6cUtDWE654NfEijVWId1HU6e7PEpXV/VpXsjCqFo49NEykcaNuJHtBvxB
	MkSQXigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tj4-0000000DDZk-3Kno;
	Mon, 04 Nov 2024 09:50:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tYB-0000000DBGe-2koq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:39:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t7tY6-0000aX-Mp; Mon, 04 Nov 2024 10:39:02 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t7tY5-001xM7-2T;
	Mon, 04 Nov 2024 10:39:01 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t7tY5-00DP6z-27;
	Mon, 04 Nov 2024 10:39:01 +0100
Date: Mon, 4 Nov 2024 10:39:01 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH RFC] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
Message-ID: <20241104093901.rb5ozxt7qkdgoatc@pengutronix.de>
References: <20241102134522.333047-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102134522.333047-1-wahrenst@gmx.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013907_723843_48EE8865 
X-CRM114-Status: GOOD (  26.34  )
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

Hi Stefan,

On 24-11-02, Stefan Wahren wrote:
> The recent introduction of reset control in pwrseq_simple introduced
> a regression for platforms without RESET_CONTROLLER support, because

This is what I was afraid of :/

> devm_reset_control_get_optional_shared() would return NULL and make all
> resets no-ops. Instead of enforcing this dependency rely on this behavior
> to determine reset support. As a benefit we can get the rid of the
> use_reset flag.
> 
> Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset control")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/mmc/core/pwrseq_simple.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> Hi,
> will trying to reproduce the Rpi 4 regression from here [1], I found
> the issue above. I'm pretty sure the Rpi 4 regression is caused by the same
> commit. Unfortunately I wasn't able to reproduce it.
> 
> [1] - https://lore.kernel.org/linux-next/6724d7d5.170a0220.1281e9.910a@mx.google.com/T/#u
> 
> diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
> index 24e4e63a5dc8..b8782727750e 100644
> --- a/drivers/mmc/core/pwrseq_simple.c
> +++ b/drivers/mmc/core/pwrseq_simple.c
> @@ -32,7 +32,6 @@ struct mmc_pwrseq_simple {
>  	struct clk *ext_clk;
>  	struct gpio_descs *reset_gpios;
>  	struct reset_control *reset_ctrl;
> -	bool use_reset;
>  };
> 
>  #define to_pwrseq_simple(p) container_of(p, struct mmc_pwrseq_simple, pwrseq)
> @@ -71,7 +70,7 @@ static void mmc_pwrseq_simple_pre_power_on(struct mmc_host *host)
>  		pwrseq->clk_enabled = true;
>  	}
> 
> -	if (pwrseq->use_reset) {
> +	if (pwrseq->reset_ctrl) {
>  		reset_control_deassert(pwrseq->reset_ctrl);
>  		reset_control_assert(pwrseq->reset_ctrl);
>  	} else
> @@ -82,7 +81,7 @@ static void mmc_pwrseq_simple_post_power_on(struct mmc_host *host)
>  {
>  	struct mmc_pwrseq_simple *pwrseq = to_pwrseq_simple(host->pwrseq);
> 
> -	if (pwrseq->use_reset)
> +	if (pwrseq->reset_ctrl)
>  		reset_control_deassert(pwrseq->reset_ctrl);
>  	else
>  		mmc_pwrseq_simple_set_gpios_value(pwrseq, 0);
> @@ -95,7 +94,7 @@ static void mmc_pwrseq_simple_power_off(struct mmc_host *host)
>  {
>  	struct mmc_pwrseq_simple *pwrseq = to_pwrseq_simple(host->pwrseq);
> 
> -	if (pwrseq->use_reset)
> +	if (pwrseq->reset_ctrl)
>  		reset_control_assert(pwrseq->reset_ctrl);
>  	else
>  		mmc_pwrseq_simple_set_gpios_value(pwrseq, 1);
> @@ -137,15 +136,14 @@ static int mmc_pwrseq_simple_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pwrseq->ext_clk), "external clock not ready\n");
> 
>  	ngpio = of_count_phandle_with_args(dev->of_node, "reset-gpios", "#gpio-cells");
> -	if (ngpio == 1)
> -		pwrseq->use_reset = true;
> -
> -	if (pwrseq->use_reset) {
> +	if (ngpio == 1) {
>  		pwrseq->reset_ctrl = devm_reset_control_get_optional_shared(dev, NULL);
>  		if (IS_ERR(pwrseq->reset_ctrl))
>  			return dev_err_probe(dev, PTR_ERR(pwrseq->reset_ctrl),
>  					     "reset control not ready\n");
> -	} else {
> +	}
> +

Can we add a comment like:

/*
 * Fallback to gpio based reset control in case of multiple reset lines
 * are specified or the platform doesn't have support for RESET at all.
 */

Regards,
  Marco

> +	if (!pwrseq->reset_ctrl) {
>  		pwrseq->reset_gpios = devm_gpiod_get_array(dev, "reset", GPIOD_OUT_HIGH);
>  		if (IS_ERR(pwrseq->reset_gpios) &&
>  		    PTR_ERR(pwrseq->reset_gpios) != -ENOENT &&
> --
> 2.34.1
> 
> 

