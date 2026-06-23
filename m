Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02253CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ4TskOON2YvURQFFWmRY4P5Y9n+8Cd9tCS6xs+1hiA=; b=yDeV+H0DOt35ocpcdkW6jUYrOt
	TKmxI481pHxBiEnHovehtacg7+GCZAnltUKoUjZloId8TgM+cTQ/bSElzgeUZoWdCh3+8QYvEsitB
	rWxshHgHi6PQGlejWlPaSsgyr/5JjkZQ6lWsTUW1P59n14sE3IzL7WhOmc4ODkglryY+cDP3oAlga
	/UPWXqhkr/OUiE1+Fe7lmWNrbAWkDrw87gKx73VHm85Z7v0yHHJbrW4g15BPD2OrngNKgkEUMK172
	CUy+EScpn62HV0i3PFePABS7ACDYnBRd3jYMaT5R9qXLkrxaG6B7rJnJz/vdo5WMJxd8SbwohKDbt
	4vJm6bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwMf-00000005uSD-15c3;
	Tue, 23 Jun 2026 08:20:13 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwMb-00000005uQt-114f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:20:11 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260623082003epoutp01109822063d3dc21b3d610c442416330e~7qAHH6nFU0048900489epoutp01M
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:20:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260623082003epoutp01109822063d3dc21b3d610c442416330e~7qAHH6nFU0048900489epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782202803;
	bh=dZ4TskOON2YvURQFFWmRY4P5Y9n+8Cd9tCS6xs+1hiA=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=Ta09KgprExBRin2bxzqP9FI1SMCkP693d3x8isKsKLVoiUIFml0FLxgUiA63VVrZl
	 rEmtY8m4Xh8YWVcy7SHWRKD7EhTWdDjQRk9X1vUIlC4LO9w4Hi1bl9Yle/xjH/O24f
	 8/TFamVAMvAzBR0YFs9cF97zi46BzrhiGMcGzqMU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260623082002epcas5p2fe50239167a06f3f585cddc884be7fa9~7qAGuN5CW3001130011epcas5p2C;
	Tue, 23 Jun 2026 08:20:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gkyfp4tcFz6B9m5; Tue, 23 Jun
	2026 08:20:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260623060044epcas5p17e4090ee1c1c62fe06e58db8d88a97f1~7oGe2XMKK2254522545epcas5p1J;
	Tue, 23 Jun 2026 06:00:44 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260623060041epsmtip1414f32065dfa22c1ef1804df9ea3cc7f~7oGbkWuZY1819318193epsmtip1B;
	Tue, 23 Jun 2026 06:00:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>, "'Bjorn
 Andersson'" <andersson@kernel.org>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Brian
 Masney'" <bmasney@redhat.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Peter	Griffin'"
	<peter.griffin@linaro.org>, "'Barnabas Czeman'"
	<barnabas.czeman@mainlining.org>, "'Tomasz Figa'" <tomasz.figa@gmail.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<cpgs@samsung.com>
In-Reply-To: <20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 11:30:39 +0530
Message-ID: <1212772528.01782202802678.JavaMail.epsvc@epcpadp1new>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLjF+4RorsKFMyV2SdeBPjDChM9owMQIOWktCb6JMA=
Content-Language: en-us
X-CMS-MailID: 20260623060044epcas5p17e4090ee1c1c62fe06e58db8d88a97f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260623055640epcas5p35fd0bc8b355d23ca802ceba85046b836
References: <CGME20260623055640epcas5p35fd0bc8b355d23ca802ceba85046b836@epcas5p3.samsung.com>
	<20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_012010_004476_04570B25 
X-CRM114-Status: GOOD (  12.33  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Tuesday, June 23, 2026 11:26 AM
> To: Bjorn Andersson <andersson@kernel.org>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>;
> Chanwoo Choi <cw00.choi@samsung.com>; Peter Griffin
> <peter.griffin@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Barnabas Czeman <barnabas.czeman@mainlining.org>; Tomasz Figa
> <tomasz.figa@gmail.com>; linux-arm-msm@vger.kernel.org; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH] dt-bindings: clock: Replace bouncing emails
> 
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Sireesh Kodali and Chanho Park.  There are
no
> new messages from them via other email addresses, so drop them
> permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC clocks,
> because he looks at other Samsung clock hardware and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> 
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>



