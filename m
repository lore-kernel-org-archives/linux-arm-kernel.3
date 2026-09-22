Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A66C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zxMWe1Gn1onetdReGCnPNu372D/8gHhav9+ZEra4BaM=; b=NmAkn4PD4NSMvPZgTPRHMDbLza
	EwyhPJs4mhDxVtqXLVo6dHKVglwq2ml81OIkanIh8yAjExY3vqSQwP0E3Jap34NuEmF+3EErJ3dns
	ietfxOK8WAs3fdIPq/RuCuNRhfBZ+5CiW3V7/jQp5om/TAuLYc7EQOYlGABe/mnL0dmhIlIH0XyOa
	qBCC1wVKcGhXXDUzF+OV1eyYNqrBgQmpxHIIUiLqkAvOm5LUB00nu3eTXFan08F6U1ybHpHAqktgH
	WXNdk8Gg9+dMFCC2k8fhH44/qA5uH5AXyqh4yf2LgOT1DkAkx3jXsbSrtVC+olQ3iZjUiKa7R9VoH
	jSCCFl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95H5-00000006J5F-3TMO;
	Tue, 22 Sep 2026 18:31:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95H4-00000006J4w-1Z67;
	Tue, 22 Sep 2026 18:31:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D154D417B2;
	Tue, 22 Sep 2026 18:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BD01F00893;
	Tue, 22 Sep 2026 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101885;
	bh=zxMWe1Gn1onetdReGCnPNu372D/8gHhav9+ZEra4BaM=;
	h=From:To:Cc:Subject:Date;
	b=VkLhgJ12vAKrxbUuncHIicgmjCFQy21k7qkQhdQGikCFSAXRV0ONjKk6u42HXvlHg
	 AAjw94Kuq7Y15isBWpt1P95x9o+6AK+Wz0Pl44KLKsCYiBQH9Vv64XDBlSfDphngX5
	 vXZonHDGdfZj/2E9OfhdoFcls6OMOtEtlPhJ2znP1WCT9uJOx8c05a7+Q1DLIv0C1V
	 25QYBAQR+DAlEsEoBrOk1+Z9DWZ50bYPSeL72ZHxp2vhuJPfxuttEIbjjz75jbZ6+0
	 GIWnP8bTSgI3D+61qzpPCVTC2bOs0rEEDTAbnU9/YgUD8vVk0pIj3aNhIcF35j8lKi
	 ibrOh3LPeETkA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eugen Hristev <ehristev@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mediatek: Fix MT7622 clock count
Date: Tue, 22 Sep 2026 13:31:20 -0500
Message-ID: <20260922183121.289108-1-robh@kernel.org>
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

MT7622 audio nodes have 33 clocks and clock names. The shared MT2701
binding listed the longer MT2701 clock set as the common minimum,
so MT7622 DTs failed validation as too short even though the binding
already capped MT7622 at a smaller list.

Set the common minimum to 33 and make the MT7622 conditional require
exactly 33 clocks and clock names.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/mediatek,mt2701-audio.yaml          | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
index 30f331366566..10df1e7c7eb9 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 34
+    minItems: 33
     items:
       - description: audio infra sys clock
       - description: top audio mux 1
@@ -74,7 +74,7 @@ properties:
       - description: audio APLL root pd
 
   clock-names:
-    minItems: 34
+    minItems: 33
     items:
       - const: infra_sys_audio_clk
       - const: top_audio_mux1_sel
@@ -132,8 +132,10 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 34
+          minItems: 33
+          maxItems: 33
         clock-names:
-          maxItems: 34
+          minItems: 33
+          maxItems: 33
 
 additionalProperties: false
-- 
2.53.0


