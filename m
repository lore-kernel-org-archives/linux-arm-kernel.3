Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D01C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zl/Dp3fXnYpaFnZiranhsmwEdVjrKVgOzO7n3OwLTi0=; b=ITC67/Dx8Rdf0IDqWpgNKSY+CF
	7698J2nvdRzPcH33BKPUTJbPgRyjYLgBXUW0wZtqFKDOghv2hxgDhePoil4J/Pb3W7iAxbllxj/W6
	l7eXZCObt5nov0SZ6gYfJktrKvR4ju9LGOamLGgFRe2Yfgfokj7ZTgybB3fUF/IrzeX3AynmO0td7
	pi1QmqWDinaceFBYYlK96+2BFYpdhPxDcN0vvcqlcEMQzkb/VSwxo841CNC2dswQ2jbdH27J2TNKa
	eJvgLAXcsydtp/l3R+Fhm6yuzNTWbbmETOp/mUVpXLPb3zx9XSdsPqDAfvIFMlkX9kWsfx9vHE53R
	Q+b/obqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udljS-0000000GcYE-471K;
	Mon, 21 Jul 2025 08:18:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlh2-0000000Gbw8-1a1h;
	Mon, 21 Jul 2025 08:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085774;
	bh=P/NW1/RI1132VsYmYKCFxP8GrB7AQikCUoRaUgB9NlU=;
	h=From:To:Cc:Subject:Date:From;
	b=d2vt7FfjA92IQpPa27iET473qr9XduKfdAIj2hbhGq5weWnE7xeL/66k7rXl+I87V
	 Z8vTshWw+odRWdQoEPJmgNlJX+dEjy3kOM1eZT7SOwLkNb2WPfWsR+fD2GqfpfUo8x
	 a3UgMeVVuEzyX0PyQVBz9kP/l+vzenvMH2qmNs4e7tFC7UtBw7ILj9vSUrPF4pGBkR
	 dhwrKhpI9x8352MFWf4ZB1MDfIl4V8zYJfeD31DvN2DuzWsJSXY9A+w8Bh8W0QQrrF
	 /hkolxfiW/+DVotXZeT3Vk6IEAxhz8WKzM3VgQF+yGbYmsmzKaZB6ROrJAFoo/3EYC
	 TTjh8sVGcSzHQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BC7217E0F66;
	Mon, 21 Jul 2025 10:16:13 +0200 (CEST)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 0/9] Add thermal sensor driver support for Mediatek MT8196
Date: Mon, 21 Jul 2025 10:14:50 +0200
Message-Id: <20250721081459.16278-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011616_565045_DE7E8951 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

MT8196 uses a positive temp_factor for temperature conversion, requiring
slight adjustments in the conversion logic.

To support this, the series introduces:

- A new struct lvts_platform_ops to allow platform-specific
  conversion logic between raw sensor values and temperature
- A variant of the lvts_temp_to_raw() implementation for SoCs with positive
  temp_factor values
- Platform data and controller definitions for MT8196

Laura Nao (9):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller support
    for MT8196
  thermal/drivers/mediatek/lvts: Make number of calibration offsets
    configurable
  thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
    lvts_raw_to_temp
  thermal: mediatek: lvts: Add platform ops to support alternative
    conversion logic
  thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant for
    positive temp_factor
  thermal/drivers/mediatek/lvts: Add support for ATP mode
  thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
    calibration data
  thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
  dt-bindings: nvmem: mediatek: efuse: Add support for MT8196

 .../bindings/nvmem/mediatek,efuse.yaml        |   1 +
 .../thermal/mediatek,lvts-thermal.yaml        |   2 +
 drivers/thermal/mediatek/lvts_thermal.c       | 315 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |  26 ++
 4 files changed, 325 insertions(+), 19 deletions(-)

-- 
2.39.5


