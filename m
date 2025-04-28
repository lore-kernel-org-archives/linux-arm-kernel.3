Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9B3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GrCvKJa411jKEzIP+wKcHD3zzR63U6U1kKUHbgAHkQ=; b=UwTmxqG9/UqnO1V6f47D2MN6Xb
	MgVNaCmzP6bEP+sPZ3wwDBwYi1odrMbnFTjBfpSsag4NoY9IOyOPtXgAnVd60ZKX/EfLTsLj16FZg
	TXPjCsQiX1AT4xAKhuPkavbi4IMfhVYDVgA3pL4mtuoXk4bj0UEzw/GMLSIesbp8XvhDymR6MPzFH
	IKWAZrtHpY25fWUhqv+ZjcoWBdGanXfpBTG0VT11UhToye9dCtqaK1pmk9rjplpLN0C+TfscP+IDU
	ETi942GaMwLPUggFD6N5QI3vMrVJZQ+acteMxtTTXOhACGop80jBKUza4+4w6A9caCKo8SrJGY8uu
	CBIkuwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KLO-00000005XGu-09R1;
	Mon, 28 Apr 2025 09:00:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K4t-00000005V0k-193m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:43:05 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S11Bvk010817;
	Mon, 28 Apr 2025 10:42:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8GrCvKJa411jKEzIP+wKcHD3zzR63U6U1kKUHbgAHkQ=; b=rfM+aILBWzgDs/v5
	6+c2ZzlJkSXZ/RHKOVxdzeXqSfRC5m5qoQaPHLDNmG8rtNtoUShFdVZ1TT0Yn5ry
	0oMUzKjIhHCVYRiYOEtu8KVw3Bo0Q7X4qDVd0zl+92cqTYpZLZ8gjTsJKWRHTb2f
	KslzW+JmohqRpMoG7bQBGetHdonplve4gqxlPEOwqNYuV52dei3WLkNpQ5niiZDT
	apfuWkzq5xm3xSKkG3wERyXRnMIbZwVBppEqAOA+9gxod2dHP3ETJ/dxA3nuPpaV
	k2MmaNT80OM9JcHKvErr+FZo76GUpFg2ou5aT2qIU29/dvpkOzJK2HF9O9AJgKc/
	NMaLxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 469aenbds5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:42:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B21BC40056;
	Mon, 28 Apr 2025 10:41:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A49D5A3D5A0;
	Mon, 28 Apr 2025 10:40:45 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:40:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 28 Apr 2025 10:40:21 +0200
Subject: [PATCH v9 1/3] arm64: dts: st: Add OMM node on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-upstream_omm_ospi_dts-v9-1-62522b1b0922@foss.st.com>
References: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
In-Reply-To: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014303_597518_D1DDD3C8 
X-CRM114-Status: UNSURE (   8.81  )
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

Add Octo Memory Manager (OMM) entry on stm32mp251 and its two
OSPI instance.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008c5b736ba75f5210d0eddb5b43489..bb95d61ff7b54bcbb70d981c88dfffcc1951e103 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -230,6 +230,60 @@ hpdma3: dma-controller@40420000 {
 			#dma-cells = <3>;
 		};
 
+		ommanager: ommanager@40500000 {
+			compatible = "st,stm32mp25-omm";
+			reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+			reg-names = "regs", "memory_map";
+			ranges = <0 0 0x40430000 0x400>,
+				 <1 0 0x40440000 0x400>;
+			clocks = <&rcc CK_BUS_OSPIIOM>,
+				 <&scmi_clk CK_SCMI_OSPI1>,
+				 <&scmi_clk CK_SCMI_OSPI2>;
+			clock-names = "omm", "ospi1", "ospi2";
+			resets = <&rcc OSPIIOM_R>,
+				 <&scmi_reset RST_SCMI_OSPI1>,
+				 <&scmi_reset RST_SCMI_OSPI2>;
+			reset-names = "omm", "ospi1", "ospi2";
+			access-controllers = <&rifsc 111>;
+			power-domains = <&CLUSTER_PD>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+			status = "disabled";
+
+			ospi1: spi@0 {
+				compatible = "st,stm32mp25-ospi";
+				reg = <0 0 0x400>;
+				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 2 0x62 0x3121>,
+				       <&hpdma 2 0x42 0x3112>;
+				dma-names = "tx", "rx";
+				clocks = <&scmi_clk CK_SCMI_OSPI1>;
+				resets = <&scmi_reset RST_SCMI_OSPI1>,
+					 <&scmi_reset RST_SCMI_OSPI1DLL>;
+				access-controllers = <&rifsc 74>;
+				power-domains = <&CLUSTER_PD>;
+				st,syscfg-dlyb = <&syscfg 0x1000>;
+				status = "disabled";
+			};
+
+			ospi2: spi@1 {
+				compatible = "st,stm32mp25-ospi";
+				reg = <1 0 0x400>;
+				interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 3 0x62 0x3121>,
+				       <&hpdma 3 0x42 0x3112>;
+				dma-names = "tx", "rx";
+				clocks = <&scmi_clk CK_SCMI_OSPI2>;
+				resets = <&scmi_reset RST_SCMI_OSPI2>,
+					 <&scmi_reset RST_SCMI_OSPI2DLL>;
+				access-controllers = <&rifsc 75>;
+				power-domains = <&CLUSTER_PD>;
+				st,syscfg-dlyb = <&syscfg 0x1400>;
+				status = "disabled";
+			};
+		};
+
 		rifsc: bus@42080000 {
 			compatible = "st,stm32mp25-rifsc", "simple-bus";
 			reg = <0x42080000 0x1000>;

-- 
2.25.1


