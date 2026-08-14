Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91290C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dr5UudFe4F6r6fPOKSi/bBNU+7nHpGE79pgT3ehlkvE=; b=aA43yBtvkvxl/WaqZEyg0bMC56
	xfLnCS2Ptl9beIeDLnqi9XlOcpbwBMYzNSJClRAIlIkmSMXE+wywfNh2INbkyXODGSJQQ+Ie7mrfj
	qypze5QivF7tZNUetK6U7/CGuyQlEGYBX2OOc1mdnkf5Ra9giSffs2eqYOPtErWknHRfV0kOUm3sh
	6FBdjWx8il2PZKHVw0iBrW3V3gZprfQIo/L2tEvAxBKTEfFq0y9z14jnaDzhoRpgiB7Dpi4EL+oxc
	CBGu1I3XcqyLj1nYT54dtTyjiiZTBgh4unB0fvYjdkyztHPHJpCLrVu7UM7vREwWtaIW7C3rZ814X
	oWNiWRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wul5w-000000020Hr-1B2E;
	Fri, 14 Aug 2026 06:08:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wul5r-000000020GB-3YVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:08:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11954295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 23:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786687718; x=1787292518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dr5UudFe4F6r6fPOKSi/bBNU+7nHpGE79pgT3ehlkvE=;
        b=h+7TOdwqLhPqHqmjEnncvwQfBLQcql1wDSuuMeJ42wTia/M3XjWk9g6MGp8cnB67sY
         V1bUoyT1EBAtuF5Rzg3D4gaHarm5EJsfN5amXzELQb6GWH1effEZ1vRPWotrodzgZm0K
         MmbGFiMOGe7SvhKUNSkAEcmWlnUisXtkcg1UEP2aZpP8tZrnIO3JJp3I6EFEcxn+Ii92
         SBkDvP9ufJlJFICRJKvU+KkpBM4T3lJJ72In740koLGdnq4hAei7MNtbwjmMkqeKw4m1
         VW+nTtrV9eRaPJ9sCRQe24u3cGhcdXcBb4OImiuqqiXUfATRcE/zyivpwb6/hxulaylf
         j9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786687718; x=1787292518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr5UudFe4F6r6fPOKSi/bBNU+7nHpGE79pgT3ehlkvE=;
        b=BptWiG3/2ZSSr5k/U0h/m6F/el0z9xXXPQDPrhQbQc9QGBfbpUvPbQC3qflLfpxgS/
         rZJIAZrxRczWYMrm5tBr91+mC+GR7nVbP+lCBfyw996HErIlZ543kST1Hf6e50ELoQh2
         /wNiZkDgTJb7zNBgo2axL3ltyDpKcflj+4O9c221QVjd8QNDHOa10rApeDvZ6La8c+N4
         h2/Ef5rd/fXT8on9JljY1gFGQwPNcMzWuqVeLy+CVGxsekVB8j3t2yPzdmxk3dAQqEiA
         DbHy50DFfUiXvGg/FVO/puRKQ2xT5x5PVGE4TU1UJuxSQ0kcqXjmhXwgBfXU4EZjQ5wT
         9wAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCRPyqTIa9K1vHf3eXe0pdVimqwfZRIPpbLEUN9OSTo6PGx4tgakXNtacGau/Rym5i6o60AQvSV2kcE14IOEqm@lists.infradead.org
X-Gm-Message-State: AOJu0YyfqGBcmQO7bmvCykSTQ9OgEHmqWXupvR5IvIw9uGsGyov92p26
	/gFrl1KrD+9l7g0zF1LFv9Z4YG5keYkgd7bRjIjpfI9/BJc74Jwd4vd4
X-Gm-Gg: AR+sD10njRbhwP9KMKBgs5hD2/zrlWpnJOvAO+47eFKv/dyqHl5vLMG3QyNDJJi2pnR
	0ZKAcXtzZLrXW5mryY0FFE3N8ci7OK7AfR1fFhyvXYC4kFrMUm9xmDgcltYm2VibZLoLQDy0nDe
	WcUjKHxXN//IFZ/Q10jabH4ECcrZ5CYSs4cZvg1OsjaARvGYb5oa+5NoThlGSqTTVbnpy4VFEQ5
	YanK1oTcTgRxlHMUdYtA9WXkCUiyelSWi5OtRjPZnpw8IVwsUzKSTxxIVFNi7ILO4b7fv6KqzNf
	OOoPjODuC3b+ehnb4a68EY5asbcbzcvhkuz/oYzq7dXyLTHTcqdDCT0GPXdmyo7gfT1Flbkddsn
	B0pu9ccunfDR+YiyOkZuQlmUWPhsEIaDoq/EmBD6DtvmyzYEWN1y7iJMg49ymQ3Igwx/MY2QaB8
	eKoC5JitQHQp1kAmo1PE07EiDhIyQO0SXqR/lza7LqAHp7+//E8bQGXkP4/exOPn16yhHTtej16
	3jBaHRS8vXNicKDW34OUJSpLfGiGv9DWJVJZSsF
X-Received: by 2002:a05:600d:117:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49987ab4e1bmr24402485e9.7.1786687718165;
        Thu, 13 Aug 2026 23:08:38 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989ae9618sm1475095e9.13.2026.08.13.23.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:08:37 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Date: Fri, 14 Aug 2026 06:07:55 +0000
Subject: [PATCH net-next v4 3/3] net: stmmac: xgmac: decouple the MAC Rx/Tx
 enables from the DMA ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-stmmac-rx-fifo-block-v4-3-1951fd3d33b7@gmail.com>
References: <20260814-stmmac-rx-fifo-block-v4-0-1951fd3d33b7@gmail.com>
In-Reply-To: <20260814-stmmac-rx-fifo-block-v4-0-1951fd3d33b7@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Qingfang Deng <qingfang.deng@linux.dev>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786687705; l=2086;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=0Vwj+Yf7E1Ji8YvFOtq75mgQ/Wgtg5/pWR1g1XG9zro=;
 b=LnFwns+EYkt/RIAKFdCfRUKmnaV61xN7S2an1VxP7zn2xuNjez526gMQes2zTFI9XOaZ6kK4H
 5/E/AvF2/T7AGDRwZWlVD+q5/OhyACmoDs/5PWIlyCnPGg7tS+Xwabl
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_230839_928017_DFE72DAD 
X-CRM114-Status: GOOD (  10.28  )
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

The XGMAC per-channel DMA start and stop ops also raise and lower
MAC_Tx_Configuration.TE and MAC_Rx_Configuration.RE. Those bits are
global, not per channel, so an op meant to touch one channel
reconfigures the whole MAC. stmmac_tx_err() restarting a single Tx
channel clears TE and stops transmit on every other channel too.

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index df366b2e6bd7..ba4f535fb9eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -268,10 +268,6 @@ static void dwxgmac2_dma_start_tx(struct stmmac_priv *priv,
 	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
 	value |= XGMAC_TXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_TX_CONFIG);
-	value |= XGMAC_CONFIG_TE;
-	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
 static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
@@ -282,10 +278,6 @@ static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
 	value &= ~XGMAC_TXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_TX_CONFIG);
-	value &= ~XGMAC_CONFIG_TE;
-	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
 static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
@@ -299,10 +291,6 @@ static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
 	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
 	value |= XGMAC_RXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_RX_CONFIG);
-	value |= XGMAC_CONFIG_RE;
-	writel(value, ioaddr + XGMAC_RX_CONFIG);
 }
 
 static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,

-- 
2.43.0


