Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB28CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MJIJ1bbVcymHncqSqQqeKOAPaRiZ1naG0SLE1m9EcvA=; b=dCOcVcW/VyJm2YmLSdOuJJfEJM
	sWw7+5FuxXt9Rjm0Kfsxp/2v51XXTpJV/Dx26Kcu2PkudnZe0XBPQTVMHRdzDlcrNObQsE6wglWpn
	Jeor805WfXljTU18tbx6QzZx3F9bIf5ne0/Le1vDygevAKYxzoP5jQ2PKqTEkTkNxv5znDcwdVdx7
	VNw6rWpnAQ7/YgkJM387sKbP6n35r/wzVlr9cceOdVA7JIOP1MxBGAowQhAbMb1fNq5NCJ/necrcY
	GTwyfl1Tlkq9ut72A10gjJ1AZfO68zeH62wEqwXL0ze5sTBXXQrSge/tGU1paCxbS1lcBeH8AD0Wq
	N/6wYeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utorq-00000006nv5-0f3m;
	Wed, 03 Sep 2025 14:53:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmri-00000006RIO-2nbt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:45:32 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583CjD443263768;
	Wed, 3 Sep 2025 07:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903513;
	bh=MJIJ1bbVcymHncqSqQqeKOAPaRiZ1naG0SLE1m9EcvA=;
	h=From:To:CC:Subject:Date;
	b=jb/WkbG6Mb1Ar4jRlYTnjlScvg05D/pBMUBeehItPGtLKkCm3u+LDYn/i+0GMK9RV
	 3zgTyzdzR5hhey9ySVUXvbpM5N97AZNQqNUYSkfXO3Fr/rrJVX9k9qTZZhelcK7sHn
	 k9Va0J/2BAZYnNDtKk8rOwcN0PRcWT44e3JnVnb4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583CjDr2083850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:45:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:45:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:45:12 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wR1576150;
	Wed, 3 Sep 2025 07:45:06 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <fan.ni@samsung.com>, <quic_wenbyao@quicinc.com>,
        <namcao@linutronix.de>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <shradha.t@samsung.com>, <inochiama@gmail.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <18255117159@163.com>, <rongqianfeng@vivo.com>,
        <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 00/11] PCI: Keystone: Enable loadable module support
Date: Wed, 3 Sep 2025 18:14:41 +0530
Message-ID: <20250903124505.365913-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054530_819154_70C45155 
X-CRM114-Status: GOOD (  13.34  )
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

Series is based on linux-next tagged next-20250903.

Series has been tested on the AM654-IDK-EVM by validating module removal
and reprobe while connected to an Intel PCIe-Ethernet Adapter. Test Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/dfd7821c187241d63098117eb7431a1b

Regards,
Siddharth.

Siddharth Vadapalli (11):
  PCI: Export pci_get_host_bridge_device() for use by pci-keystone
  PCI: dwc: Export dw_pcie_allocate_domains() for pci-keystone
  PCI: dwc: Add dw_pcie_free_domains() helper for cleanup
  PCI: dwc: ep: Export dw_pcie_ep_raise_msix_irq() for pci-keystone
  PCI: keystone: Add ks_pcie_free_msi_irq() helper for cleanup
  PCI: keystone: Add ks_pcie_free_intx_irq() helper for cleanup
  PCI: keystone: Add ks_pcie_host_deinit() helper for cleanup
  PCI: keystone: Add ks_pcie_disable_error_irq() helper for cleanup
  PCI: keystone: Switch to devm_request_irq() for "ks-pcie-error-irq"
    IRQ
  PCI: keystone: Exit ks_pcie_probe() for the default switch-case of
    "mode"
  PCI: keystone: Add support to build as a loadable module

 drivers/pci/controller/dwc/Kconfig            |   6 +-
 drivers/pci/controller/dwc/pci-keystone.c     | 111 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-ep.c   |   1 +
 .../pci/controller/dwc/pcie-designware-host.c |  10 ++
 drivers/pci/controller/dwc/pcie-designware.h  |   5 +
 drivers/pci/host-bridge.c                     |   1 +
 include/linux/pci.h                           |   1 +
 7 files changed, 127 insertions(+), 8 deletions(-)

-- 
2.43.0


