Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F2DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YjDIVkSzZ1qBfDNEzt6aiWfmZ06SFpmvJBdwg8GbFU=; b=pxyc0Gs4nyj1ozSKsDJFO8nDSt
	32T4wyc34AhKlbvLNacOTzNhumR5qKfwfC5IIwnHp53fA4X+ajNPXDbxFLL4AewCClpq5j7vjof3G
	K2zw24KhuQ6nxCQch2RC1H/N9lmrk2naw0ljuQeioTJje53WRqopWHsd3tmtFuamGrxNEUjPdRjvR
	dIDuAfKNqeEeSgZH9U9pF25G9zkuJJcG58yajUOzQQwJ9VQfazU2MdxxLCM0QtP8inOFhwcB1gGux
	eIHlqef8hIgL00g4Hug+cTDG15WcYOwy7LzJqqySsBn0qlDf0gS1qHW3QOGo90eQsE527QdwB2jmt
	hX6czuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT4S-00000008Vzo-2sxQ;
	Wed, 09 Jul 2025 11:34:41 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRbZ-00000008DOK-0EMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:00:47 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250709100035epoutp0184672967c689ce0664ff23701ac8112d~QjPRJVwVH0169601696epoutp01d
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Jul 2025 10:00:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250709100035epoutp0184672967c689ce0664ff23701ac8112d~QjPRJVwVH0169601696epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752055235;
	bh=8YjDIVkSzZ1qBfDNEzt6aiWfmZ06SFpmvJBdwg8GbFU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=crM7sDQ1Uz9NtR7Lf5itnb9Kxo52UH9FjSGOjp2JkszPtedhMD5yYtuYLOW3diez/
	 JPkFeY49RxYNNxrnIaqgsbyUhQeN8lHbywF+MaOZmR+G2WbWzqcQ5AR4mnJDBjOoQ2
	 uzRfhHRw+oNiDyxGt4ThAj8UYDSsUzBnjC+ZaEg0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250709100035epcas5p11cefc566289685aa4dadd35429e93d22~QjPQiuHEG1114111141epcas5p1k;
	Wed,  9 Jul 2025 10:00:35 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bcYPr5Dhtz6B9mD; Wed,  9 Jul
	2025 10:00:32 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250709085159epcas5p15cd74d4ab9d7944eef406ce118768a84~QiTXJ9MsA0055000550epcas5p1N;
	Wed,  9 Jul 2025 08:51:59 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250709085156epsmtip13f8f84df1a677aaa0f8edc8247250f7a~QiTUNkrE12100421004epsmtip1O;
	Wed,  9 Jul 2025 08:51:55 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250706-grouse-of-pastoral-bloom-7d79b0@krzk-bin>
Subject: RE: [PATCH v4 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Date: Wed, 9 Jul 2025 14:21:54 +0530
Message-ID: <07d401dbf0ae$bb0256b0$31070410$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AJNRgOcAqL7pisBlv/N8LMsH/TA
Content-Language: en-in
X-CMS-MailID: 20250709085159epcas5p15cd74d4ab9d7944eef406ce118768a84
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120002epcas5p2c4d728d599a819057bcc40b724881276
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120002epcas5p2c4d728d599a819057bcc40b724881276@epcas5p2.samsung.com>
	<20250701120706.2219355-4-pritam.sutar@samsung.com>
	<20250706-grouse-of-pastoral-bloom-7d79b0@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030045_403341_6E141D64 
X-CRM114-Status: GOOD (  16.64  )
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
> Sent: 06 July 2025 03:12 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; neil.armstrong=40=
linaro.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 3/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo HS phy
>=20
> On Tue, Jul 01, 2025 at 05:37:03PM +0530, Pritam Manohar Sutar wrote:
> > This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>=20
> What is =22this=22? You add here HS PHY, so HS is 3.1?
>=20

=22this=22 means =22combo phy=22. Combo phy is combination of 2 types of th=
e phys.=20
1. one supports only USB3.1 SSP+ and denoted as =22samsung,exynosautov920-u=
sb31drd-combo-ssphy=22 as in patch no 5 (combo SS phy)
2. another supports only USB2.0 HS and termed as =22samsung,exynosautov920-=
usbdrd-combo-hsphy=22 as in this patch (combo HS phy)

> If this is the same phy, why are you adding another compatible?

As explained earlier (even in cover letter), there are 3 types of the phys =
in this SoC.
1. one is simmilar with exynos850 and termed as =22samsung,exynosautov920-u=
sbdrd-phy=22 as mentioned in patch no.1
2. two phys are in combo phys as explained above (patch no 3 =5Bcombo HS ph=
y=5D and 5=5Bcombo SS phy=5D)
		=09
NOTE: hs phy in combo phy in =22NOT=22 same as phy (patch no. 1 which is si=
milar with exynos850).=20
		=09
These three phys (usbdrd-phy, combo-hsphy, combo-ssphy) are totally deferen=
t =22NOT=22 same, hence added 3 three compatible for three phys.

>=20
> Best regards,
> Krzysztof



