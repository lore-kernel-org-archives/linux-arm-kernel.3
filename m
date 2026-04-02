Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09055CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 05:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=; b=eNpPJhzgogoyqPQi7wBU1m2BbA
	3Wukw43pa9iZ4J3mNX2Im4s1YD4hDhkFkGcWZRhmI6DCoXD3qtEgOAmw7sUCYGtdvuKlKLaRAyOxl
	3MlX7Gw3EuvW4K4zeo2y6RMjFkRwgh7F3Wc8fSUu1GHSMuERgvkL7YEv5ezyr6XaF6pTB9o2p7tbr
	PhsyoFGKkicsyL0v6rirX/dav1EC37YFLwB0TLhTvPqC28E84haHB4+eLDWSRtBCR+snB87qk3zl7
	60MoHjgYpe2ldLWz+bWe5ivjgSpGwaWyGlUKS7if9ZO33OnlDot/WNo6AqBIfBKpdYEDeRxh+dpuA
	g7BsTRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8B2s-0000000GqCj-2SCW;
	Thu, 02 Apr 2026 05:56:46 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8B2p-0000000GqBO-2syH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 05:56:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82a7539851fso223444b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 22:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775109401; x=1775714201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=;
        b=i/ReKXZlQXN9auoARKGAGh27EMWMzBzFeVl/OGKMTqNKAT30+uEMnTdjjlnjI92sAF
         tyMkzCJqirANNOSX5R2wbjt28MnlGEYmNF3SNKrNoIlF+I0WTFtKdiReojRyJ+bBsCH5
         I6Or1QfeFQZBgBNHgsU49c3pJVyprsrrQerKzQuS6MYQ1//HYBq+gpMvIj5vm5sHrJif
         oilnydV3Ozi0WDNHmUp4S+vl9a1/19xZ8JX8os8KOwS8LKqFGr57jZDjB3BTQzSuLa2k
         XgLeOL+CYZ56jH7ncnCsDpQ7dpZTFepEGmkfcUs6yGCy8ZYXcpqXxvDbyojXXfWPlb+k
         3wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775109401; x=1775714201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=;
        b=oosHLJQXkdcN7UJSAk8WUDFwN9cYRwFqMgsDHzOLDpLoflwJKRD7NCLPWoXOYk3Jg1
         SXFuGU8vd0tepGjMHdRkS9ja2IBeliCshKZzAxkI2TyzCU05VfV9KcWdnsueqpaxSzmX
         ISczvFPRY6geMZr0No4IiQJD7FhE7wd1Sg6uR2Wx5MM3xOg1tNPRIRUzK6mXtJ0otyB1
         BrXntpl631iHbysckogLyX1r4gEXshhdTK98486AVqNp7UysElLDzxp+Zc37yADJv+zy
         Be9BjuN18xvZP35ezx7LRAmX4tBwK+ukAYHuMBQpgNZViQAhgQgSYtQ7cAO+8UeOY2vD
         7K6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzqi6xHBStsQQtqCFS7L58i93UZbTkblXJ8suEd+EGjzwXoF7eGZ9MZABOStCpj7joXvnGhndK5IJf+/p8B06n@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtl1mF47z+c01v6HmFKNB0Z2UtB5gzEmb3Na8A3IevNP5Ly7/t
	Rc/s13mmX2G+ryvOhpC0qpQ1nZdJtqIx/Gmg8ZrqQ2TvmRyqn717v3mv
X-Gm-Gg: ATEYQzwXq0N0sSzxZ8nPeeFn43Tev+qSreEuctTCvOzhEudZPEABiC5Ut9WTQ3nUvzv
	py08Cd3rCusxrJMPjeZNfZBSlnrN72CKkEWKn2FgETZXMaV6wcF5S9Vat6HgwqxRQr0uADHzX3Z
	yfeLitVwRcr43/5VHvx5dNkUxUUSo9/KIkKGVw+gn4Iz6QYILfdGaI+2ttEIzhEr+Jw0UIDTxXL
	oKwjogUmbvy9Qe0mVk8onBLuQxgsXJ+Wf26h6JMxn6xJY59wTWg/ceB4XawLmBGebiDNDPwLIRJ
	JfHCHTrxJH7wSy5OgCNmUR7o5EZ0ZPVujQealeZ2+5fxrFfSszpCA+Ccly40ySxofZbKQZxyQ0z
	KuSOEjsNL8L2Xn4m0YyvqCR2dkXHcQFGDRi8GZARi0GLQAN9U8FttDZTANI0nQ9ELXTSXlKcSa4
	2XjwFjkBoxFWlXmH+2TIK5M7tA8PSmcspA+lW45A==
X-Received: by 2002:a05:6a00:883:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-82cfb9011ecmr2049074b3a.29.1775109401437;
        Wed, 01 Apr 2026 22:56:41 -0700 (PDT)
Received: from localhost ([2401:4900:36c2:bd58:77d1:5e5f:850b:d2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm1760623b3a.29.2026.04.01.22.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:56:41 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rk3399-gru-sound to YAML
Date: Thu,  2 Apr 2026 11:26:35 +0530
Message-ID: <20260402055635.8798-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_225643_751168_773B7750 
X-CRM114-Status: GOOD (  17.46  )
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

Convert the rockchip,rk3399-gru-sound.txt DT binding to YAML Schema.

During conversion, property rockchip,cpu was changed from phandle to
phandle-array to properly validate existing DTS usage.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
This was the error reported by dtbs_check when rockchip,cpu was defined as phandle:

sound (rockchip,rk3399-gru-sound): rockchip,cpu:0: [211, 212] is too
long from schema $id:
http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml

This error was found when verifying against
rockchip/rk3399-gru-kevin.dtb

 .../sound/rockchip,rk3399-gru-sound.txt       | 22 ---------
 .../sound/rockchip,rk3399-gru-sound.yaml      | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
deleted file mode 100644
index 72d3cf4c2606..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
-
-Required properties:
-- compatible: "rockchip,rk3399-gru-sound"
-- rockchip,cpu: The phandle of the Rockchip I2S controller that's
-  connected to the codecs
-- rockchip,codec: The phandle of the audio codecs
-
-Optional properties:
-- dmic-wakeup-delay-ms : specify delay time (ms) for DMIC ready.
-  If this option is specified, which means it's required dmic need
-  delay for DMIC to ready so that rt5514 can avoid recording before
-  DMIC send valid data
-
-Example:
-
-sound {
-	compatible = "rockchip,rk3399-gru-sound";
-	rockchip,cpu = <&i2s0>;
-	rockchip,codec = <&max98357a &rt5514 &da7219>;
-	dmic-wakeup-delay-ms = <20>;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
new file mode 100644
index 000000000000..10001fd2f886
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-gru-sound
+
+  rockchip,cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandle of the Rockchip I2S controller that's connected to the codecs
+
+  rockchip,codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The phandle of the audio codecs
+
+  dmic-wakeup-delay-ms:
+    description:
+      specify delay time (ms) for DMIC ready.
+      If this option is specified, which means it's required dmic need
+      delay for DMIC to ready so that rt5514 can avoid recording before
+      DMIC sends valid data
+
+required:
+  - compatible
+  - rockchip,cpu
+  - rockchip,codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "rockchip,rk3399-gru-sound";
+      rockchip,cpu = <&i2s0>;
+      rockchip,codec = <&max98357a &rt5514 &da7219>;
+      dmic-wakeup-delay-ms = <20>;
+    };
+
-- 
2.43.0


