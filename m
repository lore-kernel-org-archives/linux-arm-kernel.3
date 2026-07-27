Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BA7C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZTsSQ/Qdqv/aRMjcPYSTqUT2GFSJ11xQmUiZl5tGlPA=; b=WPxa/BwNBGDzY5AVsUgtI97ljH
	c3mmSMt9hS2evmPHKOMmhgitRIAUmQcszL0/qn4U5f+G/f6aH/PNybwq+ZwW130/2xcIo8X9C/VLp
	5V9MnDd74F4HqcE1MlupxUv3lz7EtaZwy8EcMufE/nENxHn5g/c502dPmtSWVuWIMDk6TKY8aNcDC
	jAWkuWu3TAJpxlMxhv894Hb4sD9lImmcDHInpCchTvspqE98GqZeG+S/35NUVpcySz/X01ppRGyD/
	MZPdX2zwPRZImCy4PGlmUpyWcOP9UfS04kn8ssiIR2Hfo30S9WLVT0DV82MEsctx+ysNti+C3wsk5
	7fnFCqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woEce-000000020NK-1FD1;
	Mon, 27 Jul 2026 06:15:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woEcb-000000020Mv-1Djq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 06:15:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-472326ca506so1474482f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785132927; x=1785737727; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZTsSQ/Qdqv/aRMjcPYSTqUT2GFSJ11xQmUiZl5tGlPA=;
        b=CuJJHkFerdiMzMiSx9Dq+HOh8EBcdTkMMl1oQkm8I1wUNPJ0/SDP3/6NGG+ZbT1jBa
         LbW6CEsGoYyZ8r+rntlqDrWKOROuID9oS5AZus732HETWo8tpBpUuBEEv58ETFzxSigU
         x3E5BLIQm7BV0vG7m9I4t9lTsJBhIcr3Z9IaITNCs9hIyhOx6bSF7wtY/7xVot6IXeRh
         phf0WyaD+ovtow8nBzHiFijGsKGrCGgk0QCR2BO3v0cnh+tjAZsm7PrrHkG3v1Yo2T9U
         qUI94rD90owoNoU5D9AymE0e7Vt7ovbWpHAZUuOnT3KoKhYv6bnm+V0KPQWotJSZnMje
         nJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785132927; x=1785737727;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZTsSQ/Qdqv/aRMjcPYSTqUT2GFSJ11xQmUiZl5tGlPA=;
        b=Pnw8qC1aQf1PvvIRIXfE5GYjl6OUuWf+0LFvSCKJ65gZfwEtyOtH+yZ3a5mR8aXv91
         pccyFCVdYPNbHok/13I5llULmDgbBDvOD+j5520kfB2oKwYnt74qtRy11LUPfEZIxsKe
         jWPmF5b9rNxZJqxiRBpxYZJrcd0Jrv6lUr4VASNjdPOHNIzYgKhDT/Z3WD2BDeAx9kos
         18LYP5BvbWtbd7G9718bcrQH9x2D6Sew1osPPQQGSbxhXi3BpE3xi6bTeBKfPYdm8Q5X
         F8XQgwp+Q6+yylORATWEmiwMNRYVj/oIAigkLOFg2YRxT1THQk+NhUWuhtON9aUMXusu
         42mA==
X-Forwarded-Encrypted: i=1; AHgh+RqY2EfX51snR2U5yhVsmyT2klYLb6EJ2hS1KeUDt9pXPN8ByuaS4SIZMMOGqQOcLgqnT5eQa/8heLaBOWgouNcV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4KWCgGaNrSI4BmBWlVKPe1tWnTlqjnaKel9ahKFqv0ykuY9dg
	SB55JQa8TvV7ElNNorFFOsUjw0X3+KJPLi6z79lLpIm6u3fyNGf1VDLF
X-Gm-Gg: AR+sD13YuNsfYHm1B/jH/jVRydkRZuhOHuZhMMCiQ8xJZKnfhk8hWjvz47tzMTFhL8h
	7UKcFiF/+uYnyW4mBVy8b6OfwDlsrt3XeopoT9RTEwhM0V/3z0D/523IS6ZASDM1pbeMb5K0Mwg
	mw1mxYb5VPuTqQbkhpxYSdo1m2PfTmfvK6VMI0TPvmcxA1ro10lu4Q22EH/iO51IDLtZldMJGaQ
	5jEXnVGy/3SBKqCc6JZa5u/mCYmu0pUAUJP0xfFVi9edNT4ebaUXCEWiF+6yQzJTB97whgYagZ8
	xaX2CVOZiJ4MiaadxhrMgUgfCpvUNqS3MNpcqCX7oXO/Z9vsFa6B3inZvEzHrbq11Hibrjz3+TW
	uEQ9uuBRgpN1nvc7af5DTLrlh4jFTkbasR+/wm98IBKrrb9iL81HBh+z7sH/s+OYR2Vha6n0Kd/
	WwKrDCk+0iZI7XZNsqEN6XeeZFHNpT1gfXZZlp8AGTswfivYGFs0ZmBA==
X-Received: by 2002:a05:6000:41de:b0:47f:87f5:ed32 with SMTP id ffacd0b85a97d-47f9fe9ffbemr9378789f8f.46.1785132927044;
        Sun, 26 Jul 2026 23:15:27 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm47003657f8f.11.2026.07.26.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:15:26 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Date: Mon, 27 Jul 2026 06:14:52 +0000
Subject: [PATCH v2] net: stmmac: enable MAC rx/tx after DMA start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFv3ZmoC/4WNQQ6DIBBFr2Jm3WmAKpWueo/GBVDQSUUaMMbGe
 PdSL9Dle8l/f4PsErkMt2qD5BbKFKcC4lSBHfTUO6RnYRBMSHYVEvMcgraYVvTkI5ox2hc637T
 KXlqvpIEyfSfnaT2yj67wQHmO6XO8LPxn/wQXjhzrRhumaiMtE/c+aBrPNgbo9n3/AkYT7Tq4A
 AAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785132924; l=3209;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=fLe9G039vQ6hRWQL5QYu0XMthfFe2VADtTrit1z6nOM=;
 b=DcSjAoQAD9vywawezrGp7qHePtKZQSTza2D9e2SpMA+jhDf9Xl0+KFq73N4F/KHdY3sU6xL9X
 0szs6JBtPjJDtn1GUU9CavqAR482V5sLC1Zv8eT6dNjbovap4EFouwS
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_231529_389421_A360D69A 
X-CRM114-Status: GOOD (  16.67  )
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
Similarly, the teardown should ensure the MAC rx/tx is stopped before
DMA engine is stopped.

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
Changes in v2:
- Corrected the ordering in teardown for xdp at stmmac_xdp_release().
- Link to v1: https://lore.kernel.org/r/20260726-stmmac-rx-fifo-block-v1-1-45ab094b6c02@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea..92864d7df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3692,9 +3692,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 
@@ -3750,6 +3747,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
@@ -7109,15 +7109,15 @@ void stmmac_xdp_release(struct net_device *dev)
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
+	/* Disable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, false);
+
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
 
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
-	/* Disable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, false);
-
 	/* set trans_start so we don't get spurious
 	 * watchdogs during reset
 	 */
@@ -7189,12 +7189,12 @@ int stmmac_xdp_open(struct net_device *dev)
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

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260726-stmmac-rx-fifo-block-ef589c38f96b

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>


