Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD456CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2X+j5SJAMEREJd1w3t8TYTfU2tuNXV8TS1mq8smvaI=; b=o19xydxQAzab2z5kRUthaUv/NN
	EamR3xBpiRuQWqPxuL6rWRJOKwoW0vdGobaTrvom1BAPrMRoKw4SJugk4pe+j60oyWNE91RUDY3l9
	OT8mZB2Gx0XD6yAfnQXEsdXJJRr6DBBIyaovg8hTMnrPISayRPT1nX4z1vxUIuWk9fRuJw8aTJf3B
	Z4VrD1j806HIxo+DoZnXlBP2JfuwjE2xnNAXug+NiGbxyw52a0RPjNZK1aHIX3wUnxgxOz5QT5VTu
	gEJiqN0BcOBfpG4cPSVrj9n02lGgij3UI4i87sNKM7uXVRN5Zf13gH3XTG0v6/hbfjziOt6RGkWvT
	nwXdbuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymGf-0000000APnk-3sjB;
	Wed, 17 Sep 2025 07:07:53 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymGc-0000000APmX-2qKA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:07:52 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250917070744epoutp01ad6ba1324551f7a40c27f0c6d6410d3f~mACVIyOgS2141921419epoutp015
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:07:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250917070744epoutp01ad6ba1324551f7a40c27f0c6d6410d3f~mACVIyOgS2141921419epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758092864;
	bh=p2X+j5SJAMEREJd1w3t8TYTfU2tuNXV8TS1mq8smvaI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RGWtcuUaLhY8WQoRtyFOqx/FJvfhMKjDYYPiIGcIN/rh/LOZiSE0ImM6Uz7pCYiSz
	 7pwIjapvnQQrI1V11HFsyxt9lvlqFOgaXCJ6smnF/lygHilO0iyzaHcz3LyHrJEhPM
	 ebnabodwTvetz6i9shXEWIpf0hNPG2O0ofuHlw/k=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250917070743epcas5p21e3006ddc5adb45dae44c3ad85d064da~mACT3guNG0339903399epcas5p2Y;
	Wed, 17 Sep 2025 07:07:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cRVG61MTyz6B9m7; Wed, 17 Sep
	2025 07:07:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250917070741epcas5p3f40ff9cf54757eef08a6faa7451f4e2b~mACSKitQP0859608596epcas5p3-;
	Wed, 17 Sep 2025 07:07:41 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250917070737epsmtip204cd5a53ee83aea2bc9f33c333939bdd~mACOpKYWk2897628976epsmtip24;
	Wed, 17 Sep 2025 07:07:37 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Wed, 17 Sep 2025 12:37:36 +0530
Message-ID: <054e01dc27a1$c2011120$46033360$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcB8lF0oAGjtHpaA19Hw4WzwQPd4IAUON4A
Content-Language: en-in
X-CMS-MailID: 20250917070741epcas5p3f40ff9cf54757eef08a6faa7451f4e2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<20250904-interesting-lovely-ringtail-38bbef@kuoka>
	<000001dc1d70$aebf7d80$0c3e7880$@samsung.com>
	<87857202-b436-4476-9384-67566126d844@kernel.org> 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_000751_318309_E27CF586 
X-CRM114-Status: GOOD (  28.77  )
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
> Sent: 04 September 2025 03:52 PM
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>
> Cc: 'vkoul=40kernel.org' <vkoul=40kernel.org>; 'kishon=40kernel.org'
> <kishon=40kernel.org>; 'robh=40kernel.org' <robh=40kernel.org>;
> 'krzk+dt=40kernel.org' <krzk+dt=40kernel.org>; 'conor+dt=40kernel.org'
> <conor+dt=40kernel.org>; 'alim.akhtar=40samsung.com'
> <alim.akhtar=40samsung.com>; 'andre.draszik=40linaro.org'
> <andre.draszik=40linaro.org>; 'peter.griffin=40linaro.org'
> <peter.griffin=40linaro.org>; 'kauschluss=40disroot.org' <kauschluss=40di=
sroot.org>;
> 'ivo.ivanov.ivanov1=40gmail.com' <ivo.ivanov.ivanov1=40gmail.com>;
> 'igor.belwon=40mentallysanemainliners.org'
> <igor.belwon=40mentallysanemainliners.org>; 'm.szyprowski=40samsung.com'
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
> Subject: RE: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> Hi Krzysztof,
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: 04 September 2025 03:12 PM
> > To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> > andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> > igor.belwon=40mentallysanemainliners.org;
> > m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> > phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> > kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy:
> > add
> > ExynosAutov920 HS phy compatible
> >
> > On 04/09/2025 09:51, Pritam Manohar Sutar wrote:
> > > Hi Krzysztof,
> > >
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> > >> Sent: 04 September 2025 12:18 PM
> > >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> > >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.c=
om;
> > >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> > >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> > >> igor.belwon=40mentallysanemainliners.org;
> > >> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> > >> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> > >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > >> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> > >> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> > >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> > >> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-p=
hy:
> > >> add
> > >> ExynosAutov920 HS phy compatible
> > >>
> > >> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote=
:
> > >>> Document support for the USB20 phy found on the ExynosAutov920 SoC.
> > >>> The
> > >>> USB20 phy is functionally identical to that on the Exynos850 SoC,
> > >>> so no driver changes are needed to support this phy. However, add
> > >>> a dedicated compatible string for USB20 phy found in this SoC.
> > >>>
> > >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > >>
> > >> You just dropped all tags without explaining why.
> > >
> > > Regretted inconvenience.
> > >
> > > There were significant changes in supplies' names in driver and
> > > schemas (patch-set v8). This led to make changes in patch no 5.  And
> > > review for these changes is needed.  Hence, removed RB tag in this pa=
tch-
> set.
> > >
> > > There was a ask for the same https://lore.kernel.org/linux-
> >
> phy/000401dc18cd=24ec02a1b0=24c407e510=24=40samsung.com/=23:=7E:text=3DLe=
t%20me%
> >
> 20know%2C%20because%20of%20above%20changes%2C%20should%20be%20
> >
> removing%20your%20%0A%27reviewed%2Dby%27%20tag%20from%20patch%
> > 201%20and%203.
> > >
> >
> >
> > Where in the changelog you explained why you dropped the tags?
>=20
> Along with supplies' names, there were similar commit messages for patch =
no 1,
> 3 as patch no 5 (v7). (though, they were explaining schema more than h/w)=
.
> Changed commit messages of the patch no 1, 3, 5 (v7) as per reference com=
mits
> and would like to get them reviewed again, so did not add RB for patch 1 =
and 3,
> which you had given RB (in v7).
>=20
> Forgot to add these details for dropping the RB tags in changelog.
> Do I need to send v9 by retaining RB for patch 1 and 3?
>=20

Gentle Reminder.=20

> >
> > Best regards,
> > Krzysztof
>=20
>=20
> Thank you.
>=20
> Regards,
> Pritam

Thank you,

Regards,
Pritam


