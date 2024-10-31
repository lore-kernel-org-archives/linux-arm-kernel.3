Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7925D74958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFGEbEEjLbbQpGlnwYzVMfTZ0wqqjjrWRQOLfRsrvcs=; b=vQocgouRk+15G6NOpqZCl5G9lH
	ElyggNtlOA7pT2h7wUH1Bju9FNvSj5dQUj0Hre2FIKVrlXQti73AytOcfEP5/KXi6izOPrtLM6oOi
	YprLl0Dl9EswJw0nYmu8WoAdUsX3ftUnd0YO4ftNQgQnsMXWydoGSSf4EXYqhN1c5hi4B6UN0SWZ+
	5TvhdkC6H4gYRPyYSPdXmwLM3y1JvbEyiwgUVS1bRRExYw1DwnxyoFHRUPby4rephrs1y5cEOszLZ
	/62Njl7lORUFTZrGNFqfzWzFXc1/tiXPXjZUiK2VNUSuvaoSJg1jHsUrIoce8l2KoWyfwx705+YMk
	YPfbaccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Uoo-00000003cae-3zab;
	Thu, 31 Oct 2024 13:02:30 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6URy-00000003YMm-11PN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:38:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-720be27db27so417718b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378333; x=1730983133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFGEbEEjLbbQpGlnwYzVMfTZ0wqqjjrWRQOLfRsrvcs=;
        b=GTB1A4EcMQk62BEFl4elLHpwBlhSLdD/tz0hAToo75Dpq7tGwgLQb5rT/peGhxORcB
         0u3k4JI+R+owa7QFrTzYKG6MnJvQu5sujxKjOeNyABtV3dviMs3LBHUJ6OO32iXHT06f
         1lp9Obsjcqf3kDtsGv4PpZhn79FgehywihCyzM8sbFLV+eqMTbLTNXWGRWQzflUJNsEq
         4L0D2mzEP4i1OTK448l1viftppu8zf0OxxtQEp/iDsHjQONSGgIvDJuH9pGaYWIR5roX
         pcjJJya92dSEfslxES2Y6EJnmeCA0fsVQKwauOGQmWZ6MHEEXBC/t5TtVUwiel7bD0LD
         /BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378333; x=1730983133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFGEbEEjLbbQpGlnwYzVMfTZ0wqqjjrWRQOLfRsrvcs=;
        b=f1kdE2Dg7sIzKJhqHTuaQydqpfFOU89X49FGSm4i1zRzyT6ZxnJzAzX4yUkRAgcb9Q
         9tZmmWLVKvp5o1oblsyp4hCGE1DL9rT83TsPvirLdsrkrdedFO4E5trkj75DIa6xq3FA
         k0BPHxWm51pGVcqjpRk7vZCBwflRZ/05F9xfOymw7OdCGa5vurTUm0Acj8lpH+oHP8Qe
         GS4XIZUsl7dEJeDBzLKCG/hTul7NE2lr1PZZqRPViTWHSHVXniBBeox18zMcB3CXqAp+
         MswpLCf1mShzQ96Mk3oBkeurODyHADfGmv3olWicbBr+3nlX34WbR0WBg4vWqHadb7e/
         B6yw==
X-Forwarded-Encrypted: i=1; AJvYcCWo42wiXg6x5P5pB2mJ3vmCR4W4M3mw81S9OI8u+LdiD+r8B61fx3qtbZajU7zmktOkO9lezZ+Qb5sMwCDItzVl@lists.infradead.org
X-Gm-Message-State: AOJu0YwW6wRjNtqTIDYeEESEmuWzXqXcdWRoRjtnJgnSPU21iwmB44EJ
	L5glu1xfmLEbTHW9Mnk6PZqxtB0I5wXOvE5kpM2L9pXhlM/Msvzj
X-Google-Smtp-Source: AGHT+IEZxQHxPYwUn+a4vwc02ndfamOj2UcHfNlIlB+PjdVN/65q2Qw46vrTi7Bee/Ggg5dJokSHdQ==
X-Received: by 2002:a05:6a20:2d29:b0:1d8:a1dc:b3b with SMTP id adf61e73a8af0-1d9eec4580fmr9881706637.20.1730378333058;
        Thu, 31 Oct 2024 05:38:53 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:38:51 -0700 (PDT)
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
Subject: [PATCH net-next v7 4/8] net: stmmac: Introduce stmmac_fpe_supported()
Date: Thu, 31 Oct 2024 20:37:58 +0800
Message-Id: <917f3868cdaf8ce1d45239117c3ea1c8c45ba56c.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053854_368648_8A813349 
X-CRM114-Status: GOOD (  16.29  )
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

Call stmmac_fpe_supported() to check both HW capability and
driver capability to keep FPE as an optional implementation
for current and new MAC cores.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c     | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h     |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 10 +++++-----
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f2783f7c46f3..1d77389ce953 100644
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
index 818741579904..fe0877ef5f4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -42,6 +42,12 @@ struct stmmac_fpe_reg {
 	const u32 int_en_bit;		/* Frame Preemption Interrupt Enable */
 };
 
+bool stmmac_fpe_supported(struct stmmac_priv *priv)
+{
+	return priv->dma_cap.fpesel && priv->fpe_cfg.reg &&
+		priv->hw->mac->fpe_map_preemption_class;
+}
+
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
@@ -173,6 +179,10 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
 	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
 	spin_lock_init(&priv->fpe_cfg.lock);
+
+	if ((!priv->fpe_cfg.reg || !priv->hw->mac->fpe_map_preemption_class) &&
+	    priv->dma_cap.fpesel)
+		dev_info(priv->device, "FPE on this MAC is not supported by driver.\n");
 }
 
 void stmmac_fpe_apply(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 15fcb9ef1a97..2f8bceaf7a0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -16,6 +16,7 @@ struct stmmac_priv;
 struct stmmac_fpe_cfg;
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
+bool stmmac_fpe_supported(struct stmmac_priv *priv);
 void stmmac_fpe_init(struct stmmac_priv *priv);
 void stmmac_fpe_apply(struct stmmac_priv *priv);
 void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9fcf2df099ec..883b4b814125 100644
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
@@ -5943,7 +5943,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		stmmac_est_irq_status(priv, priv, priv->dev,
 				      &priv->xstats, tx_cnt);
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_irq_status(priv);
 
 	/* To handle GMAC own interrupts */
@@ -7729,7 +7729,7 @@ int stmmac_suspend(struct device *dev)
 	}
 	rtnl_unlock();
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
 	priv->speed = SPEED_UNKNOWN;
-- 
2.34.1


