Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B078C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=; b=n29syeTEf/Nqte5P6UFn3eqXiJ
	NWCJj+hFZ3JXBsDBpAJoUC96IBO8b26VIcHhVivTJ1FbrbNHaqHx4i+GwjMsmrY4X35Ewtl3coUS5
	qUMRXiBPjMJ9Ia365JzERIbIHoRLnZ+j9ZVuqQ6aT6wPqIfVmEZBI0MgqZZq4K1wIP0QlZYahQeOZ
	wLbNhTnzbfIZiOKI5xONDNEyz5Lt19VTpgvdE39EkLOZQYkrKsT30HVikZo+INTAtLE4lMHNB96KM
	mfFLcSYNn9cdL/lc/arcM9HW/sBpj07sHaLwel6TwpeK1Gc2EjVSxlZ+I/lAi0TcU9j/AaiAE5vAR
	6erIv6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz8N-0000000H1yX-0KwX;
	Sat, 08 Mar 2025 18:42:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0X-0000000H09V-2uLy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac256f4b3ecso300925066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458884; x=1742063684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=;
        b=A3XPKvV5Cf71ZvFZsP6eQb7iUWBwHcHsbuvjk106wUi9VJarTTPEgy8Y5+3VqbpIvb
         4ueMcVt1rpH7rYMZPARrN7kl3WUc6TuZMX7Rz/pGAgxc2jyRuKA0YQ/n78ALCPG60yao
         P+F2T2wVbKc6wZfIO30945FRy0o+v2BE1bSgf5oxGz3uP2GqXCt+pbA/DJsky4PvGVWX
         Pun8Ea3cvwhRej1Hui4O8DHAV3wflRsQQOUDhaoHaV8dVtRz4FXel5GpYK+7WoJ3Ywhp
         a0U6Ug31/ZV27c6Tp60En9W5YKGfY+wad250wayfxzLKaOsxlajvzhwyP0HN+xcWxOTp
         HNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458884; x=1742063684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=;
        b=NE5xO2CCRoXg7w3bY5q40BSvX/oJS9F3Wjj/ZqESjzXiflBUXCEWH1H27w7MCkeO9u
         snPZdA0CBT3c/F7KUpgNBXkDSkFUSLBu+1g6FjLwcr1CT+3Z4E28moGFcQc/7g33YvaP
         22P50jd/zoR9UsmKW8iDVuxka19EoSSDZTJjQJRLcVeEPYYfr5vZsW1l2q/7IRd0V1Ti
         JeCtdtP4Qfgl8Cic7XIJsYrvaXTO1M/hR/eBs9Z1UyZRogVgnUHym4Af+KiBScPqaiM0
         N8ci4kdDYtWjcE78vPtPml4TD94s0H1K9Bnp7Tg6PO+rru7c2mPTJd3Wj6rHxEhgNOMa
         xdmA==
X-Forwarded-Encrypted: i=1; AJvYcCU2JrnT7JVEIK5VNVk23QLQ0nPUDB0gae7Z2uzc97q6lGtPnjaSHZsMFFc3uUWr61FKM7SxSbUKQx1B6gYxCjnI@lists.infradead.org
X-Gm-Message-State: AOJu0YxIHaMNXPYUZ6g5bFGVRUZBOr70JsHOG5j8wxzzNAxOoROFdhGe
	tgzsR+qvegYYFgXJdgv/lDZ1aJfz9urmUqFrvq1KLeJRLsqs98Op
X-Gm-Gg: ASbGncvBIpSs6zmG/UXOyHBnYpxOVvr/Yn9hYvEnzDYgQhrDi6UWoqk3lq96/ZKCAzf
	efyp2Dt6e5EyvE5CTMrE9MKfaGubB30IzxFL6zw+Ax7eGV4ei1WLwFNgBzCrilyZC26Z7iDqESf
	yOFfmFE/4BjzcujpaECZ3j4GS8JVVn616hnRMIJ8pOAwGeRA3q50s3fZf/cRkqLqFFenq4M7stQ
	Mq2K5RKHSZqDemK6SrNyMvnG2LLcAKB2eduWSeZYpTFOS27WAhjplXS6fusAveGZbtfTGcX5kAZ
	y3eOi8BD3Y+/amaK1kXIFNA7mcJqnuBuno+uxNH2+EpGf/ZHsKd4p1W8+A==
X-Google-Smtp-Source: AGHT+IFNSueh0kjG5Dw4oKrSBt0pxkCJRfwG8SDYdVUY+KWspoiw5fa0VzHeIZu860SzagBERe1Ohw==
X-Received: by 2002:a17:907:a4c7:b0:abf:6f95:22fc with SMTP id a640c23a62f3a-ac26cc768f8mr411691166b.28.1741458883641;
        Sat, 08 Mar 2025 10:34:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Sat,  8 Mar 2025 20:33:33 +0200
Message-ID: <20250308183410.3013996-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103445_735916_BAE3E1D7 
X-CRM114-Status: GOOD (  17.58  )
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

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../media/i2c/maxim,max96717-pinctrl.yaml     | 71 +++++++++++++++++++
 .../bindings/media/i2c/maxim,max96717.yaml    | 16 ++++-
 MAINTAINERS                                   |  1 +
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
new file mode 100644
index 000000000000..9480d3127643
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Analog Devices Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim GMSL2 Serializer Pinctrl
+
+maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
+
+allOf:
+  - $ref: /schemas/pinctrl/pincfg-node.yaml#
+  - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  function: true
+  pins: true
+  drive-open-drain: true
+  drive-push-pull: true
+  bias-disable: true
+  bias-pull-up: true
+  bias-pull-down: true
+  output-disable: true
+  output-enable: true
+  output-low: true
+  output-high: true
+  slew-rate: true
+  input-enable: true
+
+  maxim,jitter-compensation:
+    type: boolean
+    description: Enables jitter compensation.
+
+  maxim,gmsl-tx:
+    type: boolean
+    description: Enable transmitting pin value to GMSL link.
+
+  maxim,gmsl-rx:
+    type: boolean
+    description: Enable receiving pin value from GMSL link.
+
+  maxim,gmsl-tx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while transmitting value to GMSL link.
+      Default value matches the pin number.
+    min: 0
+    max: 31
+
+  maxim,gmsl-rx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while receiving value from GMSL link.
+      Default value matches the pin number.
+    min: 0
+    max: 31
+
+  maxim,rclkout-clock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Clock value.
+      0 - XTAL / 1 = 25MHz
+      1 - XTAL / 2 = 12.5MHz
+      2 - XTAL / 4 = 6.25MHz
+      3 - Reference PLL output
+    min: 0
+    max: 3
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 7d77cc9dcd96..20114c252e01 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -88,7 +88,21 @@ required:
   - reg
   - ports
 
-additionalProperties: false
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+
+      unevaluatedProperties: false
+
+    - type: object
+      additionalProperties:
+        type: object
+        allOf:
+          - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+
+        unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/i2c/i2c-atr.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 8f463ebca056..f8ffb7cff9c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14201,6 +14201,7 @@ M:	Julien Massot <julien.massot@collabora.com>
 M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
 F:	drivers/media/i2c/max96717.c
 
-- 
2.48.1


