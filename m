Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A830F54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmRf0clXa/z48rdOhDwIqsCZTl6MAr1IPl0XdGWzmtg=; b=YNHzQRkUruhF/6J7BcLTcw0kIt
	szKkPqu+fVA+3mgOWV14rSoEx6Sd4397N7gbS1V458ZVnzAv6XmyusPz7LI9Zt4K7nngmBvl17ndd
	qmio2fyrMFs0f8AQWn719EqVCbqJLzY4AmSUlekomndmIt3NRqSTK6OZweemUHcwi0vOh8VoEcCuL
	UG/YYlej0y87h+B57hBY6puqBqLET32gmHF6fZMYciijwniJC+7X0tVH0X3fzbSOIxDzlyFYYrfqy
	lztgtNJY263BPL2SgwsnW+KoaTXftqZYHphMadg44tDVPMtJGFWp7xw2hF6dNR2C7oiQy66T8ZdV3
	2ZozAu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Ql-00000001sGH-2qka;
	Tue, 24 Mar 2026 16:16:35 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Qj-00000001sFm-3QcF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:16:35 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5673804da95so684085e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368992; x=1774973792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmRf0clXa/z48rdOhDwIqsCZTl6MAr1IPl0XdGWzmtg=;
        b=QmcbdvwJXHx+dsCljYwGO9cyzhQg6qTFOG7/1z+cn+oINcETj7h6/bAhu3qtX2mZXz
         qKhd7KOrgqkS01EScNQLCYZdxfea46MAoks0vNW8XaBClB0Cq56cEGry+hbV5EeYJCJd
         WGvvFHi52gaGQy8vTctsrDkl4PkXEaw6UEoidpk0K5KWLUmDdubvb5euZSeiqQTQDpW2
         Rsi9PaU93+kvaOvuMw1y1POjz6I2slowk9dd2ckeWAuJenNmXpGcoUBkjxYteFmowo/n
         Wwg0kr0KS+GCMHFKdD6yYm+YOUG0zeSFeyj3yt9kGKGdNSJ0B0wjS0IXd1noiMDCe1Lh
         67TA==
X-Forwarded-Encrypted: i=1; AJvYcCWXtcCBG46VHKVV4e60TZ0sQNOABgbLR5LLvffYzUMHiVusj1n5jiMhpqyL/8Ar7/FhwfrP2rJhA2VCbn7mhDG/@lists.infradead.org
X-Gm-Message-State: AOJu0YyGZiEvEkPZRxvkevtiM8fYQwgd2VyE+vynQSv1G46DrHqZ1lM9
	RuMo8WuzzbQXaex018HeVpsLzPyDEJtfR5VDhh7QfI/W9KtfReqAeyKp8k3G3mFAyeI=
X-Gm-Gg: ATEYQzx8zDRdDfIkykbind5MDU9T3+Jb0NZx4CnRDa+zMKbh+4ae0BAL/7a6JfthL0R
	iszL7PYIJNeNIXFDDxutgeBGmLG1M8T9gHWXOGHd5E9lHU/N8dn84kgCBQZWASA6BTAAUw/2ReF
	O2kc8VQjHYGiRhcJuSe44TENpd9w9FQ1gB/frg1rhHn3t24dUoc/28nOB3H6rl226VUo+PJqBNi
	dYochwTSCaV4KD5PfrIRlJsl+3+2FpMzyoBrBeh7qRgC8y7a+Yi2f7nIMHl2jh/m8f9bc6mvR8Z
	aZc5fMdZNUPfiEvgxQY1ZeR+G1QM/SYbbaq5+t9280Ma2otNaD0wZVcZvlrWpn8NO8kY6pHUW/3
	B6LHrciAQ97VXp6MInyYYPlbaRv2/Oo8skNbK1UiRFLlDO/kha/aK+Fav8UngR/8hroLpXGkaiL
	rFw00Rf72RMdzcLDO7bd6nnGLaqMYSnOa8+9Z4aRM2+sHUk+8xWIw3pr8V0Ubpijuy
X-Received: by 2002:a05:6122:905:b0:56b:1042:a24a with SMTP id 71dfb90a1353d-56d220ba1fbmr254393e0c.13.1774368991994;
        Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcb1179sm15502277e0c.14.2026.03.24.09.16.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56ce5c899fcso510531e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZaVu85/5pfHNWp874PG1ObEgP7w4z8mjesUJLqtVwnX6BCqzFBfKMp5aXVohp3LhMvitmIj4Q55NUKgZ44qB/@lists.infradead.org
X-Received: by 2002:a05:6102:5801:b0:603:270c:9ece with SMTP id
 ada2fe7eead31-60386ebc7d7mr249544137.11.1774368990997; Tue, 24 Mar 2026
 09:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com> <20260309-gpio-hog-fwnode-v2-2-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-2-4e61f3dbf06a@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 17:16:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com>
X-Gm-Features: AQROBzCujwdtX4JkcLDjVnd6LogBn_okx21mGqzFRhZGg9NW5EWThevgncjlCbw
Message-ID: <CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: move hogs into GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_091633_870214_B2A443C7 
X-CRM114-Status: GOOD (  32.61  )
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

On Mon, 9 Mar 2026 at 13:43, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Refactor line hogging code by moving the parts duplicated in
> gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
> OF-specific bits in the latter.
>
> This makes fwnode the primary API for setting up hogs and allows to use
> software nodes in addition to ACPI and OF nodes.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit d1d564ec4992945d ("gpio:
move hogs into GPIO core") in gpio/gpio/for-next.

This breaks GPIO on the Renesas Marzen (R-Car H1) board:

    -gpio_rcar ffc40000.gpio: driving 32 GPIOs
    +gpiochip_add_data_with_key: GPIOs 512..543 (ffc40000.gpio) failed
to register, -22
    +gpio_rcar ffc40000.gpio: failed to add GPIO controller
    +gpio_rcar ffc40000.gpio: probe with driver gpio_rcar failed with error -22

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -960,6 +960,98 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
>         }
>  }
>
> +int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
> +{
> +       struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
> +       struct fwnode_reference_args gpiospec;
> +       enum gpiod_flags dflags;
> +       struct gpio_desc *desc;
> +       unsigned long lflags;
> +       const char *name;
> +       int ret, argc;
> +       u32 gpios[3]; /* We support up to three-cell bindings. */
> +       u32 cells;
> +
> +       lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> +       dflags = GPIOD_ASIS;
> +       name = NULL;
> +
> +       argc = fwnode_property_count_u32(fwnode, "gpios");
> +       if (argc < 0)
> +               return argc;
> +       if (argc > 3)
> +               return -EINVAL;

The GPIO hog at [1] has a gpios property with two entries:

    gpios = <17 GPIO_ACTIVE_LOW>, <18 GPIO_ACTIVE_LOW>;

hence argc = 4, which is considered invalid.

The check should take into account the actual value of #gpio-cells,
and handle the presence of multiple GPIOs.

"git grep -Ww gpio-hog -- arch/*/boot/dts/ | grep 'gpios\s*=.*>,'" finds
several other places where multiple GPIOs are specified.

> +
> +       ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (is_of_node(fwnode)) {
> +               /*
> +                * OF-nodes need some additional special handling for
> +                * translating of devicetree flags.
> +                */
> +               ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> +               if (ret)
> +                       return ret;
> +               if (!ret && argc != cells)
> +                       return -EINVAL;
> +
> +               memset(&gpiospec, 0, sizeof(gpiospec));
> +               gpiospec.fwnode = fwnode;
> +               gpiospec.nargs = argc;
> +
> +               for (int i = 0; i < argc; i++)
> +                       gpiospec.args[i] = gpios[i];
> +
> +               ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               /*
> +                * GPIO_ACTIVE_LOW is currently the only lookup flag
> +                * supported for non-OF firmware nodes.
> +                */
> +               if (gpios[1])
> +                       lflags |= GPIO_ACTIVE_LOW;
> +       }
> +
> +       if (fwnode_property_present(fwnode, "input"))
> +               dflags |= GPIOD_IN;
> +       else if (fwnode_property_present(fwnode, "output-low"))
> +               dflags |= GPIOD_OUT_LOW;
> +       else if (fwnode_property_present(fwnode, "output-high"))
> +               dflags |= GPIOD_OUT_HIGH;
> +       else
> +               return -EINVAL;
> +
> +       fwnode_property_read_string(fwnode, "line-name", &name);
> +
> +       desc = gpiochip_get_desc(gc, gpios[0]);
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       return gpiod_hog(desc, name, lflags, dflags);
> +}

[1] https://elixir.bootlin.com/linux/v6.19.9/source/arch/arm/boot/dts/renesas/r8a7779-marzen.dts#L196

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

