Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054FBC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=RZMbreJckeTZ7d9E/bDbGIS9B9tPEE2bV8tHwU4GBm0=; b=mA9p8OfGTrmgjEzPXFZ+zZJs5A
	HACiSz9WdRasPuhaU47+iw7/91uWOaeF8JkEEHAQIXouGVxucK/Jf6S5jAK0aYVq5h2mwH/HS8gU6
	nCPnkoUpkBVV7NK1Jj5q5Y79NQ7ukEjy4ezFkwJRhxqvsnbhF3KTKCUbvlEIx2z6Xr2SZst/oB228
	axK88pi7LUzOYBkDUp+eMceYDRg10RD9SrcMMGW5B0A6OzSDspoxLwEHHqc8w/jI+tRlpZN/EBFSq
	6c8xtz/+z2Gc/nj7g47t4ch9jtGTBL5teoUevNF7zfRhgxaZNliBE9iQlw7J+gEF5wTLg/rhE0fHG
	J8t5sMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5qL-000000056mH-3Lcf;
	Tue, 08 Jul 2025 10:46:34 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5kq-000000055Vn-1Jp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:40:56 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250708104042epoutp04389a52868364fe29f47a4b77623e1ee1~QQJAo6AvJ0483604836epoutp04g
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 10:40:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250708104042epoutp04389a52868364fe29f47a4b77623e1ee1~QQJAo6AvJ0483604836epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751971242;
	bh=RZMbreJckeTZ7d9E/bDbGIS9B9tPEE2bV8tHwU4GBm0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=lSDiomVBj4GnNPeXfeYibj60lmndwuChHPiuLM1NZVUbLtJRALwLqvL/Q7DV/UAIF
	 htKacRm9FWxAeWhpH+a+AbTui+5UFJCk4ZCzM7zg3qhxRqbhZNGEH2nsQFJt4/Z5zN
	 M+X8xkqVt4roF4fhXipjRvdSbXuKkU0vDoyxH+tY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250708104042epcas5p33bd592360cafe5d32801a3b6f3a0732c~QQJAFd4LA0190201902epcas5p3s;
	Tue,  8 Jul 2025 10:40:42 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bbyLd0vbqz6B9m7; Tue,  8 Jul
	2025 10:40:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250708103228epcas5p27886821d1ff225f2e5cdd4d948d03a66~QQBzzm5CC0702607026epcas5p29;
	Tue,  8 Jul 2025 10:32:28 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250708103225epsmtip179cdbb1505bb6b730e052501f82e992d~QQBxLrGTX2131221312epsmtip1V;
	Tue,  8 Jul 2025 10:32:25 +0000 (GMT)
From: Vivek Yadav <vivek.2311@samsung.com>
To: pankaj.dubey@samsung.com, ravi.patel@samsung.com, shradha.t@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	mark.rutland@arm.com, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, linux-fsd@tesla.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Vivek
	Yadav <vivek.2311@samsung.com>
Subject: [PATCH 0/6] Add PPMU support for Tesla FSD 
Date: Tue,  8 Jul 2025 16:02:02 +0530
Message-ID: <20250708103208.79444-1-vivek.2311@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708103228epcas5p27886821d1ff225f2e5cdd4d948d03a66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250708103228epcas5p27886821d1ff225f2e5cdd4d948d03a66
References: <CGME20250708103228epcas5p27886821d1ff225f2e5cdd4d948d03a66@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034053_803012_5EDAB061 
X-CRM114-Status: GOOD (  16.52  )
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

The Platform Performance Measuring Unit (PPMU) is an AMBA-compliant
performance measurement tool designed to provide observability into
system-level operations. It provides performance statistics such as
as bandwidth, read and write request, transactions count for AXI masters.

FSD platform has two instances of PPMU IP in MFC. This patch series
contains PPMU clock binding definitions, device tree binding
documentation, PPMU24 driver support which configures the
PPMU24 hardware and the PPMU device tree node support
for Tesla FSD platform.

Vivek Yadav (6):
  dt-bindings: clock: Add PPMU clock definitions for FSD platform
  clk: samsung: fsd: Use clock IDs for PPMU MFC block
  dt-bindings: perf: Add devicetree binding for custom PPMU
  drivers: perf: samsung: Add PPMU driver support
  arm64: dts: fsd: Add PPMU support for MFC block of FSD SoC
  MAINTAINERS: Add maintainers for Samsung PPMU driver

 .../bindings/perf/samsung,ppmu-v2.yaml        |  62 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |   8 +
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  20 +
 drivers/clk/samsung/clk-fsd.c                 |  10 +-
 drivers/perf/Kconfig                          |   2 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/samsung/Kconfig                  |  13 +
 drivers/perf/samsung/Makefile                 |   2 +
 drivers/perf/samsung/ppmu.c                   | 494 ++++++++++++++++++
 drivers/perf/samsung/ppmu_platform.c          | 338 ++++++++++++
 drivers/perf/samsung/samsung_ppmu.h           | 128 +++++
 include/dt-bindings/clock/fsd-clk.h           |   4 +
 13 files changed, 1084 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/samsung,ppmu-v2.yaml
 create mode 100644 drivers/perf/samsung/Kconfig
 create mode 100644 drivers/perf/samsung/Makefile
 create mode 100644 drivers/perf/samsung/ppmu.c
 create mode 100644 drivers/perf/samsung/ppmu_platform.c
 create mode 100644 drivers/perf/samsung/samsung_ppmu.h

-- 
2.49.0


