Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADACD41C27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=; b=0RzvMFkMTSWlY88w6r+iy6wdgL
	9UMQVocivsjeAQAvOfQI1dkEiIGbACymb6N5ViZEqeiHdqrA2ccoG3L/0Bij6xxJE5dfjE/RubjKi
	ltLoWruA0zzq/HYWmvy1ZSt6RWERi8V/o1Q/vf/qT0ObbDRarp+/4IGfd15xPymwZks2zNgZ8jlwe
	S325xICv0cbtajBpdbJuJBR4FO+3Nf3xhogS2OE750fK3yCnXzpCvvok4cprdsLLMfyckExvD6rDN
	u4A2CZ1GZA0cRv9dW5RfBpS/+mdn74ZSlh9q3gKxBkYgump4hivrYIGD3ootg0voqEm5WCQK/QjIv
	5cNTCxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA77-00000006KpK-3TvG;
	Wed, 13 Nov 2024 09:56:41 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9zK-00000006I7m-2ZbN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 09:48:41 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6cbcc2bd800so4951396d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 01:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731491317; x=1732096117; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
        b=eA744vEAdPsY5513UWm1tICnesA4mudZHNw73keCFDU7Y0DfO6OM0XPIB1aNvW2Fpa
         BaV0rVj/5n+IVqO8uN377pQvR4lZatYbqt1jCwtyrMqjtmYAYwb/xA0zizr6ocmWZ5aj
         LxD8GHLdQGoIn8odHaLMFKKdjYPey7c5g9YEBFIr29unaCCsrrwnX79GB86cortw2f5R
         w6C0mwzghtR/23vr8AEsdBcBpAXuZ9g7f/LhRMvNyXfTqB8Q3EVNGVo+AMekqX7dA49Y
         H6KJ/t0uKCcuVhKVaW4U0VDl8uzsKWUdtV06zAHaFNqn65vgR9xunsSJlNtTz1YdHzqi
         a9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491317; x=1732096117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
        b=q8prEYEeEynyfpVS9Q4WBJA+Hc5xnDjXNj2W2Au0QZCSbv4o3dmlx/i4aRc4Ej9C6L
         uHM6VglcEZr0X8QScOekuPY8PfXE95iEAF71dGBZjK/GUmcbpo4QnhUtUKddmHXtay/h
         ZeZR9OLfth7WRylYjH+e+H2BTe/GQ1l9ajwwZwS6+4msr7jPWe7V2vl4wFg03sV0XI78
         ldBjUKOXfgGAl2aKWDOVZhRRix4f/Hn+Tu55xDEdq9eYMFWLZgUptdH2jole0IwwP2VC
         bY7nhpHuZwMzcxrx0uW4HveRFWcFB4EeinsE97Y6LhAQNYStNty0zs+5GcVi0jFYys6J
         8C/g==
X-Forwarded-Encrypted: i=1; AJvYcCUBV7iQiU86iqApsn8UmCQg6Q22ILKcnR4gEIF+fCdXf5Q12DLUmwmaqjFPlTOliJXgrKQnSArZwMMwmDZ5mWkr@lists.infradead.org
X-Gm-Message-State: AOJu0YyWU/87aHoXd4aZJRJy5z/WxkslNcKBSnAW1xyMM7sZS+7uzfXK
	c7lGw0iXc5RtTrPqH2UtRRpJE/KiV9diyIpZ+pH4Sul1T+XkvgOw9P9IViTNMYmPmfwfEIw1InO
	/GTYiiWfCWF1iO1vvRWnQwjOibYQ=
X-Google-Smtp-Source: AGHT+IHcLy8AEacbQGHGgfaEwyTub+t1gLTfFsAT9DwCgvxu+gX32+4tA6aRof7gwejihIaPx+ov6qt1kZkNWsKHlks=
X-Received: by 2002:ad4:5d49:0:b0:6d3:5be3:e711 with SMTP id
 6a1803df08f44-6d39d57c179mr302997596d6.9.1731491316900; Wed, 13 Nov 2024
 01:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20241112211442.7205-1-rosenp@gmail.com>
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 13 Nov 2024 20:48:24 +1100
Message-ID: <CAGRGNgXhtPy_G9O0n7dEhcAX3sWN=08tF9tgFpLs8V---uELYg@mail.gmail.com>
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Byungho An <bh74.an@samsung.com>, 
	Kevin Brace <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>, 
	Michal Simek <michal.simek@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014838_766449_390025D6 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Rosen,

On Wed, Nov 13, 2024 at 8:14=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> In probe, np =3D=3D pdev->dev.of_node. It's easier to pass pdev directly.
>
> Replace irq_of_parse_and_map() by platform_get_irq() to do so. Requires
> removing the error message as well as fixing the return type.
>
> Replace of_address_to_resource() with platform_get_resource() for the
> same reason.

Sorry for the drive-by review, but I have to question the utility of
this conversion.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index cdf0ec9fa7f3..48e93c3445e7 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -1673,9 +1673,8 @@ static int grcan_probe(struct platform_device *ofde=
v)
>                 goto exit_error;
>         }
>
> -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> -       if (!irq) {
> -               dev_err(&ofdev->dev, "no irq found\n");
> +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
> +       if (irq < 0) {

In this change and a lot of the others, you're not removing the "np"
variable, so you're basically replacing one wrapper with another.

>                 err =3D -ENODEV;
>                 goto exit_error;
>         }
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/n=
et/ethernet/freescale/fs_enet/mac-fcc.c
> index be63293511d9..9006137e3a55 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> @@ -83,8 +83,8 @@ static int do_pd_setup(struct fs_enet_private *fep)
>         struct fs_platform_info *fpi =3D fep->fpi;
>         int ret =3D -EINVAL;
>
> -       fep->interrupt =3D irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -       if (!fep->interrupt)
> +       fep->interrupt =3D platform_get_irq(ofdev, 0);
> +       if (fep->interrupt < 0)

This one and others like it are fine: it's much cleaner to use the
"platform_irq()" function instead of reaching deep into the structure
to grab the "of_node" property.

That said, in this case and probably a few others this is a driver for
an OF device so I'm still not sure this actually makes sense.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

