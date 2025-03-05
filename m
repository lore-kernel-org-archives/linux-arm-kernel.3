Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C186AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=zQDgyMHOswblvrSUVKFPZb+UVt
	JpljsQXkYnMpy6FYTzaLiuM58M8Vv/IsYxv0QS6sK5cNg+BWlQ6NzyUQZA6A4/sOHTjDWp9RGX9P9
	ypiKeOZeOSeyWnUCeuweM2V5klMMMOflhgHbcX5z/9tfM6EGgJOqJMW7482Kj5KyEFbS622mjGfYg
	0gwe7FzkUlHWolhuJSsHxxE/vLBe5Ld/lnpkD1Bz4zluMEFCxgHZqpe+VPA2cuFVMiZWwrskwRFJa
	OO3+O0qppYPhTo14ghwz/P5BAVT+ctcG7wegnLZPnREqQO13lz2fbqMqobWHf55JJwdiILEp/dFe0
	8zlPJXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpliY-00000007dGm-38RH;
	Wed, 05 Mar 2025 10:11:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplSO-00000007ZmT-436P
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 09:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=jOYhHHTbUOYwhCekwNUaXNAoH/
	Bx+E5PIFnryM3Zle7RvDTJPiZq8A/Z0D1jZ1eYkm6a2iDg0gi2boIADIUpw7LLT/1YrmgRGI4SY1l
	t9JwMKFB7f/fAJGddgXhQnaSDSexctTI8Y5eDKRbBBIn3C6zwjeielN8d/DW3IXLkKA5BufJAqBWD
	OBP7Ch8nMkOqw0QVQOvhDtMvDzOH9pLfJ6aKYqPndKsD/Z6R8JuD9QcudCoRpHWpCM6hsFgTau/NM
	TI/eBHJWzaWKzdXS6r8WS8EB0v8Tx7Q8EBFQF5OpDiXGDBTs57AiivtWXl2UaAYiiDjNJWdVJvQBB
	nX73EeDQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplSM-00000005EgT-0w6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:54:27 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5258N5TW027681;
	Wed, 5 Mar 2025 10:54:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=gQsP8rCNCyfzGn7B
	C3Hi9eMLbOsT0RPo+sJcPpkGmScvvCPJEwvx56M8zsuxvDLYN4UPLsVVX9qN1fAV
	RlGEAVzvvBNI7bFPvPvR+6xoRKFAtZCO2B1ZhRWXf7Wwt8uq8f1CGGMGr+X06Mb6
	nqA+qy6QXM9hq1Cwn7XU7TrQyhnDqz9CGA/CuyORk2rNAJ5SV3e7PK0Wk2+vtcRn
	oSBEq5Kwl0JvYiBiaKHdIK4gpfq5kYSq+fa1xF6XpHAJnytJwMZ7m+SOsCmsAtnh
	4bcgYUj2RlLOtvoqEOXYyfLgt4cyKvDreQ+63cUngwjbgSv2cYRb06IBNWyZX0Vu
	0Ju6Fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454cp8nch1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:54:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9ED8B4002D;
	Wed,  5 Mar 2025 10:52:50 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF2C85AA719;
	Wed,  5 Mar 2025 10:49:56 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 10:49:56 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 10:49:56 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 7/8] arm64: dts: st: add low-power timer nodes on stm32mp251
Date: Wed, 5 Mar 2025 10:49:34 +0100
Message-ID: <20250305094935.595667-8-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095426_318264_5DE8D8C7 
X-CRM114-Status: UNSURE (   9.83  )
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

Add low-power timer (LPTimer) support on STM32MP25 SoC.
The full feature set is implemented in LPTIM1/2/3/4. LPTIM5 supports a
smaller set of features (no capture/compare) channel. Still, LPTIM5 can
be used as single PWM, counter, trigger or timer.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V2:
- Adopt two compatibles: newly introduced "st,stm32mp25-..." compatible,
  and fallback "st,stm32-...".
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 177 +++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..505176276e72 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -238,6 +238,78 @@ rifsc: bus@42080000 {
 			#access-controller-cells = <1>;
 			ranges;
 
+			lptimer1: timer@40090000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x40090000 0x400>;
+				interrupts-extended = <&exti1 47 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM1>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 17>;
+				power-domains = <&RET_PD>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@0 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <0>;
+					status = "disabled";
+				};
+			};
+
+			lptimer2: timer@400a0000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x400a0000 0x400>;
+				interrupts-extended = <&exti1 48 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM2>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 18>;
+				power-domains = <&RET_PD>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@1 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <1>;
+					status = "disabled";
+				};
+			};
+
 			i2s2: audio-controller@400b0000 {
 				compatible = "st,stm32mp25-i2s";
 				reg = <0x400b0000 0x400>;
@@ -799,6 +871,111 @@ i2c8: i2c@46040000 {
 				status = "disabled";
 			};
 
+			lptimer3: timer@46050000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x46050000 0x400>;
+				interrupts-extended = <&exti2 29 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM3>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 19>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@2 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <2>;
+					status = "disabled";
+				};
+			};
+
+			lptimer4: timer@46060000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x46060000 0x400>;
+				interrupts-extended = <&exti2 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM4>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 20>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@3 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <3>;
+					status = "disabled";
+				};
+			};
+
+			lptimer5: timer@46070000 {
+				compatible = "st,stm32mp25-lptimer", "st,stm32-lptimer";
+				reg = <0x46070000 0x400>;
+				interrupts-extended = <&exti2 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LPTIM5>;
+				clock-names = "mux";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 21>;
+				wakeup-source;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-lptimer-counter", "st,stm32-lptimer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm-lp", "st,stm32-pwm-lp";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer {
+					compatible = "st,stm32mp25-lptimer-timer", "st,stm32-lptimer-timer";
+					status = "disabled";
+				};
+
+				trigger@4 {
+					compatible = "st,stm32mp25-lptimer-trigger", "st,stm32-lptimer-trigger";
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+
 			csi: csi@48020000 {
 				compatible = "st,stm32mp25-csi";
 				reg = <0x48020000 0x2000>;
-- 
2.25.1


