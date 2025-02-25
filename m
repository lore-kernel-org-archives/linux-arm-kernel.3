Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD1CC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT/bNjpK17AKmWrFmC1oGrmgU/J/4HzWEdIi1M3xvy8=; b=SmoG3NjIWUatkrgg8OXRV1t7dp
	cneAhVmrZLSOiVqOY9itNfHKCCLTL6Ft4zfOp1rDjv+BUvU7itSFS3DA2OUs2Ejc2fySuoP8JrbUI
	/kbSR+28bXH03iqlfK6OQ2XhWvgQ4lpA7adQuL1144Z0xu9sClhrAUYR8KKY46tVFrp70cZ4X/mKq
	WeV0Y/vqkLbeuEXUkgxHIs1S4oJ2XuqaSaMFOBhxBArn9QkXsT1k/LApZ6J7s24Pp09+2Wcey4Veh
	zx8YYXt7iDLW9OOhcTnjv2diOxkDz5So/f1Qp+qVk8+M8FoDftMW10d4yNlDLnfzYncmMAyS9y/JK
	f85XxhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtTB-0000000H64u-3RiJ;
	Tue, 25 Feb 2025 11:51:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms3c-0000000Gnjc-3w2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740478857; x=1772014857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FT/bNjpK17AKmWrFmC1oGrmgU/J/4HzWEdIi1M3xvy8=;
  b=aNvQ+DypfSIY4vYInglLvsX2qm+eZYaFgH91OgyPKsXAyDS2Z+CqJJdK
   GAskVHsZ7jRTGnRK4fV9s7ydyfBY2meyUbvogRgJwL0vOCWfJBCQI4EKh
   kcvzgW4Bzw8WpeAUZ22cswPXvz55gjrolZhE+7aoHkKp07+DQF4NK0Jld
   CxMGDjRtZ8iS7ONa1uq1+7y8WAhcD+fKWYHnK3kZiEoCjoPdUvitYzlFR
   qDyqieWtGWRxZ8lTKLukiU7H8Pb72Ww/aSEqGYhNmaqWlGLc9g+Yb1gI7
   StD+y8Q2O6HlxN7cmcivRj7f3+KHKPGIvKBPqpjoRzbHkvYT9KGn+WIQI
   w==;
X-CSE-ConnectionGUID: QsBI+sINSrKWHQjBDBASWA==
X-CSE-MsgGUID: 8aKwrTwDSxOsoUj5BI/pOA==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067570"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:20:54 +0100
X-CheckPoint: {67BD9986-1D-C21CC984-D1047F1F}
X-MAIL-CPID: AD44FBA8F505BC75EA53E4781B804E6C_5
X-Control-Analysis: str=0001.0A002106.67BD9985.00B4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECCDB167B75;
	Tue, 25 Feb 2025 11:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740478850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FT/bNjpK17AKmWrFmC1oGrmgU/J/4HzWEdIi1M3xvy8=;
	b=AK68a+B89Qybuj8NoLI/VDdEZykmlp/1oKL3xVgpWnaPSQLDF/4bfjwx3jOdNiTXNnfTm6
	rwDsQYJHUL+uRKBs205y7smpffcs0L8WqHok9lJDdp+HASeCDrWkhwb4Xt26CTVtD+nC/T
	wTvnKkk+sFOD+l3UjlXYkfdwhNoot/GbX8gEBuxc6obYw7BJb0XAaCBJtCCQm8ZAhE1b4z
	9jDrYinAxaIjYY3a28xXJjbDQDsAM8ufr+NJ5NUlIFWTzjTmxgPQsKMOqtUZFjStTysd9X
	LPkyOL46ejvCr1E4Yc/IZzCuP6FshuBELfAUEyMRey4AOyBFKEy5CmHGZK/Wtw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Date: Tue, 25 Feb 2025 11:20:49 +0100
Message-ID: <4962874.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z7yxDRO+ICPCu0I2@lizhi-Precision-Tower-5810>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
 <Z36o31uhQuI5lcH7@lizhi-Precision-Tower-5810>
 <Z7yxDRO+ICPCu0I2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022057_143085_05514D48 
X-CRM114-Status: GOOD (  17.14  )
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

Hi Frank,

Am Montag, 24. Februar 2025, 18:49:01 CET schrieb Frank Li:
> On Wed, Jan 08, 2025 at 11:33:35AM -0500, Frank Li wrote:
> > On Wed, Jan 08, 2025 at 10:58:18AM +0100, Alexander Stein wrote:
> > > Hi Frank,
> > >
> > > Am Dienstag, 7. Januar 2025, 16:39:25 CET schrieb Frank Li:
> > > > On Tue, Jan 07, 2025 at 03:01:06PM +0100, Alexander Stein wrote:
> > > > > IRQ mapping is already present. Add the missing DMA interrupt.
> > > >
> > > > PCI host side have not use bridge's DMA yet although hardware suppo=
rt it.
> > >
> > > So this is a driver limitation, right? So IMHO the device description=
 is
> > > independent from that and still correct, right?
> >
> > Yes, but dma register space may missed also. I suggest add later after
> > EP side support merged, which can verify informaiton is correct.
> >
> > Anyway, I don't block this change.
>=20
>=20
> Did you run DTB_CHECK? I found new warning was added
>=20
> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8d=
x-colibri-aster.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] =
is too long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie=
=2Eyaml#
> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8d=
x-colibri-aster.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too =
long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie=
=2Eyaml#
> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8d=
x-colibri-eval-v3.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]=
] is too long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie=
=2Eyaml#
> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8d=
x-colibri-eval-v3.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is to=
o long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie=
=2Eyaml#
> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8d=
x-colibri-iris.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] i=
s too long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie=
=2Eyaml#
> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8d=
x-colibri-iris.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too l=
ong

I think I did, but I see the same warnings.
I've prepared a series which addresses schema and imx8qm dtsi.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



