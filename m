Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955FDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCbN4/j+l9OOqu2CM9bPFAurfGWk+6cPkyl5pDY9+l0=; b=xe9lCkXHDZsdkSvaIHu3OHaIOr
	5HXRDZfWC3Rp3ZujNJmt6stZ9odjVewH53PiJEGoevjwEF2a2Uys/nZyXPEjtk6aSB9VP5MJt/0p9
	Xi8far0hgOKzXCKDW7NfcqssdpLbfVGxJ3mSOEzluraQP+K8XzXQYNk04GnkXcsN6tZauTssKgNKR
	dRDpeLbyRfpPVAFYumqFf/1pd1Lj8IsYzZUtuupFidoXR/YGL3cFsyyfPaL9PSFRYX7XUIgxN6qQJ
	oqscuJy66zh1K1I92U+zO6FA/aF+dbBaELnGtFTgTyyp8m+Rf8zi3XSgiqa/+UcHAgu+zj+86e/W2
	dNB/8lSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMnk-00000008WQw-1spL;
	Mon, 12 May 2025 06:38:12 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMhJ-00000008VX1-3r9P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:31:35 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BKH5pW007926;
	Mon, 12 May 2025 08:31:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KCbN4/j+l9OOqu2CM9bPFAurfGWk+6cPkyl5pDY9+l0=; b=SZNGTHTHjy6P8udq
	wn2/O57LPgvNaBCznMWQKr4eYlBJEESw4ESVQOuxKXNEVadEALUboXRlq0loxeZt
	cCEHeF4XJb6AYPjbD1NF23W0/ypmCNjLV+bSZ2RI2RMo+++paVTjnrEILvyxyTVd
	nHWv4Xa0XxB7mVmrbE1nlYv1yKzl72Tnvyi5FUrkCdwCc1c1XJo/BgWoYVUbzJAx
	u1HhA2NcM87X0dqID6MA9X9IidlFgvE3Yw6IKFA5KPKjEw7c495Ym5px2afZ0kqd
	t7IyRNIOMeuOY/QfqmzV7gW86qYE3ZDWRKQR5YLd1H74N1Pr1z9SGwU0Z8NrwsLg
	Ou7Hrg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxa5cxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 08:31:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 16E5C4005B;
	Mon, 12 May 2025 08:30:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20DA4A4B620;
	Mon, 12 May 2025 08:29:39 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 08:29:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 12 May 2025 08:29:31 +0200
Subject: [PATCH v10 1/3] arm64: dts: st: Add OMM node on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250512-upstream_omm_ospi_dts-v10-1-fca0fbe6d10a@foss.st.com>
References: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
In-Reply-To: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
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
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_233134_286179_36F39EA3 
X-CRM114-Status: UNSURE (   8.98  )
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
index 87110f91e4895ad701940c91c6cb372667193b48..d6993d3dc14d63b0b5f51d8c7e822f178f526b89 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -229,6 +229,60 @@ hpdma3: dma-controller@40420000 {
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


