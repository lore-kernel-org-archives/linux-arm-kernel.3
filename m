Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F9BCFA77B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1829N+sFmltnFD6mgbDSgIcrYdNaip1he96DiOwUIBI=; b=1hCQdZ8KlDKzyQU7BLJY3ymhnN
	LbrAlywZJO54y8q8CXTnvZGrGGwzero7yoseuE2vFrmOIxL3hcQApgicJ9CSaYbiYvl/ZD0rjWc7M
	PvtNGV9/oyP1gnMhyNf3owy7IJzt3CPzp+EwmgogceeHsB0QdMBRArI73ZFW+vllaePC3lBln3Y43
	yKLIn6sQWgfKloWtu0GoWRT3OKUBhj1EqR10zG5LBphpkqxd77dCFfg+uJuuwJiDF2HsMvHWNGB05
	sXI/TU6DHSFBjDLmijyUQM/baRj47wDQx53JT9tC87YFxQmS8YEaZGqLPo4s36YPkOGWfvD4JaihH
	fsYMP8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8Z-00000008Hys-1Z9G;
	Fri, 21 Nov 2025 11:17:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8V-00000008Hx4-1zmp;
	Fri, 21 Nov 2025 11:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723822;
	bh=WsrtTZZgN5cpcaeLfhfmV5Uwfe5UlDUKhrY36z8jPVY=;
	h=From:To:Cc:Subject:Date:From;
	b=PJRQcbgVZNrXjk2K7ARdstUNgf7FfKlfkA8MvpZ/bHvoYpQyg8zo4nY1Jv1yYREXB
	 N1CUgsZzeJfDrvKTpee+EnO9/nZ2MWvEYaG4YeWr3Bgv1EYQ8Gg08LfhgubBEQBYIR
	 ecR1C9k1IqakxfHE3w0hcbDeC/x5+/1c/PocO5ciQOsZtVUIzntrVAcPm2VCv2nI97
	 cmV8vDVCOB4lO/BOstQ0NHEGMmyUQmoMl7IHuOOnmte5p3B3chBjV4qSsWN1AxS/tt
	 5IGkmGouqRre/IrgbCkjjBOCS++FJN3SZrErhKzKmm8h27XxsE8VFpsVxkZ+GVq0e0
	 hX6vFchJfs2yA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A007417E05BE;
	Fri, 21 Nov 2025 12:17:01 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	wenst@chromium.org,
	fshao@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v4 0/9] Add thermal sensor driver support for Mediatek MT8196
Date: Fri, 21 Nov 2025 12:16:33 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031707_682082_C7448F7A 
X-CRM114-Status: GOOD (  11.32  )
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

This patch series extends the MediaTek LVTS thermal driver to support the
MT8196 SoC.

MT8196 requires a different implementation of the lvts_temp_to_raw()
function.

To support this, the series introduces:

- A new struct lvts_platform_ops to allow platform-specific
  conversion logic between raw sensor values and temperature
- A variant of the lvts_temp_to_raw() implementation
- Platform data and controller definitions for MT8196

Link to v3: https://lore.kernel.org/all/20251016142158.740242-1-laura.nao@collabora.com/

Changes in v4:
- Dropped v1/v2 suffixes, replaced with mt7988/mt8196
- Added lvts_raw_to_temp/lvts_temp_to_raw functions, which return the 
  corresponding SoC-specific ops.
- Changed probe logic to fail when temp_factor == 0, dropped checks at
  runtime
- Dropped R-b/T-b tags on affected patches (3 and 4)

---
Laura Nao (9):
      dt-bindings: thermal: mediatek: Add LVTS thermal controller support for MT8196
      thermal/drivers/mediatek/lvts: Make number of calibration offsets configurable
      thermal/drivers/mediatek/lvts: Fail probe if temp_factor is zero
      thermal: mediatek: lvts: Add platform ops to support alternative conversion logic
      thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
      thermal/drivers/mediatek/lvts: Add support for ATP mode
      thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit calibration data
      thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
      dt-bindings: nvmem: mediatek: efuse: Add support for MT8196

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |   1 +
 .../bindings/thermal/mediatek,lvts-thermal.yaml    |   2 +
 drivers/thermal/mediatek/lvts_thermal.c            | 307 +++++++++++++++++++--
 .../dt-bindings/thermal/mediatek,lvts-thermal.h    |  26 ++
 4 files changed, 315 insertions(+), 21 deletions(-)
---
base-commit: abadc219d77ce0e61fcac0147cc6cc69164af43e
change-id: 20251121-mt8196-lvts-v4-a61fb5c27216

Best regards,
-- 
Laura Nao <laura.nao@collabora.com>

