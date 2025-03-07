Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BEAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L8uOvoVLDeLOL1fDGRqGNDMqZxmbAi0wKgSFV9Fi1vY=; b=sOXNYMKftNBjfjlyBuIodaLkkR
	nOvoZ245+x3uEXzhmECUc0fDGK14ISfr924HRTOZfIdrr2MurSK+yrcUw2hMqKCThfNKN7UqY+Tf0
	pV4gxqJg0uPQiPf3DJqOQ9gAc6WvT8UJx2sIhiEfb0BVGoj4vwN/SVN5vu2bOoVp5OAB8A8qGeM9x
	Uc6hz030HfbvMAtE9TdG8mixwzY3RSfbwJ/YTU0vO4ony5QGJkGTJRso4SkVJ1XeSf45v1RMAut2D
	eKvVL8hPMLPSg5Hfy9uwpf7t6rVG97F9Zh0/Eh66IIEGMxh5wkcAWHxUZZea4jdILrx9kckrY3CSd
	L/1vRY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV8V-0000000DucX-3GbE;
	Fri, 07 Mar 2025 10:40:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUzk-0000000Dt00-3jWF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:31:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527AVYRl243376
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 04:31:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741343494;
	bh=L8uOvoVLDeLOL1fDGRqGNDMqZxmbAi0wKgSFV9Fi1vY=;
	h=From:To:CC:Subject:Date;
	b=Vf012oGjFcG9hNrgbt4V3FRaWISgjJEy65aGrdFrjn/SN0YmbXfpFs91jqq6n2UiI
	 1qT8m0N9Dm/WUfzJDTS5zLsYzzr4lXN43u6Mssy/zHgsy2PbA1omcpszd1bgNFVTHx
	 ig981d7OJGsXFCxYkPPRtYmCISYCE/GQONw/L0fE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 527AVXIB016599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Mar 2025 04:31:33 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 04:31:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 04:31:33 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527AVSQ2016876;
	Fri, 7 Mar 2025 04:31:29 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <cassel@kernel.org>, <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>
CC: <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Date: Fri, 7 Mar 2025 16:01:24 +0530
Message-ID: <20250307103128.3287497-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_023157_018876_2C6BD37D 
X-CRM114-Status: GOOD (  14.22  )
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

Hello,

This series enables support to build the PCIe Cadence Controller drivers
and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
Modules. The motivation for this series is that PCIe is not a necessity
for booting the SoC, due to which it doesn't have to be a built-in
module. Additionally, the defconfig doesn't enable the PCIe Cadence
Controller drivers and the PCI J721E driver, due to which PCIe is not
supported by default. Enabling the configs as of now (i.e. without this
series) will result in built-in drivers i.e. a bloated Linux Image for
everyone who doesn't have the PCIe Controller. Therefore, with this
series, after enabling support for building the drivers as loadable
modules, the driver configs can be enabled in the defconfig to build
the drivers as loadable modules, thereby enabling PCIe.

Series is based on linux-next tagged next-20250306.

--------------------------
Series has been tested for
--------------------------
[1] Loading and Unloading the PCI J721E driver when operating in the
Root-Complex mode on J721E-EVM with an NVMe SSD connected to the PCIe
Connector. "hdparm" based reads of the NVMe SSD have been performed to
validated functionality before and after a module unload-load sequence
using modprobe. Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/085fd24d416bab5dc7d798156ce130b3

[2] Loading and Unloading the PCI J721E driver when operating in the
Endpoint mode on J784S4-EVM with 6 Physical Functions configured in the
Endpoint and connected to the J721E-EVM as the Root-Complex. Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/1ec568a76bc3ebc1082d434aab4ab00b

The following changes to arch/arm64/configs/defconfig were made to test
this series and will be posted as a patch after this series gets merged:
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a3706db2982..0ca073141c3e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -209,6 +209,12 @@ CONFIG_NFC=m
 CONFIG_NFC_NCI=m
 CONFIG_NFC_S3FWRN5_I2C=m
 CONFIG_PCI=y
+CONFIG_PCI_J721E=m
+CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_J721E_EP=m
+CONFIG_PCIE_CADENCE=m
+CONFIG_PCIE_CADENCE_HOST=m
+CONFIG_PCIE_CADENCE_EP=m
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCIEAER=y
 CONFIG_PCI_IOV=y

Regards,
Siddharth.

Kishon Vijay Abraham I (1):
  PCI: cadence: Add support to build pcie-cadence library as a kernel
    module

Siddharth Vadapalli (3):
  PCI: cadence-host: Introduce cdns_pcie_host_disable helper for cleanup
  PCI: cadence-ep: Introduce cdns_pcie_ep_disable helper for cleanup
  PCI: j721e: Add support to build as a loadable module

 drivers/pci/controller/cadence/Kconfig        |  12 +-
 drivers/pci/controller/cadence/pci-j721e.c    |  37 +++++-
 .../pci/controller/cadence/pcie-cadence-ep.c  |  16 +++
 .../controller/cadence/pcie-cadence-host.c    | 113 ++++++++++++++++++
 drivers/pci/controller/cadence/pcie-cadence.c |  12 ++
 drivers/pci/controller/cadence/pcie-cadence.h |  14 ++-
 6 files changed, 194 insertions(+), 10 deletions(-)

-- 
2.34.1


