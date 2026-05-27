Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DCECD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw2so0frtoJ7L36BG8ZMy2KRPedLJY369P26BUJOLLk=; b=sdQtwMZVhUrcUULjMztxPt+dFC
	1lePy2ViJMXMrmwdqK1ls3GChDXMKgp5uAv1Wm4FLHLYFTeJjihbEkHyiW5+OxMFbgZ+oNAovFjQ2
	QIVm19IsqH003BVBNec3u1nfHp0IsMAwwRF8HrQIFkxJvfqeVwkwnpgFWlsu8ilAoRFKU0404V6LS
	zkW8CBiJZ0hIlchGaRIRZy164iYXMQQwnAoyb9hv13FqupGrpBtFrCMb6eSAkpyPZZG46KFukLc/0
	uxCeU/6cyJb9hCIdTcF9tnITEi5F95J44bPu5XRU2OI+CeHE5KPOdPN52pg8QsBd8ZtjvoXj/AEt1
	WZg4SVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9N2-00000003WRF-21Ho;
	Wed, 27 May 2026 08:12:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Mx-00000003WQq-415D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:12:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FD9E600BB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC7D1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779869522;
	bh=uw2so0frtoJ7L36BG8ZMy2KRPedLJY369P26BUJOLLk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NfZ92c0xHqFVYEwjCEaR10h4Zq7VdUdg23WgrwjKsc9r29Dpuna/TsEzLUGOjY/+b
	 DasguJf7uRtfrp2IeWPfpNN68WZKq1+H1AgQbSJnezzs1tbZ4tbieTAe2W4c84fK1y
	 GNEwEdzk1Axh7KRHs+m2nX7M/L80K2wTkrzI5Z0T/wVXstzm6KpPoefrqrkXei7DE3
	 dtcBYQ+SaqsTb5oVTD/X3nLW0V3MEkmGRSZbOM2ot/1pLTc9/0wboIHnSh/8aMahY8
	 NB8d7VOSMnOG/T/5zjjJ+BJ3EK2t8nKulOgqteIDfxgueIdWLyV0i8e6OYhTBxtB5o
	 /NlrYLFHgJiqg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39378db197aso115881891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+gFe6gQsXYWKe0wMlTP9MN5C9ozxFqysECJdMWPo9QtFfSNNJ7hOEcrcJwNBM8EPW62Sqy+PIxccRoImXAnLfI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7+hAvL6pUC3slJEn8AoZ92cRPUacAvCO5umFvr6Vm8mwZL5j
	+JQcauNhfBQqYaXgb/3ogKw8g7oLm0HrRrV7mXwWgxiSXBKPoMvPMjxn0i/SLauSXNoQcCZPKJC
	IJRrP/WTXeRgYXTDS0Umt0BomvopLw0ifo5l3uQl3Zw==
X-Received: by 2002:a2e:9187:0:b0:38e:294a:d447 with SMTP id
 38308e7fff4ca-395d8d1d2a3mr51655011fa.28.1779869521582; Wed, 27 May 2026
 01:12:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:11:59 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:11:59 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260526171050.12785-3-scardracs@disroot.org>
MIME-Version: 1.0
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org> <20260526171050.12785-3-scardracs@disroot.org>
Date: Wed, 27 May 2026 04:11:59 -0400
X-Gmail-Original-Message-ID: <CAMRc=McuW+fU2m+oy6Q0+cOB_Kh0Biz_NRgD5m60M4bmAyuJZg@mail.gmail.com>
X-Gm-Features: AVHnY4IMDCoU0IV6a-vUPw7eiuq2thFTlobhU6B8muFXFThBWn-86qTSkIm69ug
Message-ID: <CAMRc=McuW+fU2m+oy6Q0+cOB_Kh0Biz_NRgD5m60M4bmAyuJZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: rockchip: teardown bugs and resource leaks
To: Marco Scardovi <scardracs@disroot.org>
Cc: brgl@kernel.org, heiko@sntech.de, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 26 May 2026 19:02:46 +0200, Marco Scardovi <scardracs@disroot.org> said:
> Address several teardown issues and resource leaks in the driver's remove
> path and error handling:
>
> 1. Debounce clock reference leak: The debounce clock (bank->db_clk) is
>    obtained using of_clk_get() which increments the clock's reference
>    count, but clk_put() is never called. Register a devm action to
>    cleanly release it on unbind. Note that of_clk_get(..., 1) remains
>    necessary over devm_clk_get() because the DT binding does not define
>    clock-names, precluding name-based lookup.
>
> 2. Unregistered chained IRQ handler: The chained IRQ handler is not
>    disconnected in remove(). If a stray interrupt fires after the driver
>    is removed, the kernel attempts to execute a stale handler, leading
>    to a panic. Fix this by clearing the handler in remove().
>
> 3. IRQ domain leak: The linear IRQ domain and its generic chips are
>    allocated manually during probe but never removed. Remove the IRQ
>    domain during driver teardown to free the associated generic chips
>    and mappings.
>
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 33580093a4e7..c804f970d823 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>  	return ret;
>  }
>
> +static void rockchip_clk_put(void *data)
> +{
> +	struct clk *clk = data;
> +
> +	clk_put(clk);
> +}
> +
>  static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  {
>  	struct resource res;
> -	int id = 0;
> +	int id = 0, ret;
>
>  	if (of_address_to_resource(bank->of_node, 0, &res)) {
>  		dev_err(bank->dev, "cannot find IO resource for bank\n");
> @@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  			dev_err(bank->dev, "cannot find debounce clk\n");
>  			return -EINVAL;
>  		}
> +
> +		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
> +					       bank->db_clk);
> +		if (ret) {
> +			dev_err(bank->dev, "failed to register debounce clk action\n");
> +			return ret;

Use return dev_err_probe() for brevity.

> +		}
>  		break;
>  	case GPIO_TYPE_V1:
>  		bank->gpio_regs = &gpio_regs_v1;
> @@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
>  {
>  	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
>
> +	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
> +	if (bank->domain)
> +		irq_domain_remove(bank->domain);
>  	gpiochip_remove(&bank->gpio_chip);

Maybe if you're already touching the driver, use devres for gpiochip_remove()
too and schedule an action for removing the irq handler?

>  }
>
> --
> 2.54.0
>
>

Bart

