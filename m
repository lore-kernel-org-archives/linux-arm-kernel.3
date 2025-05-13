Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8ABC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxHlkyFU6KubRRbufa69plkTpsDyW2/XgTkIcdCkg1s=; b=1xDk4TtRrSMQ5siu1A0PxqZu2r
	sATnlQ1xGrfBKfshtac0ZKoLPdUzDxA4Va27c/EYsRl3AFwyYdQrZRlUGWSELUlOBCrk+5m/5Ugh4
	K0LMUC6XEgv1e0VBIQVLaL8e5HzfHHYhHn23ksjiJjua285FiL2THfZhI9zG1s/RREfPmHI4fylNs
	RfrtFUm2eg60lTASA9V+jpE6P4VBE4IHLA8Sh0V8MGQ6JVsXnNgt5mN9PHzXlG1r45/APBkq118SF
	PzhP/vjAS0Dfj4piwsqoVb4NBBlbW0v3lpm6YurMeEoNew/VfSYh2zL2LfLvOHh1nbWHuVzUNcN5h
	NNZEJHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkCU-0000000BdVu-0xSS;
	Tue, 13 May 2025 07:37:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEk6p-0000000Bcfx-0HeF;
	Tue, 13 May 2025 07:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D3E2A4156E;
	Tue, 13 May 2025 07:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA73C4CEF4;
	Tue, 13 May 2025 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747121486;
	bh=Mr8v9IUnipI8w73TdENPISeGwgI9GWQzAmYU1E5kJaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mPT2T2/kfKfcU/0UK+eUEuYh3Xt5Ee0vLjOFrGSO89vfjmKI/cEkq/55DfvXgiF0s
	 O3l3GCpon1yUl1ZZRVLcuG7J06iURkPvvhLhvBeYo5TxrSduXH/7QnfDKP9y/43+RV
	 JUSva1ru2fAG/3V5eRHmSC4AdSBaWZV0+uTJ6Jz96el3xe3eoaiQ8vHgzP1KbbvQHa
	 RjxIB2TWbaSmJgG9lLS4BZjnz79boxgIQ3D/09DlWuKCM5opGg7n5ys9G7Bwt5Xp+1
	 LQa89ZdtYrvwk+RB/6a3qpXY79RkDv7O3llfXcuJur8sP2HBQhcjefnwcwR208SfLe
	 8qaqoFfDMLNHw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	stable+noautosel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/6] PCI: endpoint: cleanup set_msi() callback
Date: Tue, 13 May 2025 09:30:59 +0200
Message-ID: <20250513073055.169486-12-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513073055.169486-8-cassel@kernel.org>
References: <20250513073055.169486-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5791; i=cassel@kernel.org; h=from:subject; bh=Mr8v9IUnipI8w73TdENPISeGwgI9GWQzAmYU1E5kJaw=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKUvhpWHFoVkbG+THTm95f/ePwv1fH1mu/4Nmd3JkPA/ PolmjY/O0pZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRDf8Z/qcqq1YIadgrsvru keOd1ydtnGAXZHr2XHfXwhWvnOKUFjAyfFWMWvxoutRsQd2GxSvO32Kb4ib5pDxryeRbUW//C3I ZMwEA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_003127_238090_5D29FDB5 
X-CRM114-Status: GOOD (  14.51  )
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

The kdoc for pci_epc_set_msi() says:
"Invoke to set the required number of MSI interrupts."
the kdoc for the callback pci_epc_ops->set_msi() says:
"ops to set the requested number of MSI interrupts in the MSI capability
register"

pci_epc_ops->set_msi() does however expect the parameter 'interrupts' to
be in the encoding as defined by the MMC Multiple Message Capable field.

Nowhere in the kdoc does it say that the number of interrupts should be
in MMC encoding.

Thus, it is very confusing that the wrapper function (pci_epc_set_msi())
and the callback function (pci_epc_ops->set_msi()) both take a parameter
named interrupts, but they both expect completely different encodings.

Cleanup the API so that the wrapper function and the callback function
will have the same semantics.

Cc: <stable+noautosel@kernel.org> # this is simply a cleanup
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/cadence/pcie-cadence-ep.c | 4 +++-
 drivers/pci/controller/dwc/pcie-designware-ep.c  | 3 ++-
 drivers/pci/controller/pcie-rcar-ep.c            | 3 ++-
 drivers/pci/controller/pcie-rockchip-ep.c        | 5 +++--
 drivers/pci/endpoint/pci-epc-core.c              | 5 +----
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 78b4d009cd04..f307256826e6 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -220,10 +220,12 @@ static void cdns_pcie_ep_unmap_addr(struct pci_epc *epc, u8 fn, u8 vfn,
 	clear_bit(r, &ep->ob_region_map);
 }
 
-static int cdns_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn, u8 mmc)
+static int cdns_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
+				u8 interrupts)
 {
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
 	struct cdns_pcie *pcie = &ep->pcie;
+	u8 mmc = order_base_2(interrupts);
 	u32 cap = CDNS_PCIE_EP_FUNC_MSI_CAP_OFFSET;
 	u16 flags;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 03597551f4cd..e7a916bf6b2c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -541,6 +541,7 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dw_pcie_ep_func *ep_func;
+	u8 mmc = order_base_2(interrupts);
 	u32 val, reg;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
@@ -550,7 +551,7 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
 	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	val &= ~PCI_MSI_FLAGS_QMASK;
-	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
+	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, mmc);
 	dw_pcie_dbi_ro_wr_en(pci);
 	dw_pcie_ep_writew_dbi(ep, func_no, reg, val);
 	dw_pcie_dbi_ro_wr_dis(pci);
diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
index 9da39a4617b6..b25ad23bedb7 100644
--- a/drivers/pci/controller/pcie-rcar-ep.c
+++ b/drivers/pci/controller/pcie-rcar-ep.c
@@ -261,10 +261,11 @@ static int rcar_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
 {
 	struct rcar_pcie_endpoint *ep = epc_get_drvdata(epc);
 	struct rcar_pcie *pcie = &ep->pcie;
+	u8 mmc = order_base_2(interrupts);
 	u32 flags;
 
 	flags = rcar_pci_read_reg(pcie, MSICAP(fn));
-	flags |= interrupts << MSICAP0_MMESCAP_OFFSET;
+	flags |= mmc << MSICAP0_MMESCAP_OFFSET;
 	rcar_pci_write_reg(pcie, flags, MSICAP(fn));
 
 	return 0;
diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 85ca7d9b4c77..2fb50a35146c 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -308,10 +308,11 @@ static void rockchip_pcie_ep_unmap_addr(struct pci_epc *epc, u8 fn, u8 vfn,
 }
 
 static int rockchip_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
-				    u8 multi_msg_cap)
+				    u8 interrupts)
 {
 	struct rockchip_pcie_ep *ep = epc_get_drvdata(epc);
 	struct rockchip_pcie *rockchip = &ep->rockchip;
+	u8 mmc = order_base_2(interrupts);
 	u32 flags;
 
 	flags = rockchip_pcie_read(rockchip,
@@ -319,7 +320,7 @@ static int rockchip_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
 				   ROCKCHIP_PCIE_EP_MSI_CTRL_REG);
 	flags &= ~ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_MASK;
 	flags |=
-	   (multi_msg_cap << ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_OFFSET) |
+	   (mmc << ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_OFFSET) |
 	   (PCI_MSI_FLAGS_64BIT << ROCKCHIP_PCIE_EP_MSI_FLAGS_OFFSET);
 	flags &= ~ROCKCHIP_PCIE_EP_MSI_CTRL_MASK_MSI_CAP;
 	rockchip_pcie_write(rockchip, flags,
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index cc1456bd188e..cc012373293a 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -309,7 +309,6 @@ EXPORT_SYMBOL_GPL(pci_epc_get_msi);
 int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no, u8 interrupts)
 {
 	int ret;
-	u8 encode_int;
 
 	if (!pci_epc_function_is_valid(epc, func_no, vfunc_no))
 		return -EINVAL;
@@ -320,10 +319,8 @@ int pci_epc_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no, u8 interrupts)
 	if (!epc->ops->set_msi)
 		return 0;
 
-	encode_int = order_base_2(interrupts);
-
 	mutex_lock(&epc->lock);
-	ret = epc->ops->set_msi(epc, func_no, vfunc_no, encode_int);
+	ret = epc->ops->set_msi(epc, func_no, vfunc_no, interrupts);
 	mutex_unlock(&epc->lock);
 
 	return ret;
-- 
2.49.0


