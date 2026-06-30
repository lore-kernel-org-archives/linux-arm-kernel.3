Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJSNchfWEyMduAfk7UjM53bR+D02Dxe2C6sVldFvt8E=; b=VEQEfTnNwxcfzVDMvQMdoDzVpQ
	PtY18xW31BoQ/fKhf5mb0o2iX/jsK1D+g7OUZz2uBYCfNUmksjCA5qohe7o5Y5x45KjILQep18boQ
	IKwoQMoJ4W+/3wuldMTG59B/EjNSW4OJ5nhYYm5aBQV7LIS74dMQxJrPjh0lMVMb8NThhByup9MGM
	H0vubaWP4tyIb39vM8we0I3UM5ia8/YbacgzlabXoLtyRuQ3Y4uCzSeaXelBJvbmmSYXbvJF6PwCn
	o7z62yUGhxKzwWq0/8dIra6pVkIQjSj8vU54wdhequyknTK2WcdDfS9AA4bC+FQgnoXxWCWv0eFNR
	XTOkpmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegta-00000000Ivv-2hNB;
	Tue, 30 Jun 2026 22:25:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegtZ-00000000Ive-30F9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:25:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19FC060103
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66631F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858332;
	bh=lJSNchfWEyMduAfk7UjM53bR+D02Dxe2C6sVldFvt8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VO7G2t1Fop7D33uO3A+qYFU4/l49qMz4/fv7261otOP5CpUOFZac93RTf5iLSqCqr
	 e/eln6tInnaYZvtLwA6lA74onbV4Oa9fKZcxZQOG1AAbpxy2m+OeDcfmDH+nJLq4QI
	 zQFyjZP5nygLQQ1ZNMPk/DMTusm4KdUWG7lIlzdhcurKcO8og80hyqQmTMGfPHBVZr
	 oSTiTUDs2eM5DEo8XzJu8uMABRjNNbKy5dMR3QVfzqHZt1q6Y70ZDSezEsGF31qIqS
	 /f8aNeCj5iiqzEcKMWD7AplC9VBa7hffu7TKGV3vZd6IFM+ligf7Hy0CkmkWcMpRzE
	 iAcMdmOt3tK0Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso2066461e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr33grto5nCiw5UXqC4LGBj6vSSgSBvWPQuqGUpRaQcy4zr3W4LGLwLT6NkymA/LK7XfqTGHZNPZgYEN4Tgvqak@lists.infradead.org
X-Gm-Message-State: AOJu0YxGewdymVAnFKKnXDenwSlv2iMBgahJZ6xkjeYFofV8GbQSavao
	YkxrDzG4Ryhiy7oqnSFONjx+turu3SFz/jvqkSA40Sf33XlEnB35d4l/7YGq7gP06P/MLLd/pf0
	upjsBkYkYzgiFIVxrLkkNH3kiCMto8VU=
X-Received: by 2002:ac2:4bca:0:b0:5ae:bce4:b696 with SMTP id
 2adb3069b0e04-5aebdb8913amr1285650e87.15.1782858331615; Tue, 30 Jun 2026
 15:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-4-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-4-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:25:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLk9Vw6tv+S0jno80g1cQNOJ8UH=E_XKEnXdbdKB6QMWJg@mail.gmail.com>
X-Gm-Features: AVVi8CeKBUAk9hYd7-xedVdQUq3OtUOkiZl_3QiYFyIqzcOrLBrHLUbSYsRIb2A
Message-ID: <CAD++jLk9Vw6tv+S0jno80g1cQNOJ8UH=E_XKEnXdbdKB6QMWJg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

Hi Manikandan,

thanks for your patch!

On Tue, Jun 30, 2026 at 11:25=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Register the cached SFDP as a read-only NVMEM device rooted at the
> flash's "sfdp" child node, exposing it in on-flash byte order. This lets
> NVMEM cells reference any SFDP data: a fixed-layout for parameters at a
> known offset, or an nvmem-layout parser for vendor data whose location
> must be discovered at runtime. The device is only registered when an
> "sfdp" node is present in the device tree.

It seems the existing serial NOR driver core already reads out the SFDP
and stores it in  nor->sfdp->dwords, right?

This should be mentioned in the commit so we know when the stuff
is actually read in from the flash memory.

>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
(...)

> @@ -3204,6 +3204,11 @@ static int spi_nor_init_params(struct spi_nor *nor=
)
>                 spi_nor_init_params_deprecated(nor);
>         }
>
> +       /* Expose the SFDP as an NVMEM device. */

Add "if and only if the flash has an SFDP"

> +static int spi_nor_sfdp_nvmem_read(void *priv, unsigned int offset,
> +                                  void *val, size_t bytes)

Name it _reg_read() to mirror the nvmem prototype.

> +/**
> + * spi_nor_register_sfdp_nvmem() - expose the SFDP as a read-only NVMEM =
device
> + * @nor:       pointer to a 'struct spi_nor'
> + *
> + * Expose the whole SFDP, in on-flash byte order, as a read-only NVMEM d=
evice
> + * rooted at the flash's "sfdp" child node. This lets generic (fixed-lay=
out) or
> + * vendor (nvmem-layout) cells reference any SFDP data. The device is on=
ly
> + * registered when an "sfdp" node is described in the device tree.
> + *
> + * Return: 0 on success or if there is nothing to do, -errno otherwise.
> + */
> +int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> +{
> +       struct device *dev =3D nor->dev;
> +       struct nvmem_config config =3D { };
> +       struct nvmem_device *nvmem;
> +       struct device_node *np;
> +       int ret;
> +
> +       if (!nor->sfdp)
> +               return 0;
> +
> +       np =3D of_get_child_by_name(dev_of_node(dev), "sfdp");
> +       if (!np)
> +               return 0;

If this node name is required to be named like that it has to be
enforced in the schema.

I would instead check all the nodes (for_each_available_child)
for the right compatible "jedec,sfdp".

Yours,
Linus Walleij

