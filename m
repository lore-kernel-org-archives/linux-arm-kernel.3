Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F709C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+sv0U2cyjukGfA/ZIjsFBOYnHcPPEH2EG7bSm4QAFU=; b=QAZBHONEhnN8RJqpbfrE3m+oet
	KVGunrpGSPEHb1xv1Md5uIFZy7aXUdOuz5MkfJGv0zP0bpm80EQMHaIHCIDSqzHYqcf6Y83XQBZ9m
	GqUhV4+ZPjC0KQjEpsbsIjRw/81Sjxu8bWIoaA5xUiFQ2dhWwkc5a3/BKvVxCEFIzbBKE086+pCxJ
	IOiVxZjlTwcPtb53W6zbL37qVLgQgJ5jQnwm0THc7n+Ql6mzKXCY63CHdT4iWdvD9OVFyQ0zeeTNA
	w2sWaLc5tZZH8itZSi1ETwNlJdfgBWeZtvEegmcGdkn5+ZeN55tPHcTWXUYLXtdhMaLZ3uD8WEKLi
	h8XPnqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiq60-0000000DxIx-1250;
	Fri, 14 Feb 2025 07:26:44 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiq4Z-0000000Dx56-0MkN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 07:25:16 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso1762799a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517913; x=1740122713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+sv0U2cyjukGfA/ZIjsFBOYnHcPPEH2EG7bSm4QAFU=;
        b=UWQF1OA2CEWT9w/knjzyn5vMiL3gCEa5wNOX8AsbFe1sszuZeXpQbgxZnQbU/3WF+C
         /RkxKqq63ZitaW+JWY6KyEPQQkqF+e6pwJyn9vjsi7uQJYBvYQweadOp0J/fQ1kwRi5V
         M8i22wRzF9XKjHoKm90NIndbYpSTEs/ZFtQPaVarinTsaBy6kPQTiGktuGuHCccb0y+W
         9d23R86WKqX9od0HFn8vMAkVPCOM3lalaFJVXvfldLS9wL3p/bI4X+wErHL78fWWgXez
         3d4DEkIkQL3qz0BbOrwEf3GZsi4BvkJ5IY85y3Y7RQwHizfDz0mwUW1h/MXc+kSXxnaT
         9NYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6OCrzv5xSIJB8vb87K4CxnNooWUh5fwWBgvwehVkkDuSNtm/6cpJ7hLMK8tubkdxoDXEIMD24I2os4rcXkLVC@lists.infradead.org
X-Gm-Message-State: AOJu0YwknE0oRYIJwq/+dRbmgwBLQGA8T2seusKRygUeHtLYAbaUg7Kk
	vbzdvRewDfxp3AcjgpiEGjWoDbScFLpUz70oOPcnSfKVwF0RVO9st2Cm6/ocHuQ=
X-Gm-Gg: ASbGncuwHt9P3dmt1wASBFAqNrAVATI1n6SXAxq+2hF9jtwb3oglOYm2/IDrPlNXBok
	8nO90/ZwcKKwzMf6OfGXIW7EWvPHycayXr4HM9eoB8ap4IG6oMkK19J2Hy4nR7HkwFxesDPhDBR
	ASunS1wiYXAGFl11zuqTDzXGJ6jsSwYaherSEJqU/uKqZyxsg2gyR19KBnYumOHY8UJhMP0Igjk
	4G0lv1dKwbIEZnU8I49sRuiMyoCz4qVXzRVaxG8syab/+09YH2PQAdw2WLMCM7OGKPt2Xuy8Yk7
	JPF39lmDVLaVdFhRVDKmD7XOCHm22F5ggReZg0my1as7xQ==
X-Google-Smtp-Source: AGHT+IHlruq+iasO/Xf4isf6TVh91BThvcXOEla4yZjGqTuKHawwQUKWxkBtd0qIfCVEgb7Oy7b4LA==
X-Received: by 2002:a05:6402:3511:b0:5dc:8851:fc36 with SMTP id 4fb4d7f45d1cf-5deadd8c41fmr9981216a12.11.1739517912543;
        Thu, 13 Feb 2025 23:25:12 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c4646sm2457908a12.27.2025.02.13.23.25.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 23:25:11 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso1762762a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:25:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXc1i3ggKN24sthExku+0IoqbWnkf9Zd4Lpb+2VdDlnQ5o8bqKwDgnxuiACyaPJ2lxa5S1ts3m3JqMq/iWGKrtd@lists.infradead.org
X-Received: by 2002:a17:907:1909:b0:ab7:8e0d:3d3c with SMTP id
 a640c23a62f3a-ab7f3473720mr1066973166b.42.1739517910868; Thu, 13 Feb 2025
 23:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20250214040306.16312-1-towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 14 Feb 2025 02:24:34 -0500
X-Gmail-Original-Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
X-Gm-Features: AWEUYZmee1G4NO9TTRkSGcwt1I0mLzwp9RPxwW1Z78u96Fa7SXff07gmHN3DsJ8
Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_232515_129653_1BED09A7 
X-CRM114-Status: GOOD (  23.53  )
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

On Thu, Feb 13, 2025 at 11:04=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
>
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
>
> v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmai=
l.com/T
>
> Changes since v4:
> - Change type to BACKLIGHT_PLATFORM since the driver does not directly
> interface with the backlight controller. The actual backlight controller
> can be directly controlled via i2c and is not the same on all hardware
> that supports the dwi interface.
> - Rename file to apple_dwi_bl.c to better match config option.
> - Rename driver to apple-dwi-bl to better match config option
> - Indicate that the backlight scales linearly
>
> v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmai=
l.com/T
>
> Changes since v3:
> - $ref to common.yaml in bindings
> - (and then additionalProperties is changed to unevaluatedProperties)
> - Use hex everywhere in bindings example
> - Use sizeof(*dwi_bl) instead of the type of the struct when doing
> devm_kzalloc()
> - Use devm_platform_get_and_ioremap_resource() in driver
> - Fix sorting in drivers/video/backlight/Makefile
> - In drivers/video/backlight/Kconfig, move config to right after
> BACKLIGHT_APPLE
> - Explain this driver being completely different from apple_bl
>
> v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gma=
il.com/T
>
> Changes since v2:
> - Add missing includes in driver
> - Fix file path in MAINTAINERS
>
> v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmai=
l.com/T
>
> Changes since v1:
> - Fixed dt-bindings $id.
> - Make power-domains an optional property in dt-bindings.
> - Added missing error checking after devm_ioremap_resource() in
> dwi_bl_probe().
>
> v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (3):
>   dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
>   backlight: apple_dwi_bl: Add Apple DWI backlight driver
>   MAINTAINERS: Add entries for Apple DWI backlight controller
>
>  .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/video/backlight/Kconfig               |  11 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/appl=
e,dwi-bl.yaml
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

