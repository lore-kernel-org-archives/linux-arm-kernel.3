Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD88CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZU7DlddONCSaTAwvN0Nlr6nijKVsujzk2ZmafXKcnks=; b=CjKYyV9qFFlVhISz8PEDRV9FR1
	hCzNN/M3TI9LV/5z40GDSpt+sEnAgx0pG+l7ylKVz/O058a9jddc9LOx/jO0oW3cYdHkjHxFMdKh2
	qGqLO2xwc1Jkkgf1rU+Y8GVMc7/sp4cUo/JXo6pf1yWGKw9YToRoB1r4avonowXHVM+Os6uRwBs7t
	T3Uw5HacQF8GJiAWcf4NK9F/BLv7/XjnZ0kO4RDEVm44qRgEUc7m9wEr/+PDXTXahCiLXPL2Zlu19
	99kIXH53KM51FSDhyX4tmNO597i+fPgP7WmyQ8sRIvTh+T+L50npko2WLmVp3tKUXd6Q/V49V1mxG
	LNTVJncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umid6-00000000wwK-3ak6;
	Fri, 15 Aug 2025 00:49:12 +0000
Received: from mail.adomerle.pw ([185.125.100.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhiu-00000000oR3-22zX;
	Thu, 14 Aug 2025 23:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1755215447; bh=ZU7DlddONCSaTAwvN0Nlr6n
	ijKVsujzk2ZmafXKcnks=; b=jDz/gcSW8C/DhshiaRXiFF4zrTkwcfb+ca7dl3YJOcXQRhNBBw
	s/f8z5WRUhBw/QgpM4qXomJa9/1oRBhZE35DLf8PqfXMnbDJBQMmLVbNUc1ZZnrp7VPqFYeu+in
	tbE4a7qFlvcK6p+iKsKd+xgKoz+bLuFEdCUvBVhRnikaghqJWBvNeuiekTlwY7HBOpEeLAPjylT
	b6T2HLQ7z3HxDlp4qmihOdZ2AJvHjSDiNw01HPlHDKBL4Y7dKjTPk2Dl4bWcOQlcET6Nsg3EO/i
	J9bc7AV7kvkcJQI9kFzVUu6eQv57/YMAIKBnbV7VJSTGIpO1ONAgbyxRbbrSMGKSwrg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1755215447; bh=ZU7DlddONCSaTAwvN0Nlr6n
	ijKVsujzk2ZmafXKcnks=; b=b0xDyqN04Gn9TRjAZcFlnGiMh7qJzyw7ls2Ho3EqxIGHzi8MP4
	AgwwMO8N0YHx+zVep74SMhrMoB3nTUcUOxDQ==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v1 1/2] dt-bindings: phy: mtk-tphy: add property for software role switch
Date: Fri, 15 Aug 2025 03:48:24 +0400
Message-ID: <20250814234825.810-1-me@adomerle.pw>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_165108_698777_FB252947 
X-CRM114-Status: UNSURE (   5.60  )
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

Add a boolean property to enable software control of the PHY mode
switching.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index b2218c151939..a90890d4a86f 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -255,6 +255,12 @@ patternProperties:
           use the property "mediatek,syscon-type" for newer SoCs that support it.
         type: boolean
 
+      mediatek,software-role-switch:
+        description:
+          Forcibly sets the phy mode. In dual-role mode, it polls
+          role switcher and manually changes mode accordingly.
+          PHY port must be linked with the role switcher via device tree graphs.
+
       mediatek,syscon-type:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         maxItems: 1
-- 
2.50.1

