Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DBBC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=; b=ZgVlWLjfW9WGOXk5z2H9rM+a/k
	3H3vRMNyRski9SCAcoCHSZ+fjLfZDf+5KFGB3m1/M3WRhLLfoo4WDzp3cavq7RtiP1m24iqebsQ9r
	56t8ZxMVZ+PM5af2w39jXvgEG8pgmdnBfSIG3HcELzF/XyEMtSYXREHMMiQNEr/ZqbpwnoyVi/bH2
	VyLgVjBphr34/Z7ItWICJxyaqki5SgN3LtUueHTYf92JbIO30h3a8Aw3wZd18mDYFwic2gXY0voXW
	dFM+NP1dwpQKGMfLPMJ7cEzj8BiK5dP4s2eE9wLM5slCoPVQuW4HHkRbsLpt7qE23C2bU+5bKBjgK
	5FhFT+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpLR-0000000CRXG-0x3s;
	Tue, 13 May 2025 13:06:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpJK-0000000CREW-24sr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:04:43 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54298ec925bso8061618e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141480; x=1747746280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=lSvtTFcOwlI0zlW9J9loKpGDj4Z7m+ZXaIFTpnKewTKSzZ+STtjawek/1pzZmTSwKL
         cRSKHqYdO+lP8mgqSpqWnsMOpSTThSM0zwnK2u7h37oDuqr3saobd3QBGWETAM0ezfC6
         q68m1shr6ZN4ep5xb+qrIgmRyi0zJKq/3x15y8YYeK63cc4Hm7E47nh1m0KxXuOvVHt4
         OvsbEjPmDy+8ZxHvQis7oPtHh8wUpfrbOsjbl2noA1qg/KVLY9BIm4EBOrb/CIWETu8r
         6ooJsZC+EZ23/AtuKmTPH8JxTeBO+2CmI4rbTWVfqrafjUwC27u5goWceUCGpdQvljDm
         RZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141480; x=1747746280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=TC6QPjzi2JYOeRpc9NOD3hTp4F4t7Rt3D2EFE5dXLotJZugPSYGqeP1O9K49x2tB8E
         01u3p8ZzjrPJPI5R0iccH8o1SjBOlKHngWyCjE81PKAk9VH34ix+9RxrTS8EzDthCNuS
         2iiabKfFPDJrnMNXZQ2T37zzDCxzDO+Fu6NNfQSu6hXpKcTGJlhbfOFgOL6bqYDIn2qn
         lWlyMlCsvk/hkVsjovgpOgRMgbbakVH70P5StigO3knJMgicl5YrWOWmb2JWlnPty6cn
         zBWwvDsJ+FkIy8guopTZ7JSIi/8GAIEvq6daHmTj+ndg/J101drB1UAC8iJLAMCq9MFJ
         cowA==
X-Forwarded-Encrypted: i=1; AJvYcCVeQ39XeHnxuu6h7Qllns2O7mEZX4VDLc+oYkojn5u5JoJLJb/FK6Oq4c+6j+fdOq5a3DuwFcIl4JWUhUZw6gD8@lists.infradead.org
X-Gm-Message-State: AOJu0YyiUnmhIQ1eCK6nbIZuoopftIvh/H+ggVuqlIruOevxSN2+V/Nr
	h8mrA3YQDn4ZS5H4+xIizQAS1KQVGVR3ApxHSFK9PLwBgd4whVkqsdKKQQQyN4mh4b+oNv4yV3r
	ecdg55V++IOepbXz0gW+sLTDgVBrBAT7VGzgmeA==
X-Gm-Gg: ASbGncvBmP9vnXilVsD4bNmB3qwH28CV3ctmFWJR3l2Q84GfX0FaGPHLtReGgk2zD+6
	2myGxCmgF4qbR+xzTrgtL5dfjN/hHSeo7luc2KwWQU2vHKczzji4GRpBz7YmwOz+kwa/TGiR4ou
	lxbpXnGG9WfL5Izi3eAClyTMuME0FtKdF1Vt01A8jNnRA=
X-Google-Smtp-Source: AGHT+IHvP0gooDDmu568VdD7x6FFv8psYcJXM3XY47vCtvEw04TEGbdJAZqsD4ocAj63/kyy4PnOyiTDBOr/SlE5CrE=
X-Received: by 2002:a05:6512:608b:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-54fc67b5d02mr7159396e87.13.1747141479717; Tue, 13 May 2025
 06:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:04:28 +0200
X-Gm-Features: AX0GCFt0sjPwjvA5EozAKBAvIh0YXGHalZHBo5O9eCpuXVR3ChNSqR-rASM-_dk
Message-ID: <CACRpkdaBrxwWd4JPAJCZRj1Ov8a_6U+idGzi2pnEr4MJ0Eyf2Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_060442_545747_50B5C56B 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, May 7, 2025 at 3:07=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:

> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
>
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
>
> Yet, the warning is annoying and has resulted in many rejected attempts
> to remove it over the years[1][2][3].
>
> As the i.MX GPIO driver is device tree only, GPIO_SYSFS is the only
> consumer of the deterministic GPIO numbering. Let's therefore restrict th=
e
> static base and the warning that comes with it to configurations
> with CONFIG_GPIO_SYSFS enabled.
>
> [1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@=
amarulasolutions.com/
> [2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.c=
om/
> [3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu=
@leica-geosystems.com/
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Well that is an interesting way to do it. OK I guess!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

