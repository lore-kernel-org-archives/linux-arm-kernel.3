Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC8C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWhNXOfPjDZW7k+9cbgV4wS145BPewRuTiI1JHa99ho=; b=L3TSfKAnKSR2UA+jfbP4UBBZvH
	CoZvSqWIAO87VsoYGCf2GR2Zy51Xczb34Fz7RzaIUpwAQfF/53fYtEMBMTcI/LYpR5FdDFxopHcBJ
	Q9ZvfDeosQMp9nR/b8T5zIaosWFust9JbjIHu4nspikWKlKRLIS/DNS3AL+YAILcSG9t9zxUUiC/F
	PfzdkshvAGoqJ7Pk4B5TmDgbha9gAYBg8L8mzjTsU+E9fJBANRc4fi2S0EgYusY4jdUJSAggc2drO
	bxDM2KBJ4Hc2bOvNyjGUE5i1rKGFGgn09d+D9PM1I6RgYCgwKbWC/x9wjZyiWsoTWuiDB9HBmUS7E
	D2Fp0BKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6iM-000000041Wm-1wUz;
	Mon, 16 Jun 2025 10:05:18 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR649-00000003uRM-44Ld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:23:50 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G93VaH021379;
	Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PWhNXOfPjDZW7k+9cbgV4wS145BPewRuTiI1JHa99ho=; b=8Hn71vglaGZGk6T8
	3KJTs4aREHjVYKpSz8YFfnkDPfunAuFkrG07QqAgPxiOJLABtTHY+d2Qyqy+p3Lw
	/FYWBdURdT/6/QfIQzqtkgGuztLxZLqIWgUsjeIEgMonBE/3hjrnErAUsp74Pnc/
	Z8p1DaQMyMq1tERMhePfiB3h6SvqbcOWvEMoqSnXqomQ0sFAXVRCxV9DYgks6RCT
	Ry9zf8fzbI5NbAYepn4X11t6qc+ljSH+DXl8t+xwsem0eeTeQlkIWjijTQs59VrS
	u1W5UjOCW3YsxuLpV/kl3o4U/uQ/RhEnaEYbTnFniQKo6qaE4Y3vfMpx/V9EMou6
	hgJLZw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478xgmg80x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 39FBE40057;
	Mon, 16 Jun 2025 11:22:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 611AFAA6ECA;
	Mon, 16 Jun 2025 11:21:09 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:09 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:04 +0200
Subject: [PATCH 3/6] dt-bindings: spi: stm32: update bindings with SPI Rx
 DMA-MDMA chaining
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-spi-upstream-v1-3-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_022346_291849_A4D630E5 
X-CRM114-Status: UNSURE (   8.97  )
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

Add MDMA channel, and new sram property which are mandatory to enable
SPI Rx DMA-MDMA chaining.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../devicetree/bindings/spi/st,stm32-spi.yaml      | 48 +++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 76e43c0ce36c..ca880a226afa 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -18,6 +18,38 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32f4-spi
+
+    then:
+      properties:
+        st,spi-midi-ns: false
+        sram: false
+        dmas:
+          maxItems: 2
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-spi
+
+    then:
+      properties:
+        sram: false
+        dmas:
+          maxItems: 2
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
 
 properties:
   compatible:
@@ -41,16 +73,28 @@ properties:
 
   dmas:
     description: |
-      DMA specifiers for tx and rx dma. DMA fifo mode must be used. See
-      the STM32 DMA controllers bindings Documentation/devicetree/bindings/dma/stm32/*.yaml.
+      DMA specifiers for tx and rx channels. DMA fifo mode must be used. See
+      the STM32 DMA bindings Documentation/devicetree/bindings/dma/stm32/st,*dma.yaml
+    minItems: 2
     items:
       - description: rx DMA channel
       - description: tx DMA channel
+      - description: rxm2m MDMA channel
 
   dma-names:
+    minItems: 2
     items:
       - const: rx
       - const: tx
+      - const: rxm2m
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandles to a reserved SRAM region which is used as temporary
+      storage memory between DMA and MDMA engines.
+      The region should be defined as child node of the AHB SRAM node
+      as per the generic bindings in Documentation/devicetree/bindings/sram/sram.yaml
 
   access-controllers:
     minItems: 1

-- 
2.43.0


