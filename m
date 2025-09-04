Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E6CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXT+xGg463hwxHQkaysDNXj3DgmwgfCfpZCPDlCDOkA=; b=WZk7VgWWDkAb4kemNlsQZ13L+k
	CcRSIKf+UG+Qsba8hIlNOES646Hw/iTU0IuJM2f4HRq0C6CNnb/I5sMmE2DofP6cGAdKZZzBA1rku
	PkWQCF8TagptLB76xJDjFY6inyQ/hK/Ah+kYX1UPmeSbd9ufVZOZSRr731sW8kaewqgwxHJIlqEhu
	oJiHVpVDRBdcSIDK1xNwYJkZIDJv5Ejlj0fEYuVyCQCTiyFtYyy+ggbGfFN/1P+YfWCZxE4txfXgg
	VmWHEE2nOU2JWXOIfhS4CW0Y/8qUlsWTNryevVwnkRCeu1qe6hegaJszEBvLBz1qDV6tW+sKBQd8f
	1wy+eo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu77J-0000000AruX-43yW;
	Thu, 04 Sep 2025 10:22:57 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu62Y-0000000AUTz-31TU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:14:00 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250904091354epoutp017fd668ebd518e55b3dfa36e15d2fd17d~iCXxNCI5G0168501685epoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 09:13:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250904091354epoutp017fd668ebd518e55b3dfa36e15d2fd17d~iCXxNCI5G0168501685epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756977234;
	bh=tXT+xGg463hwxHQkaysDNXj3DgmwgfCfpZCPDlCDOkA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PY6KtGhRlxGmDpbtwOHdwsBtnAee65iHDPBNo8OP9IwKDtoubFDbc/B7e+PLYta/C
	 nzzO8EzKXMfHdMzxjZUkFSNZcOW5Ln+XRpDC4AdyblmK5aY4ls/83WfvDJTe2sg/Ha
	 JmSHBpekeoKCEuAtxSP1R2Yd5O5pPC9/xECZViu0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250904091353epcas5p1583257065573710b90d66d7dfa6604f9~iCXwt45ny2104021040epcas5p1h;
	Thu,  4 Sep 2025 09:13:53 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cHYgh4ZL4z6B9mB; Thu,  4 Sep
	2025 09:13:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904091351epcas5p12b672a06d35140266c02c2038c580f7c~iCXu3-r_91514515145epcas5p1w;
	Thu,  4 Sep 2025 09:13:51 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904091349epsmtip274097b068a5ef332a9676265ad6c52ec~iCXtVRBrG1708017080epsmtip2D;
	Thu,  4 Sep 2025 09:13:49 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Henrik Grimler'" <henrik@grimler.se>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <alexandre.belloni@bootlin.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <20250903192046.GA4126@l14.localdomain>
Subject: RE: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Thu, 4 Sep 2025 14:43:48 +0530
Message-ID: <000001dc1d7c$3ac93f90$b05bbeb0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygKSVtdMAw5/R1ICS4saWrHBuvVQ
Content-Language: en-in
X-CMS-MailID: 20250904091351epcas5p12b672a06d35140266c02c2038c580f7c
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
	<20250710083434.1821671-3-dev.tailor@samsung.com>
	<20250903192046.GA4126@l14.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_021359_424830_5C3334B0 
X-CRM114-Status: GOOD (  25.05  )
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


> -----Original Message-----
> From: Henrik Grimler <henrik=40grimler.se>
> Sent: 04 September 2025 00:51
> To: Devang Tailor <dev.tailor=40samsung.com>
> Cc: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Subject: Re: =5BPATCH v2 2/3=5D rtc: s3c: support for exynosautov9 on-chi=
p RTC
>=20
> Hi Devang,
>=20
> On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> > The on-chip RTC of this SoC is almost similar to the previous versions
> > of SoC. Hence re-use the existing driver with platform specific change
> > to enable RTC.
>=20
> Could you please describe what the differences are to previous SoCs?
> You write almost similar, please elaborate in what way in commit message.

Ok. I will add in V3.

>=20
> > This has been tested with 'hwclock' & 'date' utilities
> >
> > Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> > ---
> >
> >  drivers/rtc/rtc-s3c.c =7C 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c index
> > 5dd575865adf..8db24b6360b8 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > =40=40 -384,6 +384,15 =40=40 static void s3c6410_rtc_disable(struct s3c=
_rtc
> *info)
> >  	writew(con, info->base + S3C2410_RTCCON);  =7D
> >
> > +static void exynosautov9_rtc_disable(struct s3c_rtc *info) =7B
> > +	unsigned int con;
> > +
> > +	con =3D readb(info->base + S3C2410_RTCCON);
> > +	con &=3D =7ES3C2410_RTCCON_RTCEN;
> > +	writeb(con, info->base + S3C2410_RTCCON); =7D
>=20
> Rather than adding a new rtc_disable variant I think this could be handle=
d
in
> existing s3c24xx_rtc_disable (and I think that is what Krzysztof meant).
How
> about adding a new bool to rtc_data that describes if S3C2410_TICNT reg i=
s
> supported or not, and checking it in s3c24xx_rtc_disable?

Ok. I will add bool 'use_s3c2410_ticnt=B4=20to=20differentiate=20if=20any=
=20variant=20uses=0D=0ATICNT=20or=20not,=20making=20it=0D=0A'true'=20for=20=
existing=20RTC=20variants=20which=20are=20using=20s3c24xx_rtc_disable().=0D=
=0A=0D=0A>=20=0D=0A>=20Best=20regards,=0D=0A>=20Henrik=20Grimler=0D=0A>=20=
=0D=0A>=20>=20=20static=20void=20s3c_rtc_remove(struct=20platform_device=20=
*pdev)=20=20=7B=0D=0A>=20>=20=20=09struct=20s3c_rtc=20*info=20=3D=20platfor=
m_get_drvdata(pdev);=20=40=40=20-574,6=20+583,12=0D=0A>=20>=20=40=40=20stat=
ic=20struct=20s3c_rtc_data=20const=20s3c6410_rtc_data=20=3D=20=7B=0D=0A>=20=
>=20=20=09.disable=09=09=3D=20s3c6410_rtc_disable,=0D=0A>=20>=20=20=7D;=0D=
=0A>=20>=0D=0A>=20>=20+static=20const=20struct=20s3c_rtc_data=20exynosautov=
9_rtc_data=20=3D=20=7B=0D=0A>=20>=20+=09.irq_handler=09=09=3D=20s3c6410_rtc=
_irq,=0D=0A>=20>=20+=09.enable=09=09=09=3D=20s3c24xx_rtc_enable,=0D=0A>=20>=
=20+=09.disable=09=09=3D=20exynosautov9_rtc_disable,=0D=0A>=20>=20+=7D;=0D=
=0A>=20>=20+=0D=0A>=20>=20=20static=20const=20__maybe_unused=20struct=20of_=
device_id=20s3c_rtc_dt_match=5B=5D=20=3D=20=7B=0D=0A>=20>=20=20=09=7B=0D=0A=
>=20>=20=20=09=09.compatible=20=3D=20=22samsung,s3c2410-rtc=22,=20=40=40=20=
-590,6=20+605,9=20=40=40=0D=0A>=20static=0D=0A>=20>=20const=20__maybe_unuse=
d=20struct=20of_device_id=20s3c_rtc_dt_match=5B=5D=20=3D=20=7B=0D=0A>=20>=
=20=20=09=7D,=20=7B=0D=0A>=20>=20=20=09=09.compatible=20=3D=20=22samsung,ex=
ynos3250-rtc=22,=0D=0A>=20>=20=20=09=09.data=20=3D=20&s3c6410_rtc_data,=0D=
=0A>=20>=20+=09=7D,=20=7B=0D=0A>=20>=20+=09=09.compatible=20=3D=20=22samsun=
g,exynosautov9-rtc=22,=0D=0A>=20>=20+=09=09.data=20=3D=20&exynosautov9_rtc_=
data,=0D=0A>=20>=20=20=09=7D,=0D=0A>=20>=20=20=09=7B=20/*=20sentinel=20*/=
=20=7D,=0D=0A>=20>=20=20=7D;=0D=0A>=20>=20--=0D=0A>=20>=202.34.1=0D=0A>=20>=
=0D=0A>=20>=0D=0A=0D=0A

