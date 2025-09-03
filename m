Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B71CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOy56KEbCLzYG8mkNNnVdv4n+cuRPTadFRiLFWZuZWo=; b=VrIqHWKZ4UCR8XI1N8BmqM48tq
	tdZldPUDhzVAnrHtfbwYWxjg4iFEv7KxN9todf41ibX6V3rLF7i0EKmboqZGnFIt1YH3HMNDSTr8d
	gNH4bG/27SvLgjUz3G8ZCzKCRDLR6L/ENvbwSXeDWFbDl5OWVFkDhkoiFr/kwVjnAaU7Vw191o73q
	1mXxplZKaDm2+ogneisGh9ag2FxXog7vEzJ4EJdjwTxCFmJ69CpBK6SViiGwJCHGU/Jhc7gK6IjTe
	Qas/DkPmh3HklAEJTUEO2W71XMSg5AgYTMJjkXqqLrsXxTBwNDkaGtz3G2jriXB1NodXN55J5iA1T
	dSLjzhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utus3-00000007due-2H2E;
	Wed, 03 Sep 2025 21:18:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr8c-00000007AfN-2Jzi;
	Wed, 03 Sep 2025 17:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCB8B44B1C;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F156C4CEF7;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756919953;
	bh=z0cByXcqi0tiIJ45F3UR/xQzVAzSCSQJp8Fkj34rLJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WaLcUGxLLoqpukdPs8yKExNZqR9boC6D/LASwFlW7+GSd0+IgLZbG0vXzobgc6K4+
	 I7xQBUp0BBTUhAK1WnV/QvqoMqld/fJEgoJ5bpOQ6OrnLd3nqfo/MfbV1ijGmSG45l
	 Aebi44iR4BoXcqEe2/fbht1Ygv3trD4aBfZtdMB84MCuq3xp5jMDe+rpGxQMODBafC
	 mROkO7ZiJLeRdy4fS4MjzaQZoE299Z9Jup2trBOYMjiZFyYh7BNswPn6BhmXySA7i6
	 9j8Pj/27ACAWumABap1aPUt526eI9B47ej8wLAo0eA2m3aPai3VcjQD1V3NNjVGKa/
	 Mu1akCWMM3F0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571D9CA1012;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 03 Sep 2025 19:04:50 +0200
Subject: [PATCH v4 2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make
 power-domains non-required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v4-2-a4f340a7f0cf@collabora.com>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, stable@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756919100; l=1518;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=UY9k/CPSgZAnLld//8ZfWwv6Gh22vHYGKGPNRh5Nn0c=;
 b=eqrvA14lPudPcJ0HuzJerB94/LT2JWN09wGWEW9P+uiosVIJuYhOZHy9+edhlTU7bpXk2ePgV
 FhRofqJF7+MAB0j+vwm40TiJ+ScMZkN/tlltCZ/LdqOURSsAFJDwJKs
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_101914_648461_85BBF0E2 
X-CRM114-Status: UNSURE (   8.98  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

There are variants of the Rockchip Innosilicon CSI DPHY (e.g., the RK3568
variant) that are powered on by default as they are part of the ALIVE power
domain.
Remove 'power-domains' from the required properties in order to avoid false
positives.

Fixes: 22c8e0a69b7f ("dt-bindings: phy: add compatible for rk356x to rockchip-inno-csi-dphy")
Cc: stable@kernel.org
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 5ac994b3c0aa..b304bc5a08c4 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -57,11 +57,24 @@ required:
   - clocks
   - clock-names
   - '#phy-cells'
-  - power-domains
   - resets
   - reset-names
   - rockchip,grf
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-csi-dphy
+              - rockchip,rk1808-csi-dphy
+              - rockchip,rk3326-csi-dphy
+              - rockchip,rk3368-csi-dphy
+    then:
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:

-- 
2.39.5



