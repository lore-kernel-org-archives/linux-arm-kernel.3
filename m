Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40480C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PSkrSvBcOj2Vfr1tOG9HdESUGrp+uU5X3MHl1xNqsM=; b=wCUvyyYIx1KBgWfyw7mzpK5Ql9
	k3MAprlu8bZOcOM26Jx2oZCgylKxC7ba2kT/jWFPGJ4YaEpJCONtj7nrxpB2X42UKTBedfbHmRmQt
	aCGLlvwxrzSSPbGmV8kG9/xTQj9xfAnLfFXcOGt5CDT7SHUA/vaPSPxQ2GljJku6fnsn/nFI+tAwc
	HoWlm8CyeEtyHFAG2C20P6XfIAFi7fO/4Joj9ZdmIfaDefc98PTcgNTV0ezbaFUh8msN1xHqM6KAf
	Gf+HL7+7gDNqBVx5W7uXUCFBJF8+4PXmSdrQ70Db9je2QQzaX6+dcv7krT9wFw/VaKr3rHPoRkO4H
	47fQglFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE27-0000000F5fW-2y89;
	Mon, 29 Jun 2026 15:36:27 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE1q-0000000F5bl-21ik
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:36:11 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c12758e75afso110484966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747368; x=1783352168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PSkrSvBcOj2Vfr1tOG9HdESUGrp+uU5X3MHl1xNqsM=;
        b=dcgp3b4vPEJxCUaAJKh38p/YB0t8p/pGOPfxlfmsDps+bD37B4PlYOEchlNdBLVDp+
         W70LaSR5nF4d/HWjy0YLRtv+/CPXu8yNyLje1cCw7726Vfyudd7lstKIhO7Gbay+Nhhh
         oN+uQ1ebJYNwz/eoecnJlhhV1xwRzgTNbjVWVxuzsXKzJdnFO4Fa7fgaSA6ZFBKIKrAj
         IhDA/bjVXA1/S8l3LehpBD8ze8gqcM0dhjw6mt6uWxm5bC7OtqW8LOBa8kk2xNoVfIIN
         m8pRoluBb9SUafy2+wrBD5p93U6jAOlBI+ppXf7UPkm6kPUMquNbRhUMu/5vQBUzsmd7
         32ng==
X-Forwarded-Encrypted: i=1; AHgh+RqbZ5Gd0t5YxHGsZEj7tBp4N74o8BwwL7QWz/3KKE03ac525EhWVR6zvh6QjOfVqMSQL29RkvBjy+Xbuwvhgny/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1T4nivrWJQLIHf0dwh6+PyHXeZV/ig2kcQtWM3bFPpGUYi4zM
	mIoJm/DbOY/TknZzuSQCuHWM2EG6FdB0b0CwJBdGAyRPKCAJPxYoX5RU+3HbjNd18g4=
X-Gm-Gg: AfdE7cm22XSv0Njn6OzsmJ+2wJcaPbm0JARu6gxSxjJLa1UX8h9wCPsV0Zd1pKicffl
	VSFpmmLSK+7hAR9diGfbnkW6HiOUpwTShKaWZqtLecnNQ/HOTN0UhyOKAV9kVgcdimf/yRwfGUy
	QS7lAzF1Ay9f69X8JB56PmveOC15TfA8tQYlxTTnYjdv/qiQRT2cAS0xI2noYWe6vH9kXiQ3Iin
	IYCg2vuF7C4KNjTYbkKYlrpfi8YWCAT90Wl8LfgW452V6L16DFx9bluK6H2q0KMlnSexzgEyB6Q
	84lAhHK+2k2XnoVhPK2ZJ27ZyFjiXFaYjAV5O5uBcwMYVEDHd5Pq4M4WbZlTfWtlFdfTBqVGkLY
	5Hw1wh26cd++MDzgXLrnxQtNW6yyGV3ycr9pNUgO5NwV4LvqosNGdclLUsQO1if9apzqDmLV/HV
	dcCr0l1XellDAlcJaiYgaMhFPsqg3P7uz+Oqsx5gZp61WAIDqIcA==
X-Received: by 2002:a17:907:d78a:b0:c12:4a01:3800 with SMTP id a640c23a62f3a-c124a013e79mr297012666b.19.1782747368248;
        Mon, 29 Jun 2026 08:36:08 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c120755d053sm732557566b.15.2026.06.29.08.36.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:36:07 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-463f1165e16so3527981f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrxrqjyWQ/WDaulSRRcfnlgjz54m9L+ArimSwCaGv9sDCrexlSMFQrAe/FIWgtYPyxd3cE29uSd5FmK/H8Wjc/y@lists.infradead.org
X-Received: by 2002:a17:907:3c8b:b0:c12:f84:85d4 with SMTP id
 a640c23a62f3a-c120f8487bamr796791266b.24.1782746977928; Mon, 29 Jun 2026
 08:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260629135917.1308621-1-arnd@kernel.org>
In-Reply-To: <20260629135917.1308621-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
X-Gm-Features: AVVi8CfSSg4DcoB7CGCYddSfqoWpUaOwYUjpkorP-3LR7U8E7vJ9ucbePhiZLD8
Message-ID: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Marcel Holtmann <marcel@holtmann.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_083610_548666_080EFBF8 
X-CRM114-Status: GOOD (  27.38  )
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

On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most remaining users of desc_to_gpio() only call it for printing debug
> information.
>
> Replace this with a new gpiod_name() helper that returns the
> gpio_desc->name string after checking the gpio_desc pointer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> Not sure if this the way we want to take this, or if the gpio name is
> an appropriate replacement in debug printk.
>
> Since most of the callers of desc_to_gpio() and gpio_to_desc() are
> otherwise in drivers that already depend on CONFIG_GPIOLIB_LEGACY and
> include linux/gpio/legacy.h, only a handful of instances remain that
> are otherwise in files that otherwise only use the descriptor interfaces:

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>
>         fwd->descs[offset] = desc;
>
> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> -               desc_to_gpio(desc), gpiod_to_irq(desc));
> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
> +               gpiod_name(desc), gpiod_to_irq(desc));
>
>         return 0;
>  }

Before, this printed:

    gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
    gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189

After, this prints:

    gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
    gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189

Same results for instantiation using sysfs or configfs[1], although
the latter does have optional support for specifying the name.

[1] Documentation/admin-guide/gpio/gpio-aggregator.rst

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

