Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5420D42BAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grK3TrtRCUh5vGmrMEKFGChLMBkQA+p427mP9eM/nRQ=; b=a+xs6ojTZ0A0Zp/V/IzgW3GTO+
	O+Sb+F+puz+hya12oTRym1utsPn8hg6jdyTP8AnIoo+H21Nv8iiNXEe2GbQoRPj+JIeXcVsNq6d0m
	2YVIi0KZYMdwwsHb/6B7fkVTJRu0QynM5nPO4IE9F3BaeRgj3me3vBRDrL6IidaP6AZyCvY0c1eMp
	UtRq+laJ1STsaAXQIBq026JOr6t459KKpcJ2q8wQM3otXpUc7SUilxYzvZH2av60woG3JNK4KkssG
	IBlL8UN1Ik7sUDq53/h12xkPPHaHNiNev6KDCWcqXYFRRfj5cUbrCcBUQCHkUKmB+lHxeHmpnXYk8
	suazClsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu2g-00000004CeV-2NUn;
	Tue, 12 Nov 2024 16:47:02 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtmd-000000049T5-2qu7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:30:29 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACDB1KK029351;
	Tue, 12 Nov 2024 17:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=grK3TrtRCUh5vGmrMEKFGC
	hLMBkQA+p427mP9eM/nRQ=; b=CYAeaJNIyVM03AaUJEH9Qb0Pi4LeJevj5Y/GaI
	sDFMK1XBipiIJ9wlkDipotAYGXr57Hd6r772a+ggyoOaDWlgG4b+JWk1/9Fuwn76
	7TjHrsnhO7TTwjc89LrH0yLFKdHH4wDT0aKSQ6uMvHbU4YR1kn+g9ZL3ZFdVSiQR
	Gtld1vrvibknO1nrVKvO5BkV2Q20t7S6W+84DVRKvoYxUC+UYyiAhuMtul4YArl3
	lg0Mzxl7q0en8xJf1gw8PTnyYTHUZvP8cD/UYyzC8X03ZSNwAy+uTTX28K4fHvbL
	goTXnmx5YR2oV7fB4UU9eoReTpFvq1VAbXIcenLlhFeGnEpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42tkjnjs7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 17:22:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 17B1D4002D;
	Tue, 12 Nov 2024 17:21:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39CDE2C6353;
	Tue, 12 Nov 2024 17:20:06 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 17:20:05 +0100
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
Subject: [PATCH 0/5] Add STM32MP25 PCIe drivers
Date: Tue, 12 Nov 2024 17:19:20 +0100
Message-ID: <20241112161925.999196-1-christian.bruel@foss.st.com>
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
X-CRM114-CacheID: sfid-20241112_083028_054929_6ADED708 
X-CRM114-Status: UNSURE (   9.82  )
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

This patch series adds PCIe drivers STM32MP25 SoC from STMicrolectronics
and respective yaml schema for the root complex and device modes.

Christian Bruel (5):
  dt-bindings: PCI: Add STM32MP25 PCIe root complex bindings
  PCI: stm32: Add PCIe host support for STM32MP25
  dt-bindings: PCI: Add STM32MP25 PCIe endpoint bindings
  PCI: stm32: Add PCIe endpoint support for STM32MP25
  MAINTAINERS: add entry for ST STM32MP25 PCIe drivers

 .../bindings/pci/st,stm32-pcie-ep.yaml        |  97 ++++
 .../bindings/pci/st,stm32-pcie-host.yaml      | 149 ++++++
 MAINTAINERS                                   |   7 +
 drivers/pci/controller/dwc/Kconfig            |  23 +
 drivers/pci/controller/dwc/Makefile           |   2 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 433 +++++++++++++++
 drivers/pci/controller/dwc/pcie-stm32.c       | 493 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-stm32.h       |  24 +
 8 files changed, 1228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h

-- 
2.34.1


