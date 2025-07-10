Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9915AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnzdwRyowVZtmtyZQQWcXlnGz0oJRi+YmyMH+09sr2c=; b=4hfViDvRKywBF8ZUseQOA+LPcw
	BMdOu3isFe04zUrVeOxD8ftNOjhp5JvEfOw0sjQdaJ4mIvqla3fbIZYrlHVl+a75YSRD6XH0PAYVH
	JY3euGAAxlWfco/S8MmarJgRVj96iRlNM1CQZnnxnFkm/hZyAji56AzRjp8COSlSqcXXgobKhkhuJ
	vYpjP/w9DNJITHbf3kD45FZzBeQIpgtXHh293EUE4jhdKSXqDPhZUUfNmBtMo5K5lGhmhCoI4hGQY
	xOmwlJfMAi23+O0mTdtu4jEciqFVxab21Pf5bTG3TmPQBmx8i6UHEHKNDjNrvccaTKP6QZ0iB+GBc
	ga0aFYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr9R-0000000Btyn-17lL;
	Thu, 10 Jul 2025 13:17:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpdj-0000000Bf35-3zmM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11801A53C36;
	Thu, 10 Jul 2025 11:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF30BC4CEE3;
	Thu, 10 Jul 2025 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752147633;
	bh=1RsuIHRRAuqcGHCQF+P/OS8tKhDFc+7jVpMSz2Nnvvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwbafXNwxIffsI5cFE+wVdo3GwQzgD9et58i9iA2Vhcrd3NamfBHDIsmyd8vhOn3/
	 OKbc+3lMPdFOQz0+WHd3/rGT0eVDw1o6yAf0POqKsQq3WU78mY3N/3/PLEoIUpeHo5
	 gIgReOW9YRwWW/beO4KmTdcOwixMvtzRsdfdtsu4mocg7q0eniBRLs0VsZAiYvo40A
	 vHoP8yYegdn0seT9UVUMTV8IMTOMwAwmgRcE9vVT9D7v2OV+nW70R2D1OeUX9q2w9N
	 v6ceJ8uA1clmxy+gXhMW2NuYJk48/l8YXAXBSzOFKC7B9per0ONphmupfawihauGOz
	 AJ1j7GFoXCyWA==
Date: Thu, 10 Jul 2025 13:40:25 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Frank.Li@nxp.com
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v20 0/9] PCI: EP: Add RC-to-EP doorbell with platform MSI
 controller
Message-ID: <aG-mqWtUu9-CD43U@ryzen>
References: <20250709-ep-msi-v20-0-43d56f9bd54a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-ep-msi-v20-0-43d56f9bd54a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_044036_127689_A7D6B17B 
X-CRM114-Status: GOOD (  20.39  )
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

Hello Frank,

I tested v20 of your series, but unfortunately, it still doesn't work.

When enabling the doorbell, the programming of the inbound iATU fails:

## pci_epf_test_enable_doorbell()
## keeps the BAR size, and BAR type of a BAR that has already been configured,
## but changes the address translation for this BAR to redirect to the GIC ITS
## rather than to the memory allocated by pci_epf_alloc_space()
## (does not free the memory allocated by pci_epf_alloc_space())

[   39.347502] pci_epf_test_enable_doorbell: msg hi: 0x0 msg low: 0xfe670040
[   39.348103] pci_epf_test_enable_doorbell: base: 0xfe670000 off: 0x40
[   39.348658] dw_pcie_ep_inbound_atu index: 1 parent_bus_addr: 0xfe670000 bar: 1 size: 0x100000
[   39.349403] dw_pcie_prog_ep_inbound_atu parent_bus_addr: 0xfe670000 pci->region_align: 0x10000 IS_ALIGNED: 1
[   39.350260] dw_pcie_prog_ep_inbound_atu parent_bus_addr: 0xfe670000 size: 0x100000 IS_ALIGNED: 0
[   39.351028] rockchip-dw-pcie a40000000.pcie-ep: Failed to program IB window

## pci_epf_test_disable_doorbell()
## changes the address translation for this BAR to redirect to the memory
## allocated by pci_epf_alloc_space() (which was never freed when enabling the
## doorbell)

[   39.351656] dw_pcie_ep_inbound_atu index: 1 parent_bus_addr: 0xa2e00000 bar: 1 size: 0x100000
[   39.352401] dw_pcie_prog_ep_inbound_atu parent_bus_addr: 0xa2e00000 pci->region_align: 0x10000 IS_ALIGNED: 1
[   39.353257] dw_pcie_prog_ep_inbound_atu parent_bus_addr: 0xa2e00000 size: 0x100000 IS_ALIGNED: 1


The reason why pci_epf_test_enable_doorbell() fails is because of this check:
https://github.com/torvalds/linux/blob/v6.16-rc5/drivers/pci/controller/dwc/pcie-designware.c#L663

If you want to understand why this very important check is there, it is
because the DWC controller requires that the physical address programmed in
the iATU is aligned to the size of the BAR (BAR_MASK+1), see this commit:
https://github.com/torvalds/linux/commit/129f6af747b2


Applying the following patch on top of your v20 series makes things work as
intended and makes the pcie_ep_doorbell.DOORBELL_TEST selftest pass for me:

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index dfdd25cfc003..7d356b0201ae 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -738,9 +738,9 @@ static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
 	reg->doorbell_bar = cpu_to_le32(bar);
 
 	msg = &epf->db_msg[0].msg;
-	ret = pci_epf_align_inbound_addr(epf, bar, ((u64)msg->address_hi << 32) | msg->address_lo,
+	ret = pci_epf_align_inbound_addr(epf, epf->bar[bar].size,
+					((u64)msg->address_hi << 32) | msg->address_lo,
 					&epf_test->db_bar.phys_addr, &offset);
-
 	if (ret)
 		goto err_doorbell;
 
diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index c21d8e786eb3..b3d4117182e2 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -478,44 +478,36 @@ struct pci_epf *pci_epf_create(const char *name)
 EXPORT_SYMBOL_GPL(pci_epf_create);
 
 /**
- * pci_epf_align_inbound_addr() - Align the given address based on the BAR
- *				 alignment requirement
+ * pci_epf_align_inbound_addr() - Align the given address based on the BAR size
+ *
  * @epf: the EPF device
+ * @bar_size: the current BAR size
  * @addr: inbound address to be aligned
- * @bar: the BAR number corresponding to the given addr
- * @base: base address matching the @bar alignment requirement.
+ * @base: base address matching the @bar_size alignment requirement.
  * @off: offset to be added to the @base address.
  *
- * Helper function to align input 'addr' to base and offset, which match
- * BAR's alignment requirement.
+ * Helper function to align input 'addr' to base and offset, when dynamically
+ * changing a BAR.
  *
  * The pci_epf_alloc_space() function already accounts for alignment. This is
  * primarily intended for use with other memory regions not allocated by
  * pci_epf_alloc_space(), such as peripheral register spaces or the trigger
  * address for a platform MSI controller.
+ *
+ * Since this function is only used when dynamically changing a BAR (i.e. when
+ * calling set_bar() twice, without ever calling clear_bar(), as calling
+ * clear_bar() would clear the BAR's PCI address assigned by the host), this
+ * function must align to the current BAR size, since we are not clearing the
+ * BAR configuration.
  */
-int pci_epf_align_inbound_addr(struct pci_epf *epf, enum pci_barno bar,
-			      u64 addr, dma_addr_t *base, size_t *off)
+int pci_epf_align_inbound_addr(struct pci_epf *epf, size_t bar_size, u64 addr,
+			      dma_addr_t *base, size_t *off)
 {
-	const struct pci_epc_features *epc_features;
-	u64 align;
-
-	if (!base || !off)
+	if (!base || !off || !bar_size)
 		return -EINVAL;
 
-	epc_features = pci_epc_get_features(epf->epc, epf->func_no, epf->vfunc_no);
-	if (!epc_features) {
-		dev_err(&epf->dev, "epc_features not implemented\n");
-		return -EOPNOTSUPP;
-	}
-
-	align = epc_features->align;
-	align = align ? align : 128;
-	if (epc_features->bar[bar].type == BAR_FIXED)
-		align = max(epc_features->bar[bar].fixed_size, align);
-
-	*base = round_down(addr, align);
-	*off = addr & (align - 1);
+	*base = round_down(addr, bar_size);
+	*off = addr & (bar_size - 1);
 
 	return 0;
 }
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 0ca08f0d05d7..bcc8184325d2 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -242,8 +242,8 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
 void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
 			enum pci_epc_interface_type type);
 
-int pci_epf_align_inbound_addr(struct pci_epf *epf, enum pci_barno bar,
-			      u64 addr, dma_addr_t *base, size_t *off);
+int pci_epf_align_inbound_addr(struct pci_epf *epf, size_t bar_size, u64 addr,
+			      dma_addr_t *base, size_t *off);
 int pci_epf_bind(struct pci_epf *epf);
 void pci_epf_unbind(struct pci_epf *epf);
 int pci_epf_add_vepf(struct pci_epf *epf_pf, struct pci_epf *epf_vf);




However, the more I think about it, considering that this alignment requirement
is inherent to the DWC controller (other controllers might not have this
requirement), perhaps pci_epf_align_inbound_addr() should not be a function in
pci-epf-core.c, perhaps this function would be better suited to live in
drivers/pci/controller/dwc/pcie-designware-ep.c ?


Kind regards,
Niklas

