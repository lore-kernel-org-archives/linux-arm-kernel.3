Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE76ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3owm6f4A+9jTMJZ139x7b+W4kdrrA7/za47fSduK9o=; b=W/C0v+3YBJrvzpga79/v08VGCV
	CXeMkGE5kiHjpFM8NoOeWeH2GrjbA0vTkDdrubrJw8ZnYJci+SMR8JME70ewQyObcTotXqjD4QWzn
	0DFsFI6EVs5lAuWx06FIZV9h+JcCDS45mqn9ejEeDNX/26dd2CQz3lKHpbeOBDhBJgLRvvHDk7c0N
	4tLDr2Pu2GGI7XLIBE2r5ys2zridYdYR08f4uqSE7TzRrTjDcO0SYwllb88YHM6g+4k4Gah254XFY
	mff4yoCJvZsdfcWk+HMPxnPGUl6iVO5evfY5iyHC2bVFD+xcUbgLMnOykQ+cARyqhH9P7N8VCpi1t
	lh6uwaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzbd-00000003IMo-2mnu;
	Fri, 15 Aug 2025 18:56:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxiB-000000031ZI-3W5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 466BB5C4680;
	Fri, 15 Aug 2025 16:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB57DC4CEF5;
	Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755276925;
	bh=inws8rGfKLYVfokZMZsnBzF7qQWjCw/1Z/VQ/H87srg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D6EZQOYOAUAeF305N1gV7XWP8PF60SeQAOjLMO1wlTgas6veveIMLTz2fnidz4Oud
	 MBlT+tUJBdT2vTIoqV7HNodxVm56PUe6uX4yrHIgZ0N9Nz+XJxoUgztaIG9Zqjyzfp
	 FTaX3rEtIAcmi+r3E0BWxyri9Kr7Nke5dLq6on1qne25HkZ4DjjXw3HYTfuulfG1Qf
	 h1F1nKc7xxYp/slEvjKOo1513TSPOxA4UK9Fyb8dRDqvgN/fEXfbjq1Bb+OFXQyl8n
	 JvuJPqVf84UATwehLRVjdeeeix5KdgoczSsPe0THCCw4Oqmnoc3845oP1d85TXiv1b
	 ++Pk/8wWvYmcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C56CA0ED1;
	Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 16 Aug 2025 00:55:23 +0800
Subject: [PATCH net-next v2 1/3] net: stmmac: xgmac: Do not enable RX FIFO
 Overflow interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-xgmac-minor-fixes-v2-1-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755276924; l=1566;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=E0GCiOkgubMN2NevEVBVfzpHtZM3l1Fx7YIgaGSXhBE=;
 b=OAU0E3PwMrRPvcg/pVQaA9iV5Ql2eiNQoRq+NwfecsLEHn+IbcprNx58bAx8/1GqsKDlnfZ81
 uRjhsjDGB0fA/n07LCtDi99v7dWkmYGkYG6I80P8piIOVSRWcgMpRt7
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_095527_966286_68F88C80 
X-CRM114-Status: GOOD (  10.98  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Enabling RX FIFO Overflow interrupts is counterproductive
and causes an interrupt storm when RX FIFO overflows.
Disabling this interrupt has no side effect and eliminates
interrupt storms when the RX FIFO overflows.

Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO
overflow interrupts") disables RX FIFO overflow interrupts
for DWMAC4 IP and removes the corresponding handling of
this interrupt. This patch is doing the same thing for
XGMAC IP.

Fixes: 2142754f8b9c ("net: stmmac: Add MAC related callbacks for XGMAC2")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 5dcc95bc0ad28b756accf9670c5fa00aa94fcfe3..7201a38842651a865493fce0cefe757d6ae9bafa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -203,10 +203,6 @@ static void dwxgmac2_dma_rx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,
 	}
 
 	writel(value, ioaddr + XGMAC_MTL_RXQ_OPMODE(channel));
-
-	/* Enable MTL RX overflow */
-	value = readl(ioaddr + XGMAC_MTL_QINTEN(channel));
-	writel(value | XGMAC_RXOIE, ioaddr + XGMAC_MTL_QINTEN(channel));
 }
 
 static void dwxgmac2_dma_tx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,

-- 
2.32.0



