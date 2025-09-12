Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPef8o51W2k/wgNz6zp8GrcjykT9Fj4+FXx9GO2BZNY=; b=iApYqDnKY3oF/0EN0JeqwHSpbx
	1EQlR75iNhahzP3CEhOrL68kpbCPtMYMEV1TATOHnOPuxu/dLMMudIE485lRfgCz0eKlLq161Epti
	cRiNHSS+z86lZRiSf+vIxuPdt/Uk7MsoYDqd5eEp2X8jAiOWduCULITnn7abEBI5n6KQ8JL1uy/iw
	2PjnStwNnOY8RO1Ak3hqy5MngOnHB156HGaHBN+UY3fZg6kUngohtM6va6f0QCll4UrdUg9kkoAv4
	EWqsq7CtIxCdoq5BITaaJLQzox1pc5G9fvSKyKUDbWhOSN6wy2zzqROb3cO0SaYJFxGHibozLTmQc
	GPlFSTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0ho-00000008TND-1kbb;
	Fri, 12 Sep 2025 10:08:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0hn-00000008TLA-2i5y
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 10:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kPef8o51W2k/wgNz6zp8GrcjykT9Fj4+FXx9GO2BZNY=; b=ZzdlZRFXmn+n0+0n0cN42WPQQ/
	wl2vRPBsEPajQcVnnn0hUTUjjzDz/m+4qR1bC3ZKVHVWXEYA4m7zB8NIV+EX2P906EPfKz7apDsai
	YfdsaBeRxw+UFSR2och8v7pu41gErPb3kUhGk/0NBR2FEUCem2B4Z7+ZAZLmRGBMF5CNUzYu87fVR
	Ku3XH0IcLUlb5EDYO7Ac8YyBvnB6eWaKLQYHUjQ41CF7xv1wjUFzG9DXpdsgjA48+MrVJwiBQpU3M
	Zqpyz/f9D0NZwi/BYkWzk6nawdjR6ad0vY9FRMoCoO1ex4PoCIcfTNyTW8CBOmGjE/TeW3ADzR5tW
	8nrVwFiQ==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0hk-00000006KP2-36tH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:08:34 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CA8KRE498901;
	Fri, 12 Sep 2025 05:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757671700;
	bh=kPef8o51W2k/wgNz6zp8GrcjykT9Fj4+FXx9GO2BZNY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SbSFrLLKqTthZH1QyVyAbPGxHokQIBbq0jQjl43q5ZjJfG4kfcLI+hvx8veoIEyvZ
	 cB6U5SLpONKSJyRweOSRZpnQEB99tsf84BRKImLHFxX0z+moJi38hNvclcAphLubjk
	 s42EpueuBvGgJQ80vpc8RbDEYF3j2df9TyWRni5k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CA8KFc1228533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 05:08:20 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 05:08:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 05:08:20 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CA83MI3740807;
	Fri, 12 Sep 2025 05:08:15 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <sergio.paracuellos@gmail.com>,
        <18255117159@163.com>, <jirislaby@kernel.org>, <m-karicheri2@ti.com>,
        <santosh.shilimkar@ti.com>
CC: <stable@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 2/2] PCI: keystone: Remove the __init macro for the ks_pcie_host_init() callback
Date: Fri, 12 Sep 2025 15:37:59 +0530
Message-ID: <20250912100802.3136121-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912100802.3136121-1-s-vadapalli@ti.com>
References: <20250912100802.3136121-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_110833_066438_5637118C 
X-CRM114-Status: GOOD (  16.06  )
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

The ks_pcie_host_init() callback registered by the driver is invoked by
dw_pcie_host_init(). Since the driver probe is not guaranteed to finish
before the kernel initialization phase, the memory associated with
ks_pcie_host_init() may already be freed by free_initmem().

It is observed in practice that the print associated with free_initmem()
which is:
	"Freeing unused kernel memory: ..."
is displayed before the driver is probed, following which an exception is
triggered when ks_pcie_host_init() is invoked which looks like:

	Unable to handle kernel paging request at virtual address ...
	Mem abort info:
	...
	pc : ks_pcie_host_init+0x0/0x540
	lr : dw_pcie_host_init+0x170/0x498
	...
	ks_pcie_host_init+0x0/0x540 (P)
	ks_pcie_probe+0x728/0x84c
	platform_probe+0x5c/0x98
	really_probe+0xbc/0x29c
	__driver_probe_device+0x78/0x12c
	driver_probe_device+0xd8/0x15c
	...

Fix this by removing the "__init" macro associated with the
ks_pcie_host_init() callback and the ks_pcie_init_id() function that it
internally invokes.

Fixes: 0c4ffcfe1fbc ("PCI: keystone: Add TI Keystone PCIe driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 21808a9e5158..c6e082dcb3bc 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -799,7 +799,7 @@ static int ks_pcie_fault(unsigned long addr, unsigned int fsr,
 }
 #endif
 
-static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
+static int ks_pcie_init_id(struct keystone_pcie *ks_pcie)
 {
 	int ret;
 	unsigned int id;
@@ -831,7 +831,7 @@ static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
 	return 0;
 }
 
-static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
+static int ks_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
-- 
2.43.0


