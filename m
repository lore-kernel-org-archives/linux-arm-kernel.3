Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E7C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b7lv7GGS9WubiIrgugkDkQn15aDp/fEieZs8gy6FFRc=; b=f5vwolXzOEmDEOPTHvdIa9xsiY
	uyVlr+St+snR6JAtFfqEWJwt0QYqA9cBlutWNEDt2nl4s/iLr1YoUc6j0WTLxU/CH5xXWyBJy6Dxe
	Ie3kVvZTPjyQ0u+4QHpe/9JydNZr7fL0XZ97QHmAILyMz+k4+mdIdDZG6IkXNprXiswMTbiMMxd9I
	xTRchkPSO9hptTznWkYusW5pE8SJqNYddTz+aqyzMkhq0ZkOkOuSZV6VQeGs2Uc/AeDaYi9gHHR/D
	oBbB9mvZraVCDyBUuvXsMebujQn1fBHczcphWMZzZ0ms0gGw0TCWUIrs5cVjwfHctJfhDS1Rm3x7Z
	RDXh9A/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndZa-00000007SaY-1LlX;
	Thu, 27 Feb 2025 13:05:06 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncwu-00000007MGb-08it
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:25:09 +0000
X-CSE-ConnectionGUID: znxM1xLTR3mpvimHHn6aDw==
X-CSE-MsgGUID: ml/HIhIST4aCimY9fdisBQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2025 21:25:03 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.68])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C581840029C3;
	Thu, 27 Feb 2025 21:24:56 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
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
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	biju.das.jz@bp.renesas.com
Subject: [PATCH v2 0/7] thermal: renesas: Add support fot RZ/G3E
Date: Thu, 27 Feb 2025 13:24:36 +0100
Message-ID: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_042508_189393_69AF47AA 
X-CRM114-Status: GOOD (  12.93  )
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

Hello,

This series adds support for the temperature sensor unit (TSU) found on the
Renesas RZ/G3E SoC.

The series consists of 7 patches (some of which are not related to the thermal
framework) that progressively add TSU support as follows:
- patch 1/7:    adds syscon/regmap support for accessing system controller
                registers, enabling access to TSU calibration values
- patch 2/7:    adds clock and reset signals to the CPG driver

- patch 3/7:    adds dt-bindings
- patch 4/7:    adds the actual TSU driver for the RZ/G3E
- patch 5/6:    adds safety mechanism to make sure we we protect the chip in
                case of consecutive read failures
- patch 6-7/7:  add DT node and defconfig enablement


Changes:

v1 -> v2
 * Fix yaml warnings from dt-binding
 * Update IRQ names to reflect TSU expectations

Regards,

John Madieu (7):
  soc: renesas: rz-sysc: add syscon/regmap support
  clk: renesas: r9a09g047: Add clock and reset signals for the TSU IP
  dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
  thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
  thermal: renesas: rzg3e: Add safety check when reading temperature
  arm64: dts: renesas: r9a09g047: Add TSU node
  arm64: defconfig: Enable RZ/G3E thermal

 .../thermal/renesas,r9a09g047-tsu.yaml        | 123 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  49 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           |   3 +
 drivers/soc/renesas/Kconfig                   |   1 +
 drivers/soc/renesas/r9a09g047-sys.c           |   1 +
 drivers/soc/renesas/rz-sysc.c                 |  30 +-
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 drivers/thermal/renesas/Kconfig               |   7 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3e_thermal.c       | 479 ++++++++++++++++++
 12 files changed, 703 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

-- 
2.25.1


