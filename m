Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC80D3B98E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqT5IxySTKXfbHsipjA41jfpwmNQnAvDQits4qChS3A=; b=o8hyJdPngrfawOjbSMQ05NP031
	dzG/8yhR7MoK7Kiqq6/MobpBpzw7XsQIXp7iAGVin5kL1tPdByXh4KXsl0Ll1c8hxU/qxt0CO07V8
	ngOFnSDcWu5ZPhdGBIrjeF2C4PUM1pRjQw7E08NctyjXZTwlTK8vAHuF1TG7GuDPP/ocPvnBB/Wsi
	5WAkdw9AN77MTdU1hZxZQAyUFrBtBr2s/ULgChij14CkALF89ti8vTq80SSfizLGvW/0JdmZ356a5
	OTSsQuNc79oyODycpqJ0ziU0CggaGgkfnYUAYklAZlBvq+BbWJyQyI+OxJCVrJeHj3LLytsJobBrr
	lbe53hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvV1-0000000Ai0H-3iIs;
	Tue, 26 Nov 2024 13:21:03 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvFc-0000000AeM5-2Hbw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 13:05:10 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQAk54s003890;
	Tue, 26 Nov 2024 14:04:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=cqT5IxySTKXfbHsipjA41j
	fpwmNQnAvDQits4qChS3A=; b=YeY2nuOkbe0Jvh4UjGdW6+PDtxnZl4c7DH6xqV
	VTtm2wb3GOp7LjPismVzkYp219DSb+JiLXBWdw86Kvtr4dhfiNS6qIPC3eQlvQGo
	X5AxngvJ/XeZvaMcjl52ZK+E8i8EcohuetNQvuclxQub0tZx356Up3f8ENjWK1Pq
	0o3Lc13qS/7ZvDARSd/zXMYg91hA24lRm8JYZmPegR5kwoCMZI4v/frx8iljw1Tx
	5AuPXloIYPNFoCihIqNpS2tkjp93o8ir4Mu8yig5m1ZWYxkClUohj0ePOusXMkE6
	PW1OylwOXEvDK/dAMj+b1Vp/u3YqKSQns7Pg+ZaYRoDyRK8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4336tfmxcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 14:04:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B96E34004C;
	Tue, 26 Nov 2024 14:03:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 659DD26EEEE;
	Tue, 26 Nov 2024 14:00:26 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 14:00:26 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v1 0/5] Add STM32MP25 PCIe drivers
Date: Tue, 26 Nov 2024 13:59:59 +0100
Message-ID: <20241126130004.1570091-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_050508_862715_6D0F4F28 
X-CRM114-Status: GOOD (  11.71  )
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

This patch series adds PCIe drivers STM32MP25 SoC from STMicrolectronics
and respective yaml schema for the root complex and device modes.

Changes in v1:
   Address comments from Rob Herring and Bjorn Helgaas:
   - Drop st,limit-mrrs and st,max-payload-size from this patchset
   - Remove single reset and clocks binding names and misc yaml cleanups
   - Split RC/EP common bindings to a separate schema file
   - Use correct PCIE_T_PERST_CLK_US and PCIE_T_RRS_READY_MS defines
   - Use .remove instead of .remove_new
   - Fix bar reset sequence in EP driver
   - Use cleanup blocks for error handling
   - Cosmetic fixes
   
Christian Bruel (5):
  dt-bindings: PCI: Add STM32MP25 PCIe root complex bindings
  PCI: stm32: Add PCIe host support for STM32MP25
  dt-bindings: PCI: Add STM32MP25 PCIe endpoint bindings
  PCI: stm32: Add PCIe endpoint support for STM32MP25
  MAINTAINERS: add entry for ST STM32MP25 PCIe drivers

 .../bindings/pci/st,stm32-pcie-common.yaml    |  45 ++
 .../bindings/pci/st,stm32-pcie-ep.yaml        |  61 +++
 .../bindings/pci/st,stm32-pcie-host.yaml      |  99 ++++
 MAINTAINERS                                   |   7 +
 drivers/pci/controller/dwc/Kconfig            |  24 +
 drivers/pci/controller/dwc/Makefile           |   2 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 445 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-stm32.c       | 402 ++++++++++++++++
 drivers/pci/controller/dwc/pcie-stm32.h       |  17 +
 9 files changed, 1102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h

-- 
2.34.1


