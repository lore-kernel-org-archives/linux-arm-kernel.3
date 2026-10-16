Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF9ACCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=; b=EC9X81bdE/c5N/SKGRaF/DV4DW
	a/K/HqmjwUPZgJ6YKrATcGw0ZKlWgttvKlQWwRKuRwxAyUlM7CMg/Jnv/UD0zbgC3gcEFAsWJyE0H
	U4eeH+JbrbSNNpMorwyew2AETU6PSqV6NooajD0cn1npUqNqm5Pe2Mg9gmehZksB6rXH36P2dE2cu
	1XHIV8KPwa5KZgoXx3tEso5U/wFs9AyvGwTYB+y5YViwr65Ia2tw0BoJNrxbjI4/L46RHKZNl4YPk
	KfG39QeUTBHhka18P4UvR+ef0JQ2bszfwW01OjPDkle800wtk4CsqKgDbQGq/OW7LDptxEcAT5LrW
	7uuu0vSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkJ-00000002OA7-1IsC;
	Fri, 16 Oct 2026 08:56:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkG-00000002O6y-0nxU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:56:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2df9c3719f6so4754935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141015; x=1792745815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=;
        b=kesv9qN8nrGzZVbX54cBziZiJOOAdgVVNlzTkbG5JQ4tiMhUS5FYakMAX364ETAr9I
         iFvZq16ES6f5FPXmuw7WIsoIi/wpkOeCzY1YVZ9xo7iLONw3K1BSEsfQga6HQKfCAC5I
         6NQ1VBtGbb4SR36Msy3lh6leTYLFREuFoWLg+GdnP+jHduYvEtun27EzlXZ4n3MnPunh
         T193nFAlW0yPYLREdSDpp6qOlQJwM7SzSBvr1DPoT2neBk4W3iDAMh/w7piVJtECZC6b
         +4Dmp3TwXNIeQc+SHJJ6iGe922nG+IHUHFr5l8L3LVk53fxyd+p6ATcb8DZ4TJVFFzWe
         0peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141015; x=1792745815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtLGyN+PdzUpUTcE98Aumqo/hwiyHlck/gS/TT4kqGo=;
        b=wMg0RXLjdG3ROCuQIMYG+ZD36dqxcx9wv3vI4dHHkMItOx9QXAV+IIKpTANfegHrBo
         7OEUYBaX80kOuDUX+yyNpvvn52saWKJne6tpUk50znWXxCQaSOyqkGY9+LDdeHt4XbLQ
         SLI4/DG+T4FB6/JYphl7j3SBGkyhUgqJLNLp37tk7kenb6kvz2IHiI8oEp9OVZ336M7B
         /9YqokCWnx8DJx4MBZMOdIps7QgKnbgEbHABKIPja2R26rjBouz/Vl5QSAQ/INYu3NkK
         YP3Le9S1gkC6d4WSev2c06jV9pl2pZGknh2bDJ1bDpnbuGF1O1zWmnsq6FG43YNr5efX
         gm3A==
X-Forwarded-Encrypted: i=1; AKwUvBz5SN3tQ5/HrdxyhkAEbQWujkEizuO/QSpjoP6cTooQBP9uQlUmgPvRKv4yVbdKMCQlq/B0d4HbQ1ofm9w1jdYz@lists.infradead.org
X-Gm-Message-State: AFq9FYJaCakC0YtBKjQADLp5vU19wl5//9b/K4w20JpRj4gyj/XySNg3
	PTF19BDaCCAT0+XqzMC6HIcv7zdnVaAVyRVuVB2j1oye442dO3IlT/8m
X-Gm-Gg: AYBFou16MbGMhwCyHs5oFL7FXPIvLSSbDy0M7WHaxaS6RHshnHivcHS/EJExLIYiYtd
	9/xaKvxYD+u/CC0YgS7hZFna4jUP3LMao70Lw0AuLbaffCyIzeZPbRZGipRB7boHqAaAigxWSGV
	n5Up4aUGs60YQRf/OkpzlFlvJhbGej8UYFvdWQLpLt9EDe15OeadY21K4YSTxh6Ld7j8ibwbNoR
	YnxOMX5mDArzjxjwyB7WIXYEHB3RKHuExtqoTCAUuZEeQj4Vu4Hu9D1r9+iTVNmaYXgwCVT2EHc
	uivb+J76rQQbbmLNvOBspNtTf0Wv/s1I477jRdYfN3WOG25bgcpdfYlRT9aDqulCHQkbpOOpNk7
	UKy5SJPc0O2e0N12VIyM6NlIUDx0PDZMXly+mX/EsL7zC9Bf7rkiTIivcq/83DTTlGXo7YERCRv
	y3f9jbO1eTJtE6iwXH/qmCxiebvMENqfLoQnwagqoP/UF8Ji8VMeHeXk6/wpj8vCbEaG12lICYc
	w2Gq15/QeuSvjJhLA+pHM096qPus4o=
X-Received: by 2002:a17:902:cf0b:b0:2e9:6788:937d with SMTP id d9443c01a7336-2e967889666mr61137945ad.4.1792141014917;
        Fri, 16 Oct 2026 01:56:54 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:54 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:36 +0800
Subject: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a
 cell to select TX or RX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=2767;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=ce8JdNOJs5zvcQeCguszU9j59LCLfLXe7OkJrHqM/YE=;
 b=xGmXf0uJmuCFnGX4LXl2EMMZ1WvsxT2sntwv+hZwzx8NB5XgYmF4wB3TO71KHkIhWamdIBqA9
 3a8QSp0sv7LDJnLqs4+VROT8Z2H8vmMinUmvM0gz379mPKwncWtik5A
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_015656_251627_98420EFA 
X-CRM114-Status: GOOD (  14.19  )
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

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and two consumers can use them at the
same time. The single cell of this binding selects the mode and refers
to the transmitter, so the receiver cannot be described.

Allow a second cell that selects the transmitter or the receiver. With
D-PHY:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;

and with C-PHY:

	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;

The transmitter and the receiver cannot operate in different modes [1],
so the first cell must match in both consumers.

Two cells describe the receiver as well. A single cell keeps referring
to the transmitter, so existing device trees are unaffected.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..6e8cc56e4986 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,11 +20,25 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
+      The first cell selects the mode to operate in:
         - PHY_TYPE_DPHY
         - PHY_TYPE_CPHY
+
+      A single cell refers to the transmitter and is kept for existing
+      device trees.
+
+      The second cell selects the transmitter or the receiver, so that a
+      MIPI DSI host and a MIPI CSI-2 host can be described as independent
+      consumers of the same PHY node:
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      The transmitter and the receiver cannot operate in different modes,
+      so when both are described, the first cell must match in both
+      consumers.
+
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:
@@ -82,6 +96,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };

-- 
2.43.0


