Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33765CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=; b=VcisBM8rIQL5dDBOhR3QmkBPki
	8qcgJlXAB4HvCib0gZD9JXm9O1iq1UwFTZ8PjeNyKJwOcrP1fwT33SX/XpzVpTtX0G27aJ4edaMlM
	PC0lFXBKVYR/UPX0p6dAvXRnlBtLzstblJOTJm5UFCTZ6nNOl8xeA/PhNaA+T/nvV7jNOhg9s/x9L
	VmgoE5f6eaJzMzDRqpAMOXzNMHSrBlno2K5tcFQw1yX3++hHUcR73HXyPBsaFbURi34zZkldRVZSy
	HhrGUDuaPNWoKh7ZenFB5C6PVeVC3sFGtYyGKlGbHtb92mbpGgXY6laSKsxIyP91Dpr6PXPr/OLmM
	E4RvDqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD5-00000008fHq-0GU7;
	Thu, 01 Oct 2026 11:44:23 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD1-00000008fEF-2dQi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:44:21 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so2497049f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855058; x=1791459858; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=;
        b=Soko79ChnFg/2Vv/lvhmwFKgCTxRxq7zVUbjmzyRkywMK4m6LDI5Pt/yALtnOiR1fR
         Y3IW4uzgAKhHSmZdh7RdDx+thJhffGaAIMBGRvwfUr/84c3TuLA3CtFFoFUGU+LzDXFU
         bJ9FogkA/zifR7Ne57Mz8u7AwsA+J1HvMHCj4Zs+XH+1GgG0sDLBAEp99QOk5kA+hjxE
         GF8L17ExJBEQ4CA4WI16QN4rPf37uPHGEdrGjQ6xVGQUW/VKXjHfP1j6qF9h5SR3toLn
         b7H3KRgemzB4px7SHFxsf/ucDitSDK4z8nNO+3Nixa8e4nyIx4SvWlHYywBenOe4Rc3L
         zxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855058; x=1791459858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=;
        b=e8bi8cndL31kIbkHwBiOOrj57zVk5wsRDKrYlZApTj88FkIqTbBkyl1V5VPuYEQQ9L
         uuPQmZRI0rU8N/Lu8+LIMGU3/gOLCvfPw08VZeVFsOnUjxFn/YVwiDrVlwT6/36ALa1/
         SvsRQtmr+QJ0tYsFOsENUoZKHUQLvHAwNMLLFTlhbZGFkOLQGgR0e83PnV1dQKfr0pAo
         CtDFEUC/j86veIwoRmxLc8jEyhOJg2VKAEJmpGuS3yv0Gj0AwH7O1X95SQ0EJ8g6XbKB
         LX8nvKVpSrHeASWQfqBv//9JZDyMobAryYYHV0CQv6YNInft1a37efMq1kvHw2Zf5yQ/
         rIpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5CEmkjwwcItFySbCgc0pcLR8hikBY3gwL7XLQHD7Ml/RnanRVRt29UvBrDh+q3tlC0Srcx7vgeMlSJLNADLJs@lists.infradead.org
X-Gm-Message-State: AFq9FYI8YEQQ8gZzRKLj/24dncVTm3ocCqb6fo+ViAAnNnuSpBKm4iHv
	FANHXiIt4wMguryACt9i5VNr7dxK7WwFakUtJMXMM1lXacnwoZK2raU3
X-Gm-Gg: AYBFou08CtfIYRwqhlTUghqmwnC/zzc20wp3yaHHpqT/XbtF53JGQ+e5bKSCaOWUTAa
	JynA6zS3vExIUpOQ9+mdR1kqi9OREHjIFdIzeCqiViCEU+RfCbzlsbNJLHLwUVksRsbVuHL2ttl
	QMihO1zpgqJ9h0VK0SZICsLGs0k7eVVvs3iemo1/5FlU9Pllhmp/liErTug/pfDblcCYuZA1DIY
	sLUnCD+O3ouM5DeDe5ilXgiVq1HEEnGCi//Mmqblt9FXYGTU0neypQWhdxLKDzja3BxkqLQnIAX
	LhSfFFI7YKfrk5INCvKygf8SvoujJNWHuQvoVDvAC/hWYELzgR+uhHpUXYTKS5flD0w1dlplHI8
	q/XP8SlE1yBt/B20HqBs1gbNQgiuw1zYdRLKVfJ9nMiunkDW67cO5cqGn94I+Nph++wmt6/t1cU
	+cPpAO1nSPTzrfBonNgK8uKbpizmmDL/5leQ5vDrkbTIjrS6Y72QiL5c55U64jvBkZ3TAbTSech
	377/TvEF6Lh2ROO1lKn1+au1K9mwbWmUAtSHDWcRX9AokuG1/rV/I6+10LTWcy1Y8YqqCJlfEQI
	rp5pgyLq
X-Received: by 2002:a05:6000:230a:b0:48b:515:f94 with SMTP id ffacd0b85a97d-48b05151156mr5639332f8f.51.1790855057900;
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:11 +0200
Subject: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_044419_723011_9ABBF76A 
X-CRM114-Status: GOOD (  14.35  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Toradex boards route the sideband signals of their 24-pin camera
connectors to different GPIO controllers. Camera overlays which name
those controllers directly must therefore be duplicated for each host
board.

Describe reset, power-down, detection and power-control as
connector-local GPIO functions. This lets an accessory overlay remain
independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
remain described separately because the GPIO nexus does not abstract
them.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..27fee3defde7
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Toradex camera connector GPIO nexus
+
+maintainers:
+  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+  - Toradex Linux BSP Team <linux-bsp@toradex.com>
+
+description: |
+  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
+  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
+  This binding describes the sideband signals as a GPIO nexus. The other
+  connector resources remain described by the surrounding board device tree.
+
+  The nexus exposes connector-local GPIO function numbers to camera overlays
+  and maps the functions wired by a carrier board to their GPIO controllers.
+  GPIO specifiers contain a function number followed by standard GPIO flags.
+  A board may omit functions which it does not wire.
+
+  The function numbers are:
+    - 0: Camera reset, connector pin 11
+    - 1: Camera power-down, connector pin 22
+    - 2: Camera identification, connector pin 23
+    - 3: Camera power control, connector pin 24
+
+properties:
+  compatible:
+    const: toradex,camera-connector
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 4
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0
+      - const: 0xffffffff
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    camera-connector {
+        compatible = "toradex,camera-connector";
+        #gpio-cells = <2>;
+        /*
+         * 0: Camera reset, connector pin 11
+         * 1: Camera power-down, connector pin 22
+         * 2: Camera identification, connector pin 23
+         * 3: Camera power control, connector pin 24
+         */
+        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
+                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+    };
+
+...

-- 
2.43.0


