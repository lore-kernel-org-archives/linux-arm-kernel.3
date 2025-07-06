Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1601C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+vT8Ul1qnTCROYuTa6lzNNJDXY2MHOSxjkUrVjWu/o=; b=X572AFYmLNzNtP4aaedq8qJLoQ
	IZKTMSzAamh1Q0oZ7qHrOeaCXgQSfzoLydeWL/RidSOl00V7ftOdK221XqcVhdpIKIkMUU2PB5vvV
	ljD6tRBgXCWp9ao/elsbP3/cPvltSBr9Ub1bf8gSJB0sb2kbu2TyokiOozsq7JwGTj2I4WN9dzXe2
	Mpel+2iXU5hslP+DFV5+LNZa/KHANS53Wby3raRYW+wrCxw84LsWXzaKkGj09yWrDlguCGh+/mCjc
	Mxujn4g16li04/HqmW0yhtJoJOxtoNhL20/jY4vagypUvajoKG3DDNqSybEjfLjCN73HyaFzQYQTJ
	EkG1TxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYTGO-00000000aTR-3P8F;
	Sun, 06 Jul 2025 17:34:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYTBr-00000000a2P-0wf1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 17:30:12 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0B68525D7F;
	Sun,  6 Jul 2025 19:30:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gwBGOvTxX10; Sun,  6 Jul 2025 19:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751823009; bh=oChcwplCN0suk6lHWq6XWl/N6zCbWSAQbXpXzN4LkkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PD5G3p64ULwvpSu66WVHHVAgI81CdxKe8wQbB0nrScjLZ8AzFAMltgZbiad/7HVdV
	 c+iZnzeiLxG5XiPK68q0zur+edJ3P+mADB/d56iVtHbqIryK827N9m7vpCIYKhahuQ
	 2am4ExOUsE77rOe6hqgE+Vggg5oQzh7+fEoFeS50XLQ/UofQGueJQIFad5R/Cx+yAO
	 UxB/wCQDBpMqD9b/wf1tNcatpMNfer8IjuEBawuaNeS0asaakJdPGPtITjiua4rPUU
	 HckcMdpkk9ap5//cc9Zkdf2fToEGAstgM+1RUqGkdRunzsuvbGzgn2APsTAXo+N0W9
	 gFEU0k/acWhIg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 22:59:45 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: samsung,exynos7-decon:
 document iommus, memory-region, and ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
In-Reply-To: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751822991; l=1983;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=oChcwplCN0suk6lHWq6XWl/N6zCbWSAQbXpXzN4LkkE=;
 b=QTmWHnA11sNP8XEsfDTBxLU0bIaujjqcVMgDPt2eNUJ6zRtTgzfMTVb5/FKagmo4PY9yuIt0Z
 h7w03bs+hqbBKkqI0tIDmiVOvAcEzChrFPzdFQvcDhY9DoxhEedLUXp
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_103011_400363_CA0B9FE9 
X-CRM114-Status: GOOD (  11.99  )
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

Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
- May optionally require an IOMMU to initialize a display region.
- Outputs image data to another block, say an MIC or a DSI master.

If an IOMMU is present, it may also require to access the reserved
framebuffer region.

Document these bindings in the devicetree schema.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../display/samsung/samsung,exynos7-decon.yaml      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
index 53916e4c95d8c0369138941a556c23f5d42fbd39..14b954718008e06aa1627fcd116a61927ce29e99 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
@@ -80,6 +80,21 @@ properties:
       - const: vsync
       - const: lcd_sys
 
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description:
+      A phandle to a node describing a reserved framebuffer memory region.
+      For example, the splash memory region set up by the bootloader.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port which is connected to either a Mobile Image Compressor
+      (MIC) or a DSI Master device.
+
   power-domains:
     maxItems: 1
 
@@ -92,6 +107,7 @@ required:
   - clock-names
   - interrupts
   - interrupt-names
+  - port
   - reg
 
 additionalProperties: false
@@ -118,4 +134,9 @@ examples:
                       "decon0_vclk";
         pinctrl-0 = <&lcd_clk &pwm1_out>;
         pinctrl-names = "default";
+        port {
+            decon_to_dsi: endpoint {
+                remote-endpoint = <&dsi_to_decon>;
+            };
+        };
     };

-- 
2.49.0


