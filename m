Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98086E9E305
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsdwyvWms6UShEgfp32SLckuIkR1nLGQHpHcip96Ek8=; b=3XHPeozpKBIYEJef6kzUXyJQsr
	n7sDHKx5tF3WJ/0mzVBT00g+vTmKRGhkZy6sWO2UuoCbERScNICU/kbKwxBVE0lQQx9Rk2dHwbycT
	qOoAKRk2mHeFC/piuMgNhphoUEwy2Po3v8KjQfmsvp1heTWpaddGnJqR9qSbQCLI1BjhPBOBvhQ3T
	CSPWkbUM7V1rPbSryLAinFdEYeWWeeYxUGRVVydkFKuSj0QMHRY+1dBGLT3S9RYXILcHaYuSqeMiZ
	gxWwV7rCaXwwZcZGKDcZu9HVnBezd4Qu1lKzUHOp5KKCMI4H+dayUD45KHWeem8UccNbMCynTVexK
	7VDJG3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqA82-00000000g5Z-00To;
	Wed, 11 Feb 2026 13:19:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqA80-00000000g5S-1kNC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 13:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8095660128
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 13:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F22BC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770815975;
	bh=pEWU38l5Vz50R5z6wyDS7+8ixxHxST12htbs23d8t2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DigU6IsdqAF5P0vrUTunXSwLLmnbLmEKtYuRBE/AHIZl09QREOjf1921Lw9PN1TDp
	 /QF8wgAwovulPbvlaWwFu7MbeoQ7FH5p3yiGyHjRzKGUJVAERGaPfNu8mJpg7B/aA0
	 Gc/dEMy0SnDRTYHnhHVdM+Zi2ZWoy6N7O30VlRJ7zAFar796igBR8IFFB7EEnjnLJh
	 56XBW2YWoC9T9hO/VTHHBiMGXHkaDlhO42hnXs9AX6n7rR5+utHBe4msq3QYHpvFYr
	 x3bhelwTB7P6TFDraUksfxeCmQj04DwrLxGKOZffTU6QAc0SzQofvDUShJAZ6OnsQj
	 Ui90asQbXjbFg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38706b63929so4658761fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 05:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx2YHwP0tEkKoLV2tYSIUVAJ2Y1hVwBYDQ4CieTzPdgY8qKc7BVL7RO3W5HzTcog9jwqSLmZjxMDhmVDLaMEd2@lists.infradead.org
X-Gm-Message-State: AOJu0YxUjbIOJVNStdquPSLpM2Z/dw1/FkzV7zbjorr8m15n3JR8j6fg
	9QHTn0RLaIf02lND8HvXfo337PzQBI1vLByadfXvr8V0vOMN71JwGJDfcdI8Lx/gKmxG39BlC56
	Bh3ckpCuhzDKGgtPAba2dcAAgPPdrWJr4yPz2hxmOXA==
X-Received: by 2002:a05:651c:4185:b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-386b5144cbbmr48730171fa.37.1770815973681; Wed, 11 Feb 2026
 05:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Feb 2026 14:19:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=McWjUrm-EBFZJO=K1TNQ4c3QMPQNESAg9v1RqoVexAaZg@mail.gmail.com>
X-Gm-Features: AZwV_QhSQMg4-Uk9ADIBVghl8ldlT9h2oSgD3Nzqu9hAZs_M8IMSHSh_b3wnJ0g
Message-ID: <CAMRc=McWjUrm-EBFZJO=K1TNQ4c3QMPQNESAg9v1RqoVexAaZg@mail.gmail.com>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 11, 2026 at 2:14=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Currently the board file for Nokia 770 creates dummy software nodes not
> attached in any way to the actual GPIO controller devices and uses the
> fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> software node lookup. This behavior is wrong and we want to remove it.
> To that end, we need to first convert all existing users to creating
> actual fwnode links.
>
> Create real software nodes for GPIO controllers on OMAP16xx and
> reference them from the software nodes in the nokia board file.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - fix build with CONFIG_I2C_CBUS_GPIO
> - only export the two symbols that are actually required by the nokia
>   board file
>
> @@ -225,9 +206,9 @@ static inline void nokia770_mmc_init(void)
>  #if IS_ENABLED(CONFIG_I2C_CBUS_GPIO)
>
>  static const struct software_node_ref_args nokia770_cbus_gpio_refs[] =3D=
 {
> -       SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 9, 0),
> -       SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 10, 0),
> -       SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 11, 0),
> +       SOFTWARE_NODE_REFERENCE(omap16xx_mpu_gpio_swnode, 9, 0),
> +       SOFTWARE_NODE_REFERENCE(omap16xx_mpu_gpio_swnode, 10, 0),
> +       SOFTWARE_NODE_REFERENCE(omap16xx_mpu_gpio_swnode, 11, 0),
>  };
>

I'm sorry, this is still wrong but it builds, so I didn't notice. It
should be `&omap16xx_mpu_gpio_swnode`.

Will send v3 tomorrow.

Bartosz

