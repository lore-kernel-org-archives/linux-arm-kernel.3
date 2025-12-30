Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8021AEE0214
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=; b=yo4oeBHp2K7+4y/tptzkF9Bgh9
	BKRryGgid9avlcbVOjEVvHpFX74mf8MEhz/DtiCIKQFBhHsyzDsa15FAbiYcv9VTVYtlDCSPPKZkX
	3EXaoUPvifsIZseB5Pg4sqJ3D8WpD4PzdAYzmCTNMJFDqYhrPWb+msRRuuXKl4HOxxVMXznuffmA6
	k30RKVVQmwRVYT/o8YrCJVrUxn6RiWZI0hus7m9FYe8pg/+9Duo+FmmLv3MngskCN6JsuQHMiVkMp
	U4zZvunBIRBH4LE+DhY8GHnJHmOMJYUWopsOjn8avRO4zcgU+9gwMuBTQcDO0hHJcaYqFIT8D2FHL
	Cknluycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabjp-0000000504S-1vW6;
	Tue, 30 Dec 2025 15:34:21 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabjm-0000000503a-2un3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 15:34:19 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-37b983fbd45so76667711fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767108857; x=1767713657; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=BpZys2ZcgdXm58uxXslYJkvAnxBInTaSLSjrGprKz9+kyzBiobN03btQqYx6zJf6GK
         7ukqT6jVjF08hqxSILLJc3hO0O8v7HelQON9vYX229n9EUz72LeEoWBUToJ2jgQijYVc
         82z74tDVvCeZfgcdgcA2dnkQxCdJe2hyVO0dSnRZDDLP57BH7eVE9oXLKbWDtuEIjSgG
         3jCsH4lVu++0nsq8oCqlAG8BtWBNjA/RCL06uy0MBm8BNf7BA61yj3zsVIfvFLn6FW+J
         p6wTb9oZoKXVfmU0ISpG/Vib7ElHqXu2j7gvqachuy0tCTNqvwd8NprrcLS/gZBpFRGy
         ydKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108857; x=1767713657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=adDm4fkyEtRDpcPQ9f0RGIELi/NquUN8A5lqcd3GxX5AavwHCDM2o4nlVZ3HCnrTyB
         5+SOAsfMxbl8LbyYcMwNZIsMz2XXfbfMFvrUjjX3Ehao3KeyR7c8pfUIWrz3HeKIb637
         XQYD24C3PyAxHgOT810B8Dga0JIdluL26Pm1GcwYeikr278sobKu7D5Mf6WfX92TlsBn
         nRNarzcKDsedtI3Mj92lxVfU79x9l87TYve38UsdZVzrCHaCWsbRrYckRDlwtaEL1OIr
         4EhXqr62aecHPaUzUEs4AtRnxH0sd+/9Jfzn4nRSJNJnGMCao+PsNTNeFXmMDXsfuy3t
         qazA==
X-Forwarded-Encrypted: i=1; AJvYcCUj2vvv8CpdYhi3kvXgsDWM5RElA0AfQu+h9htM0P8zutyRWas9slqupoPGiarU0EEFCRw+3/8/pXkx2NIsVmvO@lists.infradead.org
X-Gm-Message-State: AOJu0YxCX3yUoy2Z4BlC1ahjoxC3GmzUJfaHdV0UJo2TF6GW5vQraNAQ
	d1Dsr82WB0twxNmWAvrtsN5ZBeWk2H91CkdPaaaeYtWiBYzdc4ig3Seraua4lenUHcl2mnh97F4
	QQ/aLTtv9jsdsaBZNzOru9eEueJI+Fv/bKM1XuA7ZhA==
X-Gm-Gg: AY/fxX6ApwtkYRHJLHlNrGg9s5XlczBYSk6JHjr/It+K2+KlzFd/XLs0mAfOYd/zkv1
	5fX6wvw1PQLobs1P96FzCY0ckdBA8TMc2BNZGPuCRYPXbp7YokrLHj2qq3H7BJRAKts6OLhxPg9
	WFTom1fxyW1hO/HvKTPQQvhKfodlmh0CoKKBgD5B4ZwsmKH19B2T97+1PWJrDz9cFpapt0KB0wb
	THXAKc6adx57AunaleLvCkqM9oolA/IZI6X9rywPx2nZ/sm16+djeXg7lKAF7jSR4zsW5iPYgDT
	xwcAEpo=
X-Google-Smtp-Source: AGHT+IF8m67UtLFJYo+1Sd/5xP1asTd78BRhH0xaCX+pqytxUScESGkOS8OTTGNkp77INxT4etPPBh36TlR00OdBV7U=
X-Received: by 2002:a2e:a801:0:b0:37b:b952:5e2 with SMTP id
 38308e7fff4ca-3812158e6d1mr92229501fa.16.1767108856717; Tue, 30 Dec 2025
 07:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com> <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 16:33:39 +0100
X-Gm-Features: AQt7F2oKPch5XI3ozINSBYMELnoLnRJYzcAZlrhoJTH7OcGc0z1qpY0CIewnVRk
Message-ID: <CAPDyKFp3X0EeiGRHLQqzE3vkVoLmOwi=1813S32sLTqXab43gQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Adrian Hunter <adrian.hunter@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_073418_753458_5E8A72D7 
X-CRM114-Status: GOOD (  17.39  )
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

On Wed, 24 Dec 2025 at 13:44, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

All patches in the series applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ca97b01996b1..4296def69436 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
>  static int aspeed_sdc_probe(struct platform_device *pdev)
>
>  {
> -       struct device_node *parent, *child;
> +       struct device_node *parent;
>         struct aspeed_sdc *sdc;
>         int ret;
>
> @@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>         dev_set_drvdata(&pdev->dev, sdc);
>
>         parent = pdev->dev.of_node;
> -       for_each_available_child_of_node(parent, child) {
> +       for_each_available_child_of_node_scoped(parent, child) {
>                 struct platform_device *cpdev;
>
>                 cpdev = of_platform_device_create(child, NULL, &pdev->dev);
>                 if (!cpdev) {
> -                       of_node_put(child);
>                         ret = -ENODEV;
>                         goto err_clk;
>                 }
> --
> 2.51.0
>

