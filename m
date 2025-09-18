Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5CDCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+c9R8CaRz/+21Z+blc/MmKhdh6f69mQBm+iM+xPYL8=; b=IG7p2ggX3BcYu0VZu5QFbDWjWz
	6YtOTN7NWT99+mgEs++4YGRs+rNKrKqs6XuhZfd+SZ/KKun+HZRi65XBJkmOKon3eeVjWuKmVKa60
	PU1wwDY/woUzVw6V7+gFYX5NqoF8Fue8CqsOOKAlhmej+xcVT0by3L2e1FcJkYqKLukObmf+oVI8e
	KlpbW49yLrHKE7X3LVLM9MwJ8pLoayfuD8Qq5Qahw/gOmS9hrBUvoXsNWNhfS380OhxOm+D7JfXZ1
	VsP/EmAl7710t+QVkcp+g7GvzSFcgq9t+wO6SLMRZGqbyvz/b0x/AH5GVplBU8tTFLQhP+0VfIWHL
	TrK0YjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDcQ-0000000HNJE-2LUO;
	Thu, 18 Sep 2025 12:20:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDcO-0000000HNHf-23jR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:20:09 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uzDc7-0006mw-CD; Thu, 18 Sep 2025 14:19:51 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 18 Sep 2025 14:19:44 +0200
Subject: [PATCH v2 1/3] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-imx8mp-prt8ml-v2-1-3d84b4fe53de@pengutronix.de>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
In-Reply-To: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=fGRUWSeNNcgeqcHRkuxbrMGDyokBFOMlHiqs3FwB0qs=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsg4/ePJrkCxDh6hXAdHxx22zupJIW+iUxpya/46RTQfr
 +u0UKzvKGVhEONikBVTZIlVk1MQMva/blZpFwszh5UJZAgDF6cATGTDR4Z/luKnlwbwz5fb5SOh
 e1Tnz7ZTM2f9W2miMmvFrPgnytPu2TEyLNvzs7Xl2NYFV//06C19WJVYvFAi10dd6nqkhkC5VCE
 nMwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_052008_532608_91B56F75 
X-CRM114-Status: UNSURE (   9.94  )
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

Both the nxp,sja1105 and the nxp,sja1110 series feature an active-low
reset pin, rendering reset-gpios a valid property for all of the
nxp,sja1105 family.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
index 9432565f4f5d..e9dd914b0734 100644
--- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
@@ -32,6 +32,15 @@ properties:
   reg:
     maxItems: 1
 
+  reset-gpios:
+    description:
+      A GPIO connected to the active-low RST_N pin of the SJA1105. Note that
+      reset of this chip is performed via SPI and the RST_N pin must be wired
+      to satisfy the power-up sequence documented in "SJA1105PQRS Application
+      Hints" (AH1704) sec. 2.4.4. Connecting the SJA1105 RST_N pin to a GPIO is
+      therefore discouraged.
+    maxItems: 1
+
   spi-cpha: true
   spi-cpol: true
 

-- 
2.51.0.178.g2462961280


