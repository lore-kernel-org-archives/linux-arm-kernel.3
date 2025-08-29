Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01732CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbXZsLg/Ue7PwUbZF2XDqNQLk+AaXNqWgxb8Ug1xzoo=; b=HbKp5fKHZa70wqiM3kiD6qQwvT
	PsmOaFlgV4bfovlvJ93nkhKe8qCFw29yZG1th3JHPzpwf9/3tQ7uN3P2ijkG31jHvsic09iOKY6KV
	lsjEPmJd0ckvw128T2hNUHQrwaYLN0LCY87h+uURSmL9BbJj0al5ju224a/C4iOG6fZldlIkIKQ1H
	k2bmd0ch3rzfGlcW8X2WEVSZihMSqj2tb8OPHze8G6M8U/h9qpiOYrDQ/w9lDgZtKD/k9QbujXof3
	rY5psj9rNmUVtxkVydKNS0d9kGAFS/Pk6f7CDnFFFV8tOSxePPq1xmJYmV7z8gyKRaNIef2X2kyng
	xC92KXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzXw-00000005vTW-0cte;
	Fri, 29 Aug 2025 13:53:40 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwoL-00000005PiL-06p2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:58:28 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250829105818epoutp03a1baf1df4ce7a925b931abb989cf9a81~gN7NnOp4k0538105381epoutp03j
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 10:58:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250829105818epoutp03a1baf1df4ce7a925b931abb989cf9a81~gN7NnOp4k0538105381epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465098;
	bh=KbXZsLg/Ue7PwUbZF2XDqNQLk+AaXNqWgxb8Ug1xzoo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=sOxvIw4E6HlG5GO3fkt2pOd0U2sj7ZduR/swuv+PGLsza8lD4PLKZFcM3jXMpRMsU
	 hwEDhjzAHVzNg+A+iaJg5ni2AmAl4slysJNNh4GnNmpkP6NhYtVVtSHzmn9FYwG6pl
	 MIkbdB8Sqg1jLXlQRUflYrePkaQoDgfual6XuVJQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250829105817epcas5p494efd395966d195b9bc5c726c9377107~gN7MZgVqD1496314963epcas5p4g;
	Fri, 29 Aug 2025 10:58:17 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCwGw0Vhsz2SSKg; Fri, 29 Aug
	2025 10:58:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250829105815epcas5p47f74045e2c06d71f16fac7b8ddcb9efe~gN7K8KPhO1496314963epcas5p4X;
	Fri, 29 Aug 2025 10:58:15 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829105812epsmtip21b0817b549a0c83092589c33ae363fc6~gN7H6iEol0293702937epsmtip2h;
	Fri, 29 Aug 2025 10:58:12 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Pritam Manohar Sutar'"
	<pritam.sutar@samsung.com>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<johan@kernel.org>, <m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <e8e99c16-ad40-4d79-be92-1aa55c13f9ea@kernel.org>
Subject: RE: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Fri, 29 Aug 2025 16:28:10 +0530
Message-ID: <263801dc18d3$d1e20950$75a61bf0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+wLwFCB2ArX7ZGwBn6FItwLUPA9DtJbmBNA=
Content-Language: en-us
X-CMS-MailID: 20250829105815epcas5p47f74045e2c06d71f16fac7b8ddcb9efe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
	<20250822093845.1179395-6-pritam.sutar@samsung.com>
	<20250824-rough-fresh-orangutan-eecb2f@kuoka>
	<007501dc1653$e36c3b50$aa44b1f0$@samsung.com>
	<83dc9435-5850-425d-b345-52e84ef9262c@kernel.org>
	<000401dc18cd$ec02a1b0$c407e510$@samsung.com>
	<e8e99c16-ad40-4d79-be92-1aa55c13f9ea@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_035825_706076_5703047C 
X-CRM114-Status: GOOD (  25.25  )
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

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, August 29, 2025 4:07 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> johan=40kernel.org; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo ssphy
>=20
> On 29/08/2025 12:15, Pritam Manohar Sutar wrote:
> > Hi Krzysztof
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 26 August 2025 02:05 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > .
> > .
> > =5Bsnip=5D
> > .
> > .
> >>>> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-p=
hy:
> >>>> add
> >>>> ExynosAutov920 combo ssphy
> >>>>
> >>>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote=
:
> >>>>> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> >>>>> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> >>>>> =22phy=22 and =22ref=22. The required supplies for USB3.1 are named=
 as
> >>>>> vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> >>>>
> >>>> Please do not describe the schema, but hardware. This sentence does
> >>>> not help me in my question further.
> >>>
> >>> This is a combo phy having Synopsys usb20 and usb30 phys (these 2
> >>> phys are
> >> totally different).
> >>> One PHY only supports usb2.0 and data rates whereas another one does
> >>> usb3.1 ssp+ and usb3.1 ssp
> >>>
> >>> This patch only explains about usb30 (since these are two different
> >>> phys) phy
> >> and omitted inclusion of usb20 reference (added separate patch for
> >> this patch no 3).
> >>>
> >>> Hope this is clear.
> >>
> >> No. That sentence still explains what schema is doing.
> >>
> >
> > Ok, let me simplify the commit message further something like below.
> > Anyways, the coverletter contains more details about it.
> >
> > =22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo
> > ssphy
> >
> >   Add schema for combo ssphy found on this SoC.
> > =22
> >
> > Please confirm if this looks fine?
> > If so, will reflect the similar commit messages in patch 1 and 3.
>=20
> Please read my first comment again. I do not see how does this satisfy
> hardware explanation.
>=20
Just went through the conversation above,=20
until what extent hardware description need to be explain in the commit?
Do we have any guideline for the same?
Could you please help with an example from previous any commit or some othe=
r patches?=20
I understand that mentioning, =E2=80=9Ctwo=20clocks,=20two=20supplies=20etc=
=22=20are=20part=20of=20schema,=20=0D=0Aone=20may=20or=20may=20not=20captur=
e=20that=20in=20the=20commit.=20=0D=0AHowever=20mentioning,=20=E2=80=9Cthis=
=20hardware=20(SoC)=20contain=20a=20combo=20PHY=20which=20supports=20usb3.1=
=20and=20usb3.0=22=20is=20not=20ok?=20=0D=0A=0D=0A>=20Best=20regards,=0D=0A=
>=20Krzysztof=0D=0A=0D=0A

