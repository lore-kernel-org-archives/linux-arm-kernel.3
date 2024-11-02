Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D34E67815
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JgUk68zKUc9DMtHCUrZZMvVfkaumU7vHV+v/hTbVrO4=; b=cghvcFUZAdhduGbgRLomP9/CAy
	ipC5udES/ORylAlydIQ89KhGi0PJiQu4XJ2PE7vUMiLI7CrZqqaEIgFj3jjcioOh1Cf8AkLNoJ0Wg
	Vc5lAqc37ApqBy3AHP0f/mhYnyvR9Mi6heRqlP5DLt/MQVLWJDQxO3KG7NaO5Qd4OfQ2DmIF6Q8jr
	/S1JmFva7W9lKVJYSWgAim/JK+fThcFMkDkCssj3+ipFnoS5FFln3wr/9/evBciceGGfnbPsyaXfZ
	SwwKzJ9K/j7g2lhjNsjJPpjg4bK8qyS7BGj+NRfsUxStXhHEG6gYWt7wsMHErlcXtJ23t29VxDw3Q
	qo6LxSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7MPN-0000000AVLI-471Z;
	Sat, 02 Nov 2024 22:15:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7MNg-0000000AV8C-22N2;
	Sat, 02 Nov 2024 22:14:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5cec93719ccso1146655a12.2;
        Sat, 02 Nov 2024 15:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730585641; x=1731190441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgUk68zKUc9DMtHCUrZZMvVfkaumU7vHV+v/hTbVrO4=;
        b=IVTS5A5Hki4A9CSSnqHcUOYrKH9s/Zcoh22r8ZfIHglHlUF7ViPu0FslAyuta3gdxc
         EAHxI2KYIlYyQGB4vOztNWiYVW+AcCTtvd12/Y6K/ruraTjlzbn2JKTNJ6jQZDEBaNLr
         8NRV03IVZG2WBs65aCnPLvRqOhB6y4kfQtNGG16knV8/ImiHfhHv+LlQAn5SmyWhpowA
         dXOvuFxvE1q/JYtrIKrRNotMqq/XB9DLgb6UoVp0y86EUhl9VVbw1SgXdMaUTpPMXRGG
         hpUDwljvQu18aUNMQGtCClgBxiRBu0v0aWRhn+y8rMUSE3iwP5JRarOZJodOWS0Ad+vg
         lFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730585641; x=1731190441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgUk68zKUc9DMtHCUrZZMvVfkaumU7vHV+v/hTbVrO4=;
        b=ehT015TSExAjrBat7DSSzSttAsSBbumOES+GFyWkYP8RKbD4w8O/yxLF3V1mA8RBSe
         QrabUF4Eszoq4SbHE6/4ZnLtGZj+FiSh6c4MsaRIAu32xHCGLJ6KHkvFg7ya/xW3T14k
         a6qQ94f43ovUPvt/mmR/g88VDV/VO6nfugjP+ZchxAYXeqFtUBRxZuBwiTzXOnM+QTny
         1WUnSIpON6w00w2U+KyUo0OWbOXbF2MreZKirVbFmjrA3V2mIbTy5UJviqdg0DID2/u1
         BhNQh4vkG4BJ/sYYiYROAllRG2n4LIqJQtV36HM9IIeBGAoOfQ0QGm3Fgw6Ptfoup5fQ
         Kh7g==
X-Forwarded-Encrypted: i=1; AJvYcCUuB9W5f/a3Yi3qSZUQZzFg/yRLM5grquNPt+P745iH7sJb+ZfyOoohi2BHefqm0ZoTyUeILJkWmYjw5GG1Ezfh@lists.infradead.org
X-Gm-Message-State: AOJu0YzEcoD0WJ+N8Qt6jWV/IKCYgLwzXHgSuQvCyzaaXFUvqy/CLSod
	3dxOSk3t2joPyXkvfIcxPtA3NbMW1j/yg0yBsC6zJzH8vSZ55So1
X-Google-Smtp-Source: AGHT+IEOBLX2j2HWuv+pdDU0ZxYrPZnIuxih08kkbFQFADGWXklj0YmOwIp0s2aG0SM4rtdzkYs0fA==
X-Received: by 2002:a05:6402:5242:b0:5c8:8bde:a1d3 with SMTP id 4fb4d7f45d1cf-5cd54af0e79mr10242172a12.22.1730585640884;
        Sat, 02 Nov 2024 15:14:00 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac74ccfdsm2824475a12.11.2024.11.02.15.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 15:14:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-actions@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: timer: actions,owl-timer: convert to YAML
Date: Sun,  3 Nov 2024 00:13:04 +0200
Message-ID: <20241102221354.2856900-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_151404_552255_EAF75DD0 
X-CRM114-Status: GOOD (  18.75  )
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

Convert the Actions Semi Owl timer bindings to DT schema.

Changes during conversion:
 - Rename file to match compatible
 - Add a description
 - Make "clocks" a required property, since the driver searches for it
 - Correct the given example according to owl-s500.dtsi

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/timer/actions,owl-timer.txt      | 21 ------
 .../bindings/timer/actions,owl-timer.yaml     | 71 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 72 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/actions,owl-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/actions,owl-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
deleted file mode 100644
index 977054f87..000000000
--- a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Actions Semi Owl Timer
-
-Required properties:
-- compatible      :  "actions,s500-timer" for S500
-                     "actions,s700-timer" for S700
-                     "actions,s900-timer" for S900
-- reg             :  Offset and length of the register set for the device.
-- interrupts      :  Should contain the interrupts.
-- interrupt-names :  Valid names are: "2hz0", "2hz1",
-                                      "timer0", "timer1", "timer2", "timer3"
-                     See ../resource-names.txt
-
-Example:
-
-		timer@b0168000 {
-			compatible = "actions,s500-timer";
-			reg = <0xb0168000 0x100>;
-			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "timer0", "timer1";
-		};
diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml b/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
new file mode 100644
index 000000000..ed50b4753
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/actions,owl-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl timer
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+description: |
+  Actions Semi Owl SoCs provide 32bit and 2Hz timers.
+  The 32bit timers support dynamic irq, as well as one-shot mode.
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-timer
+      - actions,s700-timer
+      - actions,s900-timer
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - 2hz0
+        - 2hz1
+        - timer0
+        - timer1
+        - timer2
+        - timer3
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - interrupts
+  - interrupt-names
+  - reg
+
+additionalProperties: false
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      timer@b0168000 {
+        compatible = "actions,s500-timer";
+        reg = <0xb0168000 0x100>;
+        clocks = <&hosc>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "2hz0", "2hz1", "timer0", "timer1";
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f34d168b..76ea65128 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2024,7 +2024,7 @@ F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 F:	Documentation/devicetree/bindings/net/actions,owl-emac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,*
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
-F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
+F:	Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
 F:	arch/arm/boot/dts/actions/
 F:	arch/arm/mach-actions/
 F:	arch/arm64/boot/dts/actions/
-- 
2.43.0


