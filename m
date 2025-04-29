Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E261EC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=MFjKC979J5k7wCj43UayIyDTnp
	tjiywrgWf9lgX2ukRXjU9xIgXx4pnZJyN7/a2Qx7wRCd/3reJG2xyWnxsORkuHluYBSzwQHiH+Za3
	2lkYDaYTO6ignnPAZDArZm+JxfTuZzKZpbbVeyoiivdGjsCpjCAbCoA+b+LZ1hTuAc48z65guZiYb
	qLLYBN/mYyXs6cFkayvj8KoRgdZS2rfb/6yOYFVYawgE85yKYvUAC3Af/3tC4RE0T6rTmSOcW83o+
	Kz7mC4kR5fUjLaA+rB9J2Hnvn6F5TlFu+TtAgkmRdyoZPgG7FektEYGLZ0Jcrg5YMkNbjyinPfVyq
	3eSSyUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9li4-00000009sK1-2dLX;
	Tue, 29 Apr 2025 14:13:20 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kUB-00000009hAm-0yi5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:54:56 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TBEmsK010884;
	Tue, 29 Apr 2025 14:54:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=klSOr//ak+Jo4+Wc
	HpAbR5TH3+oTliLKBCO0UFpYd0Cv/lsNabdrgGOJy4EYAkR7mOxtzJuPP3anp+C8
	N/h98ogWlOeyt5gzJMIe+x/i2oqJZgQIB6ba/SaxfUhSJFL0JRUGc6fb9+XJ9+Eb
	ElVW4AF6erQiJZHYK3j5EsPY5cB8NtQwfwDrkKTQvrvAmfzcCBbsgCXWO2UVWXJ0
	UbKkcKKVLPEGIFsJN5dd99Q8+mjeSeSnEg2czpRvzuG4kpWrrtGpdZPLt2LpJUvb
	91h2WftSmZxP3gU3kgPDiBxFFTBcMtbVfimBmNXaPQRTzWNCrksN2l+4+ZfyYyEz
	rvRCoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 469aengsj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:54:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 28D3A40081;
	Tue, 29 Apr 2025 14:53:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D61FA7FB54;
	Tue, 29 Apr 2025 14:51:51 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 14:51:50 +0200
Received: from localhost (10.252.5.160) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 14:51:50 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <lee@kernel.org>,
        <alexandre.torgue@foss.st.com>, <tglx@linutronix.de>
CC: <ukleinek@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <robh@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v6 6/7] arm64: dts: st: add low-power timer nodes on stm32mp251
Date: Tue, 29 Apr 2025 14:51:32 +0200
Message-ID: <20250429125133.1574167-7-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.5.160]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_055455_534873_AEDC48CA 
X-CRM114-Status: UNSURE (   9.91  )
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


