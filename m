Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hk0ozjipptLYfgR3SXbJso1g1gA/mg3fP/4pa9msVs=; b=PeOGSmhczA0MONYsS2kvzlcdEu
	hG5OJMurCSlqQiE8vymNBMKQAeXAnN13xfBU1Dxf6rtBAhqMJEvCCa8gL27DpQ7FlIrGRQxC+KZho
	6evmXH/KweYq6sg1ez/WyeDRa4ezWDp9DYwjwyxirvzbfMQZJ0TEYf6EsRLe/Sqa0PvGPvSg41A1C
	zdnOKytFN8vYeg/ubbfaQwRHZ3SXHCBLSEL9/VTt30dKxPubbMYFFWKClS5adUIxlMlR+tIo/FOIL
	oilZUZW057lZlGLYWpR2nLw5YzHYYvTsJp3zJOeec85khbn/BF3nzXAfPGEj+S9Vn72Omx4Fa978Q
	oo49NXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc4x-00000008zjc-0QBE;
	Tue, 16 Sep 2025 20:15:07 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc4u-00000008zis-2LZT;
	Tue, 16 Sep 2025 20:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053309; bh=5hk0ozjipptLYfgR3SXbJso
	1g1gA/mg3fP/4pa9msVs=; b=jbxz3uEWexoqATZenETV+6A6dFkcWnG6OZj5Dt072mhRzu/YZG
	Vu56CkAPdzdeTmb1md6+xMW0Jb6v/26bQOFmjBMLA7eYjtOlTf+SIMg6Oz25dnOaoXTekETvmAO
	CtQ8spWiamXFlpvIYPmNajSYTuVH0i+sQWXgz3g5uz7PB5tvT+wvQUeeREKcsxWPZqwLYh3R3gb
	O1eMUJVWR8ha+hxdDXuXJQbD1MpBbktXFigsaWB05lCu5Ptm9ITkxZkVhYRJa2C1SDO6G6mtDT+
	Yuh9y9+PbyEBvCtJV8QS+xyaJdboiy38zI4XaFN5t0Jd0ZhdoH9myk2HlDMojKundkQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053309; bh=5hk0ozjipptLYfgR3SXbJso
	1g1gA/mg3fP/4pa9msVs=; b=ogmRHKwc9HhskqXLz/zm65B/tLZqPlTTHFc8QD+DANmS3Z1ij7
	pORkLFrhMRnkJ0Y3uUEcUeM+5SJdgVDrHSCw==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:22 +0700
Subject: [PATCH 05/25] dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-5-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131504_755350_D2852EAB 
X-CRM114-Status: UNSURE (   9.26  )
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

Add documentation describing the RTC found in RDA8810PL SoC.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ceae294921cc3211cd775d9b3890393196faf82
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rda,8810pl-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Micro RDA8810PL Real Time Clock
+
+maintainers:
+  - Dang Huynh <dang.huynh@mainlining.org>
+
+properties:
+  compatible:
+    const: rda,8810pl-rtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@1a06000 {
+      compatible = "rda,8810pl-rtc";
+      reg = <0x1a06000 0x1000>;
+    };

-- 
2.51.0

