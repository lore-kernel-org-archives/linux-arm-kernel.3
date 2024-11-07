Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A3ED4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ienHGXKCWAz/ANukHZpdgkhnrKTvDCmbAMpuaZRiPmI=; b=bJykQpcKJ16/l3y5s8KmdLLPaP
	/1yz/zEQy38awFIc7zHgzW90U++lI90T1zKLFlxeTaprg6FEfbzlwaka6YJHj/oBlHMZgBt5bCf3O
	P9j6acVZUVQLrYH0+rRhaeiWl/ktTWjJaDTZa9q1+jV9q3C6qyb52977NMcBZRikwMeEv5AwjNvo8
	bPmrfT64FfYffdOjvY2FB9qVBzzoFi6Y19Jqn3Ehib+gokkHkRfspMDzjewJy0Y1cvdKYKNz47FWR
	w8hXTYk50pzBVIA3cZqeYCS6IM7iRMb9JCwQUVLOxuNH8bzh1vvSCZavPy96Je4SDeZ+5hJ2Mx5BB
	FAoFeODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93qv-00000007L2R-03aw;
	Thu, 07 Nov 2024 14:51:17 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93p8-00000007Kh7-2uP0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:49:28 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7BPOxb001277;
	Thu, 7 Nov 2024 15:49:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ienHGXKCWAz/ANukHZpdgkhnrKTvDCmbAMpuaZRiPmI=; b=GCsEjwdqoQWsIWta
	2m5eWnfgDeOV9wLIgabL+vUnYSe6hYGROVrGv3zcvyPY8khtzjGMErbUO9E84dRj
	AzcjJLlLSeP1w8G5aW36WtSoLmLm4admIo7aHBHomAw9XJ69HvNIpp50Z7mAkBlP
	mYIoBPrTb4IO2Z4/M3Awr5TZekUP9QTFhkTJYlQZS3wO7xHQ5QlmmBUMtQI6ZGEA
	8RxhxM1tmne2dTCua5NUrROqBWwgUww4TNE9Z3vB0UbMcN/VnGNW8SkpEMou3v4V
	1CuTODTNpq7av7riP8K+0cEOLV4YrhI9EUzzTk8HWLXmBfpZ4PZGZpg3TQmH6I+9
	QNu0rA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42r9765p3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 15:49:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74DCA40047;
	Thu,  7 Nov 2024 15:48:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D1D22BA0A8;
	Thu,  7 Nov 2024 15:47:37 +0100 (CET)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 15:47:37 +0100
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: add stm32mp25 support for i2s
Date: Thu, 7 Nov 2024 15:47:11 +0100
Message-ID: <20241107144712.1305638-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
References: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_064927_207222_A8FA53A3 
X-CRM114-Status: GOOD (  10.98  )
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
 .../bindings/sound/st,stm32-i2s.yaml          | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index 8978f6bd63e5..b4f44f9c7c7d 100644
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
@@ -33,6 +31,7 @@ properties:
       - description: clock feeding the internal clock generator.
       - description: I2S parent clock for sampling rates multiple of 8kHz.
       - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+    minItems: 2
 
   clock-names:
     items:
@@ -40,6 +39,7 @@ properties:
       - const: i2sclk
       - const: x8k
       - const: x11k
+    minItems: 2
 
   interrupts:
     maxItems: 1
@@ -79,6 +79,36 @@ required:
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
+          minItems: 4
+
+        clock-names:
+          minItems: 4
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
+          maxItems: 2
+
+        clock-names:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


