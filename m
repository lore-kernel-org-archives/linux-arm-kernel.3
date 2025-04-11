Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07B2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PE1UT1vGb/hTcLrz4p41JHU3RYkVqbBAbl7yr7Gp8o=; b=jcYDkoJCVM6aKOqSBHHtgY447J
	ioiaEWChOzQQ8S3jUJ61AoOWGYd33MJ1uWbycrGFjjQzcXCyT8CaZYDX3z/8LRBstBmr8DSV52+uB
	itppVQ+9dS8tl84FyMaogIRVHLMNJqgbLng65kOsQioHDFwzsFfovKXG+QVJQXxffRUMwxOyvEo2v
	FCCHPWOiH4iWupQ7Mc4Hcv7Pgy4ru05A5yGbjgnO4PcuUyrPkNMsBaRxejbNmbG4k4XjCFUzr2JN3
	ObtFpXrcbrEY/1bvM3m5Dxb1cAPHraHNW+avxJqCKqp3/DjwmVzM6TPCEicDSWN8r4wl76Q8OzMM8
	bBZ9nk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qD-0000000Crx9-0RIH;
	Fri, 11 Apr 2025 07:30:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38GN-0000000Cn3r-3vkv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744354400; x=1775890400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/PE1UT1vGb/hTcLrz4p41JHU3RYkVqbBAbl7yr7Gp8o=;
  b=Eusy+zknRs3FSoxD5byTPfzyFKsyQtYhXFGJ4wgGaTnIN55fB0+0mkzg
   eMknBf+eFhPNpg6FuAdz48qa0YYH+I+W1YxOchuwincxq0Hll7cr3lvDe
   SqyQyLfnn6cd2LAHHX3f5BFDOmdFoEZTsS32ijvEQ5P/b0B/6QQlyopwT
   +JDNN5RP3CLsOd4meDnjtkMhKhUg/seOz0gwH5eJV2zdX6tEfA/xNAS1Z
   sLefNCWpcf2BxDHzRtOdOyOsXLSJ2PLX3JhpH3om30bAqpJfdTs9cn24Y
   K6DYDsqNGMceMZlenZ78pVbrKJEKsjGxaaRHVRnWaAfsrearxg/RcnHT2
   A==;
X-CSE-ConnectionGUID: bEW0VtO/RoCQkufVuKYI6w==
X-CSE-MsgGUID: +UQt4EtqRP2L26xK+qmaUw==
X-IronPort-AV: E=Sophos;i="6.15,203,1739833200"; 
   d="scan'208";a="43471096"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 11 Apr 2025 08:53:17 +0200
X-CheckPoint: {67F8BC5D-10-903EAEAC-E04C76C8}
X-MAIL-CPID: 7DB6D4A40A213011B16BFC23CBDF85ED_5
X-Control-Analysis: str=0001.0A006372.67F8BC61.007F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C38D01697E2;
	Fri, 11 Apr 2025 08:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744354392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PE1UT1vGb/hTcLrz4p41JHU3RYkVqbBAbl7yr7Gp8o=;
	b=ObxHs5bmtUyUlJ5potmtAPxPKmKZKcFpev9omi6tSvtVIVNuwbVrQnFnHYKLCyx2OWrfyu
	Qgsg49VfJTjkSq3Yi8SH9oA03AsUGTVxgxq31IoQPnDxmwejWb1aXgAKyMOBOed3fi5v1Z
	LuxBVn5GVwFNJFNZwhM5YBSm8wE45uct+JHa32BRVjXQK44Aw6yh/f9szr0ERSPUGyV9MH
	rWb8294wFjuhCPi5NMfYFOHMwZ/zQA2WrNDkSvJIctExfJYElraZRzBN1Wo6J5pJ2BAg/1
	8LxcNSfGsdFSgocQrsfg/PM0WoFoRKekjU70ua3Z9aesmXe+JqlVTmiduwmfzg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject: Re: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map property
Date: Fri, 11 Apr 2025 08:53:02 +0200
Message-ID: <1970445.taCxCBeP46@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z/aLSWGP4mimMNlv@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com> <10643619.nUPlyArG6x@steina-w>
 <Z/aLSWGP4mimMNlv@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_235320_482651_3E884623 
X-CRM114-Status: GOOD (  23.00  )
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

Hi,

Am Mittwoch, 9. April 2025, 16:59:21 CEST schrieb Frank Li:
> On Wed, Apr 09, 2025 at 12:14:48PM +0200, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Donnerstag, 27. M=E4rz 2025, 19:48:33 CEST schrieb Frank Li:
> > > [snip]
> > > Finially we get realtek PCI card
> > >
> > > it quite complex, there are one PCIe switch to split it to two pci bu=
s.
> > >
> > >  lspci -t
> > > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
> > >                                            \-07.0-[04]----00.0
> >
> > Interesting. Mine looks slightly different:
> >
> > $ lspci -t
> > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-01.0-[03]----00.0
> >                                            \-02.0-[04]----00.0
> >
> > >
> > >
> > > 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> > > 0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe=
 x1 Gen2 Packet Switch
> > > 0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe=
 x1 Gen2 Packet Switch
> > > 0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe=
 x1 Gen2 Packet Switch
> >
> > It seems you have a newer hardware revision. I have
> > 0000:01:00.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > 0000:02:01.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > 0000:02:02.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> >
> > PCIe bridges.
> >
> > > 0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL=
8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > > 0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL=
8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > >
> > > It need below change
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx95.dtsi
> > > index 9bb26b466a061..9dbf395b9a67b 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
> > >                         power-domains =3D <&scmi_devpd IMX95_PD_HSIO_=
TOP>;
> > >                         /* pcie0's Devid(BIT[7:6]) is 0x00, stream id=
(BIT[5:0]) is 0x10~0x17 */
> > >                         msi-map =3D <0x0 &its 0x10 0x1>,
> > > -                                 <0x100 &its 0x11 0x7>;
> > > +                                 <0x100 &its 0x11 0x1>,
> > > +                                 <0x218 &its 0x12 0x1>,
> > > +                                 <0x238 &its 0x13 0x1>,
> > > +                                 <0x300 &its 0x14 0x1>,
> > > +                                 <0x400 &its 0x15 0x1>;
> > >                         iommu-map =3D <0x000 &smmu 0x10 0x1>,
> > > -                                   <0x100 &smmu 0x11 0x7>;
> > > -                       iommu-map-mask =3D <0x1ff>;
> > > +                                   <0x100 &smmu 0x11 0x1>,
> > > +                                   <0x218 &smmu 0x12 0x1>,
> > > +                                   <0x238 &smmu 0x13 0x1>,
> > > +                                   <0x300 &smmu 0x14 0x1>,
> > > +                                   <0x400 &smmu 0x15 0x1>;
> > > +                       //iommu-map-mask =3D <0x1ff>;
> > >                         fsl,max-link-speed =3D <3>;
> > >                         status =3D "disabled";
> > >
> > >
> > > Only 8 stream id assign to PCIe0 device, it is hard to dynamaic alloc=
e one,
> > > or need extra works
> >
> > Uh, this looks awefully complicated. Even worse this doesn't work on
> > my hardware. I need mappings for IDs 0x208 and 0x210, so I replaced 0x2=
18
> > and 0x238 from your diff into my numbers.
> >
> > So I take that PCIe bridges are not supported properly. What would be
> > necessary to support this?
>=20
> I remember bridge use msi to do port power managements.
>=20
> ITS msi-map can distribute difference irq to difference cores beside iommu
> address protection. It is quite userful for nvme or network devices, which
> have multi queues. Of course, we need more elegant solution.
>=20
> My card use difference pcie switch chip. But suppose it should work after
> you update RID information.

Yep, after adjusting RID mapping, it works here.

> which kernel version do you base on?

My development is usually based on current linux-next versions, so it's
based on v6.15-rc1.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



