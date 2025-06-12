Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C26C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=McFbzN0pVqcRY01RjIh8RVKmMr+Bk1WAZrw+8JtAonw=; b=y5y4cT5dFTK9Yr
	eWjxVA0TUZluctAqOuVU+xzi8ZgxpviY18p2Ys+5C252RARyxv2fMUk7Ao4buDosJyi04CQJZ+Vqk
	/U6DBVNa5XOf2vS4h9sp08Y6hIe3NFHVejYsqYRav0oFSNwD97kCuCppFLukOOpsfUL6vKl1oR5zY
	URZB94zl3KibryWbDQC715HjITdelOMMMGpTAdV54/yxZ1V9xRwxgFZyXP2vU4nCOQ4pr3cxbBfiZ
	BaFBmwybAsQGeRNk4EoknizdiBH772X3NiMdxCR/2SHZ20IqXXwVuj4wtsQS5Q1Hg29hwvCmp7iz9
	yExDGHWqpi9H34v2TQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowk-0000000EXzz-1egE;
	Thu, 12 Jun 2025 20:54:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjhH-0000000DkvM-3Vnb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:18:33 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 65C2523069;
	Thu, 12 Jun 2025 17:18:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzGFH5v5AW84; Thu, 12 Jun 2025 17:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741509; bh=bNelyn9B2iPBX/xAeabKNOJ/SJ1fiqXUANtY4YCvtYU=;
	h=From:Subject:Date:To:Cc;
	b=gJ3mGo/knt129fwJhT7FvJnW7pL9kFut0rfePWssCSW3xRlsqZ8Kx3L7C072KKnKw
	 NhireUBkSezKH9Ak1s/934vY79k0EY6Ym6iQKx1HQLAHhOr3VjvXWz/KyQHxjFcV5S
	 671nK5LP98DKb5LsnBeUEMGB8Vx3429AOtwmvHyft7QNuKJACZBVgq/ywbKXzHSPMe
	 tiu+wsudXihicsDjIL0D2c5l70aXGfpJuUyOkFstsaKP39yJpB5X0TkdbjN9MlU1pN
	 klcfwPKV/vTQw2FiqwuKgkH/ovYv4JKllwRon0gl4Vgx4JfuRi1ovzliidJ0/cZzem
	 HPOt4uAicGnUg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 00/12] Support for Exynos7870 DSIM bridge
Date: Thu, 12 Jun 2025 20:48:04 +0530
Message-Id: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzvSmgC/x3MQQqAIBBA0avErBNswqyuEi0kx5pFGg5EEd09a
 fkW/z8glJkExuqBTCcLp1jQ1BUsm4srKfbFgBqNNtgquu6YxPZWKy+8q4CD78iFxRmEUh2ZAl/
 /cZrf9wPSE1h9YQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=1998;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=bNelyn9B2iPBX/xAeabKNOJ/SJ1fiqXUANtY4YCvtYU=;
 b=7YAvpcOOIIkM5ooW+kuxBu//qdWk0BjK6t32Rhv9PQ4kmvlYPZBWr96Nl3TYXg0HBfMF0GQ96
 GYG/S1yQ12QCyobP8Cgo3Tjcc6aRElD3TsokY+ksfNMF1FKQ+8hxmUk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081832_012785_F8860EE8 
X-CRM114-Status: UNSURE (   9.81  )
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
Kaustabh Chakraborty (12):
      drm/bridge: samsung-dsim: separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
      drm/exynos: dsi: add support for exynos7870

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  26 +++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 250 +++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
 include/drm/bridge/samsung-dsim.h                  |  13 ++
 4 files changed, 254 insertions(+), 44 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-exynos7870-dsim-f29d6eafca52

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


