Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D827DC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=; b=zEaPHSMKNqPUsDUTOEJtUexrXh
	WGAFGb5+swuGnk0iTguPWk7iQhWOkDEPIF9nGQqFkw1cjyQnZEikJIPZxls0syUm6B93ErXkkxq9m
	FNAgTOgClBFUk3UPJDFKCy0RhuMmsj5M7TWho8wKT9a62h8j5WkPTw2ENzecLO0B2c6mSZnC2HriC
	DN1HkTyLTTahlOWr9n5mcK5DQ3SgCJ0GUQEFTnsXifploSo0chmBjeCWSQtOTtnrPAu4RcODN8w9n
	ULh3YJBxs1zv+Qs4zPJyqJ8E+cMRJQ0BB+dqsybDwkLdQmyNVnPkon0gEecX3LhsyZ07psxtsn7sx
	ZSPoyXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULVW-00000007xPw-04Lh;
	Wed, 25 Jun 2025 08:29:26 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKfA-00000007pkt-3NEM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 07:35:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ade58ef47c0so129570566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750836918; x=1751441718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=JN0gvHrK08EkVjO1eewpYyy7x2wcCgK3Ma1DwRlsZcrTAm7jMSbUzvFIl+xzXcX2MU
         4Qk6MEWH21vPAuR52Pr/aqE7hXir7+F2/d59isB02/W/oKni/0o3nRkan5To/+YI5rHN
         BOkarMXRyb28Sw1/qI8rxb8YZBteUcmu90Rsj1EnFw5IyCjEM34AQzskGpEGjz1/Juvb
         xPwgzILWR4KM+UgCjHESnz9EDcSWdz6F77PSnuWBWiGiWXZxbsbFvq+FJAoYyOgfd+Or
         6jgidqN1jg7jj9d96y0X/xg+QU5ZDqitMwwV92Fuq/WLNiGt/Z1Nves/4aH/EQkl/ZJV
         G5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836918; x=1751441718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=floPmfPRChS9jLGlHHh+H7GdIohxItr9hA3JJ/lTJglJf33vqh/Fdq2K8MXUgdeqtN
         avMEzm7btJ+1mSDnb9s3cQr9Em3nSgF1QNpKl+RWMtMhfE4oT1l288N7PJrCGhuujkvi
         LD9mqu5I1OZstGOMdwUbZB6lRlL2zZQlfx1gd596iasUw2xqlbzhhZ/4J8u4h+Ucbive
         purma8ocCjG+hYZHf5Ye9tCsGoV270+rQ2SixLElhp1RUmHI5QtdOKxZvsEgaFNszqzi
         ssWelaBJx0hJ6G9UIaKMn9HdKLFITW01cQ/eCeWTPI6U9wz7dcsuSNUPlijaYqzCbBZ+
         dyYA==
X-Forwarded-Encrypted: i=1; AJvYcCXg/ZGV+kgM7eguN6RDJH2kQVlSapjMTykzpxoenjZrTggqgZOLGguZTGg/xeC5wKqZMAIBfWhBqmJKMUCVksEy@lists.infradead.org
X-Gm-Message-State: AOJu0YwMu8VfhvzmQER6lfoiZCrarbnzjn+FPeVgZu7cXX2mu7Sq+qMN
	NMCkEeCeLqbw3fCbsQEZShUCkUA+n0XuQTQIa1m59g7njQBHGeGRFLyo4jgr5MME4zBfT5Q4YEi
	EYkAI/n0NUmsg9+OehhCoprU/ICB8Wbwo+fn0jsh7QQ==
X-Gm-Gg: ASbGnctkJOu+5nKygdjgR/+zQU1/G4TGVnE2bhBxAQRdPVmVdjW6bA/GnBuhKDTolVO
	uez1ZhYuEJ3e5gwsyeOrwoITEVzECMCsS3+/Fl3Zsen7RSXatp8nRRPIuTI3aDIk843Rd8YRKue
	yjXeQ9Vmd8zOatlutiLAaTbo4zinUDk1R+O9RNZLxFnWtVwhd3pHGqNfml+J04EMMF2SjfrJI1P
	dY=
X-Google-Smtp-Source: AGHT+IEyXKWCmKWZPw2kgX0twR9fcnM1z7nFPYHArFddxW4orcOtG+t3XPYgPsMNGRzQt/Onxf6tBPeKruUlJC8wqdE=
X-Received: by 2002:a17:907:7215:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ae0c06af8f0mr172746266b.10.1750836918190; Wed, 25 Jun 2025
 00:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
In-Reply-To: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 25 Jun 2025 09:35:07 +0200
X-Gm-Features: AX0GCFtyVKN-DtXqrWSfe49kFtB1susJDcQJSJJYWx2PpacFz_0klmfgmBsfOl0
Message-ID: <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003520_857145_FE4042B6 
X-CRM114-Status: GOOD (  22.07  )
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

On Tue, 24 Jun 2025 at 21:44, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> > module, let's add support for getting the relevant values from generic
> > device properties. "label" is a semi-standardized property in some GPIO
> > drivers so let's go with it. There's no standard "base" property, so
> > let's use the name "gpio-mmio,base" to tie it to this driver
> > specifically. The number of GPIOs will be retrieved using
> > gpiochip_get_ngpios() so there's no need to look it up in the software
> > node.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This works for me.
> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
> property all of a sudden just because it now exists as a device
> property though... I kind of wish we had a way to opt out of exposing
> this to all the sub-property paths. But it seems tiresome, so:
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

That's not a problem - this property is not in any DT bindings and as
such is not an allowed property in DT sources. For out-of-tree DTs? We
don't care about those.

Bartosz

