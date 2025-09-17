Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A40CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEKtnillVVFfRZ+5u504JAMAMZFI1GIHyIZay2lch2M=; b=WjnnR2+Gf9I6isuKk4/zJVfvLa
	ZUtBf/oSfMAtoklRnTx31FFreY1HUICdMW9KHKUce6TRH+rPOgClfskiF9oUFP/vOVrG5EawCu5FX
	y5VHCxlQLxEWdW3DVxmZPYo9qbOBpscszMouGplxe3Gnrs/PHFPEE+IhuRrhPRT8DPWn/4FcB7WhQ
	r3oF/1q/pg0zAgqRH9wV/Jr+iif7egVpp+e1Mp/RLboKlrrpeSt1oPXzK+Fntq9iThq+H21yyf2rQ
	Lf0J0DbD3h9O/jxrckrXJypRRJSLbLdHW23S4OnXTchcjxKyBs0ht+uaANpvCvZba9gbahvQjXC12
	lHqZYl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyn5J-0000000AYoO-2S3g;
	Wed, 17 Sep 2025 08:00:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyn5F-0000000AYmV-1wiz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:00:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-573855e2afeso4036303e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758096007; x=1758700807; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEKtnillVVFfRZ+5u504JAMAMZFI1GIHyIZay2lch2M=;
        b=wa371OdbikxFSWQoWnby/6Vb2Je0KISq4S7XU3IOSGx46Shbk2r3fy2CdCkfQfUSgC
         Cc4F7dJiwT+nLKtxmzX+9A4f9YlPoa/5jNZpu3l5C5QfByYycIlZzykQRGa0rxC4ngy+
         1k9tyBc6ArVBZ4Rk+TzUEeqPwPFUlwm92p42kIpLWrifIFxoYnIrUuZeURmZxWEmbJQg
         I9Pct7WDiBPHwxU+ntVVlRTnkohcMr22ndUxm3k1u53/AV1jFDVpH/1I5HVA8+CamhNi
         P5NmsUt+FXS8Lmt6jhobdG+SZrik1iPeqVytt5r5dQzj5Lkr3TwzMIG2nyyuhJqrffaS
         hSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096007; x=1758700807;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEKtnillVVFfRZ+5u504JAMAMZFI1GIHyIZay2lch2M=;
        b=naGpiHRG7Bt4YM+UlHnfXe/CEjfu73g4ywCmTF801s9+u+wwAkFnQ6TSe/GpLCQMUc
         E6EXyvu+dXKPmCfrXY1OpR+DdrGbrCj9/BDhdxpz7q9+QwKwIor+W9uHc2wE8Z2DIiPO
         4JSVGO2gjIccaY0gqLzW5ORdVKHp0dfAuXp+9xMR/dj560iEaluPZXVb9jwt24WcL2dw
         UxhirSgoDaB8+ACXI2Pp0eXELrI/O9tJwVI5gC4fQDTsRrEUlKP/2L/n5b3AOmeW0jO1
         Cd8Hdb9Fb+Bq1V9MZm6Y5TYjhpWuY2RMZxrxNx9MSdh7w/BkTlpb15Id/8312oiQoxAo
         CMUw==
X-Forwarded-Encrypted: i=1; AJvYcCWVpy1KYcPziyNxOTeZ5DbyHTj6gtcQf5nxylNsY1AmXznEC3jL2/22Cy8/ckOPev8hR6xpVutyr5tXo0B9unWd@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ3dUMDhSgeUuEsUb6q9nMvORtj0wB3/Y1zTTVVUjkwqdWTkBK
	AS6BESVfjNWN3R8epAjOM7pfX0YCMKFvHhxlY6TGMEPwKfAPsJsIHGXqRHWJemFw7ZX2lKUUfva
	zcoXMpvxIprR3IWlcJ0aC1TNmk2LGWtNq6uSnn5ulNA==
X-Gm-Gg: ASbGncvu5IKY8j8OhF8ClxXwZd+otm4t711y+MYOc99Ea1hLiNjtvu03jfGxhRuuXDJ
	BmHo5ZzmnliaW9Oow6Rp2q6K5YRRti6C/HSR19yhxN7PehPT06vUwG7PU8oiOsh9AbB8Yuo1aOo
	xVbk3QSJe/z7ZZZ/G92W2vwiX8tlzOApw7W3EsYKX/RvBuStgvMV6rGe6AZt9NUFrKgwh6qEoma
	WYAiIc=
X-Google-Smtp-Source: AGHT+IFb7uT1amCYEcbDk/aG1gXDqhuVxynj2vweh0X8HkHwURxRRNA23Yw7fUXf7MR74tQK3DcqqGV4vVXMX6Mmtb8=
X-Received: by 2002:a05:651c:1503:b0:35e:401e:a8a2 with SMTP id
 38308e7fff4ca-35f653c888emr3283521fa.39.1758096006643; Wed, 17 Sep 2025
 01:00:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Sep 2025 04:00:03 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Sep 2025 04:00:03 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250917-rda8810pl-drivers-v1-17-9ca9184ca977@mainlining.org>
MIME-Version: 1.0
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org> <20250917-rda8810pl-drivers-v1-17-9ca9184ca977@mainlining.org>
Date: Wed, 17 Sep 2025 04:00:03 -0400
X-Gm-Features: AS18NWCZjow2-dnpLe_oaxtKdrNMg3nTySj8u9HPhpYEQB-s6-z3-oDqLWpwlyY
Message-ID: <CAMRc=MeHQf_Oa2DRR0T7tum-Tuk3qPh5r5gimxGY3EXTyvoKZQ@mail.gmail.com>
Subject: Re: [PATCH 17/25] drivers: gpio: rda: Make direction register unreadable
To: dang.huynh@mainlining.org
Cc: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_010009_765702_00A60086 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, 16 Sep 2025 22:25:14 +0200, Dang Huynh via B4 Relay
<devnull+dang.huynh.mainlining.org@kernel.org> said:
> From: Dang Huynh <dang.huynh@mainlining.org>
>
> The register doesn't like to be read, this causes the SD Card
> Card Detect GPIO to misbehaves in the OS.
>

Hi!

Sorry but this message is unintelligible, please say precisely what is going
on and why you need this and why it won't break existing users.

Also: the title should be "gpio: rda: ...".

Bartosz

> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  drivers/gpio/gpio-rda.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
> index b4db8553a2371ae407fdb7e681d0f82c4d9f74b7..56aaa9f33d29469dfb1bf86ed7b63c54b413c89c 100644
> --- a/drivers/gpio/gpio-rda.c
> +++ b/drivers/gpio/gpio-rda.c
> @@ -245,7 +245,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
>  		.clr = rda_gpio->base + RDA_GPIO_CLR,
>  		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
>  		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
> -		.flags = BGPIOF_READ_OUTPUT_REG_SET,
> +		.flags = BGPIOF_READ_OUTPUT_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
>  	};
>
>  	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);
>
> --
> 2.51.0
>
>
>

