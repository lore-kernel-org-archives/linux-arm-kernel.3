Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4000C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUe+Dpx+RFTCFSmdw+LyaohJ6/6qox8ai3T1sHvA7rY=; b=ddKfMGscEv7DR/vvq+LGZfpXf3
	L9NOa51mMgtWPuH/rasNItAHK6V/2sxAU7ndKleD4KFw94FFmc3Ma2ynkI2B6yOhrgcLTRSNpLckC
	LggMjEXvjVNxzxOY/sSkVqOWStglz1WI0z51wgsDNktBvHvsSNs+cLzuMh6LMQELZ8JEmJo0QST1S
	4oQcf+g8UZUZAONTH2uC5CwEODcFZq9UhIMq6W7q7c56cdOwOJAzV54nCfUNLQ2vNouuj2hxVESfS
	Le5UIumTlRCFGI8wHCR169ntkGIoNKQTWAu+XEYygvFmGDQPzHHUXiL7PxMAOaIUaRWNtnbVj2IJv
	niwyMDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nPX-00000003fM0-30pr;
	Mon, 21 Sep 2026 23:26:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nPV-00000003fLb-0wOn;
	Mon, 21 Sep 2026 23:26:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B52B940678;
	Mon, 21 Sep 2026 23:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CDF1F000FF;
	Mon, 21 Sep 2026 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033216;
	bh=IUe+Dpx+RFTCFSmdw+LyaohJ6/6qox8ai3T1sHvA7rY=;
	h=From:To:Cc:Subject:Date;
	b=KtS1PaiN5FLyH0RiiXvjRUPbH7M8MxDi0jo47WVdL/ZAQdXJcDU/zvdPR1AoDwH90
	 iF6GsSAPgNEu2cWCVxNCXk1QhD6iXStNNSmdhO0jxjoolQ29rW7uWH+pPbCE8+XjIq
	 zhmxbAfiZWpdhk3fY4QPassFq11YzgEH7ardEqLOngwDNFS5yxQhutXsEXBEcWpEHS
	 lJsJp2XRSMTXm9OXOcllsWPQxLHj36dlnjfzh7aG8StFdW52oVAtWL5HJXZED0BiIA
	 JtNcipyMzV9T3caBoX4Qk4p3Qv0wNYEA/LSRfxlzeFouCN0JZnvEi+cRGgnvNJv6y3
	 HnE4qDDidg00Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: Add MT6397 sound DAI cells
Date: Mon, 21 Sep 2026 18:26:48 -0500
Message-ID: <20260921232649.3132592-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Document the one sound DAI cell provided by MT6397 PMIC nodes.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..e2caa049a60b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -57,6 +57,9 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  "#sound-dai-cells":
+    const: 1
+
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#
-- 
2.53.0


