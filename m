Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6462DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5zHegncV70kjbqyw48Y9OdFtKw1OBm4PBQI79nv4ew=; b=gwZrzm1uDJBEiZ303BIiDMncXS
	AGzwZqNF8ubSx6JCn2vKQJpJQ2/q+n0D+91O02a6zJpX2vOY6h4/nZNbsdFxsX5ZeLIZ4fnNJVWlF
	YhpEEteGJ6PM+z1eUrHifogCOMcNz7HgQPg5i449ZIx3BvKOD7ZzCt8tIZE1tXHHST0gOScQRdi6g
	lY92lj4JAn8+jVt+V6/fjUZp7lGqiAO0okX25WB1llv548nRI6WoR5KxZLli0/TScTtWk4FXxj5V6
	cPTzYQ+UQEleEKkUTsAzYDac92jtVrv87sGmTC8x7aZh2XI7+vLSvomnb9/+48e8pvBGChpQrAIt4
	H7qbjbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBbc-0000000EYvS-1aaK;
	Fri, 11 Jul 2025 11:07:52 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAVC-0000000EOUl-1Ztx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:57:13 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250711095659epoutp01479af022ee1b2f76bff823908b8dca54~RKesE-20U0261702617epoutp01n
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 09:56:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250711095659epoutp01479af022ee1b2f76bff823908b8dca54~RKesE-20U0261702617epoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752227819;
	bh=+5zHegncV70kjbqyw48Y9OdFtKw1OBm4PBQI79nv4ew=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HwcmosRgLUGbih8+toJsjXN/4B4BZaTYNYtYADygEqPVaUrasnRy0U3HrAKqt7uOJ
	 BBWPO4IQmJIrToH4WZnvuT2h7jv4/75w+8CkeHzw5NzYSgRHdB0aibtd7nygnq7dkb
	 qW+gsoS3+4aGuUfUqBGoktci3qLLhlsYNp09Vu5U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250711095658epcas5p33152e44e3698223878ac0bf294f1bf8b~RKerickMk0269002690epcas5p3Y;
	Fri, 11 Jul 2025 09:56:58 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.183]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bdnDm74z2z3hhTJ; Fri, 11 Jul
	2025 09:56:56 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250711095228epcas5p11af898a023698a922eb59ddbbffaa176~RKavvWm-70063600636epcas5p1p;
	Fri, 11 Jul 2025 09:52:28 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250711095226epsmtip153e539dffb1184623f3f9ac93d4bb0dd~RKauOa9jJ2985929859epsmtip1p;
	Fri, 11 Jul 2025 09:52:26 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <alexandre.belloni@bootlin.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <20250711-shapeless-adorable-lobster-d2efbf@krzk-bin>
Subject: RE: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Fri, 11 Jul 2025 15:22:25 +0530
Message-ID: <188001dbf249$831afd00$8950f700$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygKSVtdMAw5/R1ICPLNBmLFr0ApA
Content-Language: en-in
X-CMS-MailID: 20250711095228epcas5p11af898a023698a922eb59ddbbffaa176
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
	<20250710083434.1821671-3-dev.tailor@samsung.com>
	<20250711-shapeless-adorable-lobster-d2efbf@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_025711_864269_1DA7E91D 
X-CRM114-Status: GOOD (  23.66  )
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
> Sent: 11 July 2025 12:51
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
> On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> > The on-chip RTC of this SoC is almost similar to the previous versions
> > of SoC. Hence re-use the existing driver with platform specific change
> > to enable RTC.
> >
> > This has been tested with 'hwclock' & 'date' utilities
> >
> > Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> > ---
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
> Looks a lot like s3c24xx_rtc_disable()...
>=20
> Anyway, if you keep ignoring the review, no point to provide reviews here=
.
>=20

I have removed the redundant code I had added in V1 considering your review=
 comment for asymmetry code.
s3c24xx_rtc_disable() & s3c6410_rtc_disable() updates additional bit, which=
 is not valid for ExynosAutov9 (only RTCCON=5B4:0=5D are valid), hence I ad=
ded this and mentioned in V2 cover letter as well.
Please let me know if I am missing anything.

> Best regards,
> Krzysztof



