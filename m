Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 03:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89/Ied276i9FOsoHd8vBC5qsTunh5CJ0SvVAdLuPAlg=; b=IZsDIvx/1QzbHZQ/PPTWEFrE6J
	pI0LFEs2kvHPzGPfEkbg47cg2q+lf7EZtlXqvIW7cVzt/KCzC+L3HFHg4An5f9df2DRZbiY6jM1Ra
	AlouoPZQcqPQVdqWh83z1ZSzijwxeFRdGWE5P1rrtRlOHAdIDOcw5fv+EpaGzEp4IGtpgIy0x5VzE
	u+d4xoTO/c6fLFBda/fAENZaTMIOzGAdqQSVFJzBmOBwZfaQVBPAiSIh5ERtj8ofDOVuM155I8ncm
	vgFa6FJWgE8leBXx39G0/Fo/nLK4tgE/1oQ/HzivVJySXfSPuiQNy6RJHx8K4r6vYwPa65Ix1i324
	mBcV8XCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNOHH-0000000C358-0MZH;
	Tue, 17 Dec 2024 03:29:43 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNOGB-0000000C2yi-3PZj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 03:28:37 +0000
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 65AC5165D79;
	Tue, 17 Dec 2024 04:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734406113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=89/Ied276i9FOsoHd8vBC5qsTunh5CJ0SvVAdLuPAlg=;
	b=Goh5CCtDS0tPNf+WJafGDsjV46WvVKe3mlRhlW6LAED2fz52JcKVwm0FYXThOcm/Tn/aED
	SLg6MGyhHs+ldP9qcn3PRVdJDDUvcdQPprh/FBA5qy8sJe6mbuDkoQiMQAiyxSACOJM1pv
	+sJk2QVvBaFGOZo6RfgKXP6SGRUmjkE=
From: David Heidelberg <david@ixit.cz>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: media: imx283: Describe sensor address using the reg property
Date: Mon, 16 Dec 2024 22:28:17 -0500
Message-ID: <20241217032821.1712916-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_192836_187223_052DB175 
X-CRM114-Status: GOOD (  10.64  )
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

Use the reg property instead of text in the description.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
index e4f49f1435a5..f4ee991c89a3 100644
--- ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
@@ -13,16 +13,15 @@ maintainers:
 
 description:
   IMX283 sensor is a Sony CMOS active pixel digital image sensor with an active
-  array size of 5472H x 3648V. It is programmable through I2C interface. The
-  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
-  sent through MIPI CSI-2.
+  array size of 5472H x 3648V. It is programmable through I2C interface.
+  Image data is sent through MIPI CSI-2.
 
 properties:
   compatible:
     const: sony,imx283
 
   reg:
-    maxItems: 1
+    const: 0x1a
 
   clocks:
     description: Clock frequency from 6 to 24 MHz.
-- 
2.45.2


