Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD93FCF34B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=; b=oUtZDDY3clXAbQABOPnS2IrsoE
	DQPDs3E3hG6CecRu/cydhaDO7wCiMrScZ3iwgpZX5OpO7opJSdNnjtreGjnVDN/EVUDjxazw19pTg
	OiuLGVoUVj925yLBGXS1so3eMpdLwjLbGeetsFm3+BU/Jn00WXQwopbeVDQdqfDjlrdCl7bVKLivw
	DcgmLOCJUaKCjIoBg7X9f/q8bmvghVA0qqHN1Ic8shlwEzLkMYk36iIOnCWJqsVcvPk/5v/pYGUnG
	or/5ggg6D49TLJbiB2QDi51XVwSgQlq9ldWhYzgo4lmegivym4oNcOPTtyOTbXAuAMdJN6k4pH23O
	egCwHRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjC3-00000003NQI-3UQ9;
	Wed, 19 Nov 2025 14:29:59 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjC1-00000003NPO-0ZIr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:29:58 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-591c9934e0cso9243470e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763562595; x=1764167395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=;
        b=TET5NL+5k6DS+ACYgQysT1IFCb307Lt5QbEIPLEScEWKUz3OLhNruy3HFtA2Ym8vHI
         dWcFvZYHukK4F/8KGGQUf+PukDmBR5r3m5HUyLSDIQTmBxMbcWQOUSD1EOA4EMQuFcaF
         mj/ypnhC32oe31c3lZrgiPMZlDABF5wunyYdC8O3m2FiNSyzDD16cVsUE+LY6tuV8N6z
         F/WJDlqnfRXVHE3YYdbY1eUbW8mxbqGg1NnF4aZauF6Ku63RReBINUG5evvq8vaU/ipy
         YTCIJcKU+mNsBSpW3wvcYu3gAEidMljlBURK8CG6LPxIfsx77PVLYJ/Kohdb7jSeUN3s
         vxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562595; x=1764167395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRrGjHpQFMPuOkiL8GvRDSi18sR5m2GVcnU67ItY1DU=;
        b=dKd5MhLrKktwQgZHRzO1UGbCFYLJV+gv2Y6VRw6LOhznp/7dSo2kFRcAYAFzX4u2T9
         Jyqg5Ouf56NnqTpNBlVpC6jez0nNY7K68RuIHO4MoGjAPq374dWJ7DA2NhNuIhUgnzAr
         g9fL/vnlnKqFIASRCbEexst950iVxtxldC9H7fgUzbKvZB9vM7qZevKumpoKZzEpfaBa
         8eUprgOviYfCihDgOXUQHjh4XWOosn2j9nDcV5ArEvvD/W0D2lSlp/MiYKWrBYzX7UsZ
         d7rgAn8Fwt/9FzgI6Wz8SCexbAdVpSy3RJGehWagepHo2Amr/I3YCF/45yyxKM8nQ2gM
         Pw/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUvmp3zyIHK4qlNzb66IZssVgK8ng1QNnf8yHHoTcdz86M6eiA7YOuO3CjjF3u39QovsTZjYiAxVoKkoUUGz0+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk7puqMfu/COYm2cogK5aVBQAxNutrDO/4uOZrn5daxB8CFVCo
	SNWDeTOQL+3SCstGUJaJa369XcGjzRhJ0XA+KFTiDeH+Dskhu0LXUrPuQOTzmLINxy8vQ8LAey3
	L6BFFIjpPC5Q6ZK74Sc5hBt/n2GVlAWu/sYtqKP3UQA==
X-Gm-Gg: ASbGncvAyF4JHlUXUhir+BGA8jP5eDGSnWeT73rDBXH4UGEoxS/lJOV5YNntnUFEpFE
	VnhqGzWGDG+kv7eRM6Q6lHXbXQ6QeIfo8zsGwYPyRTB1xPX0/AzaaKjiCQXLF49zAhUt26r8asg
	2bHlvzZhEoSyJ1YxM7E1zEz98BgFhGdeOZ5cATSJCUW+K87alInfQeKu7P3iFkcffH1yHwyxR7f
	TqhsUD215R4d1af97kSah8lpBUBA3ThWzbMp9UmOX+JycFqbgkZzIBaotPgdY/WMdw5OPs=
X-Google-Smtp-Source: AGHT+IGp7GKe1RKdp3EifTfSeaou18jsyywYSKyMxPvf6+wpNti41ngxOAgDWBsE8YIo1EJMFQbA1mHAun4y/oak87Q=
X-Received: by 2002:a05:6512:138a:b0:57d:b8a1:832b with SMTP id
 2adb3069b0e04-595841af20bmr6916107e87.24.1763562594938; Wed, 19 Nov 2025
 06:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
 <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com> <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
In-Reply-To: <CAMuHMdUe64MdRL1qPRX3q_OGj287nK=MQTb7HUta51iJ+vP9Hw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:29:43 +0100
X-Gm-Features: AWmQ_bmc-n1cuVY24_yDbxt_0pYfljkKCrIONDdezzzLDg_EEB1-VOCfHUUS2FA
Message-ID: <CACRpkdZp3zKVCeJPXJP4UCAbXz-j=81zYfXntxuBp5BK5ettzw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20251119_062957_220439_C1BF9D65 
X-CRM114-Status: GOOD (  26.51  )
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

On Wed, Nov 19, 2025 at 9:38=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > For the input usecase the status of the LED is a byproduct and
> > should not reflect in software I think. It surely should not be
> > controllable and possible to set into output mode because
> > that sounds like a recipe for HW damage if you drive it
> > actively high and press the key at the same time.
>
> Suitable resistors are present to prevent hardware damage.

Aha, clever.

> > gpio_keys {
> >     compatible =3D "gpio-keys";
> >
> >     button-ok {
> >         gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
> >     };
> > };
>
> But only one of the gpio-keys and gpio-leds drivers can bind to the
> GPIO, or am I missing something?
> So I do think I need a new combined key-and-led driver, like Bartosz
> suggested:
>   - When the user turns the LED on, the GPIO is switched to input mode,
>     and the switch works,
>   - When the user turns the LED off, the GPIO is switched to output
>     and driven low, and the switch does not work.

You will also have the byproduct that the LED being "on" in software
does not necessarily reflect the actual LED status, someone
may be pressing the key and then the LED is off even though
in sysfs it is clearly "on".

So the status in the LED classdevice also has to be forced to "off"
(brightness 0) anytime the input subsystem detects that the switch
is pressed.

It's going to be a lot of work I think, but I guess it can be done,
with a lot of special-casing and custom APIs.

Yours,
Linus Walleij

