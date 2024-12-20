Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B2L1h8/Ga92df8AG9HXGme/BlFA+G//Iy0I6fG3Wps=; b=JLJTQFX7PBQo9UDW3qenvyiky/
	BuAbp0CgblQE9tJHDn1DSUXO43sL2avSfTfbmwlyTbDw1NPrQsu2CI9KuZv1WmPCVwUlwANFx3WDY
	4AU3UMcnWovDlsMdu6soszLlu6E0eBb/oJ2agyY/JVBsrTThoQw7yisg9jwGa1ZzM4zfATRxrb5j3
	RPXMwzfwHf129m3mPicv70H6fqEQDV/sfmV5AglYGJ1TdR+D9eSKRE27dZmNLtwA4e7SXBXVNmTex
	iegeIwA/g+SeME7vKW2DNsIGFNi1sVKCKQfcCfO3amx6YnQSVij3Kuidoe5BSqugG+1eh/Lt7Wdrn
	bBUvuuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa01-00000004Xy8-2r44;
	Fri, 20 Dec 2024 10:12:49 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZqB-00000004Vme-2zuF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:02:41 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK89GqV013423;
	Fri, 20 Dec 2024 11:02:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4B2L1h8/Ga92df8AG9HXGme/BlFA+G//Iy0I6fG3Wps=; b=6zhnbezS6gQc2JON
	R4pdcJfVznqyDoj/VE5g83YcZj0/TdHad6moqiOg38zn+GENd9mm2vnw//dYxd/U
	S/T+TTFtxtE885whuAXhF4/EMG7ZyC1De6Ix7DaLXafOG7l2xVYvFQ3Ja7ZC8VLB
	bQFTZ5fP18PrYMpJ5st/fSY5FeXgY4Be4EHinwy8ccB//vxytArgo8WERurdBIWo
	esidAtOf60ex2OcX/UZYyTfMpySWXU2qmQIizOlh4IxBR1wzx4syjczvPJBNRK//
	7Bt6lKjguWQTWyrmK452lKtlnkan89MAxOtI6cjVkxUK6asYPqVRnpDWZQ7hFCIn
	UPfFpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34bs005-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:02:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 40E3140063;
	Fri, 20 Dec 2024 11:01:14 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35CBF25B04D;
	Fri, 20 Dec 2024 11:00:12 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:12 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 11:00:11 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH v2 7/9] arm64: dts: st: add timer nodes on stm32mp251
Date: Fri, 20 Dec 2024 10:59:25 +0100
Message-ID: <20241220095927.1122782-8-fabrice.gasnier@foss.st.com>
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
X-CRM114-CacheID: sfid-20241220_020240_070966_24887A10 
X-CRM114-Status: UNSURE (   8.86  )
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

Add timers support on STM32MP25 SoC. Use dedicated compatible to handle
new features and instances introduced with this SoC. STM32MP25 SoC has
various timer flavours, each group has its own specific feature list:
- Advanced-control timers (TIM1/TIM8/TIM20)
- General-purpose timers (TIM2/TIM3/TIM4/TIM5)
- Basic timers (TIM6/TIM7)
- General-purpose timers (TIM10/TIM11/TIM12/TIM13/TIM14)
- General purpose timers (TIM15/TIM16/TIM17)

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 524 +++++++++++++++++++++++++
 1 file changed, 524 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 6fe12e3bd7dd..220fb1a3da71 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -237,6 +237,273 @@ rifsc: bus@42080000 {
 			#access-controller-cells = <1>;
 			ranges;
 
+			timers2: timer@40000000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40000000 0x400>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM2>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 1>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@1 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <1>;
+					status = "disabled";
+				};
+			};
+
+			timers3: timer@40010000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40010000 0x400>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM3>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 2>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@2 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <2>;
+					status = "disabled";
+				};
+			};
+
+			timers4: timer@40020000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40020000 0x400>;
+				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM4>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 3>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@3 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <3>;
+					status = "disabled";
+				};
+			};
+
+			timers5: timer@40030000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40030000 0x400>;
+				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM5>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 4>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@4 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+
+			timers6: timer@40040000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40040000 0x400>;
+				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM6>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 5>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				timer@5 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			timers7: timer@40050000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40050000 0x400>;
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM7>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 6>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				timer@6 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <6>;
+					status = "disabled";
+				};
+			};
+
+			timers12: timer@40060000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40060000 0x400>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM12>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 10>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@11 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <11>;
+					status = "disabled";
+				};
+			};
+
+			timers13: timer@40070000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40070000 0x400>;
+				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM13>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 11>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@12 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <12>;
+					status = "disabled";
+				};
+			};
+
+			timers14: timer@40080000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40080000 0x400>;
+				interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM14>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 12>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@13 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <13>;
+					status = "disabled";
+				};
+			};
+
 			spi2: spi@400b0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -427,6 +694,136 @@ i2c7: i2c@40180000 {
 				status = "disabled";
 			};
 
+			timers10: timer@401c0000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x401c0000 0x400>;
+				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM10>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 8>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@9 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <9>;
+					status = "disabled";
+				};
+			};
+
+			timers11: timer@401d0000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x401d0000 0x400>;
+				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM11>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 9>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@10 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <10>;
+					status = "disabled";
+				};
+			};
+
+			timers1: timer@40200000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40200000 0x400>;
+				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "brk", "up", "trg-com", "cc";
+				clocks = <&rcc CK_KER_TIM1>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 0>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@0 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <0>;
+					status = "disabled";
+				};
+			};
+
+			timers8: timer@40210000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40210000 0x400>;
+				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "brk", "up", "trg-com", "cc";
+				clocks = <&rcc CK_KER_TIM8>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 7>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@7 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <7>;
+					status = "disabled";
+				};
+			};
+
 			usart6: serial@40220000 {
 				compatible = "st,stm32h7-uart";
 				reg = <0x40220000 0x400>;
@@ -469,6 +866,99 @@ spi4: spi@40240000 {
 				status = "disabled";
 			};
 
+			timers15: timer@40250000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40250000 0x400>;
+				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM15>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 13>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@14 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <14>;
+					status = "disabled";
+				};
+			};
+
+			timers16: timer@40260000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40260000 0x400>;
+				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM16>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 14>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@15 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <15>;
+					status = "disabled";
+				};
+			};
+
+			timers17: timer@40270000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40270000 0x400>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "global";
+				clocks = <&rcc CK_KER_TIM17>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 15>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@16 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <16>;
+					status = "disabled";
+				};
+			};
+
 			spi5: spi@40280000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -496,6 +986,40 @@ uart9: serial@402c0000 {
 				status = "disabled";
 			};
 
+			timers20: timer@40320000 {
+				compatible = "st,stm32mp25-timers";
+				reg = <0x40320000 0x400>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "brk", "up", "trg-com", "cc";
+				clocks = <&rcc CK_KER_TIM20>;
+				clock-names = "int";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 16>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				counter {
+					compatible = "st,stm32mp25-timer-counter";
+					status = "disabled";
+				};
+
+				pwm {
+					compatible = "st,stm32mp25-pwm";
+					#pwm-cells = <3>;
+					status = "disabled";
+				};
+
+				timer@19 {
+					compatible = "st,stm32mp25-timer-trigger";
+					reg = <19>;
+					status = "disabled";
+				};
+			};
+
 			usart1: serial@40330000 {
 				compatible = "st,stm32h7-uart";
 				reg = <0x40330000 0x400>;
-- 
2.25.1


