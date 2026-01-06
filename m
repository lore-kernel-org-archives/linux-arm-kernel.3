Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A844C47BF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L9I4jifURuPkyw0SLiCyDPtPtIna92lXXuS2wPgV5A=; b=W6S8LXeTBACT9v8UJy81kObik2
	UL1XsTM+wGSZK+qTDHaEFPQAbOGfm8t5Wc5ozMFFkwjnjwA5vUR5+vK0ge40oBLL4wVIoibAJoiDy
	FftbxqdZbJwF/5w7FbSKJN7b+2ldd15Z/R55QdewO3GtiCTbUdYhEWU8C5+s/oyS/jSFry3WGoYjr
	VgjxbrumEGsLRSp9j7ML979R91/5VgY9d7mfkHtA9P00P+8ChdgIoix4oPfhxtW5v76AAtSFvwrSj
	SUlsrhYDtq5UvU7n3Y0DPIYpntpYK0Z9TAHZxQZSh9c0YVGD0H38enkOIXBurslj7QIKOC1ArZgHM
	eD2OZktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7t3-0000000DGZS-01PC;
	Tue, 06 Jan 2026 14:18:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7sw-0000000DGXO-1g2e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD7CF443CA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 14:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935D6C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767709087;
	bh=9Ym168jY0juUmceNY7e8j0i+6pSJU5pRFOBf6YtVzDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bOOHiz+z351DggBlKZJG1l4SIBZi5rGrJuMJFrTSuCC2bhYg3GVmw+EzTJ8+4o8d6
	 mfYKrjdZQleutU3LNIOJvytnRti1+tJxYEb5+FMc6i0af14bQLGN0lgtW7mtsU2Nzu
	 6ryFz4M8Vn1p9iUNI1fLTWCa+m4bpeR2lNFEDKERvGn1VG6CP12akkl/4e/LRbhqaQ
	 62Twt75lEl7bQuHsNLBEHkd+BPwKedPvj2JfLdCbCO/vQwTZc6DBtiCiXsT/Efz4cM
	 7UiMgJqXCVK8SCkbDxCkKvsHQiwcHjxf2pPEiyTaEp11J2cA9WDICgY+7wYxuhNMRE
	 KZcuMKroFvL4g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37d056f5703so8412201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:18:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuBDWfConTR3413hrM5XWYKexkkDoGCvz1jma6lFYEd8ECe3JlUn/PjULwQc3JtXha5BireUB2nS++HthZjZkL@lists.infradead.org
X-Gm-Message-State: AOJu0YxDBo8PmXz70RpVR8EYVY/Q3Y24SeDBuCtF6dRcus5BW2S2YFKx
	Ltt3NxH/q7U6QKrHtYHzi3IxUQyhW/MAJpggpLy5ZKjqNLeEUSXjsjj1VSmrZciSjEW/FN0wNs8
	E/9oL+P/GzY4jRyhwBj6h2ieZoBKdV7HuP2gKGxbkFg==
X-Google-Smtp-Source: AGHT+IGMmSz6Ltdahe1rVY6f+YVLJmMwESu8W203AziADCClkRGLN7rkSW5dIW6LKxsDjFSC7ntBorz6/82D0HbV854=
X-Received: by 2002:a2e:bc15:0:b0:37a:9558:5bda with SMTP id
 38308e7fff4ca-382eaa05568mr8077901fa.14.1767709085885; Tue, 06 Jan 2026
 06:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
 <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com> <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
In-Reply-To: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 15:17:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=MctSufFn4Ku_8KBHmThvNOXo94DJDep-hzBem1yGw4wkg@mail.gmail.com>
X-Gm-Features: AQt7F2rlYGWw0wYVcdfcu_38DzK8jJE5ZLbWHuaZHuyFfl6BwHPNSW4tcfiCMeQ
Message-ID: <CAMRc=MctSufFn4Ku_8KBHmThvNOXo94DJDep-hzBem1yGw4wkg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_061810_478340_217788F6 
X-CRM114-Status: GOOD (  21.25  )
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

On Tue, Jan 6, 2026 at 10:14=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Configure the parent device and the OF-node using dedicated fields in
> > struct i2c_adapter and avoid dereferencing the internal struct device.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-rcar.c
> > +++ b/drivers/i2c/busses/i2c-rcar.c
> > @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device =
*pdev)
> >         adap->algo =3D &rcar_i2c_algo;
> >         adap->class =3D I2C_CLASS_DEPRECATED;
> >         adap->retries =3D 3;
> > -       adap->dev.parent =3D dev;
> > -       adap->dev.of_node =3D dev->of_node;
> > +       adap->parent =3D dev;
> > +       adap->of_node =3D dev->of_node;
> >         adap->bus_recovery_info =3D &rcar_i2c_bri;
> >         adap->quirks =3D &rcar_i2c_quirks;
> >         i2c_set_adapdata(adap, priv);
>
>     [....]
>     ret =3D rcar_i2c_clock_calculate(priv);
>     [...]
>     ret =3D i2c_add_numbered_adapter(adap);
>
> As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):
>
>     #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)
>
> I believe this will deference dev.parent before it is initialized by
> the newly added code in i2c_register_adapter().
>
> Let's check...
>
>     Unable to handle kernel NULL pointer dereference at virtual
> address 0000024c when read
>     [0000024c] *pgd=3D80000040004003, *pmd=3D00000000
>     Internal error: Oops: 206 [#1] SMP ARM
>     Modules linked in:
>     CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     PC is at device_property_read_u32_array+0x0/0x14
>     LR is at i2c_parse_timing+0x14/0x30
>     [...]
>     Call trace:
>      device_property_read_u32_array from i2c_parse_timing+0x14/0x30
>      i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
>      i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
>      rcar_i2c_probe from platform_probe+0x58/0x90
>

Thanks for the heads-up. I'm still waiting for Wolfram to decide if
these changes will be accepted or not before sending a v2.

Bartosz

