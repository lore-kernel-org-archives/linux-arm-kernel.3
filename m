Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074ABC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNoNE6e64sEYfFsroSfsCY8QuIvX813ZAxY1wFGvAfs=; b=SGC82d0A69kRUS0St/KkYUaOyp
	BEnS8smb/ETn163wTdIdyL2WaXtR7incA5rTIy6MK3Wy9kid4flFuyDnm7BpxrhhGwtHGx6SwMNJQ
	hOo7whic3E3JcllJu0BiZvL4/k0ZJFxf1FFC67sFSh25YJo+QpquyOqDhRIhIEA202hG7yuSjQqWb
	J7OE5SkS2HPHF0g+SnEXf1hjkVyZSTjGm1USBsZ8gYSx6QQ0kwthOo+1A0bYFANyaPJOJEQWUWf3H
	D2bgKIZOoM+VVlp70FGM9ZcsYS3weNJMaXoleGAvDwbydD/MdaCgCE3VEzUVxlbY68QzsIqS/X04j
	n8lnQjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tb2-00000006zrO-3vb2;
	Wed, 09 Apr 2025 11:27:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SSU-00000006oIA-1G3j
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 10:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BNoNE6e64sEYfFsroSfsCY8QuIvX813ZAxY1wFGvAfs=; b=Ou7f66KtZPp8nGpy+SRObFotB9
	0Ng/UTDUW0gDM8ioVW4cu2vXztSlkAYG4MeU2cehuMdlnp1+cvtvUMKYfUT//Y/k8y8gn2guvQfEX
	KnLrOCvoHnjH06Ymv+iuuC96GLcrpA5NyF3TE+ujKM1/Vu2VjpZj7qN8qi/GnKTG1pToH1DdSXeMj
	PVydmfghR035VjtLW0PmyN0l7pmCpqct2+AIpYld69FOiBYXL/WCQCSuJhHaSB/7DI3BkGVi1l5Fv
	V5q8m1EyRMLIWqZVT9Ap2YSaXPkvy7mjuQvp9rOuuuPl9SrbuQJrtvEm7/xx7WJZunkUcGrd1OkXe
	G17P3W4Q==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2SSQ-00000008aBg-3r9D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744193698; x=1775729698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BNoNE6e64sEYfFsroSfsCY8QuIvX813ZAxY1wFGvAfs=;
  b=T+zpQimh7RJ4+BqmTQBXiIZxRCB852eTKHJjZwAneooHbdMdUIjiZqhR
   8oIGOTBJICzfc14e+ByxKw50IUyHQA/Kvfvr5801VRp0pA9YCn+f2NSqV
   YPJFeo0W53YJ2te1FVYQQEIUuivB9SUZSgNeu3QW6JpZf2ZxnhVdmCcQA
   OKOz04ilJc7yqh1lA/p+OvnIGjHV5gMpv5iWiAue5tJEITCwn4932sSjw
   wN2Wp8JrBTAoIGy1aq+Rfv44evD/rFkDcZxoPnCNfrLpKPkyaz8DjS+Ym
   UqFrpG7NoZQ1+papy14qIHLgvOXiBsaXLakX2LWUY/Sa3vIm9jYIvpImB
   w==;
X-CSE-ConnectionGUID: QsBY5tYfRvO4jvFCFUdRaw==
X-CSE-MsgGUID: aXOJ8JttQUS4xI0EqVv4JA==
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="43425758"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Apr 2025 12:14:55 +0200
X-CheckPoint: {67F6489F-13-7141A0B0-E6EDEC14}
X-MAIL-CPID: AD203921DB3D5B5D91448C1600452817_3
X-Control-Analysis: str=0001.0A006371.67F6489C.0095,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4929164F85;
	Wed,  9 Apr 2025 12:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744193690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNoNE6e64sEYfFsroSfsCY8QuIvX813ZAxY1wFGvAfs=;
	b=U5co9zDHmUiL4PoV2Bj2nlNzBH5Iw4uyo0kqMS2d6jtR4Z5RRyNUgOHxnyq53EzUGy9Hs1
	X1kpcaOShYEFlPCqXOlvyCdjzA0qcaogFMx4vIRjMzJo9cHvrvkqqGl02d3U5f7d16MQGQ
	UL5wPE6Zjx4+f34EB7abO0z0TGl1JdUWax3kcWhx7AUrgNe9NX0QqF9Iq2mApQgzjqOw+I
	mX+nEs5xCCxaSughpJRy4a4v4gDxI+Z0XZQrSLD2z2RED29IdYaENPyjIF3ueEvZpBa0H0
	6uNRtF3XLiaBKXoVOiaocRtSUeM74EPUb6/tPFMBPxvEdEBKrtSyw5IQdgMjQw==
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
Date: Wed, 09 Apr 2025 12:14:48 +0200
Message-ID: <10643619.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z+WdgWQo4dbPG5tP@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <Z8HuU6ULEN756lyr@lizhi-Precision-Tower-5810>
 <Z+WdgWQo4dbPG5tP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_111459_298429_BB35B714 
X-CRM114-Status: GOOD (  12.52  )
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

Am Donnerstag, 27. M=E4rz 2025, 19:48:33 CEST schrieb Frank Li:
> [snip]
> Finially we get realtek PCI card
>=20
> it quite complex, there are one PCIe switch to split it to two pci bus.
>=20
>  lspci -t
> -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
>                                            \-07.0-[04]----00.0

Interesting. Mine looks slightly different:

$ lspci -t
=2D[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-01.0-[03]----00.0
                                           \-02.0-[04]----00.0

>=20
>=20
> 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> 0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 =
Gen2 Packet Switch
> 0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 =
Gen2 Packet Switch
> 0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 =
Gen2 Packet Switch

It seems you have a newer hardware revision. I have
0000:01:00.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
0000:02:01.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
0000:02:02.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)

PCIe bridges.

> 0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111=
/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> 0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111=
/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
>=20
> It need below change
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 9bb26b466a061..9dbf395b9a67b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
>                         power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
>                         /* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT=
[5:0]) is 0x10~0x17 */
>                         msi-map =3D <0x0 &its 0x10 0x1>,
> -                                 <0x100 &its 0x11 0x7>;
> +                                 <0x100 &its 0x11 0x1>,
> +                                 <0x218 &its 0x12 0x1>,
> +                                 <0x238 &its 0x13 0x1>,
> +                                 <0x300 &its 0x14 0x1>,
> +                                 <0x400 &its 0x15 0x1>;
>                         iommu-map =3D <0x000 &smmu 0x10 0x1>,
> -                                   <0x100 &smmu 0x11 0x7>;
> -                       iommu-map-mask =3D <0x1ff>;
> +                                   <0x100 &smmu 0x11 0x1>,
> +                                   <0x218 &smmu 0x12 0x1>,
> +                                   <0x238 &smmu 0x13 0x1>,
> +                                   <0x300 &smmu 0x14 0x1>,
> +                                   <0x400 &smmu 0x15 0x1>;
> +                       //iommu-map-mask =3D <0x1ff>;
>                         fsl,max-link-speed =3D <3>;
>                         status =3D "disabled";
>=20
>=20
> Only 8 stream id assign to PCIe0 device, it is hard to dynamaic alloce on=
e,
> or need extra works

Uh, this looks awefully complicated. Even worse this doesn't work on
my hardware. I need mappings for IDs 0x208 and 0x210, so I replaced 0x218
and 0x238 from your diff into my numbers.

So I take that PCIe bridges are not supported properly. What would be
necessary to support this?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



