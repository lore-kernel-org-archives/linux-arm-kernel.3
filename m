Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAD5C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhzZoqwrvR64ETOj53JDdB4rMHRwaAeRpBGYOhjW/hk=; b=AerQeuX8fy9pSfiuVdarSqCvAk
	cgZNpZbFm7wLpoSQZBGM7WShopFyi+x4tjyogq6fz6Dl/tEoZu43uFwBMopO05QtTEduHBBaIPXon
	POj6dnad2gl7eJ8P4On8JsZ4PJzymgUMGca18ZdR3NkH8ZatUJfauG/eoLCU7HFroAAlJ+Vi9LYvb
	T44OgtOUt2Ks2HNDcd5Xj7WQ4b6lmTDSgJmuCgEcdjyrmy17gjFrs1ya1OUfimRPMFry+wCxtd72Y
	JXy/RdAbx47rTiPb+lqyNc5LEJkNWMci7MJIPrpTswA7jD4t2VjqIeAOu2EOcYR605AqwOG315I4C
	Ltd2TEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XCj-0000000A90j-14Wh;
	Wed, 23 Apr 2025 10:19:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7W2u-00000009s2x-1H4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:05:34 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N6Wt7u005801;
	Wed, 23 Apr 2025 11:05:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BhzZoqwrvR64ETOj53JDdB4rMHRwaAeRpBGYOhjW/hk=; b=pki14Xpo+jnliydc
	K2fvAWiArd/mFyO8lMt4KzDuZLcX829H6C+cDZP8E7qbUzg7OJyLfzu/IPJbxGr+
	NrZjzB4fBNq+gXaAeF21qb9szaTpXKcr9JzKA7QzAQ1wezNd3i7k0Emo2WRCU4bZ
	K9wMwxhywTeckxG0w2B+zkcZ+pd2A0+4IEaFWC6nJxxSXvXRwTpDoIO1IQ+e6Lgn
	PUa97OwdJZN9eASGkKBLHF3X6jvBY7AgDg2X7sfyowPKejlawfRJRhHxCyIDYY1M
	kGytmZNIlb+Rgy7Lp3/Usx1bTGIF8MnGfnmwNKBE/9DuJZviGB8+Z7KWxb9v6N+X
	rwatbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjyaa6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 11:05:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 355CF40047;
	Wed, 23 Apr 2025 11:03:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 796539208E0;
	Wed, 23 Apr 2025 11:02:29 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 11:02:29 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>, <johan+linaro@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 7/9] arm64: dts: st: Add PCIe Root Complex mode on stm32mp251
Date: Wed, 23 Apr 2025 11:01:17 +0200
Message-ID: <20250423090119.4003700-8-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090119.4003700-1-christian.bruel@foss.st.com>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_020532_648260_EA569878 
X-CRM114-Status: GOOD (  10.25  )
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

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 87110f91e489..5a5c177036cb 100644
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
@@ -899,6 +908,41 @@ stmmac_axi_config_1: stmmac-axi-config {
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


