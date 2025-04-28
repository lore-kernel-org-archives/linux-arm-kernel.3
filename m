Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458FCC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=; b=DR64XODMMnMVTUrRI4785YxPlp
	GUfJ/+vL38/B7CXPZnof8t/KVNlVTISK22Inu71/4IQN1O6GXdWVWH58IsZulDzrB9l7Ql4AdpV1d
	nBt/lxZibgK0on4UxZ0+zG/ER9NVu5CuxsZzVa9LMgaUMro1oJrcVxc05HdnjDTLrzGBD6WNjqUhm
	v2yrTJ5nYyP/ljj2+OdeG2STLWqnGZMKYOcaEzBK5GAMwmFgIO6KAB1/dVwxslbZKp6FITe/AqVFQ
	gUmyfsZgzJeQbxnTERThT1FlVEPZCEXcSEmXZGcquSdcObqtpUU0S5IIHuv/uVKUcW28ivorazkiU
	xZFD8jtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R3H-00000006rrG-2L1I;
	Mon, 28 Apr 2025 16:09:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R1J-00000006rRx-1rLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:07:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4159620b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745856468; x=1746461268; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=;
        b=x+2ezmcV1T0sHMSxnFOzeMVdj1WXYDpNk97I/diBQgCU0xLwJ8F0FnbsnjJwB5nZXE
         g2jOKVY/orpVnB+IBguzxIjqdjoSCcJpQFrO+Oj+xXod7DJBjYiwMTd7f4ukvRK9RBQn
         SB3p6pgthJI3wkzAHjTarnQbtjmOy4hjUyy82c1378n6nlN5CIehoWyCmwxz45aXJQIk
         3B9UPupmXYFt7yi0ZLJgKmpyDXWpIEmeoCFSY9uqgX7nJOCIM5hd7AW79HBy5e6NDjLy
         KnSSq/Higtm6b2gcjGBtC1gZpvPt91F1R0LoKL4du0lZIoRzdF7kE9whphTSPYWygUfw
         sLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856468; x=1746461268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=;
        b=iu8goUztCzrNbMJNRDX6kDBN1kMA4BCZePYW7eqaER4Jr/ZyeNqhefgZBiYgq4Qmmq
         oqXjJzcwlnKWSy+vLMrCzjgpX0tfE4IA/4S9ccwrZ+f65PEwzuIEC+EuQ8em1XzlqG4q
         n8bs5yZcm7VF6u1C2Xxc/sEUwvq1Mf01X9rQpgyMBsig+oJsQr7ILM+WUKhyIgHmukXJ
         pzIlR0sk6rjO49WTJGjMBnSDJxsRHX+4da93Eo90y4cSp7nXvkSR0ilZafbjS/lTXanY
         MuJ6kXEpp30+L0MGbtG7BtCB2CHnM2HyJboPt2UrOF+a62EHmkvLMFWZfyF8yzWqbP3y
         vU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4mJH/OWBE1BSrjhDHmG1RdChFe91q4OQMDyGV/MJRZGzkCacgiRzs2caOfvOSNHCQcN2S9wzBshpEoLIAh6i8@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ304cz6Np7pCalCkby6+Kgx0wufq5lz39z+Y8uMoAHqLoixqe
	6AU+HwCXCUoCFCp0NN41L3VNsNSASJWyncOl7+PwtI0l01s6VnzMwkj9JyT5jg==
X-Gm-Gg: ASbGncuNEAnyhnRNbRtnl2gkbs+gGXMq/QS1ZCHPVEtGUDZOESa4uwEcG6JhxssHj5A
	Ec/p/4AcJ9IaNuMrPg5jA1GlcaSOQiud/w57reXaJUxm2Dp2b7mTc8Wm8e43a8v5Fb/oTKfkPhC
	Nq7HcrhcAMrSvbwCj8Oa1XgaqORh/x63zAJRBNKRWqMxr7moMnuB3KEtD7VfnSQzSaipnzNtucw
	8hCZ7cbz8Wn4frXGOPpwU2/bCdRUCUG8V6b2QQBt9ZS4za2p7hoaLPJ+k5iJCCOQogxGXSexdAH
	nf6NPSciXtHje+DHnlxjcEcnCBVRTe6mGah0DzVvqgVgtS0LqQ==
X-Google-Smtp-Source: AGHT+IF0ND+g+mFXQq9lcsG6u5nnlgozZt0EphIl6/bHv3S/p1GH2+Y4vlSstnIZ/hRGR6y3aIC3NA==
X-Received: by 2002:a05:6a00:138e:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-73ff72d3d28mr12125481b3a.14.1745856468420;
        Mon, 28 Apr 2025 09:07:48 -0700 (PDT)
Received: from thinkpad ([120.60.72.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acc4casm8463484b3a.172.2025.04.28.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:07:47 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:37:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Paul Cercueil <paul@crapouillou.net>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/12] pinctrl: owl: use new GPIO line value setter
 callbacks
Message-ID: <ild3eqfgiez4zgtxcha6ki3udfxzdiqeywvwzh7rfympgfps7o@m6h4v5kxhq63>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_090749_487231_B32295D0 
X-CRM114-Status: GOOD (  20.78  )
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

On Thu, Apr 24, 2025 at 10:35:27AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index d49b77dcfcff..86f3d5c69e36 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -598,7 +598,7 @@ static int owl_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  	return !!(val & BIT(offset));
>  }
>  
> -static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>  	struct owl_pinctrl *pctrl = gpiochip_get_data(chip);
>  	const struct owl_gpio_port *port;
> @@ -607,13 +607,15 @@ static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  
>  	port = owl_gpio_get_port(pctrl, &offset);
>  	if (WARN_ON(port == NULL))
> -		return;
> +		return -ENODEV;
>  
>  	gpio_base = pctrl->base + port->offset;
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  	owl_gpio_update_reg(gpio_base + port->dat, offset, value);
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +	return 0;
>  }
>  
>  static int owl_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> @@ -960,7 +962,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
>  	pctrl->chip.direction_input  = owl_gpio_direction_input;
>  	pctrl->chip.direction_output = owl_gpio_direction_output;
>  	pctrl->chip.get = owl_gpio_get;
> -	pctrl->chip.set = owl_gpio_set;
> +	pctrl->chip.set_rv = owl_gpio_set;
>  	pctrl->chip.request = owl_gpio_request;
>  	pctrl->chip.free = owl_gpio_free;
>  
> 
> -- 
> 2.45.2
> 

-- 
மணிவண்ணன் சதாசிவம்

