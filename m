Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E77CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HqPG7XHGZeUTkW4v3RDXexC2yc1kmrP/kLWAn3v07yg=; b=lEcqPLTBGs2SHGCUWijEdU2zce
	K1YlTl90vAuUm9IaCZCuw0klblZk2vWSrqNESJylSfXM5BKpCFoSYQjIrUHM+s/C2RXmwhonj5LdR
	a7Dg2SxpQHt2d/+rK8lKQW4pt9FrQuMvn+eC8qAludbWXlO+CUbVh6X3RquNzgg3ciAUmtUnOGOQN
	azE03bhSR6mg6smIarrlAHIQjdhlnddSXV74F8TBdnuoUusLL3kcqOEUVD+ECLLcffA8zneAqNUBH
	5UHO9Mtrz/PPvaZySuF9KEZvdIOqISNz2aU/f9Jb4UlXPR58pJgtF/nTy25UK3Qi3nTZZspkR5LdY
	okQ6++4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jm-00000008CZB-0NUw;
	Mon, 18 Aug 2025 17:33:38 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2jY-000000081iO-2i8Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:29:23 +0000
X-CSE-ConnectionGUID: LqwVSRBoTjiY8DtsXwpQtw==
X-CSE-MsgGUID: tSnWmMSYTWGUQCIhitJZog==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Aug 2025 01:29:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.173])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C6E784016EDD;
	Tue, 19 Aug 2025 01:29:07 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v7 0/6] thermal: renesas: Add support for RZ/G3E
Date: Mon, 18 Aug 2025 18:28:46 +0200
Message-ID: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_092920_801901_2705C47F 
X-CRM114-Status: GOOD (  12.86  )
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

The series consists of 5 patches (one of which is not related to the thermal
framework) that progressively add TSU support as follows:
- patch 1/6:    adds syscon/regmap support for accessing system controller
                registers, enabling access to TSU calibration values

- patch 2-6/6:  adds dt-bindings, actual driver, DT node, and config symbol.

Patch 1/6 has been duplicated at [1] in USB series. This series addresses comments
got from there.

Changes:

v1 -> v2
 * Fix yaml warnings from dt-binding
 * Update IRQ names to reflect TSU expectations

v2 -> v3
 * Remove useless 'renesas,tsu-operating-mode' property

v3 -> v4
 * Improve commit messages

v4 -> v5
 * Remove useless curly braces on single line-protected scoped guards

v5 -> v6
 * Minor typo fix
 * Constify regmap config in patch 1/5

v6 -> v7
 * Update DTS trim priperty name and specifier, updading the documentation
 accordingly
 * Refactor main driver: remove spinlock usage, using polling timeout as computed
 from datasheet. Also use polling for get_temp() while using IRQ for trip-point
 cross detection, and finally add both runtime and sleep PM support.
 * Add new patch to update sys #address-cells as trim specifier now requires an
 offet from sys base

Regards,

[1] https://lore.kernel.org/all/20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com/


John Madieu (6):
  soc: renesas: rz-sysc: Add syscon/regmap support
  dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
  thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add #address-cells property in sys
    node
  arm64: dts: renesas: r9a09g047: Add TSU node
  arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

 .../thermal/renesas,r9a09g047-tsu.yaml        |  87 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  49 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/soc/renesas/Kconfig                   |   1 +
 drivers/soc/renesas/r9a08g045-sysc.c          |   1 +
 drivers/soc/renesas/r9a09g047-sys.c           |   1 +
 drivers/soc/renesas/r9a09g057-sys.c           |   1 +
 drivers/soc/renesas/rz-sysc.c                 |  28 +-
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 drivers/thermal/renesas/Kconfig               |   7 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3e_thermal.c       | 575 ++++++++++++++++++
 13 files changed, 760 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

-- 
2.25.1


