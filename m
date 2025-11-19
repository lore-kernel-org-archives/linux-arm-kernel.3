Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B12CF2597
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKBmRJ4RypI8GAVhhXpGdOuKGmWr/ovhm00lN6IEqrs=; b=ZMf/S4bhpyuE+jPJjIcSHJSN32
	1zPgTNX4OXdVLnwjgHCpktpxyMcfU0WpE1iZDJPZwR/Uw1B5gLOlGkSEoAfT3lXK3ROvyMwxSKecf
	ha1ELxZ2WRe8RrF2Fd0ijiHMrhBQGitzidUE1nry/+p6g++jU88VjHAU20ImBV/kWCB//oZcDyQrQ
	/NMoe5sDPxVdycL91t5zRnZNGkFG8/pFw9pmVfVMgKIpJd+7zalj9Q3BA94mlR2oWLnodc5TyCin5
	J9ZH1sqP14OidFcoM1TWtsOk1ToTSZq3Mm/WAFCV7fLw4NQSSkdQPDE13yZgcFOGbIVGeSFwKYrki
	8VSADAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdd8-00000002nXa-0g8a;
	Wed, 19 Nov 2025 08:33:34 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdd4-00000002nWl-3OVv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:33:32 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93729793469so3958370241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541209; x=1764146009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKBmRJ4RypI8GAVhhXpGdOuKGmWr/ovhm00lN6IEqrs=;
        b=EpujqZn02wQDQQ9bhWgF84A2CNHQ5c+dVDDJOT5OyjggH13r3rQqiUBXZYw5mzPKhU
         I3HPdbUMFwrY207TCJlKBsLmKrR4cYy1PbpKQgembkq8vqWzJHIY77MDBe9t4f3aE29m
         MhXmUpuGMSczaNegmlw94ZbHO+BsORpOsB0yaYYy/jBKFlGHLSQYzBsyMRo10hSiYYtJ
         jITm2ffA/XilK3YbFfziFdAGwi7Z/tP9q4AsGxn2sg5nZhZGl6dVhM/2kDin2d4aRvkn
         unMYhtaGCE9ml+w68Gf6W56T5+SFynK6OaC0HGlPcl9TZelACTd8O22a1a1V+gH49uF1
         PVog==
X-Forwarded-Encrypted: i=1; AJvYcCWHtJsoDBGG8L1hJ/qLltbAREQwfWU7ZfCuq43CH8ijF/llNxlRrCbbhhJw4Aj2QesQo7nQUaCsZya9tck20H+O@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu0eCSzJdjZvqR7/74nuwRoNKL03pd2n+KiI4RKrlPlv9Q7Tqu
	Ms97BHAUlFKlsxbrpo2clPHHasa0zasgU7mOxkXvoMjp8aAH+uhQhhYHRssP/DRg
X-Gm-Gg: ASbGncuDNPhk4hH3k2eHJLO6NKm/cnA7oP+Tk0SzJMRpoK/qA+jkuNQ6nCj3dfghVLV
	QZIEAEPHneu5UzUOm2HrNUafSn7z7wQADUnO2cPghNN5bvc+5xyWgE88n0R9OIWGBuIVQm/V28C
	Bl5Rm21HWUE0QiHkzgurn64PbCDzCTykg9D8WObn1MA4znnuCgdj169d7kLxuBWxmGNH5Fn6mex
	RVJza7gs2pBNnAzGELxuhsji+IDgdI0BAXPe9pyP3bQag5BU80BG3LQGjzHm3At49vghQW1Nad7
	xvA/X8Gv8+yBT0iJaPHXSn6avV/Vtx35qDrkpnzH1Gt8wuhZfMA6Wzei1odol0qGgpHvTS3Pr/A
	99fVV1L1MHOuxjWRkCvBE9clvSFvwsTWj5T3r+2gYMbPvsT58gVs6gN3v8pigfy+rm7GKB0FpOh
	CmYtvVU3enr5rkDp0Fka3wuBzBuSMZ4PU1vnRli2AB/WeFC6jPj0DmSEvlVOA=
X-Google-Smtp-Source: AGHT+IGCBwKr68Ja+LsxbFMe/eR7M4zhIle+XakwJXochJSTFQoEU/+7t9kLt0k7PHOidGmZMKbThw==
X-Received: by 2002:a05:6102:c47:b0:5db:e179:1c21 with SMTP id ada2fe7eead31-5dfc5c0488dmr6881271137.41.1763541208882;
        Wed, 19 Nov 2025 00:33:28 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93761196556sm5735244241.9.2025.11.19.00.33.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:33:27 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5e18598b9b1so1644351137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtbDXcfquQkrReDogvIzdoCtecXwlJR9DkRyuTnXYU06xmevbJ3J0aztL+l2WFoFAJZ+zuBNB++7BBrAcg66lJ@lists.infradead.org
X-Received: by 2002:a05:6102:c47:b0:5db:e179:1c21 with SMTP id
 ada2fe7eead31-5dfc5c0488dmr6881252137.41.1763541207113; Wed, 19 Nov 2025
 00:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
In-Reply-To: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
X-Gm-Features: AWmQ_bnsTpUUScnL6xOjY4S7f_b3_VnG_mVkF87eF8BY7eFC84gNc7MAR704Al0
Message-ID: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251119_003330_855412_7BB1EF1A 
X-CRM114-Status: GOOD (  37.47  )
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

Hi Linus,

On Wed, 19 Nov 2025 at 00:24, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
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

Suitable resistors are present to prevent hardware damage.

> gpio_keys {
>     compatible =3D "gpio-keys";
>
>     button-ok {
>         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
>     };
> };

But only one of the gpio-keys and gpio-leds drivers can bind to the
GPIO, or am I missing something?
So I do think I need a new combined key-and-led driver, like Bartosz
suggested:
  - When the user turns the LED on, the GPIO is switched to input mode,
    and the switch works,
  - When the user turns the LED off, the GPIO is switched to output
    and driven low, and the switch does not work.

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

