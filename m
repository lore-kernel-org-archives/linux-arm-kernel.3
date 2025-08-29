Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC56FCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv9U/ELR3k6SWjrkU4O+mI6LWfxEz2ED3Y1tR6NHKF8=; b=aUYvmNTc9dSqKKI5vynn2df77y
	0WZ/32V0e0XbmtK/aaKRrAeFPyzUXOptUW62aj6BTj6GsLjtSGsCnO0O/2Dgno7cij9HRSuN6JWCP
	ULup/XT085RLmOJNiqtDuP65zgnQl68QCv8ryMssTbHwNtF6CuNn6S/Evl5ztLANRhk63ovp9quCN
	CgV6WoaQFVvdLWmt8PzCS8T0ld+oUn6NyH/xHSBZbZEEvLX30fB9gOxpb43hFbxaegxjIiEhm95wl
	unzOaLBF81cViCukCGk5P5lkKUvejf4Nxi4jkkkGD7VJunYJ2BVFGIOCjy8UQxBWJVcrAuauUnAbT
	C3ibbMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryiU-00000005jft-1kBD;
	Fri, 29 Aug 2025 13:00:30 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw9S-00000005Hsw-3JXD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:16:13 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250829101605epoutp012dca976ae98a3248427d75a76ed1e76e~gNWWUWson0982609826epoutp01U
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 10:16:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250829101605epoutp012dca976ae98a3248427d75a76ed1e76e~gNWWUWson0982609826epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756462565;
	bh=Lv9U/ELR3k6SWjrkU4O+mI6LWfxEz2ED3Y1tR6NHKF8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=K8zlWAwjIwtvi/+yHoiwMgdpm6OZCS3twkn64fcDL3ezfmTHEGta4XlPTeny5KUiu
	 uTAoZ2f2HNbimqYOFs1Ge0tjppgXxdpXcWCZ7RVejc683tYCzk7x8kQxF8CURmJNlo
	 dSZTFDsjn5W0gLP6v8YJGvlFM0iUo84xXJx3Ow3U=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250829101604epcas5p152dde9d0bc1d2d685fecec6f444a072f~gNWVbT5zR1738917389epcas5p1J;
	Fri, 29 Aug 2025 10:16:04 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cCvLC1BF6z6B9mB; Fri, 29 Aug
	2025 10:16:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250829101602epcas5p357dad3ca9854d8150d975508acd57baf~gNWT11fFd0379903799epcas5p3K;
	Fri, 29 Aug 2025 10:16:02 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829101559epsmtip1de730ab72a1d43c000095ca871496224~gNWQtljFh1842718427epsmtip17;
	Fri, 29 Aug 2025 10:15:58 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <johan@kernel.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <83dc9435-5850-425d-b345-52e84ef9262c@kernel.org>
Subject: RE: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Fri, 29 Aug 2025 15:45:37 +0530
Message-ID: <000401dc18cd$ec02a1b0$c407e510$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+wLwFCB2ArX7ZGy0uja2wA==
Content-Language: en-in
X-CMS-MailID: 20250829101602epcas5p357dad3ca9854d8150d975508acd57baf
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031611_552816_FDFC82E9 
X-CRM114-Status: GOOD (  35.25  )
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
> Sent: 26 August 2025 02:05 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
=2E
=2E
=5Bsnip=5D
=2E
=2E
> >> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 combo ssphy
> >>
> >> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote:
> >>> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> >>> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> >>> =22phy=22 and =22ref=22. The required supplies for USB3.1 are named a=
s
> >>> vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> >>
> >> Please do not describe the schema, but hardware. This sentence does
> >> not help me in my question further.
> >
> > This is a combo phy having Synopsys usb20 and usb30 phys (these 2 phys =
are
> totally different).
> > One PHY only supports usb2.0 and data rates whereas another one does
> > usb3.1 ssp+ and usb3.1 ssp
> >
> > This patch only explains about usb30 (since these are two different phy=
s) phy
> and omitted inclusion of usb20 reference (added separate patch for this p=
atch
> no 3).
> >
> > Hope this is clear.
>=20
> No. That sentence still explains what schema is doing.
>

Ok, let me simplify the commit message further something like below.=20
Anyways, the coverletter contains more details about it.

=22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo ssphy

  Add schema for combo ssphy found on this SoC.
=22

Please confirm if this looks fine?
If so, will reflect the similar commit messages in patch 1 and 3.

> BTW, wrap your email correctly.
>=20

Sure, thanks for your input.=20

> >
> >>
> >>>
> >>> Add schemas for combo ssphy found on this SoC.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>> ---
> >>>  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C 23 +++++++++++++++=
++++
> >>>  1 file changed, 23 insertions(+)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> >>> b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> >>> index f0cfca5736b8..96e5bbb2e42c 100644
> >>> ---
> >>> a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> >>> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yam
> >>> +++ l
> >>> =40=40 -34,6 +34,7 =40=40 properties:
> >>>        - samsung,exynos7870-usbdrd-phy
> >>>        - samsung,exynos850-usbdrd-phy
> >>>        - samsung,exynos990-usbdrd-phy
> >>> +      - samsung,exynosautov920-usb31drd-combo-ssphy
> >>>        - samsung,exynosautov920-usbdrd-combo-hsphy
> >>>        - samsung,exynosautov920-usbdrd-phy
> >>>
> >>> =40=40 -118,6 +119,12 =40=40 properties:
> >>>    vdd18-usb20-supply:
> >>>      description: 1.8V power supply for the USB 2.0 phy.
> >>>
> >>> +  dvdd075-usb30-supply:
> >>> +    description: 0.75V power supply for the USB 3.0 phy.
> >>> +
> >>> +  vdd18-usb30-supply:
> >>> +    description: 1.8V power supply for the USB 3.0 phy.
> >>> +
> >>>  required:
> >>>    - compatible
> >>>    - clocks
> >>> =40=40 -227,6 +234,7 =40=40 allOf:
> >>>                - samsung,exynos7870-usbdrd-phy
> >>>                - samsung,exynos850-usbdrd-phy
> >>>                - samsung,exynos990-usbdrd-phy
> >>> +              - samsung,exynosautov920-usb31drd-combo-ssphy
> >>>                - samsung,exynosautov920-usbdrd-combo-hsphy
> >>>                - samsung,exynosautov920-usbdrd-phy
> >>>      then:
> >>> =40=40 -262,6 +270,21 =40=40 allOf:
> >>>        properties:
> >>>          dvdd075-usb20-supply: false
> >>>          vdd18-usb20-supply: false
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - samsung,exynosautov920-usb31drd-combo-ssphy
> >>> +    then:
> >>> +      required:
> >>> +        - dvdd075-usb30-supply
> >>> +        - vdd18-usb30-supply
> >>
> >> Why are you adding usb20 and usb30 suffixes to the supplies? These
> >> are separate devices, so they do not have both variants at the same ti=
me.
> >
> > This is a combo phy consisting of usb2 and usb3 phys combined.
> > To drive these separate phys, added suffixes for these supplies respect=
ively.
>=20
> But they are separate.
>=20
> >
> > Moreover, gs101 is also using similar convention for its usb20 and dp s=
upplies.
> > Added suffix for usb2 and usb3 as per our last communication
> > https://lore.kernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef
> > =40kernel.org/
>=20
> Then please review patches on the list and help to improve them BEFORE th=
ey
> got merged.
>=20
> I questioned the suffix there, so I really do not understand why did you =
added it.
>=20
> >
> >>
> >> From this device point of view, the supply is called dvdd075 or vdd18.
> >> If you open device datasheet (not SoC datasheet), that's how it will
> >> be called, most likely.
> >
> > Yes, Agree. In device datasheet, suffixes are not mentioned, but in our=
 board
> schematic it is mentioned.
> > Let me know your suggestion about adding suffixes?
>=20
> I already said, multiple times on various discussions. You name these bas=
ed on
> how the inputs are called in this device.

Ok, will remove suffixes from supplies.
And will add following supplies dvdd, vdd33 and vdd18.

Let me know, because of above changes, should be removing your=20
'reviewed-by' tag from patch 1 and 3.

>=20
> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


