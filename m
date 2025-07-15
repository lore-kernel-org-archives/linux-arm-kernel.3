Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136D4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9K/OMZSsMmZGuy0hU2Ok72ahuLx2oVIDd1r5SEEpn8g=; b=AWNBeBPtQo4uGpfo2naFOiRS9u
	m2WM7VM26i5IogGzii7QZUlXl1m0B8XGIUgqIrT4rHPJxyeCuDp8PcwTFg6nwL5JR4Mm5yRiHTVyI
	0oaYTTwftAS30wr3uAd9/s6+HPoPzdrJcOewBbPtys75APViaUssbv4nbILU4Zos8yLUoapTpaBSt
	+y5E2IFNGhv8rS7Ufg7I/2oS2X/Nu7OhZLDbtZ2N8XzTR2/ksVQgWVknaRZ9LmM7JVkM3e95OVx3r
	2YClnRhTLOYhSWW0M4RvRh2pll7Gkoj72nPTh9YUTzHRMMmxMr9ZWMcSMUFS3+kauggTJ3oEEQ5Xr
	+Zmmg+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhnj-00000005dHv-34o3;
	Tue, 15 Jul 2025 15:42:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgFb-00000005IxE-0M4B;
	Tue, 15 Jul 2025 14:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752588197;
	bh=cVh85CDI18XevdD+UY0ngR9V3XbI7OT1xLVWxldsehg=;
	h=From:To:Cc:Subject:Date:From;
	b=o5weQL4Uon5ojPbP5KHkZcd+Jt62CNljzHE3kLtcN+nPxFA50bWg78y5Sj23YofNO
	 MtPnMLoMBIEl/ITRLrcGtwWac6qtUQPWsIUVBUYBOmhlWH2kFQTzjdihtdzT4my80m
	 iHNECj5645rXXy9wJyfBR+QRfYwSUUaOmrjG4rMvOx/jYct6ks59ASTub3CH7RJ7Wz
	 FiCgKu3tVJkidIY7MWm0y/QK8OoX7ybxmQLMelrDLLhs2jFoxDmvFaH+6HiMC+0/kX
	 FHpuByYpGytGIPzpf5rmDExwDIW1RiM6/QOjaxT4O1NwwaocoDIx0WfHCBvHzD1ykJ
	 xwtsM0JqSBOEQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79BAC17E0D15;
	Tue, 15 Jul 2025 16:03:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v5 0/8]  Add support MT6316/6363/MT6373 PMICs regulators and MFD
Date: Tue, 15 Jul 2025 16:02:16 +0200
Message-ID: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_070319_272776_9D1AA76C 
X-CRM114-Status: GOOD (  18.99  )
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

Changes in v5:
 - This time the dt-bindings commits are the right ones... sorry again :-)
 - Removed accidentally added Link: tags in all patches.

Changes in v4:
 - Rewritten all register definitions for both MT6363 and MT6373
   regulators to be register offsets instead
 - Added the appropriate supply_name to all vregs in 6363 and 6373
 - Simplified the macro parameters for all vregs in 6363 and 6373
   - Added common definitions pattern in macros to avoid plain writing
     register definitions in every macro call
 - Added registration of SPMI sub-device in MT6363/73 and setup of
   regmap reg_base based on `reg` parsed from devicetree
 - Removed interrupts parsing from devicetree
   - Moved (pmic-internal) IRQs to macros
 - mtk-spmi-pmic: Added parsing if irqspec with param_count=2 for
   easier irqs registration from regulator drivers

Changes in v3:
 - Added buck and ldo supplies to mt6363 and mt6373 drivers and bindings;
 - Removed interrupts from mt6363 and mt6373 bindings;
 - Added registering interrupts in mt6363/73 drivers instead:
   this avoids big arrays in the mfd driver, which will grow
   uncontrollably (as it already happened in multiple MediaTek
   drivers) and with each new(future) supported PMIC;
 - Removed "ldo-" and "buck-" prefixes from mt6363 regulators
   - Renamed "vbX" to "vbuckX", reflecting datasheet name
 - Changed all LDOs in MT6363 and MT6373 to add VOCAL usage, both
   increasing the number of voltage steps (2.5 or 10mV increments
   depending on the LDO) and the accuracy of the reported voltages
 - Tested again on MT8196 board

Changes in v2:
 - Merged MFD and regulator in one series
 - Split mediatek,mt6316-regulator.yaml in three files as
   suggested by krzk
 - Added interrupt-names list in MT6363/MT6373 bindings as
   suggested by krzk
 - Documented regulator modes in MT6363/73 as suggested by krzk
 - Fixed interrupt and interrupt-names maxItems in both 6363/73
   because, well... I miscounted them in v1 :-)
 - Removed keys from mt6363 binding: the compatible was not yet
   added to the keys binding and doing that will take quite a
   while, as I have to find a way to test the code before that
   as unfortunately my HW does not provide any way to test the
   PMIC keys (thought it did, but then turns out it doesn't...)
 - Completed the mt6363 MFD example with ADC as suggested by Rob
 - Avoided applying regulator schemas multiple times as pointed
   out by Rob (in mfd binding)
 - Fixed MT6363/73 issues pointed out by lkp (eh, sorry, that
   happened during a last minute cleanup... ugh!).
 - Brewed some more coffee :-)


This series adds support for three new MediaTek PMICs: MT6316, MT6363
and MT6373 and their variants - used in board designs featuring the
MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
SoC.

In particular, MT6316 is a regulator, but the MT6363 and MT6373 PMICs
are multi-function devices, as they have and expose multiple sub-devices;
moreover, some of those also contain an interrupt controller, managing
internal IPs interrupts: for those, a chained interrupt handler is
registered, which parent is the SPMI controller itself.

This series adds support for all of the MT6316 regulator variants and
for MT6363, MT6373 SPMI PMICs and their interrupt controller.

AngeloGioacchino Del Regno (8):
  dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
  regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
  dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
  regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
  dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
  regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
  dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
  drivers: mfd: Add support for MediaTek SPMI PMICs and MT6363/73

 .../bindings/mfd/mediatek,mt6363.yaml         | 110 +++
 .../regulator/mediatek,mt6316b-regulator.yaml |  46 +
 .../regulator/mediatek,mt6316c-regulator.yaml |  46 +
 .../regulator/mediatek,mt6316d-regulator.yaml |  41 +
 .../regulator/mediatek,mt6363-regulator.yaml  | 193 ++++
 .../regulator/mediatek,mt6373-regulator.yaml  | 174 ++++
 drivers/mfd/Kconfig                           |  17 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/mtk-spmi-pmic.c                   | 410 ++++++++
 drivers/regulator/Kconfig                     |  27 +
 drivers/regulator/Makefile                    |   3 +
 drivers/regulator/mt6316-regulator.c          | 345 +++++++
 drivers/regulator/mt6363-regulator.c          | 934 ++++++++++++++++++
 drivers/regulator/mt6373-regulator.c          | 762 ++++++++++++++
 include/linux/mfd/mt6363.h                    |  26 +
 include/linux/mfd/mt6373.h                    |  21 +
 include/linux/regulator/mt6363-regulator.h    | 331 +++++++
 include/linux/regulator/mt6373-regulator.h    | 162 +++
 18 files changed, 3649 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
 create mode 100644 drivers/mfd/mtk-spmi-pmic.c
 create mode 100644 drivers/regulator/mt6316-regulator.c
 create mode 100644 drivers/regulator/mt6363-regulator.c
 create mode 100644 drivers/regulator/mt6373-regulator.c
 create mode 100644 include/linux/mfd/mt6363.h
 create mode 100644 include/linux/mfd/mt6373.h
 create mode 100644 include/linux/regulator/mt6363-regulator.h
 create mode 100644 include/linux/regulator/mt6373-regulator.h

-- 
2.50.1


