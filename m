Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF047C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qMIXcNMzblzp9RIwLXwsUxv9/cysEMvIvuAUsNL+zQ=; b=BDA5ssdYrVbqyfid6i5IhW1EG8
	ybLz4xnhgp+K/GbDPpxLPJ7cTZs0WK/M+PN3dDVCuOVPB4fQSFl8V+V+UhQcccHnubBQ4ROD94TmE
	NSbZiVKUWWWoW8wA3asmzLJn5d4xWSOKpI4NMtOXy6bx1COuUdiRryha4U4rXRvh7sFZLBR6g/LPW
	+WKgVfk0MkllqaiyGsZJ4dJCp1iT2IPhWxXg7VNgWeUmS30R9LqKgnK78JOwY3J91P+viCskJn7YY
	FFpMUZHli5TadETaNeCVOzlyf36H2tNG8ewRWJ5MV9pqu2elMKp6ePd2GjY0hoPIhyKYu3zsoAhSc
	NkUkeiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VzS-0000000FdWn-1ih5;
	Sat, 12 Apr 2025 08:13:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VvT-0000000FdDh-3axq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 08:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9qMIXcNMzblzp9RIwLXwsUxv9/cysEMvIvuAUsNL+zQ=; b=g2fL0SiJm1hmi1VzInrX3ZYfMq
	uuYlNlRB+f7yCCkY3QMlKa9fYEPqgCpzZXCyIYChVXHRcOANErQJbGwbMXP+288je+oc/oT7Ldyyg
	NYdv6TsaGWNeJa+EeSIu6lSswNPbfKbDCZDfpQpd2IAWFFxYm8Y9/A9NWeoNuiXMhxefzYWt5OSLY
	+gZbXpgOkuh3/cKVaiQLbfOmy2uvkFbJ1z6nWwtWeTs1pha+WCQWOky9qPgJS6151JkpFGaXx1DYB
	WTNmrEFxMJ4Ac/YOf57/EkPMFPfaI1ox0ELGIQgl4RVmHPQZy16jvrfGNkjBo4NHxPtY9YqdkbL/D
	7BUmxJmQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42084 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3VvM-0004M4-1G;
	Sat, 12 Apr 2025 09:09:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3Vul-000E7m-1j; Sat, 12 Apr 2025 09:08:35 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 2/5] net: stmmac: intel: remove eee_usecs_rate and
 hardware write
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3Vul-000E7m-1j@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:35 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_010919_895370_5C9FF40A 
X-CRM114-Status: GOOD (  11.51  )
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

Remove the write to GMAC_1US_TIC_COUNTER for two reasons:

1. during initialisation or reinitialisation of the DWMAC core, the
   core is reset, which sets this register back to its default value.
   Writing it prior to stmmac_dvr_probe() has no effect.

2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
   MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
   this register based on the rate of plat->stmmac_clk. This clock
   is created by the same code which initialises plat->eee_usecs_rate,
   which is also created to run at this same rate. Since Marek's
   commit, this will set this register appropriately using the
   rate of this clock.

Therefore, dwmac-intel.c writing GMAC_1US_TIC_COUNTER serves no
useful purpose and can be removed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index c8bb9265bbb4..54db5b778304 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -682,7 +682,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->axi->axi_blen[2] = 16;
 
 	plat->ptp_max_adj = plat->clk_ptp_rate;
-	plat->eee_usecs_rate = plat->clk_ptp_rate;
 
 	/* Set system clock */
 	sprintf(clk_name, "%s-%s", "stmmac", pci_name(pdev));
@@ -1313,13 +1312,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
 
-	if (plat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
-	}
-
 	ret = stmmac_config_multi_msi(pdev, plat, &res);
 	if (ret) {
 		ret = stmmac_config_single_msi(pdev, plat, &res);
-- 
2.30.2


