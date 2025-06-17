Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58441C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 01:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4ePGu/HbODHfgnW4Rd+HUYbGf55CDlg7sZxq2mBe4w=; b=p0sNzEur1u/Vf7uIhjy3/UBBRA
	DKQEZyhL+Evx6cE032cIaS/7Uu2QRPkXmqOzq1lO2mK72IRPtyXtt69hd1cogKy/oeUSQIsX6zskP
	sfC7dr1VFOh1jf/S7NAy0s2VSZJ1woskRa1WSzS4kBuZxufYxl6w9z21+s1skdhgPJXwuPIJ8pdg3
	ZHNowpheDGfyJ0cpnvo1LjnampgONSRQmLz+DQD++Abs10RwzMUx8u5T8bkZGF81hcZ+m7JPIUz1f
	rZhx4hUAuncQ+aTw+XVSDlRkOugTrMAdwYHnKRAXsrbQ7O7a7wDAXrTOtcXbI+iCb4C9wIa7hcZFd
	3ruv4yxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhd3-00000008klX-0l9C;
	Wed, 18 Jun 2025 01:30:17 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhRW-00000008jpL-2fN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 01:18:24 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250618011821epoutp03fcee41366b6c307a5d2563e8d49aed53~J-kSnR-gi1552615526epoutp03d
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 01:18:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250618011821epoutp03fcee41366b6c307a5d2563e8d49aed53~J-kSnR-gi1552615526epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209501;
	bh=f4ePGu/HbODHfgnW4Rd+HUYbGf55CDlg7sZxq2mBe4w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=sXphC0aTlOO6aRyI0peueCrJ7ZfvPU5xb4Fd92j9l57bTbx1Ue+6w0vdFV1vIO3Cl
	 c/qM+DGikHZNSsJCMbGvbSS2mCyNhaV2FMXnQYBnLhxbId9AfF5zRdCgiMFduiicfa
	 odMFXKEHUYB67ThaaCxPhQIsfK34HqIK00gNnuuw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250618011820epcas5p19a33a255e86e59b0ec429aa61c56cc63~J-kSAM_0S0181101811epcas5p1t;
	Wed, 18 Jun 2025 01:18:20 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.182]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQpy3dVRz3hhTM; Wed, 18 Jun
	2025 01:18:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250617180446epcas5p1fc8bbc3efe3ef7dc2c97e3f0598f7332~J5pvH0OJo0228502285epcas5p1Q;
	Tue, 17 Jun 2025 18:04:46 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617180443epsmtip130a4506dfb7f000acfa72e5107f09a8b~J5psRzdK51544215442epsmtip1a;
	Tue, 17 Jun 2025 18:04:43 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-snobbish-chimpanzee-from-arcadia-bd9fcb@kuoka>
Subject: RE: [PATCH v3 4/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Date: Tue, 17 Jun 2025 23:34:42 +0530
Message-ID: <000501dbdfb2$4f6f0450$ee4d0cf0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gI3IvSUAW5i7SwC0YsPGrDkisWw
Content-Language: en-in
X-CMS-MailID: 20250617180446epcas5p1fc8bbc3efe3ef7dc2c97e3f0598f7332
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7@epcas5p3.samsung.com>
	<20250613055613.866909-5-pritam.sutar@samsung.com>
	<20250616-snobbish-chimpanzee-from-arcadia-bd9fcb@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_181822_982292_10A3F07C 
X-CRM114-Status: GOOD (  11.74  )
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
> Sent: 16 June 2025 01:46 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 4/9=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo HS phy
>=20
> On Fri, Jun 13, 2025 at 11:26:08AM GMT, Pritam Manohar Sutar wrote:
> > Add a dedicated compatible string for USB combo HS phy found in this
>=20
> I reviewed patch =231, then went here and see that this is HS PHY. So pat=
ch =231
> is not HS PHY?
>=20

https://lore.kernel.org/linux-phy/20250613055613.866909-1-pritam.sutar=40sa=
msung.com/
This Soc has 2 types HS phys. one in combo phy and another stand-alone. ple=
ase refer the block diagrams in cover-letter.=20
=09
	1. samsung,exynosautov920-usbdrd-phy =3D> represents hs phy (synopsys phy =
version-303) and it is same as =22samsung,exynos850-usbdrd-phy=22. used sam=
e naming conventions
	2. samsung,exynosautov920-usbdrd-hsphy =3D> represents 'Add-on' HS phy(syn=
opsys phy version-400) with SS phy in combo phy. this is different from =22=
samsung,exynosautov920-usbdrd-phy=22 (reg offsets and bits are different).=
=20
	samsung,exynosautov920-usb31drd-ssphy =3D>  represents SS phy in combo phy

> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


