Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7F2C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nwqmyd6DelZJN33zgzOP1+KUArb5BHSnQUa4tshFmKs=; b=I3vVJJfCAIsNfYJfg8iwNMXoKi
	WuQN9BoJgh2CloBoXFGSjlqJ+L+geOzL+8fZ6QJZCK3GY6WkyWpiycCg/JTw4+Eo64Kis0VOFo3QX
	8jTyTGnOqsE2A0tRtavbQzjKAlEMJyNmSSVnXCwvlxkJEwZO/HaqRkK/2kksWFsisMB6tc3KHgAVS
	Wxm7Fd20Q2lyfLiyu2Mt5KlQIM8g6c8hF8ePGuFsRTYV3eDikEkHM5/iGEDTEU6seyZoen5Bp9lt/
	35HTUgGcs4W7no3ukovGFBBHVflZusuXfzyhqCDQOyYTD91SgSSdZS3B628NYuyGGol2vVfX5a9ta
	QsxjN4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllz0-00000006aBf-3scW;
	Mon, 20 Jul 2026 11:16:26 +0000
Received: from shout02.mail.de ([2001:868:100:600::217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllyy-00000006aAt-1nYO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 11:16:25 +0000
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
	by shout02.mail.de (Postfix) with ESMTP id 3F0B02406E8;
	Mon, 20 Jul 2026 13:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
	s=mailde202009; t=1784546180;
	bh=yK35+AhI3nm/v2z8NTIxfVsSX/APoUmq4QmgKb0ner4=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
	b=iudP4IyOkJIL8WarI/TuDlHt61QXpInji5C6sg5IzEIfBkHGrjABNIn/0B0RNVswU
	 b55GrtgMdUtHaYRTepddAkPKW3kacxgH9vjD8g/ZCZMYfOT5Uwj3RpCYbu2dZjh07o
	 i7Cn4PV5xyjWhkLgcrQH5ax9yJVgWjI6pVh0QQ2ng7YSy8mPwzAw5tDFDDinoLWyRZ
	 LWGsvAl/HYSYVObUANqRk+MCazvJRlGV7NSQcHsGTjkICUkC3fcXWMrgj103hynz3x
	 IkDqJYXBBDwQG5O2CpEN9RUYCusXzY1PNtZyFFjxt9pWWuvScCYBU6h/IEtndE/r9q
	 QncxIAL+wLjLw==
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
	by postfix02.mail.de (Postfix) with ESMTP id 011262405A7;
	Mon, 20 Jul 2026 13:16:19 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp01.mail.de (Postfix) with ESMTPSA id 64B73240604;
	Mon, 20 Jul 2026 13:16:14 +0200 (CEST)
From: Luis Lang <luis.la@mail.de>
To: netdev@vger.kernel.org
Cc: Luis Lang <luis.la@mail.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: stmmac: dwmac4: mask interrupts when stopping DMA in suspend
Date: Mon, 20 Jul 2026 13:15:29 +0200
Message-ID: <20260720111534.163416-1-luis.la@mail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 5154
X-purgate-ID: 154282::1784546179-3DC66780-1C876AB0/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_041624_607287_1B146705 
X-CRM114-Status: UNSURE (   9.93  )
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

Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU
interrupts"), suspending causes an interrupt storm from the RPS
interrupt.
Fix this by adding a deinit_chan() op to stmmac_dma_ops, which
masks all default dma channel interrupts. This is called from
stmmac_stop_all_dma(), so interrupts don't trigger while suspending.

Fixes: 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Luis Lang <luis.la@mail.de>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 24 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 829a23bdad01..23ffe1adcd0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -106,6 +106,17 @@ static void dwmac4_dma_init_channel(struct stmmac_priv *priv,
 	       ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
+static void dwmac4_dma_deinit_channel(struct stmmac_priv *priv,
+				      void __iomem *ioaddr, u32 chan)
+{
+	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
+	u32 value;
+
+	value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
+	value &= ~DMA_CHAN_INTR_DEFAULT_MASK;
+	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
+}
+
 static void dwmac410_dma_init_channel(struct stmmac_priv *priv,
 				      void __iomem *ioaddr,
 				      struct stmmac_dma_cfg *dma_cfg, u32 chan)
@@ -125,6 +136,17 @@ static void dwmac410_dma_init_channel(struct stmmac_priv *priv,
 	       ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
+static void dwmac410_dma_deinit_channel(struct stmmac_priv *priv,
+					void __iomem *ioaddr, u32 chan)
+{
+	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
+	u32 value;
+
+	value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
+	value &= ~DMA_CHAN_INTR_DEFAULT_MASK_4_10;
+	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
+}
+
 static void dwmac4_dma_init(void __iomem *ioaddr,
 			    struct stmmac_dma_cfg *dma_cfg)
 {
@@ -548,6 +570,7 @@ const struct stmmac_dma_ops dwmac4_dma_ops = {
 	.reset = dwmac4_dma_reset,
 	.init = dwmac4_dma_init,
 	.init_chan = dwmac4_dma_init_channel,
+	.deinit_chan = dwmac4_dma_deinit_channel,
 	.init_rx_chan = dwmac4_dma_init_rx_chan,
 	.init_tx_chan = dwmac4_dma_init_tx_chan,
 	.axi = dwmac4_dma_axi,
@@ -577,6 +600,7 @@ const struct stmmac_dma_ops dwmac410_dma_ops = {
 	.reset = dwmac4_dma_reset,
 	.init = dwmac4_dma_init,
 	.init_chan = dwmac410_dma_init_channel,
+	.deinit_chan = dwmac410_dma_deinit_channel,
 	.init_rx_chan = dwmac4_dma_init_rx_chan,
 	.init_tx_chan = dwmac4_dma_init_tx_chan,
 	.axi = dwmac4_dma_axi,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e6317b94fff7..04dafec021b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -170,6 +170,8 @@ struct stmmac_dma_ops {
 	void (*init)(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg);
 	void (*init_chan)(struct stmmac_priv *priv, void __iomem *ioaddr,
 			  struct stmmac_dma_cfg *dma_cfg, u32 chan);
+	void (*deinit_chan)(struct stmmac_priv *priv, void __iomem *ioaddr,
+			    u32 chan);
 	void (*init_rx_chan)(struct stmmac_priv *priv, void __iomem *ioaddr,
 			     struct stmmac_dma_cfg *dma_cfg,
 			     dma_addr_t phy, u32 chan);
@@ -235,6 +237,8 @@ struct stmmac_dma_ops {
 	stmmac_do_void_callback(__priv, dma, init, __args)
 #define stmmac_init_chan(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, init_chan, __priv, __args)
+#define stmmac_deinit_chan(__priv, __args...) \
+	stmmac_do_void_callback(__priv, dma, deinit_chan, __priv, __args)
 #define stmmac_init_rx_chan(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, init_rx_chan, __priv, __args)
 #define stmmac_init_tx_chan(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3..af29a50ddb89 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2560,6 +2560,7 @@ static void stmmac_stop_all_dma(struct stmmac_priv *priv)
 {
 	u8 rx_channels_count = priv->plat->rx_queues_to_use;
 	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 dma_csr_ch = max(rx_channels_count, tx_channels_count);
 	u8 chan;
 
 	for (chan = 0; chan < rx_channels_count; chan++)
@@ -2567,6 +2568,9 @@ static void stmmac_stop_all_dma(struct stmmac_priv *priv)
 
 	for (chan = 0; chan < tx_channels_count; chan++)
 		stmmac_stop_tx_dma(priv, chan);
+
+	for (chan = 0; chan < dma_csr_ch; chan++)
+		stmmac_deinit_chan(priv, priv->ioaddr, chan);
 }
 
 /**
-- 
2.55.0


