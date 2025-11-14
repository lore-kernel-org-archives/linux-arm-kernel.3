Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37160CE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Twus3sbrBSG7NY/CIFTfFSuDbIZ0IfgbuuTAgR3/MuY=; b=FK8hnKJE/FCHFLr2OiO0RXu9Oe
	Uim+vJ3nlMJcolclkIF6S0ENGCaU/NoR5S3EDNYK6qo/CyLshnMLdrTqdJ/MAb9kPnZ9s+81mXLz9
	C0tOgWWQvJbDBmH8PWb5kO8QqqCKzMYHsgmxr5KDOWQMRd3Ng0dC799R9F5Ft5Kt/FCzjBPNe93Pt
	+3NTzj6Fnci0DHZh4c9+U0lA1z0sRniLM7cvpsBHezejK4FzBOS9pkWqriGVZnaYoC57rnxnxFrVT
	LCxkKu2wd8tWVdsUHF6qP4fb0ws8exfmUxMBgxgGCKT3kJRXEPM1KnJM1tlR9jLRJ8hlEDBqMHFKP
	ZaBc1gTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjF-0000000CYjA-0bOe;
	Fri, 14 Nov 2025 15:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjB-0000000CYh6-2nKD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Twus3sbrBSG7NY/CIFTfFSuDbIZ0IfgbuuTAgR3/MuY=; b=i+3xtdj8WZkjvE1VKLNQNjySB6
	v/PxNg1x+54M42iEeh6Xs0iQsUhj5nhoZ13k/a+1KS9vY1Im56TUKy/jaDEBNDJATFmiSvYBuImc3
	4/7Q9jQgVGmEBdsW6b3whuKK2fmOTy73Xo+jllUzCcWhMKPzoP31GB7weRbF37sKkxlgiPg06BRrV
	jtSM0223hobIqGZfPQtxesJcKDxuCKYW4mL+pyPl9EbYlH7IrOhUPuiL7cSI22TXaoVx5LzwerDfU
	/2sj8ymI8D4ULJdltxOydGNDGNzYh9Ttjt1wcz9Q0ugAgztHdxDmTLWDoeaPDN+AG35eMmqj1vEiF
	F6OsL+Cg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJurT-00000002pAD-0LgM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Twus3sbrBSG7NY/CIFTfFSuDbIZ0IfgbuuTAgR3/MuY=; b=f+2PkKjcyy0ZBt+PQ+qC5DuZpm
	LR6aELWhmN121eH9u1WrcaH/3M/jFdUpLigQfEJ8XMHbBrHs1c/NNqiMx78+jEiZk9G0Dgx69YWNz
	VAKW/s9wYIBiHm6YHuQNgzWcBEXYy9+Qy6dFZnF4NQuAnfqOP6D8PZMBCcTfq7QNd69KuGiGBIdNa
	FEMulAkxlJMI85h+oDOmTp3TGH8z6maWTvKgp3IeFMDvYpdbDkypgZWn0pAlea+4zg2GwL3jYc/ty
	08MsZ6zwcnhZIoVoAG312whj+SsMjKxfrP7JeAb505AI2lJLJSvCtXy2FpZwBxqv7BMsEBNNk0ctj
	aM0DcADA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36184 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJvj1-0000000076b-2knP;
	Fri, 14 Nov 2025 15:28:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJvj0-0000000EVjb-1jDh;
	Fri, 14 Nov 2025 15:28:34 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen Wang <unicorn_wang@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	sophgo@lists.linux.dev
Subject: [PATCH net-next 03/11] net: stmmac: move initialisation of clk_csr to
 stmmac_plat_dat_alloc()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJvj0-0000000EVjb-1jDh@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143316_238402_5E8AAAF0 
X-CRM114-Status: GOOD (  10.67  )
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

Move the default initialisation of plat_dat->clk_csr to
stmmac_plat_dat_alloc().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1851f7d0702d..a36e8a90fcaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7565,8 +7565,10 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 
 	/* Set the defaults:
 	 * - phy autodetection
+	 * - determine GMII_Address CR field from CSR clock
 	 */
 	plat_dat->phy_addr = -1;
+	plat_dat->clk_csr = -1;
 
 	return plat_dat;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 745032fd46ce..fe3d95274fd6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -480,11 +480,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->bus_id = ++bus_id;
 	}
 
-
-	/* Default to get clk_csr from stmmac_clk_csr_set(),
-	 * or get clk_csr from device tree.
-	 */
-	plat->clk_csr = -1;
 	if (of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr))
 		of_property_read_u32(np, "clk_csr", &plat->clk_csr);
 
-- 
2.47.3


