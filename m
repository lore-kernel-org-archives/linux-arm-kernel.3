Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D4EFF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qbtRDqVJNXWtfOXgWj67fN36Vg3rAzNYCdKeQq94E4=; b=ryGJslX7bI7m0Wf4VII3NU9No3
	35yLPVagVNi57UcEpQ2B4eT0hrGg0AtRbkxAckoNnbCcmLQIp8by+sTAfVnR8DixBlHQAcwUVckcz
	2db+mgS+rpEqFqa65jpNsMVbjLnJag+fhjNBKA0GFC7WzEfYnb6cIBBq6jd9M4PSTma0yLLzEz5Of
	9GbTa/t5TfFF3o1GI5FdJSrUCKuzzTlBI8YkJhyHdlymOPJoo4IfRJLgQQ+R4qni+2Xaj407MIwFY
	ttGlTMSL9KIrJQAVu60f8CbD73bOZauW66UbHYf0DU843d0kd4vik1OCZW85zVFuidHnkr1q5ju2B
	hQFqeydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNGd-0000000H8IR-0R4F;
	Mon, 27 Apr 2026 14:48:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNGa-0000000H8Hu-2Sb3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:48:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D9D8445AD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22185C2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301336;
	bh=Pivra0dD6dxuVk6jiUhcTWB6azirh6PayWgsBS+7sdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Um7n/BldGaHdI5YsZuBD6mnPGecgj0Co4typQAHhIkR6wXxcux8rf3oYgg91MzC4k
	 Er4FwbpGnI+RpvC+zeE4eG+0ZftmR7TadRwNZkbop2Z8o25GzWcXImx1S+lCFvu3B7
	 Bg46qORATvWJHg1vatdQoIKHv3FftKqVqWWoNzTSWm61Hny5PZgu12ghGjw/aYt1/e
	 O7mi/sLGAa7y03dOehgh+VoG5QE9LWmP/ZwHb23OQi6Glt4/0jGzJNKG3kekopf3nz
	 JrxPPsOz+GQl9Xb80/QpXQOl5nbVv0fT/x3UTqK4n+KCD986i+ZUaFNOesSSkD8Pl8
	 6CfukgAeG01Lw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so101609031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 07:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Cb0zqC4fKvf3b9k4NF4mXVvA+xNJ4iENJSUzE9HOXGOFmRhE3qCt1cXMv7JAm37XlE/eW1l/gcDAMXTqBb+i9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwi1jdjtstxmpNEshbM0uD2FeP2ng9rMKBaemzv6xTFGAteZ/
	hAyurVJQT3ZMrZU6NJQv/5Ju3TDUnQPL8ONhWjU0UZ1K4Ct4eOdkCeMQa3RiHLDRkLac9d+GFcP
	W/xf6aJ5o6kOnkSrTMX2ZJHMwUKmNrHOmAy/FSB2sdA==
X-Received: by 2002:a05:651c:41ce:b0:38e:49e6:a363 with SMTP id
 38308e7fff4ca-38ec7859815mr124271121fa.15.1777301334471; Mon, 27 Apr 2026
 07:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
 <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com> <ae92LAOy6nRsFb9w@ashevche-desk.local>
In-Reply-To: <ae92LAOy6nRsFb9w@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 16:48:42 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md8M=vvUstt=4X-gW1_gBhtKCGC+xQae_J_TKZWKaLJ2w@mail.gmail.com>
X-Gm-Features: AVHnY4JN1VGD7u4dI33kaRwq7CQuc8nHx5eCojDJgeZv_b43IhasKnBB-_UjTHE
Message-ID: <CAMRc=Md8M=vvUstt=4X-gW1_gBhtKCGC+xQae_J_TKZWKaLJ2w@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] ARM: omap1: use platform_device_register_full()
 for GPIO devices on OMAP 16xx
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_074856_803327_ECDACA44 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, Apr 27, 2026 at 4:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 27, 2026 at 12:46:33PM +0200, Bartosz Golaszewski wrote:
> > Ahead of changes attaching GPIO controller's software nodes referenced
> > from the Nokia 770 board files to their target devices, switch the
> > method for registering the platform devices to the
> > platform_device_register_full() variant. This is done to leverage the
> > new swnode field of struct platform_device_info which automate the
> > software node's registration and assignment.
>
> ...
>
> >       for (i =3D 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
> > -             pdev =3D omap16xx_gpio_dev[i];
> > +             pdevinfo =3D omap16xx_gpio_dev[i];
> >
> > -             res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +             res =3D &pdevinfo->res[0];
> >               if (unlikely(!res)) {
> >                       dev_err(&pdev->dev, "Invalid mem resource.\n");
> >                       return -ENODEV;
>
> >               base =3D ioremap(res->start, resource_size(res));
> >               if (unlikely(!base)) {
> > -                     dev_err(&pdev->dev, "ioremap failed.\n");
> > +                     pr_err("ioremap failed.\n");
> >                       return -ENOMEM;
> >               }
>
> Isn't this a stray change? Or why then? And why the previous dev_err() is=
 left untouched?
>

We need this because we no longer have a struct device to pass to
dev_err() before calling platform_device_register_full(). And you're
right about the other instance of dev_err(), thanks.

Bart

