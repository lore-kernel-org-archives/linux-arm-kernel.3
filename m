Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8BDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShSjChoUXi6cdOr1qzYBZJXXI7K6JwDBuHhj6HnUiUg=; b=3GZi3uxONoNHbFgBkDfY02jo3C
	RIO3Iz8IAaPcBf6fUxmmlozTHtD+oZfdQDELgHfSxFWz2B2wGrX8Z9SgC801XwWxrltfXiupyDI/T
	8AGOuNfblg+qh76Hp/SQw5Z+ZT+VcicDwzZWwNtiUSNBQQ2cwy0KETpVSO0U3WlhseL+JbQYfi7de
	yHP8sGJD5RcJmnqHAF8lLnWN0Y1IPuj/Rgm12CGpSIs+6PdlsZymnsPPB9xdOzuB4l2ZK6G0rUnpK
	RAa8qakLVIBrZ8UQY36571oW6coGkH0X2oKmmNXDK9AnaloTL2oIEvcSegyiJG4I6BMZ8IROM1Oi0
	ipJ/MKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsvl-00000008qaT-3b3o;
	Wed, 05 Mar 2025 17:53:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpstD-00000008qCz-2BuZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:50:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso22874795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741197038; x=1741801838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShSjChoUXi6cdOr1qzYBZJXXI7K6JwDBuHhj6HnUiUg=;
        b=QMDFs5BGgFOw+AH1U15J7YNRFgMIuxqleosWrdChnOeMM8HbqihfkxQs7PZ5htvHNb
         kLum4XaEXIurb830EcB0KoXN/FmqE09rU2M9C3GDotLYCrwWQ7i4Sixx1MVfM/NYGdbx
         suIXQXjvfjsWuC1rLna5r91UBaanaRUWRT5QUgfju1ta8gS/uPrRrdRNw7XRaPVzdL0C
         Gm8fmEtDCXhxZ5nJ+4UOsQN+GSOKpvA+bjvd4Sa7uW/4tp9sqAYbMZxmRNiFslw9po72
         qYhPNo4mWO43IBgK0hGbCnflgD8o216IO2PLXdTiPqeoipns2JZukvE5brS1dkrsyUaM
         7Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197038; x=1741801838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShSjChoUXi6cdOr1qzYBZJXXI7K6JwDBuHhj6HnUiUg=;
        b=mo8lVON+V7/R6ufo7MECSvVJ3wq7LMbHxZUUrVJwNcf/x+B/IyeArPRE0CMBHW6UCR
         Lt9A5iUyNUC/ucwgEiFP5YmqjB8a+xUpP90XK7pPBtQCCOgmxUPY1zd9bgdBwYixXXyr
         nDbC8UQtaDtWX8ejq6V/1Ihoc8HCiEMk9iGa9ze2DW/CriLiWUJuARo7yUix06u2JSGQ
         8O2whz1BCriwzunXcVgD8XwaSTqmw3PB+w6FwvXeaj/A4BJEC1b/v63bH/Ib1aWpIVfM
         DQZpelvHhPwelty8egauRH2Av3/A1DOmnyCqWzJAI7BoiX3eGmYb3lCsUR68s+72/eqi
         u4tA==
X-Forwarded-Encrypted: i=1; AJvYcCXNOYSkHUTwZUQ55r+EekH8i+Dg/Pgv7GU8Xq72Y9aF7QGV0g93BQTIKxJW6YKzRgbMo6EWGaq10lKzrbgKlPqR@lists.infradead.org
X-Gm-Message-State: AOJu0YwTcP0nPXnBH4uueG54iPqXKSMt5X9wc25HWhu3XXYwhcHJdpKJ
	g/ghI48Y45Ck+naDXGOmUiflR0FQh75/bMeHwRAKDTfEEX6VuYxD
X-Gm-Gg: ASbGnctVfineH8GMXc0atXEI68THUSuNkRQO8SwQ6l/Ycjo97k5pmyjoduCsglv1985
	ScOID0GXARUj458i8/3rYOqnitXRRxBu50BwXmN0E2CRjJkqIuePPjDObm9f6BUyrY8OeXmsiWa
	ZaG7fpg0Y2BorzjPTlz3qM/Gsd8NIf0Vj3Q+ZfL6UUhgR7q2K0BXeq05NYHzk8zwg+rhUXBWk6/
	uO1G1zROV8KJbqAWYBajrRhfqIg7Bo7ztPFFEVnn1R+rnsI0lJlRhTVrPCopaWricw3pOYJf8zk
	xV+TtnJYMozId5BDpoemMjtiCL1ZmSNrT6buThVFaAN7eyTTXEdSL9ChyxjTpOdfpoL0oFUB6dx
	lPHKqYcwuz8cjR04/nbA+
X-Google-Smtp-Source: AGHT+IEWCqUxzSuiWh8DdXYIcHOPlTXKj59lMZgwA5RjbQMnCjHanj5mZRn4/ZQa/hWBmdDMtYjALw==
X-Received: by 2002:a05:6000:402c:b0:38f:48ee:ddc2 with SMTP id ffacd0b85a97d-3911f7a8ffamr3802810f8f.37.1741197036980;
        Wed, 05 Mar 2025 09:50:36 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391253b3e23sm1792217f8f.76.2025.03.05.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:50:36 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] pinctrl: sunxi: support moved power configuration
 registers
Date: Wed, 05 Mar 2025 18:50:34 +0100
Message-ID: <6028746.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20250227231447.20161-5-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095039_561241_877BE13D 
X-CRM114-Status: GOOD (  20.53  )
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

Dne petek, 28. februar 2025 ob 00:14:43 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>=20
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 83a031ceb29f2..fc12e6f807e4d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>  		val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> =20
>  		raw_spin_lock_irqsave(&pctl->lock, flags);
> -		reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> +		reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
>  		reg &=3D ~BIT(bank);
> -		writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> +		writel(reg | val, pctl->membase + pctl->pow_mod_sel_offset);

These two are missing "+ PIO_POW_MOD_CTL_OFS" right?

>  		raw_spin_unlock_irqrestore(&pctl->lock, flags);
> =20
>  		fallthrough;
> @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunx=
i_pinctrl *pctl,
>  		val =3D uV <=3D 1800000 ? 1 : 0;
> =20
>  		raw_spin_lock_irqsave(&pctl->lock, flags);
> -		reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> +		reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> +			    PIO_POW_MOD_CTL_OFS);
>  		reg &=3D ~(1 << bank);
> -		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
> +		writel(reg | val << bank,
> +		       pctl->membase + pctl->pow_mod_sel_offset +
> +		       PIO_POW_MOD_CTL_OFS);

And these two have "+ PIO_POW_MOD_CTL_OFS" too much, right?

Best regards,
Jernej

>  		raw_spin_unlock_irqrestore(&pctl->lock, flags);
>  		return 0;
>  	default:
> @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_=
device *pdev,
>  		pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
>  		pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
>  	}
> +	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> +		pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> +	else
> +		pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
> =20
>  	pctl->irq_array =3D devm_kcalloc(&pdev->dev,
>  				       IRQ_PER_BANK * pctl->desc->irq_banks,
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 6cf721876d89d..742fc795c7664 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -87,9 +87,11 @@
>  #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
> +#define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
> =20
> -#define PIO_POW_MOD_SEL_REG	0x340
> -#define PIO_POW_MOD_CTL_REG	0x344
> +#define PIO_POW_MOD_SEL_REG		0x340
> +#define PIO_11B_POW_MOD_SEL_REG		0x380
> +#define PIO_POW_MOD_CTL_OFS		0x004
> =20
>  #define PIO_BANK_K_OFFSET		0x500
> =20
> @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
>  	u32				bank_mem_size;
>  	u32				pull_regs_offset;
>  	u32				dlevel_field_width;
> +	u32				pow_mod_sel_offset;
>  };
> =20
>  #define SUNXI_PIN(_pin, ...)					\
>=20





