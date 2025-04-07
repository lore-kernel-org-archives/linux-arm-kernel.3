Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6FDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTONaCMGO+N+NO9JMd3j9lruIEiRtelFCdK2KAx5w+M=; b=SUfz3WcgVP+JXtG9I7O1GwD4q5
	XzfoyxBKOkNY0LhP1TyHKLPgR2N9n4lSVZBooNQIaAjl4XJKaKclVXbNqn3xns4YskjuswFB/95yJ
	q5QPhhBhKZeaImUEYE3Dt7bN8NU+zCmhtnc1nXoGQkcPQgVsGbZzeP9cpPj5M+caRr0D9T1015BsJ
	8muAbZb6SEB4Y/Y1nraDgyCWia16UDCoQOqtghSEXUpWjmJbDUx3fOvRFT0TLXXQY/yWTQdNV1jhs
	ImmU0yHtxEQWMVZr7Kn6LY/frR44NStw60ZUegmFL4DahLe79twdIbGKUo/Bgo2eLEGhV1ZHK6hLa
	CL+roUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ5-000000024TH-1yme;
	Mon, 07 Apr 2025 21:47:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rh6-00000001j5V-1IPQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=xTONaCMGO+N+NO9JMd3j9lruIEiRtelFCdK2KAx5w+M=; b=ChY30GFWC3DDyUAuEGOsPDQWvh
	/cKsvBZRoELnoB4FMihKY3np9kLGS/TpfhQPISO3aDQT9LKfkK4626px0rUtUpQMD6NSoIyCt6JuR
	SHLSd9LGvUEECuq977BggFcYPV6Lwrh8Kme+X5kEFWo7RDu1vqa4aeinYp70j2ZK42RtCg5WwNlZm
	jF7fvpgzGQfjEfqtqtYk/Smxc55FiF1DzRJQljFdDTF+TAHDWRVE9dWx99Slz8SGgH3CU02MUAtOp
	iuDK8otwEodBnVvbaU4jNJWDdk0pwwUYh+8gpFJv1YEP6AedxhBMBK3IiweZW71V490ycF21qtuVn
	s7VGWPjQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rh3-000000086gx-1xhj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xTONaCMGO+N+NO9JMd3j9lruIEiRtelFCdK2KAx5w+M=; b=hidQfRU5Rh4JiHeynMmBEAIf+H
	gzkvRXc9w95+J87NeqpP4x6NPTNpx+Q3uXkguxSQ11KGk5UGbqaoL98obnOMRMutn2185KmavdbPv
	0YM45uW+cMvN8vfoCoeQWb6hOEEcRD2wL6LO4FvNpGx+OVfYdy20KHXY2LXbVxzane4Q5WZffWTGK
	NKfeCOci9TDgP+7oL8YTmvwSoVSGMzeYDG7+mE16BWaUfLvj8TUH/eg/WdFqUaxp90K/Q1H6PEj/N
	a+hsin3gVpPrUDpbMCc851uNyZ9OWoq58ia+NVZGpTA7wOuRjmPJzHkl916SsTpOHJ0yahzwBPWy7
	1+BOv8bA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44378 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rgz-00069s-0v;
	Mon, 07 Apr 2025 19:59:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rgT-0013gp-97; Mon, 07 Apr 2025 19:59:01 +0100
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/5] net: stmmac: intel-plat: remove eee_usecs_rate
 and hardware write
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rgT-0013gp-97@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:59:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195937_656567_2732A5D8 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
   is fetched by devm_stmmac_probe_config_dt(), and plat->clk_ptp_rate
   will be set to its rate profided a "ptp_ref" clock is not provided.
   In any case, Marek's commit will set the effectual value of this
   register.

Therefore, dwmac-intel-plat.c writing GMAC_1US_TIC_COUNTER serves no
useful purpose and can be removed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 599def7b3a64..4ea7b0a803d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -113,16 +113,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 
 	plat_dat->clk_tx_i = dwmac->tx_clk;
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
-
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
-
-	if (plat_dat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat_dat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, stmmac_res.addr + GMAC_1US_TIC_COUNTER);
-	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.30.2


