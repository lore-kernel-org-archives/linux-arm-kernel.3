Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED064CA9EC8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=; b=c5c55AwyQeEiCuUo/rcNOGaNyV
	tQjlDjWhNZJ9NOl3RgsUi69QTgbXRo7Vc9aOBOkWvkG3KA6K/xa6UxQBgfqYjfTzAoQBLQgmO9War
	1KQQFngwUEvxjuyHTMUKL0dtCrkU4Ch7vQqkpiZMNT64cbX6z4kU7ZnIEuK+rV1psGx9CfLFz1V+/
	wsA0pV+jB5yeqHg1B9K9wcIshkdSdyic9oygNB7hpB+qk+kuV/yhZnrXGlLFi3BokHF13q0hnarnF
	vnjGlxYdRl5ZPQWUrqlAbWKwlM4axNnVnWEXtQsRJ6iMOmSGkZtw4UJhYDLK3CD09zI2OtRNhfEou
	ZMO1AEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh4-000000083UG-0ssn;
	Sat, 10 Oct 2026 13:00:54 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgv-000000083Jm-13Wh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:46 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afbd2c386so269640f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637243; x=1792242043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=;
        b=QYqwPECXEZj2LpHYhlPtyneRkbXFy9nkiBDqx+6DlxGfDrGjwcPku6JlFRYhDdLDju
         JCRKqNemC4dYwHKkdQC0q3vwXxBUXvHhF12LBd+iY8GPqCKN0fEPnB9Ho869vl0V3PHS
         FCB3nYWnBTPkk1lgKeHhecaNfPASza4hVpkBppRWeT21Ux3Q3Th6rtqh0a85/4mJzafO
         8Wwu0u9Sgbp7ASHdNQWKCHjHnFpNQdH1Bg364eaOKPbL7q1yd/VG/Pya6jl+F1nFKNP6
         XZrqdCRccbP8TXSlKo1CpiqdSm1a62O+DazXlZC4vZDSQOjf/GlxTdjTNxUjLTCuv0ym
         dyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637243; x=1792242043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YO8Lfw0R/ZajnaY4WHrnUbXF7RAAHoajPla3LSdk9go=;
        b=QeqMS7GuyeYycKywdO9LinEnaFdcnggkty46vRCfcGBXWms1rO4f/oDGG0ycI6IqwV
         XVXUb7Np+tjjN65ZVV1IdbowYWINZ+Ugc8yyFx1Zsi7wmQ/N0pCeiGGYgzQHSLinq/Ni
         ywJjYTwE/bkN8p+psoc1/wC4Rbb/d6ZnZhcu6aZ7HMQgJK8/LCzBjvfoBiyeY2Tj85uS
         WW+jfbjWPFCIp6oFtyKkWK93ZhQ4yZDQSB8eaTVRpry1srMAaJct3vOm8hzmiVhRV9PT
         LEWWvl12eiUSo4Ctih6IbWjN7vFMLBVSvQtDAAk6+1kLzqA4WsaMbQ727hNDd5mRVKm/
         BTrA==
X-Gm-Message-State: AFq9FYJkJSHjPE5PBiMO4Uq9eLCkZF1NdwleQmAb1IMc0vjOBuMWL5EQ
	0eKnGW8h3PWlWBnB+lWIO2uM85bTHA+sIl0QFObGUOo2aZ1xCWgudXcMFJgRzGNrLxEbYQ==
X-Gm-Gg: AYBFou2mjePK67zUKCVKjWIIq93f8EcLm4fLWkxu9XFc9g1RQeE6h3HJNeRUDM+RV3P
	UiQClVIzCsuBatQnQL52JCprwYwbLBTkmP1EwFLXifrPaW5woe/p5Lc3Le7Ir3B/GaoIqd6DASW
	SeK2JD8xdb+tySaY6V87VWr22a88196xCTS6PY5gTMj45yIeh04//EF0Cje/ZBPB5oQ+yBu/6OW
	hCVX4aWjiX0DGOhIQ7b0SJ7+Pj8mn8dIvTKP59ZNLPj7Tgr8FRGI/i5K1+dCicInXEKqFTzbLuX
	tAGMU+vzzq5oYplnvywV5ey6EYo7TE8uhUxv14uLr0RsZjNcINyTVI8T4pPZrmvAIYjEs/D8maV
	7Vz6gxOB+L3Ybk6hN2xDoImBbU6P4QKgUZu7t8nK7D/CauXyLOWbQUUEGUDYXdenpz3KsqxIzyx
	HYOe8/iIEiMbDp7+02tLk329Me1eQojyA6kPOX4fMdSZvcbyyCDxxmZD5luUo30UYjsoZOr+A2h
	QX//axeM2rcSlmxgtZZK6MsBeENEXuWZ28Yxaa5efnPEahR+cb/f5dNHoKiWpGYtt1tr1G1A2/o
	TxpnFbpPse8x/gMzIsyCBPSf5kTf66ag20fqeLJJtf+IFKxSNsB9tOApfDLr/A==
X-Received: by 2002:a05:600c:3ba5:b0:4a1:70d4:c69 with SMTP id 5b1f17b1804b1-4a18e4c03bbmr101466895e9.28.1791637242847;
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO controller
Date: Sat, 10 Oct 2026 13:59:52 +0100
Message-ID: <20261010130024.177503-15-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060045_317265_581B0185 
X-CRM114-Status: GOOD (  14.71  )
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

Describe the MDIO register block and its work/register clocks. External-
PHY pin selections use pinctrl rather than direct syscon writes.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-mdio.yaml      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
new file mode 100644
index 0000000000..49ff7e7b1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s MDIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The MDIO controller of the ZTE zx279128s reaches the PHYs of the integrated
+  switch and an optional external PHY. On boards with an external PHY, the
+  default pin state connects the interface to it.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the management clock (MDC)
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    mdio@9a101000 {
+        compatible = "zte,zx279128s-mdio";
+        reg = <0x9a101000 0x18>;
+        clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+                 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ext_phy_pins>;
+
+        ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        ethernet-phy@10 {
+            reg = <10>;
+        };
+    };
-- 
2.55.0


