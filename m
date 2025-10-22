Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96280CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p5zzKjVDjdZgk+qCBL/BN7PWbaszOVdrduoIeN0+Bas=; b=00M8syjeXVEkNqE3zfSnJbb6Y3
	czS7bdxC6TvM1Xtobpm/J7AwczCITPLCSw8uVVnENVXWbuQIrY/ypazTkYB1tqUje6nGt2uCg4OBZ
	hDsI7pMZWntcGK6shr40VLr93MEUXGTQ7m2mYhjLItnCxCcdIFbXTH7IX2Ag84DyY62dvirxTYSur
	Kz/YRaKVRO/UhMshmDa7CWDJSDEuIk5lvKSf2Nz1F+pkSGgyeQ68p8IHd00xIg7rRjdeu3TY5YnWU
	z2T6p1YwNkbt9c9qrmMQTTUxgctU7mUFo9CwtksxFES+XEQSskQoTF1CHtgaVmUcKHBDdZ+l3bAVv
	DtcV6ARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVbD-00000002LjT-2d6L;
	Wed, 22 Oct 2025 09:57:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVb7-00000002LdU-1o6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:41 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59M9vMZ81387139;
	Wed, 22 Oct 2025 04:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761127042;
	bh=p5zzKjVDjdZgk+qCBL/BN7PWbaszOVdrduoIeN0+Bas=;
	h=From:To:CC:Subject:Date;
	b=kJd3rLOlaBNbaS2ejmkek5WmleeL2c812cu0a+FGJYL8WOHf/C0vlz/umDhXisRmL
	 81hCCUv8XtrSJqV5Gg3n3jXJHhcw26VOqqTgJt5HxchXggwetf4+eX00a58HWptDnI
	 0mp+82YRvA/dWddubfsBttGT/6HPhIyJOl7bejv4=
Received: from DFLE204.ent.ti.com (dfle204.ent.ti.com [10.64.6.62])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59M9vMYX2266279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 04:57:22 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 04:57:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 04:57:22 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59M9vFcV1029418;
	Wed, 22 Oct 2025 04:57:16 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <quic_wenbyao@quicinc.com>, <inochiama@gmail.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 0/4] PCI: Keystone: Enable loadable module support
Date: Wed, 22 Oct 2025 15:27:08 +0530
Message-ID: <20251022095724.997218-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025737_789519_B7546829 
X-CRM114-Status: GOOD (  14.94  )
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

Series is based on 6.18-rc1 tag of Mainline Linux.

DEPENDENCY
----------
This series has __NO__ dependencies since the dependencies stated in the
cover-letter of the v3 series at:
https://lore.kernel.org/r/20250922071222.2814937-1-s-vadapalli@ti.com/
have been satisfied.

v3:
https://lore.kernel.org/r/20250922071222.2814937-1-s-vadapalli@ti.com/
Changes since v3:
- Rebased series on 6.18-rc1 tag of Mainline Linux.
- Patch 4 has been updated to remove the '__init' keyword from functions
  to avoid triggering an exception due to '__init' memory being freed
  before functions are invoked. This is the equivalent of:
  https://lore.kernel.org/r/20250912100802.3136121-3-s-vadapalli@ti.com/
  while addressing Bjorn's feedback at:
  https://lore.kernel.org/r/20251002143627.GA267439@bhelgaas/
  by introducing a new 'init' function specifically for registering the
  fault handler while the rest of the driver remains the same.

Series has been tested on AM654-EVM with an NVMe SSD connected to the
PCIe Connector of the EVM. Test Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/332e8d65c66ed93e95c2d89ec1ee3f68

Regards,
Siddharth.

Siddharth Vadapalli (4):
  PCI: Export pci_get_host_bridge_device() for use by pci-keystone
  PCI: dwc: Export dw_pcie_allocate_domains() and
    dw_pcie_ep_raise_msix_irq()
  PCI: keystone: Exit ks_pcie_probe() for invalid mode
  PCI: keystone: Add support to build as a loadable module

 drivers/pci/controller/dwc/Kconfig            |  6 +--
 drivers/pci/controller/dwc/pci-keystone.c     | 38 +++++++++++++------
 .../pci/controller/dwc/pcie-designware-ep.c   |  1 +
 .../pci/controller/dwc/pcie-designware-host.c |  1 +
 drivers/pci/host-bridge.c                     |  1 +
 include/linux/pci.h                           |  1 +
 6 files changed, 33 insertions(+), 15 deletions(-)

-- 
2.51.0


