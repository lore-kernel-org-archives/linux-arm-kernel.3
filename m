Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46874CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dl+b+dAk76gbfMu7WsZhTUofWjMUuUVuug8qmGt/SgQ=; b=rKTytd6VMBpsIvTajubg1Mrdlx
	+PqxjKHVetknzwRS0MEyLXgVc2ICnk8gmRPgCbAjV9tKxFQ3LVwxpDhBKkSL329OZFNXSeulG5+cL
	fW8OnPv724zCTOHHAqcrQ5bHvCJ7o9wm4Gnz2mE8tUzdvAuLLS9JVOLHUwXT8ub5rwwyb6Uk50Zml
	KNykq4iXv0wzdvlecwfyi85mfTMq4TNWp/TDJ6xtjYVFZlGbQGh170AnR3e5Sw4jbEL/aYc7lBnVJ
	mhqbzdvnFlZJxJT+PBcNyg4UCUtEGQqVC1WMqBuQXyC9yFtPuTqyJXPfePqlC72ILNf6hxdlBAyGG
	fxXV+h6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFCV-000000093WG-2U99;
	Fri, 24 Oct 2025 10:39:15 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFCR-000000093UP-3OTX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:39:14 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251024103902epoutp01206f4eb77879e42672ea0626e7f8c650~xZyYSuBJr1444314443epoutp01T
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:39:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251024103902epoutp01206f4eb77879e42672ea0626e7f8c650~xZyYSuBJr1444314443epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761302342;
	bh=dl+b+dAk76gbfMu7WsZhTUofWjMUuUVuug8qmGt/SgQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=o8mXKmRTF4GpGc+Y7y/mMG2e4F1PCJgR0h7n8wKARyOFtPYc2dRTkSOgZfCO6Dh25
	 xhqPdurCb3a0/f+CUB0FdL0e2T+LNvRxAXKArp18lCHuPiT8Mcle1QJ0aDuxhTwooI
	 TNUNQmfpgWf5PTcN1Zc02sWX+PU4ZXwXSu/7YAR0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251024103901epcas5p2a433be2f9b5a01c5d29e22cc1f251194~xZyXic9CG0277602776epcas5p2i;
	Fri, 24 Oct 2025 10:39:01 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ctKBr53G0z6B9m6; Fri, 24 Oct
	2025 10:39:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251024103859epcas5p49b77262f51a3ffad8c3f4fc2032d156c~xZyVe6IAy1394013940epcas5p4i;
	Fri, 24 Oct 2025 10:38:59 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251024103855epsmtip1f303eee714eb0c38a99ca9281c48225a~xZyR-qtpQ3110431104epsmtip1I;
	Fri, 24 Oct 2025 10:38:55 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <johan@kernel.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20251010070912.3758334-1-pritam.sutar@samsung.com>
Subject: RE: [PATCH v9 0/6] initial usbdrd phy support for Exynosautov920
 soc
Date: Fri, 24 Oct 2025 16:08:51 +0530
Message-ID: <000701dc44d2$67f0d690$37d283b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF7oV+n5BMArQ7/Kr7NJhFkLim/CAId6djPtYFw0bA=
Content-Language: en-in
X-CMS-MailID: 20251024103859epcas5p49b77262f51a3ffad8c3f4fc2032d156c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595
References: <CGME20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595@epcas5p3.samsung.com>
	<20251010070912.3758334-1-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_033912_486048_5D99897D 
X-CRM114-Status: GOOD (  30.59  )
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

Hi Vinod,=20

Gentle reminder. Can you please take this to your tree=20
and let me know if any comments?=20

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 10 October 2025 12:39 PM
> To: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> johan=40kernel.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com;
> pritam.sutar=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: =5BPATCH v9 0/6=5D initial usbdrd phy support for Exynosautov920=
 soc
>=20
> This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only DRD phy
> controllers as mentined below
>=20
>   * Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>     compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
>     to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
>     These two phys are combined to form a combo phy as mentioned below.
>=20
>=20
>    USB30DRD_0 port
>=20
>  +------------------------------------------------------------+
>  =7C                                                            =7C
>  =7C                (combo) USB phy controller                  =7C
>  =7C      +----------------------------------------------+      =7C
>  =7C      =7C                  USB HSPHY                   =7C      =7C
>  =7C      =7C  (samsung,exynosautov920-usbdrd-combo-hsphy) =7C      =7C
>  =7C      +----------------------------------------------+      =7C
>  =7C                                                            =7C
>  =7C    +--------------------------------------------------+    =7C
>  =7C    =7C                   USB SSPHY                      =7C    =7C
>  =7C    =7C   (samsung,exynosautov920-usb31drd-combo-ssphy)  =7C    =7C
>  =7C    +--------------------------------------------------+-   =7C
>  =7C                                                            =7C
>  +------------------------------------------------------------+
>  =7C                                                            =7C
>  =7C                     USBDRD30 Link                          =7C
>  =7C                       Controller                           =7C
>  +------------------------------------------------------------+
>=20
>   * USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
>     is very similar to the existing Exynos850 support in this driver.
>=20
>     USB20DRD_0/1/2 ports
>=20
>       +---------------------------------------------------+
>       =7C                                                   =7C
>       =7C                USB PHY controller                 =7C
>       =7C    +-----------------------------------------+    =7C
>       =7C    =7C              USB HSPHY                  =7C    =7C
>       =7C    =7C  (samsung,exynosautov920-usbdrd-phy)    =7C    =7C
>       =7C    +-----------------------------------------+    =7C
>       =7C                                                   =7C
>       +---------------------------------------------------+
>       =7C                                                   =7C
>       =7C             USBDRD20_* Link                       =7C
>       =7C                Controller                         =7C
>       =7C                                                   =7C
>       +---------------------------------------------------+
>=20
> The =22USB20 phy output isolation=22 is shared across the USB20 phys.
> We have to bypass isolation when any one of the USBs is configured and en=
able
> it when all are turned off. The =22USB31 phy isolation=22
> is seperate for USB31 phy.
>=20
> This patchset only supports device mode and same is verified with as NCM
> device
>=20
> changelog
> ----------
> Changes in v9:
> - added RB tags those were given in v7 =5B1=5D and v8.
> - updated commit message in patch no.1 by adding supplies'
>   names those are taken from phy User Manual =5B2=5D
>   link for v8: https://lore.kernel.org/linux-phy/20250903073827.3015662-1=
-
> pritam.sutar=40samsung.com/
> =5B1=5D: https://lore.kernel.org/linux-phy/20250824-mustang-of-glorious-
> sufficiency-b55bf4=40kuoka/
> =5B2=5D: https://lore.kernel.org/linux-phy/02ef5180-ad56-45f0-a56f-
> 87f442bf6793=40kernel.org/
>=20
> Changes in v8:
> - modified supplies' names in schema and driver.
> - Since supplies' names are changed, modified patch no 5. to
>   fix warnings in dtbs_check dt_binding_check.
> - updated commit message for patch no. 1, 3 and 5 to describe
>   hardware details.
>   link for v7: https://lore.kernel.org/linux-phy/20250822093845.1179395-1=
-
> pritam.sutar=40samsung.com/
>=20
> Changes in v7:
> - added fixes for driver build warnings
>   link for v6: https://lore.kernel.org/linux-phy/20250821073703.2498302-1=
-
> pritam.sutar=40samsung.com/
>=20
> Changes in v6:
> - added else part for new supplies in schemas those are only
>   supported for exynosautov920.
> - addressed comments for driver given in v5.
>   link for v5: https://lore.kernel.org/linux-phy/20250805115216.3798121-1=
-
> pritam.sutar=40samsung.com/
>=20
> Changes in v5:
>=20
> - addressed comments from v4 patchset.
>   - patch (1/6)
>     - DTS style is corrected and added required supplies in code/schema.
>     - schema block added to resolve below failure during 'dtbs_check'.
>       Unevaluated properties are not allowed ('dvdd075-usb-supply', 'vdd1=
8-
> usb20-supply', 'vdd33-usb20-supply' were unexpected.
>   - patch (2/6)
>     - removed usage_counter(take this later in subsequent patch-sets)
>   - patch (3/6)
>     - There are 3 types of the phys in this SoC.
>       - one is simmilar with exynos850 as mentioned in patch no.1.
>       - second supports only USB3.1 SSP+ and denoted in patch no 5
>       - third supports only USB2.0 HS as in patch3.
>     - hs phy in combo phy is =22NOT=22 same as phy. (in patch no. 1)
>     - These three phys(usbdrd-phy, combo-hsphy, combo-ssphy) are totally
>       deferent, =22NOT=22 same, hence added three compatible for three ph=
ys.
>   - patch (5/6)
>     - Since there are two phys in combo phy, explaination is given
>       in each patch.
>   link for v4: https://lore.kernel.org/linux-phy/20250701120706.2219355-1=
-
> pritam.sutar=40samsung.com/
>=20
> Changes in v4:
> - addressed comments from v3 patchset
>   - removed dts related patches, to be posted in new patchset.
>   - added regulator, pmu and power sequences.
>   - phy isol is shared across USBs, added usage counter to bypass or
>     enable phy isolation.
>   - modified schemas with hs and combo phy compatible names
>     (used =22combo=22 to denote combo phy) and regulators
> - modified code to work with binding and unbinding devices/drivers
> - added =22Reviewed-by=22 tag.
>   link for v3: https://lore.kernel.org/linux-phy/20250613055613.866909-1-
> pritam.sutar=40samsung.com/
>=20
> Changes in v3:
> - Updated dt-bindings for USB2.0 only.
> - Added dt-bindings for combo phy.
> - Added implementation for combo phy (SS and HS phy).
> - Added added DTS nodes for all the phys
>   link for v2: https://lore.kernel.org/linux-phy/20250516102650.2144487-1=
-
> pritam.sutar=40samsung.com/
>=20
> Changes in v2:
> - Used standard GENMASK() and FIELD_GET() to get the major version
>   from controller version register.
>   link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-
> pritam.sutar=40samsung.com/
>=20
> Pritam Manohar Sutar (6):
>   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
>     compatible
>   phy: exynos5-usbdrd: support HS phy for ExynosAutov920
>   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo hsphy
>   phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920
>   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo ssphy
>   phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920
>=20
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C  48 ++
>  drivers/phy/samsung/phy-exynos5-usbdrd.c      =7C 651 ++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h   =7C   3 +
>  3 files changed, 702 insertions(+)
>=20
> --
> 2.34.1

Thank you,

Regards,
Pritam


