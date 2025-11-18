Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E549CF2561
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=; b=imSUevGTvZ22cYg1KbQYo36v90
	VfKV1Cp4iuQCJ6rGGhTAx5Omsh3tnsOLhD3zPVNGThpxmez6aZ8dTtVVGLLaa2pnFRIG6MhOxNMx0
	ji15492N7SDuYrXB78EFhmeu0/UzfIhTxPXH4+hxXqVAYEXWYMJKofiPxGNz8aub0A6aE6eJVCzWy
	na0+MLnmmW4mooUmnMyC8dBjc4Jxy2GhAfu20S6CGo8xDQUEOPsW6ja3uutHMIhy8p/Fc5+9+g+6L
	a36Hg3GouoxLzFHgjWjgI3VEBioDNnGF72etqdtxpcGfKIV1VknQ/rSm4Ndln57y9FcJEJ18q9DPS
	7L4vCExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLV3T-00000001ERP-1pdd;
	Tue, 18 Nov 2025 23:24:11 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLV3R-00000001ER1-2Ca4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:24:10 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7895017c722so28751517b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 15:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763508248; x=1764113048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=;
        b=QEUswnAxrcCJrytI755T+rLkpDoYqvM5tJlHmZ/3bUaF9fvwiHG0tsIb4ClHtCZxit
         y+eC/4khwmxgESi1fnz7HXQLpzZ+qDYRz691XCQmeyJrZq4dJ9yk+JnXQsxySA7WTSf3
         0jR1wFT8yNsG6sq69B5ah+MPkfYVkPyRfUNG4LN+GJbIz9mdyNizuHG4Lrl43GqSTaw6
         BFrfv4K1XVi5p+sfDHXkmeGY3WyJnInlKlMqu8fdTYY6jSPDuRTDfEqx8+z89kNqbxYT
         vO7L3vsEWZJySrD8ah7uUKpm8kA1urgYkd8Fb+IpcTdI2EsSEqfphCHCya3w1zzVtQ5t
         A9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508248; x=1764113048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=;
        b=JkmmhxfLGn+Svfmx2PDFhqlgceyHcvDQCMxlV8h+B+SRAIG8AbTcrKSktlWsZuPV10
         iuY8Md2qWWx4Om+CsdE6w5DNU/dzbcpVjpzlIc4b6aFxOVUMX/KPFbhkItHeDGQQM7Fi
         /jVJiamrMtMUT7ci/ZtDfWSF9jDxOqKttLUua8VTbSI83J4BMtbwgv40acQDlTuDjDuc
         fX9RMI8Jh+27NC6ukMuC7Niwzt8uLOS9/Ud6xYOaR4PWWgggdgaz1qkbVDLslfYU3c9M
         Kyc6ag3/hZfFa94ITomRkjnXZdUgW0MlaOpqdDPIFnxyLrOiP55Aab+VtJEUtFRXHSkF
         Lvkg==
X-Forwarded-Encrypted: i=1; AJvYcCVvK6QmylBpOBiN4YLc6hQoLbSAOBoDxJIL0ep6Uscq/3ghoc74G/ZhpZhCqmWolscV8H/HjPafSeKKwdoHOxFX@lists.infradead.org
X-Gm-Message-State: AOJu0YxVQH9u8lkY0EwIa2AJr6W22qD06nHEn2UBsIx7tNF+x/GKInVU
	L3N7sMBN+48tRGCbfVrv+7CJ7e0R/xWCB/bXlZja8lyL7MC77AQ5A4dt7tWvjMiAjQBWyBx/q0B
	X4kVyRj7ljz4s841fGqyGMG4wS+GR+U+Uot6dgigOSg==
X-Gm-Gg: ASbGncstJJxf0gta0YA4PcS5Gb94Vmrv8yzu4O5sbAmcrxX3BvxofxbkAN/KRlphhrx
	6rnOZ/RpZFXPctDWgXmbHdcSGteRmWAOpktNDhq8SXCETH1IFhagCKR6d7/l20UKWNGIvHxczM2
	7XMI0Mi8wl3kRz3RYNwkUbF3CEKOnz+3m/c9fIouo0Rg3yuSvixfZN6UZzNFv2SF4ByYMIvb2Ic
	Ek3Asdwl+9oBkSWdbYW711ySf0Aiy+CPkkA7PUKjd4r7G0flEcJXz3Ph1VKTb93HueeXaqzlkYc
	kJuafg==
X-Google-Smtp-Source: AGHT+IFyBO03TJnQUlzqci/5MJ4HTgz/fgmqOzYPPzLJFMjECkvojkE8ZLq0wzXV0U24gpbvqdWxMWsnSwsdREunK9g=
X-Received: by 2002:a05:690c:6706:b0:787:e9bc:fad4 with SMTP id
 00721157ae682-78929eed6camr148903037b3.46.1763508248199; Tue, 18 Nov 2025
 15:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:23:53 +0100
X-Gm-Features: AWmQ_bk2_VJnze8bWKsmcQjt5Ax-Z34cI2HnH2M84uK1kPWn1ddtleYK9nAAhL4
Message-ID: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251118_152409_615245_7C048B24 
X-CRM114-Status: GOOD (  22.20  )
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

On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> We have a long-standing use-case on various Renesas R-Car Gen3 boards
> (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> key switches.  Basically, the GPIO is connected to:
>   1. A key switch connecting to GND when closed, with pull-up.
>   2. The gate of an N-channel MOSFET, turning on an LED when driven
>      high.
>
> Hence:
>   - In output mode, the LED can be controlled freely,
>   - In input mode, the LED is on, unless the key is pressed,
>   - Hence the switch state can only be read when the LED is turned on.

Fantastic solution to a lack of GPIO lines.

This reminds me of the Amiga 500 power LED which was connected
to a GPIO which was cleverly also reused to control the audio filter,
with the effect that when you turned off the audio filter the power LED
went out and music toggling the filter off/on for effects would also
give you an incidental stroboscope.

> If you have any idea how to handle this, feel free to reply ;-)

Isn't it pretty clear from the system-level DTS how the line
is used?

If it is connected to a gpio key it gets assigned for that usecase
and handled by that driver and if it is connected to a gpio LED
it is handled by that driver.

For the input usecase the status of the LED is a byproduct and
should not reflect in software I think. It surely should not be
controllable and possible to set into output mode because
that sounds like a recipe for HW damage if you drive it
actively high and press the key at the same time.

gpio_keys {
    compatible =3D "gpio-keys";

    button-ok {
        gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
    };
};

Yours,
Linus Walleij

