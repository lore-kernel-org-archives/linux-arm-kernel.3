Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAT2h6WzrOZMzEhukTS7X5Mg1zcABGayhHzVGz0aqKM=; b=IJsIjUxEqkGDm0tOYw+gh9FEVl
	5ZfzdLL0sjeYdoS+Izt/0to1aKf8mgeT3VplBVt2NymB/2T8Z7xwe8n5LO5bMVTrEsgSTVxOs8VKp
	dbRYX5ulc9kkQgw2AxDUvLiGIsIFI2BYqMWqBTJysXHrK60Ajmvi4Z/23Q6+APAkvbLON2PCvPz/m
	wZ/DMRqVX9xJ7jqVEsLwgMcp3RrIK+Wci+TWenNtr2nVKUZ2b7AMZF4MMI++f0SOZ08KcJ7WUqKBN
	SfEVsQxpQwSs199lrk/DRXLaoQSLjrdobaY8o+mcX7YuiIIXlHsmSFSwYV8HFQpePR76SES8gbcem
	frTACwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZs7-00000004W9C-2wtw;
	Fri, 20 Dec 2024 10:04:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZpr-00000004VdC-0Jh8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:02:21 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK89Ckx013359;
	Fri, 20 Dec 2024 11:02:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RAT2h6WzrOZMzEhukTS7X5Mg1zcABGayhHzVGz0aqKM=; b=yjOoLFPyG4vrIF3a
	uABz+3W01cWmGeLbRzdoX6FrjjPiNy0G/0TQ/SJJdgmcTHQNHV8L5Etc97KuFlUo
	Yd+U7fjoBLngy971I07ysATlghw+O1Sd8d3tcKuWGOJ8mVCBLFzGkmfKyEvFBjf3
	wKkJwjDg9UUROpJwaumB5Emv4364ytSC9OBhygtKhyhBywLANc3Lekjkcg+uD+Ny
	FKvfXIQu6DPxrZeTMbjRUvYaRsHuVtRKe1LeB3uiawXQkFTT7InhR+k+ZfElbKoS
	B/nCijRXkFr+8ksAhdHEv92Nlzbp1Nad5mec7IlvxG3V6AG+QB8vjHD2QJRSMMKy
	84VYzA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34bryww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:02:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 491754005E;
	Fri, 20 Dec 2024 11:01:09 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9CD725F1F4;
	Fri, 20 Dec 2024 11:00:07 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:07 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:07 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH v2 1/9] dt-bindings: mfd: stm32-timers: add support for stm32mp25
Date: Fri, 20 Dec 2024 10:59:19 +0100
Message-ID: <20241220095927.1122782-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
References: <20241220095927.1122782-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020219_624433_41C1FDF4 
X-CRM114-Status: GOOD (  10.87  )
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

Add a new stm32mp25 compatible to stm32-timer dt-bindings in order to
support the STM32MP25 SoC. Some features has been added or updated in
the stm32-timer timer such as:
- hardware configuration and identification registers to read the timer
  version and capabilities (counter width, number of channels...)
- dithering mode (can be used to extend PWM resolution)
- input triggers list
- new counter modes
- various bit-field updates
- power-domains property
Timer trigger identifier can be up to 19 (from timer 20)

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 .../bindings/mfd/st,stm32-timers.yaml          | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index b0e438ff4950..66aa1550a4e5 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -21,7 +21,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-timers
+    enum:
+      - st,stm32-timers
+      - st,stm32mp25-timers
 
   reg:
     maxItems: 1
@@ -36,6 +38,9 @@ properties:
   resets:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   dmas:
     minItems: 1
     maxItems: 7
@@ -77,7 +82,9 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-pwm
+        enum:
+          - st,stm32-pwm
+          - st,stm32mp25-pwm
 
       "#pwm-cells":
         const: 3
@@ -113,7 +120,9 @@ properties:
 
     properties:
       compatible:
-        const: st,stm32-timer-counter
+        enum:
+          - st,stm32-timer-counter
+          - st,stm32mp25-timer-counter
 
     required:
       - compatible
@@ -128,12 +137,13 @@ patternProperties:
         enum:
           - st,stm32-timer-trigger
           - st,stm32h7-timer-trigger
+          - st,stm32mp25-timer-trigger
 
       reg:
         description: Identify trigger hardware block.
         items:
           minimum: 0
-          maximum: 16
+          maximum: 19
 
     required:
       - compatible
-- 
2.25.1


