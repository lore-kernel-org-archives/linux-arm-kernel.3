Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2554FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV+fRRdM/xmz4DaAjY85KDQeN5XhkUzPpA2Mf2nb8T8=; b=gXkRL9F3VYHg+W4X3mgXhn28ks
	l16TL55YZDg9slysRmMedYtUx5I6oXBNFDszPFuofN3NJYF4S3qqbI+M9lWUTNQMRllB2WKyWcTEw
	mqWcz7wKtQ4sLjv4QvrmLtRSxq7f48+m8eNEj+1pOiKxzNkpiSjaD9VrakupLbyc3pw0jHvdA8O7X
	5nvkeUskZoUTn8bvI3Uct+VQZ99CGILJvRxzv7KcunnyI8zJa7Asz795GvAF8mB9KG6eUeN/cl1m2
	lapLFM3MATZ7dwoP/p2stEM1QvduA4hhRYoy5FwnK7PHwCz7FXfqVofjMPbfOlXUvSwOyRQl9SuEb
	M3ForBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodxU-0000000Ch5u-34tm;
	Wed, 20 Aug 2025 08:14:12 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodiw-0000000CeuI-0apz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:59:11 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K6pitS026720;
	Wed, 20 Aug 2025 09:59:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vV+fRRdM/xmz4DaAjY85KDQeN5XhkUzPpA2Mf2nb8T8=; b=RYPDuPby7W0eoYEJ
	0BKGk5kdFtRRBJbqc14AlwY/AOOyOHgcIK/bkOe5fqhOZVAbZCxkyuHz1dMueGFJ
	1wWIjfFJEMZAnR0hvo55AEcC1V5F6po5DbeLDFIawSfmMrM3hgL9QI5cHqX1CQ3j
	c/YOkQsO1U5+CG+dRO45dWXuRqPkjuuCtJMJu+2Qa/7pt3gPYQJGvFFd29M3mYqY
	FA4I9l9t6jw4YsFsiRlNT/P33MWWbiwIvuhnSDW3Me8vwRmahFCIjw+ERkD5XozE
	Lb67DVYaHIlROdnhEQALrjM07Oa/aGP59Xezmi/kkJaIRhkhW2GioVnIhpoI7kDY
	U7N+sg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wgrbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:58:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 97FFE4002D;
	Wed, 20 Aug 2025 09:57:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5B615E811C;
	Wed, 20 Aug 2025 09:56:19 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 09:56:19 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linus.walleij@linaro.org>, <corbet@lwn.net>, <p.zabel@pengutronix.de>,
        <shradha.t@samsung.com>, <mayank.rana@oss.qualcomm.com>,
        <namcao@linutronix.de>, <qiang.yu@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <inochiama@gmail.com>,
        <quic_schintav@quicinc.com>
CC: <johan+linaro@kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v13 09/11] arm64: dts: st: Add PCIe Root Complex mode on stm32mp251
Date: Wed, 20 Aug 2025 09:54:09 +0200
Message-ID: <20250820075411.1178729-10-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820075411.1178729-1-christian.bruel@foss.st.com>
References: <20250820075411.1178729-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_005910_442550_D16A708A 
X-CRM114-Status: GOOD (  10.72  )
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

Add pcie_rc node to support STM32 MP25 PCIe driver based on the
DesignWare PCIe core configured as Root Complex mode

Supports Gen1/Gen2, single lane, MSI interrupts using the ARM GICv2m

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 303abf915b8e..a3ed617a43d3 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -122,6 +122,15 @@ intc: interrupt-controller@4ac00000 {
 		      <0x0 0x4ac20000 0x0 0x20000>,
 		      <0x0 0x4ac40000 0x0 0x20000>,
 		      <0x0 0x4ac60000 0x0 0x20000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		v2m0: v2m@48090000 {
+			compatible = "arm,gic-v2m-frame";
+			reg = <0x0 0x48090000 0x0 0x1000>;
+			msi-controller;
+		};
 	};
 
 	psci {
@@ -1654,6 +1663,41 @@ stmmac_axi_config_1: stmmac-axi-config {
 					snps,wr_osr_lmt = <0x7>;
 				};
 			};
+
+			pcie_rc: pcie@48400000 {
+				compatible = "st,stm32mp25-pcie-rc";
+				device_type = "pci";
+				reg = <0x48400000 0x400000>,
+				      <0x10000000 0x10000>;
+				reg-names = "dbi", "config";
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 7>;
+				interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+						<0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+						<0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+						<0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
+					 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
+					 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
+				dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
+				clocks = <&rcc CK_BUS_PCIE>;
+				resets = <&rcc PCIE_R>;
+				msi-parent = <&v2m0>;
+				access-controllers = <&rifsc 68>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				pcie@0,0 {
+					device_type = "pci";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					phys = <&combophy PHY_TYPE_PCIE>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
+			};
 		};
 
 		bsec: efuse@44000000 {
-- 
2.34.1


