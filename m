Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uTctHAVrrJJhz8+sjGmeprmgZ6Z8FF5nTjBctXETYv4=; b=Y5eHSJ+bkN2nEc7wgyOLqBR6Ht
	kAA4sSggxcPdh4OR43frsTkDk/DeUecPoOngn3317ltjzB15LvnU/YKqNt4UaweDvgtItTQ/XXq0w
	N6GJg1Ucs/rEMVSRbue8huY/pwCYSaqn8eXbFlYTkq2dubUKXlhkDugvcf0vV25uSrmGwDBG4hDuA
	+fakzWoP8kLUGxSVu/LBBC5Y0Y0KnDnRR24acxDLQ16Gdg0shapAGro4Aaii90ciw1mrym5a+u+pl
	/sWWJ4JdddNDpZR5P1hW6nWdiFEZStkes8GVHEgeSJEluwJnwYnkC+5Nj6IDSaKTqwGqlmbyPP6TF
	lggX47pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ajH-000000098U5-1jXG;
	Mon, 22 Sep 2025 07:12:55 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ajF-000000098QK-0w77
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:12:54 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58M7CUVE1183964;
	Mon, 22 Sep 2025 02:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758525150;
	bh=uTctHAVrrJJhz8+sjGmeprmgZ6Z8FF5nTjBctXETYv4=;
	h=From:To:CC:Subject:Date;
	b=BAoGWRwCnSwvL4b0XnSGtYbNbEKjRnVDuw7/S+M03ymgz+EEe09FXJF78GE8ohYch
	 22Px5giTvLQek6ziat2OAnuNh2S/9uRk8anNPfw0QYdPKzlfsubfvDJswaDWtaV/dX
	 V6YPEpdaCWguGMdvSCzIy5SSTujICRodxTO3UDwg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58M7CULP1800388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 02:12:30 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 02:12:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 02:12:29 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58M7CN0R2369246;
	Mon, 22 Sep 2025 02:12:23 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <quic_wenbyao@quicinc.com>,
        <inochiama@gmail.com>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <shradha.t@samsung.com>,
        <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 0/4] PCI: Keystone: Enable loadable module support
Date: Mon, 22 Sep 2025 12:42:12 +0530
Message-ID: <20250922071222.2814937-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001253_544953_79FC47F2 
X-CRM114-Status: GOOD (  20.74  )
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

This series enables support for the 'pci-keystone.c' driver to be built
as a loadable module. The motivation for the series is that PCIe is not
a necessity for booting Linux due to which the 'pci-keystone.c' driver
does not need to be built-in.

Series is based on commit
dc72930fe22e Merge branch 'pci/misc'
of pci/next.

NOTE for MAINTAINERS: This series has the following dependencies:
1. The following commit in Linux-Next is a build-dependency for the
series:
https://github.com/ColinIanKing/linux-next/commit/8de1de5a3a8d42975953382068fb5195e9d6e6c6
Since the v1 series was based on linux-next, there were no build errors.
However, since this series is based on pci/next based on the feedback from
Manivannan Sadhasivam <mani@kernel.org> at:
https://lore.kernel.org/r/2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5/
without the aforementioned commit, build will fail.
2. The following patch series include fixes for the driver which are
required to verify the driver functionality:
https://lore.kernel.org/r/20250912100802.3136121-1-s-vadapalli@ti.com/

v2 of this series is at:
https://lore.kernel.org/r/20250912122356.3326888-1-s-vadapalli@ti.com/
Changes since v2:
- Patch 04/10 of the v2 series has been squashed into patch 02/10 of the
  v2 series. In the v3 series, the squashed patch is 02/04.
- Patches 03/10, 05/10, 06/10, 07/10 and 08/10 of the v2 series have been
  dropped. The reason for dropping them is that all of the aforementioned
  patches introduce helpers for cleanup on driver removal. Since Mani
  pointed out that the driver cannot be removed until the IRQ issues are
  fixed, the driver's remove function hasn't been updated and therefore
  the helpers have been discarded.
- The commit message of patch 09/10 of the v2 series has been updated,
  keeping it concise and focusing on the issue and the fix. Moreover, a
  'Fixes' tag has been included although a backport isn't necessary, in
  order to address Mani's feedback.
- All changes associated with driver removal in patch 10/10 of the v2
  series have been discarded.
- Patch relation between v2 and v3 series is as follows:
  v3 01/04 => v2 01/10
  v3 02/04 => v2 02/10 + 04/10
  v3 03/04 => v2 09/10
  v3 04/04 => v2 10/10

For testing the series, Linux has been built in the following manner:
1. Check out at commit dc72930fe22e Merge branch 'pci/misc' of pci/next
2. Apply commit and patch series mentioned as dependencies above.
3. Apply current series.
4. Build Linux with CONFIG_PCI_KEYSTONE, CONFIG_PCI_KEYSTONE_HOST and
   CONFIG_PCI_KEYSTONE_EP set to 'm'.

Series has been tested on AM654-EVM with an NVMe SSD connected to the
PCIe connector on the board and verifying that the NVMe SSD enumerates
successfully. Additionally, the 'hdparm' utility has been used to read
the NVMe SSD for verifying functionality. Test Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/182a80bb43e9c407982f7674034a7c9d

Regards,
Siddharth.

Siddharth Vadapalli (4):
  PCI: Export pci_get_host_bridge_device() for use by pci-keystone
  PCI: dwc: Export dw_pcie_allocate_domains() and
    dw_pcie_ep_raise_msix_irq()
  PCI: keystone: Exit ks_pcie_probe() for invalid mode
  PCI: keystone: Add support to build as a loadable module

 drivers/pci/controller/dwc/Kconfig                | 6 +++---
 drivers/pci/controller/dwc/pci-keystone.c         | 8 ++++++++
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 drivers/pci/host-bridge.c                         | 1 +
 include/linux/pci.h                               | 1 +
 6 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.43.0


