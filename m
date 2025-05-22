Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8DAC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzW20nwC4VuWDQE29Tj4IgyVUfkVJ+JnWCtTS9PiDHI=; b=cYKM3XWAWCi2e/LqZnOCmhCkJs
	XZIdSeUHAUNEo59UvzZygld8zDWPzG8gdJk7+jfv8Ws1T2MEVFixjwrL5M61M4gmYkvejP2YfICM4
	pYCs8g+nTBZUgKsLs5pxLa+THhyVIYz9+gZa/n/ttFY2e9WYrCF4LruBDKOchn8hQAAxCNc9Ioyf9
	F7H6xyWhI7bpEUJEyE3ekmbKsOzPw7S+MEndPpIoPHACzPHFuGA3Ee5i7p2BSyDkZ5YsCpy65l/ZN
	MIW8vu2nvACQGTMJg6tr/NVPCwfpn9ltld+UypXQw+NCgUgfcYyi2X4iK7euJEFfANXyumDtXgMvA
	ChYGY7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0ei-00000000Ax8-1l6u;
	Thu, 22 May 2025 07:47:56 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0cd-00000000Afv-2YdJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 07:45:48 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7306482f958so5702767a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 00:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747899946; x=1748504746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzW20nwC4VuWDQE29Tj4IgyVUfkVJ+JnWCtTS9PiDHI=;
        b=NtPyoO7sRF9za8AAzw2Vk+/Zd2oly2yZk0Sb1rKlahBtrS7t6l4rPRdpZAW+0yOIR1
         L/0YddmNlaaAuc5aC64S4IgMRzlLERLB/4I6w48J5W30kdyJJx0XkNWu5U/xU5YlAZCz
         v2yYxBJgs8u3OTAOTMhG2U6W65lV4Lft+pSLWhd+YEwiritfDimHqtWR9wl9NXT7AppU
         6fcbbjC8grwiouQGcujlh7WlZsuEkJV1EeovU5oH+oSgX4R7TmaK9GTI5wTDRYMFPIZF
         KyuE43wWlafCjijOJFO+L29bexmqYqP7+GKHkhjCllDU3cthwIan74CNWeaXK/+jsLgT
         OLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899946; x=1748504746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzW20nwC4VuWDQE29Tj4IgyVUfkVJ+JnWCtTS9PiDHI=;
        b=wLpXBtlFp5Ob+ZpKuY5MTCpqKh1D3aIknnBhWKF1bIwnfl9mPs+kfmB1ZflHKLEzP4
         8gGeYojuiuXMTu114JN9HlVZNcquWm+kqiZquJpYOrh3GDHTJbUqdq3B+XafAgR/7jwF
         FB6xqcIUY3amTxJ9P1XSJpsSGVPS6AR68//LruvSXR+W1Ob5/E6zfjgQQ2M30hpIXOsA
         zNPA6eqhvWBTbTqlLt1msSJTviYfkfVRiUDt8R8KPDXkNZ/t99VTjHdO2u8shEv9brxd
         LFMMvhSydKu0sCKaxzV2H3Pz62TOY3nLuDbE8A0wep8pdY7myQUqF48/fKxzm84wmlep
         ELcA==
X-Forwarded-Encrypted: i=1; AJvYcCVRKuCXU0xOXkU8AbHVEP9TUDGMHQldhtWggWTGegIJc7KL8kwfeVVKhvdwWWCUGDyqgLEk15899Nb7/iNszk/u@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm2w9XAlA0tV1jxUoqE1EjEBApcw3RkGMDBhDn64oqIxe9k6l9
	vbZFxVKgjnMaHXExKj6ArBOTBgMsZCQQrszq71tLH3qgttg/8Jg6SSlH8UseyUOix9+44TZbKhy
	fqy17MhkUZpzrrWJPU71Nl38YUv1VNeNKZsDGYRk=
X-Gm-Gg: ASbGncv9Q4hskH5L8WueS2RM9uTwu3UhT8Hr4bNYufG+05OqSfmOk794JrMEKQJzoHj
	XnY42TrcdQM3c+5oyLt58JMdW8P4/N64LNkE0qKRBzAunFn+NXBFrdcG/EkD6SiHMMtE0Iq5gQ1
	2IvsCNjzNiVNaRhKe/NzE6TFShEuTmbw8azbhzMDD0fpJ18ldz475ZQpnUnRB7nW7iIA==
X-Google-Smtp-Source: AGHT+IHx9WwGAeBBgIJ2VZAo/LAtKYEWKxbcrPGYRDL9PPLwEM0HTBz1LK7Lmmv50E3X9O8VXiDRpGFVmpONGdmsjyE=
X-Received: by 2002:a05:622a:244f:b0:494:7ab9:60ad with SMTP id
 d75a77b69052e-494b09397ebmr403217461cf.38.1747899936138; Thu, 22 May 2025
 00:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com> <aC4MNjZxnQu8b0kR@mai.linaro.org>
In-Reply-To: <aC4MNjZxnQu8b0kR@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 22 May 2025 11:45:33 +0400
X-Gm-Features: AX0GCFv6jhcev6GhPYo0l88C_vd8Mhb7eF6cQfp7Ylfbkj6Kxv47qMniq6WrRRE
Message-ID: <CABjd4Yzv6-9KFC1fXcLQ5XPcbWDWdpYgkZJgNr1ygipVd0PV3A@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_004547_646766_CF834AC2 
X-CRM114-Status: GOOD (  31.04  )
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

On Wed, May 21, 2025 at 9:24=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Wed, May 21, 2025 at 05:00:12PM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia SoCs can use their system timer's first channel as a
> > watchdog device which will reset the system if the clocksource counter
> > matches the value given in its match register 0 and if the watchdog
> > function is enabled.
> >
> > Since the watchdog function is tightly coupled to the timer itself, it
> > is implemented as an auxiliary device of the timer device
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  MAINTAINERS                   |  1 +
> >  drivers/watchdog/Kconfig      | 15 ++++++++
> >  drivers/watchdog/Makefile     |  1 +
> >  drivers/watchdog/vt8500-wdt.c | 88 +++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 105 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556=
260662dab469ed091 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >  F:   drivers/video/fbdev/vt8500lcdfb.*
> >  F:   drivers/video/fbdev/wm8505fb*
> >  F:   drivers/video/fbdev/wmt_ge_rops.*
> > +F:   drivers/watchdog/vt8500-wdt.c
> >  F:   include/linux/vt8500-timer.h
> >
> >  ARM/ZYNQ ARCHITECTURE
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..2e59303306feba7e15a015c=
2fce25b1290dc4cbc 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1115,6 +1115,21 @@ config SUNPLUS_WATCHDOG
> >         To compile this driver as a module, choose M here: the
> >         module will be called sunplus_wdt.
> >
> > +config VT8500_WATCHDOG
> > +     tristate "VIA/WonderMedia VT8500 watchdog support"
> > +     depends on ARCH_VT8500 || COMPILE_TEST
> > +     select WATCHDOG_CORE
> > +     select AUXILIARY_BUS
> > +     help
> > +       VIA/WonderMedia SoCs can use their system timer as a hardware
> > +       watchdog, as long as the first timer channel is free from other
> > +       uses and respective function is enabled in its registers. To
> > +       make use of it, say Y here and ensure that the device tree
> > +       lists at least two interrupts for the VT8500 timer device.
> > +
> > +       To compile this driver as a module, choose M here.
> > +       The module will be called vt8500-wdt.
>
> Module is not supported by the timers. That will change in a very near
> future but unloading won't be supported, you should consider tying the
> wdt life cycle with the subsystem it is connected to.

But there's an auxiliary bus between the timer and this module, so it
should be possible to boot a system with the timer initialized as
usual, and then load the watchdog if/when needed. Which also saves a
bit of space in the main kernel image.

Or am I missing anything here?

Best regards,
Alexey

