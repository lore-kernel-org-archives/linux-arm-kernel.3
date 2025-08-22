Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D2ECA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujFd4Giejy/I8yLtIBnVKvcKVCgcw/eNDX6Exvhq7UA=; b=U/tZV3Z827bjz4jXuotyAq2lI9
	MPKCZkNVgUdGMhxyzPx9h/A0R0tNxUcPYFfouUZpGcdf5L4A5YB/aWg/HoS5+3d5fdT2ecvR0jLC6
	DcqcwAcSyqF9u8x7WASwZBIuWoqD9rOdSzH3iI1XBea7p16qgh/GJ1+AiKgfZBQ61AQ9nxjN7QKph
	ry5o11B5piThbM38JVyn/GA2spar/gxAJUx++ewpuLx7cx0+jwl/82ZP9GZQA3YOmFocydzxtg/aG
	zQJey3WqQP5iRINDnGbwtywYHFa5l7y1NHf61P9PmAXSQgraKMTcE4sFIGZsDjQk1YMCFADJzk7US
	mL6IHSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjk-00000003w3t-0dtj;
	Sat, 23 Aug 2025 06:28:24 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG3-00000002MwY-2Qtq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 11:48:38 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822114827epoutp02b75c2a42d722c97ac3ad2cedb47714cb~eFGAZnLbz2478624786epoutp02s
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 11:48:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822114827epoutp02b75c2a42d722c97ac3ad2cedb47714cb~eFGAZnLbz2478624786epoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755863307;
	bh=ujFd4Giejy/I8yLtIBnVKvcKVCgcw/eNDX6Exvhq7UA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=d74udDNdRLlEbqqumXK4rJgpifPriLPXzz9b0W+Aas1YiC5aN5I3DGXbT8IjmiMzL
	 qHLFdlv5mr9p9wCaIkmTO7YvYUH5KI9gWiGQltIY3HJSofgO3gWufJC200A20nG460
	 shvObn4sAShELbef1IenGujP9Pf+zN1+8DEdG5Qk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822114826epcas5p3a9642723b496f7b1b96daf8adfdf6de2~eFF-roZFA0540505405epcas5p3v;
	Fri, 22 Aug 2025 11:48:26 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7dk12S6Mz2SSKX; Fri, 22 Aug
	2025 11:48:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250822114824epcas5p2aa289a9a1e75e075c3ccc31f4f2ccb12~eFF9IW-Rj0864208642epcas5p2Q;
	Fri, 22 Aug 2025 11:48:24 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822114819epsmtip1c9b4c65341b860acb88b9ac5f2783f81~eFF4r4n5q2807728077epsmtip1l;
	Fri, 22 Aug 2025 11:48:19 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
Cc: <ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <pankaj.dubey@samsung.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <3a936b3b-0599-4b0a-83a8-52b899c24125@kernel.org>
Subject: RE: [PATCH v2 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Date: Fri, 22 Aug 2025 17:18:18 +0530
Message-ID: <000001dc135a$aa6b10c0$ff413240$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKGrjAaAh8NcQIA49H5zwGbeAXBtNq/wGA=
Content-Language: en-in
X-CMS-MailID: 20250822114824epcas5p2aa289a9a1e75e075c3ccc31f4f2ccb12
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f@epcas5p4.samsung.com>
	<20250821123310.94089-9-ravi.patel@samsung.com>
	<3a936b3b-0599-4b0a-83a8-52b899c24125@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_044837_102034_A88577AC 
X-CRM114-Status: GOOD (  13.24  )
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
> Sent: 22 August 2025 12:09
> To: Ravi Patel <ravi.patel@samsung.com>; jesper.nilsson@axis.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; linus.walleij@linaro.org; tomasz.figa@gmail.com; catalin.marinas@arm.com; will@kernel.org;
> arnd@arndb.de
> Cc: ksk4725@coasia.com; kenkim@coasia.com; pjsin865@coasia.com; gwk1013@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; smn1196@coasia.com; pankaj.dubey@samsung.com; shradha.t@samsung.com;
> inbaraj.e@samsung.com; swathi.ks@samsung.com; hrishikesh.d@samsung.com; dj76.yang@samsung.com;
> hypmean.kim@samsung.com; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-arm-kernel@axis.com; linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> gpio@vger.kernel.org; soc@lists.linux.dev
> Subject: Re: [PATCH v2 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
> 
> On 21/08/2025 14:32, Ravi Patel wrote:
> > From: SungMin Park <smn1196@coasia.com>
> >
> > Add initial device tree support for Axis ARTPEC-8 SoC.
> >
> > This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.
> >
> > Signed-off-by: SungMin Park <smn1196@coasia.com>
> > Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ...
> 
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> 
> No CPU mask?

Thanks for review and pointing out.

Yes. You are right.
I will add GIC_CPU_MASK_SIMPLE(4) in next version as this uses GICv2 (gic-400) not GICv3.

This may be carried out from other exynos/fsd platforms

I found below 2 related links.
https://lkml.org/lkml/2025/6/13/1073
https://lkml.org/lkml/2023/11/28/403

Thanks,
Ravi

> 
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +};
> 
> 
> Best regards,
> Krzysztof


