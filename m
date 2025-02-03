Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30535C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pj2CGih+iuAqFMlOPGQYeBHWOme7I6EGJS7wFIYzBr0=; b=oC+nKdp0twfFQgnnI8SEmEOLBF
	Lc9flJvRiePI+JoM68TT4FuwRgAZwReAaBNbJ0MFJBwx5Xsm0uxs62mGN+V3Gkb5QGfXaJcLL6FRG
	/HZ4AGmJ9bvu4Ob1V6e8GKzajlvBJ12QAtG27iDdRdIZEy5RMKYfWphBIp92gjeAk3tlFUtpqhkkH
	cDB4s+6p2Qp/d/wvFq5ieoiBpD1P6nFsuv1P5NVF2FGPJhGcS4ke6BXdbYH/YzCy8cQM+pcbJiWBg
	Y6wspvlbQpdUgmMM6Bo2nMQo1/x2OLpoxG36sxVJsV6EtMBKXOtYxyPB3N7G1zhRFg5Hwmw+s1jqq
	gZq7baGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tessP-0000000F0qy-3jQN;
	Mon, 03 Feb 2025 09:36:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesqm-0000000F0VT-08WH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:34:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22B201063;
	Mon,  3 Feb 2025 01:35:02 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.34.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CCE63F5A1;
	Mon,  3 Feb 2025 01:34:33 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: "David S. Miller" <davem@davemloft.net>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Petr Tesarik <petr@tesarici.cz>,
	Serge Semin <fancer.lancer@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
Date: Mon,  3 Feb 2025 09:34:18 +0000
Message-ID: <20250203093419.25804-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013440_115389_B1F3F432 
X-CRM114-Status: GOOD (  12.84  )
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

Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
when FIFO size isn't specified") modified the behaviour to bail out if
both the FIFO size and the hardware capability were both set to zero.
However devices where has_gmac4 and has_xgmac are both false don't use
the fifo size and that commit breaks platforms for which these values
were zero.

Only warn and error out when (has_gmac4 || has_xgmac) where the values
are used and zero would cause problems, otherwise continue with the zero
values.

Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
Tested-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..821404beb629 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7222,7 +7222,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (!priv->plat->rx_fifo_size) {
 		if (priv->dma_cap.rx_fifo_size) {
 			priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
-		} else {
+		} else if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 			dev_err(priv->device, "Can't specify Rx FIFO size\n");
 			return -ENODEV;
 		}
@@ -7236,7 +7236,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (!priv->plat->tx_fifo_size) {
 		if (priv->dma_cap.tx_fifo_size) {
 			priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
-		} else {
+		} else if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 			dev_err(priv->device, "Can't specify Tx FIFO size\n");
 			return -ENODEV;
 		}
-- 
2.43.0


