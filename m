Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C00FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xohElGlOL2qwuc7CaXtsWhYSzs957c36W9/xGMuImuk=; b=y/PoLZctNp2mgff5dV2mskrOFF
	LXscbB++F+z1jU45j7xVXvTNN67ASi1uPX3QIt+IvEkp5eSPVAIV/ddL14n0/4R2flSO8ls+mJh6W
	vKZuvGnj71leDpx+Q7xTU4LqBhV15UOF902Lj+FvwJINjnhRSgpPmF5u2mk51li9gwyeXTASxo4N3
	SQFoVAyS7x926X+RsHpZnzfPfhzYleQ8CtHM6fKq4W3MPkaxvPG/3Kl7cRWfKNqstIX+KuHjgRUNw
	sO1xWJ91qB0F5YcOywfzJOkhngKxwVOEAsHjR3xsoY5GI/WaafGyR1pWh/BkvltWXOQwqlncaHl5w
	75D3915g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWz-0000000GnW7-3xo9;
	Thu, 18 Sep 2025 09:02:21 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWw-0000000GnSb-3a6G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:02:21 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250918090214epoutp03e52522ecb4c6625179054b596e887d43~mVPlf4Eqx2200222002epoutp03z
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 09:02:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250918090214epoutp03e52522ecb4c6625179054b596e887d43~mVPlf4Eqx2200222002epoutp03z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758186134;
	bh=xohElGlOL2qwuc7CaXtsWhYSzs957c36W9/xGMuImuk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Tke3dUodbTkau937Ut/TVOrn/aNDPd2vymNswh+GMDtCRYjpedMriimw/19fSwSYl
	 wwNtG0nmJ2Kh1n213M6brzVDxjNZnNIktmmkeTmyaZ8mEEWlwDUiMD3RV8qkNvaovC
	 mYTstNC50VWVjjKuDglzFK/mupZRxUzrefG0A4Hs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918090214epcas5p4d1ca88ffc44bb86f416cc7356a33e7ec~mVPlAaEad0371503715epcas5p4Z;
	Thu, 18 Sep 2025 09:02:14 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cS8ln0298z3hhTD; Thu, 18 Sep
	2025 09:02:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918090212epcas5p1fae66bbfa75ebed68841f83a10714c54~mVPjcjgHK3151831518epcas5p1m;
	Thu, 18 Sep 2025 09:02:12 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918090209epsmtip29e21b8aa35276b5789667d683987389a~mVPg-y8no2788427884epsmtip2w;
	Thu, 18 Sep 2025 09:02:09 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20250915095401.3699849-4-raghav.s@samsung.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Date: Thu, 18 Sep 2025 14:32:08 +0530
Message-ID: <087c01dc287a$ebd50680$c37f1380$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIDMWX7dzjI2+lsAsCe3lTeFtXiqgFAK0RPAkIX1i20Ln7xwA==
Content-Language: en-us
X-CMS-MailID: 20250918090212epcas5p1fae66bbfa75ebed68841f83a10714c54
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>
	<20250915095401.3699849-4-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_020219_552959_D3335944 
X-CRM114-Status: GOOD (  10.18  )
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

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Monday, September 15, 2025 3:24 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com; dev.tailor@samsung.com;
> karthik.sun@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
> nodes
> 
> Add required dt node for CMU_M2M block, which provides clocks for M2M IP
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


