Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8167C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 01:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffGAcapN3R5fgPUa3yUZnlAkGuMraG/kj2eR0YNfPCw=; b=2zOHKKsyGFwMGD/EU5I5gnJwjb
	zkBhVNB2b4pW5tp8VKnTlo0OrmkxxW2/kW+iVH6799jS7HgcozGTN10weJWFjw7otxWY5iSLbLNNj
	v5bKwmHB49pqICX8XZQV2/tCh/hiXFFKv2iDpJ6pszzGGxL5BIl7+rKw9nQC957G8HDXaI5ZwcMbz
	TDXZgKFv0iEGX6/f1POO3WlA0GdbSAXHT1cZlQoUWy5f2FCm0dlZmYamrdJ3+XBreFe1JF06+54Z+
	EW21Uq2EGvxdrgLGN05rhsztXfHg6h1VgocnScsLEeSEcJUs0RV+v9GF2vHj+dNwyo+w1bpuVDhX/
	jjpUrBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFUM-00000009FHI-04Zh;
	Thu, 30 Jul 2026 01:23:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFUK-00000009FHC-3yXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 01:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20230600BC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95EF1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785374587;
	bh=ffGAcapN3R5fgPUa3yUZnlAkGuMraG/kj2eR0YNfPCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iC6qvX+wwbqeV6fYwEOvIHaVrQyjHltI2QjakrA73tYEQ2dmDl3MGThB2YKBmPPu5
	 RXXEmWRhTFw1i0Sl+3T2W0I0E6j9HuEVPEifBfddzx+Kw8TAwrhiwipQtqjGbqlhno
	 OBn5+tUVYT9tItiSMXxaO3ovB8GtU/EGUHORlcyc92LlUcWtsw43yGjKOVdQA+p5KF
	 1dpumgyvnaXf7IFypCBi6bOEVV6mIxiiycE74Ob8MRXxZrRUD8/ou+5nf1ufxen2Yn
	 3itHZM3scB8+AsKhH1SUBlctsxJRnBWrrZ5UpNWq1f56WzKBgaZY5i1HVnC8KCWMBf
	 oiA9RYNxYy4vw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15f020a223so246978766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 18:23:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpShjl/Hvi81ZKO6WsSbxlCKpKubA6vYtfLVm4jMLRzM5YQrcZre7QlAd6jbR6ltSCx85XI2j5Wg5tqfLR7TEER@lists.infradead.org
X-Gm-Message-State: AOJu0YyDtV3L3v9lLWCVvRyaFL+4fa7NLQ77m3F9atDTT0skI5I9hp5z
	9YU1VbNbFvNiGf7kqfnnA+NJABXpo7oHx0vqrQp5uHQL+SH2AhM+1joxvSk10esVhX5eh2PQlnj
	cvvGkfAqfCQ3jX226wlgAyQmRBpiHPA==
X-Received: by 2002:a17:907:3c83:b0:c12:5e26:da50 with SMTP id
 a640c23a62f3a-c1fa57ca16cmr23754566b.65.1785374586439; Wed, 29 Jul 2026
 18:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260727234408.296186-1-rosenp@gmail.com> <CAL_JsqLLME5rN_HW4hEPfGcLBZX-r-10XJ_=cvU1nq1x4cJEEg@mail.gmail.com>
 <CAKxU2N9Q0tWCtVk2jn8bWu4H5YGGiKnxJksxZ-MjuKtoupzVmA@mail.gmail.com>
In-Reply-To: <CAKxU2N9Q0tWCtVk2jn8bWu4H5YGGiKnxJksxZ-MjuKtoupzVmA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Jul 2026 20:22:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKufnuTbHpiJhvFcWQxvLWocnkZbr+HoHGVpvtJ2JDW8Q@mail.gmail.com>
X-Gm-Features: AUfX_mw4oUlyqEPrkpHCD7R6Ci5jgme3jesHsmEr7sxa_gh8ShIwR-wWrDGCpmY
Message-ID: <CAL_JsqKufnuTbHpiJhvFcWQxvLWocnkZbr+HoHGVpvtJ2JDW8Q@mail.gmail.com>
Subject: Re: [PATCHv2] PCI: iproc: platform: use device functions instead of OF.
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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

On Wed, Jul 29, 2026 at 7:55=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> On Wed, Jul 29, 2026 at 5:32=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Mon, Jul 27, 2026 at 6:44=E2=80=AFPM Rosen Penev <rosenp@gmail.com> =
wrote:
> > >
> > > Since this is supposed to be the higher layer file, use higher layer
> > > than OF to handle this. Remove OF headers as a result.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  v2: fix platform_get_resource() parameters.
> > >  drivers/pci/controller/pcie-iproc-platform.c | 31 ++++++++----------=
--
> > >  1 file changed, 12 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/p=
ci/controller/pcie-iproc-platform.c
> > > index 4c9a0c4bb923..488ff737ec52 100644
> > > --- a/drivers/pci/controller/pcie-iproc-platform.c
> > > +++ b/drivers/pci/controller/pcie-iproc-platform.c
> > > @@ -10,12 +10,8 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/platform_device.h>
> > > -#include <linux/of_address.h>
> > > -#include <linux/of_pci.h>
> > > -#include <linux/of_platform.h>
> > >  #include <linux/phy/phy.h>
> > >
> > > -#include "../pci.h"
> > >  #include "pcie-iproc.h"
> > >
> > >  static const struct of_device_id iproc_pcie_of_match_table[] =3D {
> > > @@ -40,11 +36,14 @@ static int iproc_pltfm_pcie_probe(struct platform=
_device *pdev)
> > >  {
> > >         struct device *dev =3D &pdev->dev;
> > >         struct iproc_pcie *pcie;
> > > -       struct device_node *np =3D dev->of_node;
> > > -       struct resource reg;
> > > +       struct resource *reg;
> > >         struct pci_host_bridge *bridge;
> > >         int ret;
> > >
> > > +       reg =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!reg)
> > > +               return -ENODEV;
> > > +
> > >         bridge =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> > >         if (!bridge)
> > >                 return -ENOMEM;
> > > @@ -52,26 +51,20 @@ static int iproc_pltfm_pcie_probe(struct platform=
_device *pdev)
> > >         pcie =3D pci_host_bridge_priv(bridge);
> > >
> > >         pcie->dev =3D dev;
> > > -       pcie->type =3D (uintptr_t)of_device_get_match_data(dev);
> > > -
> > > -       ret =3D of_address_to_resource(np, 0, &reg);
> > > -       if (ret < 0) {
> > > -               dev_err(dev, "unable to obtain controller resources\n=
");
> > > -               return ret;
> > > -       }
> > > +       pcie->type =3D (uintptr_t)device_get_match_data(dev);
> > >
> > > -       pcie->base =3D devm_pci_remap_cfgspace(dev, reg.start,
> > > -                                            resource_size(&reg));
> > > +       pcie->base =3D devm_pci_remap_cfgspace(dev, reg->start,
> > > +                                            resource_size(reg));
> > >         if (!pcie->base) {
> > >                 dev_err(dev, "unable to map controller registers\n");
> > >                 return -ENOMEM;
> > >         }
> > > -       pcie->base_addr =3D reg.start;
> > > +       pcie->base_addr =3D reg->start;
> > >
> > > -       if (of_property_read_bool(np, "brcm,pcie-ob")) {
> > > +       if (device_property_present(dev, "brcm,pcie-ob")) {
> >
> > If the property is boolean, it should use read_bool and vice-versa.
> I don't see it as a boolean in dtsi.

Looks like boolean to me:

arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:156:           brcm,pcie-o=
b;
arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:185:           brcm,pcie-o=
b;

Rob

