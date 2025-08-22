Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089D7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lET1kWbDLqrIbol+G/CIjHWw2OZjsq9g7OfEHWdvLhI=; b=QstaEYb9XIjLHmrw04akppZK5F
	Ii9YA3UWK3Mz4/GYqeyocI8eLvoBCNhoI1x36E+DAMG+/a+zgD+EbSHar1KSCKOIdxF491fvvIvzk
	ZdQXcV9HLefPCfLp4ESxG6iCqysnFpaYD8KCFEjxvkdNOQEPt3Kb5umADJoorpP38ZXqxUenauWxM
	2Lv5AJ2x/t+GvXYZ23xChsL/vA6YxWegyK2QR7TAkWzzPE45Q62HtVJXfl6RXY4bJDrkxoxF19dbm
	vezZfyCGcXJftuPn4WobQTN1GNAN0YFkeyvnWBH9iCOqBhAPvybMPS7s/MZwWBjGJ5eVeQWadnm1V
	DgRWd28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphk0-00000003wHf-0X5Y;
	Sat, 23 Aug 2025 06:28:40 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQZq-00000002QoL-2cUF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:09:06 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250822120856epoutp03b8038151e30a48a693e2720407512748~eFX4XpY992049320493epoutp03P
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 12:08:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250822120856epoutp03b8038151e30a48a693e2720407512748~eFX4XpY992049320493epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755864536;
	bh=lET1kWbDLqrIbol+G/CIjHWw2OZjsq9g7OfEHWdvLhI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=WolNusklP2tPVeQsUUFTpoi76gsovm194InhNOSHq7mcJKNAWfjDLXOI/ZsAGcYVx
	 FMiMVYEDvjWIBDc3I9lvLlQ6817/HP1S6GCI6+jAncykr9Tp110dKjjfk5pGP/k7dk
	 G22xA6VX6fFjKHMwEuh0mG4d5NRCJcB2N1L+nvMA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822120855epcas5p396d2099360b9ba11aa5a33fc9502af6a~eFX3h5JrT2585025850epcas5p3L;
	Fri, 22 Aug 2025 12:08:55 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7f9f16r4z2SSKb; Fri, 22 Aug
	2025 12:08:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822120853epcas5p15497652f90d08bf64646bac341be80e8~eFX1qy8Mg2210422104epcas5p1D;
	Fri, 22 Aug 2025 12:08:53 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822120848epsmtip184aef53aafea6c576ae0dbebc5b6f376~eFXxPWsKW0871608716epsmtip1j;
	Fri, 22 Aug 2025 12:08:48 +0000 (GMT)
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
In-Reply-To: <ceb20624-7405-40c5-9c29-1a7339e0cca4@kernel.org>
Subject: RE: [PATCH v2 02/10] clk: samsung: Add clock PLL support for
 ARTPEC-8 SoC
Date: Fri, 22 Aug 2025 17:38:47 +0530
Message-ID: <000301dc135d$86ed30d0$94c79270$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKGrjAaAcRz3scCHvrcAQFBK/RJtNaTkzA=
Content-Language: en-in
X-CMS-MailID: 20250822120853epcas5p15497652f90d08bf64646bac341be80e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124024epcas5p349dda3c9e0523cc07acf2889476beeb1@epcas5p3.samsung.com>
	<20250821123310.94089-3-ravi.patel@samsung.com>
	<ceb20624-7405-40c5-9c29-1a7339e0cca4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_050904_926919_99A32837 
X-CRM114-Status: GOOD (  14.69  )
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
> Sent: 22 August 2025 12:02
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
> Subject: Re: [PATCH v2 02/10] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
> 
> On 21/08/2025 14:32, Ravi Patel wrote:
> > +
> > +static const struct clk_ops samsung_pll1031x_clk_ops = {
> > +	.recalc_rate = samsung_pll1031x_recalc_rate,
> > +	.round_rate = samsung_pll_round_rate,
> 
> 
> This will conflict with round_rate drop, so might need rebasing. Please
> follow up discussion or decisions in the round rate patchset.

Thanks for review. Yes, I can see conflicts with below patch 
https://lore.kernel.org/linux-samsung-soc/20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com/

Since merging strategy of round_rate patches are not clear as of now, will wait for couple of days before posting v3.
Request to review other patches also.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof


