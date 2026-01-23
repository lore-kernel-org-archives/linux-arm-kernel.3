Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51563D72340
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se6g0TattdJSbEIqCpX5SFJxKJzDqglis31YWPyUuk4=; b=WAb4gmirMcnYnAfrMjsNd4ENhm
	gAGNsfSGxTkHDHLfM11I5eWACznETv+WOofuLwmLJuIGTuRV51fTdgpTuQ57/xtNxAd6ucJ92YDmP
	oNKqwEMSH8cDCA4aqqHxuj5n+JNMVFhgfQBdC46SffDiSgOC94yqJOX6Fkg1ISrjTDiGTfgnZVlpe
	zMCiH8+u+Pn/a18e/V077WuOzeIwmyqO2teajSb9HdbPZPwN4BIhcjEgDOvkNfWA+5mgtC9kJ6dah
	kGQfcjSB5T/JKfqcR83ul924CqVYZMPJCNs8o6vZHVmA8hy6KbWIEmZAgn9o7XLo+v6EJF9gsbl9V
	vNRk161g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBcA-00000008NKP-0S0J;
	Fri, 23 Jan 2026 07:29:54 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBc5-00000008NJv-1trb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 07:29:52 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260123072940epoutp0323436ce83c2f16ce3b354e2eccd9cec1~NS6Axfttg2234322343epoutp03J
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 07:29:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260123072940epoutp0323436ce83c2f16ce3b354e2eccd9cec1~NS6Axfttg2234322343epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769153380;
	bh=se6g0TattdJSbEIqCpX5SFJxKJzDqglis31YWPyUuk4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dWYxVf+UFg5IYzT2GMxr5ENl71oKGOS4SGJ1kkT18bkT1UQa/CzM4XG93DYmfHy1L
	 dI7qwRYVIqajlfOaKHC/gEVCQ54n74gxim+oUEouKqb31/nvl3o1q0HOcgivLftFCh
	 krBZMx38CIml2Ypzxt5SJplKSj7S5rw0A9P0uMgg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260123072939epcas5p3d6ad87764073d97d7f64fb401b9b49fc~NS6AZm8OZ1589615896epcas5p3X;
	Fri, 23 Jan 2026 07:29:39 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dy8hL4s8Dz2SSKZ; Fri, 23 Jan
	2026 07:29:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260123072938epcas5p35721c4fc75931b1ecf9a130ae0ee5b80~NS5_5T3N22035720357epcas5p3r;
	Fri, 23 Jan 2026 07:29:38 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260123072931epsmtip16ff5206b63b87f79870a973b080bbaa5~NS55RAmij2893528935epsmtip1A;
	Fri, 23 Jan 2026 07:29:31 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <6f381f88-3a51-4fc8-844c-41b167b07628@kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
 nodes
Date: Fri, 23 Jan 2026 12:59:26 +0530
Message-ID: <000e01dc8c3a$05fa3df0$11eeb9d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwH8TUbRAqvnhIQBf1ky2raxgAdQ
Content-Language: en-in
X-CMS-MailID: 20260123072938epcas5p35721c4fc75931b1ecf9a130ae0ee5b80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>
	<20260122130721.205664-4-pritam.sutar@samsung.com>
	<6f381f88-3a51-4fc8-844c-41b167b07628@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_232950_148570_42921A57 
X-CRM114-Status: GOOD (  16.32  )
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

Hi=20

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 22 January 2026 07:05 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920: Enabl=
e USB
> nodes
>=20
> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> > Enable USB PHY and DWC3 USB controllers' nodes.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 21
> +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > index f90f7704597c..5896dd69334a 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > =40=40 -160,15 +160,20 =40=40 &xtcxo =7B
> >  &usbdrd31_ssphy =7B
> >  	dvdd-supply =3D <&dummy_regulator>;
> >  	vdd18-supply =3D <&dummy_regulator>;
> > +	status =3D =22okay=22;
>=20
> You just added the node in the previous patch, so why it cant be enavled
> there?
>=20
> >  =7D;
> >
> >  &usbdrd31_hsphy =7B
> >  	dvdd-supply =3D <&dummy_regulator>;
> >  	vdd18-supply =3D <&dummy_regulator>;
> >  	vdd33-supply =3D <&dummy_regulator>;
> > +	status =3D =22okay=22;
> >  =7D;
> >
> >  &usbdrd31_dwc3 =7B
> > +	dr_mode =3D =22otg=22;
> > +	usb-role-switch;
> > +	role-switch-default-mode =3D =22peripheral=22;
>=20
> Why did you add incomplete node in previous commit?
>=20
>=20
> Best regards,
> Krzysztof


