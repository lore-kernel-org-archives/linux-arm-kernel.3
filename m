Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC573CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kWtKpBCYAqGMS5ZQa0R806MQk3j7SytAZetnZ5Qp1TY=; b=sfNN9f/aZ4YV82Xy0K0JsGSjb3
	mdocUkhqIzlsD6yLPc3uWKi4C63IAX6A1GPPK7yxmder7NPmXbTMBCyHB6B+kLz1ZySTet18JsXhZ
	x8F3Xg921xdJ7K780tAcblLHZ3w/2FcoRl1OXG0MSz7DwmvNrc+YfZ2zi1ET3jeRR+Ouz0nvmT5PL
	zSJUj32rDetnfByqu+8tUvT2/ogBbbqfAvjAZHTpAcEq++AJj8JZ75ljm8SX1Zf/gzQjsHnDjMZLW
	t4fmTL4G4dxCivbc4k/Oh6fla1+2bOgcfbe7e9gwHLgmX7kPjiTG/va1XavT8DJVcSFJS8EZdW0T4
	lgB5MH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDFo-00000008iXQ-2eZg;
	Fri, 24 Oct 2025 08:34:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEo-00000008hGb-2Xyh;
	Fri, 24 Oct 2025 08:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294808;
	bh=nsRGIDtKYjLrHN9FUa+g9NCVrzhagqwv5Q1qaeBlALI=;
	h=From:To:Cc:Subject:Date:From;
	b=Nn4OSvKDiMa+9ew5TM2/Yk9hc6DQDOujDWW1jt/vYQk5/D3a2DrdtCm3q6NjObBEa
	 uCc1Uul1rX5mIfaUvERjMx4m4EiylvDrfNMcBXM7TZJxNAcaalwSQNXlcdKpqGW+In
	 7VynKZA1+ClH2DsvkWoJgl23ZA1Le3ShEw1US1sy8PBGDP4zcX5x1bb4V26Gk2/vU4
	 3thF7bMHpSai/MRWF2lGi1vWL90we2LHdrKfD0Q0vhN0vjIXg7ZkYELHpSjzZ+nfCa
	 QYueOTgLJTVpswRo0GY3G/IABr46eLw/rI8Ues9lkGBPlC6CQVYxlC0q0gp7RazNyr
	 nw5sghyPXyQBA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A202D17E1249;
	Fri, 24 Oct 2025 10:33:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] rtc: Add support for MT6685 RTC
Date: Fri, 24 Oct 2025 10:33:16 +0200
Message-ID: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013330_948692_6CE1D190 
X-CRM114-Status: GOOD (  12.15  )
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

This series adds a driver for the Real Time Clock found in the MT6685
Clock/PM IC.

This chip has been used on a number of different MediaTek platforms
from around 2023 to the latest ones released in 2025 - and on both
Smartphones (Helio and Dimensity), Chromebooks (Kompanio Ultra) and
Genio boards.

This was tested on a MT8196 (Kompanio Ultra) Chromebook.

NOTE: This series depends on series [1] "SPMI: Implement sub-devices
and migrate drivers"

[1]: https://lore.kernel.org/all/20251021083219.17382-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (2):
  dt-bindings: rtc: Add MediaTek MT6685 PM/Clock IC Real Time Clock
  rtc: Add support for MT6685 Clock IC's RTC over SPMI

 .../bindings/rtc/mediatek,mt6685-rtc.yaml     |  33 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-mt6685.c                      | 472 ++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
 create mode 100644 drivers/rtc/rtc-mt6685.c

-- 
2.51.1


