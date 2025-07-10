Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14857C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Evt03dRyTY5EcV8gwRAuA9YXk4z16O4OO0q/fPScZM=; b=rwEhi8y0g94XxNpWIbi8VZq5WQ
	Qv+/04tbhThfvVWQcoAnBTAa+S1FuUorRxnmbrCGmUJXNTbDZmnoPDW89Y4cCT1fbXYYi/gu7vCgW
	stn7sgmlHbSdizKymO2tIzO/rCqDDwvmh1GyX/2qWJfvSSWPLIYmpUXUq1y4DPalcBxJ/CPoURqC3
	Q6lJ4Uvqjjq08InWnz8MQnGXlyj6OLzMzxm2Kt6xCla5bXoLPMidRQSmeT2Ip8yEH666z/cPWtpeS
	YYagRiy8Z4hgVPCFAXADsvCmbNDrLMIFpM4o75WK9mSENaA6oCEzfw1FIKSSYjFgD+kMbnhJZddvp
	uGZVO9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyiR-0000000D3T4-0M39;
	Thu, 10 Jul 2025 21:22:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwiV-0000000Cn2o-2GEX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 19:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C72C1470AE;
	Thu, 10 Jul 2025 19:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24A82C2BCB6;
	Thu, 10 Jul 2025 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752174838;
	bh=HU6ZKi+uSDs3PydEoJ74Aj3O4Kf3sl4dWHMWujWPI6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dIN9j1ur9o34Fggh50RDPATtgMusqVjjT4pLPQTLQiruSpIVOsYZ90nXY/V7VF0h7
	 Jc85Gji8bSV6qOnf+B2OG+gokV/4ESnzkrr0gmc6qSiK/+DGGVC8et4iK2bFHQWnRL
	 B4/c84xt/PNViEzk4KEVyRsaceG9jaBAcc4DN66r/UxaKm79o2WKlq71Yn6L03ZHQJ
	 2tHP/mcd+xJQ7COizxErC/3TGGMoYX4oq/71GYMYBuCiF7BTTMetUS0NkZOhvqOrfo
	 ONcVYsKGNX5ofwf6GhrIzA/xhJfm0ZZE9tDWKADK0FqRh+pjgiprRqFjgzzcL8yJrE
	 uLBhQtSdMuYLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171A5C83F22;
	Thu, 10 Jul 2025 19:13:58 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 10 Jul 2025 15:13:51 -0400
Subject: [PATCH v21 5/9] PCI: endpoint: Add pci_epf_align_inbound_addr()
 helper for address alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-ep-msi-v21-5-57683fc7fb25@nxp.com>
References: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
In-Reply-To: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752174836; l=4465;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eJY/O6s4mvGH2YiCbt2NqyZL0ADWa6DzNB6o60H9qvk=;
 b=KCrszxk0CYMML509QFJVQjkBnkOxkEjuqrSEzy1aSwTV75sp1AYyEsGHlVe2kqcc5VRurkDIJ
 laxSTjBVCMlBMtxa2UQ7mT49UQ7gnH+Dk8g0/9bB/2wMT5LpfNurnUC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_121359_665620_B3A3257C 
X-CRM114-Status: GOOD (  18.49  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Introduce the helper function pci_epf_align_inbound_addr() to adjust
addresses according to PCI BAR alignment requirements, converting addresses
into base and offset values.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v21
- align to bar size

Changes in V20
- update function kdoc comments.
- 128 come from pci_epf_alloc_space() drivers/pci/endpoint/pci-epf-core.c

Change from v15 to v16
- none

Change from v14 to v15
- change out address type to dma_addr_t to fix below build issue

| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082311.G1hWGggF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-test.c: In function 'pci_epf_test_enable_doorbell':
>> drivers/pci/endpoint/functions/pci-epf-test.c:726:42: error: passing argument 4 of 'pci_epf_align_inbound_addr' from incompatible pointer type [-Werror=incompatible-pointer-types]
     726 |                                          &epf_test->db_bar.phys_addr, &offset);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          dma_addr_t * {aka unsigned int *}
   In file included from include/linux/pci-epc.h:12,

Change form v9 to v14
- none

change from v8 to v9
- pci_epf_align_inbound_addr(), base and off must be not NULL
- rm pci_epf_align_inbound_addr_lo_hi()

change from v7 to v8
- change name to pci_epf_align_inbound_addr()
- update comment said only need for memory, which not allocated by
pci_epf_alloc_space().

change from v6 to v7
- new patch
---
 drivers/pci/endpoint/pci-epf-core.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pci-epf.h             |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index 577a9e490115c9dd5d7fb624c4a3001f39b97e78..2947ca52edbe8834f09313249ad3871bc7a462b1 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -477,6 +477,42 @@ struct pci_epf *pci_epf_create(const char *name)
 }
 EXPORT_SYMBOL_GPL(pci_epf_create);
 
+/**
+ * pci_epf_align_inbound_addr() - Align the given address based on the BAR
+ *				  alignment requirement
+ * @epf: the EPF device
+ * @addr: inbound address to be aligned
+ * @bar: the BAR number corresponding to the given addr
+ * @base: base address matching the @bar alignment requirement.
+ * @off: offset to be added to the @base address.
+ *
+ * Helper function to align input 'addr' to base and offset, which match
+ * BAR's alignment requirement.
+ *
+ * The pci_epf_alloc_space() function already accounts for alignment. This is
+ * primarily intended for use with other memory regions not allocated by
+ * pci_epf_alloc_space(), such as peripheral register spaces or the trigger
+ * address for a platform MSI controller.
+ */
+int pci_epf_align_inbound_addr(struct pci_epf *epf, enum pci_barno bar,
+			       u64 addr, dma_addr_t *base, size_t *off)
+{
+	/*
+	 * Most EP controllers require the BAR start address to be aligned to
+	 * the BAR size, because they mask off the lower bits.
+	 *
+	 * Alignment to BAR size also works for controllers that support
+	 * unaligned addresses.
+	 */
+	u64 align = epf->bar[bar].size;
+
+	*base = round_down(addr, align);
+	*off = addr & (align - 1);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_epf_align_inbound_addr);
+
 static void pci_epf_dev_release(struct device *dev)
 {
 	struct pci_epf *epf = to_pci_epf(dev);
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index a3b1a1d90d18356e8cda966c7004c3be93962a0d..0ca08f0d05d7439ef4043a77c204062989a27bd9 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -241,6 +241,9 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
 			  enum pci_epc_interface_type type);
 void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
 			enum pci_epc_interface_type type);
+
+int pci_epf_align_inbound_addr(struct pci_epf *epf, enum pci_barno bar,
+			       u64 addr, dma_addr_t *base, size_t *off);
 int pci_epf_bind(struct pci_epf *epf);
 void pci_epf_unbind(struct pci_epf *epf);
 int pci_epf_add_vepf(struct pci_epf *epf_pf, struct pci_epf *epf_vf);

-- 
2.34.1



