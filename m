Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBB6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=AiB02Wdm7NldivtJgubd8uEDhXBzGC4t5y0JFft5kUU=; b=N+QXzE/T5PKpic1Nhvu6HDUqkz
	DdcA7XCr8Q5PGRECjkghAnYK00w7z+ysliR1y6bcBJP4/nZlUviY5RZ6nkNcUreS8hB83MQ0RzwUA
	VeBlAwxluMc/RyMoZlwC5plTes8FVe5S8u/sPPkn7G2mUfKts1nl0Xvlm8LGCzkd0C1F1gBrssENX
	RZo40o1agfQVOnnjqRjkwemKgycXebOnteW5l7yb7GnR5CSGKAkjrHtQgKzHuhVQt68CRPYCfSn91
	9AELxko1QbdcrbvWuX8NC37gmqJIqfogZ38qMejTetnUyFK3gq+qm/WZR3nGq2Av8Vsjhf2x9hUrK
	7PbmtZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMe-000000058EH-3QLr;
	Tue, 28 Jul 2026 11:52:52 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMb-000000058Ds-02pZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:52:51 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260728115242epoutp040c45823d97c8c33afe333f9d65e689ad~GcexX7LZm3133131331epoutp04M
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:52:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260728115242epoutp040c45823d97c8c33afe333f9d65e689ad~GcexX7LZm3133131331epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239562;
	bh=AiB02Wdm7NldivtJgubd8uEDhXBzGC4t5y0JFft5kUU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XNDvM/RfP7Jj4vhmLtoZb18UG53e4w9FlShD4p+tK0XJlvLh/i8Xa+vqDqSxDQc+g
	 ZldKBTNh4/IPp/xhrxRN0A8j8A5TX6ywkJeY3Sn90kIB7INpQv5AWGS8OijYRhipyC
	 hELNawz6iovzFV8DX4hGNrUJ4igN3ktyfoDJYEnA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260728115240epcas5p282c38caaf67285a4e6a2cdf52242f1f3~GcewPjYsV3209432094epcas5p23;
	Tue, 28 Jul 2026 11:52:40 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Yk01w5Tz2SSKY; Tue, 28 Jul
	2026 11:52:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115239epcas5p218bc69194dc55a5087c363816396cd5e~Gceu_Inmk3209432094epcas5p20;
	Tue, 28 Jul 2026 11:52:39 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115236epsmtip195fdddd41628afae8490b5e6330f51bb~GcesbVrYI2235622356epsmtip1a;
	Tue, 28 Jul 2026 11:52:36 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 00/13] Add clock support for Exynos8855 SoC
Date: Tue, 28 Jul 2026 17:40:58 +0530
Message-Id: <20260728121111.2077860-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115239epcas5p218bc69194dc55a5087c363816396cd5e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115239epcas5p218bc69194dc55a5087c363816396cd5e
References: <CGME20260728115239epcas5p218bc69194dc55a5087c363816396cd5e@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045249_391514_53B39245 
X-CRM114-Status: GOOD (  14.06  )
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

This patch series adds clock support for below blocks
found in Exynos8855 SoC

TOP & PERIC
PERIS
HSI
USB

This is the minimal clock support provided for other IPs to
be added. More clocks (MUXs, DIVs, GATEs) will be added
as we add more consumers of the clocks

There are many other blocks, for which the support will be
added in forthcoming patch series.

Alim Akhtar (1):
  clk: samsung: clk-pll: Add supoprt for pll_4313

raghav.s (12):
  dt-bindings: clock: exynos8855: add top & peric clock definitions
  clk: samsung: exynos8855: add block top and peric clock support
  arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
  dt-bindings: clock: exynos8855: add peris clock definitions
  clk: samsung: exynos8855: add block peris clock support
  arm64: dts: exynos8855: add cmu_peris clock DT nodes
  dt-bindings: clock: exynos8855: add hsi clock definitions
  clk: samsung: exynos8855: add block hsi clock support
  arm64: dts: exynos8855: add cmu_hsi clock DT nodes
  dt-bindings: clock: exynos8855: add usb clock definitions
  clk: samsung: exynos8855: add block usb clock support
  arm64: dts: exynos8855: add cmu_usb clock DT nodes

 .../clock/samsung,exynos8855-clock.yaml       | 178 +++++
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |  63 ++
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-exynos8855.c          | 710 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  11 +-
 drivers/clk/samsung/clk-pll.h                 |   1 +
 .../dt-bindings/clock/samsung,exynos8855.h    | 120 +++
 7 files changed, 1083 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
-- 
2.34.1


