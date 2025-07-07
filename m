Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14033C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5i43TVqR6iBjOvcnjqeygV1IJXt4ftADDEk7l57Xa5c=; b=AnqEQuFeGVMvdbcGg4Shjto2m5
	WdS8UlK5/b0U1tgvwwKI9DY3mB+lU9qCi18tc5iv86/BPwrFkbQRWBcBkUtgJ0c/w38mm87wuNO9H
	T53MaldayxaVRhP1Lg4cqIytyJnftOr6Uq1RuOJQMnwNyH+YUYG/7b9J+jMF1KKPRAYQiuN+QiQgI
	qIxrsLt2cCDjWsQiWkZ71ODqFjUBKWi3euaWjU7Lq1W1f6VophzljH8aPhmKH8syrZ+0mq2J9DqQV
	gG3z1QrwCMShvggSIwSPcgJc2eeeQbqOiHsiIOJyZSGKc9NFN6ZTxyVo1OdIw5GbAlqgfvxrFWvL6
	Hk3O203g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmhb-00000002fyd-3X4v;
	Mon, 07 Jul 2025 14:20:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm9W-00000002apz-3ZnP;
	Mon, 07 Jul 2025 13:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751895901;
	bh=tnHHoX3iDObQtzdKxqZ9obTuM4UCH2Fcp+M+cSJaz6g=;
	h=From:To:Cc:Subject:Date:From;
	b=C5GpFedqk86qo/ItkY6pYpgc4hQxpRNKBa3bvD7MUMiduOj3UzxjQEY/YOil1oDS1
	 /BJlHeck6mGmTuRyiGSSHDsaJhFCagNnUbu2g7ULPMJCXzvFfYCpjGMMLWYodxMHcK
	 cUMcSh8h98IfSzFTv2F4oB00CW+g2I3l95QVHOZsIYDwrWYk+Xa4XRIQHtopVaw8nt
	 vZVUfb7JDqvRXJ/R6shzRyc1iFiju58Snuzy0Yy1I+1w0MuHNiqo1B354Hs1RIsGUX
	 Vt2IdzpFX0yJZoIuG+u2fqVAUgumGTCLN83SGQzEV9mA5Ii4CY4FESejJGMI2Ymx+1
	 TUD45L3N+Q++g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59D6C17E04AA;
	Mon,  7 Jul 2025 15:45:00 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH v2 0/8] Add support MT6316/6363/MT6373 PMICs regulators and MFD
Date: Mon,  7 Jul 2025 15:44:43 +0200
Message-ID: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064503_049079_A308F0D6 
X-CRM114-Status: GOOD (  15.60  )
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

 .../bindings/mfd/mediatek,mt6363.yaml         |  115 ++
 .../regulator/mediatek,mt6316b-regulator.yaml |   46 +
 .../regulator/mediatek,mt6316c-regulator.yaml |   46 +
 .../regulator/mediatek,mt6316d-regulator.yaml |   41 +
 .../regulator/mediatek,mt6363-regulator.yaml  |  175 +++
 .../regulator/mediatek,mt6373-regulator.yaml  |  175 +++
 drivers/mfd/Kconfig                           |   17 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/mtk-spmi-pmic.c                   |  410 +++++++
 drivers/regulator/Kconfig                     |   27 +
 drivers/regulator/Makefile                    |    3 +
 drivers/regulator/mt6316-regulator.c          |  345 ++++++
 drivers/regulator/mt6363-regulator.c          | 1076 +++++++++++++++++
 drivers/regulator/mt6373-regulator.c          |  744 ++++++++++++
 include/linux/mfd/mt6363.h                    |   26 +
 include/linux/mfd/mt6373.h                    |   21 +
 include/linux/regulator/mt6363-regulator.h    |  326 +++++
 include/linux/regulator/mt6373-regulator.h    |  154 +++
 18 files changed, 3748 insertions(+)
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
2.49.0


