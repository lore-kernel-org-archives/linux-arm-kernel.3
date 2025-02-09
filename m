Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85DDC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 19:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnfikQj+cO+pQe9Nk0x415AfEpn0bOEO6YNLNMXzml4=; b=EXFU1FwDNCmeZB2RAF62muCPi2
	4RhRIzZHh/ljpz9/P0vhSwh0tJrSxxJ6gBZW0T52rm8PJd1RO2MarehC1rO04iWmOZKw47XJ+HtZM
	6ph6CpnMBRTtlJ8kkJ6HR1rdzsJ5tays0QYfBingDQ16LICUl/e662wrm8Jssgu9SzvVPEAOp76Xb
	RMgimAOvxTlILdgIO7ftrRCCxSfES9tbBLeAcwL4duiA1qMTVskntR+Em0qbfQzSSAx7kT2eknFNC
	Gef0ZKSQWO434HT+9JVRGP1geA7amnQxa3GBa6qaGYcRu0I3tvdu7S0rpRMGyB6BmHPAFPKBlKok0
	FV+lnpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thDQR-0000000FRtJ-2S0V;
	Sun, 09 Feb 2025 19:57:07 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thDP1-0000000FRj8-1sNy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 19:55:41 +0000
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4B8361665ED;
	Sun,  9 Feb 2025 20:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1739130934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EnfikQj+cO+pQe9Nk0x415AfEpn0bOEO6YNLNMXzml4=;
	b=NsbGowfibh1kS5vpgSpoS3EYJTbdXJnghxiC/JC1mDrChP17bdqvz7x5oafwp5HH8PWFLQ
	I7NHbacKX8Vm6fNDfVTjvN3MM9oR7qiqxjIfWDGJ1fHWKFM7LmQ5AAed+42i0woUJlXmJV
	X4s8sLx2uyP5vZiBJL48wDZLBFnKRCI=
From: David Heidelberg <david@ixit.cz>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ramesh Shanmugasundaram <rashanmu@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg <david@ixit.cz>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: dt-bindings: media: i2c: align filenames format with standard
Date: Sun,  9 Feb 2025 20:53:43 +0100
Message-ID: <20250209195517.148700-1-david@ixit.cz>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_115539_887698_F7F34E51 
X-CRM114-Status: UNSURE (   9.14  )
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

Append missing vendor and align with other sony definitions.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../media/i2c/{ad5820.txt => adi,ad5820.txt}  |  0
 .../i2c/{adp1653.txt => adi,adp1653.txt}      |  0
 .../i2c/{adv7180.yaml => adi,adv7180.yaml}    |  2 +-
 .../i2c/{adv7343.txt => adi,adv7343.txt}      |  0
 .../i2c/{adv748x.yaml => adi,adv748x.yaml}    |  2 +-
 .../i2c/{adv7604.yaml => adi,adv7604.yaml}    |  2 +-
 .../i2c/{mt9v032.txt => aptina,mt9v032.txt}   |  0
 .../i2c/{max2175.txt => maxim,max2175.txt}    |  0
 .../i2c/{mt9m111.txt => micron,mt9m111.txt}   |  0
 .../i2c/{tda1997x.txt => nxp,tda1997x.txt}    |  0
 .../i2c/{mt9m001.txt => onnn,mt9m001.txt}     |  0
 .../media/i2c/{ov2640.txt => ovti,ov2640.txt} |  0
 .../media/i2c/{ov2659.txt => ovti,ov2659.txt} |  0
 .../media/i2c/{ov7670.txt => ovti,ov7670.txt} |  0
 .../media/i2c/{ov7740.txt => ovti,ov7740.txt} |  0
 .../media/i2c/{ov9650.txt => ovti,ov9650.txt} |  0
 .../i2c/{imx219.yaml => sony,imx219.yaml}     |  2 +-
 .../media/i2c/{ths8200.txt => ti,ths8200.txt} |  0
 .../media/i2c/{tvp514x.txt => ti,tvp514x.txt} |  0
 .../media/i2c/{tvp5150.txt => ti,tvp5150.txt} |  0
 .../media/i2c/{tvp7002.txt => ti,tvp7002.txt} |  0
 .../{tc358743.txt => toshiba,tc358743.txt}    |  0
 MAINTAINERS                                   | 22 +++++++++++--------
 23 files changed, 17 insertions(+), 13 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{ad5820.txt => adi,ad5820.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adp1653.txt => adi,adp1653.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7180.yaml => adi,adv7180.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7343.txt => adi,adv7343.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adv748x.yaml => adi,adv748x.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7604.yaml => adi,adv7604.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9v032.txt => aptina,mt9v032.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{max2175.txt => maxim,max2175.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9m111.txt => micron,mt9m111.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tda1997x.txt => nxp,tda1997x.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9m001.txt => onnn,mt9m001.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov2640.txt => ovti,ov2640.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov2659.txt => ovti,ov2659.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov7670.txt => ovti,ov7670.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov7740.txt => ovti,ov7740.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov9650.txt => ovti,ov9650.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)
 rename Documentation/devicetree/bindings/media/i2c/{ths8200.txt => ti,ths8200.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp514x.txt => ti,tvp514x.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp5150.txt => ti,tvp5150.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp7002.txt => ti,tvp7002.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tc358743.txt => toshiba,tc358743.txt} (100%)

diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ad5820.txt
rename to Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/adp1653.txt b/Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/adp1653.txt
rename to Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/i2c/adv7180.yaml
rename to Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
index 4371a0ef27617..4636ad601c3ee 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/adv7180.yaml#
+$id: http://devicetree.org/schemas/media/i2c/adi,adv7180.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADV7180 analog video decoder family
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7343.txt b/Documentation/devicetree/bindings/media/i2c/adi,adv7343.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/adv7343.txt
rename to Documentation/devicetree/bindings/media/i2c/adi,adv7343.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/i2c/adv748x.yaml
rename to Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
index d6353081402be..254987350321b 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
+$id: http://devicetree.org/schemas/media/i2c/adi,adv748x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADV748X video decoder with HDMI receiver
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/i2c/adv7604.yaml
rename to Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
index 7589d377c6864..6c403003cdda1 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
+$id: http://devicetree.org/schemas/media/i2c/adi,adv7604.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADV7604/10/11/12 video decoder with HDMI receiver
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9v032.txt b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/mt9v032.txt
rename to Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/max2175.txt b/Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/max2175.txt
rename to Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m111.txt b/Documentation/devicetree/bindings/media/i2c/micron,mt9m111.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/mt9m111.txt
rename to Documentation/devicetree/bindings/media/i2c/micron,mt9m111.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tda1997x.txt b/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tda1997x.txt
rename to Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m001.txt b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m001.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/mt9m001.txt
rename to Documentation/devicetree/bindings/media/i2c/onnn,mt9m001.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov2640.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2640.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov2640.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov2640.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov2659.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov7670.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov7670.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov7740.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov7740.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov9650.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov9650.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 07d088cf66e0b..8b23e5fc6a24f 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
diff --git a/Documentation/devicetree/bindings/media/i2c/ths8200.txt b/Documentation/devicetree/bindings/media/i2c/ti,ths8200.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ths8200.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,ths8200.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tvp514x.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tvp5150.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp7002.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tvp7002.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,tvp7002.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tc358743.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tc358743.txt
rename to Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index df1ecd2c7c3d3..9951eddae74b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -527,6 +527,7 @@ ADP1653 FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
 F:	drivers/media/i2c/adp1653.c
 F:	include/media/i2c/adp1653.h
 
@@ -1545,14 +1546,14 @@ M:	Lars-Peter Clausen <lars@metafoo.de>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
-F:	Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+F:	Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
 F:	drivers/media/i2c/adv7180.c
 
 ANALOG DEVICES INC ADV748X DRIVER
 M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/adv748x.yaml
+F:	Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
 F:	drivers/media/i2c/adv748x/*
 
 ANALOG DEVICES INC ADV7511 DRIVER
@@ -1565,7 +1566,7 @@ ANALOG DEVICES INC ADV7604 DRIVER
 M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+F:	Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
 F:	drivers/media/i2c/adv7604*
 
 ANALOG DEVICES INC ADV7842 DRIVER
@@ -14158,7 +14159,7 @@ M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/max2175.txt
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
 F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
@@ -16160,7 +16161,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/mt9v032.txt
+F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
 F:	drivers/media/i2c/mt9v032.c
 F:	include/media/i2c/mt9v032.h
 
@@ -16790,6 +16791,7 @@ M:	Pavel Machek <pavel@ucw.cz>
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
 F:	drivers/media/i2c/ad5820.c
 F:	drivers/media/i2c/et8ek8
 
@@ -17525,7 +17527,7 @@ OMNIVISION OV7740 SENSOR DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
 F:	drivers/media/i2c/ov7740.c
 
 OMNIVISION OV8856 SENSOR DRIVER
@@ -17566,7 +17568,7 @@ R:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/ov9650.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
 F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
@@ -17768,6 +17770,7 @@ S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
 F:	drivers/media/i2c/ov2659.c
 F:	include/media/i2c/ov2659.h
 
@@ -21992,7 +21995,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
@@ -23131,6 +23134,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
+F:	Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
 F:	drivers/media/i2c/tda1997x.*
 
 TDA827x MEDIA DRIVER
@@ -23967,7 +23971,7 @@ TOSHIBA TC358743 DRIVER
 M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
+F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
-- 
2.47.2


