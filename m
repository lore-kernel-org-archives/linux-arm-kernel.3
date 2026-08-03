Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D594C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dMeZxxXidnnv8L6avohKewSLU0LQy6ezrLI+Ol9UVmE=; b=Gti/RWzAY31L4yHaBRQW75SheT
	82BGQ82tnVABBwlWXkOZ9eEMCmrwf5JxF2fHRpBWzzUcaaUkweQGiehOtxWdtPINmkmnowhR24g0E
	1XeXyZjEr+KmVHR3FfsqTAqppaISxT34VxZBOwtrUWcoq+4J3MazrylaLjEBFUYR/L/6O/N25NH1/
	Io9Q198MW0Z01fGb8JTqJde5bgBD8+EZC4xZo7gW7vGmIqAaT6mGGi/X/nQ45OFxFaLKpimyG7TG1
	BKvnVB7pcnEWnukSsxWyTSV2Oy8Wp1cT4PsomGZV3FtSheIJXJPWVg7NC0+ovG7DVdEs8nMVxAtWO
	NGEeUc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTp-0000000HJaR-0FSr;
	Mon, 03 Aug 2026 14:17:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTn-0000000HJa5-0Nxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74D7060A7F;
	Mon,  3 Aug 2026 14:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2871F00A3A;
	Mon,  3 Aug 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766642;
	bh=dMeZxxXidnnv8L6avohKewSLU0LQy6ezrLI+Ol9UVmE=;
	h=From:To:Cc:Subject:Date;
	b=eztiGkejZ8yyi5F5R9XJXXifbi+qUj5ZEodqZOBQcciQSEVh+D0/A7KWxgjiVLhBT
	 tXrAI/JBdtRupM0JhhE98DpCoeF55d8lTj3hnYH03DSvbyLP5+czG5A3a/b0oGZmKQ
	 9QbHV4OWRGs9YrUZmgJjWFWS9DN3h+aO5eTbQXHhMKUWEUedRXoHPoADg8tzkfN5OI
	 sc158uUkSKEDOLHZf3jiZep1xX9s00x2e5gSbTwYomqGSexyRnSlLL+RWKzmPnqWGN
	 RSnObKAUrQxiEaVrGBbZWkbCnCyTvmKcdSRPchA4LzCx8hKgIeeXDqVf04CB9s0p6i
	 ZxTRwBMIPV6Fw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: remove ptpaddr/mmcaddr/estaddr "safe" initialization
Date: Mon,  3 Aug 2026 21:57:45 +0800
Message-ID: <20260803135745.12600-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

These so called "safe" initializations aren't needed any more from
sometime, but the unnecessaries are obvious after recent clean up
by Russell. The code will correctly initialize them after getting
the correct stmmac_hwif_entry by calling stmmac_hwif_find().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 511b0fd5e834..265671170bf6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -328,18 +328,6 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	/* Save ID for later use */
 	priv->synopsys_id = version.snpsver;
 
-	/* Lets assume some safe values first */
-	if (core_type == DWMAC_CORE_GMAC4) {
-		priv->ptpaddr = priv->ioaddr + PTP_GMAC4_OFFSET;
-		priv->mmcaddr = priv->ioaddr + MMC_GMAC4_OFFSET;
-		priv->estaddr = priv->ioaddr + EST_GMAC4_OFFSET;
-	} else {
-		priv->ptpaddr = priv->ioaddr + PTP_GMAC3_X_OFFSET;
-		priv->mmcaddr = priv->ioaddr + MMC_GMAC3_X_OFFSET;
-		if (core_type == DWMAC_CORE_XGMAC)
-			priv->estaddr = priv->ioaddr + EST_XGMAC_OFFSET;
-	}
-
 	mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
 	if (!mac)
 		return -ENOMEM;
-- 
2.53.0


