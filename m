Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1B8CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAiVe+ZvBi3nluiPxc36+cEeESqYHa/zzuauCiXJTQc=; b=rGCuj9qhBzdJBe
	EZtwJUWA3MEOtguMWNWu703w3P9WTRH/GEa1/Jm8ZuqhtviXkYX3Se5OUpJpZBW7Zy77jdr0wusFC
	jBm7VVStYuB6njMC1K55oLUuqhqJpVytFBZpimEq9JvS5+nw2eEUcuhkZ4/VOszJYr7YBSb+V6PjE
	O4eBtKm4kiqUNllp4EoWGO6bD0SpzJKOIXq04dbtBwfOzMAom3azLAXjdzzDelAcYNQEBe8xUaeXT
	45f9oam7waTaOa86EnnSh9i1WyUJDU92AL+V5SaxlHubyLR1beQIMbhHgSCbYX78C79Bu+nG4+Ot0
	H3KJzWCAz4AEuGNB2kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjDm-00000003tB1-0RK7;
	Thu, 11 Sep 2025 15:28:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjDj-00000003t7t-2fQa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757604503; x=1789140503;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=3W6XSC6jeV7THKrxJGuvK1ZGIYpIhl5o7qaM/qzxjrE=;
  b=RhLFQ+UkONI2o9wJngV4aWC5YrIkXogmhx44oCOGmctK+Ibdt3ZsLnbG
   sfsAIRKJQYTRBwT82TF5xUhemzx35Q12+cyeQAjYXCC27g7GrhBSBsBEt
   8f9129rl3Bceurr1TD2CzByjPQW9nd7Syev+xIP6ddNOhQsMDuEIBqfVq
   f6OQ5gyTXKkHmO0L7Nze7/jJyvwtKEji9MaNcY0nRAfHACXg8hsFIhEmA
   oCmlXsGIMtljMGka+P4WAZQ9VKcgMdnZzDiFz4fJ4IdBDbpFPGVB3yD/n
   IhoX2q3hYE8JT6Le8L+yUit/AQF78wuSUx/XVJZuS2YwUTKHDHdFIaQkm
   A==;
X-CSE-ConnectionGUID: n5um1cj4Ti6cMXfyFgyjsg==
X-CSE-MsgGUID: 4NOiaoyCRpGfKZYff+ycbA==
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="46932605"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2025 08:28:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 11 Sep 2025 08:27:41 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 11 Sep 2025 08:27:38 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: [PATCH 0/5] drm/microchip: add GFX2D support for SAM9X60 and
 SAM9X75
Date: Thu, 11 Sep 2025 17:26:24 +0200
Message-ID: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACDqwmgC/x3MQQqAIBBA0avErBPSqKirRITYqAM1hUYE4t2Tl
 m/xf4KIgTDCVCUI+FCkkwtkXYHxmh0K2opBNaprRimFueg2HlkcmngnxtXZV22i71uJY9spbQc
 o9RXQ0vuf5yXnDyhGhiZpAAAA
X-Change-ID: 20250911-cpitchen-mainline_gfx2d-6631e9352af7
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2983;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=3W6XSC6jeV7THKrxJGuvK1ZGIYpIhl5o7qaM/qzxjrE=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8ahV8GeO/47dPnJ792h1yb4nDe2I/BByd8pvIaH5R/GX
 hU6ycnbUcrCIMbFICumyHLozdbezOOvHtu9EpWCmcPKBDKEgYtTACZy3pbhD8+J8783u81dnL31
 o8WMbY7Ob9oq57S+9Ai3E1Q8ovdj+lOG/wFb0xauS9E7yLB4kU7i9zgHY+nZAocuFwW/eLde12Z
 HGzcA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_082823_751594_9F94FB35 
X-CRM114-Status: GOOD (  15.14  )
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

Hi all,

This series of patches adds GFX2D support.
The GFX2D is a 2D GPU embedded in some Microchip SoCs such as the
SAM9X60 and SAM9X75.

Patches have been developped on top the 'linux-6.12-mchp' branch of the
https://github.com/linux4microchip/linux.git repository and tested on
mainly on a sam9x75-curiosity board and also on a sam9x60-ek board.

Then patches have been rebased on top of the 'drm-misc-next' branch
of the https://gitlab.freedesktop.org/drm/misc/kernel.git repository
for mainlining.

About the tests, the GFX2D driver was used with the M2D (Multi 2D)
library: https://github.com/linux4sam/libm2d

This is an open source library that abstracts 2D GPUs like the Microchip
GFX2D (and later the Vivante GC520UL), providing graphics applications
of libraries with a unified API, inspired from OpenGL but focused on 2D
GPUs. The libm2d library itself relies on the libdrm library to send
commands to the relevant DRM driver in the Linux kernel.

M2D comes with a m2d_test program to run basic unitary tests.
In addition, libm2d has been integrated to two graphics frameworks:
- EGT: https://github.com/linux4sam/egt
- LVGL: https://github.com/lvgl/lvgl/pull/8729

BR,

Cyrille

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
Cyrille Pitchen (5):
      dt-bindings: gpu: add bindings for the Microchip GFX2D GPU
      drm/microchip: add a driver for the Microchip GFX2D GPU
      ARM: dts: microchip: sam9x60: Add GFX2D GPU
      ARM: dts: microchip: sam9x7: Add GFX2D GPU
      ARM: configs: at91_dt_defconfig: enable GFX2D driver

 .../devicetree/bindings/gpu/microchip,gfx2d.yaml   |   53 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |    9 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |    9 +
 arch/arm/configs/at91_dt_defconfig                 |    1 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/microchip/Kconfig                  |   21 +
 drivers/gpu/drm/microchip/Makefile                 |    8 +
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c         | 1808 ++++++++++++++++++++
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h         |  169 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.c         |  350 ++++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.h         |  132 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.c         |  263 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.h         |   90 +
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c       |  274 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h       |   17 +
 include/uapi/drm/microchip_drm.h                   |  286 ++++
 18 files changed, 3503 insertions(+)
---
base-commit: d2624d90a0b776db468e889cb079ff1d3edaccf3
change-id: 20250911-cpitchen-mainline_gfx2d-6631e9352af7

Best regards,
-- 
Cyrille Pitchen <cyrille.pitchen@microchip.com>


