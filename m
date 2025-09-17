Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCBFCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=I363QpdwZwlQ876BU+P+93B+lnskOUgFb5tXAEx5RNw=; b=izRhKfVwEjwfUvGlDDBoDynlpC
	YwQwCybGI3roqnVNxax8CgTwktSsjh6BE/ffjvE7mxTsrQJnGCyZj2gJWVelnkH8OiX1HYj6ca7KH
	wnXQuvWA3hu4hSGF9uhmwkde0BsPukVRZNp317li0R5SqT43Y75uSUFvdrItVcLz6uhPwL6406hPX
	493eI1AG/H29HzpP3wNKDPMrr1cEn92bOTiaep1tZQS8BIT7bJjjUvDBGIkE095Drfi8IjJmpW5fT
	r2JWSncKk6aRn2heDRNSSu8p6F2EEBBXhwSVoxUO1vW/Upj9tc8X5QT5nWYRpiVs9M1fZ+6iEGQ8B
	v7DoRmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynrz-0000000Ah7u-2PTL;
	Wed, 17 Sep 2025 08:50:31 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynrv-0000000Ah7L-3Y2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:50:30 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250917085022epoutp020da4ccb8812f3e8e5afde37ccc828557~mBb7yhMkP1717817178epoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:50:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250917085022epoutp020da4ccb8812f3e8e5afde37ccc828557~mBb7yhMkP1717817178epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099022;
	bh=I363QpdwZwlQ876BU+P+93B+lnskOUgFb5tXAEx5RNw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=sEGcmwfA6jVfUJOfPtZxEVLoszekoks9GAE8GmYi3SK6Hh87aypt4EEtC0/poJ+UX
	 RjLqpbSK4iQ2DJVSU62eYwvJti3rvHn7qOQLA8DGixIMahLSVI9QU6xiYk8SvyKeXv
	 +OPULuymE4H2VngVk9z001PIWnKXLTpmE11KG9yw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917085021epcas5p3d9f0d62fc1b2f731987f9f536db532e2~mBb7ApQ6k1728417284epcas5p3m;
	Wed, 17 Sep 2025 08:50:21 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cRXXX23DGz2SSKZ; Wed, 17 Sep
	2025 08:50:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085019epcas5p273ef86028a90e78ada55cde48a28a949~mBb5Yf87f0421204212epcas5p2C;
	Wed, 17 Sep 2025 08:50:19 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085014epsmtip207bf6dd995b78fd7dac7ff0a0048bffd~mBb0pofzE2764627646epsmtip2M;
	Wed, 17 Sep 2025 08:50:14 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH 0/7] Add support for the Axis ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 14:19:57 +0530
Message-ID: <20250917085005.89819-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085019epcas5p273ef86028a90e78ada55cde48a28a949
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085019epcas5p273ef86028a90e78ada55cde48a28a949
References: <CGME20250917085019epcas5p273ef86028a90e78ada55cde48a28a949@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_015029_332026_2CA8CC15 
X-CRM114-Status: GOOD (  14.75  )
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

Add basic support for the Axis ARTPEC-9 SoC which contains
6-core Cortex-A55 CPU and other several IPs. This SoC is an
Axis-designed chipset used in surveillance camera products.

This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

This patch series includes below changes:
- CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
- PMU bindings (patch #4)
- Basic Device Tree for ARTPEC-9 SoC and boards (patch #5 to #7)

The patch series has been tested on the ARTPEC-9 EVB with
Linux Samsung SoC tree (for-next branch) and intended
to be merged via the `arm-soc` tree.

NOTE: This patch series is dependent on following floating patches:
1. https://lore.kernel.org/all/20250917070004.87872-1-ravi.patel@samsung.com/T/#t
2. https://lore.kernel.org/all/20250917071342.5637-1-ravi.patel@samsung.com/T/#u
3. https://lore.kernel.org/all/20250917071311.1404-1-ravi.patel@samsung.com/T/#u

GyoungBo Min (3):
  dt-bindings: clock: Add ARTPEC-9 clock controller
  clk: samsung: Add clock PLL support for ARTPEC-9 SoC
  clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC

Ravi Patel (2):
  dt-bindings: arm: axis: Add ARTPEC-9 alfred board
  arm64: dts: axis: Add ARTPEC-9 Alfred board support

SungMin Park (2):
  dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC
  arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support

 .../devicetree/bindings/arm/axis.yaml         |    6 +
 .../bindings/clock/axis,artpec9-clock.yaml    |  232 ++++
 .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
 arch/arm64/boot/dts/exynos/axis/Makefile      |    3 +-
 .../boot/dts/exynos/axis/artpec9-alfred.dts   |   36 +
 .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi |  115 ++
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  |  277 ++++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-artpec9.c             | 1224 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  184 ++-
 drivers/clk/samsung/clk-pll.h                 |   17 +
 include/dt-bindings/clock/axis,artpec9-clk.h  |  195 +++
 12 files changed, 2282 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
 create mode 100644 drivers/clk/samsung/clk-artpec9.c
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h

--
2.17.1


