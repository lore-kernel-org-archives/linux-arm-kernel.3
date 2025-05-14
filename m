Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA328C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSDRpy0g7FYUyuE/pI0gvgKtAjh6WX9J/qcJX4BpsAA=; b=VuvyHqyA4kScaEy/V4dE3V+KyQ
	qt5bNCkLj7Z7HQ2nkdrXVmi5Vklk4NVSK7VQL4Mo9gxC4otLSgutXuzeeo4XwOcZxbj5bvy493l+/
	UozFGJnJtU3zBb9eRlUSSv7n693LJJhg9OxvWKlDeyUB0S001AAtXEl/F67+NLKFM/SfAvxxQuloA
	GMDocfqfb7UWUB4xDTJ7nl1dLXZW9D9XDkJ9buDTMxyFLL69RCHQ1AoLyY38Hy6MjCQKIOkAV5KEx
	ACg9tVfb5cq3wb24VJOjIlEl10z6rayFYJuJYlYDmVg5E4v761LHLLK7M73Zi3hr0c+6IADHjrFSs
	OZsrX/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDgM-0000000FW9M-2rjN;
	Wed, 14 May 2025 15:06:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDPT-0000000FT4U-3X3E
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 14:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CSDRpy0g7FYUyuE/pI0gvgKtAjh6WX9J/qcJX4BpsAA=; b=n9SrLlMThT77H3616iOr3w6C+N
	NqkzYAGmotUks73PprqroDn6i3vNZ73Bj0EVRPUsWSB3PxJBTqmYrl1Oz02Kbwnj6vMuSJd4ag5wG
	5q1XGDTP7qr/d4ujnLsEdEN1wVx8j8o70cFDQlYNpMBhQB/cIlj6pVAhqEsymGpawuaIKZgCMekhT
	6rkumxz0JzDrEdGuNy16ueW5T+S/12eeO5UoIwQ7T5GN1TVztpMUm53KVfJP/xneYYklErYD1DJYU
	9yt8eaQBr4W4smxgfauwLvUcvQW2YgXs2n9Bx8wQtByRIAzfuHy8f5NWSi6QN7vCdpT4sQoWqDibX
	jm/IkWKg==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDPP-0000000HDUH-2pUi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 14:48:38 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EEKcdi003633;
	Wed, 14 May 2025 16:48:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CSDRpy0g7FYUyuE/pI0gvgKtAjh6WX9J/qcJX4BpsAA=; b=zlTA6WZyyZzrndNE
	BVzIgZti0WhkUh3nUKYwZK1ONnGBweQas7jOWTszh08oPT1nUsTTLoceSecpOyx1
	GvZys46leUnNZd0xqie8uXsYsD5LcSBPXE2D6GY6tKwOSf3ekdqPdZDh5/tOBtyF
	E76pdXeSyCF0J5M5CpxOWpqgmGv4qPrsEEkG1Kh3c673oZsvC1jgvrhcihRYVoVC
	OpL91KS8Ga6f9OSdjF56zNzD4JK7ofXE5UboIMTDSpB9TUykKp9HRKxABillRpLL
	L9RmIlRa/JfJvB075b3N+Do7EW6wwJvlcayLg4t806xU/QB5PQc/3EBgI87idTr7
	xpnDfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdrce7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 16:48:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3638E4004A;
	Wed, 14 May 2025 16:46:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D86CB0E344;
	Wed, 14 May 2025 16:45:37 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 16:45:37 +0200
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
Subject: [PATCH v10 8/9] arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
Date: Wed, 14 May 2025 16:44:27 +0200
Message-ID: <20250514144428.3340709-9-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514144428.3340709-1-christian.bruel@foss.st.com>
References: <20250514144428.3340709-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_154835_849934_7FA79969 
X-CRM114-Status: UNSURE (   9.62  )
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
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 7978fd640e1e..6d54ed9a1052 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -963,6 +963,21 @@ stmmac_axi_config_1: stmmac-axi-config {
 				};
 			};
 
+			pcie_ep: pcie-ep@48400000 {
+				compatible = "st,stm32mp25-pcie-ep";
+				reg = <0x48400000 0x100000>,
+				      <0x48500000 0x100000>,
+				      <0x48700000 0x80000>,
+				      <0x10000000 0x8000000>;
+				reg-names = "dbi", "dbi2", "atu", "addr_space";
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


