Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518DBCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zsfJ+olgcWefQZWLK01j9ksweF/zZC4+ckiHnhVmTSM=; b=nHRW1jsLdM8VLRx8x3tSCykJbe
	sXpoT8pO7BCimPqTonKQfnk4+tr+ixfdlvWHJskQQRAj5FvI8V3oz6WQO3+3KSt5B3i5B42Ws+ZCQ
	PDOtkintLZ77iiiD/yquFMnAI/6j92ehaHqc0h7BMCPgj71yzcAZfqM3ULyIR/VtalRI4ODKzaUE3
	sC5tzaHs/HJIHsc9jeqRKuOY/bUBpZtalWh1b1FvjGyzCx5A/kLKV3ehhAS7LMwd8KMFjja/wdQwh
	llcj9oFyz5gi8Y2Gxx86IDOUN5SHR9Bd9Fbpw4rhTig7cNJEPuud0jX57hMlJ6J5/ZJvrHXnVERKI
	W8cJYZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImWN-00000007491-04rZ;
	Tue, 11 Nov 2025 11:26:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImWK-00000007485-3zUh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zsfJ+olgcWefQZWLK01j9ksweF/zZC4+ckiHnhVmTSM=; b=DMBpCpcsyjMgu7m2jqNJh2ZPQK
	gUH0Sfb6tAQkHJgRkfWujCROHyohPtSF1//JP8a802YcQbhzkNrVCbroV6r14o3X729AA97PWUaYO
	ksGz4iP/KcDNDNjJRGlv8vUi1DIcCpaT6lFXcsHUTiu1DSkmmQAU6+1nM+D+fBTiy7QjyELxg4mt7
	K73uFdX7hpbE3C5vXCHHTaXoqKp6CeLKrsBs7/WHcHPmx0EaApTamLsUUQgfCR4Zq0LvgUGWGKUdw
	iapqy5b5N/xBG3Ve1wcSMjUrexFPko1g5swgVqFGHntuLbqhoV9ddHMy4aNrvECqBU4A1E0ShGBOb
	XXma21AA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60616 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vImWG-000000002U1-0lkg;
	Tue, 11 Nov 2025 11:26:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vImWF-0000000DrIr-1fmn;
	Tue, 11 Nov 2025 11:26:39 +0000
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
Subject: [PATCH net-next] net: stmmac: clean up stmmac_reset()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vImWF-0000000DrIr-1fmn@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 11:26:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_032644_989262_0DCC5D9F 
X-CRM114-Status: GOOD (  12.21  )
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

stmmac_reset() takes the stmmac_priv and an ioaddr. It has one call
site, which passes the priv pointer, and dereferences priv for the
ioaddr.

stmmac_reset() then checks whether priv is NULL. If it was, the caller
would have oopsed. Remove the checks for NULL, and move the dereference
for ioaddr into stmmac_reset().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c        | 8 +++-----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 8212441f9826..ee612cadbd77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -103,12 +103,10 @@ static int stmmac_dwxlgmac_quirks(struct stmmac_priv *priv)
 	return 0;
 }
 
-int stmmac_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+int stmmac_reset(struct stmmac_priv *priv)
 {
-	struct plat_stmmacenet_data *plat = priv ? priv->plat : NULL;
-
-	if (!priv)
-		return -EINVAL;
+	struct plat_stmmacenet_data *plat = priv->plat;
+	void __iomem *ioaddr = priv->ioaddr;
 
 	if (plat && plat->fix_soc_reset)
 		return plat->fix_soc_reset(priv, ioaddr);
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index cb8fc09caf86..d359722100fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -698,7 +698,7 @@ extern const struct stmmac_tc_ops dwmac510_tc_ops;
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
 
-int stmmac_reset(struct stmmac_priv *priv, void __iomem *ioaddr);
+int stmmac_reset(struct stmmac_priv *priv);
 int stmmac_hwif_init(struct stmmac_priv *priv);
 
 #endif /* __STMMAC_HWIF_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index eb4350193996..d202f604161e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3162,7 +3162,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (ret)
 		return ret;
 
-	ret = stmmac_reset(priv, priv->ioaddr);
+	ret = stmmac_reset(priv);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
-- 
2.47.3


