Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAD9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcoqLP70vWvElPZN0/ESQigbvyY/ROtDk2j5xluq2dU=; b=CLw4AGpUFfYjBKzQMvxz66ecrV
	ivbd6pVkkDbR1PC2L3SSH0TqXBRotZIdqojjgUDSoVyr/kFp2L3ianDEMQBwokDGZFJtGMus+XDjZ
	VgkZExg4NXArZWj3dO90VzDN/pdJ76R6jNCQGG9ZMyz/tieeKcqONW8vcB5DKvqLMD6hxADsdR5Fq
	NwyMW4Bt45PQzlA4g0auuRoTFgbHn2wTNdH5BeGk5vOYkCJoJL0NQbn2iPdLZ4KUU1yvN/YP7NnDV
	Byqyfk5ucl4tjw4CkKCz7v9xFznUwxihAgQx0v6cXfT+PYFv4JsdcIBVMIiVKjP/av6qJzNc3BCU9
	swci8rKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCY-000000002ms-2Igp;
	Thu, 13 Aug 2026 07:50:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCW-000000002l9-2glL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:50:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso8510945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786607407; x=1787212207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcoqLP70vWvElPZN0/ESQigbvyY/ROtDk2j5xluq2dU=;
        b=AtYfNRed3YE/JzXx02GSvS70NpHnc5AhH9VKaE3LjqIXNMkG3Sv4vaOOcrO0IPwgrm
         L3KONqw3vs8foPZF4G0n0h1WZnESk2VRCnaSyXu2U43k0mTjmZ+3xMdDvV0MZmRn1wyh
         lStJ3IE2eZsOef8fqD7ZOUTWsEMtD5liPvyNcOP3SO1qT6C0+lmTxDHbZoBVC/uJ1duB
         ZGN7r/eKS7p8ir0GRFc1vJvd0JYLEUXxugpvg8srm/qCzVttW57aGOYNnuvjBpu0k5wT
         /br/5RgLT8vKSi5gqvkjc/0AWom/WCbXAcBmvkfDUdtzYc/PsRQLrcf8bBuwn8xCztMM
         0yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607407; x=1787212207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcoqLP70vWvElPZN0/ESQigbvyY/ROtDk2j5xluq2dU=;
        b=gLZKYNqviJAv7o+xNpMzo2exCPAoL5vX3fuwghsmc3ztfNHQB0/ZQRvXclfGGPX5js
         o6ICiChx+s7Tc/FVQS3DNlDM6C/SFaWWaO1SWx24QT2zMjmCrHjkEt91Q29jbKhXge6q
         DNDXIXs48P/7uIitAWzt5qbg/cyf3T/84OedGZPOO3QhArSvv25lgFxgnbI1q+fm0dfT
         1opPO/d9MWIsXssukvGrw342omjOo+A753rE7XRasCOXcvUrCU3iscDkPp3LVH8Ilhaq
         X6/N0WGcmsDouVPGHtcriNxy4Aj82JexvOYLscvkQU/xtbS7jAXuwZ5SiHIX9ZLaN/dC
         EUfw==
X-Forwarded-Encrypted: i=1; AHgh+RoFzkyrXoQa8YqOVK0l41lshQAMIOqT7YwcytwXajHDMPRZlcOqeBeSs5f8/l9T641OECvQ3cz/lQOU4VRmE+QV@lists.infradead.org
X-Gm-Message-State: AOJu0YwDBVBqX13nCrrjN/YamvzgX/uANHBXbfRDb5IrOUzf2M0FapIE
	kijok/37mEy8k9/AEdzVK2KLN7yyC1E5o2e5S7H6SJC20uTS9oRhXjPv
X-Gm-Gg: AR+sD10IUisKV76TzIk3NRZQFBXA/Nud5kd5yyORCAUS9+iEbdt8Ukj2ZJcrfvLd2il
	ObQ1bkc9j0wTmfw7c0McZ0cURFAvCmL9tD30dzjtZ6JxViyC64Yy6rQGPWswzi0StMweWcbWNs8
	UGMCBeE8/c/2jrh+c8zCSnh1a7HsEna4Rk1m1BrB5pfr7MyAViZ6ky2Yj9xETfjhWzQWsqnLv8w
	prJid1OAHB4fz7SwKjmop7T6WBYgL4BB7NTaK/knK0KdwVu31U9UYP2xa83ULZCGApwv2YjJ14t
	g4Sfqy2yYAMudPftr/xH/M65Usd+NPasHrHuUnExaNoHt5u6QCFilr/mwFt943RcMlo5MHbDRr/
	Np1Zr62xeZNoSH8Xls6oXUmSmzKfJ453lWeF+oMwLYW3ZzoOso4KhpUBaCW0x8zvmum0ezmuFxA
	ApoGFW4GjoxO++t+bhcAFSCsil6O1i4GtKsuCax9LT6uCGlon9iUtjqDjBCFY5Jf4C88ACe1d69
	eQFFb4H5I7wcLodqGO9i5acDJ1BmSaQKcrOq0Mm
X-Received: by 2002:a05:600c:1546:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4998218451fmr42945125e9.7.1786607406518;
        Thu, 13 Aug 2026 00:50:06 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b62894sm41936365e9.13.2026.08.13.00.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:50:06 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Date: Thu, 13 Aug 2026 07:49:29 +0000
Subject: [PATCH v3 3/3] net: stmmac: xgmac: decouple the MAC Rx/Tx enables
 from the DMA ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-stmmac-rx-fifo-block-v3-3-738acbee55d9@gmail.com>
References: <20260813-stmmac-rx-fifo-block-v3-0-738acbee55d9@gmail.com>
In-Reply-To: <20260813-stmmac-rx-fifo-block-v3-0-738acbee55d9@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786607395; l=2080;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=qmoEogHzK1kCxSGOvURN6pvKNeVEIJOqlmVkcFUU4k0=;
 b=rzTcfJD/m9BixYhCaji13vn4qbBwNoxVD/oaLnmlUzxXCfmODBqWnrSf5nTQM5ppGCPRJBZDt
 IApnsUdlaZ4Ai1SmPMzKD0imBYft7f/SrzI32pt1QtDnleeekqzlx/F
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_005008_700758_1AC5CECE 
X-CRM114-Status: GOOD (  10.50  )
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
index df3700a0d..8e27bc58c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -258,10 +258,6 @@ static void dwxgmac2_dma_start_tx(struct stmmac_priv *priv,
 	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
 	value |= XGMAC_TXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_TX_CONFIG);
-	value |= XGMAC_CONFIG_TE;
-	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
 static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
@@ -272,10 +268,6 @@ static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
 	value &= ~XGMAC_TXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_TX_CONFIG);
-	value &= ~XGMAC_CONFIG_TE;
-	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
 static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
@@ -289,10 +281,6 @@ static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
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


