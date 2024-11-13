Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E124D41C16
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BytviIzCjIdHXac0v0yYt/+vzHuitYQuY7Dt5RQLAyA=; b=tEZz9XvnsoDKOGfiCSYR6HA01M
	XZJbZ7HhR8kN3vBHXytDqQjcCTsbf0YkMeKdZDtUQmFatRAk7jFBSOdL8zS1ehT47VW16It+/vUHY
	l0lNEePkDIujHx9x7ay1SDxDCVvRSyBh+eZ/huyQQcKcqGT+maIe+Ac4VdZoZGR8TnKHEo5sCyZvK
	AUSH+BH4aJ0MvFdUTf+F9MaIIlwQVDYd/9PZtl/ABtXqSU3T/9573pli4PoBZo9w+wWOwTMgwaYnc
	2dlISNN8P4lMIGbh8pbD7LVu0B7SXqZAdFh9kJ18FspJ9hTBMLBf/8JF8vth3N830mTQ94wB/CPck
	V5WpYU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8n2-000000066VN-07TR;
	Wed, 13 Nov 2024 08:31:52 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8lB-000000066Af-1LUu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:29:59 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD5T69K030186;
	Wed, 13 Nov 2024 09:29:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=BytviIzCjIdHXac0v0yYt/
	+vzHuitYQuY7Dt5RQLAyA=; b=NPlX+dHe4tkFVGYvQyBFxbOeihUyOIsMD0W3B3
	zxhlb+jFIsLoku5BEdmI7yFUDNBVwmu4PwTGvHNNVrfIrCwvsQ7F7gchmbteQjYz
	g5LaJItd7ihkizkFL0k4Uo1i+69o3Py2Pv4GPuk9Mq8reWFjOq/ug68WvUtnDNLn
	JXlC1dx5oTZQUMOC3pjEfad3J26cHL3ge4EHSaOTVxE0ft3slybsdGvnGnl77zBX
	Io+ao/8RQ1F9QmmWDx/i9I71KZ5xkSaiyplf0aRs2z62nSIj8T/FlIEiizywI0l+
	c7JlTumbHzhC9QZPWYXVr7gIthn47kGIbGkLRjTHNc+yYPSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42swr90r7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 09:29:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 61D61400A1;
	Wed, 13 Nov 2024 09:28:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23DCE26FCFA;
	Wed, 13 Nov 2024 09:25:19 +0100 (CET)
Received: from localhost (10.252.5.106) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 13 Nov
 2024 09:25:18 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: st: add i2s support to stm32mp251
Date: Wed, 13 Nov 2024 09:25:09 +0100
Message-ID: <20241113082510.2354924-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.5.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_002957_924967_819C1963 
X-CRM114-Status: UNSURE (   9.47  )
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

Add I2S support to STM32MP25 SoCs.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 6fe12e3bd7dd..8cc0b64e6a16 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -237,6 +237,21 @@ rifsc: bus@42080000 {
 			#access-controller-cells = <1>;
 			ranges;
 
+			i2s2: audio-controller@400b0000 {
+				compatible = "st,stm32mp25-i2s";
+				reg = <0x400b0000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_SPI2>, <&rcc CK_KER_SPI2>;
+				clock-names = "pclk", "i2sclk";
+				resets = <&rcc SPI2_R>;
+				dmas = <&hpdma 51 0x43 0x12>,
+				       <&hpdma 52 0x43 0x21>;
+				dma-names = "rx", "tx";
+				access-controllers = <&rifsc 23>;
+				status = "disabled";
+			};
+
 			spi2: spi@400b0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -252,6 +267,21 @@ spi2: spi@400b0000 {
 				status = "disabled";
 			};
 
+			i2s3: audio-controller@400c0000 {
+				compatible = "st,stm32mp25-i2s";
+				reg = <0x400c0000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_SPI3>, <&rcc CK_KER_SPI3>;
+				clock-names = "pclk", "i2sclk";
+				resets = <&rcc SPI3_R>;
+				dmas = <&hpdma 53 0x43 0x12>,
+				       <&hpdma 54 0x43 0x21>;
+				dma-names = "rx", "tx";
+				access-controllers = <&rifsc 24>;
+				status = "disabled";
+			};
+
 			spi3: spi@400c0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -439,6 +469,21 @@ usart6: serial@40220000 {
 				status = "disabled";
 			};
 
+			i2s1: audio-controller@40230000 {
+				compatible = "st,stm32mp25-i2s";
+				reg = <0x40230000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_SPI1>, <&rcc CK_KER_SPI1>;
+				clock-names = "pclk", "i2sclk";
+				resets = <&rcc SPI1_R>;
+				dmas = <&hpdma 49 0x43 0x12>,
+				       <&hpdma 50 0x43 0x21>;
+				dma-names = "rx", "tx";
+				access-controllers = <&rifsc 22>;
+				status = "disabled";
+			};
+
 			spi1: spi@40230000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.25.1


