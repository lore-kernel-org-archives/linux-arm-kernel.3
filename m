Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376D0C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Pv8LFCx4t6NMriqTItuy7XpPPudhzwAqEqZ8Lq4mjI=; b=kqwz7fnNkMZBDbXxl65X++7wck
	/5KeMMzlJQbBBnFgyJ/HMtAZ11vQJyOEFeZOKyu2f+o1hLw1k1SNtvhMx75d9eNz+zehD3q5gVXtI
	imOc0DXvKiGR4s7MQnTo2VtscHgBXekEmRhWa6ZGhtZekEOmMsWst5lGvbAvfI7anCHq4BLD/ZqPn
	YAcMLkO4DDNSGb8zm7bKxntWY0KgVq7TLSucCb/XRSGQoU355b1UmvBJCYYklCRZVGPjGYimPda13
	f1d6RLb6r7hvg6HrfCAhF2Hp/bpw8BpW2KM9PS7DBk6PUzcYHnulrOelxEGzjGWnSz5pNyXfQQ6dp
	PqaXBKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd16-0000000ElqU-0hfL;
	Mon, 24 Feb 2025 18:17:20 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcxj-0000000El8g-2f1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:13:53 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OFKCXP023814;
	Mon, 24 Feb 2025 19:13:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3Pv8LFCx4t6NMriqTItuy7XpPPudhzwAqEqZ8Lq4mjI=; b=SEzwfKKXhOi0idtv
	A6QNfbDuVgfR9QDuvk2NlwNvjRR2k17PvPHMp/2BgxeolZJ/7A1icFkNT5GdLttU
	Rs/I56jtDtEsLC208t0ujEia+MiAfKMcZMR3etFYpksvgB8ySlp+qSHCs9Y68JVD
	g6cJ008Q+5MbkcFSQrUMKm3HocBeNo7zHrzjny1418gl0H1KCd6RNqT0hvr6G8fT
	iCVoG93zwc3V2WUjEJNPg0GRSXxGJ7D9TpjoHeP1goDngUyCFQghC0GTGTUvfhI3
	GKYWk8ClQujK4Vjk33KTNbK82Pk/Z+EPgZAjK2fDG+jPbCwOruto868lDCi7cmoC
	XxvPjQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44y6bh0hw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 19:13:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 184994002D;
	Mon, 24 Feb 2025 19:12:21 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 933E553FC05;
	Mon, 24 Feb 2025 19:02:30 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:30 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 19:02:30 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH 1/8] dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
Date: Mon, 24 Feb 2025 19:01:43 +0100
Message-ID: <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.23.75]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101351_953459_65F3319A 
X-CRM114-Status: GOOD (  10.48  )
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

Add a new stm32mp25 compatible to stm32-lptimer dt-bindings, to support
STM32MP25 SoC. Some features has been added to the low-power timer like
new capture compare channels (hence more PWM channels, and PWM input
capture). Some registers/bits has been revisited to support this.
So introduce a new compatible to handle this diversity.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../bindings/mfd/st,stm32-lptimer.yaml        | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index d41308856408..4822ce5d0c76 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -21,7 +21,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-lptimer
+    enum:
+      - st,stm32-lptimer
+      - st,stm32mp25-lptimer
 
   reg:
     maxItems: 1
@@ -48,13 +50,18 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
   pwm:
     type: object
     additionalProperties: false
 
     properties:
       compatible:
-        const: st,stm32-pwm-lp
+        enum:
+          - st,stm32-pwm-lp
+          - st,stm32mp25-pwm-lp
 
       "#pwm-cells":
         const: 3
@@ -69,7 +76,9 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-counter
+        enum:
+          - st,stm32-lptimer-counter
+          - st,stm32mp25-lptimer-counter
 
     required:
       - compatible
@@ -80,7 +89,9 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-timer
+        enum:
+          - st,stm32-lptimer-timer
+          - st,stm32mp25-lptimer-timer
 
     required:
       - compatible
@@ -92,7 +103,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: st,stm32-lptimer-trigger
+        enum:
+          - st,stm32-lptimer-trigger
+          - st,stm32mp25-lptimer-trigger
 
       reg:
         description: Identify trigger hardware block.
-- 
2.25.1


