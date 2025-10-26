Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9309FCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utgZIgZouZ2rivSw9fdUqvFMGknqClgIGWmWeoQd928=; b=4KlGjFOQD5u0GC5TF89Kujpc+j
	X2sR10nlPn6BozmmqvTLRBbgwDq/36dLAwE3dztBFD/XPZOFZvOUIna9/fOVVZF+WRmnjo26LqpSv
	d157B34myNI/1dxZhMCG4adKfVRNM/sb/on0cXimMFgqHjFBWBlQ0qAqpVhR09/Nr00Mck7fzPz2t
	FF188Bf7Y4VmKrQnK4BIhTpFFwNOqaFMPdJXwWkpVLtlb1f+axaK2XnvIZOMeFNThFQMx17Dxr5pJ
	bdLLHqvX9YmroikNrCCbHarUPm66v94E9VtFMDJFOP3bTHsCIWxXS0aY2s+/TV/q1O8oqy5+th2K2
	NUqMT0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlM-0000000CJFn-1YWG;
	Sun, 26 Oct 2025 12:22:20 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlC-0000000CJ8A-14qu;
	Sun, 26 Oct 2025 12:22:12 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id EAA3160666;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761481325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utgZIgZouZ2rivSw9fdUqvFMGknqClgIGWmWeoQd928=;
	b=jzFkCQ0rm5xX/AZDOCLrqTZSn5am4MENCC0H+Ho2xlaXNHXFgJ+AKsYvXjQeqZpOg6wnjb
	sPKmZvIwR5nnDZUB+kEYwVgNSXKErXUBoXuXLCUBbExorNtKZaNfeUL24rDCftc4ry0Poo
	b96b3Ur9mhDC6x3sKXiF1rhmN9LZh1Q=
Received: from frank-u24.. (fttx-pool-217.61.154.70.bambit.de [217.61.154.70])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id AA9F51226F7;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/5] dt-bindings: thermal: mediatek: make interrupt only required for current SoCs
Date: Sun, 26 Oct 2025 13:21:30 +0100
Message-ID: <20251026122143.71100-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026122143.71100-1-linux@fw-web.de>
References: <20251026122143.71100-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_052210_508623_8085BDF3 
X-CRM114-Status: UNSURE (   8.02  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Upcoming MT7987 does not have a IRQ we have to make interrupt-property only
required for current supported SoCs.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../bindings/thermal/mediatek,lvts-thermal.yaml | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 0259cd3ce9c5..7ec9c46eef22 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -58,6 +58,16 @@ properties:
 allOf:
   - $ref: thermal-sensor.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7988-lvts-ap
+    then:
+      required:
+        - interrupts
+
   - if:
       properties:
         compatible:
@@ -75,6 +85,9 @@ allOf:
         nvmem-cell-names:
           maxItems: 1
 
+      required:
+        - interrupts
+
   - if:
       properties:
         compatible:
@@ -91,10 +104,12 @@ allOf:
         nvmem-cell-names:
           minItems: 2
 
+      required:
+        - interrupts
+
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
   - resets
   - nvmem-cells
-- 
2.43.0


