Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF4CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2pjATg3JKKJ2idLOP2lpbZQuTVp7H7ONvzjqtbWJc4=; b=TboqkxeAVMW+k6za03DoyUBN9o
	GGIacBjwKFkDnSqrej9h3w68foPxw7n29vEJgHOi48LLh6uk03WUhENnmyTNw9mgM1TKrGnYqsou5
	F7TJILKmyUQVM9/G3PKHGqSc+D4bFNW8sH3p658xL5nrfir7sTYKuowTR7YfqbtmimlPfmlpdPaJL
	CuXJe5mJaGNyWFeGCj6f/aBwiTn+LBuUi4jM6SFXopEP4T2/LWcrejWTo5f5t668agQ1NY8KCZbk3
	Dndj1wz814t/e8SiCCnlzG8x3XDhbt5bHX+WwLa1GOUFuZyM1NlvtgVlVvbO0vuvkq5TUvktX5vJJ
	IFl2AV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjm-00000003w5b-0bbu;
	Sat, 23 Aug 2025 06:28:26 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQHk-00000002OkH-2mET
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 11:50:22 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822115018epoutp024ad4bcb87fc73e6b95138f0cdfced1a1~eFHn7fQJ42763827638epoutp02O
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 11:50:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822115018epoutp024ad4bcb87fc73e6b95138f0cdfced1a1~eFHn7fQJ42763827638epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755863418;
	bh=w2pjATg3JKKJ2idLOP2lpbZQuTVp7H7ONvzjqtbWJc4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=a03O7Z6u1dmM9+lj9QIfAF2b9/LXsS7W5yjHlsRINlcVATBDb8k30freJxRAyQNgW
	 zLwVeBw6RO8jcqU5P0TVBBwt6nhPEOUSTd/Tksqhoa5r3cBfNFdWvfJwhpwSzO+cIp
	 A416ekmKuy22lEuBoJWnbkBrT8c5N1DYe+1l5fxY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822115017epcas5p371083af5a6c2202a80fbdfca7b60f2db~eFHmn9RLY2494424944epcas5p3a;
	Fri, 22 Aug 2025 11:50:17 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c7dm83LXgz6B9mC; Fri, 22 Aug
	2025 11:50:16 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250822115015epcas5p40c0dad62af3fe03fa959d801a92ab15c~eFHlJzcqY2572625726epcas5p4W;
	Fri, 22 Aug 2025 11:50:15 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822115010epsmtip11f59577f929b28e42a40e14193d643aa~eFHgclH-C2666626666epsmtip1h;
	Fri, 22 Aug 2025 11:50:10 +0000 (GMT)
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
In-Reply-To: <1096f050-f617-4e86-8948-1fc8c3936b04@kernel.org>
Subject: RE: [PATCH v2 00/10] Add support for the Axis ARTPEC-8 SoC
Date: Fri, 22 Aug 2025 17:20:09 +0530
Message-ID: <000101dc135a$ece160d0$c6a42270$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgLoPtc+AoauMBoBa5GkcbTdGWdQ
Content-Language: en-in
X-CMS-MailID: 20250822115015epcas5p40c0dad62af3fe03fa959d801a92ab15c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<CGME20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa@epcas5p1.samsung.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<1096f050-f617-4e86-8948-1fc8c3936b04@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_045021_030874_D0F0F9AE 
X-CRM114-Status: GOOD (  14.29  )
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
> Sent: 22 August 2025 11:56
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
> Subject: Re: [PATCH v2 00/10] Add support for the Axis ARTPEC-8 SoC
> 
> On 21/08/2025 14:32, Ravi Patel wrote:
> >
> > Link to v1: https://lore.kernel.org/all/20250710002047.1573841-1-ksk4725@coasia.com/
> > NOTE: The first version has been sent by Coasia.
> >       After that, it has been agreed between Coasia and Samsung that Samsung will take
> >       ownership of upstreaming ARTPEC-8 and ARTPEC-9 platforms.
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

Sure, I will remove "--in-reply-to" while sending next version.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof


