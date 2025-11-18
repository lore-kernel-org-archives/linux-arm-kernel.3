Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D276CED243
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMYcwyn3PU+pOgxTORp/4U9I/0iJwsVP/bkqLPdjG54=; b=4lAuZXiGqSOsR6yO9dgKrvxdkp
	TVZbSj+HemRscDXZs1yEnLiQn57WbaUchoCAEoHOHpi0w63fFDTxfYaN30UqyC2onJb9QYip7Fuil
	KsPZcnnimYUHsAsMgY4brnhb0eXTzIfpbco3c7zp5rifXAtHhYTvHdIoOrdBYUdx9Ke/EN5qQNAzM
	ZpF91YYG56QO+wTW94s7GOVRhkqSnVCtTT3nzUPYs7G3NmZiFHF3MJjHpBglz6F4rlmfsh+R/tfSp
	/zJ1cnEpoiCv+iLkVqGuKbfysAeYoDd1znHcaz42JMOej0Wh3gMOOX0XMpFEEiign6hVrcj8pb0Lf
	HXM7qNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLFk-00000000RjS-13e6;
	Tue, 18 Nov 2025 12:56:12 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLFg-00000000Rir-2mBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:56:10 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dbd1421182so4458160137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 04:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470567; x=1764075367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMYcwyn3PU+pOgxTORp/4U9I/0iJwsVP/bkqLPdjG54=;
        b=VzQcZKi0zl3dAwjn4APqoyes/cKWKDBL1Y3RN5S1OrEk9GDUIvCQq/e/owm6CIfEZc
         ZT2K00FoHAdnKwZvgEeGyEsgKPdOmmEODiW2kpir7Fsz6JoqM+W7Od8fGnl6KEJDfoHA
         JSg1AW/g0WJZh0tG1KUiz1hDyFK1kcczzh6wCGVN3LpflEW8WwgaPLmCdg0HOyyY4yjk
         Oru6imQsc2jPwt8xUXExOtmzsZ3bCKg5B8UFptuMZ73QKu2sbxbBhv8LYLN+mx4dD8IH
         p9j3DUK/FF4yf99bdO4bT4fv0ylB+q64lAdWqVdCJaIUyJO5d79fuyXJeANRQN6Xn3AN
         tV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV432/T20D91sTnp6qkpO3d35eRnJvRTFX4DF4Oskowqh//0TWV4NhXg3R0gvo5saJvuKIyhAnvq6hFnR6vGhC8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8fI0SEAeIue3MVFJZ1TPemrQyzvQegcnFwQN/Cq5HgID2x1h7
	e4wqt8OCfPtAYZKW0wL8839pOfc4al0wKz+Potjj1nY4DNZ+9D3EjM0vQjWqk/zs
X-Gm-Gg: ASbGnctrCj2xSEGDQQd4pm/ie/7HlOSy3Y65SX6Te5zqqxurgwrOUvAnrvpGZ8Hm0Oy
	XDdWtRBOM2lvfDDWsAQ10aTMML5nidnjDrV+UmwlpnwtBtrZ7Y0aXarEpbBpR77f79gIeBb8k1A
	7z4gqcoAoM6e6Qsnuw/9BOeY47pG9+zKlbioEkPS8zG42BSchjdwqOG3+VZLX70wtsF2njrqdX+
	c4i3KhkaygUx4EAfuJESd8nHholZEwiFS4fPHWO2opWz8/e5EZrp0HE7Qr3q2u1HNbFUpbZtYNs
	obh2T1uGe4YOvGC/DnG3h8jpIzCsxk8f+oKsYUEj7Pdn3bN/YXAYl9mK3VdeVWkAkowkzwQfX23
	qaGHdYx9aiUvDk44daZJt1FZEGo14ffxTCprdabPrcxFIBrjhM5CvmttN1UM5NYBvq/oLm2p6u1
	aXeJL7h4IFjyzUvxk9RNJly+pwlu6OuF7TVDdsa5CZLQGTZZQjgNiZ07SmzDI=
X-Google-Smtp-Source: AGHT+IGPhhVL0bdJT4cZUghsKRjeFet07jCYLHXVkuEXZ/2ESU6WXMOyjnoe2ECnRLYZXK6mvlNsnQ==
X-Received: by 2002:a05:6102:cd0:b0:5db:3d11:c8d3 with SMTP id ada2fe7eead31-5dfc54a1fbamr5386853137.8.1763470566963;
        Tue, 18 Nov 2025 04:56:06 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb70ea49fsm5343384137.7.2025.11.18.04.56.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:56:06 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93720298f86so3145259241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 04:56:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnzDejeaw98xbIZOUQQhZx7dPkWsydCvI3gVfbi+VQaRsOdoob6evYECWEgAzGbD7LrXgIZ6Oxt3deiXSkQ4tD@lists.infradead.org
X-Received: by 2002:a05:6102:441e:b0:5db:e0fe:985c with SMTP id
 ada2fe7eead31-5dfc54fcc32mr4842088137.10.1763470566608; Tue, 18 Nov 2025
 04:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 13:55:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
X-Gm-Features: AWmQ_bkC98gq3Hx-nk9zI-w6kSG9BC0TZLZ6VioIzu7f0ulaeAjNY59_KJ5q6hs
Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
X-CRM114-CacheID: sfid-20251118_045608_717331_FEE93367 
X-CRM114-Status: GOOD (  46.95  )
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

Hi Bartosz,

On Tue, 18 Nov 2025 at 12:55, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with wha=
t
> > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > this series however impacts Qualcomm platforms. It's a runtime depend=
ency
> > > of patches 8 and 9. Would you mind Acking it so that I can take it in=
to
> > > an immutable branch that I'll make available to Mark Brown for him to
> > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > >
> > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > resource in the kernel but there are lots of platforms on which singl=
e
> > > pin is shared by multiple devices which don't communicate so need som=
e
> > > way of properly sharing access to a GPIO. What we have now is the
> > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > doesn't do any locking or arbitration of access - it literally just h=
and
> > > the same GPIO descriptor to all interested users.
> > >
> > > The proposed solution is composed of three major parts: the high-leve=
l,
> > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > exposes a regular GPIO chip interface to consumers, a low-level share=
d
> > > GPIOLIB module that scans firmware nodes and creates auxiliary device=
s
> > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > changes that plug the former into the GPIO lookup path.
> > >
> > > The changes are implemented in a way that allows to seamlessly compil=
e
> > > out any code related to sharing GPIOs for systems that don't need it.
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > Thanks for your series, part of which is now present linux-next.
> > IIUIC, this requires the direction of the GPIO to be fixed?
> >
> > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > key switches.  Basically, the GPIO is connected to:
> >   1. A key switch connecting to GND when closed, with pull-up.
> >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> >      high.
> >
> > Hence:
> >   - In output mode, the LED can be controlled freely,
> >   - In input mode, the LED is on, unless the key is pressed,
> >   - Hence the switch state can only be read when the LED is turned on.
> > If you have any idea how to handle this, feel free to reply ;-)
>
> How is this done currently? Even without this series and using the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> direction so it's not possible for two drivers to request it as input
> and output simultaneously. The second requester will override the
> previous settings.

We do not handle it yet:
  - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
    the keys (key-[a-c]),
  - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
    (key-1), and the others as LEDs (led[56]).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

