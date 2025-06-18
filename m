Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=; b=ftP/gQlJ0vayfggs8maFqmpehp
	0vIisDHOw/coGgDIIKr949a57xRdrKaN6KOogNXRJVrjyioAJq1Ze4KZfY6dLDvN1mx3z0an/qPu+
	TLUpKVJmiA28QEDdTO5Ik88wGkws3gWnPi4Cue0qj928YepDqaKVyVscWcamdOPnO/FwgNHzP4erI
	A90gP5rizbyVWvJmzVAwXvvITzpR0SMj5mfUZVHky0AunRHPdu5uusqCIP2mU/0yCZpZguE1CV1nB
	TamXaAB0k6n8ib8HWL6vrbvncgsVWlb3n74dx2VAuMatsn2HL0wzFdEpsmYXQoRYYP77xDlT1rrgB
	gq8GJqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx1H-0000000AxrN-1EdP;
	Wed, 18 Jun 2025 17:56:19 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw9H-0000000AnNu-0xow
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:00:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54d98aa5981so9290559e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750266029; x=1750870829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=haySZ1Sh52QaSMeZDbG0lHMq+veiTxOQOY3oMO+Wy3NuM1GhXeqM2LGcrybttA5N9/
         gT6PmrRDegbpGdUrrEIF7LERsWkn6MmUe8BDadBTEsMoJtq6orSojcHLeb+XLLzM/Yqv
         M7Bh4QI8BY1Sc5Qv/7T3NMro21SZeKNcqNn1imkt0ShezRnz3q/Qpm8ary6LN5KLWII0
         H8S6mlrreX74NAF4aNoXeJ0opZemTtG4W8otPB2HM+XPnp0cQgrNe2vjk4l2lfOigGmq
         qGy5W3FXskD8GFphhJqiDkYfYaXPK+ug4jURGm8Em/LgCY4YzYNUOmE0/n2odvpcKxxh
         5LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266029; x=1750870829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=kuQcfACfGmUy3T4LDJz3HobhQivbW9Rj11cYxmbLd0kPJYuHSgo3Ff1CPv907AAugS
         7oIWMbFLe1Hjx+Ky+2LdjEErguySb26r62dC/tJRFhxqgvD7vTxohnJ+MDLyBGbMKAhS
         Lnw1E2UJJpShr1PosIfGEj2qZ946Wq6av7KBBGKUbvtMOflXmPItk45GaKJnrSRJRela
         0e2ViypukhHvsZB0AJ/JfyfFzhnnedmE67ej3HZkw3/oqwk8ydd9E6WyyxFl/0NVpP68
         KhfXeqC9SVHvDC0L3eAvK1Dtq7AWdO/d5tqbn7zZhh5E6iHCWgj700zSLbykzAUNy68t
         xLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9yEK4sa7YnrG51YGg42AYkY7CxgjTgbKtWjnMM2NEXvHK4p4Noa02XwwJnSwMIh40ZoCzMfC1VMvNMD1DsYxU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+WpC0OAEeP7hwnF9Th7rAuDDiIid+aD9ZAIMVJW0PqtQxUeR3
	BwPlui1AvFC1vN4IfO0L+z5P0zAUEez5S7l3RM2buq8M9s+gdqMblWdmdBjDfSXH0iW6bKYwcgx
	c67SMyku2ELViMXgNomVQP3bKsYQzyrpNNIfWNzynDw==
X-Gm-Gg: ASbGncveoA1CQfc2SVTqeb/DDpo+iSlnRankLdKddsDNqiXCJl2MPLNyBQ3Q/pRDm1m
	2JaSD5HG5D5SNSKLoN8QbcQJuf7+wJah7t8NMnBJmYmiAf8tr5QQFNz+5LOTU1/z6J948UEBe+5
	GuDM3iw5KrjjV+QkiNslfaSmRPiFfKRxRtkp4RfUO8KvMx2TE7TYxvzpx2z804j98CIF2amLPk5
	A==
X-Google-Smtp-Source: AGHT+IFrk7wjLo0FScAaHSeULurkvYIZ6q3poIqbDoop4mdMvyFf4GdTA027YlkMWkLw9hocI1+ULYkfCsJCJgw5Ht4=
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id
 2adb3069b0e04-553b6f16e9cmr4855031e87.30.1750266029272; Wed, 18 Jun 2025
 10:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
In-Reply-To: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 19:00:17 +0200
X-Gm-Features: AX0GCFsZ9BzqvDbhrAHxtqvk55yr6p1JWPmW5O8GtAIoAiziZFdZwWCX10LDhDU
Message-ID: <CAMRc=MfWD7XGuuiLd5_Sh1vODfE-v6suM3w=qdufxXPtkW+HVg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_100031_503957_6EFD6363 
X-CRM114-Status: GOOD (  15.51  )
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

On Wed, Jun 18, 2025 at 6:43=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> A few more changes are needed to avoid NULL pointer dereference
> (observed on RasbperrryPi5), because this driver calls ->set method
> internally:
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb23..57622f45d33e 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc,
> unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio=
,
>                                  int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>
>          return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct
> gpio_chip *gc, unsigned int gpio,
>                                     int val)
>   {
>          bgpio_dir_out(gc, gpio, val);
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int
> gpio,
>                                     int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          bgpio_dir_out(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
> Do You want a formal patch with the above changes, or will You just
> amend them to the updated patch?
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

