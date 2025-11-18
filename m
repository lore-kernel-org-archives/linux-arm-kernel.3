Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D35CED606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prvcS1Nj5HxJbRS6Jy4uHehWZnJysfpIngTPCq04YCY=; b=rcbbBmYYzcBpiBlLgINFutNXRL
	Zjki8vbVlRRBPisS25+wlPVT3x9HhrbdDQ2m+hnYsW5gEhLAm6BmBAHS3B5veNkDgh/tXchtYydp2
	GLuXXghOt7SAKLKOUdFpLZ9To8Y7oCTZEAp3+Yf17AOnPbHNvr+ZGJUfDNRaOO4gyqit+3Kr4L7uX
	TheNCcuYXcCBDRNdkYApsWkKnxO8YjjFGVYi1qqsDdvyUPoDD1uI/KOFXwSdwhbkHuKBS1sHOeTrb
	xQ3MxBUjAn7LXn17K/mXiXL8jnpjkO/5tli8Ue4EJSOS4hKsVfaxuwOQA+232djZUe2QaC8YG72Zz
	VuPrSWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJgf-00000000Jy0-2COK;
	Tue, 18 Nov 2025 11:15:53 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJgd-00000000Jxf-0GPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:15:52 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5597a426807so3278455e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 03:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464549; x=1764069349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prvcS1Nj5HxJbRS6Jy4uHehWZnJysfpIngTPCq04YCY=;
        b=xGVAyPrfGBNDN8jWIf5QOMmjPSTXdjXIIU6GdJPPQ/49T1LgLfrnDN3H4GpCyvaI92
         olSuu1X9oOU82u6qLRmcr0dfk8Ierh8IS8bekyrnZK642tSIGzrR1U8Sew/PDBABJ3/f
         revgUhaxMrfy8U8OBmCrK4NHxIze0jOQPFwSJXUnolFCbffULPCxUUxIfUMOz8ne9KIX
         xqDV3/ir/NXmXDQhJbnEg6iWy1uzw/lyLIFKpNJWLTsmdPzmHFgb/444kW3pX7R+L5h4
         hPfz0hCWpkBw2gViY7DiDTnmgctvE/HCbEnaob6u9hlvmCjVX1zbK+BDzlyj7rSolLJZ
         ld3A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/WnLtPhccc3BTSoCM5OtUo+bmKm/S6agtXgPPUKDBYxcm3thZdcZG5WPeLuJg0tvDbi6s8cY6pVBwkwtTEeC@lists.infradead.org
X-Gm-Message-State: AOJu0YyR8OPtDmv9hSQSNoOHfk2mgkIUCLoUiy5g4d4z0gVoOtNpnaQo
	rF32RSX31+FbvrckZAhRqBo7mxYJPLNIpC3HJj/18/87JahAZKNAfNYB83lmqoJEtA8=
X-Gm-Gg: ASbGncuydqp6aKk3UKXGeIpqNPiZhVJRw/TE1lv6cdnClkWgxICKIEOQfsO7U8yNqSU
	932cL2Kz5xvBiSz+NQ5xtM0aELsUvqIv0827NgmKRWQFhxRfROSwBvmRuUWKi/4XPRUHggRl60p
	VMiSrLa16c2fRUqgUTeyA8DqDJwX2fckN61b630wY5r63ALGsFgPKk70UhCKEUsuxhBy3PAZ+0s
	lrojIyGHzKlha73uuSIpVJMExcPXJip3kZILrojG4/gWWYhuqAR+7zU7gEvBjM8nNP9ZaJpHgH+
	zkAqhr4PMw1SWkXCWPnV4yYnEsAo0FyjzVz7vIqOuYugeeZoxXH50F9gWtueDHNW+ZJ7TunM1PG
	u0ii1197EbAW9HqoShW/Xi6h1OtnlGvxYOXkXLtFwq0nPwVnAfTcae+0R96NeeynbRvXii1DbOv
	GvJD/2Bz2paE7bsZPk4VERSpZaZha2AMMM7KwxglIYa0v+uL7h1Cm4TykLgJc=
X-Google-Smtp-Source: AGHT+IF20qpSdXP5T4JS5mbLE/K2juaHUr7x34FAGxxiJOXDIRX+tFdsj+abCZPWwBRZt7rG9MF6Xw==
X-Received: by 2002:a05:6122:8c27:b0:557:98ab:8a27 with SMTP id 71dfb90a1353d-55b1bccc081mr5700983e0c.3.1763464549043;
        Tue, 18 Nov 2025 03:15:49 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f32e47asm5217986e0c.1.2025.11.18.03.15.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:15:48 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so4576007137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 03:15:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7wTv5mBJG+inIlyXyBe9en3gjAQ/Rqb6WMZaDQxAWsGS6nfn5mi5jywxGrO0SaBTj34c6Kof/qJfUVe+30HVc@lists.infradead.org
X-Received: by 2002:a05:6102:4189:b0:5dc:7fe3:1d0 with SMTP id
 ada2fe7eead31-5dfc5586babmr5642681137.19.1763464547898; Tue, 18 Nov 2025
 03:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 12:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnG1e_JZjF_t0LAgzvKf5wM6L4cWt2t2bx5VV8t6YS3prQ_Mx2gaFVEov0
Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_031551_115682_FC7879FD 
X-CRM114-Status: GOOD (  36.07  )
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

On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

Thanks for your series, part of which is now present linux-next.
IIUIC, this requires the direction of the GPIO to be fixed?

We have a long-standing use-case on various Renesas R-Car Gen3 boards
(e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
key switches.  Basically, the GPIO is connected to:
  1. A key switch connecting to GND when closed, with pull-up.
  2. The gate of an N-channel MOSFET, turning on an LED when driven
     high.

Hence:
  - In output mode, the LED can be controlled freely,
  - In input mode, the LED is on, unless the key is pressed,
  - Hence the switch state can only be read when the LED is turned on.
If you have any idea how to handle this, feel free to reply ;-)

Thanks!

[1] https://www.renesas.com/en/document/sch/r-car-starterkit-schematic
    (needs a (free) account) Page 15 aka schematic 12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

