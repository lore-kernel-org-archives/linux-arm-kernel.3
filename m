Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C9C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrBDuhJRZUtR91nEShzz3zzvGOSBPmWKWEmvj9/W/G4=; b=UuwkEgNeuRRbBJ2fNc3JjTnhMw
	8JPfVYrr7A/Mq4K8QnQazCdKSfiso4Beh8YZ9s5ldlIEqDWd3/0xDg8Sk5svXl/IHIFS/4DZj7Gep
	cvG8rdUWgqchh5nEbYk1CEUCHY5JnvWLoPQONduivViBIs+IBPCC26ysiODxm+LqqhNsr4RzCUJvE
	v9NXvNGhJyn+kHNJajjMLpqAY8kxazRGTbhtEQIOw5pG4kPeT6OhQwhSLpT9wSBwFCj55+Ro4qmSW
	Pz2jd4esQ7ADm9aWZWa7gaKd1fGTA6Rm2+JdYcC9npeQgObNvcj53LiWFQakOxay6FweOcb4wTxMj
	sMUCMinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEhB-00000009BCm-3WRj;
	Thu, 30 Jul 2026 00:32:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEhA-00000009BCd-35fK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 00:32:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57CAF43CBD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 00:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6AC1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 00:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785371539;
	bh=zrBDuhJRZUtR91nEShzz3zzvGOSBPmWKWEmvj9/W/G4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h1k63NLN6cmj1kpQ2QMw0xEfxEH7JiUMtkGEsPQViU1mgkbzvlHJSwQZQ0tW8qdNp
	 jCKdDviRwmKgYm4RSAu5XlG7HktT1YpUX7AMJ5BMPv+XLbdqgK/Lktl9P6wfWdHC3d
	 Xu3x1+eR9hfKogH6XBpnbXniI7/J0DVPwunQQfeYpMbnCj3EDVZijuvPLJrlkf1VuG
	 FekmTSNopJLoaQPL3vLDwjW7dCkUtOe73Hf7gABMIhsXWq+eih2yxuPc11UZTxL9T8
	 FkzSTxy+R8o7c8Jj+dxB6P2c9eYK7p+oW8mPj1ihta5WdCc/6cuNTJjK6PtMQvHHQB
	 E3IRc+53fErag==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1600d040e4so32857866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 17:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzBbsKHct74ptvYGbGTneYqgEGhdot5/DZim24SZjQdVZppbG1w8nqNFeAtJrHiDiT6WR2bzMxNwpQbUVsdZ0c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlvkbu+CRNFOEqhmciVcttK71LEKZYU9buQIJyptY6IrC1f0mg
	qe6HYiuiSIDHkrw0E8MGddS6StSt1MM8u4UpbjylDuC0oBcDvKBRHGR3RUlX2yJ9D+O1oZ4XwkH
	xNzzfQ461oHxRDmh1vqHw/zGw67tEYg==
X-Received: by 2002:a17:907:3e9d:b0:c08:5bdb:e904 with SMTP id
 a640c23a62f3a-c1facba47a5mr5925766b.9.1785371537782; Wed, 29 Jul 2026
 17:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260727234408.296186-1-rosenp@gmail.com>
In-Reply-To: <20260727234408.296186-1-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Jul 2026 19:32:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLLME5rN_HW4hEPfGcLBZX-r-10XJ_=cvU1nq1x4cJEEg@mail.gmail.com>
X-Gm-Features: AUfX_mxctybY_ktpTHGhwAesKt4Jprc3RZsV78twWem5e_3ICmeMx7EDwdgtyQg
Message-ID: <CAL_JsqLLME5rN_HW4hEPfGcLBZX-r-10XJ_=cvU1nq1x4cJEEg@mail.gmail.com>
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

On Mon, Jul 27, 2026 at 6:44=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Since this is supposed to be the higher layer file, use higher layer
> than OF to handle this. Remove OF headers as a result.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: fix platform_get_resource() parameters.
>  drivers/pci/controller/pcie-iproc-platform.c | 31 ++++++++------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/c=
ontroller/pcie-iproc-platform.c
> index 4c9a0c4bb923..488ff737ec52 100644
> --- a/drivers/pci/controller/pcie-iproc-platform.c
> +++ b/drivers/pci/controller/pcie-iproc-platform.c
> @@ -10,12 +10,8 @@
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> -#include <linux/of_address.h>
> -#include <linux/of_pci.h>
> -#include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>
> -#include "../pci.h"
>  #include "pcie-iproc.h"
>
>  static const struct of_device_id iproc_pcie_of_match_table[] =3D {
> @@ -40,11 +36,14 @@ static int iproc_pltfm_pcie_probe(struct platform_dev=
ice *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct iproc_pcie *pcie;
> -       struct device_node *np =3D dev->of_node;
> -       struct resource reg;
> +       struct resource *reg;
>         struct pci_host_bridge *bridge;
>         int ret;
>
> +       reg =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!reg)
> +               return -ENODEV;
> +
>         bridge =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
>         if (!bridge)
>                 return -ENOMEM;
> @@ -52,26 +51,20 @@ static int iproc_pltfm_pcie_probe(struct platform_dev=
ice *pdev)
>         pcie =3D pci_host_bridge_priv(bridge);
>
>         pcie->dev =3D dev;
> -       pcie->type =3D (uintptr_t)of_device_get_match_data(dev);
> -
> -       ret =3D of_address_to_resource(np, 0, &reg);
> -       if (ret < 0) {
> -               dev_err(dev, "unable to obtain controller resources\n");
> -               return ret;
> -       }
> +       pcie->type =3D (uintptr_t)device_get_match_data(dev);
>
> -       pcie->base =3D devm_pci_remap_cfgspace(dev, reg.start,
> -                                            resource_size(&reg));
> +       pcie->base =3D devm_pci_remap_cfgspace(dev, reg->start,
> +                                            resource_size(reg));
>         if (!pcie->base) {
>                 dev_err(dev, "unable to map controller registers\n");
>                 return -ENOMEM;
>         }
> -       pcie->base_addr =3D reg.start;
> +       pcie->base_addr =3D reg->start;
>
> -       if (of_property_read_bool(np, "brcm,pcie-ob")) {
> +       if (device_property_present(dev, "brcm,pcie-ob")) {

If the property is boolean, it should use read_bool and vice-versa.

>                 u32 val;
>
> -               ret =3D of_property_read_u32(np, "brcm,pcie-ob-axi-offset=
",
> +               ret =3D device_property_read_u32(dev, "brcm,pcie-ob-axi-o=
ffset",
>                                            &val);
>                 if (ret) {
>                         dev_err(dev,
> @@ -87,7 +80,7 @@ static int iproc_pltfm_pcie_probe(struct platform_devic=
e *pdev)
>          * core driver. For platforms that require explicit inbound mappi=
ng
>          * configuration, "dma-ranges" would have been present in DT
>          */
> -       pcie->need_ib_cfg =3D of_property_read_bool(np, "dma-ranges");
> +       pcie->need_ib_cfg =3D device_property_present(dev, "dma-ranges");

This is correct as dma-ranges may not be bool.

Rob

