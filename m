Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BE9C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=; b=y1WobOebW+VMjN5lY/mjr6o9Ua
	eHeBGhj85TNO7QpHMSXd39/D7mzH6DkhTW7WR7m4CAW22kYdVh4Qk5V2s0NkZ3O7sjHgbNe4QUBbT
	Zvw0EUbuugNnF3rk17MzrrhjNsehGbHNUl5ZBIniBmYPw6VYjldAGZOTMNLkSKFawGKgI1eBj8OFA
	HSn4UgNPNc+WlFjBGxY1J+lTgFCc9L0db05irmcZVReVX1xl+5nMSEbwhm5kQb1PASDPEmMPjmznS
	nZd0/Lbig9pMZJ6SebNZhYYoHk3nO7e/o4p//bnbC5RwYq5H+Ae/dROcfdJn2Evf44BNiQPS31w6G
	NnUIuIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCSj-00000000Dsn-2MwX;
	Sun, 09 Mar 2025 08:56:45 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCKs-00000000CO5-0W0m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abf48293ad0so520363266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510117; x=1742114917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=;
        b=jySFA7nXnJ+aFVBfdW1sGi6gDzzghS/oAwx17qbEkjjTap6+9wL6OYrW7HAV9qtUlS
         8IflyCOPFcZj1ygn3kHwEiz79Q2tNS6WyXPMazOT0SDKil1RsKfT+ZmKJc8NFik9mCqf
         qgrLqRYPV6UafywdOjE5GFBbqEDmvDI05HS2a3OdA7Abm8F7UtI0eyT5aa8/HA3++RBl
         dBMzypd9Bi9RZiisimCZxZgBPq1B25rd+3TgUBv2konco1OuuOIcPs9e+8UeVehmpI2M
         yBqbN9ID1HU02RadRRFM2CRmHg7YS1Olyjl1fSeHYoau7en4rt7Lj9TPgIU7SUwcCfF4
         wnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510117; x=1742114917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=;
        b=gyQeCVziBJTCNoMoVnaMXXkgHSBoAA2ve4TqEjIHSuAxMge2kRpSwpUfm5Z0/ZCvWe
         Odrxwc9AUCqTZCZ+5X9G7dAaZdWSHSrOIOABXguBxZ7pNB4et1Pgg0acvA0biIKd0jE+
         pceSETTxGGTwTw+nXLl/Tj15xzkiWoFfGz8xBoncHm7rr55GgJ8NIqeofJuh3hbj6H9P
         yx/J1V5UHop1bAUdowoGcC5xhYOrV2Vl2aVaTBlrP8bUFJW4YZdiaL0+JiOTo7uKnRxY
         C1neddfGxhcO7dDyDgD2jtqUnFPyOlLX1kde6s0h9C2zm6NmJBtbOqu8TLF6ZfePzNtu
         rg5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8a5m4BT45HmUT98hiog30qJ2GapKICRv7th+Fr1pq9zr+SN+T2CB6NekaQBo/PiCaLucoKNCtBydGjoPYPyHB@lists.infradead.org
X-Gm-Message-State: AOJu0YzDWw0eOzjwNlmX0guUe+waMcZTCjcTVxJgrkR36dnN4J9cVH2z
	rMDParUTrDsNC3OhBtgsndBjdUCL2geXPaNqaa/9aurYTq1YseNa
X-Gm-Gg: ASbGncuYneBcyroO/Syc0WPL62inJt7bdHffHadzm7NojU8eIh1tcpg9PSKnP2olO22
	EY5eCOo7joqdBHY3Foh9VLI5xs8K5QdpsGRkknFwDzqBBvLyEiGt+7YbHcS/nCFdauY/d36DGWB
	ZGR4HbqgIebtgd36lz8p+vtagaomdyFit1zrFnfzDHmut8WZLSMEGS0vQGjUwbL8dgqjp5KMhYc
	ZlKNrh6ZrvjoD6MLKR102K63toHXYckbEi6G6JqL2jQXZJIZhPVPDjFSYZCxzpc//DqrcqEGO9A
	TnTwcNWCjVkUrnyiFSTLLL8ikZ/gATdRkZ51oxz56XVwulYfZdypf1Umnw==
X-Google-Smtp-Source: AGHT+IGD8kViV//YVpWgVRhDxEU4994VL0wz2et/xPmoDQOHxpV67VDbfzsmYHx+eVCo0QhuL2340g==
X-Received: by 2002:a17:906:b20a:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac284db5ff9mr291074766b.31.1741510116313;
        Sun, 09 Mar 2025 00:48:36 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:35 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 04/16] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Sun,  9 Mar 2025 10:47:56 +0200
Message-ID: <20250309084814.3114794-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004838_176579_DC0E3C44 
X-CRM114-Status: GOOD (  17.73  )
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
index 000000000000..347e66a5320c
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
+    minimum: 0
+    maximum: 31
+
+  maxim,gmsl-rx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while receiving value from GMSL link.
+      Default value matches the pin number.
+    minimum: 0
+    maximum: 31
+
+  maxim,rclkout-clock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Clock value.
+      0 - XTAL / 1 = 25MHz
+      1 - XTAL / 2 = 12.5MHz
+      2 - XTAL / 4 = 6.25MHz
+      3 - Reference PLL output
+    minimum: 0
+    maximum: 3
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index dd28cc397674..0a43582168a8 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -120,7 +120,21 @@ required:
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


