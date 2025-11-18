Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C13CEDD86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=; b=2f41KJ/mvwqUz9IzAgkYiV4h5m
	YqeJH4wBqrHh33Ted2JhueSx69qWEkVoHOeeI4NOQX3BVUv+UWcj748cldh3Ci1Lr+jHKHfw/CtAv
	fWSWoigBIpQH2z+Fq+uzbkM2pk/FEe80D7qNv+7Tchhihd9plub4kx1GPMPIKox8sIVR9slnxKXUZ
	TfAc5bRhZVihO6zqixrgAzjlv6APJXapE9SAdhqzIOsikUpXY5Memumo7YyHOO2xabV2jqgetx+S8
	yBi3wzAKRsYWOwD19oAKg0YdQlyXd0nTCxLw+JAoCCl33W8c1epVF5FPx8cgyf6Gidpq9yk7LzA17
	3sUH8R5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLeW-00000000Svc-1u5U;
	Tue, 18 Nov 2025 13:21:48 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLeT-00000000Suj-2aUu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:21:47 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-594516d941cso5096011e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763472103; x=1764076903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=;
        b=bFumTCVPP9yyc4qB4nHfeLz5Yh/6yXXNWJLXgiy5aaRkAnjXc54V+2GCWIOlk6TwGU
         8JIFFw7n7Y4yngk7rYCBbm+HzZ7VIJnZFjLIy+m6W/crzLTTlnIder/O2XC91p+9A27b
         lHwj/vuUgTty56brr2W4tSza+jk77bBB/CJ6F9tA8iwiUyukoQ8YCYdUALpmQ9jm3xc5
         tWnwNXLXxPt7Ritvv/ZcIopO8X5cf7OKsHfd2UB7hyvavShR/no3FYitlHocIwuF9D9M
         mG4SAoOKQhnRv+2kdEiGGdVkjlA6k+coiUJ6BExmakXiv2HsJWo4/ZyrzjWiki/T0L1t
         dtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472103; x=1764076903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=;
        b=t+rFV6CCnuI01XnccuIkpU9EyqzTtmZIm9sBgE+6WUiYhQxJ2R6ZCMqrs5R0Db1lDq
         R42Vm7s5dfuYK1YtSwW5taXkd45k1W1W/bOxQlKMq11Pn92qe8RcObF8KachayMMdy//
         SuzhyPo/9Ke5kApwPQoui/T2n1nyZ4gOpJ+AISBMgGeQm3nG8PeYCFaeZD2wQ5Mp17+y
         v/69aE1TvfNxL/n7JVXEMIIgcCLbu0Eu0nOYSljwEyPEpx2EhGslzVXyjcg3+b6B5l0E
         UeHm6GzqOfZVJIjDooRhOO0ERHINkRcQuE/9geCTyAQ7okJIo23LJfx0UI+H2GvpxfJP
         HYnA==
X-Forwarded-Encrypted: i=1; AJvYcCVM08q7CgcAUcmi0yeOrI7G9l6cpfKW38mogQnPob6/vHL4urjmyurPBCM3jWQZ7Xv7ZrDZlri/Yx959msHaxdD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv+4HUuekZFVemZdaxFjAWilZpRQuCZA+wj03RYFzNN8GeSZGb
	/CDVRM12vOPL0kdYZ+9tx39QfILN/vz3q4MgQ/1lGy+3bD65VO0i6qT133C4HEEegpYOlZa59+x
	lAG6Sp/r347CfpbOI++oAAPc3pGvdmuKFTgJLtRq5Kw==
X-Gm-Gg: ASbGncv9AMDEygfsb3EJCT9TI5yaCmgdCVVCiej1XnU3EVoxJzfItO+MxVemD8cp7XU
	NwgRT0lCKqrORLdrbLcU9YAM4laWy3txy2e2fgQnkXmVROvzJB9RnmZMxako4BevQ7xOb2rscTv
	Hc5J1TUG6sKXZbz6pTOmoFgwAK8dpve1j53FDMgsRS9H9nn91GaZ1s3lmIRnnDpEVKeg2GeXuZi
	SRu3inRvNT6LveZZuMGePemOyGN++kraEFtabKFwB1VncmZQzxnz3RA4i8dqcBZahFIWUsMABmW
	ziF8Y/fgLxXX+EOk8q6ZR0V4EQ==
X-Google-Smtp-Source: AGHT+IFLx4rEab/wbUDo4EkSCUHDw6GWYiJjtIbCHDB1xl+ZlXv5nLLQYI54hMzgwVsRu8daEpH3NSYMy9pTQDZmbZ8=
X-Received: by 2002:a05:6512:3c9e:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-595841f842bmr5089204e87.46.1763472103404; Tue, 18 Nov 2025
 05:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
 <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com> <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 14:21:29 +0100
X-Gm-Features: AWmQ_bmgN3bhvSn3FjfwQqs5x52sLWvM37dbNjtnEqn6scQIfee74Ky62f9fPdU
Message-ID: <CAMRc=Mf_j8jNMrJrnGp_bVmYQPLheE55AN4gXCtRrCDkF5CXsw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_052145_912957_8D744D9A 
X-CRM114-Status: GOOD (  28.25  )
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

On Tue, Nov 18, 2025 at 1:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> > >
> > > Thanks for your series, part of which is now present linux-next.
> > > IIUIC, this requires the direction of the GPIO to be fixed?
> > >
> > > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > > key switches.  Basically, the GPIO is connected to:
> > >   1. A key switch connecting to GND when closed, with pull-up.
> > >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> > >      high.
> > >
> > > Hence:
> > >   - In output mode, the LED can be controlled freely,
> > >   - In input mode, the LED is on, unless the key is pressed,
> > >   - Hence the switch state can only be read when the LED is turned on=
.
> > > If you have any idea how to handle this, feel free to reply ;-)
> >
> > How is this done currently? Even without this series and using the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> > direction so it's not possible for two drivers to request it as input
> > and output simultaneously. The second requester will override the
> > previous settings.
>
> We do not handle it yet:
>   - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
>     the keys (key-[a-c]),
>   - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
>     (key-1), and the others as LEDs (led[56]).
>

I see. This series cannot possibly address this. Off the top of my
head: I would create an auxiliary device binding to a dedicated driver
that would be a consumer of this pin and register a LED and an input
key. By default it would set the direction to input and if the user
decided to configure the LED, it would change direction to output.

Obviously, there would be a DR quirk to handle as we already have this
described in DT as gpio-keys on salvator.

Bartosz

