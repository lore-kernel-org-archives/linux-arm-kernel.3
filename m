Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9598EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=; b=nW2jCLGZoBazhMpSZh+NqCfLn1
	CpUbiwv9PONS5aPYYWMfl85RKL82iBzmKz1Epmnf2BlpDjnDYugftFbe0tkyE76HQVKnLBJzoiDcp
	98Efnem0SgcZOFrWUXX67SaG0nsrJqcdReKTFjr9GGLcXo+lgnieT2uw65peZOCj1OaupQQrcW11y
	FKZQroLRGcb300RewWW7SynJ90vvbG8ypSkcINkAzbcdPpLB266HZ5LPZbEW/Q2hyQAgMeCqYgP0s
	DrC9NEMTgGmkgX6aZpL5b1LMAkO+S91gTGYyKTPKMBRkfFrtuBdDSaLXgGlX7/YhAitiGi1Ad+QlN
	YvuR+idg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBgX-00000006vrq-0U5Q;
	Tue, 24 Jun 2025 22:00:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9gD-00000006eyS-1vf3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:51:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553dceb345eso6392794e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794699; x=1751399499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=rcXqt1meFU6Si3hSWvS+HX3DNPB0Europfudyn+iIIbzBVcQAOhqITGpM2DnTBzAge
         dPyS/+9G7O1A6BVxVdgGsOHNccFCvHpQio9E4JOrZdJa5IE1K/IretgZDgtJjTd8DKRL
         etsrF0IjDEefdxH6bArYb3Gp1SkB4xkesdbKEfYFuW5ZJAQpFni9yDiKHO2J3XJFhzaz
         Vd6oDrUyP1YjVlT2j2fJUQgyCqN0qAcSrXXhh9vU0nc1FyiC7XEnfCOOaLQdFDSCdCfF
         HhOqYQEqkebiI8/LGjK6AYthkZsibujgHXjhNECkFNgS625nLYhYiWWs5jEuKkBddKOw
         PeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794699; x=1751399499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=DyDdBl3oZHkId+l/s6VN/+y0D+d1mSRNcXv5ft03hPQObH5Ud5KMSJqOG3NrwpeuJa
         e2mh6YxDj614u/p+K/Zf+9xeo9O+t7EvC4XxlII5+0W1By9pwkXennq9SPdIIIyINssB
         kyoi83Y5DPAa+rLY6nS6VQ2vPnzhvj3hxbaCfzCW+1Y1BF8RsNxvrQ2HwWoagTtUXFHA
         B0pl7LYco5ce0ZKLx31UzgUPEV8R9s+ewcg8ZxNotVw1zkosLUHMyrh0gcjEBmT3Y5Ej
         MjvQ1k0/Ej8YIQI7PJFH5XK0PD0X2p3+tOMJSE0eWtuQfi4avQQIPvhnmtN9bv7q8ATa
         WOSA==
X-Forwarded-Encrypted: i=1; AJvYcCWr3isNU1DUkGXEQ6OH4gkOUI6PxsveD08qyuTK4bFHa/SeFLl3dsIvrihhgsmdlGbBXtjNmGL8nhMl+cInVGmk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94TjN9Yiq+3/9ozzaKathrfe/rc2PrhW0gMoGqTeafjDQKARi
	dJn/Jcc3wbPaAl2yrHZmLVaHNmHF8712BuSnLyGutTnlW//dxn0A/Z3lyYN/EaE8Ph+JuFs40Cc
	FPXUW0B87HDMPPXAgr/npceF5VIK71nGm7taXVa00EA==
X-Gm-Gg: ASbGncuYNi1XPRyv6a7oU04T8pDykGB0FVgQR/m2aYSaISPIio2R2CCZjrzOSpBn5mM
	kUe2VXzCYiRypJsscm9XUnrYl8LmFjsmwqv9qOhUW2TwWzN3puVWx5MHHAp1QmNgnUmiL9wavHt
	3n5INanSq0wVOqACsZFS24qhrdX5etKfsJ7PF2PwuC5b8=
X-Google-Smtp-Source: AGHT+IE7ZhidhDycmbWSPBv1SXukyv4UOsTnptIV0NVFDdvfjdJisylDEZywOQMLRXTZuVgtEJHSpJFFFA3MmjtlJ4s=
X-Received: by 2002:a05:6512:3b9d:b0:553:358e:72a8 with SMTP id
 2adb3069b0e04-554fdd5d263mr47305e87.38.1750794699262; Tue, 24 Jun 2025
 12:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:51:27 +0200
X-Gm-Features: AX0GCFuix9QqcfdydgWIF-t3O-vbnn63nX5F5wQyNw4KZuxuAr9t5L-dWlGRbto
Message-ID: <CACRpkdYdZQ4rKXPbiUve4n-p6q+HG4QS_oFkY1JDkJeqP4mZwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_125141_499513_BDA4FC98 
X-CRM114-Status: GOOD (  18.87  )
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

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
>
> Let's work towards moving them out of struct gpio_chip and into their
> own struct gpio_generic_chip. Doing this in a single series would
> require some ~40 commits which is way too many to review at a time.
> There are also users of gpio-mmio under drivers/pinctrl/ and
> drivers/mfd/ which would require cross-subsystem merges. I think it's
> better to do this in stages over 3 release cycles. This series adds a
> new API for gpio-mmio users, hiding the implementation details and
> converts the first set of GPIO drivers. Once upstream, we'll convert all
> remaining users and once that's done, we'll move all the
> gpio-mmio-specific fields to the new structure, convert the internals to
> using them and remove bgpio_init(). The last step will be done in a
> backward-compatible way, not affecting the users.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm in. And I know you will push through with it as well.
Patch 1/8 looks like a dream, approved.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

