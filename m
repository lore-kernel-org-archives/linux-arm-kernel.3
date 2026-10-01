Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18C9CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gl19LhtWLKjfcWFniW5fiNkolXSpsFJsnrsmyFVH1q0=; b=2CYlZjNdZk0+jL7u1kXJEcYDI1
	l2aGye9Bpb2dKgnu64TnWQUXKB7hxRzSddScLsECG2rB/Ym9yY896D2Hf78mr+Ez7+ZUo7L1TjTwR
	d5nTHUdV6rdvMQilesVmxdaSalcq8Odjcdf0OzWXTADFdkWBq2Hsd0QrrNaOLOO/b0dFPm2bbwNGs
	weBZktVhfqnKze1FD3CMgfj98nvxA1i3iTltNGgVOdBahvSH32KlKZ/y5YAuRmE0ytc4ebC9//Oyh
	IWj0tXSQrC2RK8zOIBn6mxYMvyQ5+rPNu4CKiouqHZeV1zirJXw1Re73tezo4M8g0dhfTM09seXqh
	TuDEHDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCImy-00000009XSX-2Otk;
	Thu, 01 Oct 2026 15:33:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCImw-00000009XS2-01vw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:33:39 +0000
Received: from jeffbarnes-ThinkPad-P14s-Gen-2i.corp.microsoft.com (unknown [52.167.112.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id E37D820B7168;
	Thu,  1 Oct 2026 08:32:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E37D820B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790868763;
	bh=Gl19LhtWLKjfcWFniW5fiNkolXSpsFJsnrsmyFVH1q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZ/hamC8umn0spRY/J9y8JezNfPCWT31hurpmlA7bpJhXsB7rbEtlOczIJ9IgD5ki
	 DQUFZKgNroCLsA4WmmLh72Pahbh2xOp5hYRpsBSEzyBn678LaUGN6qOlSNWu5hDGQ3
	 tiMpxWpqtJFgt/naaUNw8msDURvZcdOGerzo/ekw=
From: Jeff Barnes <jeffbarnes@linux.microsoft.com>
To: linux-pci@vger.kernel.org
Cc: Frank.li@oss.nxp.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	Zhiqiang.Hou@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Revert "PCI: layerscape: Change default error response behavior"
Date: Thu,  1 Oct 2026 11:33:23 -0400
Message-ID: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0FEA6868-5A7C-4955-9FBB-BE9A1AE8D3F7@getmailspring.com>
References: <0FEA6868-5A7C-4955-9FBB-BE9A1AE8D3F7@getmailspring.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_083338_076885_64691B8E 
X-CRM114-Status: GOOD (  13.48  )
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

This reverts commit 84d897d69938
("PCI: layerscape: Change default error response behavior").

The Layerscape PCIe driver programs the DesignWare
AMBA_ERROR_RESPONSE_DEFAULT register at offset 0x8d0 with 0x9401.

For AXI, the documented default with AMBA_ERROR_RESPONSE_GLOBAL cleared
returns OKAY with all-ones data for errors on non-posted requests.
Setting AMBA_ERROR_RESPONSE_GLOBAL causes an AXI error response instead,
with AMBA_ERROR_RESPONSE_MAP selecting SLVERR or DECERR for individual
PCIe completion errors.

The value 0x9401 sets AMBA_ERROR_RESPONSE_GLOBAL and maps Unsupported
Request, Completer Abort, and Completion Timeout to SLVERR.

A PCI configuration access can race with the link going down after
dw_pcie_other_conf_map_bus() checks the link but before
pci_generic_config_read() performs the MMIO access. If the transaction
results in a Completion Timeout, the Layerscape error response setting
propagates it to AXI as SLVERR, resulting in an asynchronous SError and
kernel panic.

Reproduce the race by obtaining the configuration-space mapping while
the link is up, then disabling the link from another CPU immediately
before performing the MMIO configuration read.

With the error response override enabled, the overlapping configuration
read results in an asynchronous SError and kernel panic. With the
DesignWare default behavior restored, the same test returns 0xffffffff.
AER reports a non-fatal Completion Timeout, and no SError or kernel
panic occurs.

Restore the documented DesignWare default error response behavior so a
failed non-posted PCIe transaction does not become a fatal AXI error.

Fixes: 84d897d69938 ("PCI: layerscape: Change default error response behavior")
Cc: stable@vger.kernel.org
Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>

Changes in v2:
- Change the subject to identify this as a revert, as requested by
  Frank Li.
- Document the DesignWare AMBA_ERROR_RESPONSE_DEFAULT behavior and
  decode the 0x9401 setting used by Layerscape.
- Clarify that the setting propagates Completion Timeout as AXI SLVERR
  rather than causing the underlying PCIe transaction failure.

---
 drivers/pci/controller/dwc/pci-layerscape.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 14d6ac4fc53f..d333f1ae8a41 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -28,8 +28,6 @@
 
 /* PEX Internal Configuration Registers */
 #define PCIE_STRFMR1		0x71c /* Symbol Timer & Filter Mask Register1 */
-#define PCIE_ABSERR		0x8d0 /* Bridge Slave Error Response Register */
-#define PCIE_ABSERR_SETTING	0x9401 /* Forward error of non-posted request */
 
 /* PF Message Command Register */
 #define LS_PCIE_PF_MCR		0x2c
@@ -103,14 +101,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie)
 	iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
 }
 
-/* Forward error response of outbound non-posted requests */
-static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
-{
-	struct dw_pcie *pci = pcie->pci;
-
-	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
-}
-
 static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
 {
 	if (pcie->big_endian)
@@ -180,8 +170,6 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct ls_pcie *pcie = to_ls_pcie(pci);
 
-	ls_pcie_fix_error_response(pcie);
-
 	dw_pcie_dbi_ro_wr_en(pci);
 	ls_pcie_clear_multifunction(pcie);
 	dw_pcie_dbi_ro_wr_dis(pci);
-- 
2.43.0


