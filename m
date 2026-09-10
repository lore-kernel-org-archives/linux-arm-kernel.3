Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E011C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=; b=E5lRudOQ0QlEtWynIB+02nCQu0
	4aLeEG1xhgcF0hN5R9GS2fBN3wOkqg/ZvkWKJNOiSC3T8y5wurT8nqL2MpssO9KgPdAtairscXrAZ
	c8u5litpDQj/9eHUjZPrfauzYL8ZqB5nYzYava/iludRhPF1KOXAph/jtVCkVnhLVA3ScxNhfatU0
	JbN1CVpbeYAUNSLVUk06KwtOy6P+9wfVMLHif4FGaMBlDaK4ekm5MgYe8qwlJgS4wkOwUR3QgbUtN
	+zdGFrxBR9v6hs+pVgnjsC9QYoDVled88l1meQp002iMTTNBVB7K7Jfq4KOovvj5rwwzsipk+Lzkq
	KP0CkUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqu-0000000EolC-3872;
	Thu, 10 Sep 2026 15:38:16 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqo-0000000EogB-3ImQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:38:12 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so13003065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054688; x=1789659488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=MPncWRnex0fpIcQcmuqXYAySlL0ZxVJ4ScFYk8cBiTisSY3VRHfEN778PnobF09Sjt
         sw2BCRQgzwGK4KfIbuBMwv21ydsXn2Jx5YSxpTc4gw3TBYEtqOigQMMgyfmVeX7k7Ien
         g5TRAPtZcqmfwQGOLI444DCkNNmOJIliKadz5NN50egaGOGVXc0IFqJ0zydxUJwTg2iA
         jQ5TG/OWvY3IR1bAVxU+JjS8zAye02zTa6u8/xrFXOVIdyoGSFq0yBnwfKevZyl5198b
         Om1BpSFCjwz/YEf8qWnIN3yavFpDlJ1xFPjk4IbTVGZGw6nsL+7r36fRQ0t49nugfYvG
         Pprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054688; x=1789659488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=pOaDuqFI23mNqHRT5IKgxn8NAHACiWMIECQ2GduW36Eoyx0cdHQlkkECK/AOu689lQ
         iKFyrjG2MSxqDyOjglxQCRzimDVniKTjYUbaYmBP4FVKdzku0FTPhRNwXxxoOmvEuIo8
         KqD0Fz0qFPU+GYXeJMp6m8iVo8RluBwEsjh/FGuV+kXfooMGJNHsSg5IU26dGxOaR4jx
         wql8DP65e3ywlsHe71jujuf/yCMrtrxmM5VAL0bsgIX0DghBSBqo3sf/hZPyMkNvSRv2
         urEqf+xrMatoCsaBAc+8U9Cl4ojl4r4WGs+/dr2GnrFmjXkN+8GvE7OkruhZiGudmupz
         EzWQ==
X-Forwarded-Encrypted: i=1; AKwUvBynfihrLSL848w48zgIIZojjZcWDPDopEv/ACD6VvrujPZ1L48MnBJ6xN2mcqbFs3bu2X3VOJiNP+/0hOF9OF6J@lists.infradead.org
X-Gm-Message-State: AFuF++lelMTvKw9Sff1MXDixlEeRMcIumx2Zu/fdjFpXrlw9Ad9RXDkv
	ycvQOsjR7lc7aC3iSnfHsCzLbOLt/FWMW+c5YGd1qFswCE0tlh/QmBBw
X-Gm-Gg: AYBFou0t7uEvNu8RDlr02GA1q11ik5i5M68gr3ZXHTbvJx7AIPqngTHl7EkLURNIt3p
	k1OlPvF4cWpUnUSD+RktM6a51ZqMdvDKfwXGWgF9ZXTnsh99+SF1cIx6OTD8yFw+MoBpdhhfHB4
	yCKHSHBOdAInbK2B9w2pWEm8g4jeKfEPWfEq/d5v3QEMqIKjAyC5vDY+yG36CbL5iRTnRGSGB2j
	0B/VZEtVgBp/dNLz73bS98F5lXWJI/QaR/GLyi2S3sTdtpXjgYzVDGyBbCWl0pAxhLBQ+V9zC04
	ZFKstDmLucAEj49GV3V/2aCYwqDdcGK2ntaCj+RI8tgpImNdpYHOzVUViADiO+pBTfidcHgux7e
	8gaLUMrWEg20tuH0iwXZeIAlrr9EPpu+Ex8dX9BKAkDtHW6oY0RlJhRNMD2TUBca2HqUUSkh0Gm
	GaRfPOfpnSckCzs4t3/8iFCRLGS+NwX1EfX63YQFZdGyj7qYvmGivsWZoxu4jVU7F8bOKXu+bji
	5us+dC64EvkxdkzVWKiDeaHqi1gLo/H8mo1/zrcBwK+80GkVC2gEM87w7pgJCSmcwDCD0cRHQ==
X-Received: by 2002:a05:600c:8b43:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49d258cda6bmr82799305e9.3.1789054688174;
        Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:59 +0200
Subject: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_083810_849761_02121D39 
X-CRM114-Status: GOOD (  14.82  )
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
 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..06e6836e1aa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,86 @@
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
+  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
+  clock, power, and sideband GPIO signals. This binding describes the sideband
+  signals as a GPIO nexus. The other connector resources remain described by
+  the surrounding board device tree.
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
+    gpio1: gpio-controller {
+        #gpio-cells = <2>;
+        gpio-controller;
+    };
+
+...

-- 
2.43.0


