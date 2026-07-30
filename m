Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B9C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gobfjnthWgTQXNW9RE05SfOdwzRlTBDEl0y0GpPD5ZU=; b=jlZLe8eIF1deER7zouzCycTCkU
	eeOBFRzyW42+c1y90Me8FCMf9rGpWnwKZ+j21uciohod/nAny4n6IjgjZmC9Z0KJdgfbvcb1ON+6d
	HcHhV8qkmCCLVxoOrqcCSlT0QFXbuQ5cMOJstZUaDQlc5xtLw7+o+qBvzZuGUGt++awl9Gd55UFia
	XgSJgRNzFpTX6kSwElmYMLBQNq8CbIHpj7GZDPFSy70OfV3JYqfL5rUXYgpBgqoWPtsrec7pnFItX
	F38hcqNmT2BCBT2G3zkXOAgNQJychHSN0pBmn3UYcOrUHU/csOQS5SXK5VywKk9JhoQlZzcLzvPVA
	dt2uyk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpF3f-00000009CL8-0d04;
	Thu, 30 Jul 2026 00:55:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpF3b-00000009CKZ-3OTJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 00:55:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2351863a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 17:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785372930; cv=none;
        d=google.com; s=arc-20260327;
        b=BZnmwNv5o5xjDOhH2Ytmu2mrXr0aSG8aNstqVa5PPZFDe7PUxVN3cBK/xC6iYqpSRL
         fzS7kvJsUewPWN/OL8VQSNTBUYWq7Hn/xZUFpNwUj4ajJiZLyedQL1/653ytA0owc3rb
         7zhwOo50KtTZZXulITwM2c+rPecA3w5gpkTW9cUpGH1HaMsNrE8hYXt3mBhmLAz+/46S
         T8tFCm8EY6EYGPM/ZeDNcrLhFzVVQ0ceU+KWh0K0D6rWKLYNLn0hiBTHEEvKyyjiiIB2
         JZWATJ1hyfUvOqVwL7FzPUG96GG8Nbz9rKEvrLcROyYIpMAMNtFKu6F0P+KLbena5lDb
         dlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gobfjnthWgTQXNW9RE05SfOdwzRlTBDEl0y0GpPD5ZU=;
        fh=cscvIPUujFd8/tXw85lW8WN6JOiahgOP+mxvpDttFKM=;
        b=r66WyPUTMadDDa1EeJBQWAk97cXEn4RJbEkH8Q2b2qNq+vw4PT5/j0t3efT0c23xg7
         NSDazJo8iv5cZMeivBqLbWRGQ6DNjzd8cyyzgNEZl1Ei/GeGE7lHkcdNqmtHrKGISz49
         HPsOIHMSSu2w7T5y9he850g97hGcwBoxtSsyLweDiWIW3a2sWivLABLdGNNkjGcFLgYR
         fD3VsmQGD8OmvxyJTmK+V+LotoWk46Cc737P2/qXojhO71f7AZgRsROCS9ncq4S7Tw4X
         xPCt7od97D3QcCPJ1ttfSs3WVQOE1Ed6vMlLVUxbz8rsGwl6Ur6g7WWiIXqbQTCtxHxQ
         HqvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785372930; x=1785977730; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gobfjnthWgTQXNW9RE05SfOdwzRlTBDEl0y0GpPD5ZU=;
        b=Z3q/eZkzj6QL8dJdnbIFoyH3ricRAuQLdfTwrfWaq5cCnl3S0fvfsYeIFg1nZDzuQz
         ZKsuAGAYdkvjAr067FQIlJnSkWXZE91kvqmGiImXBm0lofA/tN4Cp0GnY0sGvP/dHgAo
         eHSBub4UWJTpGhEdWG6gqgi1+aFkFP9I05QGDU4rlYE5OXCOl0g5xnACo00cGhwlaKyD
         LFzfxM/VHmeDaXSxbUCxHjleTqD7bRLFPZorTmYb67KUc1NZ0klN0rDHXNEHKkSr1QY3
         OqrytLZweKPcf+r5c1RIkl6PgWjtzaATbz1l4+pToN9ek3uQFnU63sFspqqDeo1LUDix
         juUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372930; x=1785977730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gobfjnthWgTQXNW9RE05SfOdwzRlTBDEl0y0GpPD5ZU=;
        b=XVJ8i+Z3Nm2w+vqCfuqPzyIoqYqK8AKt1CyoBydZaLHxzd9clo7Vg/dAYK/9hjh9CM
         EuDbFL9w4S4bH5moP9sLKwTooFhp63Pxihp18DDHNVUGu8H0+I9CCbKq1oDPz1aPARl+
         4s5T2aLkLqDwv+yJWdo1FF12vHIefowTz2tF2swbYtxVDSNws63rlsGoe+DFeg184kk4
         UBASaxDSZVK8n0yfD2VQO71qdQdXXjRJpUbckgh9mxl3aexfedgZeOdg6cl0WnXDEiUP
         jIglTBl9Dh5KJ0lzdakPEsZ7jQZWb1uH4npmqsk4iekYOga4cwo9lt6ZnkP5r1xmI3e3
         KvQw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8sY/kNUs2O7RCS4Tjb7zcatF9s4E4VMae5e/dve+n+xVEL7r5D3kdkCRL5Syr/z07riFhMkftq1ettZN5WwMC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1I1CUnahrYM7n8x+j89Cu7+rgvxMwWOqlALUv+wGo7Xnxx4Xa
	MuGwEiWOiPWJiyYAYS5Ju+ygeEbJ2mBDGbRoNmnihMzEcHw+sEPR269rh2tD9Hi4qs57Gkp+Vtr
	kLXochnkewLeBaCgGmzEO9iFR+B1AJ+Y=
X-Gm-Gg: AR+sD10WO67Wx5xa6+xahVZps6AvcGlAC/+iQLo/Ep64rSzgfYDe9coJQr7vl8C8QSy
	IvN3ZirgbXiAXL4JtQVB9O4qiA7j8jEZVHf7YSEdYuEJxitGBNyKyRh3BHirBkmN5hWlrTWXcn8
	D62Qokg7+lk8Rb7KsqvachkfTV4H0N6ya1IhMNyif9K+WhbnQPs9N7LN4GT1TKtzwa5Gf6+P02q
	O5cJyR61o1DNCnzPVDqaBi6GVVK+rL80Ufo7+g4ircSeY5iu/f1e9UPIa7YOsV/UQqyATzT2Mfj
	AJFqppGri0PGGd9YbpSFsWa9oTowxetPNaaDQkQoYBXbjN+npwMXpoozCcgnYn9+Z4fdWOon5y5
	K/08TFz5wIwDU1QI+Atr0BAS70ZspdauDengrMm2IrddCtydIVg3Ut7kNF23i8TLknl8iqSyALm
	hMb+RHx1FX7WdKkey+iE++yHEX4AJFBrfvX5m9vWLTKWDVbr74xV6RqR0=
X-Received: by 2002:a05:6402:ea2:b0:69f:4a9e:a872 with SMTP id
 4fb4d7f45d1cf-6a07b886b7bmr217764a12.37.1785372929473; Wed, 29 Jul 2026
 17:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260727234408.296186-1-rosenp@gmail.com> <CAL_JsqLLME5rN_HW4hEPfGcLBZX-r-10XJ_=cvU1nq1x4cJEEg@mail.gmail.com>
In-Reply-To: <CAL_JsqLLME5rN_HW4hEPfGcLBZX-r-10XJ_=cvU1nq1x4cJEEg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 17:55:18 -0700
X-Gm-Features: AUfX_mzhB7IANok2yPa703dtvh2qN2QOSacOzLqKPShSKaU7fBbZLxBxN9gcXIg
Message-ID: <CAKxU2N9Q0tWCtVk2jn8bWu4H5YGGiKnxJksxZ-MjuKtoupzVmA@mail.gmail.com>
Subject: Re: [PATCHv2] PCI: iproc: platform: use device functions instead of OF.
To: Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_175531_899857_15D657EA 
X-CRM114-Status: GOOD (  23.88  )
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

On Wed, Jul 29, 2026 at 5:32=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Jul 27, 2026 at 6:44=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Since this is supposed to be the higher layer file, use higher layer
> > than OF to handle this. Remove OF headers as a result.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: fix platform_get_resource() parameters.
> >  drivers/pci/controller/pcie-iproc-platform.c | 31 ++++++++------------
> >  1 file changed, 12 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci=
/controller/pcie-iproc-platform.c
> > index 4c9a0c4bb923..488ff737ec52 100644
> > --- a/drivers/pci/controller/pcie-iproc-platform.c
> > +++ b/drivers/pci/controller/pcie-iproc-platform.c
> > @@ -10,12 +10,8 @@
> >  #include <linux/slab.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/platform_device.h>
> > -#include <linux/of_address.h>
> > -#include <linux/of_pci.h>
> > -#include <linux/of_platform.h>
> >  #include <linux/phy/phy.h>
> >
> > -#include "../pci.h"
> >  #include "pcie-iproc.h"
> >
> >  static const struct of_device_id iproc_pcie_of_match_table[] =3D {
> > @@ -40,11 +36,14 @@ static int iproc_pltfm_pcie_probe(struct platform_d=
evice *pdev)
> >  {
> >         struct device *dev =3D &pdev->dev;
> >         struct iproc_pcie *pcie;
> > -       struct device_node *np =3D dev->of_node;
> > -       struct resource reg;
> > +       struct resource *reg;
> >         struct pci_host_bridge *bridge;
> >         int ret;
> >
> > +       reg =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!reg)
> > +               return -ENODEV;
> > +
> >         bridge =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> >         if (!bridge)
> >                 return -ENOMEM;
> > @@ -52,26 +51,20 @@ static int iproc_pltfm_pcie_probe(struct platform_d=
evice *pdev)
> >         pcie =3D pci_host_bridge_priv(bridge);
> >
> >         pcie->dev =3D dev;
> > -       pcie->type =3D (uintptr_t)of_device_get_match_data(dev);
> > -
> > -       ret =3D of_address_to_resource(np, 0, &reg);
> > -       if (ret < 0) {
> > -               dev_err(dev, "unable to obtain controller resources\n")=
;
> > -               return ret;
> > -       }
> > +       pcie->type =3D (uintptr_t)device_get_match_data(dev);
> >
> > -       pcie->base =3D devm_pci_remap_cfgspace(dev, reg.start,
> > -                                            resource_size(&reg));
> > +       pcie->base =3D devm_pci_remap_cfgspace(dev, reg->start,
> > +                                            resource_size(reg));
> >         if (!pcie->base) {
> >                 dev_err(dev, "unable to map controller registers\n");
> >                 return -ENOMEM;
> >         }
> > -       pcie->base_addr =3D reg.start;
> > +       pcie->base_addr =3D reg->start;
> >
> > -       if (of_property_read_bool(np, "brcm,pcie-ob")) {
> > +       if (device_property_present(dev, "brcm,pcie-ob")) {
>
> If the property is boolean, it should use read_bool and vice-versa.
I don't see it as a boolean in dtsi.
>
> >                 u32 val;
> >
> > -               ret =3D of_property_read_u32(np, "brcm,pcie-ob-axi-offs=
et",
> > +               ret =3D device_property_read_u32(dev, "brcm,pcie-ob-axi=
-offset",
> >                                            &val);
> >                 if (ret) {
> >                         dev_err(dev,
> > @@ -87,7 +80,7 @@ static int iproc_pltfm_pcie_probe(struct platform_dev=
ice *pdev)
> >          * core driver. For platforms that require explicit inbound map=
ping
> >          * configuration, "dma-ranges" would have been present in DT
> >          */
> > -       pcie->need_ib_cfg =3D of_property_read_bool(np, "dma-ranges");
> > +       pcie->need_ib_cfg =3D device_property_present(dev, "dma-ranges"=
);
>
> This is correct as dma-ranges may not be bool.
>
> Rob

