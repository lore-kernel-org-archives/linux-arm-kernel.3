Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A009D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnAbYm4VWUKZ0F1ePtL5cGK91Okpi3RKOo0VHnxT3ak=; b=e3PqnuucideYYteCgDaDnRFkw3
	eNVddVfvXo/z/useVFui9EMW8LVtk0PYQMCUi/+aJFR2OXxXIjjV68H6hNizV5VHk2v9Pf3jpth+U
	2H98PupdfApuSX1Ra13XiiPu425f1rbLXsn5FOLb5cpPCZTtYbVUzduMxj6hF0CMM3pCylJUDXw4Z
	3fBAJocDeDsSBaNlWfklBxanZxWulQJYR8C/ehZ+to+Nimq6M7oAk1A86UId7jE6y6yYoP9SfJO4W
	vZX7s5zlwtRiHpiq/6iSBgrD9VNH//lSKP4Q8InECrKD+qN9P1heMpK9og4twgSUYeRAxOXPpW/uO
	tT40/oEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EeR-0000000GHyh-0myJ;
	Tue, 05 Nov 2024 08:10:59 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EMd-0000000GEwf-2mHV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:52:37 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A549V48025479;
	Tue, 5 Nov 2024 08:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XnAbYm4VWUKZ0F1ePtL5cGK91Okpi3RKOo0VHnxT3ak=; b=AcmwMSynS2cZtSqX
	TJVEsdn86r9uuFsyt5bwqAuKA6eYiWjgAOVfMgvxnFfzjRIP8ZrWBtAp1vQfpKSG
	8Gtiy+06sRCuPSlE6TzCvrksd4ohbFRY/hoYZJ/cLfWAlGHmTro32+wdUhIPG+Dn
	6O5DA8Bv2erZBoZfKnn6HblXPNyX/38TCs/y1OmW5UGBeQUomZd4HAtY5PUCl1ai
	tjR37UNjcJngxsxG9yXO+8GdUw8boCcwu5ZbbZVS7UWiU/g28FPycM3/tF4S5uIH
	98N68fD+p/V2oFqS2IlHHz6XwQPCZX4MQOFcv5TXw5SzY6TiePr/DZDnWLn960rr
	+Zeqcg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtucu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:52:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE4F040050;
	Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 088E72513C1;
	Tue,  5 Nov 2024 08:49:37 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:36 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:17 +0100
Subject: [PATCH v2 14/15] arm64: dts: st: add csi & dcmipp node in
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-14-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_235236_068543_82F92B91 
X-CRM114-Status: UNSURE (   8.90  )
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

Add nodes describing the csi and dcmipp controllers handling the
camera pipeline on the stm32mp25x.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 1167cf63d7e87aaa15c5c1ed70a9f6511fd818d4..6f8cabf2c5985f358689f15296300de24e9d9b25 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -518,6 +518,29 @@ i2c8: i2c@46040000 {
 				status = "disabled";
 			};
 
+			csi: csi@48020000 {
+				compatible = "st,stm32mp25-csi";
+				reg = <0x48020000 0x2000>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc CSI_R>;
+				clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>,
+					 <&rcc CK_KER_CSIPHY>;
+				clock-names = "pclk", "txesc", "csi2phy";
+				access-controllers = <&rifsc 86>;
+				status = "disabled";
+			};
+
+			dcmipp: dcmipp@48030000 {
+				compatible = "st,stm32mp25-dcmipp";
+				reg = <0x48030000 0x1000>;
+				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc DCMIPP_R>;
+				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
+				clock-names = "kclk", "mclk";
+				access-controllers = <&rifsc 87>;
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00353180>;

-- 
2.25.1


