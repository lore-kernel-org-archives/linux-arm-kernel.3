Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47255C982FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6I1c2DKea4EEAi8SLaXvb55Qi01ll52Fv9Ok3/gsA0U=; b=Ur89+/gpnPm9QGB4LVaIIGcUKS
	obnUgiTPHWja4qeAArnCcJ4R/RCit0YCJI+Qit3iVt4zZ+L6p8+FAhaMJPb0ROn9A6wYehr311B4z
	Q+YKtLyLZPXSUT5jf+t+PEmKDCRi0AXuo6aFwP4MpbKrsOssJ6op9yndJt8Q5NhdKzCxXiuxUy6D5
	vutgtO8A3VIOAG0BYXx0lNKouNq+MsSKY8dVpqUXloYIiNvmDQ+vAO42CB57pWvs6/6IzlkxN+jGn
	FKUNlnimpTm9Y37kWzNJ+5krf4GZWJbukaq1tmpiFS8rEH8YlJIt2ql196ok/VDjLxEJNi8saPeY+
	frHZ4E6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nO1-00000003etL-2vsy;
	Mon, 21 Sep 2026 23:25:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nO0-00000003etA-2gLV;
	Mon, 21 Sep 2026 23:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B678260236;
	Mon, 21 Sep 2026 23:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE431F000FF;
	Mon, 21 Sep 2026 23:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033123;
	bh=6I1c2DKea4EEAi8SLaXvb55Qi01ll52Fv9Ok3/gsA0U=;
	h=From:To:Cc:Subject:Date;
	b=lFShLVFLoiJWchmE1b7VGA36VTzuP1kn0UQ38IfKlVlQrWmYn/JkUccia0GaV4xFK
	 0LY0w4qE5UYm2WG3x1sUTGgzrGo8lxL1E5X8N5nXVnhK/XvfLZ9f8f9JUQG4fL9o0e
	 8OeDWw/uBx6Uucc46yqlwJP+A7v6KKYUb+JpvCkvknmvKi1GK1jpKjn0ZrXutxAkOB
	 HhPk/Och7EriEHR352q9JaaXThNJkUWMHEUBhqOQgAQv8/QEBbJFOJdj2/ay1KP+w7
	 9zETy60uNDBgrK5wQeFGXbkfeg/YGUX49h4nJMi7rrZUr0ap7uTLMClUYupU/Z10zK
	 mnynxz0k5LLMg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
Date: Mon, 21 Sep 2026 18:25:19 -0500
Message-ID: <20260921232520.3127457-1-robh@kernel.org>
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

Allow single-register MT8188 SCP dual nodes with only the cfg
region. Keep two-register and three-register requirements for the
other MediaTek SCP variants that need SRAM and L1TCM regions.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index bdbb12118da4..2f0a28c7a24c 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -171,6 +171,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
           items:
@@ -185,6 +186,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
         reg-names:
           items:
@@ -195,17 +197,31 @@ allOf:
       properties:
         compatible:
           enum:
-            - mediatek,mt8188-scp-dual
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
           items:
             - const: cfg
             - const: l1tcm
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+        reg-names:
+          items:
+            - const: cfg
+
 additionalProperties: false
 
 examples:
-- 
2.53.0


