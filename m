Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D097CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4a7zrF0Xr2ClAN6pV1FixF/O//yC/uzplxDHLALIK4=; b=xLXVKEUDjcOIlUMTX4z3m39V+M
	XzrhIi5PXVRlPGAw/3XRI2S5sLB4+lp4DeybYNWIkmRI3wg8nUQ9YF1aE+HiX5ltDuogIFx/pWfJA
	j/aM5/NgCtS7oBm5Mjg+rnS15M9D8D5pg++C/zv+zhEv8l3WyxcXtUeqNSn9duUC73FPGxj8jzvAs
	BDginoVt+TFsCPaOajkyIBaZA915pwxn7XoO3y80RrIurG13cEHJxG4z1h5G6tTci7jvolZlv0nnY
	i3fMQxh4P7y7L9Or7UH7ihbq4pcoJQzTkuvyavc1hxJjGTCrnF0v0eqPPYOabq/PhjoxkB8v0eesp
	flM7PJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWit-00000007zXZ-1rFE;
	Mon, 25 Aug 2025 12:54:55 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVn3-00000007qbm-2cur
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:55:13 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825115504epoutp04df3c2c099d93ad506fecfebb713a07e3~fAHomXRe-2781727817epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 11:55:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825115504epoutp04df3c2c099d93ad506fecfebb713a07e3~fAHomXRe-2781727817epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756122904;
	bh=t4a7zrF0Xr2ClAN6pV1FixF/O//yC/uzplxDHLALIK4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CI6X0S/Jsv7Kjb6cHe/Y/TBFcxIENb+lsuEYgQ8sV+JGy+RCHJ/rp+AsYvgFCc83y
	 4sO2ljNm/Q0wTFqR+1D27EXtXh6nABLvgDnA9Nr53VP6mqr+LExS6QbtiXkhGwKL8o
	 hnztLPGBbBtRKWtnpraFI8mrEMHAsfLjRXvesLoc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250825115503epcas5p3cfb8d3f909e3d377f5e0ff6166178520~fAHoFByz-3077330773epcas5p37;
	Mon, 25 Aug 2025 11:55:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9TkG5JQ2z2SSKZ; Mon, 25 Aug
	2025 11:55:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825115502epcas5p4279b95596caf95a26b0d5c6ccec726e9~fAHmgL5x80820308203epcas5p4B;
	Mon, 25 Aug 2025 11:55:02 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825115457epsmtip13e6a6a0580ea03ee165871a0c3831561~fAHinOYHh0161601616epsmtip1X;
	Mon, 25 Aug 2025 11:54:57 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <322df419-10fb-412c-9c3f-7493d9a58670@kernel.org>
Subject: RE: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Mon, 25 Aug 2025 17:24:56 +0530
Message-ID: <015901dc15b7$16a67b40$43f371c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQHrKQRZAj9O8PIBXjI9/wIrSUI/Adz/j96ya6VQEA==
Content-Language: en-in
X-CMS-MailID: 20250825115502epcas5p4279b95596caf95a26b0d5c6ccec726e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141057epcas5p21ca33641e42164886dc1bf404237876d@epcas5p2.samsung.com>
	<20250814140943.22531-12-inbaraj.e@samsung.com>
	<1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>
	<00d401dc13d2$65033080$2f099180$@samsung.com>
	<322df419-10fb-412c-9c3f-7493d9a58670@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_045511_762706_AD4970E9 
X-CRM114-Status: GOOD (  10.56  )
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

=2E
> >
> > I noticed that Exynos and NXP driver configs are added in the defconfig=
.
> > Could you please clarify why I shouldn't add my driver config in defcon=
fig?
>=20
> No, I gave you rationale why your commit description is poor.

I'll update the commit description in next patchset.

>=20
> Best regards,
> Krzysztof

Regards,
Inbaraj E


