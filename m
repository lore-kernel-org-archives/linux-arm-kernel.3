Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F445C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqnNDF5VKQ+E0vRBcJ/LtO+JWbWwBxQUs2IGvWvjH/Q=; b=1qwq+eFbfOdDNY/c+VGymOkize
	9j9bN8LZ1/PnTpvyHmOwYYCAuvmPKHijiwh7DD1EGUAy7mjQ9JYltsYuMFKrgaAVtOc2a93MzncSQ
	v1fE1hmOeMlmZw/O8J7T4Ds15ouOIS4j2v9NVSC7OxpnZMOwXn4ev0rvSpss7uJCde1df56HBUVTU
	LnpRLvghwX3FHMbe1q7rqTOpgB1lU+jx4g5V6BLQN/aiQOJfwHL9y7BuBPAZKbsEwAhBH4IcvJzwE
	ryQLPau5NT6bgDOJDlqO3FpuclfBZF0KZFCklxm2k9biIESxQhbRXTEY4j+gm6I/N0ISMjODStqQC
	JJGMxysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weau1-0000000HQla-3wPk;
	Tue, 30 Jun 2026 16:01:37 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weatp-0000000HQjn-2gHT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:01:31 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bd7309af69so1701062e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835284; x=1783440084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqnNDF5VKQ+E0vRBcJ/LtO+JWbWwBxQUs2IGvWvjH/Q=;
        b=pwFGPCZ/6GVGHcGH75ptbR7WeWUUsxp6/v4un/xymNKIFgmtsuZfwA0dPbfjeu0qcm
         9Age8ArYUJuXTwrAwBfrlmFkEoqgp+UVWP4i5/sAI2CpqzK6LTpKt0WJ50yCfg9B3yyO
         MBPn6j3kCPIptxKLGPRdKspWbAWwH5RWAYkoLTk6uTRUiIIPSxawJ0yPW6EjpnT1lkbw
         StzV9acR5j5h3oeGTYan4eHDd2e+Dzzfu35PUu3PB76cTjZMNmY0wKeRIrxq9Mk5hqW0
         pflIwz/THRIOHZkWFsw9Yj9N13e5TjNoRV3NWRytzEgrPtBfldhi6jgNAHmaed8X7Sdm
         PHOA==
X-Forwarded-Encrypted: i=1; AHgh+RqLRDOP5lxyTClkUov6/4Ixwj63V9YRPeGnLtS2DddYOXFgt8SWU3ggs+ywLA8ezeF5s8jPbShM8nHwbA3umbQo@lists.infradead.org
X-Gm-Message-State: AOJu0YyYExc+OK3UGfrH8L3eFu5nWmHHFc31r0miVoApYQXyhS2+owWr
	T1zJyBly8fJw8/cKrXUkL3JUwTTs3mJossqP5DX1l6hZcuo/+wtA9lM+Ybf9kg99PYs=
X-Gm-Gg: AfdE7clmO4Kqu61YfDUJvJNsQRRJW1HdrJcako9q7ck8Hd4cRyP/L3MaE767nLdcnLw
	LNUXZYAl9xa7A+0UAASWNDM/mJeHwpSoXHBaxPKD2uySZZ1SAePeaG9tJfRp0OJ9alpKr4OyiPG
	esk816SSALr6VmCHVC0jldC5jPlx5XYT+gwRIONQ3Gf08C3Ddi8l1w/3wz4+6PXVV0Sop6k5pBm
	USmJwGUc077j2Hb7rWZxsgfH5X75xQODLHHjAIO9pLOlJDSSZI4A7fEnQP87Fz9/J1dxM1K16+8
	NNlaLqlKByt5WL9GewgzhZ/CNRpbF+C5Yz7d2XA0b3LVu6vlNOgA12/N5vFOPibhqx1e0jcrCNM
	laTe9stsE4262VcIOzsgFJKConsNe/6dWbFGPNJKIwT4ZO4l9aQLiBF97+N1WGWYBBHFZ8Hf7vv
	YAoj5Av4yqTRZ2duIHbfkBpfTYLgKvEWA4TalaXqLJ6t9AKcGoTQ==
X-Received: by 2002:a05:6122:4011:b0:5bd:ba0e:1d6e with SMTP id 71dfb90a1353d-5bdbee27d4bmr1916607e0c.11.1782835282817;
        Tue, 30 Jun 2026 09:01:22 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1846eb0sm1639939e0c.4.2026.06.30.09.01.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 09:01:21 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9696369925aso444118241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNv/yfDWPLnQmp8ITy5usPzY3xx17ecA1nUGnQv4jgtn4UG7pPRPRbhrSgXW18cFsiQokG4MWYEAxKU4dWnOJO@lists.infradead.org
X-Received: by 2002:a05:6102:598c:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-73a38838db6mr1792608137.20.1782835280090; Tue, 30 Jun 2026
 09:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260629135917.1308621-1-arnd@kernel.org> <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
 <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
In-Reply-To: <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 18:01:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
X-Gm-Features: AVVi8Cc-rLKbwzFvmIKs2_rpHMNLxVULzvudUQINxHMw-KOr8IArAqRSnLCM1D8
Message-ID: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_090130_278504_CF40FD62 
X-CRM114-Status: GOOD (  30.47  )
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

On Mon, 29 Jun 2026 at 19:54, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:
> > On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Most remaining users of desc_to_gpio() only call it for printing debug
> >> information.
> >>
> >> Replace this with a new gpiod_name() helper that returns the
> >> gpio_desc->name string after checking the gpio_desc pointer.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> >> --- a/drivers/gpio/gpio-aggregator.c
> >> +++ b/drivers/gpio/gpio-aggregator.c
> >> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
> >>
> >>         fwd->descs[offset] = desc;
> >>
> >> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> >> -               desc_to_gpio(desc), gpiod_to_irq(desc));
> >> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
> >> +               gpiod_name(desc), gpiod_to_irq(desc));
> >>
> >>         return 0;
> >>  }
> >
> > Before, this printed:
> >
> >     gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
> >     gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189
> >
> > After, this prints:
> >
> >     gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
> >     gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189
> >
> > Same results for instantiation using sysfs or configfs[1], although
> > the latter does have optional support for specifying the name.
>
> I wonder how many of the other instances have the same problem
> then. Would it be appropriate for gpiochip_fwd_desc_add() to set
> a name itself to address this one?

I don't think it would be appropriate for the GPIO aggregator to set
that name.  What we want to print here (for debugging) is the physical
GPIO that an aggregator's GPIO is mapped to, not some consumer or line
name (which is not guaranteed to be unique).
E.g. "<chip-name>.<offset>" would be fine.  As gpiod_name() can only
return a fixed string or an existing string, it can't return such a
formatted string, though. And consumers don't have access to chip info?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

