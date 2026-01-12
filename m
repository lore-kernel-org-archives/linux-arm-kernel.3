Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74272CF45A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwQEbtswObKKVraQKvQaR/3+rbt3A2+8t9J7vUhV2P8=; b=1X26Sv8UvPH6/Yv7expUo/Qzv1
	Krh0ZIxJxlMs00dAGynibxVSd010NM+4/mX063GpkRyA+eW7OkktRNS5GAsl3QrQhVqO9obO1tgAO
	eCl85+yVaCH3fBYsxlMp5FXh11EN8Lw2Q9iiFbFAW/L0G94Jl4kxA38V//VC0Yxyd26VM6u3UHc7j
	xJCB1ayv9yDB0koNuXymYJ6PD6rU8VFsEWKp6QrQ280qwEO3qU6HoQYtpE9fJjpiJlrDdtysz/BsW
	1y5/3iLTkel2cDYtmebPIjtOVKWKm6HEOXh5YvH/uitN2sQ6dBs+NdintzgjkkbT3EaVNYQcsNZYL
	j0ki+Dtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKwj-00000005jrB-2Her;
	Mon, 12 Jan 2026 16:39:13 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKwf-00000005jpp-3fT7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:39:11 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ed09471ab9so1737165137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 08:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235948; x=1768840748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwQEbtswObKKVraQKvQaR/3+rbt3A2+8t9J7vUhV2P8=;
        b=rFZ3aQ9KRpJy3CixLTn6opU/wmhOb/J38TCpoIhGH9OWt1PO4t7EtQ2IqWpjLM3bVP
         S0Iao0K+Z76hdcC5Kh+xHRZgyNqHxUOiVJYow7EPUld1j61urAuyUcNo1jGDwoTNtipa
         6rUMAY8hzmNA0JWA3GBSuRX2ZBF3+Z4rwW1UEqCOSJc653OMf4gaLT/LafkN0xepdayX
         4fPn+OKACuP4mc8orjfwre49f43woaIwW1XiKBQ+e3sgmYd3RxSJ2vPMgRHevINSNZYE
         HTrp1Jb1XyNNpnhx1MBmyppmVJwrWPk+isPjsYp3AjAOwOH5U3FmPhfZ4P1m+jqY9+5v
         ToPA==
X-Forwarded-Encrypted: i=1; AJvYcCWP8se7HgPOcrTpUffPQ8fbY/eoocSkfs5WGVqynFmuzmqMsiL+jjex31nme5jrwAgmb785t7ka/oNtKqifeTHw@lists.infradead.org
X-Gm-Message-State: AOJu0YxjVO1xw6BBALtFdfX3LXAYIaS0yy2FtuaVZM4fAsnkQ6w5xofI
	wJZN/rb00r4X7CP73fNMDaTAuYmPkM1Yo5ejh1T/zwX+R5+3QTbR4pqjv7A8jkiO
X-Gm-Gg: AY/fxX792RDKPeRmv4w8IHbQFqrJC9orkrjUJM7bYlv5/jiapPRwX7hFzKaiNDZ/Yet
	sUxWJrH+BA9PF+QqEQCOg5+9h2iRUEXHY05J8ES5Pv9iEA6Cp9npoZIm8Ja0zhbUVJ0auyz6Lxn
	z6UO1DbqhZIIhi7zI7SgK2JXx0V35jVZkPZjwReyPclvTQyX6nedKnFTtYd5AHKve0FnOn70huq
	lxZiGVuo9PkQaA9H7ysOZRX5esN4nI7MXJu3Gk1MYreWcKfssL6whZU8SdWp4c4zlb7rL3jOxUb
	SruStYXa4xn/nFSzcfiFkrPKH38TrB0HHlh1t543JrezUJsju6nWER+0LlaiDFNyX3cJ2wiCSN9
	tQYiYB5ekMy39nc1nbGlWdiENciOV/tVCsSqT0kpL0Q3da3VIVhw8PNt2ezNqizkDiLTxvQoBja
	HcOArCJxld0g97k9JCwkovwxJE2D/WqEPHEDCZtvtf9AEQzwDP
X-Google-Smtp-Source: AGHT+IGaR93QXoKLXadbWipgtXCY7F0vjYznX8X5ESpJ5oBurlZRSJ7IMC6t7aW1s1ax/PYDwDybBA==
X-Received: by 2002:a05:6102:948:b0:5f1:53ba:bf05 with SMTP id ada2fe7eead31-5f153bac41bmr1254253137.16.1768235947710;
        Mon, 12 Jan 2026 08:39:07 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1578d3887sm2646121137.14.2026.01.12.08.39.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:39:07 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5eef115c7d8so1271346137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 08:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlJjlmLf7u5DVpyb1xFfwdAMVNIoZR2khh/iyW6X0PbM5saOKyq392OTgwXvd5IKZILmYS3/PhK8+UeoX1hUs+@lists.infradead.org
X-Received: by 2002:a05:6102:cc8:b0:5dd:a616:69fc with SMTP id
 ada2fe7eead31-5ecb5ccf089mr5406109137.9.1768235947165; Mon, 12 Jan 2026
 08:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20260112153255.795553-1-arnd@kernel.org> <20260112153255.795553-2-arnd@kernel.org>
In-Reply-To: <20260112153255.795553-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 17:38:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV91autCQvYmqBfQqTbGXRJN4_Qvg9gbrExXxP=KDuGYA@mail.gmail.com>
X-Gm-Features: AZwV_Qgo8GK0GmcM1_4lK01dOThbWZHequguqB6ZSDvB8kICyDbgd6OIA8W4fK4
Message-ID: <CAMuHMdV91autCQvYmqBfQqTbGXRJN4_Qvg9gbrExXxP=KDuGYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: defconfig: turn off CONFIG_EXPERT
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_083909_918343_FE9E12AC 
X-CRM114-Status: GOOD (  32.02  )
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

Hi Arnd,

On Mon, 12 Jan 2026 at 16:35, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Since multi_v7_defconfig is meant to be the generic defconfig, many
> users are not going to be experts and it is counterintuitive to have
> CONFIG_EXPERT enabled.
>
> This change has a couple of side-effects:
>
>  - CONFIG_NAMESPACES is enabled by default. This adds about 0.2% of
>   .text, but is already enabled in many board specific configs, and
>    apparently a requirement for systemd, so this seems like a useful
>    change.
>
>  - CONFIG_DEBUG_MEMORY_INIT is enabled now, adding a tiny bit
>    of code in the inittext section
>
>  - CONFIG_RFKILL, CONFIG_MEDIA_SUPPORT_FILTER and various CONFIG_HID
>    driver defaults change, so these have to be listed explicitly to
>    maintain the previous behavior
>
>  - CONFIG_SERIAL_SH_SCI_NR_UARTS=20 changes to the default value
>    of 18, which I understand to be sufficient for any buard, even

board

>    if all UARTS are enabled at the same time
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig

> @@ -859,6 +857,18 @@ CONFIG_SND_SOC_WM8960=m
>  CONFIG_SND_SOC_WM8962=m
>  CONFIG_SND_SOC_WM8978=m
>  CONFIG_SND_AUDIO_GRAPH_CARD=m
> +# CONFIG_HID_A4TECH is not set
> +# CONFIG_HID_APPLE is not set
> +# CONFIG_HID_BELKIN is not set
> +# CONFIG_HID_CHERRY is not set
> +# CONFIG_HID_CHICONY is not set
> +# CONFIG_HID_CYPRESS is not set
> +# CONFIG_HID_EZKEY is not set
> +# CONFIG_HID_ITE is not set
> +# CONFIG_HID_KENSINGTON is not set
> +# CONFIG_HID_REDRAGON is not set
> +# CONFIG_HID_MICROSOFT is not set
> +# CONFIG_HID_MONTEREY is not set
>  CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y

I guess these should be dropped, and the Kconfig logic fixed instead?
The current "default !EXPERT" makes them default to "y", while we
probably want to default to "m" when module support is enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

