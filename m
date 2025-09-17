Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6835CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kPGSemQ9IV7iX4r/xX7w47T5QXCmtA3v3bncYnPsGus=; b=PmKEOk6vXfPZin1tqkU8UIBDws
	bRMThF5eNDRB/Og6vHyUqjmWgKFe32lrBEShG/B62v0ySlOZCXwOH22+Ne68FWtSsHFkwjWd5Ompc
	OwK61HFJxvSc1c+I8NM4N0YpFLwibrjYkqX3g1UnOGs/DZeVL9LLHs/wK0yvB54sGKkaN9I1WJHWb
	pvk/hUfblQi847GZenb3n/lBe6p4/XwmPFTYn87SP10Aq3WYmHcv3Kdnrs1GiD8uDBI0k5OyWSwRI
	DujAnj+KgxFzXDzg0fOsSL5l8v8k+UinUskLxLvP1gJ+6V18rDeo6eG6ogirIbAuEKIA30ajZO32e
	gKcgkiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvYK-0000000DOTF-1ZvL;
	Wed, 17 Sep 2025 17:02:44 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvYG-0000000DOPt-25ji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:02:42 +0000
X-CSE-ConnectionGUID: nWiUG+2HTwmdvkbVXtXFOg==
X-CSE-MsgGUID: WtFN+q4pQR6IBM9rkpKZbQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2025 02:02:35 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.45])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0E67F400F755;
	Thu, 18 Sep 2025 02:02:28 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lukasz.luba@arm.com,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	robh@kernel.org,
	rui.zhang@intel.com,
	sboyd@kernel.org,
	will@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	catalin.marinas@arm.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	p.zabel@pengutronix.de,
	rafael@kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v9 0/4] thermal: renesas: Add support for RZ/G3E
Date: Wed, 17 Sep 2025 19:01:54 +0200
Message-ID: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_100240_648938_32CBCF7B 
X-CRM114-Status: GOOD (  11.61  )
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

This series adds support for the temperature sensor unit (TSU) found on the
Renesas RZ/G3E SoC.

The initial syscon patch [1] the series depends on has already been accepted.

Changes:

v9:
 * Remove driver-specific read/write indirection and use readl/writel
 * Use devm_mutex_init()
 * Switch to syscon_regmap_lookup_by_phandle_args()

v8:
 * Use of_parse_phandle_with_fixed_args() for trim values
 * Update binding doc and collect Rb tag from Rob
 * Use millidegree computation to for better precision

v6 -> v7
 * Update DTS trim priperty name and specifier, updading the documentation
 accordingly
 * Refactor main driver: remove spinlock usage, using polling timeout as computed
 from datasheet. Also use polling for get_temp() while using IRQ for trip-point
 cross detection, and finally add both runtime and sleep PM support.
 * Add new patch to update sys #address-cells as trim specifier now requires an
 offset from sys base

v5 -> v6
 * Minor typo fix
 * Constify regmap config in patch 1/5

v4 -> v5
 * Remove useless curly braces on single line-protected scoped guards

v3 -> v4
 * Improve commit messages

v2 -> v3
 * Remove useless 'renesas,tsu-operating-mode' property

v1 -> v2
 * Fix yaml warnings from dt-binding
 * Update IRQ names to reflect TSU expectations

Regards,

[1] https://lore.kernel.org/linux-devicetree/20250818162859.9661-2-john.madieu.xa@bp.renesas.com/


John Madieu (4):
  dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
  thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add TSU node
  arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

 .../thermal/renesas,r9a09g047-tsu.yaml        |  87 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  48 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   7 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3e_thermal.c       | 547 ++++++++++++++++++
 7 files changed, 698 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

-- 
2.25.1


