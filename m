Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2C1D43370
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdQ63519VTwDDYOb2ko9io8ZGiOolYAXq3k/7DS5g7Q=; b=UFWPmPlu5W7MOmMyRCtzAEcKl/
	lZZuxh8pVKlyd/a9eSXM2LOiDw1CbzcjHlgWkFg6mgFdpajY0nQNYeAur+LROUOjXF1RvvMlb3YpX
	tw/PNLadxQO2b0Cln92em8NwYhjjAtOoqVnvWxd7Vy4QWvQcJ1rWygLKhmsFhX8QnOX5BpbOSUt9e
	EfxbMmkYRA5lcAxyyvl80kXMpRZUbTDVo91sKdyNonx41tgLl0ifms8TTrzC20TsQXPdLIWUpDdiM
	7NQRdQrmzCoimoBGs3i0apxZsV1zU4C7kjVuNeYZAMHTAN4K5w29TcCJ8vG917M0GtAD/tWW1g8/P
	7kyIrLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94uM-00000007WOs-3WOl;
	Thu, 07 Nov 2024 15:58:54 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94qQ-00000007VXk-3y9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:54:53 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Ap0oi001233;
	Thu, 7 Nov 2024 16:54:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DdQ63519VTwDDYOb2ko9io8ZGiOolYAXq3k/7DS5g7Q=; b=dqTLO5o5EoF+cjp9
	WQj/kqPQSsBdtHKkEjAJ2ge82+b0WHRCd26G5Oaao5bHaTmeVUnfa76STxJXqwtC
	mnZzHEFhfsVOM6Q/2FjGZlN6lL8QtkmzBd1Mf4o55TTiKnYKX3J5tR8sTwUuInMf
	ajeGPPzxNSjCLtWluzu6s1HCUBmfi2ne61uYhNzocSqmmhQIPdzrCbZ46/gqhX3b
	ZHMQhBM/j3gTetLawEjT7zuELoP4NOhjFitIDFAnY8jLRBKx/+kVLqA5NR4H6dfz
	Yj7tfN00ZzoG0ovrRo0v49mYKTQJ+ovPF92qFY2XmBIZi4tVUOyU38rQUs968DZw
	gQ7MlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42r9765y3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 16:54:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 07AA140048;
	Thu,  7 Nov 2024 16:53:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A95982B7342;
	Thu,  7 Nov 2024 16:52:01 +0100 (CET)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 16:52:01 +0100
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
Subject: [PATCH 1/2] ASoC: dt-bindings: add stm32mp25 support for sai
Date: Thu, 7 Nov 2024 16:51:41 +0100
Message-ID: <20241107155143.1340523-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
References: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
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
X-CRM114-CacheID: sfid-20241107_075451_524956_6C57529F 
X-CRM114-Status: GOOD (  10.78  )
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

Add STM32MP25 support for STM32 SAI peripheral,
through "st,stm32mp25-sai" compatible.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../bindings/sound/st,stm32-sai.yaml          | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 68f97b462598..4a7129d0b157 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - st,stm32f4-sai
       - st,stm32h7-sai
+      - st,stm32mp25-sai
 
   reg:
     items:
@@ -43,9 +44,11 @@ properties:
     const: 1
 
   clocks:
+    minItems: 1
     maxItems: 3
 
   clock-names:
+    minItems: 1
     maxItems: 3
 
   access-controllers:
@@ -156,7 +159,13 @@ allOf:
           items:
             - const: x8k
             - const: x11k
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mph7-sai
+    then:
       properties:
         clocks:
           items:
@@ -170,6 +179,21 @@ allOf:
             - const: x8k
             - const: x11k
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-sai
+    then:
+      properties:
+        clocks:
+          items:
+            - description: pclk feeds the peripheral bus interface.
+
+        clock-names:
+          items:
+            - const: pclk
+
 additionalProperties: false
 
 examples:
-- 
2.25.1


