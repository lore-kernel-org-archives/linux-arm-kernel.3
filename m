Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17985C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnRCYwReWiwurhPWhltxwYGFpC/0m//wbHgfZbzv9Kk=; b=xfgCoDjaMBz0WsIP5yGF+2j0Hu
	xMed7Aso3PvQtXRmnkjKAtn8E4YHWEnOu6XdCxvBmfFpLKeHDeS+U6K8yQqd72gW1jbvhZlQoCW7C
	nEktOVAEM/1iaVdmmM2G7RupF+Fm5vH0Xx0GW2J5yoct7UGYwIVtRB/tg/zEVAH6goqWpJTpmX7O+
	Hbttl3Bd/eju94AtRy4aLygXA9Tkn5jRCw7tx5CY+IGrH+tuh4vE+OurDhcebyUYKV1sIfNHXmpYc
	V605LGUcvDXRIDVA1RnPfAFLdJIk7MqRyKMNC76pA60otuNNacFwkx7l4yLL/LZZT26C8hhCJV57y
	vy7LT+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virz3-00000006qeQ-3X4k;
	Thu, 22 Jan 2026 10:32:13 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viryz-00000006qda-2fgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:32:12 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260122103200epoutp0131b337d266e69b4af1132868734d51b2~NBv7sF49o1376413764epoutp019
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:32:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260122103200epoutp0131b337d266e69b4af1132868734d51b2~NBv7sF49o1376413764epoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769077920;
	bh=tnRCYwReWiwurhPWhltxwYGFpC/0m//wbHgfZbzv9Kk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qt1l22qtdWEmi6By166P8BM1Bt4oRzDLCZNeTMSjLVGjwnM+vcKoYqhxgoMNVr9y3
	 IRHYW5/yQez6zyEWQDj/luX+fwWuxnbbPEd+3uRQ8VLt1iFtHyXMUT4IA73Cd3aW+a
	 ukcOhlfg+b5gF+3GSKqy2pfTUX81GU93R6gw6XCY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260122103159epcas5p30f2fcd4a52671b2b064775d618b9dc94~NBv7EUo_I3092930929epcas5p32;
	Thu, 22 Jan 2026 10:31:59 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dxcnC0Vd2z6B9m9; Thu, 22 Jan
	2026 10:31:59 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260122103158epcas5p4e3fdf02aa0032bde16aefcf8f7896ef9~NBv5zye7J2850828508epcas5p4P;
	Thu, 22 Jan 2026 10:31:58 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260122103156epsmtip14657583bd1d596454c150368232302b9~NBv4DErW82162221622epsmtip1U;
	Thu, 22 Jan 2026 10:31:56 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
Subject: RE: [PATCH 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Thu, 22 Jan 2026 16:01:51 +0530
Message-ID: <000001dc8b8a$543269d0$fc973d70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJC10xQ5cnsV5/dezQFmmCfFyZ4QgFqW1wVtIYQSwA=
Content-Language: en-in
X-CMS-MailID: 20260122103158epcas5p4e3fdf02aa0032bde16aefcf8f7896ef9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
References: <CGME20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284@epcas5p4.samsung.com>
	<20251024114845.2395166-1-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_023210_003144_CF430EAA 
X-CRM114-Status: GOOD (  19.28  )
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

Hi All,=20

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 24 October 2025 05:19 PM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com; faraz.ata=40samsung.co=
m;
> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com;
> pritam.sutar=40samsung.com
> Subject: =5BPATCH 0/3=5D Add and enable USB nodes for ExynosAutov920 SoC
>=20
> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD controllers=
 and
> amoung them, one is USB3.1 DRD combo phy and three
> USB2.0 phy controllers. This patchset adds and enables USB and USB-PHY no=
des
> in dts.
>=20
> PMIC driver is not implmented yet, we rely on USB LDOs being enabled by t=
he
> bootloader and used dummy regulators for now.
>=20
> To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
> GPIO expander is present in the dts, we used it to enable the vbus regula=
tor
> using GPIO.
>=20
> USB ports are configured as OTG, and default mode is configured as periph=
eral.
> These configurations might be changed based on requirements.
>=20
> This patchset has dependancy on schema and driver implementation=5B1=5D a=
nd role
> switch control from userspace=5B2=5D patches.
> =5B1=5D: https://lore.kernel.org/linux-phy/20251010070912.3758334-1-
> pritam.sutar=40samsung.com/
> =5B2=5D: https://lore.kernel.org/linux-usb/20251024085455.789555-1-
> pritam.sutar=40samsung.com/

Above dependent patches are merged, can you please review the patchset?=20

>=20
> Pritam Manohar Sutar (3):
>   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
>   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
>   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
>=20
>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 160 +++++++++++++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 162 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
>=20
> --
> 2.34.1

Thank you,=20

Regards,
Pritam=20



