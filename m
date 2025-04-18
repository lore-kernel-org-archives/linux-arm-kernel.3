Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE44BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=6h9dI2xNKAVU9ayEQC7yd3NFHx4xgdVSrC1Zk4zAmFg=; b=RUlLxEODqeKSuQhqbgHCehJsTU
	XA3kvhHsA3JETXupbnM5bDK91xXXXMUEyjJB1a6SEl8E4cVeRuOzxzQQVmkEmFeoFe+8oi1ZqSTDt
	seYI31YcbalguzIz+7L+WHmVhnU2JfZHXJvjetghaGnBNEHkMDbGDM6SPrtCCS224ompuE+0jm48U
	mIrx3rsvVhoDouIrSPi9K5ummeVHoWLKDc5samx8f6oKDqFfzrUXYfUwzZIARokTjsbLzIEyRLlfn
	HQWxIr/vSj4KXW7F3+Jf5iRjLAw7rBBkQ/oNMkHlsrJHxT75d3YUARllX7Bwgvtm9q3XNm7DmbSEi
	wUsisMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fJa-0000000FHcP-1Ooa;
	Fri, 18 Apr 2025 06:35:06 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5f0W-0000000FEjR-1xWk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:15:27 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250418061516epoutp01ce3c85b537ad53c2b5e43c5e0494baa4~3VRIHPDd01280312803epoutp01d
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250418061516epoutp01ce3c85b537ad53c2b5e43c5e0494baa4~3VRIHPDd01280312803epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744956916;
	bh=6h9dI2xNKAVU9ayEQC7yd3NFHx4xgdVSrC1Zk4zAmFg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QJpKZIpdnK6QpLYEQk6gjaoSef91WeIMFr8pbmk+zGtt6Yy+gu8BzPq5Go5C8gIaP
	 oY/CQSSbYEWz4J6QYbcCHekZtlpnB16YRNbrSSJHxx5ldOUZ3Quv86chZE+157bTG8
	 b0QRmmrzPNUzcrQoqVLtPQJSM83XxvZnzTpfVghM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250418061516epcas2p1d60aa5bd2deed796faf38616d4214444~3VRHq7bpu0446704467epcas2p1V;
	Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zf4Hl54Cwz3hhTJ; Fri, 18 Apr
	2025 06:15:15 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a~3VRGwpX213220332203epcas2p1x;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250418061515epsmtrp19a4ca320f19c2c8a6c64dd74d5ca5541~3VRGv4R8r2614626146epsmtrp13;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-28-6801edf2e90e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E1.69.19478.2FDE1086; Fri, 18 Apr 2025 15:15:14 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061514epsmtip185f7e329d7b91ba951f2374a4c1c8ded~3VRGcJJv_0412804128epsmtip1T;
	Fri, 18 Apr 2025 06:15:14 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] add CPUCL0 clock support for exynosauto v920 SoC
Date: Fri, 18 Apr 2025 15:14:57 +0900
Message-ID: <20250418061500.1629200-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSnO6nt4wZBuu/WVg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8Xk42tZLZqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoEro2/yVJaC/SwVC/Z1sjUwnmfuYuTkkBAwkVh/6TJLFyMXh5DAdkaJw7uPMEEkJCQOz5jA
	CGELS9xvOcIKUfSeUeLt0w6gDg4ONgFViU2/5UHiIgJvmSSW/z8A1swscJpRYucZGRBbWMBV
	4un+p2wgNgtQ/eTn81hAbF4Ba4kTW5sZQeZICMhL9HdIQIQFJU7OfMICMUZeonnrbOYJjHyz
	kKRmIUktYGRaxSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREc6FpBOxiXrf+rd4iRiYPxEKME
	B7OSCO8583/pQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KLYLJMHJxS
	DUyluzp/fHzxM71ZaeaxidtWRwZ953J9oy7Zqa0hOM3WUSyZXXunW/c9r1m751t5Gam3tBd7
	qs9akfV64eppyefKd9SEhqd0pFnXzbFvZRDJ4n9buiXKxuvtr/S3N/rYrs2eWGLS3tu88sGt
	3QeFy79abJkm1HLF/bKicdGxjVvfHwvU7Pr1aue0oxPWnWq2lZKte5gvzDn9EnPJDFaRkPmf
	sv7pVEtp6jxcunbGA3ezx88kqh/d4lL7evS5wd5qD9Yth4ptp76o5/uuIFcv5y0iPudmwIyq
	abu9NbfN2X5/Gr/n7/wvUyXqLieHOP1/+aH08NklV2ubnhQ01q8Rcdm6f6pqYbTGYvdLTHNk
	ldWUWIozEg21mIuKEwEo/UOd4wIAAA==
X-CMS-MailID: 20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a
References: <CGME20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_231525_249294_3A49D1E8 
X-CRM114-Status: GOOD (  14.72  )
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

This patchset adds the CMU_CPUCL0 block to support exynosauto v920 SoC

Shin Son (3):
  dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
  clk: samsung: exynosautov920: add cpucl0 clock support
  arm64: dts: exynosautov920: add cpucl0 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  25 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  15 ++
 drivers/clk/samsung/clk-exynosautov920.c      | 129 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  19 +++
 4 files changed, 188 insertions(+)

-- 
2.49.0


