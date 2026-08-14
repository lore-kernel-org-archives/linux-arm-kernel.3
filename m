Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA4C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g+mH3cDkuaANlwOg+CZREKs6e+pObXwzyUt9cFT9pY=; b=kQmWRMw/FNJeW4DDrUb+TlcNwx
	YkaDBa3hyBPDIe6OSvrb12H+lhUW09bArYjESrkcyBYBv2lLMul7aEMAoNhrRgVrZqaHinYJAUBNu
	57y0Abvtg9T+Qebe6nsQ8AFTSEMwmiBxhx1baHfgFUxWJKXazc0hdAyUVHY5gL1JYLrk+ZY299PmZ
	sb209x2071wuBUyEaqLlflidKUkO/qY00NvWfgfClrsKMUrxfTX553TKCSj28vQeqPVf7hW6Dsqbg
	U2jUaZuxU8DIDex5yH80CasIjlY/tibOpess1CEmOJRcoqnvofEzyR5IOy55hkgwa5NgrO5sPJXY3
	8YsvxXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wul5p-000000020FD-0Lr2;
	Fri, 14 Aug 2026 06:08:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wul5l-000000020E4-45Ff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:08:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso7511175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 23:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786687712; x=1787292512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g+mH3cDkuaANlwOg+CZREKs6e+pObXwzyUt9cFT9pY=;
        b=r129Ok+zvh8rrQ2SB/D3SCBDMEGsimiCJ37OS9xH3+AyOWvTsKqu2zsCUovDfkUzYb
         JUgGKbyZHY20Y32zGfROHbLyR6qP8YGcdwiI39MTWEOplA9qZBBPibjFsU7jYBOWNPge
         CVcDBowNYxM2DKionXxas289CtKqO8LJLaabNjgg3hjJ2jS/0dilPEzwpipFTlp1RIyy
         MmQo7E55UcuAuUZ38xHmXTnrrGVIQDuxiHz/H2jFpx5rINNmHBrYx5CA+znwSww7UPi7
         sAiwB/VHuBm2IEUtz+OBqFEpdeagZETG4soZoaFFB6fxP6Kg+ct4BOAHsjO2DG1mMPQc
         A3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786687712; x=1787292512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g+mH3cDkuaANlwOg+CZREKs6e+pObXwzyUt9cFT9pY=;
        b=Y2lpR5cZYRyIFq9PfDLeP7Ax+fW1gnXl+vT1XsfQiJxIF22KiANgzokOcluDVz368f
         Q3UTNUCKcasO8+vv5VwLtFB0aE/OAzJTvr5PnP1fMRTsgZJFyNutAoAX5SLayWp43px7
         94+7w47Aufs+RpshJ0u9ToNQXs/xfHLYx6ihhpzUSw9KzBiOAvYNvZCUTURW39NnCTj5
         xMfaw57ueh524QMNRxMRpJGVUG9bBVC17u20wgixvfKY+4ATL16vUmEcxtrlkwZX4L88
         Ou0JZB+6pivOkV/G1NRaM3OfShXxP5ZNXksRg48YGSQSYYMOOxAy8hxAW8+NSMho1TLL
         CFVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro66ZYA0IMu1dofgOfnAlfgWhKq5e2orzMkTGzc2oibUBBWYbWtsuGTylU+sjq/2jzPN+Q50F9fkRm3xQHhR7vN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8jypVFAYU4qdpm9RDOPfc/yRlKh8UZ6WsIjwlKJejwrpSuljX
	jy/5NnMP0VVI6ZxJmI/2YMa3HRRHuHRIdjWoWMGGQeifEDmm4z2dLhgi+ryIe5I3LSw=
X-Gm-Gg: AR+sD11HyKVEaiAeT4wFuaq1ucBysLY/eV69nMzHpsesdIFQ4tHmVOCmof8YpWlrZKH
	jpodvI/67wW9cHfHyVbJZueJ0VOE2At0oHhQeeWsyZ+64nicjoNAegFyWCOft+L1Lz4VY6eOrP+
	38JiYHeV84TyPlIPamGtIMx5vV7cVludmCrn+W0iCxdXgJK92XibDVtn4p75RoRIh6mvPuN72Qi
	iJQHxu/b5gi+9SgNYIJFuHSBwH7HkRg5Mn95IJoHR7aBOTfpe01huc7bTjajkY5BVcRwprdZk8O
	X2qNLMaITtNd1OeZf4HCzxlACzvkp84F7h+0rtckSaNS81aUkvF2x+5RKeKu7+tEXrLyg0jbKou
	Ij3RsXTIJRblMEBYBkRsKVD7SKN7dJzZy3qNm2XJYv6DthEFCXH9I2plJgjBLjwD5ZDZBFDKXyZ
	ODbqbTGosxbJe+Kr9Dl1KSdWjPIEg94BQDnG/UlGcvAfCZFj30pUUy3knVBTVDbRlA5IIjP7tL7
	MLlmRRi+75FGA/UsgMmhJKmlQIUavhtDvRFhEUy
X-Received: by 2002:a05:600c:b99:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-49987929903mr43542515e9.2.1786687711854;
        Thu, 13 Aug 2026 23:08:31 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989ae9618sm1475095e9.13.2026.08.13.23.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:08:31 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Date: Fri, 14 Aug 2026 06:07:53 +0000
Subject: [PATCH net-next v4 1/3] net: stmmac: enable MAC rx/tx after DMA
 start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-stmmac-rx-fifo-block-v4-1-1951fd3d33b7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786687705; l=2204;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=+DFF/LlKrj++mSfnje5JBkkLPuLJ0Z7cXJdpEeYpMoI=;
 b=7dmhLiBOgS0G/4/VZZyzW/fGUA2YSWzXKrxly684D4wqxf4gGB4SxH9/fcczyumvvs0b213FX
 M51iz7my+rAD0uK9HgHPV0/GD4hJngQzMHpTB7Ew9B6G62L5EMXOxHY
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_230834_034383_25B1E02F 
X-CRM114-Status: GOOD (  15.97  )
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

When the MAC receiver is enabled before the DMA channels are started,
incoming frames fill the MTL FIFO with no DMA engine to drain it.
If the PHY/Switch is already up at this point, and there is inflow
of packets towards EMAC, the per-queue FIFO overflows within this window.

Once the FIFO is full, the MTL read controller goes idle and never
retries delivery even if the DMA comes alive later on.
This behaviour happens due to enabling the MAC RX path before
the DMA setup is ready, and any delay between these events increases
the chances of blocking the rx path permanently.

The EMAC should only accept packets after the DMAs are enabled.

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..b9d5d4aabf42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3685,9 +3685,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 
@@ -3743,6 +3740,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
@@ -7184,12 +7184,12 @@ int stmmac_xdp_open(struct net_device *dev)
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;

-- 
2.43.0


