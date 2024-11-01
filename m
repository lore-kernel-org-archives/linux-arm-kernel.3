Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD8E6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgCiEVGz8klvzwcS+QkKtoh9xYbmOE1HGElbvRznKis=; b=an33AVtf1MxRT4guTX0bDSXhot
	/VSQtg00tRWopl+BqWlhwuadywhuVL1YA2YWRNeBe7vfkr0n2J3MdT0KxaCLWZhmCW2BYCHSTmV5V
	LwHnVU5UD7oZcsXNrc/ktatTGOc+X28w/l2bHJer+HcBPwS4SxVX5h/errghRVWpTDR82egX3LWqE
	hXOXZieozWaIJAjvYuLLdviFPxCxwvDV+sZDJQlqK0Mph+px90msTuG7t53zlb6+JV0/Ylv7yZx7x
	+X7HaKoKlkGuL58Z22iK4WZQZjyoxYVCM5CLmdjfxkimw++L8nXu7008KPh+qD21AQZ29v4VRUjS5
	R89fS+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rr1-00000007COp-1pNK;
	Fri, 01 Nov 2024 13:38:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rkz-00000007BM2-0yDr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:32:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e5130832aso1545287b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467924; x=1731072724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgCiEVGz8klvzwcS+QkKtoh9xYbmOE1HGElbvRznKis=;
        b=iFiw1e1o7NYvqyw4ZyhdFWsRG6+wkKnso8+q4QxemuaiamUEBcpuheRXm+dgu7M9ed
         A8mWDb2SXLesvtWE/D2BJ4ZDJmI6C4jr29+ub831UUIoKiXtQSsZ/0VZc6BZ7UMX3dpb
         mHhf3REidRqbd3eH5QsKK15OSDyxgrUZ8es6N575pZLhWcpuyetAZG3QTE/q/vUd0DOX
         KayZnwUv0+ZmtdwBfovxSeACccJIabkykz0Qg9ZbA679Db0UFe+Be+hzjtZ3t8juFhp1
         cd8Y2LDZkR6rxOEjBMyNcEBlQkFKnG0kiUKcXZ8QlBcsJ6LZgs6no7fOxzIqWu3cs3+X
         Nm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467924; x=1731072724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgCiEVGz8klvzwcS+QkKtoh9xYbmOE1HGElbvRznKis=;
        b=AQv+RHtUhlxXVegqwrHMJidI7ouKzlNQ+Gc3jXJQ4nZkTvSVCzTs2WJoamRiB+xt8U
         t4CQ5ko41ATupAA1uiIEz/LOT+kUruPw5p/S3E7rjjlTkHJ1DaFmZuUyBidO4bniOJv1
         HUpqByf1qWrEGPwvPa2E1MFJCM77Ebgb+5hDMs3AwZiF6iiRrGEvvaxIXBv8TSyRACL4
         4jsAv4BxBFjilknf01UJWJm7w31B+T+W0S/Vt3r68gnRxl5mfvn4k0mQfSznD+V7I5nx
         FI1ieKROsxhrZSBRY34ubPe5twSDNN90lz8t0lxbfwP2Eb7eSJbE11LCHNFhfy1VQ8as
         BRag==
X-Forwarded-Encrypted: i=1; AJvYcCXqgN6vliJMdw/cXG4ulbo20qLvHU7ty22iHp8jzZ5Os0HUEKeecXetW2wzycYAJA30FF8Gs5CpwkuZov8EBsps@lists.infradead.org
X-Gm-Message-State: AOJu0YxHm6HAcmkY+CG5f2Bx1nTB6S0HYXr+hWqlAFPtbDhSUdAtb36Y
	j6TyIE3bQLeurv0K7gzgbDCCwbRhQ3pPwc9PyYFD6tQ8hwnB5h5O
X-Google-Smtp-Source: AGHT+IFVGLBQ7WFySkSoLUs1iM7bD8sevl+nqGIEWdG3RTihTRQmex9k6gFT4/m/RVQUWsys/PDh8Q==
X-Received: by 2002:a05:6a21:a24b:b0:1d9:ac9:3587 with SMTP id adf61e73a8af0-1dba52aad00mr4018425637.14.1730467923806;
        Fri, 01 Nov 2024 06:32:03 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:32:03 -0700 (PDT)
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
Subject: [PATCH net-next v8 2/8] net: stmmac: Rework macro definitions for gmac4 and xgmac
Date: Fri,  1 Nov 2024 21:31:29 +0800
Message-Id: <510b85288b13aa2cce5adf849291009c6f29a84a.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063205_297944_E24F5A0D 
X-CRM114-Status: GOOD (  17.39  )
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

Rename and add macro definitions to better reuse them in common code.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 77 ++++++++++---------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 8cfb5bccfa52..41c9cccfb5de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -9,23 +9,23 @@
 #include "dwmac5.h"
 #include "dwxgmac2.h"
 
-#define MAC_FPE_CTRL_STS		0x00000234
-#define TRSP				BIT(19)
-#define TVER				BIT(18)
-#define RRSP				BIT(17)
-#define RVER				BIT(16)
-#define SRSP				BIT(2)
-#define SVER				BIT(1)
-#define EFPE				BIT(0)
-
-#define MTL_FPE_CTRL_STS		0x00000c90
+#define GMAC5_MAC_FPE_CTRL_STS		0x00000234
+#define XGMAC_MAC_FPE_CTRL_STS		0x00000280
+
+#define GMAC5_MTL_FPE_CTRL_STS		0x00000c90
+#define XGMAC_MTL_FPE_CTRL_STS		0x00001090
 /* Preemption Classification */
-#define DWMAC5_PREEMPTION_CLASS		GENMASK(15, 8)
+#define FPE_MTL_PREEMPTION_CLASS	GENMASK(15, 8)
 /* Additional Fragment Size of preempted frames */
-#define DWMAC5_ADD_FRAG_SZ		GENMASK(1, 0)
+#define FPE_MTL_ADD_FRAG_SZ		GENMASK(1, 0)
 
-#define XGMAC_FPE_CTRL_STS		0x00000280
-#define XGMAC_EFPE			BIT(0)
+#define STMMAC_MAC_FPE_CTRL_STS_TRSP	BIT(19)
+#define STMMAC_MAC_FPE_CTRL_STS_TVER	BIT(18)
+#define STMMAC_MAC_FPE_CTRL_STS_RRSP	BIT(17)
+#define STMMAC_MAC_FPE_CTRL_STS_RVER	BIT(16)
+#define STMMAC_MAC_FPE_CTRL_STS_SRSP	BIT(2)
+#define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
+#define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
 
 void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 			  u32 num_txq, u32 num_rxq,
@@ -34,7 +34,7 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value;
 
 	if (tx_enable) {
-		cfg->fpe_csr = EFPE;
+		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
 		value = readl(ioaddr + GMAC_RXQ_CTRL1);
 		value &= ~GMAC_RXQCTRL_FPRQ;
 		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
@@ -42,14 +42,14 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	} else {
 		cfg->fpe_csr = 0;
 	}
-	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
+	writel(cfg->fpe_csr, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 
 	value = readl(ioaddr + GMAC_INT_EN);
 
 	if (pmac_enable) {
 		if (!(value & GMAC_INT_FPE_EN)) {
 			/* Dummy read to clear any pending masked interrupts */
-			readl(ioaddr + MAC_FPE_CTRL_STS);
+			readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 
 			value |= GMAC_INT_FPE_EN;
 		}
@@ -66,11 +66,11 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value = cfg->fpe_csr;
 
 	if (type == MPACKET_VERIFY)
-		value |= SVER;
+		value |= STMMAC_MAC_FPE_CTRL_STS_SVER;
 	else if (type == MPACKET_RESPONSE)
-		value |= SRSP;
+		value |= STMMAC_MAC_FPE_CTRL_STS_SRSP;
 
-	writel(value, ioaddr + MAC_FPE_CTRL_STS);
+	writel(value, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 }
 
 void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
@@ -112,24 +112,24 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
-	value = readl(ioaddr + MAC_FPE_CTRL_STS);
+	value = readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
 
-	if (value & TRSP) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_TRSP) {
 		status |= FPE_EVENT_TRSP;
 		netdev_dbg(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
-	if (value & TVER) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_TVER) {
 		status |= FPE_EVENT_TVER;
 		netdev_dbg(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
-	if (value & RRSP) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_RRSP) {
 		status |= FPE_EVENT_RRSP;
 		netdev_dbg(dev, "FPE: Respond mPacket is received\n");
 	}
 
-	if (value & RVER) {
+	if (value & STMMAC_MAC_FPE_CTRL_STS_RVER) {
 		status |= FPE_EVENT_RVER;
 		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
@@ -261,16 +261,17 @@ void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 
 int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
 {
-	return FIELD_GET(DWMAC5_ADD_FRAG_SZ, readl(ioaddr + MTL_FPE_CTRL_STS));
+	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ,
+			 readl(ioaddr + GMAC5_MTL_FPE_CTRL_STS));
 }
 
 void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
 {
 	u32 value;
 
-	value = readl(ioaddr + MTL_FPE_CTRL_STS);
-	writel(u32_replace_bits(value, add_frag_size, DWMAC5_ADD_FRAG_SZ),
-	       ioaddr + MTL_FPE_CTRL_STS);
+	value = readl(ioaddr + GMAC5_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(value, add_frag_size, FPE_MTL_ADD_FRAG_SZ),
+	       ioaddr + GMAC5_MTL_FPE_CTRL_STS);
 }
 
 #define ALG_ERR_MSG "TX algorithm SP is not suitable for one-to-many mapping"
@@ -321,9 +322,9 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	}
 
 update_mapping:
-	val = readl(priv->ioaddr + MTL_FPE_CTRL_STS);
-	writel(u32_replace_bits(val, preemptible_txqs, DWMAC5_PREEMPTION_CLASS),
-	       priv->ioaddr + MTL_FPE_CTRL_STS);
+	val = readl(priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
 
 	return 0;
 }
@@ -335,11 +336,11 @@ void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value;
 
 	if (!tx_enable) {
-		value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
+		value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
 
-		value &= ~XGMAC_EFPE;
+		value &= ~STMMAC_MAC_FPE_CTRL_STS_EFPE;
 
-		writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
+		writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
 		return;
 	}
 
@@ -348,7 +349,7 @@ void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
 	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
 
-	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
-	value |= XGMAC_EFPE;
-	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
+	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
+	value |= STMMAC_MAC_FPE_CTRL_STS_EFPE;
+	writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
 }
-- 
2.34.1


