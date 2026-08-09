Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA67C5B561
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/aJNXd5iDqqUVOKcqvYAIw9gUc8jDzB8J6Vs26BoSk=; b=ngnPpITGkuLpFxKt3PMS7xFoV/
	5pP6Aqpsau8+cuQ22MIrjfYFXC8nqsf0Vloen7fZqI6LElgnLDukPmGEhPiecdVtgCFG4rPwKeqSG
	ZqOiZknEAWTxWQcWwFzrPeD8hHBg8vyCRQVSppPmFXAneW/2ZIpKRP5a6tXUarK4p8IoFLqtXGWke
	pjs6tSyMsGpO1VwaV9jck40qfl7VyAmy4MMEyM6yI4vVAC6xSkxHG+ejAGYDDw2VtDyQ20Rvozz4r
	YcWn9HQ4yxzjH5/7azIbCDawS1j9QfAaUr6zb8m8LHRbNfZPgWpjyMa6yhpfugdN+LHETiDOfajFM
	t119yMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9iA-0000000Ad9E-2aEU;
	Sun, 09 Aug 2026 20:01:34 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9i6-0000000Ad8T-3bTX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:01:32 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hJ80P08sHzMlLw;
	Sun, 09 Aug 2026 22:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786305685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3/aJNXd5iDqqUVOKcqvYAIw9gUc8jDzB8J6Vs26BoSk=;
	b=FH6fVflXoiKVMDU3Wd/7cH/DhvOhZ3xvNIC3c98Ag9ZCZ0KZ6ZspUYuGWFnKSYis0jTG+G
	sRabeijQSMmkWNSfWUDBQdWzUilncHoZ1XIzC7PymXIqr9HRBEkZTf+uSjd0kelbnMC/qV
	6iyZ3eF9BsDeYGT05o62XxHfUomiT/g1D8AnSmxH1Gw4YK4yYxxpX/61V/mivmKBpMMT1H
	cJgs1WbdFq0OBKh1M7XfgOQWjYPxzm6ajZQQHBh3F61UrWDaj3rkMfNKbRw/HnN1EigLoN
	ZqSxP+ldJl7dB0LqfUNG1HKA5HPIcoVynLCVWc3RSwaYoo2xST7rm8IY5RQJ8w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786305682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3/aJNXd5iDqqUVOKcqvYAIw9gUc8jDzB8J6Vs26BoSk=;
	b=bLKWRklclBd8qGNWZnRG7ysp/AXyzosTxeEYQUDpwQGXFqkqHgzoDU0NFP4scYRvS6N6Pw
	J46t/CU9EVktvCKL4aVk0L5s0JdMkOF4tgM9uAXB+pc2Ldk7/GVtf7HExNka2GujRtHM+V
	kLLtgHk6GrwrDdjsFw818yyouusEdM8OOyCFaFbDAo+rzoJ88sT/Xh62sPcp2bSd2zhyD0
	K4bbeyiCVwMM6rQpkpT4VnOQ1WDJxhDOGTuJqRIXk3EdQUbDnfOLNBMe9VVwngRGak0iHO
	kIrQv/eW67QwRNO93C8KuiThyueRddxsuBZ78aRXSSvi2wRZ9sgHkQw5SzEzQA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspberry Pi Touch Display 2
Date: Sun,  9 Aug 2026 21:58:50 +0200
Message-ID: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bcdshhh6iepxtnuym8nqaznyoitcnpj4
X-MBO-RS-ID: e4fbaba2bfd9eafd12a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_130131_047246_F0A8C57E 
X-CRM114-Status: GOOD (  11.59  )
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

Document the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD panel.
The panel is based on the Ilitek ILI79600A controller.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../display/panel/ilitek,ili79600a.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
new file mode 100644
index 0000000000000..0a3baffef293e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili79600a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI79600A based MIPI-DSI panels
+
+maintainers:
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - raspberrypi,dsi-10inch
+      - const: ilitek,ili79600a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel used by the panel
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for the enable pin
+
+  avdd-supply:
+    description: Positive analog voltage supply (AVDD)
+
+  avee-supply:
+    description: Negative analog voltage supply (AVEE)
+
+  pp1800-supply:
+    description: 1.8V logic voltage supply
+
+  pp3300-supply:
+    description: 3.3V logic voltage supply
+
+  backlight: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "raspberrypi,dsi-10inch", "ilitek,ili79600a";
+            reg = <0>;
+            avdd-supply = <&reg_display>;
+            backlight = <&pwm_bl>;
+        };
+    };
-- 
2.53.0


