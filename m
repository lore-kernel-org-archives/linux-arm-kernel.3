Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=at8L1hZ/1fuPCfwlRQeFEAPYB3p7nMuCwhudAWDVQOY=; b=MAXzKmo6i6uHIonS/aXD2MVTNF
	3VDkEHmeUrTyrTaucLbXLSpPN5J68pjwLzJTALsM8v1+gYppj3ZNemvktVGLiDT+5Mn9y2O3uV0CJ
	gu64RzmFArQpESCqd+5LNrQMmI84ULmY6VfaML3BWgl6LAOfffkWhAjVzbIdgIe853Dtz5Rz26+gK
	XugcFL2qV/NMw4PKfpOWiu8fw5qno37G9ukImWvPjd4xtFoQTg4uOTP3rOXQ1xbzBfN0q0YHiFVnd
	Xznelf3LQbzg3JLP5GEQLfXozTkHQBZ99rWQkmia1tQMI8C7PrruvR3cPS6ZNajwlaQr/lqvtJcEt
	fYPBMw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Okc-0000000D3Mo-0b22;
	Thu, 17 Apr 2025 12:53:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Obb-0000000D1kG-1u8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:44:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiElx628357
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893854;
	bh=at8L1hZ/1fuPCfwlRQeFEAPYB3p7nMuCwhudAWDVQOY=;
	h=From:To:CC:Subject:Date;
	b=AXwUaOHKaq6yywaZtF+0qviR+V9JBb4c2r17yXrIuXQF4GuiIs16MHTZMxb6GXWwf
	 ywt5ynzfA/SkC1m57RwsqjYrKGs/eI+cvhMlMWcgypXXa/nkIgDq1PlPSe4dIvNbEn
	 cEFp0rZP7jFYXUWbbG9NL2KkkAnpPyTV20m4ixAw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiEDm101084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:44:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:44:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:44:14 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCi9XB048918;
	Thu, 17 Apr 2025 07:44:09 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <18255117159@163.com>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>
CC: <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v4 0/4] Loadable Module support for PCIe Cadence and J721E
Date: Thu, 17 Apr 2025 18:14:04 +0530
Message-ID: <20250417124408.2752248-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_054435_591293_BB33166A 
X-CRM114-Status: GOOD (  14.61  )
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

Series is based on linux-next tagged next-20250417.

v3 of this series is at:
https://lore.kernel.org/r/20250410104426.463453-1-s-vadapalli@ti.com/
Changes since v3:
- In the fourth patch of this series, the polarity for PERST# assert in
  the driver's .remove callback has been fixed based on Mani's feedback at
  https://lore.kernel.org/r/6bi5gul3sqvycmkf6cwokkvownjffaf2tkonjlefo2d7cautwx@uhfexzgz3okp/

v2 of this series is at:
https://lore.kernel.org/r/20250330083914.529222-1-s-vadapalli@ti.com/
Changes since v2:
- Collected "Reviewed-by" tag from:
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  for the third patch in this series.
- Dropped a delay before PERST assertion in the driver's remove callback
  in the fourth patch of this series based on Mani's feedback at:
  https://lore.kernel.org/r/zsxnx7biwogov5dw5yiafkgk6tsrtspac75bjbrca5uevweaim@ly67hwfyk7qh/

v1 of this series is at:
https://lore.kernel.org/r/20250307103128.3287497-1-s-vadapalli@ti.com/
Changes since v1:
- Collected "Reviewed-by" tags from:
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  for the first two patches in this series.
- Based on feedback from Mani on the third patch of the v1 series at:
  https://lore.kernel.org/r/20250318080304.jsmrxqil6pn74nzh@thinkpad/
  pci_epc_deinit_notify() has been included in cdns_pcie_ep_disable().
- Based on feedback from Thomas on the fourth patch of the v1 series at:
  https://lore.kernel.org/r/88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com/
  the "check" for a non-NULL "pcie-refclk" in j721e_pcie_remove() has been
  dropped.

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
 drivers/pci/controller/cadence/pci-j721e.c    |  31 ++++-
 .../pci/controller/cadence/pcie-cadence-ep.c  |  17 +++
 .../controller/cadence/pcie-cadence-host.c    | 113 ++++++++++++++++++
 drivers/pci/controller/cadence/pcie-cadence.c |  12 ++
 drivers/pci/controller/cadence/pcie-cadence.h |  14 ++-
 6 files changed, 190 insertions(+), 9 deletions(-)

-- 
2.34.1


