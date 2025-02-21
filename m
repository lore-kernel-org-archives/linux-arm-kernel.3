Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E37FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYDuqM5zerq/K1Nb+F1TGjydieUmgaoev9qYgClOXJU=; b=H3arYUhdV3pG46327ofO80Fnyw
	rmn8oBW9nubcs76fgsMD7GTgneletABE3OhXkifFJVFmgmJZ1tGPkxgJyPkVcgUjm7mvCbQ3Li8OJ
	UvJ1jUhwiHdQ34FPNTbPKDgMqq8JyaeWgMM5/fycGD9RsWAObTg5qoU76XIP42yDckqqWXq/KR8aq
	KBKT5hMHDYcWaG1ZxiekbXYZRZsJkBC89Yk0Bg2zS7Bg0GLKJXiJcOX2Masg4WOUriOTKNyJ1FKgs
	+elIoofntbgdGuJ3/nDB61yt8Btx2BmsOXsdKaQ9Z0unrRz8hCHHlvoYnjcImdbgT2XBrxY8fet+F
	1zkMKtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVGf-000000062J6-1iOZ;
	Fri, 21 Feb 2025 15:48:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVFC-0000000624d-0fPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 15:47:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D7DE5C6763
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 15:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15325C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740152833;
	bh=y6HZBp5IZErsqQhRRqqpRusCBCjDfw+6YZnfCtXjn24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mU9uQ4aipt1ag5WgcRMfguszw5xNkqZQzLyc40JqQzs09rJQSSlxX+x55KCQ3SQUm
	 NSbzgGUi/2xEcCUR4+Qj1rTMXZTTgKM9AlwvgdD8nvLg1cb/6YBMglQWjn5UoIe3ak
	 mVN+VgahczaICQHzaenJ9PzG5tBKIOsP56hqJK7HRDw6d/pEVmJjMoSXxjozGGO3Mj
	 PFqaLrrAwJB0AgufyzIR7buE1mv1rzYNCyZfPE/C2Gy8MxTrKvYWBBiP60o1b/oit8
	 ZInw5zbamh/3ZUJEnwXBkpbiWdBHwRYxN2RzKoXMJVpzLndHiSJdFmJDn9Kp2gEbfB
	 TwLaZh1t1x0SQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso3541331a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 07:47:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUltI0kXu4jjuhHHZMLDYQb/Eb1XaEuhThVNLBdPfo/OzodP1KI7Egh+mVYpx6wtMVZukXUg/lenTSo5z50xJ14@lists.infradead.org
X-Gm-Message-State: AOJu0YyvvlPdtX/SSeb+qO0eN3WCx0RHDhjSSIDJy9LTUlSx1Vd7GTLB
	TXE0f20SIbshFksNZ2KM5sPWq8Jq6h3kalEJ1FS7DIPTwyzG465Yu/sSQ9UZrjfUoY8w/nsq57M
	jC1NyHxn68ZhzJO8C4WlLIV05Ag==
X-Google-Smtp-Source: AGHT+IF0g/yHvcofIIL954DMlkDlEmWXVXGkukpcot5YEPAzhsfMkB158M7I4VZhd8DMtE74KtzluzLOEm1DWmTBiQI=
X-Received: by 2002:a17:907:94c1:b0:ab7:86af:9e19 with SMTP id
 a640c23a62f3a-abc09c264bemr370009366b.43.1740152831402; Fri, 21 Feb 2025
 07:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
 <20250211-pcie-t6-v1-7-b60e6d2501bb@rosenzweig.io> <CAL_JsqJ-sYsy-11_UiEKrKok49-a-VJUvm3vBGbpu9vY3TKLUw@mail.gmail.com>
 <86r041sozm.wl-maz@kernel.org>
In-Reply-To: <86r041sozm.wl-maz@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 21 Feb 2025 09:47:00 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+g=ntTQ5rs9V0pB9U=Jq3Rf0C0akmdJD60GTQTGPeAGQ@mail.gmail.com>
X-Gm-Features: AWEUYZkwVXJTJgh2rhG9YfDMZLZs4UScOtrjjxKujc0SvxNBHjDM1fIb2WzLu5M
Message-ID: <CAL_Jsq+g=ntTQ5rs9V0pB9U=Jq3Rf0C0akmdJD60GTQTGPeAGQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] PCI: apple: Add T602x PCIe support
To: Marc Zyngier <maz@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Stan Skowronek <stan@corellium.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_074714_284313_72B2826D 
X-CRM114-Status: GOOD (  32.34  )
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

On Thu, Feb 13, 2025 at 12:01=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Thu, 13 Feb 2025 17:56:19 +0000,
> Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Feb 11, 2025 at 1:54=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosen=
zweig.io> wrote:
> > >
> > > From: Hector Martin <marcan@marcan.st>
> > >
> > > This version of the hardware moved around a bunch of registers, so we
> > > drop the old compatible for these and introduce register offset
> > > structures to handle the differences.
> > >
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > ---
> > >  drivers/pci/controller/pcie-apple.c | 125 ++++++++++++++++++++++++++=
++++------
> > >  1 file changed, 105 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/contro=
ller/pcie-apple.c
> > > index 7f4839fb0a5b15a9ca87337f53c14a1ce08301fc..7c598334427cb56ca0668=
90ac61143ae1d3ed744 100644
> > > --- a/drivers/pci/controller/pcie-apple.c
> > > +++ b/drivers/pci/controller/pcie-apple.c
> > > @@ -26,6 +26,7 @@
> > >  #include <linux/list.h>
> > >  #include <linux/module.h>
> > >  #include <linux/msi.h>
> > > +#include <linux/of_device.h>
> >
> > Drivers should not need this...
> >
> > > +const struct reg_info t602x_hw =3D {
> > > +       .phy_lane_ctl =3D 0,
> > > +       .port_msiaddr =3D PORT_T602X_MSIADDR,
> > > +       .port_msiaddr_hi =3D PORT_T602X_MSIADDR_HI,
> > > +       .port_refclk =3D 0,
> > > +       .port_perst =3D PORT_T602X_PERST,
> > > +       .port_rid2sid =3D PORT_T602X_RID2SID,
> > > +       .port_msimap =3D PORT_T602X_MSIMAP,
> > > +       .max_rid2sid =3D 512, /* 16 on t602x, guess for autodetect on=
 future HW */
> > > +       .max_msimap =3D 512, /* 96 on t602x, guess for autodetect on =
future HW */
> > > +};
> > > +
> > > +static const struct of_device_id apple_pcie_of_match_hw[] =3D {
> > > +       { .compatible =3D "apple,t6020-pcie", .data =3D &t602x_hw },
> > > +       { .compatible =3D "apple,pcie", .data =3D &t8103_hw },
> > > +       { }
> > > +};
> >
> > You should not have 2 match tables.
> >
> > > @@ -750,13 +828,19 @@ static int apple_pcie_init(struct pci_config_wi=
ndow *cfg)
> > >         struct platform_device *platform =3D to_platform_device(dev);
> > >         struct device_node *of_port;
> > >         struct apple_pcie *pcie;
> > > +       const struct of_device_id *match;
> > >         int ret;
> > >
> > > +       match =3D of_match_device(apple_pcie_of_match_hw, dev);
> > > +       if (!match)
> > > +               return -ENODEV;
> > > +
> > >         pcie =3D devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> > >         if (!pcie)
> > >                 return -ENOMEM;
> > >
> > >         pcie->dev =3D dev;
> > > +       pcie->hw =3D match->data;
> > >
> > >         mutex_init(&pcie->lock);
> > >
> > > @@ -795,6 +879,7 @@ static const struct pci_ecam_ops apple_pcie_cfg_e=
cam_ops =3D {
> > >  };
> > >
> > >  static const struct of_device_id apple_pcie_of_match[] =3D {
> > > +       { .compatible =3D "apple,t6020-pcie", .data =3D &apple_pcie_c=
fg_ecam_ops },
> > >         { .compatible =3D "apple,pcie", .data =3D &apple_pcie_cfg_eca=
m_ops },
> > >         { }
> >
> > You are going to need to merge the data to 1 struct.
> >
> > And then use (of_)?device_get_match_data() in probe().
>
> No, that will break the driver. This isn't a standalone driver, but
> only an ECAM shim (as you can tell from the actual probe function).

Yes, I'm aware of that issue. The self-contained solution is just:

struct apple_match_data {
  const struct pci_ecam_ops ops;
  const struct reg_info info;
};

That works for pci_host_common_probe and apple_pcie_init. You don't
actually have to match again, but just cast the ops pointer. Yeah, no
type checking, but that already happens with of_match_table data.
Another solution is you could have 2 .init() hooks.

The somewhat more invasive solution is to define a struct with
pci_ecam_ops and a void pointer for extra data for ECAM match data.
Last time I looked at this, I think I needed something like this to
share more of the ECAM code with host drivers needing more setup.
There's a few cases of host controllers that have an ECAM space, but
still need a full driver.

The bottom line is drivers shouldn't be including of_device.h because
it's for bus implementations. I've worked to remove a bunch, but
there's still a bunch left. Please don't add more.

Rob

