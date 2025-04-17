Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E62AC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3alW43WvHJRTnbjVnK0tT/qRTZ+LjL/F72bfjWZPsY=; b=FXkdsjrXNZROFRnm8a++0lIFWF
	6ToeoLYlf6FK8bQdFXap+oU5SwKqWcb57p6fmkEXNDUaZTQqVLTd4OBbdPZ6mO/E75fvKzEJrK4rs
	NMO3RfEWak42qZC5eeKDn62ypqsu8hzyksBj2T2b1CG/g4rAzwk+MN4ciXubg0lZ9dYXpFhoyDEk0
	SieNHiQdwvizbQBb0ZEzEKp9WYqKs0WI2337qqnp3+kwGgHuFEhzSaQ1JNfQpzUdUpn2Rcpu9PuXX
	86dwc20SOuJyA4K/ppVZc8yzmxqdbHAdAkt2ztJ+FJBHBH+ho2CwUToxaryR3DsO6whL5RTzotq4k
	ic/nZegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pbb-0000000DCK3-2XXF;
	Thu, 17 Apr 2025 13:48:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PCy-0000000D8aF-2p4b
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 13:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b3alW43WvHJRTnbjVnK0tT/qRTZ+LjL/F72bfjWZPsY=; b=A5R0HDSSD3FAaTWt/yuUPeDiSv
	lW1wfWFFoKGUkO7vooqnES9cxsb0iBtgpVFgL/u6hmVSZXMEv2UjifkuSWX7xpbRq+zA8ReCoPGff
	f1jGR9X2whBYMPqrDOJ/eVV4J0tTMEBBSIcp/zLk/RFExS/ACy/L7pjScBmlxQ7IU42+DKpK4rFPe
	mjlozV8DyvfmHlHdptJGopBU+ICe4/H99fKtnQd/8z3XpJejxdT1XwdjtsrvwScWT2ueAG6l+zTH7
	g7H70Th81Y74w8buVBr4SdFHFbXJC1ff3FgqBDwUOkvT+oZ/bC2roBBt9f0qbk7KxP9p2BQjF4Vu6
	RPWRdNeA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5PCv-0000000AIjI-2QBi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:23:11 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HB6vsJ027953;
	Thu, 17 Apr 2025 15:22:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	b3alW43WvHJRTnbjVnK0tT/qRTZ+LjL/F72bfjWZPsY=; b=JhgK9FIeL7wre7V2
	SC1P0ZPqVKz+HGO5pnWCYwFJvT3WLzv2qZhG0cKhGxJ1ltFXZxjIAiy9KWm+qDLu
	o/7OINtAp5l/hZGNENSE+Z77Ud+IVHbBnlrZ6N9QV57QsyOam87JleV6ADvaCeUj
	YDHkQreKLI5s7sCk+CspguI2/fd3cHNpAmDJnT3ywXcwvzVDfRWneRMK5KtQqJYU
	iJg5JN/oDKEyVy7pUyv9NCzEaD/a1pd6GfWbpT3o/IYDvDs7QwwqZ88bbOTWqw+J
	C6pZqDne84562ur658kndQ3BCLUg9P7syS12QEARegSF2InQBOPJJjqApjWv5Qw3
	Fg8T2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45yfh28fw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:22:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D188940047;
	Thu, 17 Apr 2025 15:21:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22C16990D5B;
	Thu, 17 Apr 2025 15:20:13 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 15:20:12 +0200
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
Subject: [PATCH v6 8/9] arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
Date: Thu, 17 Apr 2025 15:18:32 +0200
Message-ID: <20250417131833.3427126-9-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417131833.3427126-1-christian.bruel@foss.st.com>
References: <20250417131833.3427126-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_142309_841757_DEA157FE 
X-CRM114-Status: UNSURE (   9.69  )
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

Add pcie_ep node to support STM32 MP25 PCIe driver based on the
DesignWare PCIe core configured as Endpoint mode

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 5a5c177036cb..71b89cbab9f2 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -909,6 +909,19 @@ stmmac_axi_config_1: stmmac-axi-config {
 				};
 			};
 
+			pcie_ep: pcie-ep@48400000 {
+				compatible = "st,stm32mp25-pcie-ep";
+				reg = <0x48400000 0x400000>,
+				      <0x10000000 0x8000000>;
+				reg-names = "dbi", "addr_space";
+				clocks = <&rcc CK_BUS_PCIE>;
+				resets = <&rcc PCIE_R>;
+				phys = <&combophy PHY_TYPE_PCIE>;
+				access-controllers = <&rifsc 68>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			pcie_rc: pcie@48400000 {
 				compatible = "st,stm32mp25-pcie-rc";
 				device_type = "pci";
-- 
2.34.1


