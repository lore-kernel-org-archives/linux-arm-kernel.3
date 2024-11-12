Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F66D32D81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr6REDhXVt1opvineUair86Kv+hNXCwWuTG4wc24Uvg=; b=OTulHOV+MLPVDb/egfJRvdIRgC
	Pi5f+IJoI30S31xP7odZkhSPZtSLThQm0iMb3tr3s+IYIgyomtcwt0KCqACkHLYD76OW4wA4q43U9
	ZedKeOxKF/5qa4eWbyVg7OWSQ9e8enUQZlavlqUP9Y57nW0fP59kJS+KpnqmxXRzH+BTlgfkUgPH+
	vnkvjhsWk4tkuhRZwb+sFDEmmS+8Botve7ttRbzlu+5QYUAdp7nJvcF8TZBgOvcAAn0478E68xKiK
	RTk2mVRWe8nNjqyq0V1r17Vo2D+tylHENTTOfgWXgRN4onOh/3ejU8U+gzENgX3EDZv0+47Ieryam
	1EYeiqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAw1h-00000004crX-1Mbd;
	Tue, 12 Nov 2024 18:54:09 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvsO-00000004b9M-2rTs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:44:33 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6e5e5c43497so47084237b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437071; x=1732041871; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tr6REDhXVt1opvineUair86Kv+hNXCwWuTG4wc24Uvg=;
        b=QJZlyjm8PhrjsKdXucK/+hM8gFfTvG3Xi2lV++dymXNbdbbzAZcNPTdEp95Xkc+JRF
         pibfD4IObsspF099uZCmAtoWrrpLRAB3fYqbH31/Nm3KJWlUN7nhUBChdFbzCLMptzrF
         VssSCsdN9T7x+rpjSuGe/dO+pZAWaqQlGxkReLACaOJc5ThOlPuacYrhDzYUkFuyk98S
         m2xszBgxnIGcWi94ZXNnHQ9oBYwcEzaGyOI1wDHiRpkwQzY3m0oWl6Q5Qhb67/f5kO/Y
         Zdl63zeLneztujj+6bsgEFMD9ba2U6d1uNYhOFEMKj42MBm9FcPfpl9uWYy1uOMwvSGE
         GyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437071; x=1732041871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr6REDhXVt1opvineUair86Kv+hNXCwWuTG4wc24Uvg=;
        b=XMDq7PU/huuE4T/26HSBrXtBH5XM4LR5w7pB9UwCprECP4YHHWtJiTgUoPpHODfi+l
         7XzXJydseBzfFhsR/RBGRLhKWgmUUWFoJsLktuo8sw6FsEYjhnJuNqrJljpKvCQPqY2s
         WsIOHhqudG5VRnB2t4MgDctYUqAfdyTmHDXOfePhXxSLWs90PS69Zq1cJ4X3oCgehhEa
         DyHLiVV+26MomQMQI+sD9Ux0TnhCr7BebQikiF6u+dyA9gMWhUCNg1/tzcwS93s0n14Y
         ULX32lreRCansAjF0ZvKo2eBsTZba9oNOY2L+LN86i5nwIOuZfktF8YEUTg1f3hq0t2b
         fZpw==
X-Forwarded-Encrypted: i=1; AJvYcCU31uCdeFlZy1rQko90QfeED1hiv9Dkkuu4rjeLzsD8DA+dd4gMJtxp132pxBWN23JTcuO18nRkC16iZre+OdxY@lists.infradead.org
X-Gm-Message-State: AOJu0YyWjdcVjN2kcKiI0RNclqym3SkLM1Sys1CnsET+jHwC5wyWHGgw
	i6xObBayNm7qwMw6Cd42ksOqs4HMCu8pIHq5h44q+y6CDHJZjJdTzVs0sJ1EGsN7GFPYIgMx4ln
	6tqMWK9m6v5xBCxkMtjROU3/ksOJRfIDgbhi0txrQh2LwXDfs
X-Google-Smtp-Source: AGHT+IH44Q8MD0K4pqUKXUCjf2JqplnFw2dHro4nArL34sMNY7ms7UeoYKZIVy0yhJb2ir9HCSb3HgO2REJ9e9FblRM=
X-Received: by 2002:a05:690c:7090:b0:6ea:5da9:2f7c with SMTP id
 00721157ae682-6ecb32cb110mr719877b3.12.1731437071000; Tue, 12 Nov 2024
 10:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20241108130647.8281-1-wahrenst@gmx.net>
In-Reply-To: <20241108130647.8281-1-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:54 +0100
Message-ID: <CAPDyKFrKTw16mfmMcnaz08vPJsAsC6KJj_j8j6UcbQif9VK1cA@mail.gmail.com>
Subject: Re: [PATCH V2] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104432_745896_87EEC5A8 
X-CRM114-Status: GOOD (  24.50  )
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

On Fri, 8 Nov 2024 at 14:06, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> The recent introduction of reset control in pwrseq_simple introduced
> a regression for platforms without RESET_CONTROLLER support, because
> devm_reset_control_get_optional_shared() would return NULL and make all
> resets no-ops. Instead of enforcing this dependency, rely on this behavior
> to determine reset support. As a benefit we can get the rid of the
> use_reset flag.
>
> Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset control")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/pwrseq_simple.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> Changes in V2:
> - add explaining comment as suggested by Marco Felsch
>
> diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
> index 24e4e63a5dc8..37cd858df0f4 100644
> --- a/drivers/mmc/core/pwrseq_simple.c
> +++ b/drivers/mmc/core/pwrseq_simple.c
> @@ -32,7 +32,6 @@ struct mmc_pwrseq_simple {
>         struct clk *ext_clk;
>         struct gpio_descs *reset_gpios;
>         struct reset_control *reset_ctrl;
> -       bool use_reset;
>  };
>
>  #define to_pwrseq_simple(p) container_of(p, struct mmc_pwrseq_simple, pwrseq)
> @@ -71,7 +70,7 @@ static void mmc_pwrseq_simple_pre_power_on(struct mmc_host *host)
>                 pwrseq->clk_enabled = true;
>         }
>
> -       if (pwrseq->use_reset) {
> +       if (pwrseq->reset_ctrl) {
>                 reset_control_deassert(pwrseq->reset_ctrl);
>                 reset_control_assert(pwrseq->reset_ctrl);
>         } else
> @@ -82,7 +81,7 @@ static void mmc_pwrseq_simple_post_power_on(struct mmc_host *host)
>  {
>         struct mmc_pwrseq_simple *pwrseq = to_pwrseq_simple(host->pwrseq);
>
> -       if (pwrseq->use_reset)
> +       if (pwrseq->reset_ctrl)
>                 reset_control_deassert(pwrseq->reset_ctrl);
>         else
>                 mmc_pwrseq_simple_set_gpios_value(pwrseq, 0);
> @@ -95,7 +94,7 @@ static void mmc_pwrseq_simple_power_off(struct mmc_host *host)
>  {
>         struct mmc_pwrseq_simple *pwrseq = to_pwrseq_simple(host->pwrseq);
>
> -       if (pwrseq->use_reset)
> +       if (pwrseq->reset_ctrl)
>                 reset_control_assert(pwrseq->reset_ctrl);
>         else
>                 mmc_pwrseq_simple_set_gpios_value(pwrseq, 1);
> @@ -137,15 +136,18 @@ static int mmc_pwrseq_simple_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(pwrseq->ext_clk), "external clock not ready\n");
>
>         ngpio = of_count_phandle_with_args(dev->of_node, "reset-gpios", "#gpio-cells");
> -       if (ngpio == 1)
> -               pwrseq->use_reset = true;
> -
> -       if (pwrseq->use_reset) {
> +       if (ngpio == 1) {
>                 pwrseq->reset_ctrl = devm_reset_control_get_optional_shared(dev, NULL);
>                 if (IS_ERR(pwrseq->reset_ctrl))
>                         return dev_err_probe(dev, PTR_ERR(pwrseq->reset_ctrl),
>                                              "reset control not ready\n");
> -       } else {
> +       }
> +
> +       /*
> +        * Fallback to GPIO based reset control in case of multiple reset lines
> +        * are specified or the platform doesn't have support for RESET at all.
> +        */
> +       if (!pwrseq->reset_ctrl) {
>                 pwrseq->reset_gpios = devm_gpiod_get_array(dev, "reset", GPIOD_OUT_HIGH);
>                 if (IS_ERR(pwrseq->reset_gpios) &&
>                     PTR_ERR(pwrseq->reset_gpios) != -ENOENT &&
> --
> 2.34.1
>

