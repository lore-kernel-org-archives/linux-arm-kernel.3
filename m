Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561F5CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0995YYnJAnTIjeYpCGOJk4eW/chxUHWP1YLO7EuU3ls=; b=bfr+VFxFcF5fuZbg1C84EDbY94
	FtGGn2Zv4LpxOota1KDRmo6ibYQOuFnoN3MsshU87+IIb414BoqpgKibg4tIUxIY6EIHjfrOxlXPI
	ff7thUbL/OIp72hvtY7d+NX6qRJY19ad/a4k2iHcVM0OQKUDomsVwLJXqCL9Vpq+Y69vIiCG//yQS
	HDtlPO5x6KTTgF8FmcdNAQeCJkREZWPf3vROxx3NEgIqi2PdGUcOZjVSOqTlGNvX/QDy85oT0FzpY
	cLRcLlJ1G7j6qkjFCQVObKDdbgYTSFiIV59pGvqjSLzZq2qwfKdFMmpkDGyHlP/CiCXjGXdInxcgh
	6TcAd0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfd-00000008MFB-0y60;
	Mon, 25 Aug 2025 14:59:41 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWta-000000082nU-0WfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:06:00 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250825130554epoutp01909546c67e71016911fa1e065d6c1ddd~fBFe-5yxB1812218122epoutp01C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 13:05:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250825130554epoutp01909546c67e71016911fa1e065d6c1ddd~fBFe-5yxB1812218122epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756127154;
	bh=0995YYnJAnTIjeYpCGOJk4eW/chxUHWP1YLO7EuU3ls=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=pNXzyJlmiBU0DKc3lKjNxALMNiodJJDOgD3UbtdopGEJf6bzcmeQWgNNz1Lk9eXNO
	 Wt9rlxB7IBa4VIR0mrcc5qNUBCpf83wThWFZbDjlYBqWWTEodrNVPYaRzwpMoMO4Xp
	 fTbuVl9VgcepLUshqo7rV6iNe3urRYxtQB/WtgEc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825130553epcas5p10e031531d1ea200953db9b7c4a02085b~fBFeQTGPi0198901989epcas5p10;
	Mon, 25 Aug 2025 13:05:53 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9WJ06HqZz6B9m6; Mon, 25 Aug
	2025 13:05:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250825130552epcas5p2bae9faf360067377690b741b0b5ed53c~fBFc1uXMc2846128461epcas5p2b;
	Mon, 25 Aug 2025 13:05:52 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825130548epsmtip1d0a172254122ea7684cf0024cd158ef4~fBFZDiPSG1232912329epsmtip1B;
	Mon, 25 Aug 2025 13:05:48 +0000 (GMT)
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
In-Reply-To: <41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Mon, 25 Aug 2025 18:35:46 +0530
Message-ID: <016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXxwGMECOMAYbqfFmyafJvQA==
Content-Language: en-in
X-CMS-MailID: 20250825130552epcas5p2bae9faf360067377690b741b0b5ed53c
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_060558_666661_05E75D1D 
X-CRM114-Status: GOOD (  11.09  )
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

> >
> > CSIS stands for Camera Serial Interface Slave.
>=20
> Googling for =22MIPI CSIS=22 gives me 0 results, so I still claim this is=
 not a generic
> name.

I checked other vendors (e.g: freescale), and they are using mipi-csi. I'll=
 adopt for the
same.

>=20
> >

Regards,
Inbaraj E


