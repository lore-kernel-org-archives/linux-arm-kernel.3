Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37886C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TA+yT3DOYhoc9LVKVh25W5pX+s9rxwvMa6hW5rfBklE=; b=PGL4bdm1XfwElP
	7+VpL/yD5GfTG0W2pybxgvbdJcYs98Q78Bqu39p7gxd9PBWGSQlmbr0uJUKOz9rCOI+Ho4LjnngBA
	+phGAqsU864ITtvQQ8UloC3AxtLgxhXt7+E7TTW/T6ilff5JWi9scbqv9aCxeTxUn0ACxsdQUy71c
	SvKheW/Ag4Vn22YXWLaRTDJQlHi58WLzhD9J3V5A3dYUabHutlmNz/FF1/foS0c+GSyItt1AQ93Hp
	36bNFzPlAW5n3NLXIp4LYtSg385A3E0gKQU9TmQtny4b2L62NgjDAaBFrLfeW9YreiyNKe4sm4drT
	l3TLkKSwmT32Lgactukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtSg-0000000ClVV-3BYd;
	Thu, 26 Jun 2025 20:44:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsRE-0000000CbPI-1t4W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:39:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A8CED25AFA;
	Thu, 26 Jun 2025 21:39:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H0ggFo7uRMP; Thu, 26 Jun 2025 21:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966749; bh=zxNeykMCVsQL9yo26mI9JxjmjAGRyfaJ2CumE34l/70=;
	h=From:Subject:Date:To:Cc;
	b=MVXt5OEnu7jbyXJ3UpjIBENx14KAqgtmQmaU+TamH36rvJpaIQiQo+8NFUqZi/p0f
	 zE1r0VPdJwD2+sAA74H/GVjp/CuTh8BmToPYNEr/cH3i+Yyf/8wfiGKoLbRtaNmevL
	 +sP79OfdAwHauQMsHcEvhHcExx+w/t5Olf3gXkOmBb8aDdVVD81dY08YyWpHvJ6RMh
	 PEv3nQKCcqZA9QfLckI2WZZvIPtzrE8sRDWW28gFJegVzULInSl1GZQ3c1KLfFAySN
	 zG8uLmJ03k6bBJQRhNIvoR6Odg19e8zSQE4fiteJ8p8SOhrWESP4wHcGcX8SVYmbZg
	 74XdTDYil227g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 00/13] Support for Exynos7870 DSIM bridge
Date: Fri, 27 Jun 2025 01:08:49 +0530
Message-Id: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmhXWgC/2WNOw6DMBAFr4K2jiN7Eb9UuUdE4eA1bBEceZEFQ
 tw9DilTzkhv3g5CkUngVuwQKbFwmDPgpYBhsvNIil1mQI2VrrBUtG5zkKZttHLCL+WxczVZP9g
 KIa/ekTyvZ/HRZ55YlhC38yCZr/21aoN/rWSUVsaWpX4Otu2cvzuWGMJyDXGE/jiODz2lotmwA
 AAA
X-Change-ID: 20250523-exynos7870-dsim-f29d6eafca52
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=2348;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=zxNeykMCVsQL9yo26mI9JxjmjAGRyfaJ2CumE34l/70=;
 b=ZHhes87ocrYxF2VsFJm2KKHstyoR/9FavFvLc3C3qp3ZRWk5Rf7ws+ppeLl+J37J0O5IodIQi
 Mp5UnS9CbjBCyG2Nlt5Tp1a49gcp8WjjWQD52G+xbAUTj+m+GSOUKSA
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123912_623487_E3C35202 
X-CRM114-Status: GOOD (  10.10  )
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

This patch series introduces a lot of changes to the existing DSIM
bridge driver, by introdcing new registers and making register offsets
configurable for different SoCs. These preliminary changes are followed
by the introduction of support for Exynos7870's DSIM IP block.

Work is heavily inspired and only possible due to Samsung's vendor
kernel sources. Testing has been done with Samsung Galaxy J7 Prime
(samsung-on7xelte), Samsung Galaxy A2 Core (samsung-a2corelte), and
Samsung Galaxy J6 (samsung-j6lte), all with DSI video mode panels.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- added commit to isolate clock names for each variant
- replaced clock names with generic ones
- added maxItems to clocks property in dtschema
- Link to v1: https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org

---
Kaustabh Chakraborty (13):
      drm/bridge: samsung-dsim: separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      drm/bridge: samsung-dsim: add ability to define clock names for every variant
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
      drm/exynos: dsi: add support for exynos7870

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 346 +++++++++++++++------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
 include/drm/bridge/samsung-dsim.h                  |  15 +-
 4 files changed, 307 insertions(+), 90 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250523-exynos7870-dsim-f29d6eafca52

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


