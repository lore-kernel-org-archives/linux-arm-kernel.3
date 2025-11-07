Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AE4CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzaa9BMZZ9jLpC9lScxxEevDvh6b6Ryte1oOB44LidE=; b=qRmEzC3+QvBkVgO/uF4Jb+lwX+
	ez1Gy+2uaO7Fu9DcgXLZ2biQDYk3BWObJ8QndTHBo+BiGYH3uiyjVAJDHgqWftopImF7xRRPW3p8K
	sedyRNTeRxcurof17ZJJUKkx5h0KgJl7+as9cl8X2hoDjz7ITbgwLaWR094Obi0Khzr3ZKfd4O9So
	ZtU62yFy/7QKWdoy4RAUb57RtiUByI/qWFc37+tGIPtu0hyOQJ17QRlMPjG4CHlaN+4ybem+po3/B
	vCLffjzDf/gWn2wWy/8IBYV7aZbPC2FU5sR/ZRs5B+V6p1yUiwdeduzN9PmhwLIgPXqdftdRPQUe2
	o8RYyukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvs-0000000038M-1D9s;
	Fri, 07 Nov 2025 16:03:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvo-0000000033N-05fY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:03:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so539429f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762531398; x=1763136198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzaa9BMZZ9jLpC9lScxxEevDvh6b6Ryte1oOB44LidE=;
        b=CNPyTVxKx8NnC84BOasMNfnG6XGNW0fpLMKqo04qiYPbDw3ih1x12YL8cymYWN4mo6
         tl6C8V5zxZjo1P+Sk9mYhl8IsK43ZHR+gNIAFUtn6+G4x7PHFGXP6ybKN2cBVo0aVGBQ
         y6NoiNqKp1MLO2S/RHOm4TYZystbe2wyjqGaI6aakztPssLSUeOWJHhba5yjSnU+nRXx
         8lhDU+Eyczw9zTb5aIIRcjK+DSyaO4WixW8VzfIkEWAcgk3hY8EUyUHc36IzlO5hzzEH
         HhaMZV4tqZqfKM/fXeOQW93oCJWOo1l375qPpvNPIxUB75mc9mxssTz5EJH5dLlThJxv
         KBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531398; x=1763136198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzaa9BMZZ9jLpC9lScxxEevDvh6b6Ryte1oOB44LidE=;
        b=C4PuQXgls58i38vfYD8648Wfbo/WXEjcIc4NX2wYccp8DPowACScbuoYQcPpv0fzZh
         Iz4Q3uIcWw7YcpfkiAGtX176j5DATPMvuay5q7vwVXEmJlZRYxryejnt/xxs2zx/Nh4s
         3KDoijykBhtI9WbpQ4npewasQxc1rymqThD2t8qYQEOpreB6je7/6MbQ2aq2GOWOpJVO
         ZtB2z0L8DCRX5H65baNxxSOrdocd6mxyT4hm5GSv/NDt2gPicEbEKtYwRYH0rJ4eXOfK
         g/GwtktTTuLEvX81nu3Yh0YHXmi3BMabGno23e8PjVvF1Aq65ZGeHK/Tx95+CD12cTd9
         JoRg==
X-Forwarded-Encrypted: i=1; AJvYcCXCmLAu6oJFgnJeNjIbSgBG4+FPhPUqA0heUYlGRxrY2UYCGHctN3oj6LEAN0A4FiE14Ixbfr0VHoMdkrzRIYYc@lists.infradead.org
X-Gm-Message-State: AOJu0YyYRNC8SGvSseGVl6u2s86W0RnWDp53Wn0cYmy/fPE6mp5trMk8
	6psH1Syi/MshcRM9/McW5gHrtdZOZdkpRbYKR+R7WBNYAnwAGtw8sN3K
X-Gm-Gg: ASbGncuhZwbv0XjNZHDP3F3F/wFVrlEYM/TWoWiQBXSXM6CX9jpS8qQm6v+PJo1ihLU
	cLmQjJ/aIJyNQsyFpec84ZwkxPuFhbYLrtI6nRyy26FlIfPGo2Vy131U02EwE+yvOIAIOT3e7t1
	GV10MAHGx/nhWeqzkZi513N9j2s+JwRyaKn5hD1N2PbbCCUsceBDH8JfzOJ18tYIV451PEGYiKW
	EBFrcYwTZYfszN2s3/4vMgPnYTSHHjvsVxHWl1f/boKFvBvGOTL5CYyIbdsecEd58o811bVWJiS
	x+m/kS4i0aeohBYttuMFa+PbTwUs3EuUowj+SoeOvlQk3GmdKdhy/MqDvV1wykTKCiBH2+SquqP
	s9oGURh5uytPB7CKc+W7HD3fU0Kv4NJ57FXc+esPJCRl4KmGXBsv5t6aE9Z9m3gqPD7s5rAiMZo
	9wv+EZdqPVKtDKb3AMidrnFCX2IHj0Zg==
X-Google-Smtp-Source: AGHT+IGdev4kxanwwHINTFxMNLbZq8tVFAx4f+6eN5jOnIKPA3pJTeCx/EUTxYzn8RJNEOu19VtFkA==
X-Received: by 2002:a05:6000:4403:b0:429:d528:649f with SMTP id ffacd0b85a97d-42adc689675mr2303523f8f.2.1762531398016;
        Fri, 07 Nov 2025 08:03:18 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm6058016f8f.19.2025.11.07.08.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:03:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Fri,  7 Nov 2025 17:02:44 +0100
Message-ID: <20251107160251.2307088-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107160251.2307088-1-ansuelsmth@gmail.com>
References: <20251107160251.2307088-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080320_095693_0226F3EE 
X-CRM114-Status: GOOD (  20.19  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, the
"airoha,usb3-serdes" property is required. This can be either
AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 and is used to identify
what modes support the PHY and what register to use to setup the
requested mode.

The first USB port on the SoC can be both used for USB 3.0 operation or
Ethernet (HSGMII).
The second USB port on the SoC can be both used for USB 3.0 operation or
for an additional PCIe line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 71 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..ec467fb7f971
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  The first USB port on the SoC can be both used for USB 3.0 operation or
+  Ethernet (HSGMII).
+  The second USB port on the SoC can be both used for USB 3.0 operation or
+  for an additional PCIe line.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  airoha,usb3-serdes:
+    description: Describe what Serdes line is attached to the USB 3.0 port.
+      Can be either AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 as
+      defined in dt-bindings/soc/airoha,scu-ssr.h
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - airoha,usb3-serdes
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        airoha,usb3-serdes = <AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 3d599e8b8b00..8c152daa8f8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -763,6 +763,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.51.0


