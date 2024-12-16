Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEBAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/v1YHGVNRYUeWMmDsWob1hB9FIOwu/mNjAMSlsgc94=; b=DPmgIe3s9Rr34VrzLKyEeGJNCP
	bd8i9X3rtDVApa5EqGIo4bfj9eEXqKXU5ba4DovzxnSrc4HVlf+TWDwh8tBfCLw1zirFJVVW54a2x
	jA8yZr/KsR8IY0KfU3hY/dtvuxgtmO5JIO5mz0hqGuzLL6WXGao8N8UHZO3YmyzIlUDTFZS/MnjXI
	Msz3gv8L9UG/nlzhRkO67CoNHNx9lc10A28ndXRnF6PA/diArbmQ4t9FJvGwgZipstrxJ1g1MZYxy
	Q2dK+vp3sGGumqqEPTE2rfMBtSMbKjyW4KQv0t1zVOByCs4gKvas/u7vyR6lBgD59fqgEULjWpSxG
	gV3wSxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDHg-0000000ASkF-0PnA;
	Mon, 16 Dec 2024 15:45:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDDE-0000000ARfP-2XMs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:40:50 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEYKiY029957;
	Mon, 16 Dec 2024 16:40:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	s/v1YHGVNRYUeWMmDsWob1hB9FIOwu/mNjAMSlsgc94=; b=dMH7Iju0Z0vXJZaP
	l27EatwrpqbCT/aUc7furYe28ESR/Tg4UqG8mEhdw1u3wycqD1DMV3W1fszv5zWe
	Cnw6x18h0w4SFjJ9zYukBkPiLg3QU0N7W1BeVO1xKjaytOAvhFf20RhT8CswiG3+
	FoggqotezUZ/nDWkUtPgy5lZDUUDGhPVAJSKq1ZN9UGiNSxK3G+TuGSyEmfucFXO
	loIpoi07CmnNvUd5po/OVyOgCXBKcS8OnuPUzlJCckCt9ULzK1JHoYGjd72X/Ock
	mXx8zr2QloSOYZBKcaHbfeldc8VcEfApOqabgrewncHMWVBBhDZXf+mngC0MhOVq
	U6UdzA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jp3987bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:40:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8115140046;
	Mon, 16 Dec 2024 16:39:47 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A880277E0C;
	Mon, 16 Dec 2024 16:39:20 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:20 +0100
Received: from localhost (10.252.30.129) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:19 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <fabrice.gasnier@foss.st.com>, <olivier.moysan@foss.st.com>
Subject: [PATCH 1/5] ARM: dts: stm32: populate all timer counter nodes on stm32mp13
Date: Mon, 16 Dec 2024 16:39:04 +0100
Message-ID: <20241216153908.3069548-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
References: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.30.129]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_074048_950339_021442BD 
X-CRM114-Status: UNSURE (   8.64  )
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

Counter driver originally had support limited to quadrature interface
and simple counter. It has been improved[1], so add the remaining
stm32 timer counter nodes.

[1] https://lore.kernel.org/linux-arm-kernel/20240307133306.383045-1-fabrice.gasnier@foss.st.com/

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index e1a764d269d2..0019d12c3d3d 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -261,6 +261,11 @@ timers6: timer@40004000 {
 			dma-names = "up";
 			status = "disabled";
 
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+
 			timer@5 {
 				compatible = "st,stm32h7-timer-trigger";
 				reg = <5>;
@@ -281,6 +286,11 @@ timers7: timer@40005000 {
 			dma-names = "up";
 			status = "disabled";
 
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
+
 			timer@6 {
 				compatible = "st,stm32h7-timer-trigger";
 				reg = <6>;
@@ -1196,6 +1206,11 @@ timers12: timer@4c007000 {
 				access-controllers = <&etzpc 23>;
 				status = "disabled";
 
+				counter {
+					compatible = "st,stm32-timer-counter";
+					status = "disabled";
+				};
+
 				pwm {
 					compatible = "st,stm32-pwm";
 					#pwm-cells = <3>;
@@ -1221,6 +1236,11 @@ timers13: timer@4c008000 {
 				access-controllers = <&etzpc 24>;
 				status = "disabled";
 
+				counter {
+					compatible = "st,stm32-timer-counter";
+					status = "disabled";
+				};
+
 				pwm {
 					compatible = "st,stm32-pwm";
 					#pwm-cells = <3>;
@@ -1246,6 +1266,11 @@ timers14: timer@4c009000 {
 				access-controllers = <&etzpc 25>;
 				status = "disabled";
 
+				counter {
+					compatible = "st,stm32-timer-counter";
+					status = "disabled";
+				};
+
 				pwm {
 					compatible = "st,stm32-pwm";
 					#pwm-cells = <3>;
@@ -1276,6 +1301,11 @@ timers15: timer@4c00a000 {
 				access-controllers = <&etzpc 26>;
 				status = "disabled";
 
+				counter {
+					compatible = "st,stm32-timer-counter";
+					status = "disabled";
+				};
+
 				pwm {
 					compatible = "st,stm32-pwm";
 					#pwm-cells = <3>;
@@ -1304,6 +1334,11 @@ timers16: timer@4c00b000 {
 				access-controllers = <&etzpc 27>;
 				status = "disabled";
 
+				counter {
+					compatible = "st,stm32-timer-counter";
+					status = "disabled";
+				};
+
 				pwm {
 					compatible = "st,stm32-pwm";
 					#pwm-cells = <3>;
@@ -1332,6 +1367,11 @@ timers17: timer@4c00c000 {
 				access-controllers = <&etzpc 28>;
 				status = "disabled";
 
+				counter {
+					compatible = "st,stm32-timer-counter";
+					status = "disabled";
+				};
+
 				pwm {
 					compatible = "st,stm32-pwm";
 					#pwm-cells = <3>;
-- 
2.25.1


