Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C3DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uU0UrKirjvX5fa8m8MUKd9RwSD+yLy9b8io3irBzxG8=; b=FanERnOkO22m3w/zlg+ByV2h+y
	cx+XD6H99OCTJ1sRSoTiPWXDsYr4qE5f+X6MWjcPaiE7ZJ+iZeiHcEpVQXg+e9SydtoILMwgf4P4F
	hBXWmG4eJIFrVaL3M9VFltAEQN0lVv3lhUv/+xytRYPmUB1DAVrj3+AT+eKgXklRSt7nDG2kV/tYL
	OuDOVeBgl7iVuMe1OFSvjBdqLuPa4+KFeolzLFlD/fcFa7QumoVGh+p9nzpmjmlZy0ALg+loAXqUG
	RnR5ofA+EXmSgWDlApXcI071omBxYST4L2JSnZv/fdirCOh/1BvKgM7oYBoV5nO4kVNzL8fELiOEz
	vFxjRibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvkX-0000000B6Wi-3yGD;
	Mon, 01 Sep 2025 04:02:34 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvJ9-0000000B2gY-1ACh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 03:34:17 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250901033400epoutp04228c17e08d8463f94cfa7f9eb666fe58~hCzJ059nc1119911199epoutp04k
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 03:34:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250901033400epoutp04228c17e08d8463f94cfa7f9eb666fe58~hCzJ059nc1119911199epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756697641;
	bh=uU0UrKirjvX5fa8m8MUKd9RwSD+yLy9b8io3irBzxG8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dxpygT4gWAUUKJDRI4VWQHqVa+8eUzjre26YsG4Ptm4PqPBDH51a58f513uU8Atr1
	 BgOyW0SMz+bc6D0x2mhIaeDy8euSza/RGRx2aquPIM1Uet1PCcLr+WfJWcfaUepqPZ
	 UWO/H7BKnKwtS0Vb2SLUGcWp6AnhnWnrVMk3zgvs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901033359epcas5p1c283a30d1db11caef94473d360e336f5~hCzI40H2Z2963529635epcas5p1V;
	Mon,  1 Sep 2025 03:33:59 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFZGt6tycz6B9mB; Mon,  1 Sep
	2025 03:33:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901033358epcas5p155659ad43787629cdd3221f359b8a72a~hCzHQdwnE2963529635epcas5p1R;
	Mon,  1 Sep 2025 03:33:58 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901033353epsmtip17c5fa910804d2969d332336802e28da9~hCzCu9gwp0939709397epsmtip1E;
	Mon,  1 Sep 2025 03:33:53 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <jesper.nilsson@axis.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>,
	<tomasz.figa@gmail.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <ksk4725@coasia.com>, <kenkim@coasia.com>,
	<pjsin865@coasia.com>, <gwk1013@coasia.com>, <hgkim05@coasia.com>,
	<mingyoungbo@coasia.com>, <smn1196@coasia.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <20250829-attentive-watchful-guan-b79ccc@kuoka>
Subject: RE: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Date: Mon, 1 Sep 2025 09:03:52 +0530
Message-ID: <000001dc1af1$4026d700$c0748500$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHHo9j0Rv1rvZf0N1R8AXn4x9PYUAJmRP9VAu8V1FcBMgRwRbRyXiFg
Content-Language: en-in
X-CMS-MailID: 20250901033358epcas5p155659ad43787629cdd3221f359b8a72a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342@epcas5p3.samsung.com>
	<20250825114436.46882-9-ravi.patel@samsung.com>
	<20250829-attentive-watchful-guan-b79ccc@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_203415_973654_10B1D584 
X-CRM114-Status: GOOD (  21.71  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 29 August 2025 13:26
...
> Subject: Re: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
> 
> On Mon, Aug 25, 2025 at 05:14:34PM +0530, Ravi Patel wrote:
> >  config ARCH_AXIADO
> >  	bool "Axiado SoC Family"
> >  	select GPIOLIB
> > diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> > index bdb9e9813e50..bcca63136557 100644
> > --- a/arch/arm64/boot/dts/exynos/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +subdir-y += axis
> >  subdir-y += google
> >
> >  dtb-$(CONFIG_ARCH_EXYNOS) += \
> > diff --git a/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> > new file mode 100644
> > index 000000000000..70bd1dcac85e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> Does not match rest of licenses.
> 
> > +/*
> > + * Axis ARTPEC-8 SoC device tree pinctrl constants
> > + *
> > + * Copyright (c) 2025 Samsung Electronics Co., Ltd.
> > + *             https://www.samsung.com
> > + * Copyright (c) 2025  Axis Communications AB.
> > + *             https://www.axis.com
> > + */
> > +
> > +#ifndef __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> > +#define __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> > +
> > +#define ARTPEC_PIN_PULL_NONE		0
...
> > +#define ARTPEC_PIN_DRV_SR6		0xd
> > +
> > +#endif /* __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__ */
> > diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..8d239a70f1b4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> 
> This is Dual license, so why pincltr header is not?

Thanks for the review.
I will update the Dual license in pinctrl header in the next version.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof



