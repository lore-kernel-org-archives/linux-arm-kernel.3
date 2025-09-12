Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A617FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=41ADgNrKihGdh6ABSZq8itBkuFhnZ+8ndSF55rURelI=; b=pOKp6SRe6e3giLuYbodyCSpo/Z
	1Y2OjX2iZAegcBnMAZA9MhTBcKcWdAmek2Su633eZCRiZo/m5jmSX+uCzlbSAAZh9gn5mEZTso6BT
	vx8H7A5fpRl1XnxrPWTR+6Zprg+BH4FhCMDwFnE5AkvYscWciFostC0zaAQvLcxIJ/ByWlgI3VSNd
	iLQsYE05EhPMeomeDGwU7Qpf6ITbbkS1m6Ooi/C3P4ek4mXX8weKpF7FlzWsgADjZdUGHHCSioDp1
	dPZqc0ei7QwasVLt9l07odm5V1DDr2DizFX0J6RMSWO+3/vH1PEzgekKj8jeLPmuswQeGB1Pefzsb
	cj4OiZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pG-00000009DNP-47Qg;
	Fri, 12 Sep 2025 12:24:26 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pE-00000009DLs-2MwD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:24:26 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCO4hS967935;
	Fri, 12 Sep 2025 07:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679844;
	bh=41ADgNrKihGdh6ABSZq8itBkuFhnZ+8ndSF55rURelI=;
	h=From:To:CC:Subject:Date;
	b=jH82VOsf6aACJOZ1aGamQtJYN4wRtOdhrrZF4qB713aRU35oAVF2V0rFt8pt8fdyc
	 mrmH9SbF4gZFMbzPzfoGRF66lh9fIaTn0ahb0yu5ZYQn0xyl5wtexPTMpTXoEh/hpb
	 otq3k24f2EJsZvECr5K/MhhljqlZHjAolaz0sfMo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCO42Y2760210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:24:04 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:24:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:24:03 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLS3589278;
	Fri, 12 Sep 2025 07:23:57 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <qiang.yu@oss.qualcomm.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>
CC: <jirislaby@kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 00/10] PCI: Keystone: Enable loadable module support
Date: Fri, 12 Sep 2025 17:46:11 +0530
Message-ID: <20250912122356.3326888-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052424_698858_0BEFB622 
X-CRM114-Status: GOOD (  18.83  )
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
bfd2c81b061c Merge branch 'pci/misc'
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

v1 of this series is at:
https://lore.kernel.org/r/20250903124505.365913-1-s-vadapalli@ti.com/
Changes since v1:
- Based on the feedback provided by Jiri Slaby <jirislaby@kernel.org> at:
  https://lore.kernel.org/r/3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org/
  patch 09/11 of the v1 series has been posted as a FIX at:
  https://lore.kernel.org/r/20250912100802.3136121-2-s-vadapalli@ti.com/
  and is therefore no longer a part of the current series.
- Based on the feedback provided by Manivannan Sadhasivam <mani@kernel.org> at:
  https://lore.kernel.org/r/2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5/
  patch 11/11 of the v1 series which is patch 10/10 of this series has
  been modified by retaining 'builtin_platform_driver()' instead of
  changing it to 'module_platform_driver()'.
- Series has been based on pci/next instead of linux-next.

For testing the series, Linux has been built in the following manner:
1. Check out at commit bfd2c81b061c Merge branch 'pci/misc' of pci/next
2. Apply commit and patch series mentioned as dependencies above.
3. Apply current series.
4. Build Linux with CONFIG_PCI_KEYSTONE, CONFIG_PCI_KEYSTONE_HOST and
   CONFIG_PCI_KEYSTONE_EP set to 'm'.

Series has been tested on AM654-EVM with an NVMe SSD connected to the
PCIe connector on the board and verifying that the NVMe SSD enumerates
successfully. Additionally, the 'hdparm' utility has been used to read
the NVMe SSD for verifying functionality. Test Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/54848d3414dc965bec3c29253a1b2764

Regards,
Siddharth.

Siddharth Vadapalli (10):
  PCI: Export pci_get_host_bridge_device() for use by pci-keystone
  PCI: dwc: Export dw_pcie_allocate_domains() for pci-keystone
  PCI: dwc: Add dw_pcie_free_domains() helper for cleanup
  PCI: dwc: ep: Export dw_pcie_ep_raise_msix_irq() for pci-keystone
  PCI: keystone: Add ks_pcie_free_msi_irq() helper for cleanup
  PCI: keystone: Add ks_pcie_free_intx_irq() helper for cleanup
  PCI: keystone: Add ks_pcie_host_deinit() helper for cleanup
  PCI: keystone: Add ks_pcie_disable_error_irq() helper for cleanup
  PCI: keystone: Exit ks_pcie_probe() for the default switch-case of
    "mode"
  PCI: keystone: Add support to build as a loadable module

 drivers/pci/controller/dwc/Kconfig            |   6 +-
 drivers/pci/controller/dwc/pci-keystone.c     | 101 ++++++++++++++++++
 .../pci/controller/dwc/pcie-designware-ep.c   |   1 +
 .../pci/controller/dwc/pcie-designware-host.c |  10 ++
 drivers/pci/controller/dwc/pcie-designware.h  |   5 +
 drivers/pci/host-bridge.c                     |   1 +
 include/linux/pci.h                           |   1 +
 7 files changed, 122 insertions(+), 3 deletions(-)

-- 
2.43.0


