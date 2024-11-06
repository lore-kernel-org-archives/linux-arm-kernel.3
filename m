Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A05BD44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6v690GD1bQoY7uAmDqlHHIVXU8KeGeFlzk0ZkeLKKY8=; b=j1qQ6+raNMxj/gibUOZ+oZVq61
	JwwAwL5hcsPVduwZi6jqojn7XURHc5T8estyqmrFFK13z6ZJLt7lkF6x1fqlRgJkFsSKrKZaextht
	a2QxtJM5Oll9NjnQKPoXCeNRT5PJ06LBfB3iC6f48h33sHeY5VuUZXiuqbAl5Ys+y+bK+KcWeR6v7
	oumYd3DnN6wXaxPraXEZRUwFLpGIhJfIhFLdu+as6CMuf6liAanZGK0h56CZS4mQ/KEvINcHVWud8
	HqYuFDnExr5rp3Eg8MhmlGqyfm7VfRCKwEvFWU3c9InTZGmSJS12ozNxysCowjXZ/7czB+tJ/EeYv
	ePQQiaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hze-00000003p2V-3ytE;
	Wed, 06 Nov 2024 15:30:50 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hxu-00000003oZZ-050X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:29:03 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6B4fQS016086;
	Wed, 6 Nov 2024 16:28:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6v690GD1bQoY7uAmDqlHHIVXU8KeGeFlzk0ZkeLKKY8=; b=srEb3s2iU8rQBYHd
	x5/+cPGt89UP8l6ajUXOm1j2Jyfr9WR6Pa+09jc7KcO7wl6Lsvk5p8eHq/78isSK
	R4/+9Wla7GbRiR9qKTecn9EJxbkHsqKUhyiCF5PqTIE6E7o0BXUsL0lFxYSy7JX8
	a9RXi1lM3tr8GXoch8Gw3dmfwEBZj4KR48NdHWgfkCJjxf6BE9JkW/zpvj5/+wuJ
	ZppFlAhnpRTmi/RpgLcMjudMB7HfsCL0iE7DWty41G1hHjiZdwYzAoLiyklZBv0m
	IrDTTpXYEYdviFrJUauTjTGKyH0VlXmPngw1sxd0aXLqZDgJZKymhsFbsgeDnF8B
	One9Ig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nywnfar5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:28:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 87C2E40045;
	Wed,  6 Nov 2024 16:27:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 821392656DF;
	Wed,  6 Nov 2024 16:25:35 +0100 (CET)
Received: from localhost (10.252.15.15) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 6 Nov
 2024 16:25:35 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: add stm32mp25 support for i2s
Date: Wed, 6 Nov 2024 16:25:27 +0100
Message-ID: <20241106152528.939232-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106152528.939232-1-olivier.moysan@foss.st.com>
References: <20241106152528.939232-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.15.15]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_072902_622307_EFAA4734 
X-CRM114-Status: GOOD (  11.26  )
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

Add STM32MP25 support for STM32 I2S peripheral,
through "st,stm32mp25-i2s" compatible.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/sound/st,stm32-i2s.yaml          | 60 +++++++++++++++----
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index 8978f6bd63e5..8f08f1f28a1b 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -13,13 +13,11 @@ description:
   The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
   Only some SPI instances support I2S.
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
       - st,stm32h7-i2s
+      - st,stm32mp25-i2s
 
   "#sound-dai-cells":
     const: 0
@@ -28,18 +26,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: clock feeding the peripheral bus interface.
-      - description: clock feeding the internal clock generator.
-      - description: I2S parent clock for sampling rates multiple of 8kHz.
-      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+    minItems: 2
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: pclk
-      - const: i2sclk
-      - const: x8k
-      - const: x11k
+    minItems: 2
+    maxItems: 4
 
   interrupts:
     maxItems: 1
@@ -79,6 +71,48 @@ required:
   - dmas
   - dma-names
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32h7-i2s
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock feeding the peripheral bus interface.
+            - description: clock feeding the internal clock generator.
+            - description: I2S parent clock for sampling rates multiple of 8kHz.
+            - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+
+        clock-names:
+          items:
+            - const: pclk
+            - const: i2sclk
+            - const: x8k
+            - const: x11k
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-i2s
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock feeding the peripheral bus interface.
+            - description: clock feeding the internal clock generator.
+
+        clock-names:
+          items:
+            - const: pclk
+            - const: i2sclk
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


