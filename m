Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C451FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uTNGncHV3N16ULtSt2MuwA8GWisI6v20cx2WSoQm40=; b=UtXL6kWcpl4xHC0Kx8Arlhld4+
	9992InT9N55DLZq4rVi7No4ZeIyO2MtFbhgLfC8G8grYxyfZEB/RKf+BtcTGPO7uYR8bFG4w030HW
	1SYJQHb2WkCAcnnBEv2V0LeGefG5PeztX62OTnIiu44tGXqIYNt1fhPo+h9CqclYUeuzDCpQ9aY3J
	CksUlP3RtNx2UPPV2vYP3+bRnD6alkWvZSzpacdP6kGXNqIJOBzd0k60+KolPg2m0PhcNAVwoPrAA
	4NSoUDOIuxhjJPlZL1urVffGVd4yGM2qRSbNnbmm9VZNnqswFDvvlCUsB4ZhBieuF+WlbcEtdZflK
	jl3sj/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrjd-0000000GMd9-29RM;
	Wed, 18 Dec 2024 10:56:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrgN-0000000GL5B-25Fa;
	Wed, 18 Dec 2024 10:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519213;
	bh=QpoknfKuudyK6edNwVC6DZEAxrWbOP4UYlhcZ//BMsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=coKAnevmlfnOHxiuU49wiymP39eElkIr9zvrHO7CzFjXhSP57hZvKngGJprdDs9KG
	 yQmFQlzOHKfz2dHtxBdiwAe9759FMa8Hu+iEGmW8EO55j9k/sLkz2ZVtFFZTSB7j/d
	 bjEHoAtr1D4DnMSah90zJPLCzJOXWo0/2LqE1nRGGMNgj6VMWd40z5X/pxCj0bZ6mY
	 A1aMkCWoDnF6BAh4iTotVx3qgt+czGGLiLCHCZBm3N7LaaX0ko6maCUPPbwVr7bWwM
	 xHgcLw7RQ03QZGlv1VRHWSOQwAYlqpxRgXjiEgq7tb0m2c+kVc4B++U1I0tldOT/9F
	 COIOFav+64kMA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92E5117E3615;
	Wed, 18 Dec 2024 11:53:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
Date: Wed, 18 Dec 2024 11:53:19 +0100
Message-ID: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025335_684193_ACDCEABF 
X-CRM114-Status: UNSURE (   8.69  )
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

Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
and WROT hardware components found in MediaTek's MT8188 SoC.

This hardware is compatible with MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mdp3-fg.yaml       | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-hdr.yaml      | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml      | 1 +
 .../devicetree/bindings/media/mediatek,mdp3-stitch.yaml   | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-tcc.yaml      | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml    | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-wrot.yaml     | 1 +
 7 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
index 03f31b009085..40fda59fa8a8 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-fg
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-fg
+      - items:
+          - const: mediatek,mt8188-mdp3-fg
+          - const: mediatek,mt8195-mdp3-fg
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
index d4609bba6578..d9f926c20220 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-hdr
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-hdr
+      - items:
+          - const: mediatek,mt8188-mdp3-hdr
+          - const: mediatek,mt8195-mdp3-hdr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index f5676bec4326..8124c39d73e9 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-mdp3-rsz
       - items:
           - enum:
+              - mediatek,mt8188-mdp3-rsz
               - mediatek,mt8195-mdp3-rsz
           - const: mediatek,mt8183-mdp3-rsz
 
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
index d815bea29154..1d8e7e202c42 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-stitch
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-stitch
+      - items:
+          - const: mediatek,mt8188-mdp3-stitch
+          - const: mediatek,mt8195-mdp3-stitch
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
index 14ea556d4f82..6cff7c073ce4 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
@@ -17,8 +17,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-tcc
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-tcc
+      - items:
+          - const: mediatek,mt8188-mdp3-tcc
+          - const: mediatek,mt8195-mdp3-tcc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
index 8ab7f2d8e148..cdfa27324738 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-tdshp
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-tdshp
+      - items:
+          - const: mediatek,mt8188-mdp3-tdshp
+          - const: mediatek,mt8195-mdp3-tdshp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 53a679338402..b6269f4f9fd6 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-mdp3-wrot
       - items:
           - enum:
+              - mediatek,mt8188-mdp3-wrot
               - mediatek,mt8195-mdp3-wrot
           - const: mediatek,mt8183-mdp3-wrot
 
-- 
2.46.1


