Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2024CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwY5hixuwzaZTDT5buByhfxmW867fLKpSCP8rlpiI14=; b=lY+mrAKir+PDOAxUgXS2ohk76U
	VIo9qlSbbgMGhC+ZTbQJEV6mJ9gSyTkkztThaIfsmO0KCb3TAXe6zhUIAewEfs/4aYkUMG3z8piz2
	KOBDWAz1a3Ccb6uuyDiGSv3Gk4jW7EMrnqM+k6WDEih480P+PV+PkHdC/GYpcoNf6OgGXxwnV+cgj
	+lSfIQgHZhuocw0y93BrEIeUVET+a0urgP1B0tSynjSBFpt1h36hPPgpZTaJ1uvfRoYviArbOTeQ8
	q8e3OUR5ByNYchgNnmc5Rl6SkUYPapnwotS+fr9Mve+3FtUwZ0KHIpSLufS88Bg0wS4it98SWJ5GI
	x378Tknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1GF-00000006FMq-1Zi9;
	Fri, 29 Aug 2025 15:43:31 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxkX-00000005Yrq-3vrI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:58:38 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829115827epoutp02ed77c013dda417705e60b81faa070ced~gOvvCFmv92569125691epoutp02p
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:58:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829115827epoutp02ed77c013dda417705e60b81faa070ced~gOvvCFmv92569125691epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756468707;
	bh=uwY5hixuwzaZTDT5buByhfxmW867fLKpSCP8rlpiI14=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CysoOR9PC9hnqe3pml403GQnA2oc/kH9yTcRYWraVwncS6r0Ua7oKrZX8fYTY8UiF
	 wkmMBTtTPFS8p8p/SBihey+pSFosShUCntvBWl+YoSz6EKKZoIOEa6n7z321Lfvwa1
	 +ys3ZAmEG4PVEJOSTVSBzmqJSKzG06tJCI9Fb7tQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250829115827epcas5p1f685d8dfedaaf5048eb61a23746eb119~gOvueZGSr1701717017epcas5p1U;
	Fri, 29 Aug 2025 11:58:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cCxcL15L7z3hhT4; Fri, 29 Aug
	2025 11:58:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250829115825epcas5p308b9c24446175f4cd3107cd25d87d005~gOvtI56rB0210702107epcas5p3A;
	Fri, 29 Aug 2025 11:58:25 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829115822epsmtip19020d35d0d51e22cc1325735aeef32e0~gOvqKeOfY1508415084epsmtip1L;
	Fri, 29 Aug 2025 11:58:22 +0000 (GMT)
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
In-Reply-To: <6b5f20ed-4e88-441e-8f61-20866e2b39c7@kernel.org>
Subject: RE: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Fri, 29 Aug 2025 17:28:21 +0530
Message-ID: <264501dc18dc$39afb340$ad0f19c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+wLwFCB2ArX7ZGwBn6FItwLUPA9DAP+/dGQCDX8RFrR+i4pg
Content-Language: en-us
X-CMS-MailID: 20250829115825epcas5p308b9c24446175f4cd3107cd25d87d005
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
	<263801dc18d3$d1e20950$75a61bf0$@samsung.com>
	<6b5f20ed-4e88-441e-8f61-20866e2b39c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_045836_248310_0992FD02 
X-CRM114-Status: GOOD (  25.40  )
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
> Sent: Friday, August 29, 2025 4:56 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Pritam Manohar Sutar'
> <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; andre.draszik=40linaro.org;
>=20
=5BSnip=5D
> >>>>>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar
> wrote:
> >>>>>>> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> >>>>>>> compatible to the USB3.0 SS(5Gbps). It requires two clocks,
> >>>>>>> named =22phy=22 and =22ref=22. The required supplies for USB3.1 a=
re
> >>>>>>> named as vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> >>>>>>
> >>>>>> Please do not describe the schema, but hardware. This sentence
> >>>>>> does not help me in my question further.
> >>>>>
> >>>>> This is a combo phy having Synopsys usb20 and usb30 phys (these 2
> >>>>> phys are
> >>>> totally different).
> >>>>> One PHY only supports usb2.0 and data rates whereas another one
> >>>>> does
> >>>>> usb3.1 ssp+ and usb3.1 ssp
> >>>>>
> >>>>> This patch only explains about usb30 (since these are two
> >>>>> different
> >>>>> phys) phy
> >>>> and omitted inclusion of usb20 reference (added separate patch for
> >>>> this patch no 3).
> >>>>>
> >>>>> Hope this is clear.
> >>>>
> >>>> No. That sentence still explains what schema is doing.
> >>>>
> >>>
> >>> Ok, let me simplify the commit message further something like below.
> >>> Anyways, the coverletter contains more details about it.
> >>>
> >>> =22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo
> >>> ssphy
> >>>
> >>>   Add schema for combo ssphy found on this SoC.
> >>> =22
> >>>
> >>> Please confirm if this looks fine?
> >>> If so, will reflect the similar commit messages in patch 1 and 3.
> >>
> >> Please read my first comment again. I do not see how does this
> >> satisfy hardware explanation.
> >>
> > Just went through the conversation above, until what extent hardware
> > description need to be explain in the commit?
> > Do we have any guideline for the same?
> > Could you please help with an example from previous any commit or some
> other patches?
> > I understand that mentioning, =E2=80=9Ctwo=20clocks,=20two=20supplies=
=20etc=22=20are=20part=0D=0A>=20>=20of=20schema,=20one=20may=20or=20may=20n=
ot=20capture=20that=20in=20the=20commit.=0D=0A>=20>=20However=20mentioning,=
=20=E2=80=9Cthis=20hardware=20(SoC)=20contain=20a=20combo=20PHY=20which=0D=
=0A>=20supports=20usb3.1=20and=20usb3.0=22=20is=20not=20ok?=0D=0A>=20=0D=0A=
>=20=0D=0A>=20Maybe=20that's=20just=20language,=20but=20to=20me=20the=20com=
mit=20msg=20did=20not=20describe=0D=0A>=20hardware=20after=20first=20senten=
ce,=20but=20said=20what=20schema=20requires=20(some=0D=0A>=20clocks=20and=
=20supplies).=20Other=20examples:=0D=0A>=2000399bbe02d2bb6fd8d6eb90573ec305=
616449f4=0D=0A>=20e4c9a7b475e5d0d9b2440ee48f91d1364eabd6cb=0D=0A>=20=0D=0AT=
hanks=20for=20suggestion=20as=20always,=20I=20hope=20the=20author=20can=20f=
ollow=20this.=20=0D=0A=0D=0A>=20and=20here=20another=20anti-pattern:=0D=0A>=
=2023f793850e9ee7390584c0809f085d6c88de7d3f=0D=0A>=20=0D=0A>=20(and=20befor=
e=20you=20ask=20why=20above=20carries=20my=20Rb=20tag,=20then=20note=20that=
=0D=0AI=20will=20not=20ask=20:-)=0D=0A>=20Samsung's=20revenue=20is=20around=
=20220=20billion=20USD,=20so=20for=20sure=20it=20has=20a=20lot,=0D=0A>=20re=
ally=20a=20lot=20of=20resources=20to=20review=20patches=20internally=20and=
=20improve=20their=0D=0A>=20quality=20before=20posting).=0D=0A>=20=0D=0AHmm=
...,=20however=20let=20me=20check=20internally.=0D=0A=0D=0A>=20Best=20regar=
ds,=0D=0A>=20Krzysztof=0D=0A=0D=0A

