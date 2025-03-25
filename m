Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE5DC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umpdSL1RKDrcoeiEHF4TRnfTgu3+K+Z+OfPFiuVf284=; b=i028pPzOMufomzC/SZa1CxEZWw
	BYjgOklfs2tddYLJ+rY3XC+1yQ6kCahe0MIVtJyWgepnLtvBOeG7vXaep9FwM9ReHPcJSrHUSni2p
	J+BfgfmqRDt4/lpy1yVUVTFvYr1OschkDjAiYIYF8HY7xmpmSI85jWzf+EKIqDKdMgoLccn9qvKGZ
	FWCHwEq0c5gdPs5005Gycd/XjiROOiiGY6EaGDcxEyAdyL+oESF9lXd47X6/+C+jlQnrwJZh7/mcW
	P3Zh+nUn7wWlFBwaLl0gP5hxNDFIHNkd4sS+b9gmniLG06vINiOkifg9Drd6fuzAyjnX2aNJcPbTJ
	gnnQcd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twyaY-0000000546v-20aW;
	Tue, 25 Mar 2025 07:20:42 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twyKS-000000052Cw-0GJL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 07:04:05 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P0A5ga001404;
	Tue, 25 Mar 2025 08:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	umpdSL1RKDrcoeiEHF4TRnfTgu3+K+Z+OfPFiuVf284=; b=BDJDBk/uC2fTS7+B
	6msmrNmD72HJbQ3vzimICXB/O17aExo2nM8zjrrC0n10Z89v2UtzFP+ecrzBxQhs
	e2/ybX9fkfVSBj+WcCJktUEHkTvz0njnHH5B3MVhdDY3zWT9vsFZ0Dg4QOoFQxUh
	tSGvnm7nsrGEVYmMEBxUjZEt0wseqWu7SLGJof6EWFh5A7YZiT/RWg2Ip/S1hHD+
	TwiAy86L2MLjPkeEHMi/gvNwyDFaAFHmP+hFoO4J0DDzurdlcfYraU8hnJQ9L1BT
	JJp0LekoycfF11+0B1nqONIXnwPb0Va8Yt43Siym96HwrKHwWXHtXjoRINU8thWF
	htGzXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j7n88n3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:03:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 469A540069;
	Tue, 25 Mar 2025 08:02:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B57D482D10A;
	Tue, 25 Mar 2025 08:01:16 +0100 (CET)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 08:01:16 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <johan+linaro@kernel.org>,
        <cassel@kernel.org>, <quic_schintav@quicinc.com>
CC: <fabrice.gasnier@foss.st.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 8/9 RESEND] arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
Date: Tue, 25 Mar 2025 07:59:34 +0100
Message-ID: <20250325065935.908886-9-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325065935.908886-1-christian.bruel@foss.st.com>
References: <20250325065935.908886-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_000404_394100_6D2BE2C3 
X-CRM114-Status: GOOD (  10.33  )
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
index a8abb13ab663..fe73161ed0d4 100644
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


