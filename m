Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B8AC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4mz/usRwfahiA64ZjUa87b5wgnA9CQffMrhjfH/JqA=; b=UFMH/JAnxoocaXq1vQ+fM9zdHp
	hPNvY1G4huvba45VQQ++GsR1G8bd+GfVyuqkxrcIgYHNk5kWKfEB/jsyIbQ7vMRM6IG+btpOWBWgp
	3GtFSaOEVsaEBUlcGa2zYu4ql4h5AgQL9csTrtNlpEaiNmkjyMQgSOek6/DbCy66Bo1FKS5fhSlkc
	0qF8f53337sAG/1MqRV94fCW21UzqT5HV5S5f5zy6iaicLAAnmX164sepNT2786c+jc8ceGoKRWfn
	uEd/ZKxVigNuLFSiBGKWJ/tM2kBQIHBjwwOePSyRvSt5CsiZCtOpUDFZ4ow+SBo9zfd3OX08zSaaN
	6ZyQtIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCcg-0000000C6PH-1J6O;
	Tue, 05 Aug 2025 08:02:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCPX-0000000C45j-3W2w;
	Tue, 05 Aug 2025 07:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754380118;
	bh=/oEzo87CWaILm9HqGt46UkB1R49zirOV8M9U5d5DHgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qo/XefdIZj+0wfo2YP4SMJjNvwX/+WzpylDDXDA8tHLJdRxt1X45pX+jCCeMJmeds
	 hojv6171/r5As9fc51/SoJDhdnZu7FJcEOiY6YaNN5V6QZE16A0VHcV5RHjtssXegv
	 IaTCp595id5m10xALd8XLxGTLqxk+rbJFvaRSbdPwsPPyolobvxHpKKTmsHVos0oyX
	 Vm8utEtYr6KTFYy5ls5uXRitAlrST3vnjavJ+LnPsNq5KG9FsG1ZIN4huDnMjQ494x
	 xw3VhC4OsczT5Ki10QgC51lCYKJp/ik5s/sBU43YyG/2stvF7wkRubp6aUssQ8SfjA
	 yfjOL/V8sWoaQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AB6C17E046C;
	Tue,  5 Aug 2025 09:48:37 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 02/10] dt-bindings: clock: mediatek: Document #access-controller-cells
Date: Tue,  5 Aug 2025 09:47:38 +0200
Message-ID: <20250805074746.29457-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004840_062264_90DBC0CA 
X-CRM114-Status: UNSURE (   8.32  )
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

Allow the #access-controller-cells property on all of the infracfg
controllers on all MediaTek SoCs, as this always acts as an access
control provider.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/clock/mediatek,infracfg.yaml         |  3 +++
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8188-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8192-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8195-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8365-sys-clock.yaml | 15 +++++++++++++++
 6 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
index d1d30700d9b0..27f1a31c3424 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
@@ -47,6 +47,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 1c446fbc5108..2a1bf9073b7d 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -36,6 +36,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -48,6 +51,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8186-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
index db13d51a4903..08472d363e8a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
@@ -36,6 +36,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -49,6 +52,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8188-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     clock-controller@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
index bf8c9aacdf1e..f1ab8b0e0a98 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
@@ -26,6 +26,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -38,6 +41,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8192-infracfg
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
index 69f096eb168d..dcce8b188e4f 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.yaml
@@ -34,6 +34,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -46,6 +49,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8195-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
index 643f84660c8e..b6f074f98db7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
@@ -28,6 +28,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -38,6 +41,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8365-infracfg
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: clock-controller@10000000 {
-- 
2.50.1


