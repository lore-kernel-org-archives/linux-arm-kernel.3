Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93291C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=JpGGxKwJnHcqiwM130uXp4f36g
	tgwJFn9asl0ng/JFbXuo35wQ0w/++2oIi/9HEPmE8aEbzWQ83fApIQ8OLqsOlu26f9x92OMOUFCUP
	/Kd8qVRdD5Ezut4GPtQdbit8cjNHyBXzRYzTnl5fcqJmXdpXEelA5fEXIxNjEv4A1FeP/c7fEPfPP
	hf0Lr2PlZ4rSXRvoptAgc+Jd6klLntzIoAVW5SjGAq2j0LRMIRJgmB8X9Uj0R713ErurOhNHIoiod
	oPZqaZwTi8botvpNXzrgLIlHOehSO8SOF5SUZ/BqW36XHgxTyq5hTxfACp1fdBRBwMr7dGJD05YBH
	IpGgDDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYte-00000006BkY-1ceC;
	Tue, 04 Mar 2025 20:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWG4-00000005g7L-1gqy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=qDSCPz6wiqPv9Heb6qIrBv1o5k
	8klpmOONtPYD4X6y31yxUd+61jxK9CCLxTMAUPTJ8b2a7PcbDiDskQPb+TZVEkAXaZY3+QPSFqR8s
	bsUdHGE4eeGsteZfeXXe8Dq0YkjWK1EckEKw/KN2w8wUaoyiIK+DEKvDl29dhRhMyEGFo3kXCiWJm
	GMJNIZqX7gwLY4XUHy7qxa3aA8Fefr4sASljQDc4m/YicZv6deuYlTicngAdgW2Qb9wPy5A/nZ+a+
	a/JjDSdG7O89gM9WxKMwd9lNwZ1BkjwhL1ED0ZNmOTlx14a3w8z2JqqAjsOSa/jCVTPEKP1jOC5ZT
	NWGb81wA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWFw-000000008Iu-30hl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:40:40 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524FZIka004190;
	Tue, 4 Mar 2025 18:40:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Bf4Jif3iTwu6xhT/icuxJcCkmXcEX9OzuYCH60IJsfg=; b=XIPjo5X+kTybQYZX
	NnxsQiYByN7cIR+YzoKs/Fnhbw/IDEWhcb05P0H1csSjzWLOpj3etEq22uAurJR1
	/aMhpCQD+L5+zy6RFfbCFfIKdUhFUgu131iA2OL+OwQnV+pWiTiG5GzJTwnjwe5C
	wo9MyFrPpFaKN8vbKkHLYotaEl+A3P9bhsMfr/Uxxj0dxVUmw619Psw7E09/7dQL
	UvYo73jzNm87zOkE/sU6RyI1SddrM8K3t01i47ma92LLrN917MpyCOYjc35pj1ua
	er8bRkpKbfNIMFab8Ye5xxuLJGBO39v7/NETbbu+nnm4I/fz1RnUfkj69VxDo9ZI
	JzvSOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454e2sf0qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 18:40:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A788C400C2;
	Tue,  4 Mar 2025 18:39:11 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEAED5952AF;
	Tue,  4 Mar 2025 18:32:51 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:51 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:51 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 7/8] arm64: dts: st: add low-power timer nodes on stm32mp251
Date: Tue, 4 Mar 2025 18:32:28 +0100
Message-ID: <20250304173229.3215445-8-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_174037_002193_DE5C0B49 
X-CRM114-Status: GOOD (  10.44  )
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


