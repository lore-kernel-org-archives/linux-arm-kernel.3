Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76727CF3189
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCSsRQgUhid2ZAy4dbb2n1OSCVDOp4vvBzay6fmrN1s=; b=krufNlz23mDhrQF66sq/ISFFTT
	qCZ1OHdMMTPRDAnLSwAKwBGa6xYYJAiuXHHDg52ZSl7iIahE9508tJWxQMsRAQXah3wEQrpaJ/9uR
	vuJgs8vGxQi+JgqQmIGHNIr6u+NuoiXlQ0TYqR6avnlg5OO3e1aGzQro8TDqHirEsKRv3vvZ/bgJW
	7UA0QbNfZYxmPAzIGjl0xf/pCtJbvr5+FcZ3R3/FiB1C8+sVY7rJ5PAQ53KR0KrdLJv2rkmkF2v77
	EsaXXD+ULcVQ/rCDisRkwbDR69rS1uA+nurX+srzwdvQg5kaq90/Xb0TJlA1bETdxL9IrA+zg7IEI
	67roH0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfLn-00000002xV2-2zVw;
	Wed, 19 Nov 2025 10:23:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfLk-00000002xRw-3vWs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qCSsRQgUhid2ZAy4dbb2n1OSCVDOp4vvBzay6fmrN1s=; b=THEMqB3ciS8GBTu+ZtI3lXsfRy
	YPaEpYCwjdS0tmeEXR/MC/8h7/6Wj0TIoSbwqXoI/irNONSpN9+VPmjutBZ6CnfIzh9rwKLsJcNEe
	jmDw1IgWdNOTc2Tp6cyFRPbRw8wa/pu/mjlXuPkz7TQIK97AYpZRKe8pYnV/Q1d6xm8MgzxiIbEzf
	MjyQSbFgdXe32dkZugHKw4b7CcEc2RrRhb9vf+yvh3qrWt1zDPp5HPTU1s1r5HjJwVbiP86v4nNjK
	aUnldW+Kyq2ZpUu382Y8xRy5PU6ClqO2tszVfmQ8YREMC/Fk4/0tT4sa7S9RrwB+HPD6OYENlw9dZ
	8dG/TtGA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39224 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLfLc-000000004Vj-13IA;
	Wed, 19 Nov 2025 10:23:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLfLb-0000000FMb7-1SgG;
	Wed, 19 Nov 2025 10:23:35 +0000
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 5/6] net: stmmac: move stmmac_axi_blen_to_mask() to
 axi_blen init sites
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLfLb-0000000FMb7-1SgG@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:23:35 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022344_976553_95C8FE2B 
X-CRM114-Status: GOOD (  13.78  )
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

Move stmmac_axi_blen_to_mask() to the axi->axi_blen array init sites
to prepare for the removal of axi_blen. For sites which initialise
axi->axi_blen with constant data, initialise axi->axi_blen_regval
using the DMA_AXI_BLENx constants.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 3 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c       | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 7 ++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c        | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 1 +
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index e6d5893c5905..bd06f26a27b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -88,6 +88,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 		if (burst_map & (1 << bit_index))
 			plat_dat->axi->axi_blen[a_index++] = 4 << bit_index;
 
+	stmmac_axi_blen_to_mask(&plat_dat->axi->axi_blen_regval,
+				plat_dat->axi->axi_blen, a_index);
+
 	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	plat_dat->dma_cfg->aal = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 8938e7a59925..e94605d3d185 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -650,6 +650,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->axi->axi_xit_frm = 0;
 	plat->axi->axi_wr_osr_lmt = 1;
 	plat->axi->axi_rd_osr_lmt = 1;
+	plat->axi->axi_blen_regval = DMA_AXI_BLEN4 | DMA_AXI_BLEN8 |
+				     DMA_AXI_BLEN16;
 	plat->axi->axi_blen[0] = 4;
 	plat->axi->axi_blen[1] = 8;
 	plat->axi->axi_blen[2] = 16;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 99a7d4c463d9..b8a2f450433b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -225,6 +225,7 @@ void stmmac_axi_blen_to_mask(u32 *regval, const u32 *blen, size_t len)
 
 	*regval = FIELD_PREP(DMA_AXI_BLEN_MASK, val);
 }
+EXPORT_SYMBOL_GPL(stmmac_axi_blen_to_mask);
 
 /**
  * stmmac_verify_args - verify the driver parameters.
@@ -3212,12 +3213,8 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	/* DMA Configuration */
 	stmmac_dma_init(priv, priv->ioaddr, priv->plat->dma_cfg);
 
-	if (priv->plat->axi) {
-		/* Encode the AXI burst length to a register value */
-		stmmac_axi_blen_to_mask(&priv->plat->axi->axi_blen_regval,
-					priv->plat->axi->axi_blen, AXI_BLEN);
+	if (priv->plat->axi)
 		stmmac_axi(priv, priv->ioaddr, priv->plat->axi);
-	}
 
 	/* DMA CSR Channel configuration */
 	for (chan = 0; chan < dma_csr_ch; chan++) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 2fd4660838bb..e1036150fae2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -92,6 +92,8 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	plat->axi->axi_rd_osr_lmt = 31;
 
 	plat->axi->axi_fb = false;
+	plat->axi->axi_blen_regval = DMA_AXI_BLEN4 | DMA_AXI_BLEN8 |
+				     DMA_AXI_BLEN16 | DMA_AXI_BLEN32;
 	plat->axi->axi_blen[0] = 4;
 	plat->axi->axi_blen[1] = 8;
 	plat->axi->axi_blen[2] = 16;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 9015b7f80d1b..656d4adedabe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -118,6 +118,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 	if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt))
 		axi->axi_rd_osr_lmt = 1;
 	of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
+	stmmac_axi_blen_to_mask(&axi->axi_blen_regval, axi->axi_blen, AXI_BLEN);
 	of_node_put(np);
 
 	return axi;
-- 
2.47.3


