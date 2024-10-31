Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9E0E68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ/ptAux2C1Ckr1rD4QjN4VarsdBjNZAcL2h8MuBPUM=; b=0W8uD9XHgf+ojT+8SmvFT8n9eE
	25fCava7gQG4cTBV3IcUB6uxkW0U6qAWWDoGUXnJ275kSbOkgXA7X6Cy6jYQGs9+BuDAcgV4mgqb/
	WEOTqH/KpeJQIZEXx4KMBgs/7os31i+t8J+Be1RS9YzigGpQPnd4oqiBH1mjy2sBEc7UriFaCqswR
	XAGdsbl5W+5GvMHpn8Hv8GlzRLh+1NCQw2EpgXywDBsXxoRUQR61Ax6vlBOhvemI37LNP+StlQ0w3
	/lQDqXSnESZ1M6NW4lHkgchdUKKg9ZlvCzcH5ZXERPe5+gOkeLqCeJ81I1h65T92yI1T3q1HxTUqD
	9PBL38eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PF9-00000002l3A-2xlP;
	Thu, 31 Oct 2024 07:05:19 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDK-00000002kSK-1I45;
	Thu, 31 Oct 2024 07:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358202;
	bh=Os/2HAMdT7ukejERWbP8Yp9xeT6KhRyx6c3PHQ0aWEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFcok4reqrQOlsc4g8NJc8TQjsUCpiSjgreTa+ZqAuh+0YrcGbuXQKhT3igIykUz0
	 Eyaa7RaLFbO0d3M+cyLw0koMvJB65WLf7zAAvvn9na/OckpChpJ+yOT5jPyZtL81V3
	 6QCSsmeaxE3NGWGBTWEFz58w0JZ4oA8D/I6FVgL8fUuCDC7WuCwq2NNj1lQVcQWTa1
	 B7GD6TnS7r9rR1d0QZpjI+WHNZ9zqPDWo/lXTdQqqNUpsRZZnu5R3vRhAEPt8PceTi
	 zwPr9MSiYwBDoKZcXhm2geD6AYvXk67+k6b48fNrlTmFnRMgziER6z8+Q6qFzwpae8
	 UtXapdSmZABlA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] dt-bindings: phy: sun50i-a64: add a100 compatible
Date: Thu, 31 Oct 2024 04:02:16 -0300
Message-ID: <20241031070232.1793078-4-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000326_473148_4837102A 
X-CRM114-Status: UNSURE (   9.48  )
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

The USB PHY found in the A100 is similar to that found in the D1. Add a
compatible for the A100.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in V2:
 - Update binding to allow using the D1 as a compatible.

 .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index f557feca9763..21209126ed00 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -15,9 +15,13 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - allwinner,sun20i-d1-usb-phy
-      - allwinner,sun50i-a64-usb-phy
+    oneOf:
+      - enum:
+          - allwinner,sun20i-d1-usb-phy
+          - allwinner,sun50i-a64-usb-phy
+      - items:
+          - const: allwinner,sun50i-a100-usb-phy
+          - const: allwinner,sun20i-d1-usb-phy
 
   reg:
     items:
-- 
2.47.0


