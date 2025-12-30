Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8EEE95A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVg7jxPsCBHGWb7o7CsiEjtqnH/DgSZg+hH6XuxK1WQ=; b=RSnmD6JGIyIYGXG+ogCsfnq9mb
	hCWN70XohCzmj1E+O6P0kmW5pZorp0qITtYbGNe99pSfwJRmzkecZk5+c4DGMQHCUCpTha87Fb8LH
	8BkofpSMI+EHDn3lSGpsmjWYE+7cPzfWZGf2MZ0FuogMX8RKkjAojHdgbzeCBsGbWzLFHddzU3NRz
	kgwjkIxNkI5tugicQvuBa6rIRdDyQjf+DpwjluwSiicT6dzdt6dxh7wlL/UyRDCaKAhZtpTMUCxoX
	ENvYekxtLDBs2j1Eep2ZF+LF9guIsSad9jHgZdDaIXo1x6WMgm1G/IcNQHRZMsPi+Wzo/aY7kpXJt
	rsZJ8ZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZdB-00000004rLg-1oVD;
	Tue, 30 Dec 2025 13:19:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZd8-00000004rLC-27wE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:19:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so11784059a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767100756; x=1767705556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVg7jxPsCBHGWb7o7CsiEjtqnH/DgSZg+hH6XuxK1WQ=;
        b=ebyOpzSOlmpiUCTvvD9S4LOHDmPMpkvhNFNyND+tYQh0nPgrBXNI78xWYW+38oDZSw
         tn31Fq3dx/BR4vMWROsUTk6OIyXuJNvsEDiMWSXbwPY6uA58K9hmhPiaKpLyorgvms9b
         Se2JBoHJpdRCy7qjM6zeGP4rUwd1/Gtfny/XoVfWe/yZYo7hv1AIVobtnUbP4Oq+oI/l
         LnZ+upRq7y/KeE3Rpu1N3Wf7rgiJXosgaYL+rpDo7gigI2FrdY9nsB5eq8kKKj0Q5AIz
         MhQicXWvsLUEEFucPAOQQSbNMKogdmIAtWm4PKJKJyeHZkpWmhl8jnJ+kkKM7GzsS63Y
         n2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767100756; x=1767705556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVg7jxPsCBHGWb7o7CsiEjtqnH/DgSZg+hH6XuxK1WQ=;
        b=preUP7WjuvskARuHeyuHJ1U7AzdjPe8o+l7Quzftp4E7eWigbH88XEa9OVmDGvV5KM
         j/z24FeagtbWAo93EVX0POg1yE7xXHciyNhEqqvbaEkL/CTqrS/ek5XJNdnvaRUo4oVJ
         S6YIC9Aon2EX5eA5yw4b/pAZWRfYSGVkKlntHojsDXy75LMxprzeQqRBiJMbCvvq96CA
         lqTdfoG+R7oyv2tH11/tOvXwj1McsWJ4pNObjkn+AO8FPZJaC5RqFQLN0zkrAGQPAQUJ
         LEBCsb8gKho3amREON5gIewdx6GUY1U6aILdzNZQAioer70SVilfcDOWwCqJ03nEMsrP
         koBg==
X-Forwarded-Encrypted: i=1; AJvYcCXSYcS0uN4uTXDYIQAn9f6q/4cSBnj4orBCrzaODzwhb4RuAD7ioyhRYKbrllgjptJ72OrzyGUovI/V3iclnX89@lists.infradead.org
X-Gm-Message-State: AOJu0YwUO995HXBEc5+/6GY8J0TVRAHaDhfk3Zj07FHWu65uMEozHgCn
	mJksCe/2+tSD0oLzRU8e69ePET2YfiO5sZXMzCCCDNj8NWoP14bwKoPWCvjNJ5fo0MaIzOQRVnF
	Py+PL6FJmGJz1cX+LvYYePfjFeAT+gtpH6gpVAo3HHw==
X-Gm-Gg: AY/fxX46qNR/v/LhRzGfv2EQJMnGsHxErNhl3jkt9xv0sftDNlj8qcmmboQQBsJH7iG
	KaZ+BeMAkSixtou/c/wV1EyJ3gI1HO+CI93kieF//UBYWQqd6zF7EeP0ZkoLsvPMproCEusPlyc
	Nb+hERvrY77F8WJMWlRrx4y5uZMnz+DqzJ5Tstt9hq7HaPKnpGB4p8QwyBMP9GRFCGaQSqFmavq
	T/vOC6/Cf/rOlCQAfs8xXx7dSDvMg+cah4ElXSt41DC3TeEuIZqUjw72emvg8cYJq0w02snCcAD
	H7Lg+aLE9xEx/WqzlAZ3bJiVN4PFyzdGRZ3ddL57/64WG93nRaeo
X-Google-Smtp-Source: AGHT+IEmR/sUysOjbEHwlCYRZf3GAy62DmeIroQ8rAQLTd36sLOMpKr0juQStEhaH7R4NFBMQh1Bj3mg4pQKMCaWdh0=
X-Received: by 2002:a05:6402:42d0:b0:64e:f6e1:e519 with SMTP id
 4fb4d7f45d1cf-64ef6e1e772mr4128289a12.19.1767100756030; Tue, 30 Dec 2025
 05:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20251203121208.1269487-1-robert.marko@sartura.hr> <aUF4OS4DsmRlQQt3@vaman>
In-Reply-To: <aUF4OS4DsmRlQQt3@vaman>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 30 Dec 2025 14:19:05 +0100
X-Gm-Features: AQt7F2qe8u7JIqD_s36UvUenlFX1mMzbx3PprH-BCcOTY8WkqWfY72IF1X03T8I
Message-ID: <CA+HBbNGv1YzZhBfAO7JvossJeM46CFcPmUtDmYaK4Fm8iB9stg@mail.gmail.com>
Subject: Re: [PATCH RESEND] dmaengine: at_xdmac: get the number of DMA
 channels from device tree
To: Vinod Koul <vkoul@kernel.org>
Cc: ludovic.desroches@microchip.com, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel.machon@microchip.com, luka.perkov@sartura.hr, 
	Tony Han <tony.han@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_051918_571834_0504555D 
X-CRM114-Status: GOOD (  29.31  )
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

On Tue, Dec 16, 2025 at 4:18=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 03-12-25, 13:11, Robert Marko wrote:
> > From: Tony Han <tony.han@microchip.com>
> >
> > In case of kernel runs in non-secure mode, the number of DMA channels c=
an
> > be got from device tree since the value read from GTYPE register is "0"=
 as
> > it's always secured.
> >
> > As the number of channels can never be negative, update them to the typ=
e
> > "unsigned".
> >
> > This is required for LAN969x.
>
> You updated the changelog, but tagged it as resend. It should be v2!

Hi,
Sorry for this, I sent the wrong patch and though quickly resending
the right one would be better.

>
> >
> > Signed-off-by: Tony Han <tony.han@microchip.com>
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/dma/at_xdmac.c | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> > index 3fbc74710a13..acabf82e293c 100644
> > --- a/drivers/dma/at_xdmac.c
> > +++ b/drivers/dma/at_xdmac.c
> > @@ -2257,12 +2257,29 @@ static int __maybe_unused atmel_xdmac_runtime_r=
esume(struct device *dev)
> >       return clk_enable(atxdmac->clk);
> >  }
> >
> > +static inline int at_xdmac_get_channel_number(struct platform_device *=
pdev,
> > +                                           u32 reg, u32 *pchannels)
> > +{
> > +     int     ret;
> > +
> > +     if (reg) {
> > +             *pchannels =3D AT_XDMAC_NB_CH(reg);
> > +             return 0;
> > +     }
> > +
> > +     ret =3D of_property_read_u32(pdev->dev.of_node, "dma-channels", p=
channels);
> > +     if (ret)
> > +             dev_err(&pdev->dev, "can't get number of channels\n");
>
> Do we need to log error, I thought the API did that...

I dont think API helps here, we would just be left with the error
code, which can be hard
to trace back but I am flexible.

Regards,
Robert
>
> > +
> > +     return ret;
> > +}
> > +
> >  static int at_xdmac_probe(struct platform_device *pdev)
> >  {
> >       struct at_xdmac *atxdmac;
> > -     int             irq, nr_channels, i, ret;
> > +     int             irq, ret;
> >       void __iomem    *base;
> > -     u32             reg;
> > +     u32             nr_channels, i, reg;
> >
> >       irq =3D platform_get_irq(pdev, 0);
> >       if (irq < 0)
> > @@ -2278,7 +2295,10 @@ static int at_xdmac_probe(struct platform_device=
 *pdev)
> >        * of channels to do the allocation.
> >        */
> >       reg =3D readl_relaxed(base + AT_XDMAC_GTYPE);
> > -     nr_channels =3D AT_XDMAC_NB_CH(reg);
> > +     ret =3D at_xdmac_get_channel_number(pdev, reg, &nr_channels);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (nr_channels > AT_XDMAC_MAX_CHAN) {
> >               dev_err(&pdev->dev, "invalid number of channels (%u)\n",
> >                       nr_channels);
> > --
> > 2.52.0
>
> --
> ~Vinod



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

