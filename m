Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFB0D41D4E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 04:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=; b=FSfvE92TQonsnyMS1khR5fsgcv
	Pkj6bvrunwQ9EdfzOJ0YkDOMickFNPNpzJe+4Fm4Fo34qs1CHJL/98FQluyVfo5X+eR7T+e1sa/IC
	saXv40M6eCf/j8hMJ8Pp7YrR1zPmbpKanwwjz0rcxVBkAG7bt/kWMQxU2T/s3kTmEIwaBuZboMQXj
	PFN49d0ZsQ8r9aah6vJhIkz1EAGJfNUiduvXhhL7TK9+yiMR/bRMUdQK+sgDNPqnjtHQycpgKOIFP
	u4Rmu0wmHNv8qdYcSf+4J0ibAZ8J5EMsCvhhDT2k125il2bA4+FfzaKzlW41jKcO4KoeuycC//rcG
	42ujDtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAiG7-000000028Av-1MlT;
	Tue, 12 Nov 2024 04:12:07 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAiEK-000000027vz-2JWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 04:10:18 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so4813681276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 20:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731384615; x=1731989415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
        b=M9Hrq5jegFZDcgpTFBaRCZSNNEDpdtMDksw/3zjPJ0HGajT8V7pNxGRTT2wcgLFTre
         dTjOxkFGh975YE6Dg6V12HG2Sy8jxDJZfD/1QeNssU+jPTmXGfw+WE/wNDmMJeotSCqS
         UvgexAK+zz4gT0QWqbR7nYvpzFSwQvUw98MrToPirlxxrOYmvxQwzrNy0nfOwTh0vBcL
         y2rCjjZjngwVw6AgH60KZ793MYN4RnWLQN0YdpLvKy0DdNe9nSRhNcfJ7G2JgWJia0Oi
         vB2UN2GPEkfQvJD+SlRpVtd3SgAJY8TfZJ+dK9TnxLucJPkt5CAe88/fukQJrV9j+EM3
         FneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731384615; x=1731989415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
        b=pwsgI/B42DvzUtq69eWN0BU7YpfKOaDiDR1UN7yI8mv9Kh1uIVyGH8y7z5tEU8Ha9r
         pIpvDJLngGzC0Iqo50wC/FjDHKBlslORLBsqHEA8F3Y26PCDSnKlpFp/geBcehBvpmtD
         G30Mba9HySgshL8R5EfMTeKn9R9q42E3KQUN8K6vOJlQK7g4Uird06gxqwMp7/xpZznR
         DOSAW2IKwyQXd/ZrrVZrdzcu8V105Mt26z+zpKkVoS38J2a1eCVnpnGoSGsu1rpMebe3
         qELqu8KL47o9o9LpTZVUulPEn3qrqt1IYtx4biHWBsoe43mtarPMIGfH2VEKNNmbJIpZ
         Z8vw==
X-Forwarded-Encrypted: i=1; AJvYcCWIk9YzFMA3RCmhY0uyJf21eeIoEb173y1daijnnkjpcbxuMS6e49+TUCF2jQ7CdX1IJQJ53DmUjiuwsQZTcnPP@lists.infradead.org
X-Gm-Message-State: AOJu0YxPCSRjbZs4yNkBspFOChqUzYv83v3k7Ldjhr4rhU60r++/5+o5
	v+uPsRRzxBMt90P+x9hAjsagmcSCTiXQA6/9krH7hhxIY5CwzJ2QX8yQElODutNLc5cv+/kZYpd
	4KRRvZsTOnV/uD1WmiHTywZ+SJSY=
X-Google-Smtp-Source: AGHT+IEEd9e7KYmg9hOChPdcooKIfQet+Ec2imFxx6bP82VRvCibSsbb8ecrhexu0TZ29275WhqN4tjEisNPdXIjqY0=
X-Received: by 2002:a05:690c:6b11:b0:6e2:ab93:8c68 with SMTP id
 00721157ae682-6eadddaf35cmr135388027b3.25.1731384615059; Mon, 11 Nov 2024
 20:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20241111210316.15357-1-rosenp@gmail.com> <20241111193222.00ae2f3e@kernel.org>
In-Reply-To: <20241111193222.00ae2f3e@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Nov 2024 20:10:04 -0800
Message-ID: <CAKxU2N-VHmVerombZ77uOHApi0aGBFi46oC1eoGTm5sakCVc4w@mail.gmail.com>
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Byungho An <bh74.an@samsung.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_201016_617710_5C8606EC 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, Nov 11, 2024 at 7:32=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 11 Nov 2024 13:03:16 -0800 Rosen Penev wrote:
> > --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > @@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_dev=
ice *pdev)
> >       }
> >
> >       /* Get the SXGBE common INT information */
> > -     priv->irq  =3D irq_of_parse_and_map(node, 0);
> > +     priv->irq =3D platform_get_irq(pdev, 0);
> >       if (priv->irq <=3D 0) {
> >               dev_err(dev, "sxgbe common irq parsing failed\n");
> >               goto err_drv_remove;
> > @@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_dev=
ice *pdev)
> >
> >       /* Get the TX/RX IRQ numbers */
> >       for (i =3D 0, chan =3D 1; i < SXGBE_TX_QUEUES; i++) {
> > -             priv->txq[i]->irq_no =3D irq_of_parse_and_map(node, chan+=
+);
> > +             priv->txq[i]->irq_no =3D platform_get_irq(pdev, chan++);
> >               if (priv->txq[i]->irq_no <=3D 0) {
> >                       dev_err(dev, "sxgbe tx irq parsing failed\n");
> >                       goto err_tx_irq_unmap;
> > @@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_d=
evice *pdev)
> >       }
> >
> >       for (i =3D 0; i < SXGBE_RX_QUEUES; i++) {
> > -             priv->rxq[i]->irq_no =3D irq_of_parse_and_map(node, chan+=
+);
> > +             priv->rxq[i]->irq_no =3D platform_get_irq(pdev, chan++);
> >               if (priv->rxq[i]->irq_no <=3D 0) {
> >                       dev_err(dev, "sxgbe rx irq parsing failed\n");
> >                       goto err_rx_irq_unmap;
> >               }
> >       }
> >
> > -     priv->lpi_irq =3D irq_of_parse_and_map(node, chan);
> > +     priv->lpi_irq =3D platform_get_irq(pdev, chan);
> >       if (priv->lpi_irq <=3D 0) {
> >               dev_err(dev, "sxgbe lpi irq parsing failed\n");
> >               goto err_rx_irq_unmap;
>
> Coccicheck wants you to drop the errors:
>
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:116:2-9: line 116 is =
redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:127:3-10: line 127 is=
 redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:135:3-10: line 135 is=
 redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:142:2-9: line 142 is =
redundant because platform_get_irq() already prints an error

I looked at the output. The error checks need changing too.

>
> You can make it a separate patch in a series, for clarity.
I don't think it's enough to warrant its own commit.
> --
> pw-bot: cr

