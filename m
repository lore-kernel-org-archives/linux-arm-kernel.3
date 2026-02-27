Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003FFFD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpIRyZ7QzC/EBC6A85M42Ue5KN0IkzW1S7uTrte3DSM=; b=GMRamxWY9tB/oyEDQNWBxG1Jg/
	Q9vEfC0e6lzoou6GBxSn2hrmf8tRRtXsFsU4jh3qstQ8q8f/yXNE9/820UnPy52kEuSAlqPyxPPeH
	lKgGuFmHIkGVCUEMyRhN4AbmZagR18Q6ntTsia+66HRxQVFCXeRvt7aFH+W+YNITIRHcB8w2E4VbD
	AYkCevXejx9FF+BJNPZqg4/Pz2Nx/7opQbyP855RllOicUdTLvSlJ/AZv0jLZhZ1s55wZXS0ekwCf
	FE5+SSXrt+feVOVANOHwNZEeLyYgq7/cg8b3nUB9OfFfJx87i0guZErL8a9vbbjwjH1PxtGepXtTu
	ie1DsnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuYC-00000008Bka-1K8C;
	Fri, 27 Feb 2026 09:54:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuY6-00000008Bdy-1xNU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RpIRyZ7QzC/EBC6A85M42Ue5KN0IkzW1S7uTrte3DSM=; b=KV+0ks30s5w+XkvAjqLK9c8aLw
	Y+SPF51vKXHle27aiO2GeXb8eWHxqyQgempeY71m/oBoNovR+bNTCWZUkSWygrNWMcYn14YjSTdwH
	k4bvkmphbhrsfc44wKkboAFLYr+sZEvB3VY8RuMyfZJpSfdUyiUvMD4DzkY9+gNES3lm4s/g92Ar2
	TAOi4xoRiwRqDeB3hku79SkzAlayajKUo2w4Ni1MnMcMFG+ASFSAtdFf7m9zbZxxUkSF0mcLrefPM
	rAZRAgl69NVyvbIzZqUw9mkp/oKbp/ARZ8Rvx2hwPVFqF8FWqN0Mf1FC7vALHfaX7lIEL0NbA6ifn
	iPxuJd9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51748 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXu-000000000ec-3V5u;
	Fri, 27 Feb 2026 09:54:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXn-0000000AvnX-4A1u;
	Fri, 27 Feb 2026 09:54:00 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 11/14] net: stmmac: make dma_cfg mixed/fixed burst
 boolean
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXn-0000000AvnX-4A1u@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015419_543206_99FFD951 
X-CRM114-Status: GOOD (  12.49  )
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

struct stmmac_dma_cfg mixed_burst/fixed_burst members are both boolean
in nature - of_property_read_bool() are used to read these from DT, and
they are only tested for non-zero values. Use bool to avoid unnecessary
padding in this structure.

Update dwmac-intel to initialise these using true rather than '1', and
remove the '0' initialisers as the struct is already zero initialised
on allocation.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 +---
 include/linux/stmmac.h                            | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 92d77b0c2f54..ece2a0c38562 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -636,8 +636,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
-	plat->dma_cfg->fixed_burst = 0;
-	plat->dma_cfg->mixed_burst = 0;
 	plat->dma_cfg->aal = 0;
 	plat->dma_cfg->dche = true;
 
@@ -1106,7 +1104,7 @@ static int quark_default_data(struct pci_dev *pdev,
 
 	plat->dma_cfg->pbl = 16;
 	plat->dma_cfg->pblx8 = true;
-	plat->dma_cfg->fixed_burst = 1;
+	plat->dma_cfg->fixed_burst = true;
 	/* AXI (TODO) */
 
 	return 0;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index cc6c89769d82..84dea8c4fa65 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -97,8 +97,8 @@ struct stmmac_dma_cfg {
 	int txpbl;
 	int rxpbl;
 	bool pblx8;
-	int fixed_burst;
-	int mixed_burst;
+	bool fixed_burst;
+	bool mixed_burst;
 	bool aal;
 	bool eame;
 	bool multi_msi_en;
-- 
2.47.3


