Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A971C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=; b=ksja+gHzeUE9T0CVnxh5LoaE9R
	B7fk9B0h+VlnhPsCvbGS1rtxpvdmRKCLysGORlMeV1G1ZFgl8KvNGwg7cXxlwMPai7kKVM0mT3Lc1
	5e/u8N53bpj3z02XM4K3VGZw7Q4ezErIKM3KBEkEprf388E7OGCrbInpI4MO1An219dG3QRe/Sgh3
	pD0BWvqJmVkZ/Ee1iKGoDePeG90xqHriySpjvH/QFMwIyhVRaloty7DgP1sdaHMz5rGODR3aYBxGt
	BRZXRDVvfIK4VYIRt07zDGwg7Lq93OFRWcfbD+5cp4JXPEBiTwoVTi4L/bAQ7tAg4pBKAMCp9V7HG
	rzig3Mbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8rQ-00000008nTs-1bg0;
	Wed, 29 Jul 2026 18:18:32 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8rO-00000008nTG-0UKE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:18:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1903894a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 11:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785349107; cv=none;
        d=google.com; s=arc-20260327;
        b=osBJpv0w8gmXNdNsxoKFL3iU66H7ghZSEKzcb3UmR182L96tVNLtCY2XI/LZbeYzPB
         HzJi6TwypveAh3aTr6sKvuB/2zEwlNm19ugL5kPeEg77TSaR2Ms9mIgnVwYEI4nLS7CC
         FLiGstA2o/4zgoRejd4SBhAosnhUHI8CLIk3x4jI1VVmyUYW9HOJeSTbJ6Z3JkHcq8ae
         fGH3gHaQBAtQw5cLa7uQlIddyqNmiPPgHN5UEM1icZZzsd0Ybeg0+ljHKictvK3z3SDX
         DoZB5O9qZBFhf9KepnVwjrgr/gLphuz243kBDS/63gCmpXkDqY2EGjQiYG+B4AUPlOtG
         aXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=;
        fh=2LPXBxFyUdIMPW4/14g6Cz6tiusPI0cXuK1bz6JOuHU=;
        b=RnhIC2AukkkiasQg9cEdtbFtWxla4nZc6QwJh5FncRfFWDiifwjBAOxBkyeNA5ckKd
         l2foYv1msuRSOPIYfwnh6Y35roSFp6Lfq9vmoJdJ3zJJ2LwvJwNn1MCX2yCz0AvrU602
         Du01a0PQIW7zJaipOY8v/ZgFn6/ug8+9Oy2pG/dOOgotl5WIkEtFAum6sBJJQHa9a/no
         gHho8wQ+NCYWfIiZaGD2D/M4Jodu5v6bQkAfpO1Ji48W/DBNzqagWX7As6D9pYfb2Qh4
         fc62OqE/BMy2PtadimTFg1atjcnRMYCyeWmrqWXgseGTXEUPAPCUcgsc+t9VC8QBUVAQ
         r5Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785349107; x=1785953907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=;
        b=DrvniJpemxURTWejh9LtBz9uSdjspMfbSYpJdZ3URFgZGs/yaurQZLGSv9CjqvaJjz
         AGMCyVIobZNw8AVVzHPoPiQnyTlOaodHoWLQXtN5WqsSPyD/iZOYPthLeeFnFfOeGFJA
         cWc+BzR/KZ+gBN9OVe6q3hQETrMSiNPYhwQBm20x8gw9OFznJ2Jk23z4KN4zOKzQfZ4G
         KVpmYCBKbrDn0UH/GBYtVR6iLpe7CtCjBbgBjCJblLcU8xy73ct94p7ikI8JOkluGxfP
         ogivtqr/YhNEI8/co4Gy4Au0WkHslBzjc5VAw4SjK+9Rb/EtfSIWPU6oplD9yZfO5IhW
         x9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349107; x=1785953907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=;
        b=JCzvHaYF50inHNvAx61SauezFHOT47l3mXnphMAYQYyTQnN4bojgsFOoUJ/cn1jb6m
         sLqKd9eYi0hahKTSOCIbHcpiXn3AQwj89z3k/+OgHq3r2xHVSLb8OmTPXBGZC4Fn/U3p
         vH03pSZamVoQLzvHafvpDqL4QYMIS2OjJpDcPyewUWRCjH9/Ro+5Bp7k/ipuqPG9HhDR
         4nEVVxf7u9gqHs3J7yfKQFbtMNQcOxsIUzA4BneC0m95FReNoKCzibGa6ppbOqIxqh1m
         zUIm9JXwDNNzGcrXVdW033XW58yTvUzLY1BOlMr9cJPJP7sCq6Nmun8DJpO/qzOnzoo4
         4Mag==
X-Forwarded-Encrypted: i=1; AHgh+RrhXbe0X372/BwFmrX6aATMAgy+u1Dn1RYlv54m863F3h9O+WX3lS10Klb1CkXJpg/xh4dPCDDZYpuwAssc85BI@lists.infradead.org
X-Gm-Message-State: AOJu0YyEJO5A2yB+6do3wZ5iSGqPoh/KlJ7xr0AP61fKVhgJglDx8fMy
	+HSIk20H8Qv6geUl+B5WSM2KTHQQp/RnSM+O/gd1+g5cVYW/u8SKw3k+Fk38bCFOtCoEXCmPd7B
	5BvMFTmoC4Z3GU2DTJHeQMAUgo5X7X3trmk9BP5U=
X-Gm-Gg: AR+sD11hVwCC1bKs9nG7Prv8o2yUV1SaXrPx/I9jMgCtidoPuoTCSwCjlRWEkonaghT
	wfe6E3G16WjofP4fDOWuzNytXkxkW9bXN9bDlbpkbCPJJLTJnpri+FYLqsJABcuRowIr2bb+a19
	KHusBROeFZAwhPsn9m2mAaUH5AKfk3IxEJfce3GjDFBSyz1LWoMpeSfEcAuOCk8pSndhjAcvU2w
	FideDI/Z5MV27tSw8YHOCm1ukD6ubhW79u9K1A20Y905OwfssY52iE+MTSsxJyPN6lsivvHW0Vl
	IdxUsVDBGP4LxoQEKFWuXmhzr2H1NP5EiQIaZkwhh3Yi3XcZ2hhdXj+9Hx3QsYlVIz9uMOSFnDe
	kilEfi0yD8A8vMGgGHNawV5K/9dwDQ2OhNGP6c5OJjca/WeD8aQKCHBZdZyttS9eZ1Gr819rtk5
	AV0773OqbbuIcb3QcJpEbDifuP3G+QR0/+a7llJfebCRD3f3Hg20xYdWUmtQdyGZAtZg==
X-Received: by 2002:a05:6402:e0c:b0:698:be4d:ca2a with SMTP id
 4fb4d7f45d1cf-6a034a398cfmr4241255a12.15.1785349107364; Wed, 29 Jul 2026
 11:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260716205811.800920-1-rosenp@gmail.com> <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
In-Reply-To: <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:18:15 -0700
X-Gm-Features: AUfX_mxrjUfVZ84R9XbJRtIPW_yLO3WV_Dd3HDwSinvRF3cFNjojFlllhS1HjGw
Message-ID: <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com>
Subject: Re: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Michal Simek <michal.simek@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_111830_194250_CF28E557 
X-CRM114-Status: GOOD (  24.01  )
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

On Wed, Jul 29, 2026 at 9:00=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> > Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
> > in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent t=
o
> > the previous call, but uses the generic firmware-node API.
> >
>
> What is the benefit of using fwnode API for OF only driver?
I get conflicting information. Apparently of_irq_get needs a call to
irq_dispose_mapping but fwnode_irq_get does not. irq_of_parse_and_map
definitely does.
>
> - Mani
>
> > Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ =
or
> > a negative errno and never 0 (it rewrites 0 to -EINVAL). Store the resu=
lt
> > in an int and check for irq < 0, returning the error (including
> > -EPROBE_DEFER). This also adds the error handling the previous code
> > lacked, where irq_of_parse_and_map() failures were passed straight into
> > devm_request_irq().
> >
> > Built for ARM (multi_v7_defconfig + CONFIG_PCIE_XILINX) with LLVM=3D1;
> > drivers/pci/controller/pcie-xilinx.o compiles cleanly.
> >
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: use dev_err_probe to handle EPROBE_DEFER.
> >  drivers/pci/controller/pcie-xilinx.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/control=
ler/pcie-xilinx.c
> > index 4aa139abac16..58532296182f 100644
> > --- a/drivers/pci/controller/pcie-xilinx.c
> > +++ b/drivers/pci/controller/pcie-xilinx.c
> > @@ -20,10 +20,10 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of_pci.h>
> >  #include <linux/of_platform.h>
> > -#include <linux/of_irq.h>
> >  #include <linux/pci.h>
> >  #include <linux/pci-ecam.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >
> >  #include "../pci.h"
> >
> > @@ -535,7 +535,7 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie =
*pcie)
> >       struct device *dev =3D pcie->dev;
> >       struct device_node *node =3D dev->of_node;
> >       struct resource regs;
> > -     unsigned int irq;
> > +     int irq;
> >       int err;
> >
> >       err =3D of_address_to_resource(node, 0, &regs);
> > @@ -548,7 +548,10 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie=
 *pcie)
> >       if (IS_ERR(pcie->reg_base))
> >               return PTR_ERR(pcie->reg_base);
> >
> > -     irq =3D irq_of_parse_and_map(node, 0);
> > +     irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> >       err =3D devm_request_irq(dev, irq, xilinx_pcie_intr_handler,
> >                              IRQF_SHARED | IRQF_NO_THREAD,
> >                              "xilinx-pcie", pcie);
> > @@ -585,10 +588,8 @@ static int xilinx_pcie_probe(struct platform_devic=
e *pdev)
> >       pcie->dev =3D dev;
> >
> >       err =3D xilinx_pcie_parse_dt(pcie);
> > -     if (err) {
> > -             dev_err(dev, "Parsing DT failed\n");
> > -             return err;
> > -     }
> > +     if (err)
> > +             return dev_err_probe(dev, err, "Parsing DT failed\n");
> >
> >       xilinx_pcie_init_port(pcie);
> >
> > --
> > 2.55.0
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

