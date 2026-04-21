Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021CAF327CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=; b=ddDzNcD8EzfxGQAFicLoPfqRaH
	bt/b4do3+1uXhski+iCJO/B2TqAZJWOivTWvO3o+9FAnwVUb6XFtEOP90E5jCexoHZMlY/GHDXH7u
	06H1oZ3xzu6T06M7K0TiS36hlzsKKEZ8ej8MVu6gckDRx1wWUYgG4wXyPb6lKz2jUBw2V5bdsdpGd
	ZrMyPKHfU5gNEUC+bCPmVu3lXnWV1nAquZN3WlW28xDBJXgDbvqsKnKWIEMEWSVM6uZzZdUtr1LeC
	ZDMTHf5b6YpuPqppV6RrQSip8FW34qdsIP6cNbnubYnf0asxzGj+5TuXLXk9s2d4g2NOrVtgFdcKE
	W4Ny3m5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7BO-00000008JMl-01Wi;
	Tue, 21 Apr 2026 09:14:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7BK-00000008JLx-2M3x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:14:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b788a98557so3028195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 02:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776762849; cv=none;
        d=google.com; s=arc-20240605;
        b=T0rWKQYtLmTc5DBcQLgaw6ny1uX9Tqk2LuX0ieHcYu7pukiF/BB9K5P5x2TjW1o3h8
         fVe6sjr9aEOx9lJRCVxFJeHZljck9zMVFFCpoPT+H2O2uTQgsjyaUl7yCZBTgdnj99SY
         5j7goR1inOFW+EH/Ge021sGZVJEWOLjr468c5IqE/iZQNy7pW4MwMHwcF4RB3tenWHPQ
         j9B8GChlnJCHHL7IMwLDG7IX8tyOrZvdIGwOB2gD5kdZdjiRUrvLKJI7ZmOmI1AibsCv
         2kEIS4VfuNnjj1BGvmK2q68Ob0tYlKawGaFoxLIeDghCAVoTtCYqc1l98K7OYvOXJb8j
         v6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=;
        fh=ViZAY7OuqefCGt7PaSMuwjBVrLcjle7FAL0BUGH3UlM=;
        b=XFTvq2ex9If/YL3qEX+OFIY0l2R6Vq0UJPow+8zMHWXRweFSRn64y9SXdP6/kGZS99
         qPY3l8jVq1rVevYq+B2wM153ZvPcydk8VxzNpj/5ecxv0THQklhpWkFIRW/sMcEf71tT
         8MvnPmHkQ96niy626rmc6iz+pnpbFfGy8ZdABHXJCYV7YiAo2NrJlFtYpSGK5Bx8t4WV
         Q7WdWGRV1zCC6zKABkfsVOYxmNRaNeo96qCg6qXBsvWera1KWgmxiXn/GRD33fKCum2A
         ZqmuH5UmNrLcNGzGquQzaXlIAyUQD4BsMdWsA1Lt+qA5qmB19jodSZ8T6Od0xIz/TrzE
         OM5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776762849; x=1777367649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=;
        b=DhxVxE4W8EA56IR3qCLFKojVvbD6nXvBJj1vV6Ngl5nJ5wtA8WBFuTPuBvKwqUQpMV
         Dd/UAlczwAsrFYA0yFTdeUzH15n6t9rn0FVp72Ea3Vzdyl1vN8yNaUc3e6v4ge5STh0e
         /VhdyM36B3GnMuL8xjRJ2Hzvmsk2bPL411LdTgraXPOFtcNpyVfkf1/WAXu5F/uKTA9a
         z68MyCJDLWsvF9a5Co/mNwdX4vWJiVYOEJjTLZg41XULBhDYmNvEHw+YbR48bEq60LM8
         QLwYLlE/lHnx99gUsd6HvA4za8pgYrniRufVPOy3cJNbPP9cT4+OJKN/hYvApc6ZPhA/
         jqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762849; x=1777367649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuf/J2tmMgGjZTkx9qFzoIJKXecVr6IXY6lWgVYmZ1s=;
        b=kfI8SO8+usZ1+1NvXLkWB5l7e+shraNwtGkT4evakIfeRaC4BiCWa4BOepzmKpIaB2
         gO8JT4i6nLNCxLhTW/2WbjlmxApYcQlum6f1Ry+NBi9VU9MbPWQOrXBSCXl2dmaWyRAv
         giDYndRYz1NV8Z4ib5bzPbb+IoaY11qWpcWNyTcoQCU4XKqe30/6Qc8msjwd9CqttKJj
         iYslz8f5J0QcPBOykcWpPIUoSeYjQdXfzN5498cSA9AXhZZgMh61z6KrLdXUeDkYwKIw
         R13m+U9jux8iWC+nHFQGX6ijbfnCUXMAbFI9e8N9W5/5VBpJQZ4TdDwzsyi4ly4nPYj9
         Mgsg==
X-Forwarded-Encrypted: i=1; AFNElJ8/DCmHicS/NZoYQ7nKENEJXDHYBCbYKCQFSrftQhl/qO1T0FwqYAHAHdwgP96RNxbkSCYKhPFkprEnT+53ulXa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbqv+qq3fEcr6nin1WtUYRHuTsiVenSfCJk6yPbDZOQwYREZ6G
	5GuVxZWg6YNUjjJfnsw4fDIHc/Dnn2oaiM7u1CzXe6cjZdVIztcDkdrZkhSSXvAGtVjLjKjBJnC
	JxjWYwunnkYzdjWpgyzsuJLUfhFFgaFo=
X-Gm-Gg: AeBDietB1gKfH2a/UGkU6As1QJeSRDAZjOzxZAJGBZ8vF/joaMbmevb27per4idyCcN
	6Fa2sriF2XdXNRl2f/2TZBsjHxztTspQ8kISw1fCumM4WMkHItTHjewpAGGMvHrWuZGdPbZ66/q
	q6nCxkPnoAtis0OFiXhbojZmV7Y78/fEM80/sIhNvgwkOzxyuBwosVNui6rqRQIABzlMi8wBnOf
	q2pEcHB7srLLrOcGabqbo2lsMb8QhGTuF8xktpmU05s6DxeYAZ0ybbhMrIIAUpKginyMEorpK+I
	rUmcieSVaLmm53c0PQ==
X-Received: by 2002:a17:903:1aae:b0:2b2:45b7:306e with SMTP id
 d9443c01a7336-2b5f9e85fa7mr170155595ad.3.1776762849302; Tue, 21 Apr 2026
 02:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260420100854.2095549-1-shengjiu.wang@nxp.com> <lkwfzz4lia37wv56g6ymzpossm42epz2oylhl7vgdpp7odt23h@vszl4uu2wg65>
In-Reply-To: <lkwfzz4lia37wv56g6ymzpossm42epz2oylhl7vgdpp7odt23h@vszl4uu2wg65>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Apr 2026 17:13:57 +0800
X-Gm-Features: AQROBzBWcJIwpzrKFBZScNTFM92k2xv5PUM8F5xurNN76m464r4UBrs-7HGJBag
Message-ID: <CAA+D8ANwT0GKusZtvo6h8mzVf=xXSEkHXsb6nwHGZ2YQzPm5ZQ@mail.gmail.com>
Subject: Re: [PATCH V3] dmaengine: imx-sdma: Fix SPBA bus detection on
 multi-SPBA platforms
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, Frank.Li@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_021410_727159_557EF981 
X-CRM114-Status: GOOD (  35.10  )
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

On Tue, Apr 21, 2026 at 4:57=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 26-04-20, Shengjiu Wang wrote:
> > i.MX8M platforms have multiple SPBA buses under different AIPS buses.
> > The current code searches the entire device tree and returns the first
> > SPBA bus found, which may not be under the same AIPS bus as the SDMA
> > controller.
> >
> > This breaks SDMA P2P transfers because the SDMA script needs to know
> > if peripherals are on SPBA or AIPS to configure watermark levels
> > correctly. Using the wrong SPBA bus causes DMA timeouts and transfer
> > failures.
> >
> > Fix by searching for the SPBA bus under the SDMA's parent node (AIPS)
> > first, then falling back to a global search for backward compatibility.
> >
> > Example device tree showing the issue:
> >   aips1 {
> >     spba1 { sai@...; };      /* Correct SPBA for sdma1 */
> >     sdma1@...;
> >   };
> >   aips2 {
> >     spba2 { uart@...; };     /* Wrong SPBA - found first by old code */
> >   };
> >
> > Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support=
")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changs in v3:
> > - add fallback to a global search for backward compatibility, which is
> >   to address comments from sashiko.dev
> > - update commit subject and commit message
> > - add comments in code.
> > - add Cc stable tag
> > - Don't add Frank's RB on v2 as there are several other changes.
> >
> > changes in v2:
> > - add fixes tag
> > - use __free(device_node) for auto release.
> >
> >  drivers/dma/imx-sdma.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index 3d527883776b..592705af2319 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2364,7 +2364,18 @@ static int sdma_probe(struct platform_device *pd=
ev)
> >                       return dev_err_probe(&pdev->dev, ret,
> >                                            "failed to register controll=
er\n");
> >
> > -             spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl,spb=
a-bus");
> > +             /*
> > +              * On i.MX8M platforms with multiple SPBA buses, we need =
to find
> > +              * the SPBA bus that's under the same AIPS bus as this SD=
MA controller.
> > +              * First check the SDMA's parent (AIPS bus) for a child S=
PBA bus.
> > +              * If not found, fall back to searching the entire device=
 tree for
> > +              * backward compatibility with older platforms.
> > +              */
> > +             struct device_node *sdma_parent_np __free(device_node) =
=3D of_get_parent(np);
> > +
> > +             spba_bus =3D of_get_compatible_child(sdma_parent_np, "fsl=
,spba-bus");
> > +             if (!spba_bus)
> > +                     spba_bus =3D of_find_compatible_node(NULL, NULL, =
"fsl,spba-bus");
>
> And yet the search is still broken for i.MX8MP case since this platform
> has two sdma engines below the bus@30df0000.

I tested on i.MX8MP. It works.  Above line is for backward compatibility

The search has no dependence on the number of sdma engines. It searches the
spba-bus, not the sdma node. it will find the aips5 first, then find
the spba-bus for
sdma2 and sdma3.

aips5: bus@30df0000 {
      spba-bus@30c00000 {
       }
       sdma2: dma-controller@30e10000 {
       }
       sdma3: dma-controller@30e00000 {
      }
}

Best regards
Shengjiu Wang

>
> Regards,
>   Marco
>
> >               ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> >               if (!ret) {
> >                       sdma->spba_start_addr =3D spba_res.start;
> > --
> > 2.34.1
> >
> >
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    =
|
>

