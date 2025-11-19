Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B15ECF34A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=bLpW5qbNlOAyZrV0HryRmDY/8NDIwEwROLHp5IJHhaE=; b=j7g/oAuDYNynkS
	g+RmxquneVpsfRnwd0aoBvmaJUWmDAA8anZqhgl8YrCR9BD4jzFyvYpLLv7eEwB4v9H5gP+5kMzks
	2sw/RziVnWHDnjYyKaR3wjzwbqZuL9ptrv8YJvVeUN0VilxIIzS5/tiYJEj6sZ0qgONbq7uX52Mdc
	eMWz/Oz5d1b5c+C3sWtJkTX1KklrUSZs4pUTUcJqSvbaOCK78zDu0ITcV+mYUUgo2KC+uiy9YC8CE
	VDJUP9jS8mAA5/JjVglmLWdSRF8yRgWVGY/ugVSxeVhhnneJOALgOfsU1i2MrIJQ5e/cXouRqVbfU
	hZN2G4jEw2uxQl6yNfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi19-00000003GA5-1Nga;
	Wed, 19 Nov 2025 13:14:39 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi13-00000003G8l-1v44
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:14:37 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251119131426epoutp02dbb697a159d72c0d97cf191d92540abf~5arfG6Dua2799627996epoutp020
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 13:14:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251119131426epoutp02dbb697a159d72c0d97cf191d92540abf~5arfG6Dua2799627996epoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558066;
	bh=bLpW5qbNlOAyZrV0HryRmDY/8NDIwEwROLHp5IJHhaE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=oNAVTcsYVm1+GLAH/ozHljvXSy/hwLhQgbSI9c5DkKPOHB7r3Vz7T7vYblzwgnegT
	 1c/qlQTu/mLwuJAblmwJJ6cAqHBTRMaTXW710vQg3FmbzNZCzvNDrRiGSYHpcLan/m
	 crsTD1XRRuBiatXZFd573Zy7soRxRuXGsPBrAZ5I=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119131425epcas5p33febd27e982d546d4e6db9ec38627dbb~5areYrE9x3149731497epcas5p3a;
	Wed, 19 Nov 2025 13:14:25 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dBMQ86Rbyz2SSKX; Wed, 19 Nov
	2025 13:14:24 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714~5arc--Hu72519125191epcas5p4m;
	Wed, 19 Nov 2025 13:14:24 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131404epsmtip10da0ffddcca29538b5d5500d4b288960~5arKcXT9c2550425504epsmtip1v;
	Wed, 19 Nov 2025 13:14:03 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 0/3] Add basic device tree support for the Axis ARTPEC-9
 SoC
Date: Wed, 19 Nov 2025 18:42:59 +0530
Message-Id: <20251119131302.79088-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_051434_961398_9714D12C 
X-CRM114-Status: GOOD (  16.33  )
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

Add basic device tree support for the Axis ARTPEC-9 SoC
which contains 6-core Cortex-A55 CPU and other several IPs.
This SoC is an Axis-designed chipset used in surveillance camera products.

This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

This patch series includes below changes:
- Bindings document update for ARTPEC-9 board (patch #1)
- Device tree for ARTPEC-9 board (patch #2 and #3)

The patch series has been tested on the ARTPEC-9 EVB with
Linux Samsung SoC tree (for-next branch) and intended
to be merged via the `arm-soc` tree.

Pinctrl and UART DT-bindings are present in another patches which are listed below:
- https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/commit/?id=e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
- https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=85f17e130dc7189acf03eb0f8e2455c4ea2c4f9e

---
Changes in v2:
- Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
  Device tree related patches will be sent in separate series.

Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
---

Ravi Patel (2):
  dt-bindings: arm: axis: Add ARTPEC-9 alfred board
  arm64: dts: axis: Add ARTPEC-9 Alfred board support

SungMin Park (1):
  arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support

 .../devicetree/bindings/arm/axis.yaml         |   6 +
 arch/arm64/boot/dts/exynos/axis/Makefile      |   3 +-
 .../boot/dts/exynos/axis/artpec9-alfred.dts   |  36 +++
 .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi | 115 ++++++++
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  | 277 ++++++++++++++++++
 5 files changed, 436 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi

--
2.17.1


