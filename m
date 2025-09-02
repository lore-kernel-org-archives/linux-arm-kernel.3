Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54230CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaJV/AYbl/mon1qabDaukZJ7qz3bjN/L9fdsiOaq8ts=; b=tDR2JqyIOe0McyFSDOJiz/vhkw
	+6NJ0nD/+WEcNgpKmKb2iIQ0S/dAGZWwRSZkuSNlsk2+yNTR7GGPcbk8V22HjTI6EZYgMr6qX5ic3
	qg4IR3z1YJdDl1O6DVA3VJBKq4PemoGMx6hxxEu2Na+akf0AAQfn0AcMd5FV2Eo4kcp951wmiCy/b
	EWmnnu7yHYeqg2vYeAzt/PsRZVgDHN9Wou9rRiZpXxXNd/eFCZlIboGTMzl+X2WUjMj2aCu3QNuje
	XNm0rfnLpnMjD4FwOj0ALxgiHKGgPsVG9Ia8M4xdfELtjj4sCQV6Q90RXcKAK/nIvogiBZjM0ZHeu
	bvSoeXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTUg-00000000qlN-3W4f;
	Tue, 02 Sep 2025 16:04:27 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPry-0000000H8v9-31iW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:12:18 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250902121208epoutp034a78e14cbe985cad8cf75bca0197ba7e~hdg0qaKHF2963929639epoutp03Q
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Sep 2025 12:12:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250902121208epoutp034a78e14cbe985cad8cf75bca0197ba7e~hdg0qaKHF2963929639epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756815128;
	bh=vaJV/AYbl/mon1qabDaukZJ7qz3bjN/L9fdsiOaq8ts=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BnBYEEuoDc/f1i8coBZpjSDdZmLJ/bxS0G7FgAJlchWxp4TzQ3vcxAzYobg68pHid
	 8pXZJCYwi72bm1bEcRyJ+W1FzGVMP7lUzQNujnBCEk95Yi1k4kRtlQXCP4XmFuFmY5
	 ASxX6Q58T7MMcXApQeT8Q8IpoA0dCmwhZwQFvxPE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250902121207epcas5p2d9c0ed34e884b15ee3784c0dee8cc161~hdg0ITcbx1190711907epcas5p2I;
	Tue,  2 Sep 2025 12:12:07 +0000 (GMT)
Received: from epdlp11prp5 (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cGPkG6y72z6B9m6; Tue,  2 Sep
	2025 12:12:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250902121206epcas5p130402f52b030caf571bfd7de06e81958~hdgync_Gb2445224452epcas5p1w;
	Tue,  2 Sep 2025 12:12:06 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250902121202epsmtip21e7e1f2f4beedb479066f12deb8570f3~hdgvc4E3O0979409794epsmtip2f;
	Tue,  2 Sep 2025 12:12:02 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
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
In-Reply-To: 
Subject: RE: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Tue, 2 Sep 2025 17:42:01 +0530
Message-ID: <000001dc1c02$cc89fda0$659df8e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+wLwFCB2ArX7ZGwBn6FItwLUPA9DAP+/dGQCDX8RFrR+kenQgAZH6FA=
Content-Language: en-in
X-CMS-MailID: 20250902121206epcas5p130402f52b030caf571bfd7de06e81958
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
X-CRM114-CacheID: sfid-20250902_051216_218440_57C0635A 
X-CRM114-Status: GOOD (  30.25  )
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
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 29 August 2025 05:33 PM
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Alim Akhtar'
> <alim.akhtar=40samsung.com>
> Cc: 'vkoul=40kernel.org' <vkoul=40kernel.org>; 'kishon=40kernel.org'
> <kishon=40kernel.org>; 'robh=40kernel.org' <robh=40kernel.org>;
> 'krzk+dt=40kernel.org' <krzk+dt=40kernel.org>; 'conor+dt=40kernel.org'
> <conor+dt=40kernel.org>; 'andre.draszik=40linaro.org'
> <andre.draszik=40linaro.org>; 'peter.griffin=40linaro.org'
> <peter.griffin=40linaro.org>; 'kauschluss=40disroot.org' <kauschluss=40di=
sroot.org>;
> 'ivo.ivanov.ivanov1=40gmail.com' <ivo.ivanov.ivanov1=40gmail.com>;
> 'igor.belwon=40mentallysanemainliners.org'
> <igor.belwon=40mentallysanemainliners.org>; 'johan=40kernel.org'
> <johan=40kernel.org>; 'm.szyprowski=40samsung.com'
> <m.szyprowski=40samsung.com>; 's.nawrocki=40samsung.com'
> <s.nawrocki=40samsung.com>; 'linux-phy=40lists.infradead.org' <linux-
> phy=40lists.infradead.org>; 'devicetree=40vger.kernel.org'
> <devicetree=40vger.kernel.org>; 'linux-kernel=40vger.kernel.org' <linux-
> kernel=40vger.kernel.org>; 'linux-arm-kernel=40lists.infradead.org' <linu=
x-arm-
> kernel=40lists.infradead.org>; 'linux-samsung-soc=40vger.kernel.org' <lin=
ux-
> samsung-soc=40vger.kernel.org>; 'rosa.pila=40samsung.com'
> <rosa.pila=40samsung.com>; 'dev.tailor=40samsung.com'
> <dev.tailor=40samsung.com>; 'faraz.ata=40samsung.com'
> <faraz.ata=40samsung.com>; 'muhammed.ali=40samsung.com'
> <muhammed.ali=40samsung.com>; 'selvarasu.g=40samsung.com'
> <selvarasu.g=40samsung.com>
> Subject: RE: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo ssphy
>=20
> Hi Krzysztof,
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: 29 August 2025 04:56 PM
> > To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Pritam Manohar Sutar'
> > <pritam.sutar=40samsung.com>
> > Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > krzk+dt=40kernel.org; conor+dt=40kernel.org; andre.draszik=40linaro.org=
;
> > peter.griffin=40linaro.org; kauschluss=40disroot.org;
> > ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.or=
g;
> > johan=40kernel.org; m.szyprowski=40samsung.com; s.nawrocki=40samsung.co=
m;
> > linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> > kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy:
> > add
> > ExynosAutov920 combo ssphy
> >
> > On 29/08/2025 12:58, Alim Akhtar wrote:
> > > Hi Krzysztof
> > >
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> > >> Sent: Friday, August 29, 2025 4:07 PM
> > >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.c=
om;
> > >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> > >> igor.belwon=40mentallysanemainliners.org;
> > >> johan=40kernel.org; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com;
> > >> linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org;
> > >> linux-kernel=40vger.kernel.org; linux-arm-
> > >> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> > >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> > faraz.ata=40samsung.com;
> > >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > >> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-p=
hy:
> > >> add
> > >> ExynosAutov920 combo ssphy
> > >>
> > >> On 29/08/2025 12:15, Pritam Manohar Sutar wrote:
> > >>> Hi Krzysztof
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Krzysztof Kozlowski <krzk=40kernel.org>
> > >>>> Sent: 26 August 2025 02:05 PM
> > >>>> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > >>>> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > >>> .
> > >>> .
> > >>> =5Bsnip=5D
> > >>> .
> > >>> .
> > >>>>>> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-d=
rd-phy:
> > >>>>>> add
> > >>>>>> ExynosAutov920 combo ssphy
> > >>>>>>
> > >>>>>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar
> wrote:
> > >>>>>>> This phy supports USB3.1 SSP+(10Gbps) protocol and is
> > >>>>>>> backwards compatible to the USB3.0 SS(5Gbps). It requires two
> > >>>>>>> clocks, named =22phy=22 and =22ref=22. The required supplies fo=
r
> > >>>>>>> USB3.1 are named as vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> > >>>>>>
> > >>>>>> Please do not describe the schema, but hardware. This sentence
> > >>>>>> does not help me in my question further.
> > >>>>>
> > >>>>> This is a combo phy having Synopsys usb20 and usb30 phys (these
> > >>>>> 2 phys are
> > >>>> totally different).
> > >>>>> One PHY only supports usb2.0 and data rates whereas another one
> > >>>>> does
> > >>>>> usb3.1 ssp+ and usb3.1 ssp
> > >>>>>
> > >>>>> This patch only explains about usb30 (since these are two
> > >>>>> different
> > >>>>> phys) phy
> > >>>> and omitted inclusion of usb20 reference (added separate patch
> > >>>> for this patch no 3).
> > >>>>>
> > >>>>> Hope this is clear.
> > >>>>
> > >>>> No. That sentence still explains what schema is doing.
> > >>>>
> > >>>
> > >>> Ok, let me simplify the commit message further something like below=
.
> > >>> Anyways, the coverletter contains more details about it.
> > >>>
> > >>> =22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo
> > >>> ssphy
> > >>>
> > >>>   Add schema for combo ssphy found on this SoC.
> > >>> =22
> > >>>
> > >>> Please confirm if this looks fine?
> > >>> If so, will reflect the similar commit messages in patch 1 and 3.
> > >>
> > >> Please read my first comment again. I do not see how does this
> > >> satisfy hardware explanation.
> > >>
> > > Just went through the conversation above, until what extent hardware
> > > description need to be explain in the commit?
> > > Do we have any guideline for the same?
> > > Could you please help with an example from previous any commit or
> > > some
> > other patches?
> > > I understand that mentioning, =E2=80=9Ctwo=20clocks,=20two=20supplies=
=20etc=22=20are=0D=0A>=20>=20>=20part=20of=20schema,=20one=20may=20or=20may=
=20not=20capture=20that=20in=20the=20commit.=0D=0A>=20>=20>=20However=20men=
tioning,=20=E2=80=9Cthis=20hardware=20(SoC)=20contain=20a=20combo=20PHY=20w=
hich=0D=0A>=20>=20supports=20usb3.1=20and=20usb3.0=22=20is=20not=20ok?=0D=
=0A>=20>=0D=0A>=20>=0D=0A>=20>=20Maybe=20that's=20just=20language,=20but=20=
to=20me=20the=20commit=20msg=20did=20not=20describe=0D=0A>=20>=20hardware=
=20after=20first=20sentence,=20but=20said=20what=20schema=20requires=20(som=
e=0D=0A>=20>=20clocks=20and=20supplies).=20Other=20examples:=0D=0A>=20>=200=
0399bbe02d2bb6fd8d6eb90573ec305616449f4=0D=0A>=20>=20e4c9a7b475e5d0d9b2440e=
e48f91d1364eabd6cb=0D=0A>=20>=0D=0A>=20=0D=0A>=20Thank=20you=20for=20the=20=
pointers,=20will=20refer=20the=20examples=20and=20update=20the=20commit=0D=
=0A>=20messages=20accordingly.=0D=0A=0D=0ACan=20you=20please=20confirm,=20i=
f=20below=20message=20looks=20fine?=0D=0A=0D=0A=22=20=0D=0Adt-bindings:=20p=
hy:=20samsung,usb3-drd-phy:=20add=20ExynosAutov920=20combo=20ssphy=0D=0A=0D=
=0AThe=20USBDRD31=205nm=20controller=20consists=20of=20Synopsys=20USB20=20p=
hy=20and=20=0D=0AUSB31=20SSP+=20combophy.=20Document=20support=20for=20the=
=20USB31=20SSP+=20phy=20found=0D=0Aon=20combophy=20of=20the=20ExynosAutov92=
0=20SoC.=0D=0A=22=0D=0A=0D=0A>=20=0D=0A>=20>=20and=20here=20another=20anti-=
pattern:=0D=0A>=20>=2023f793850e9ee7390584c0809f085d6c88de7d3f=0D=0A>=20>=
=0D=0A>=20>=20(and=20before=20you=20ask=20why=20above=20carries=20my=20Rb=
=20tag,=20then=20note=20that=0D=0A>=20>=20Samsung's=20revenue=20is=20around=
=20220=20billion=20USD,=20so=20for=20sure=20it=20has=20a=20lot,=0D=0A>=20>=
=20really=20a=20lot=20of=20resources=20to=20review=20patches=20internally=
=20and=20improve=0D=0A>=20>=20their=20quality=20before=20posting).=0D=0A>=
=20>=0D=0A>=20>=20Best=20regards,=0D=0A>=20>=20Krzysztof=0D=0A>=20=0D=0A>=
=20Thank=20you.=0D=0A>=20=0D=0A>=20Regards,=0D=0A>=20Pritam=0D=0A=0D=0AThan=
k=20you.=20=0D=0A=0D=0ARegards,=0D=0APritam=0D=0A=0D=0A

