Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B6CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSP1hOZ0AsVWU04bWbtB20mHDgaN9TSqIhbjaBRHRyQ=; b=d8hOY+2EhzRgYLk2Vig+doq470
	lWP3KI42GjJcLKE0VOB1XxLva+fgxjOAhK9CUX1UJtaKSlQLFQJc+KM/rIpbCU58rG8/LWdS6krQ4
	Wtwo58+J6CG2TpzuiLdG5WxOvrIsUuM0kGkALeKrQiesdIR/IQBYaAGfpwdBizVIaqf3UkXBExPJV
	lv5TLfGk81Z7RAvck28doYbarV5U4DhcMqc2YFxDacRyKf01+k6Za4fvCIFrKBkFmCLvRHGb4rHJm
	3PJ44eCi53kHZrpdwKMO9bgy7uwYL0Yc9+5hfTDmZ9AosMKaFgwOzwQuyJDuaRWuV3UlwsScAnx/W
	ePf1niSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu82K-0000000BBOn-3Mlp;
	Thu, 04 Sep 2025 11:21:53 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu76e-0000000ArZ9-1lSG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:22:18 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250904102204epoutp01953eb075e35f1964a7f1efcc3d332763~iDTShEN8L3175531755epoutp01g
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 10:22:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250904102204epoutp01953eb075e35f1964a7f1efcc3d332763~iDTShEN8L3175531755epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756981324;
	bh=iSP1hOZ0AsVWU04bWbtB20mHDgaN9TSqIhbjaBRHRyQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dtC4k+ROPg66f9lY1NsNI0wkpkKWkj1gTW5yRJduCxfBnOEsKH4wmdjUM/PyQn0SO
	 vEUC1TELplS2e5ut9rgeOU523Cht2Yp5bREFpQXb0+FMVgIWIPVjLC75CGrg0FBDCw
	 31FxD3UbtbGr3e9BLqrEgmgvP3KJ4K+ypQOG8iB4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250904102203epcas5p2b0df51eeea6ec050252650f41b15b480~iDTR7ag6b1396913969epcas5p2r;
	Thu,  4 Sep 2025 10:22:03 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cHbBL4fQ3z6B9m4; Thu,  4 Sep
	2025 10:22:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250904102201epcas5p2b0faaa8e8b9f42d99b4cfe51b76ad30b~iDTQVvWuh0469504695epcas5p2e;
	Thu,  4 Sep 2025 10:22:01 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904102158epsmtip1ead7e955e4664fff710c39fa1f568ca0~iDTNWxioq1828118281epsmtip1H;
	Thu,  4 Sep 2025 10:21:58 +0000 (GMT)
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
In-Reply-To: <87857202-b436-4476-9384-67566126d844@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 4 Sep 2025 15:51:57 +0530
Message-ID: <001001dc1d85$c0d56a60$42803f20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcB8lF0oAGjtHpaA19Hw4WzwQPd4A==
Content-Language: en-in
X-CMS-MailID: 20250904102201epcas5p2b0faaa8e8b9f42d99b4cfe51b76ad30b
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
X-CRM114-CacheID: sfid-20250904_032216_767121_2C0B73DB 
X-CRM114-Status: GOOD (  26.07  )
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
> Sent: 04 September 2025 03:12 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 04/09/2025 09:51, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 04 September 2025 12:18 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com=
;
> >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> >> igor.belwon=40mentallysanemainliners.org;
> >> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> >> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >> linux-samsung- soc=40vger.kernel.org; rosa.pila=40samsung.com;
> >> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 HS phy compatible
> >>
> >> On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote:
> >>> Document support for the USB20 phy found on the ExynosAutov920 SoC.
> >>> The
> >>> USB20 phy is functionally identical to that on the Exynos850 SoC, so
> >>> no driver changes are needed to support this phy. However, add a
> >>> dedicated compatible string for USB20 phy found in this SoC.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>
> >> You just dropped all tags without explaining why.
> >
> > Regretted inconvenience.
> >
> > There were significant changes in supplies' names in driver and
> > schemas (patch-set v8). This led to make changes in patch no 5.  And
> > review for these changes is needed.  Hence, removed RB tag in this patc=
h-set.
> >
> > There was a ask for the same https://lore.kernel.org/linux-
> phy/000401dc18cd=24ec02a1b0=24c407e510=24=40samsung.com/=23:=7E:text=3DLe=
t%20me%
> 20know%2C%20because%20of%20above%20changes%2C%20should%20be%20
> removing%20your%20%0A%27reviewed%2Dby%27%20tag%20from%20patch%
> 201%20and%203.
> >
>=20
>=20
> Where in the changelog you explained why you dropped the tags?

Along with supplies' names, there were similar commit messages=20
for patch no 1, 3 as patch no 5 (v7). (though, they were explaining=20
schema more than h/w). Changed commit messages of the=20
patch no 1, 3, 5 (v7) as per reference commits and would like=20
to get them reviewed again, so did not add RB for patch 1 and 3,
which you had given RB (in v7).=20

Forgot to add these details for dropping the RB tags in changelog.=20
Do I need to send v9 by retaining RB for patch 1 and 3?

>=20
> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam


