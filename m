Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE421CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+OIhPT15cRLCNkKMY1zwgni+1n9JXivTyEzbTPisXU=; b=FoZg3FQYDnuMaDZTfCFbPq13dO
	SC8Tx13hM6ELFo16CTT4c0KQq6Q2Xfx55R6h90/BGBeMCT+gMMANENEZtixXkcUb+3A5V356BerVC
	DG8ZV/BrWTQelZ7mhPHq46N9qLLkUlSCLQ1/hj7wxqdC04meg+u/1cfmQ7g5c0/CUIF0H5kgDm8R0
	F/MYN0yA/+mHwMBw0Ex4HcNviiSi+O7LW1nBnqXjDYKJizQJoITPdUGFV+krEHYfBM0kT8VwZ2xWK
	RBvzKrTWE88RV3eo4ZODOonHRNWpnertKYnDDBJH5ZRu0AGxmhynpbzl2nGVJOfkBxLkoHlHAR6RQ
	CIMpll/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomr-00000006lyd-3Fk5;
	Wed, 03 Sep 2025 14:48:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmmd-00000006QFb-1Xfl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R+OIhPT15cRLCNkKMY1zwgni+1n9JXivTyEzbTPisXU=; b=j5APxs9d1R7JNWgFSfjgGtXVre
	mizQZQPdTsVJRgovGuNWKsTzbRmqQqsWSyHpVAxdoe/aAGWlyHzMlS4jQ4i4JcQEB+TLzgieCoNy6
	QQb3lgb8mKUVEwOUDWgx9pjBAxnPJlqzjPkKCGckaiLqgckK5ZDQbuy/EhlGQX5h0b8nkma2f/ZAG
	oX6GupfEodkkk+xu/TMln2+lndJ6KctkhgiYldKYI3nvznHy99NW6K9EMlDdYZ1vX14gZQw3DULGv
	6YQUSckgatlQsFXcZY6yOWsoxrNeagt/NqZ8fQwEb/6x7lqekI3Hih7W20+XPDxOENr8oYOyJ6+G0
	zjdbkA4A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56278 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1utmmZ-000000000XR-0BSS;
	Wed, 03 Sep 2025 13:40:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1utmmY-00000001s13-0v5M;
	Wed, 03 Sep 2025 13:40:10 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 11/11] net: stmmac: use STMMAC_CSR_xxx definitions in
 platform glue
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1utmmY-00000001s13-0v5M@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:40:10 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054015_405827_DF09AAB7 
X-CRM114-Status: GOOD (  12.10  )
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

Use the STMMAC_CSR_xxx definitions to initialise plat->clk_csr in the
platform glue drivers to make the integer values meaningful.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 5 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 3fac3945cbfa..d900b93f46ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -566,7 +566,8 @@ static int intel_mac_finish(struct net_device *ndev,
 
 static void common_default_data(struct plat_stmmacenet_data *plat)
 {
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 
@@ -613,7 +614,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->pdev = pdev;
 	plat->phy_addr = -1;
-	plat->clk_csr = 5;
+	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->has_gmac = 0;
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 6fca0fca4892..dd82dc2189e9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -90,7 +90,8 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Get bus_id, this can be overwritten later */
 	plat->bus_id = pci_dev_id(pdev);
 
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index e6a7d0ddac2a..4e3aa611fda8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -21,7 +21,8 @@ struct stmmac_pci_info {
 
 static void common_default_data(struct plat_stmmacenet_data *plat)
 {
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 
@@ -74,7 +75,7 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 {
 	int i;
 
-	plat->clk_csr = 5;
+	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 1;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
-- 
2.47.2


