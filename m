Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D5CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gygMN3gMSxZ6Evr4Nrnpma342Igh7n4myrgw/1fPWg4=; b=rVTajKj1xIjdlCRrxriaECT6BN
	jrcRIl2tm5vvtC5iO1Tx/kANV4hsfxD0NDXqFpq06PZ+oK4HJ6OjNbXc8h3qQE9LQFAepnkoPq09L
	tMo+Bj/Lpo24ZsGQuwwV/nH6g3yobxMffccGgQ2Byrgv+ruIhT90RGXOMbUjP0f58iO87qwGu3ttH
	rgA6yuBuuIDlHaiOE+Uc+KZzXUBMPDweZDsM5xH51raZiRX7y6b7joHQr2RsJzy7ileHZB+H55X9m
	ShAjOlPYu0RmMzpXMbMaMNJO8wWQBPSu0UXwxC12V4zu8vIWdjMCP04SIpjX3ujwgc1qMYnVGzEyZ
	tOEwf6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrfG-0000000BkRb-1EyF;
	Tue, 26 Aug 2025 11:16:37 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqbS-0000000BZOE-3waa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 10:08:37 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250826100828epoutp0145b09dc2035d3ee87de567a771f8852c~fST2wVBPa1269512695epoutp014
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 10:08:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250826100828epoutp0145b09dc2035d3ee87de567a771f8852c~fST2wVBPa1269512695epoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756202909;
	bh=gygMN3gMSxZ6Evr4Nrnpma342Igh7n4myrgw/1fPWg4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=r7NlZ/4tAu+9H/3P7ZWUKTeFXtGPrnNGXPVGjg+FnDizdhhY2CcucA6jZY56cem/W
	 +67efryuTeLX78KEo8RXX7wyJn+cGCSiHzt5hSkaHeJF9GbnTAncXUgfih65s/Ru86
	 AnYJnsVxc+pynbElLONt0wHfZZL3yl6125+xZmlE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250826100827epcas5p1193525accefc68efcd36c224d01ca9fc~fST10omlf3119231192epcas5p1b;
	Tue, 26 Aug 2025 10:08:27 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cB3Jq08MPz6B9mF; Tue, 26 Aug
	2025 10:08:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250826100826epcas5p24abdd08b355b1a7c1064b086bb9c11ac~fST0MRrip0241602416epcas5p2f;
	Tue, 26 Aug 2025 10:08:26 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250826100822epsmtip1d21b4e23ad85bcf46748f0d59cda39b5~fSTwTkU862841628416epsmtip1X;
	Tue, 26 Aug 2025 10:08:21 +0000 (GMT)
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
In-Reply-To: <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Tue, 26 Aug 2025 15:38:19 +0530
Message-ID: <019c01dc1671$5c8f6850$15ae38f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXxwGMECOMAYbqfFkCHlK3ygEZONEMslGN25A=
Content-Language: en-in
X-CMS-MailID: 20250826100826epcas5p24abdd08b355b1a7c1064b086bb9c11ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
	<20250814140943.22531-5-inbaraj.e@samsung.com>
	<1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
	<00d101dc136c$aa037020$fe0a5060$@samsung.com>
	<41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
	<016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
	<1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_030835_605255_C0E94D5D 
X-CRM114-Status: GOOD (  14.62  )
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


 >> Googling for =22MIPI CSIS=22 gives me 0 results, so I still claim this =
is
> >> not a generic name.
> >
> > I checked other vendors (e.g: freescale), and they are using mipi-csi.
> > I'll adopt for the same.
> >
> >
>=20
> Then it is just =22csi=22?=20

For the CSIS MIPI CSI-2 Rx handled by imx-mipi-csis driver, I'll keep node =
name as =22csi=22

>Except that you have some other different nodes called
> =22csi=22 as well, so two different devices are =22csi=22?

For CSIS video capture interface which is handled by fsd-csis driver I'll k=
eep node
name as =22csis=22.
 If =22csis =22 and =22csi=22 is kind of confusing in the same dt, then I'l=
l keep
as =22video=22.

is it fine?

Regards,
Inbaraj E


