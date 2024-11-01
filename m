Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73750E6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzBHJrheRbAs9ESwUVActksrcefHG2ISlco4X5/KYT0=; b=DFTNkqKOkq9iVCxTEHa5ikubpX
	1dI7YAyiU+ndDGHuB0DGbJozb/fTGHqLMzLA+Qlm3SD+hPC7Qvm5wiqGuwYk6ju4pn/pr2u4hOHUT
	7KOilB0Jy0b4SxyvZnMWqo2GRwmB2myWbnvmpfUCOKH9do5W7+C7m8IXhrQ9tPWGZiWvUrTJ46vd8
	EBKpkdZ6XmtfH6NR5eyvkJj2xXTgXxjRNkw+9GIN541qduoRPP7JP3NAfbgeyekPk/6Dp0WWQMpW5
	2frezJnMLvLsmv+OXpwnuZ4Cl80jAVny+bauZV0YmNikF4JO9ngl5pSfPFpQQ621lavYbsgz/kH8H
	jA6wX46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rsf-00000007Ces-3Rwl;
	Fri, 01 Nov 2024 13:40:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rl5-00000007BNO-2ktY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:32:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71ec997ad06so1620927b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467929; x=1731072729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzBHJrheRbAs9ESwUVActksrcefHG2ISlco4X5/KYT0=;
        b=KCcBx+lrQRGR394y2YvY2+r6/vio2jQDI0AT3vP7Lf4ITXXQWZLc4djTnRbyw1Gl6d
         6VegP6FuyegQ3UqWSQPXzu//CCuWgbv1JvfwcP7OkxcmCNHyHv/jLxDt0qbkmmgj84m7
         Hi3kFokvq1zq2+EUcq2WmBhsUrXyTMCHLz4s5494azndUtFRK48ARm6pvJSbxjQ7E/E/
         G+DPJvrkCXFbAY0V+fK6v0alyUl7xYI7wIwweZ23AcI7p8k2o5pSCoTRMESa5vtc6flZ
         2DuG4USguq+xShu0qaQ9L4oKwyhPRzgg8t0FU8TjIq8vOTdruwsxNPPd8HSEYeXW8uIB
         SJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467929; x=1731072729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzBHJrheRbAs9ESwUVActksrcefHG2ISlco4X5/KYT0=;
        b=f1gfgdWOtN4Zf47frfavSOd8E6AulaCCL3MYY8hIyjXGy3MW2cHOMYbC4fLT8e/BDK
         a+lZ2E2BKP5u9Ff+EIG6gNCoBwzAeYj9B2LJ4mFFFnwlZC1a5Dfr48UhthgGV7HmN2JI
         48qiHYC7fh5bJOgFnDLudcCC1c99WeR9Hkk3eR65k9RzS6tWHu7ZL3XvKW4cKGhn44Ng
         EZ7mvWG12NYraMyarUYb5T4GwpBSXNwhok7zRnoCNIXhv2p+MP259BQLAsALeFav4QLT
         rHP52TNPp70UBYofqDsCsXRfQfQXZjzB7wSAPdavDsefMN+XMUs5cKVSwRaADmNPkG4W
         Ftzg==
X-Forwarded-Encrypted: i=1; AJvYcCW/jkRcfihAgoR+YUkyUg9131yQcUd4O6UxiumN+DMs1r1uS578V7m2J/uPaN2F1yXA71wu1GoakPFgt/4USJ4M@lists.infradead.org
X-Gm-Message-State: AOJu0YwfQHibSSyMwYfcE1Hm+T5JIVuuHuwIopXGlJmHrYLf9kh6+Euy
	lYlnWfeERDhSudGHWUr/wO2kzItTT50h2XRKtSWVTGmJsCCaWyxQ
X-Google-Smtp-Source: AGHT+IEU3hlJ/JMUnrwPhP3mIJwmRERMQKQSquNIAWr9P7V8Y6tRLbHl11iI7I2jGvPtZs7xGGcABw==
X-Received: by 2002:a05:6a20:2d29:b0:1d8:a1dc:b3b with SMTP id adf61e73a8af0-1d9eec4580fmr16171427637.20.1730467929332;
        Fri, 01 Nov 2024 06:32:09 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:32:08 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v8 3/8] net: stmmac: Introduce stmmac_fpe_supported()
Date: Fri,  1 Nov 2024 21:31:30 +0800
Message-Id: <01e9cd13aedd38cb0e9a5d9875c475ce35250188.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063211_731242_E77D8D72 
X-CRM114-Status: GOOD (  16.55  )
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

A single "priv->dma_cap.fpesel" checks HW capability only,
while both HW capability and driver capability shall be
checked by later refactoring to prevent unexpected behavior
for FPE on unsupported MAC cores and keep FPE as an optional
implementation for current and new MAC cores.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c     |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h     |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 10 +++++-----
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 2792a4c6cbcd..704019e2755b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1271,7 +1271,7 @@ static int stmmac_get_mm(struct net_device *ndev,
 	unsigned long flags;
 	u32 frag_size;
 
-	if (!priv->dma_cap.fpesel)
+	if (!stmmac_fpe_supported(priv))
 		return -EOPNOTSUPP;
 
 	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 41c9cccfb5de..2b99033f9425 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -27,6 +27,11 @@
 #define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
 #define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
 
+bool stmmac_fpe_supported(struct stmmac_priv *priv)
+{
+	return priv->dma_cap.fpesel;
+}
+
 void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 			  u32 num_txq, u32 num_rxq,
 			  bool tx_enable, bool pmac_enable)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 25725fd5182f..fc9d869f9b6a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -23,6 +23,7 @@ struct stmmac_fpe_cfg;
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
 void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
+bool stmmac_fpe_supported(struct stmmac_priv *priv);
 void stmmac_fpe_init(struct stmmac_priv *priv);
 void stmmac_fpe_apply(struct stmmac_priv *priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 20bd5440abca..342edec8b507 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -978,7 +978,7 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, false);
 }
 
@@ -1092,7 +1092,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, true);
 
 	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
@@ -4040,7 +4040,7 @@ static int stmmac_release(struct net_device *dev)
 
 	stmmac_release_ptp(priv);
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
 	pm_runtime_put(priv->device);
@@ -5955,7 +5955,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		stmmac_est_irq_status(priv, priv, priv->dev,
 				      &priv->xstats, tx_cnt);
 
-	if (priv->dma_cap.fpesel) {
+	if (stmmac_fpe_supported(priv)) {
 		int status = stmmac_fpe_irq_status(priv, priv->ioaddr,
 						   priv->dev);
 
@@ -7745,7 +7745,7 @@ int stmmac_suspend(struct device *dev)
 	}
 	rtnl_unlock();
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
 	priv->speed = SPEED_UNKNOWN;
-- 
2.34.1


