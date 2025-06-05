Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD05FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=; b=rCPeoFWOXk4eGMdZW3+eslREAz
	CJEYFSZLzO918h9oFMjZ2WSiW7Zns2Kp0Jx8EVu/nilwp80+MUx6jKQXAPikY54v7uh+5CrX39zFG
	ngHrXcC0vez00n3SVpiAuWPJKoTCrkiVMupldju1JYwXfg5S6pmjkoldIAFd9Alj3dpqKud993kQm
	YhbIwyuBJd4Ns4upBh1oNcU6BwhtDFKFk7XHgrtJ12A0ufzEbDUI1krFsOInYVZYv5Jytpl7Uitxq
	pQ47yKwK1+AV5BIKAHUZEKXlMjwoHTCV8Ua5kmvlHcWRzkInq47GrOS8rFWHlYhOBpOXwZkHxSd3F
	Txl+4HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAeB-0000000Fdjk-3koa;
	Thu, 05 Jun 2025 13:28:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNASd-0000000Fb4s-2U5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:16:48 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5533303070cso1083072e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749129406; x=1749734206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
        b=EYtlRZJS6FK2oZNO5Ix5wwTkeQJT6SEZ8SoQ7+uOtPQP5qAxH6Csf/YdoWrp7ef/H1
         uB7iDJttGUTcuYrWRGZDsQwoURcTIxjeU0MwXSqfvWb8kmuZAnjL9cFyOZQBXVOIHr+f
         GDAhno85WizrQxTXwKIKqK7mw3KzIqr1vkMZiLnEkreWeFDWdOpjDHseGYaWbqE9rA5v
         Gu08K7GGRLq1mp4G9e81ts3mxz1DsQNWxHneb3Aq2+hMovIZ9Vb5sR3IDl8gfifcZUIV
         lxPcUP/uZ7SaWKt0p6qMCkRIdKesUCcPnMuO4hIpxMGFy8q+ytlAI5Eq/sv1QK1grv1P
         aI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129406; x=1749734206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
        b=Yy9jX0iNEhRGUIybFARigMOEyUXwDxTAb9owS1/mf8jfTOo7bjmP1WwMASJ4jEFpd+
         dBHltDvfIghXIx7H/fy+RvaReq0k+W4sLQj4KuafOdKd/mkH/qWfi9iIpXLO17l1qJg9
         dKHOQdkd0mvYB1etDWVHVKHYOaagoAl61syl04LS2pshVQvOgnOZOiUcmTKJX3+GMbA7
         s89H86NCk7haxNg6nXV+R2SUBor87Dm3n0RMr+Teu0N1g/s30VEjXUE8QHu/BF/VVYLU
         GU5bDqXDAxLAYywByAJbjq1ev8eqwz9OhUbJCmgd/wCfGfQkeYrxex4s1WbKa7Qk4NKE
         UtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOhV4MYBpFgaJMLpF0TDlcoOz9gv/DW/6XViiw7vOw+4L07uvLaV1XdwqCRU9kffe9JgzzycHBsB9DjhGJQE4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzKGFoBKaa/1Ji5FkCPtxQRatShvwWixxvhcZfq969qWWkQ+KjG
	6mneP3oX+IXNqLC4q0csPa2rER0NkzKBihYqk6SGFtN5poQQqrlv1ypwz4fm9SyeoB1gmTazQOr
	w9y9xF6ETBUQOfx/pALcj4kly2oL+zl7+u3HtYYBaFw==
X-Gm-Gg: ASbGncswO51xxiU6A5iso0C1shIeY5eViJ7raqHg75YBRGwfaW0em4hqu6U/IrrDOVY
	NdGlU0hN7YBYWvpzHdsegZCsEghzmNLVNV8HJJIy4fgWXzF8RdUjI9d/N3R6QZQjlcpQzXRiBTF
	LdHdjPUJ4l9T3CkYPCWCBCOapO8avaoDdvA0p34mPL2vZQj/t85YcaSXeeYDMbOVg=
X-Google-Smtp-Source: AGHT+IG1FLIfsa6ezMp3MccDVHC5XAJOHj0QyInfJVqCTEun1SDxwdcWFvKFJCuA2PNkGlpvqJmb88wRcDaLGqLLsh0=
X-Received: by 2002:a05:6512:10ce:b0:553:37e7:867c with SMTP id
 2adb3069b0e04-55356df2a9emr2071437e87.50.1749129405586; Thu, 05 Jun 2025
 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 15:16:34 +0200
X-Gm-Features: AX0GCFt62eNdDo8nSZ5fnuh_lgkPFAVa1oZqnviWb6rgA9ggBUhsLTEWXYkHUBU
Message-ID: <CAMRc=Mddp=rmogziQ2XrzsO-TiRh9A5U3v8UxJqz_so1otPMLw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_061647_736044_2632941E 
X-CRM114-Status: GOOD (  14.25  )
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

On Thu, Jun 5, 2025 at 3:04=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
> <clement.legoffic@foss.st.com> wrote:
>
> > Cl=C3=A9ment Le Goffic (9):
> >       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
> >       dt-bindings: pinctrl: stm32: Introduce HDP
> >       pinctrl: stm32: Introduce HDP driver
> >       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
>
> Can I apply the driver and bindings patches 1-4 separately
> from the rest of the series?
>
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
> >       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pin=
ctrl node
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2=
 board
>
> Or does it need to be merged along with these?
>

Would you mind me taking patch 1/9 through the GPIO tree as I'll have
some gpio-mmio rework going on next cycle? I will then send you an
immutable tag to pull.

Bartosz

