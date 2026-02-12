Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50961EB4912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZFfPGxPusxBbKHt4baLlsQ9Gc0sz+hk6vgWNb44Ies=; b=MBIt86YHrB8ngmqo5eC3fNJSGA
	a5y8UiTEUvACtcmhm8CTgkwB5o3UHLYSCXkn81Yv7OehHHboLn8ZxH2uKrRsO9YvCtsyyEDDMLs3I
	zGghi105u19TEANEVCVfGCPfl+SgdJm8hMe946WdRwt2nz+UQ76IjXU1x6PJwRk1aATltc76s60Si
	biReZP7ZLlhJSfms72xqlAl6qLMJ3gGCzhSRX6LaV5yED9Or0m5WWK4fD5oFfFTLVmxG0Tc69nF73
	RHLpxkBWMZFm8qxMr8EDHQs5rGUn4S8VHSjYcc9BinRe5a4sCKEOLhNZ3dXn+qR8ckUBlCwmdGVOc
	kfa445hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV6A-0000000219n-0aZ9;
	Thu, 12 Feb 2026 11:43:06 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV66-0000000219P-1sIO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:43:04 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260212114256epoutp0342364b60bd44da9a0e8c3fc8dd78055d~TfQ2nTp050839808398epoutp036
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:42:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260212114256epoutp0342364b60bd44da9a0e8c3fc8dd78055d~TfQ2nTp050839808398epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896576;
	bh=wZFfPGxPusxBbKHt4baLlsQ9Gc0sz+hk6vgWNb44Ies=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=V01GzbvO6RXPWeFELqZ4TgxQ2BkCMKmDhQtUzVeDPu1ZNnFrTErZ4XwpSAdmRIChw
	 Nr1ZHTOZpf8lMbenCpHe2xD6zObpRm5ln8L8hegjbnt8xeOO9Lpn3/RVbNb0y3Z/Ta
	 v9wIsuRbeIqxElwI9811HND+cjMcYlQQl8C9L/IU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260212114255epcas5p3dd248c72347f12241748104d76a5dbb5~TfQ2UcD8p3128431284epcas5p39;
	Thu, 12 Feb 2026 11:42:55 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fBYML5zPnz2SSKd; Thu, 12 Feb
	2026 11:42:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212114254epcas5p1be7875dbd00568aaa8fdd04e09393b08~TfQ1CnGqP1171011710epcas5p1Z;
	Thu, 12 Feb 2026 11:42:54 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212114252epsmtip10d8f76a2a65e756f0876745b57923b5a~TfQzLNkY_1223812238epsmtip1X;
	Thu, 12 Feb 2026 11:42:52 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <91adfc3d-1612-4bc8-8f4e-525141fd9e67@kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
 nodes
Date: Thu, 12 Feb 2026 17:12:50 +0530
Message-ID: <000201dc9c14$b9502ab0$2bf08010$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwH8TUbRAqvnhIQBf1ky2gNZK3OcAfIgwmS2ptrFIA==
Content-Language: en-us
X-CMS-MailID: 20260212114254epcas5p1be7875dbd00568aaa8fdd04e09393b08
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>
	<20260122130721.205664-4-pritam.sutar@samsung.com>
	<6f381f88-3a51-4fc8-844c-41b167b07628@kernel.org>
	<000f01dc8c3e$2b6dcf30$82496d90$@samsung.com>
	<91adfc3d-1612-4bc8-8f4e-525141fd9e67@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034303_123831_4B203C04 
X-CRM114-Status: GOOD (  24.41  )
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
> Sent: Wednesday, January 28, 2026 1:07 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920: Enabl=
e USB
> nodes
>=20
> On 23/01/2026 08:59, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> > Thank you for your feedback.
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 22 January 2026 07:05 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>;
> robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> >> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.o=
rg;
> >> linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v2 3/3=5D arm64: dts: exynos: ExynosAutov920:
> >> Enable USB nodes
> >>
> >> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> >>> Enable USB PHY and DWC3 USB controllers' nodes.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>> ---
> >>>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 21
> >> +++++++++++++++++++
> >>>  1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> index f90f7704597c..5896dd69334a 100644
> >>> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> =40=40 -160,15 +160,20 =40=40 &xtcxo =7B
> >>>  &usbdrd31_ssphy =7B
> >>>  	dvdd-supply =3D <&dummy_regulator>;
> >>>  	vdd18-supply =3D <&dummy_regulator>;
> >>> +	status =3D =22okay=22;
> >>
> >> You just added the node in the previous patch, so why it cant be
> >> enavled there?
> >>
> >>>  =7D;
> >>>
> >>>  &usbdrd31_hsphy =7B
> >>>  	dvdd-supply =3D <&dummy_regulator>;
> >>>  	vdd18-supply =3D <&dummy_regulator>;
> >>>  	vdd33-supply =3D <&dummy_regulator>;
> >>> +	status =3D =22okay=22;
> >>>  =7D;
> >>>
> >>>  &usbdrd31_dwc3 =7B
> >>> +	dr_mode =3D =22otg=22;
> >>> +	usb-role-switch;
> >>> +	role-switch-default-mode =3D =22peripheral=22;
> >>
> >> Why did you add incomplete node in previous commit?
> >
> > The commit was added to align with the existing convention of
> > separating node addition and enabling logic in USB configurations.
> > This approach is referenced from commits such as:
> >
> > https://lore.kernel.org/all/20250710-resends-july-exynos990-dt-v2-5-55
> > 033f73d1b0=40mentallysanemainliners.org/
> > https://lore.kernel.org/all/20240429-usb-dts-gs101-v2-2-7c1797c9db80=40=
l
> > inaro.org/
> >
> > Please let me know if this commit to be merged in previous commit.
>=20
>=20
> BTW, don't ever use AI to write code or code justifications. I will make =
note
> of it.
>=20

Sorry for the misunderstanding. Will consider this in future.=20
However, AI was used to correct spell and grammatic mistakes.

> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam


