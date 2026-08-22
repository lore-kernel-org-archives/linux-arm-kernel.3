Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91576C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SWkv33Y+74+gq7J0O5ontHRvQtInE5grEbn+LzFrXq4=; b=B4g1Ia/V39BXMrofcDpnKVzMFT
	uq88Pjw2PFbxEsFgcs+mLwYG6NkxRF483x99NNUUHLNaNvaqle8THWgiAWDZrCZquXUY9KsScQVy9
	WZwiBlTzObE3SstjSw+sPuup/rDakGv4svy93O5xyBUgcZpa4krVgrSyVH+QdD6MUaXIsf0r4h/cW
	jBsJxwpmQ6uJpsOIejIT3PZx3Re4Jy3A1YsaDlUSdYJ4k1DPnb+trUx7EuHgvEDcU4ox94Vm7tGm7
	5xogM2B734uHSF5nPpTM+U+LuIlY8A7BHKk3Vzww/VsuBt1lGCD2fjlZjaHk27a4xeL2Zl1blyMg9
	3WJK6GWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiCA-0000000EQrc-1DRZ;
	Sat, 22 Aug 2026 09:39:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiC7-0000000EQqb-2YPR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:39:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-39266382df6so1466159a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787391558; x=1787996358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWkv33Y+74+gq7J0O5ontHRvQtInE5grEbn+LzFrXq4=;
        b=AdnXbMh347Xg3fp4zuSRHSamdPYnEDDvx7ZybFQpsAvMg2joFy7V4M50LNHWNrG1XM
         q+9kj2EZIgbqi5KKZp3npp+lZdoCbvE59Bge9g2VkbWoPThixSMXdHJ5GS4ZoyeEgeh1
         V3XICs7VE+bnrnqRu633wSDRyT3r3GvdBcAuhAIrwHwzfMeAV63z8dEWmXaTzEfloDQ2
         K61rOu++0Y/dyyV2uiLZwZiWcweII4QVOQCZfEb+kiG79K1gFu09ChKlfn6CcCLqUh1j
         zdLUTdUxZDbdX8C4EfIXysYBzk3nQ21bL7Xftd0Xw8XwI0yS6XOiAYgmYjkNYYKIT2Wg
         PqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787391558; x=1787996358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWkv33Y+74+gq7J0O5ontHRvQtInE5grEbn+LzFrXq4=;
        b=ktKHsSmFteMXMYcrVZKjcDOOwlPYOaeRGIuo5io/XDSdrYYzW4AzyFvgY0PhcaHsJ/
         CEloXiU58Ql6V1V2ZK+DJ49cKsXPBiImocauXHt3RpamqrcOe6v/8WXA/yXug7YMZeGF
         kvtMwBvkb9nnLA7RzsbIJIvxnEVxsJaEfRQI0OmnsD5/FeW3PlAjP81n90LMNELrI1fv
         P2eXCDVsLFJlWYlEcwnEFo8YJtXg+vOVFIYVsOhsFXc6w9BtQw8O+mOJnSy+aU/h3OEC
         K9wNXc1TY1mHXAA60tjI6GLM9xZhkxBZHeufLLHhigalUNyAwCs03/8TsbtGbB5++kw8
         VAsw==
X-Forwarded-Encrypted: i=1; AHgh+RoAu/YyjIUfOzfKyswvnbIx+0vH1mPgQn3pt+fpVYr+wYIkokL8Jafn23uadN09mQlmNZbryeupy23GTZFsqB/H@lists.infradead.org
X-Gm-Message-State: AFuF++l7lvtCqjG0OeEY7qKtY9hFT28xH4nPOKaAxsLGwvwdwo/GgvYc
	5XvS++tf6vHKDDh9ixotglK3lXGC10n1KxEGKeCzx9+RRVBsxn2eobV1
X-Gm-Gg: AR+sD12uq5QybFrz7o8OaumDw3OrrPpND38zq8fZCgsL+Va2fxcm73a0bBhw5wgl6JT
	y1yMc60WbU8VLBVcgscuYaCAV9B4Bsq0C+EGGiwQNOMOrDTz1Z8sZT/8zNq64TZDJyvctDLr+8m
	CsGTVj6Bq1/4pY8TrNPZivgprhdAl6fgNdGUlvSEmrUmQ+riKadf63sNtxlP09CMABP8bHUPjUj
	E/hKkdRxYh551RfqvOHq3KQzYz1W/G5RJx5PxvJqW8tZoEBxsikA9CCE6IRMYgW7kLQSlHpkzCZ
	SRH9SPVksLV+zhJIv+rh9lVabx9Wq7M66jNCahUyb5FJWCfC+jKZPu4ktOvCyHG7x4WB9MHoPmu
	i+wfbeDgWMQLww09SGecJ7D16HvAaiS7u5ltz8e9n/5h9eKwFjQBVYHi0EeTPG2kOWz+uhMFYwo
	eLIHFKFj6YqvM55HWNAqQumgpaLFlwa57WV3yhleRaVSk/8pO/e+Nv1+fpnIW7ZVs=
X-Received: by 2002:a17:90b:3945:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-395c37199b7mr23933867a91.15.1787391558342;
        Sat, 22 Aug 2026 02:39:18 -0700 (PDT)
Received: from Ultimate.. ([2406:b400:53:4f23:d4ee:2200:a28b:c285])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8d26sm2171183a91.10.2026.08.22.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 02:39:17 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema
Date: Sat, 22 Aug 2026 15:08:29 +0530
Message-Id: <20260822093829.46295-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_023919_653260_A5A4959E 
X-CRM114-Status: GOOD (  16.01  )
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

Convert the MediaTek G3D system controller devicetree binding
from the legacy text format to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v4:
- Add Mediatek Soc maintainers in the send list

Link to v4:https://lore.kernel.org/all/20260326181726.64957-1-challauday369@gmail.com/

Changes since v3:
- Fix $id path to match new location

Link to v3:https://lore.kernel.org/all/20260325181509.3430-1-challauday369@gmail.com/

Changes since v2:
- Move binding to soc/mediatek directory
- Rename file to mediatek,mt2701-g3dsys.yaml based on fallback compatible

Link to v2:https://lore.kernel.org/all/20260323180616.23333-1-challauday369@gmail.com/

Changes since v1:
- Drop redundant description for reg
- Drop redundant description for provider properties

Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challauday369@gmail.com/
---
 .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
 .../soc/mediatek/mediatek,mt2701-g3dsys.yaml  | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
deleted file mode 100644
index 7de43bf41fdc..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-MediaTek g3dsys controller
-============================
-
-The MediaTek g3dsys controller provides various clocks and reset controller to
-the GPU.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt2701-g3dsys", "syscon":
-		for MT2701 SoC
-	- "mediatek,mt7623-g3dsys", "mediatek,mt2701-g3dsys", "syscon":
-		for MT7623 SoC
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The g3dsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-g3dsys: clock-controller@13000000 {
-	compatible = "mediatek,mt7623-g3dsys",
-		     "mediatek,mt2701-g3dsys",
-		     "syscon";
-	reg = <0 0x13000000 0 0x200>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
new file mode 100644
index 000000000000..ad3df062d5db
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt2701-g3dsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek G3D System Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+  - Ryder Lee <ryder.lee@mediatek.com>
+
+description: |
+  The MediaTek G3D system controller provides clocks and reset control
+  for the GPU subsystem on MediaTek SoCs.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-g3dsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-g3dsys
+          - const: mediatek,mt2701-g3dsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+       g3dsys: syscon@13000000 {
+         compatible = "mediatek,mt7623-g3dsys",
+                      "mediatek,mt2701-g3dsys",
+                      "syscon";
+         reg = <0 0x13000000 0 0x200>;
+         #clock-cells = <1>;
+         #reset-cells = <1>;
+       };
+     };
-- 
2.34.1


