Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C733CF2599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=; b=CrBKWHzAFYZjJKavhLti14qEWF
	bVZ0siE3S6HAfOClUp1krewKa9qsyuTculNZvoJUW/0KU7+hckYQftZzJelgktB05Xj0qWCglKA+X
	z4lZyZHhe0DA1ech60+s4qqDVZ+zvIPd26tIeLu3AYG69IvraFW93Xl54dQt8m4JMnkV4HpO+RTCp
	pPn9w6TTEUUS8jfIbqPJbejM72VkV419dHDhGjBfzIq7ZxWyNUo6EEAN7b9/tFFOW9Ny+bsDf6PWK
	TP3cVVUAMgwxHkCONkdtFFYG/RD//f+09V2pqRJjBQgWC05aN4asPqL1W8q1B3H2zHWGW0p9MjOL0
	4K7Qm8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLd8N-00000002kmb-2yZ3;
	Wed, 19 Nov 2025 08:01:47 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLd8L-00000002kmE-0w4M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:01:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b72bf7e703fso1038883366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763539303; x=1764144103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=;
        b=JyPBqFQ9mGfXM6lKli6x1G4FY7/wZRCn4Vv/7ttNuyej7sAVFUnz86iEZyr9GIEXpa
         S013XsBygS/An1whkDdb2PnwJJhD7gy6Z/NzLQ5XIf5eXLhCsFUBTQKNMcEjQQZ+ZLxY
         Ovg7LOPUkXVfAD1BRbH9XOTIhw6GfeI1kpa+poHWwm+Qlojvj9+JMruj+zXaiGUJVKnm
         YyuZEvSVOsYyFZumVCsS8qRc5CvH3uUm1ESZhHH94XJ+yrySZmX23Qr3xgcZ+3+6e3ME
         vA2I37hUv/ONvGDztw95Ll+tZwuqLavIPrnzasapC/hqpo142OIeedxY/vukAg62FpiU
         4cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539303; x=1764144103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AheCr9rr/sxkXy+oeczaUi7thIoHaJwOb9+DkTPHTDg=;
        b=HqUsy407UkmQl9CaBrbGOe0MfNLe7909hgwVBqv1AhyzuAlN/HE5vDopMtaWbvmvOE
         /r/nCS6cfXWwa/o6M+eHppA+FXom+bONyskO1OvnsGj+hUPV28ch8fLp4C5Vun+b8pwg
         SPvRyKXk/n5mew4rN/g8WulGdb10qZOqApB+weApAD8mDYOEyrVknxwkEyET/u7GZtul
         7vPI0Ci1BJhQpLxgK8EWgrSeH9fAq8o9zfHG6OofBJo7z88mv3zNS5h5nAr++4fK9N9h
         GgOglwC9DVegfllhBDBXpd1aImjuubwNi/zym47+iPGFoj6SFavyfmYbaLqQdru3gi10
         TeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7pe7Z9zXAOwTGzAudnS67NsM5oxRiND07UFEQNDk34g4s0bSfO0WwU9Eq/Pgk/4xT5wz9NrJgEVM7v7FJSZ2i@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaix/xUn4xCleKIZnwDFSXvZiDXdS3meFs3XdBpGeiTbj1crlx
	1GZqFFUr+vXFqCNbiPXhqv5bxgB5VzUkNP0ig1Ma0F0UCN7ZroSud+yKv9iHjwzw4jauX6nuvPt
	ZFLxdUYgCneEID510+XBukoflaHvoBBY=
X-Gm-Gg: ASbGncvg23yvwBYxOGS6xD9hhVDq87VsjZhJJ3/hPCs3OKz+4R9tqxzNbmALMiy4Raj
	gz9G7IAQbBTRt8GRjC7vMPZe6deu8ZDxwaxQpL3YVYaEe8LuKuFGdgAQMF8CSPfvOXdQRRkjBrn
	EHeHgTfJms54Rssx9w6hh5xdvtIrbSYOb5GD3R6xtG7mDXMtmwI2ftx2ZYo1XIz6hRSBHWcBwr2
	UhuLW/1xn6iLILl9QDgT4NoTjj6Z82VvAgfz0mgumAB9V+/LC44Ac6jMg15/CUeWpPwgUqQcfWZ
	ytprJ4wfSQ5pDhZP3hQX5YaVmFOsSdoqiCLJ/Fj/H+s/mKThTIadVWgJCAYtyDNMLaohgZAqfIV
	X/v15QvR9ChDZesyjuA==
X-Google-Smtp-Source: AGHT+IH9RLmrudJYiFQxGBpWdalp0RNvdPE1jKRqx1L9zjBC+zs6TZNN0Aq/tWyMeDQCJfcJOrE+KpnLw+AjClRbY58=
X-Received: by 2002:a17:907:d09:b0:b73:4816:7494 with SMTP id
 a640c23a62f3a-b7367868812mr1750251666b.8.1763539302927; Wed, 19 Nov 2025
 00:01:42 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 10:01:06 +0200
X-Gm-Features: AWmQ_bnZWE45z8dq-W-vFJmONbGs-165GBHB7vG7G8yZKHS0TzpNGV8dz1PBcfU
Message-ID: <CAHp75Vd56XYo6PgoJWeUcH328uD2svUCBX7SWT_WUZEH2AvoDw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251119_000145_285688_0BBB4E4C 
X-CRM114-Status: GOOD (  32.52  )
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

On Wed, Nov 19, 2025 at 1:24=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:

...

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
>
> Fantastic solution to a lack of GPIO lines.

I feel a poster "SARCASM" behind this line :-)
That's what happened when old-school (in a bad term) HW engineers who
try to enforce their experience on the modern SoC-based platforms that
run GP OSes in multi-tasking, multi-user manner.

> This reminds me of the Amiga 500 power LED which was connected
> to a GPIO which was cleverly also reused to control the audio filter,
> with the effect that when you turned off the audio filter the power LED
> went out and music toggling the filter off/on for effects would also
> give you an incidental stroboscope.
>
> > If you have any idea how to handle this, feel free to reply ;-)
>
> Isn't it pretty clear from the system-level DTS how the line
> is used?
>
> If it is connected to a gpio key it gets assigned for that usecase
> and handled by that driver and if it is connected to a gpio LED
> it is handled by that driver.
>
> For the input usecase the status of the LED is a byproduct and
> should not reflect in software I think. It surely should not be
> controllable and possible to set into output mode because
> that sounds like a recipe for HW damage if you drive it
> actively high and press the key at the same time.
>
> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

This is my understanding as well.

--=20
With Best Regards,
Andy Shevchenko

