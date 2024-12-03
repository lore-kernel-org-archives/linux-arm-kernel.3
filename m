Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0ECE69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueP7Zmu0cny/97JJOvIfWIB6M+S99UlmuleWK5RgZPU=; b=iqN7NRv4W6dk9xKwezcKTNi1/c
	SsAbhnjUDpFkEhKjhP0ydlLHYhH4vyeMTOjBGGinF8ZVjzPwftr+TATK/BFzJpX5qGquVHv/TarHF
	d0e2Q9Wtyh75Dbcov7RBp1vNGpAZd1D37zwaB12NU1YtltyDGeO7kiliCzZqkFCgH/VVBGYiHSri5
	+T54JuA5Ufo9Az80yb3qfuQFCjeqE8YuqbVCPrUK2yHOVXjS4m/3Cs7xslWHnJeMSmykpRKZ5rSUi
	fHeZNne96+opCmaCcqz5KY1AqvYKXhVcq+ZEg+UTwWY6XGN/mhYu6HTX0J5zmzIvNFZMTtTP5nl5n
	3B611lAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQou-00000009DVx-0RNR;
	Tue, 03 Dec 2024 11:11:56 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQeY-00000009Aui-0i1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ueP7Zmu0cny/97JJOvIfWIB6M+S99UlmuleWK5RgZPU=; b=psJWFowC6z7E3RCXY3xnAtkT99
	Llh5+I/2mpNUYdtXTZEt91x3vMtngQv8AmprqCnzii+nz7G6C2zS+xhjvOA5ilKQNBTyCzfUsjL7n
	j9P/jLS+D8WHHG3CbGxVnk14+5XW2GYQKQXIbq/HfPXnNMx2UH1dhgYDRMn12cEEIH8Cyl8xYmLYR
	4/jBQkBQH2ShdXMPwyw9sTUeJecYNxXd6qEerMGr6X8fhCPY7uNZegrOyc+K31lDLJEMHGB+XXAhF
	zQBdmO83Ps3icWoY2YEBNVbOEcBF8/7rFQeodqQ+j+cxwPM2hVIadegQDjqCHst5PKw1fDOw6Nq0W
	CmGwHTtA==;
Received: from [89.212.21.243] (port=52296 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tIQeR-00Bd83-2l;
	Tue, 03 Dec 2024 12:01:07 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for ti,lvds-vod-swing
Date: Tue,  3 Dec 2024 12:00:52 +0100
Message-Id: <20241203110054.2506123-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203110054.2506123-1-andrej.picej@norik.com>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030114_355359_2A0A67FA 
X-CRM114-Status: UNSURE (   8.44  )
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

Add properties which can be used to specify LVDS differential output
voltage. Since this also depends on near-end signal termination also
include property which sets this. LVDS differential output voltage is
specified with an array (min, max), which should match the one from
connected device.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v3:
- no change
Changes in v2:
- move LVDS port schema to a $defs and reference it from there
- properties are now defined in microvolts/ohms
- use 1 property for data-lane and 1 for clock-lane LVDS voltage swing
- add 1 property which sets LVDS near-end termination
- since major change was done change the authorship to myself
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0..6da9b6e3beb9 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -80,12 +80,12 @@ properties:
                   - const: 4
 
       port@2:
-        $ref: /schemas/graph.yaml#/properties/port
         description: Video port for LVDS Channel-A output (panel or bridge).
+        $ref: '#/$defs/lvds-port'
 
       port@3:
-        $ref: /schemas/graph.yaml#/properties/port
         description: Video port for LVDS Channel-B output (panel or bridge).
+        $ref: '#/$defs/lvds-port'
 
     required:
       - port@0
@@ -96,6 +96,36 @@ required:
   - reg
   - ports
 
+$defs:
+  lvds-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          ti,lvds-termination-ohms:
+            description: The value of near end differential termination in ohms.
+            enum: [100, 200]
+            default: 200
+
+          ti,lvds-vod-swing-clock-microvolt:
+            description: LVDS diferential output voltage <min max> for clock
+              lanes in microvolts.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 2
+            maxItems: 2
+
+          ti,lvds-vod-swing-data-microvolt:
+            description: LVDS diferential output voltage <min max> for data
+              lanes in microvolts.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 2
+            maxItems: 2
+
 allOf:
   - if:
       properties:
@@ -120,7 +150,7 @@ allOf:
           properties:
             port@1: false
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.34.1


