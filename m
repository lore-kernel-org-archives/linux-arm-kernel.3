Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07128CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EZz/ZSexN7h2df50VcWK12q3iXM1vJoQrK6dhmIGE8=; b=bi+lPEdjCqcZpsTz9//Nq+vj2A
	ZnC1+e5GHQsbts2PviQffJdDfSzRuRTfr99lBJ8hBbRggRcRd1BoOfQc8utQsir9KCdeUJqOmSW5J
	Ykqu38cufc9r4Xc93id3ePq0m8qYPQhhzhPKLVJWd5r1EMjt1Yu9OP7zpNzXw5OIR1s/2fYM+evY3
	ZMeoy+yX8GQ+O99Wr+V/biYK5asiITpsC768VPETb4qsVEhW8o5q9VvlROXvLWSGVPPIWmnLEa0sj
	obE2SDdSpVsKmiyUghdlS5Gi5iWP/BN8AhFLWxwH9Ej2qgkaI0Ai/1JljGMvV/HBWJBOpv81t83eV
	+Cz+uQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvsW-0000000B7Ek-1NqZ;
	Mon, 01 Sep 2025 04:10:48 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvQR-0000000B3jb-2gNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 03:41:50 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250901034142epoutp029d8826860ea930aede61413f640f369b~hC53p9Nr03122331223epoutp02G
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 03:41:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250901034142epoutp029d8826860ea930aede61413f640f369b~hC53p9Nr03122331223epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756698102;
	bh=2EZz/ZSexN7h2df50VcWK12q3iXM1vJoQrK6dhmIGE8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lRghJs6WiItv3rLjqm+pzd30UDC510OACcd4G9b54EPLEvJjBtDVl1wjZP1FgxHFZ
	 5sfwIdjmx5M4o2AZD5opByFkST+fjM9o1DUAFANbXSyFuAFqtLQad2xrcu+gvxrEmI
	 uEMZRud998UV8PjWn94gKKRUNaZDRTi6Imaajgvg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901034141epcas5p1a451644c752ee167db2534393cd4b54a~hC52zjwJa2089620896epcas5p1q;
	Mon,  1 Sep 2025 03:41:41 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cFZRm46C0z2SSKX; Mon,  1 Sep
	2025 03:41:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250901034139epcas5p41f782871e58b5f6399fb3742f8b2e662~hC51ORnB22310123101epcas5p4j;
	Mon,  1 Sep 2025 03:41:39 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901034135epsmtip2835c6e93404b742e12a1de642383dbc3~hC5w2B8yt3100231002epsmtip2n;
	Mon,  1 Sep 2025 03:41:35 +0000 (GMT)
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
In-Reply-To: <b8085dd8-e1a0-48b1-a49f-f3edaa0381da@kernel.org>
Subject: RE: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for ARTPEC-8 SoC
Date: Mon, 1 Sep 2025 09:11:34 +0530
Message-ID: <000201dc1af2$537b4e70$fa71eb50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHHo9j0Rv1rvZf0N1R8AXn4x9PYUAMDo+/eAkhMLtUCILeh+rRrNiow
Content-Language: en-in
X-CMS-MailID: 20250901034139epcas5p41f782871e58b5f6399fb3742f8b2e662
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64@epcas5p3.samsung.com>
	<20250825114436.46882-5-ravi.patel@samsung.com>
	<b8085dd8-e1a0-48b1-a49f-f3edaa0381da@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_204148_336701_CABB5057 
X-CRM114-Status: GOOD (  15.59  )
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
> Sent: 31 August 2025 18:55
> To: Ravi Patel <ravi.patel@samsung.com>; jesper.nilsson@axis.com; mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org; tomasz.figa@gmail.com; catalin.marinas@arm.com; will@kernel.org; arnd@arndb.de
> Cc: ksk4725@coasia.com; kenkim@coasia.com; pjsin865@coasia.com; gwk1013@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; smn1196@coasia.com; pankaj.dubey@samsung.com; shradha.t@samsung.com; inbaraj.e@samsung.com;
> swathi.ks@samsung.com; hrishikesh.d@samsung.com; dj76.yang@samsung.com; hypmean.kim@samsung.com; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-arm-kernel@axis.com; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; soc@lists.linux.dev
> Subject: Re: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
> 
> On 25/08/2025 13:44, Ravi Patel wrote:
> > From: SeonGu Kang <ksk4725@coasia.com>
> >
> > Document the compatible string for ARTPEC-8 SoC pinctrl block,
> > which is similar to other Samsung SoC pinctrl blocks.
> >
> > Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> 
> 
> No wakeup-eint interrupts here? samsung,pinctrl-wakeup-interrupt.yaml?

I don't see any use case for external wake-up interrupt here (as of now).
So wakeup-eint entry is not present in dts and yaml both.

Thanks,
Ravi

> 
> 
> Best regards,
> Krzysztof


