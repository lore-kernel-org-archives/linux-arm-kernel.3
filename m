Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E90CED25D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRVTCsVKmKuNEimYsPQc5eVcrZkNx01Ledzu5WS/DBo=; b=0zpVNi9NjkDuyLDyUf7sbpb+SV
	NWvZGYK2fDX4YVb6yv86L/ANxOHe3C96GtUaJcjAhI6OfRzU82S2F0NX/H7XiyECVWmE3HdjzJRRC
	aXMcmCd5ZLI/RU2ZYvB/LboUEgvfkCvMSH4Ur1MNY3bCkFtzEub13hPLndZTzi/ic4VqU5ApIPfHp
	isz65B8Cho1+X3uL0UeemiLnn88hFoV5VomfhmggSz6PeSxBQ4AzVKwuzVNt2QovJYpC//OwTmw5X
	Wgu7WVuhccseo6TAq+NAy/4UjyZ0w/a3lGiVt2EM03ri+SuHbz9Hf2UGgaTRi0ZSNszHmMP7kEGxe
	A9Uw5PCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIWc-00000000CaU-27lo;
	Tue, 18 Nov 2025 10:01:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIWX-00000000CZO-3fDa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aRVTCsVKmKuNEimYsPQc5eVcrZkNx01Ledzu5WS/DBo=; b=QsbRz4CLzEuj/1cu3cYRbqZy/t
	WLuNxQc7gHHPRxQXBzvBvXXu9rI6ICsM4p2v94jse1+TEhIUogH0J4RaokES2E34djACWsEPQx5X3
	0/jBae55MjzLQdYmMVEb5tNV74SfazqeljkAyGGA8EY6vIGQ6Uje2gig/Mpkbl6LRPBEzZoEdGgcE
	5v/9MRdhdi6P7xfBeoaBaN96rMKTOsqbvWOAAgs8kDpxYRt+PuXdEZPJuGudwctiJWP2aM/6jPMUB
	5zBTsYa2eEmePzhNLqCYpN+8a1LmIM73t/wIDjhBzf8Wv2loP1b6C3nbySLOWuVdbF6n6JEZcgkMK
	bkl8dcrQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43556 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLIWS-0000000031x-0q2O;
	Tue, 18 Nov 2025 10:01:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLIWR-0000000Ewkf-1Tdx;
	Tue, 18 Nov 2025 10:01:15 +0000
In-Reply-To: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/2] net: stmmac: stmmac_is_jumbo_frm() len should be
 unsigned
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLIWR-0000000Ewkf-1Tdx@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 10:01:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_020123_557192_2B91D99F 
X-CRM114-Status: GOOD (  10.86  )
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

stmmac_is_jumbo_frm() and the is_jumbo_frm() methods take skb->len
which is an unsigned int. Avoid an implicit cast to "int" via the
method parameter and then incorrectly doing signed comparisons on
this unsigned value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index fb55efd52240..d14b56e5ed40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -83,7 +83,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	return entry;
 }
 
-static unsigned int is_jumbo_frm(int len, int enh_desc)
+static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
 {
 	unsigned int ret = 0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index d359722100fa..4953e0fab547 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -541,7 +541,7 @@ struct stmmac_rx_queue;
 struct stmmac_mode_ops {
 	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
 		      unsigned int extend_desc);
-	unsigned int (*is_jumbo_frm) (int len, int ehn_desc);
+	unsigned int (*is_jumbo_frm)(unsigned int len, int ehn_desc);
 	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			 int csum);
 	int (*set_16kib_bfsize)(int mtu);
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index d218412ca832..039903c424df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -91,7 +91,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	return entry;
 }
 
-static unsigned int is_jumbo_frm(int len, int enh_desc)
+static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
 {
 	unsigned int ret = 0;
 
-- 
2.47.3


