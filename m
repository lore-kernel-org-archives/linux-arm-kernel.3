Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB0C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaeHUHDhpHicpyEPArevNCJsvIdCbCzGZYXB98wgi1s=; b=MZzV4v9yI8yvjaRG0vaWxqdC7k
	t8TysWjbwpw2DT9ULhRa6t6vfPASyS1o/4VMbkqpHJHLNphCwIfSrccAs6HtCKsmfV+p5sxU6C4kw
	X3lJbo35oGZ2zhxkwhdy8DDCmr4dkwGqWWY7MrhzCYtEYyk/Tz+WITHG8n+8YYKqTZ72cg/oH191O
	ycZLa2slOOifFgS2tCKvApydpL+FP9iK9JV3SODUj/gBoRbfjlYQn72CfSjDvUAjDnda10dqjbGpu
	19/b18lvt3Ymck4RtR4VvU7xlz8kJrCh6ID9QOR7lOv9JD6U4dd66ZhmOU3CxAM/JlXQ0V/YQrdj3
	un6yqzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO5w-0000000AAS8-19b5;
	Thu, 17 Jul 2025 12:52:16 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMf8-00000009xpp-3ML2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 11:20:32 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250717112028epoutp02748882f148b04b7080efa6e3a7854acf~TBfSje7L21727517275epoutp02J
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 11:20:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250717112028epoutp02748882f148b04b7080efa6e3a7854acf~TBfSje7L21727517275epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752751228;
	bh=vaeHUHDhpHicpyEPArevNCJsvIdCbCzGZYXB98wgi1s=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oXUL+P+yi1b6GGgxeAdl3fkacZa5Eqwy/w97hspuH5aKuqUTGcg6efrNCStz5Tzd/
	 yCPzt5bW4gyx16aycTiIlK4Vp8+YvTB6omd5U4PCw/NZxqu0nBNDn8G5J+vweYDWld
	 wnEnp5ANA8Wd8ifKZLuFE/Hap1AuHQi/L9MFEjEk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250717112026epcas5p17ba342f1a18c68254b3c95c7aa7117e0~TBfQ8Kwl32028120281epcas5p1v;
	Thu, 17 Jul 2025 11:20:26 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bjVpK3w9Hz6B9m7; Thu, 17 Jul
	2025 11:20:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250717111830epcas5p1c4816682379933819fef343a70e1e13b~TBdk6ieaL0129601296epcas5p1l;
	Thu, 17 Jul 2025 11:18:30 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250717111827epsmtip2d57c2524f47be7d8d1a79801f3a884f0~TBdiAJ8Ex3070830708epsmtip2O;
	Thu, 17 Jul 2025 11:18:27 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <40c06385-26bc-4d5f-8fdc-fee2600afdeb@kernel.org>
Subject: RE: [PATCH v4 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Thu, 17 Jul 2025 16:48:26 +0530
Message-ID: <000d01dbf70c$86602e00$93208a00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AFx24JLAb5T8KIBPEtVBrNJsbUw
X-CMS-MailID: 20250717111830epcas5p1c4816682379933819fef343a70e1e13b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115959epcas5p40f28954777a620b018251301eea13873
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115959epcas5p40f28954777a620b018251301eea13873@epcas5p4.samsung.com>
	<20250701120706.2219355-3-pritam.sutar@samsung.com>
	<40c06385-26bc-4d5f-8fdc-fee2600afdeb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_042031_162463_3A9D651A 
X-CRM114-Status: GOOD (  21.56  )
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 12 July 2025 01:46 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; neil.armstrong=40linaro.org; kauschluss=40dis=
root.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 2/6=5D phy: exynos5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> On 01/07/2025 14:07, Pritam Manohar Sutar wrote:
> > This SoC has a single USB 3.1 DRD combo phy that supports both
> > UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> > those only support the UTMI+ (HS) interface.
> >
> > Support only UTMI+ port for this SoC which is very similar to what the
> > existing Exynos850 supports.
> >
> > This SoC shares phy isol between USBs. Bypass PHY isol when first USB
> > is powered on and enable it when all of then are powered off. Add
> > required change in phy driver to support HS phy for this SoC.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong=40linaro.org>
>=20
> Drop

Sure.

>=20
> You again added significant changes and claimed they were reviewed.
>=20
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c    =7C 131 ++++++++++++++++++=
++
> >  include/linux/soc/samsung/exynos-regs-pmu.h =7C   2 +
> >  2 files changed, 133 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index dd660ebe8045..64f3316f6ad4 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > =40=40 -480,6 +480,8 =40=40 struct exynos5_usbdrd_phy =7B
> >  	enum typec_orientation orientation;
> >  =7D;
> >
> > +static atomic_t usage_count =3D ATOMIC_INIT(0);

Presently, existed SoC in driver, supports only one USB port and=20
it does not have any complications to handle shared isol. However,=20
phy isols are shared across USB20s in ExynosAutov920=20
(here ExynosAutov920 has 4 ports with shared phy isols). phy isol=20
should be enabled when all ports are disabled else bypassed if any=20
one of usbs is in use. phy isol is handled at bootloader in Downstream code=
.=20
USB20 ports won't work if isol is not handled in any bootloader. Hence,=20
added usage_count for the purpose.
  =20
But still, it depends on phy isol architecture, if SoC shares phy isol with=
=20
USBs or it can have separate phy isols for each usbs.

>=20
> No, you cannot have singletons. How are you going to handle two independe=
nt
> phys?

Agreed with your point and have to handle shared and separate isols in same=
 driver. =20
We will take this later in subsequent patch-sets.
  =20
For now, will remove this usage_count and bring up only basic support for E=
xynosAutov920 phy.

>=20
> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


