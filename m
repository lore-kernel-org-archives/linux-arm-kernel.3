Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE94C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A6sJOEFXkET5OTUGpPVqAhGJNpr1Qhp3F4YDCiH0l2c=; b=2LSR5HH2IXucgMzrvSzQcXkj5B
	NFYQ7j1EeNRnR6CQZtG5td79Vahjy/X+X5avF4K1YimEemZJY4KOkLPaBS9HcruqvJWuiDvj3SLR/
	5H0g2yHVr5lXlNt5iIsarYNUk56F46tBevSPc9hxQ5CCGYGZZFeVmzgn8KMF+yGZGVP7o1BqdATQv
	e7JUfEyXlBvIVxLxPTHHRSG151ndw6QQLvrm/b/NH6ZnC/c3uoSdNNJVVgWFO1Q+jy4JJmxaXdtsz
	/zNhJgGbSvK3yIcEKelrtzU6ChnC/o8GsSZ1w3chc4K3VQJKucHxOM37c5OL0CwYwbV7u1mgHlRZ4
	riJJPqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7Y-00000005rUf-2EoJ;
	Tue, 15 Sep 2026 10:10:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7R-00000005rJQ-0lF0;
	Tue, 15 Sep 2026 10:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789467026;
	bh=D7vYRfDYX2mNbWggPeNQgbQs/Qp4rSvwGWxfHN5e9nY=;
	h=From:To:Cc:Subject:Date:From;
	b=Ue0f0yL3LGb2t5G/Q1Sb8TZOpHIw1yeqNoNSHBn4t3tQhMBak207yq/w5LjvwonqN
	 kLTYi2bvAxU5s4NVV/fWrJib1Cy7vF8ibv/Y/5SidlIrVPlUccm7I5PJqgMZ+Y2ctV
	 HDFykahu0/dTkwRYOCHUf6hAWgdGF0VdNRBzKT1gsLh+u5GI9WnPbdo5Ayy9LZ3PyN
	 Mi/N5e9I0S6woR/xwP5TRLIt7AnjOLUhXpTQf9wxEPBDXr08/Od1g6Ne8Ch+sEkpgK
	 JA2cR6JvCVobwnlhBE9fhRGMZ1h/I2Ogh9JiR16b1/jHwYtM+1IFaVeJ4FWi5ulbgL
	 fKooppqug/RZw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B4E117E089A;
	Tue, 15 Sep 2026 12:10:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Tue, 15 Sep 2026 12:10:20 +0200
Message-ID: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_031029_430024_4EEB45C0 
X-CRM114-Status: GOOD (  13.43  )
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

Changes in v4:
 - Mentioned MT6991 in the commit description for commit 2 (Mani)
 - Added comment to clarify that if one calibration is missing, no
   calibration should be trusted
 - Changed Kconfig to mention module build (Mani)
 - Changed header comment to add "Author" and change indentation (Mani)
 - Moved cktx_impsel, tx_impsel to the top (Mani)
 - Added pm_runtime_no_callbacks() call (Mani)

Changes in v3:
 - Allowed value 0 in calibration fields (as it's a legal value)
 - Fixed duplicated LN_TX_IMPSEL_{P,N}MOS writes
 - Allowed -ENOENT for nvmem_cell_read_u{8,16}() calls, as the
   calibration data is effectively optional
 - Removed two development stage leftover unused definitions
 - Moved num_lanes check in mtk_pcie_sphy_get_calibration_data()
   to reduce indent in probe function.

Changes in v2:
 - Added items/description to reg in binding
 - Added missing pm_runtime.h inclusion
 - Moved pm_runtime_enable call to before registering PHY
 - Fixed pmos/nmos variable size for 5 bits calibration values
 - Fixed calibration for single-lane PCIe, as in, the ln1 rswn
   calibration nvmem value is ignored in code if it's single
   lane and will not return an error; this is due to the fact
   that, effectively, single-lane may have a zero calibration
   in tx-ln1-rswn which is fine, as that'd be anyway unused
 - Changed calibration data errors to dev_err_probe and changed
   the "no calibration for ..." message to dev_info instead

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  93 +++
 drivers/phy/mediatek/Kconfig                  |  13 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 561 ++++++++++++++++++
 4 files changed, 668 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.55.0


