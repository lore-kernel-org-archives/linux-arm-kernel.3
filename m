Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5B8D7496D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikOu3ozG9IaIbT4Vvh+Yk7rtkItRuerAPcX78kzIHYo=; b=hC34d47Ti8nqAa+m+rXkQA88l4
	TSdRL3be9zA8oat2r4Oq0PgQjJ6n4Eyt9iOIiWn9vmVMl7OEKKNRBLJSuZuPbb/tTiwSt0SYyfaLk
	rbQkO36RL1LFc4pm+bKi9stpn1uiYH14mcs1VmyY0aQWQtDzCuo2SrRh7uy98Cu9kU8vXa0yXISQQ
	ZhLqkaE9f7JBex870KetAKYNwiLAWMHw3VhwhnfKoh1wVtqrjCUgfK/5j51g2ZJpAku8TA7FkGudh
	vMQrjMAQRYEE1i5W7NJoMe3dhvCtJH7MameQU1hGOk9bu6mS8+FWJOLo2gwFlmxl4U/GrjQuBUarQ
	tseiJywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t61Su-0000000Gnjc-0Ll7;
	Wed, 30 Oct 2024 05:41:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t61Nz-0000000Gmi0-1iDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 05:36:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e983487a1so4600767b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 22:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730266610; x=1730871410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikOu3ozG9IaIbT4Vvh+Yk7rtkItRuerAPcX78kzIHYo=;
        b=isROPXXpEPyyOxDCLXnuDeautNO+0U9Tq+9Ot7cFg9w1AQ6stmXL0k5oO740Ss09oh
         A9mh34sh1+G9VPWwu55keHNrd1ZWjlcegzpdhl+oD1+Dewea+BTi06OS1Ji1JWuoyV8f
         l/NEibbz1ACG3s9Yz3LZFb/k4YV8TYkbjrghEvdpWb8F5bBViuzVM+aDwG0YtVT/jPhR
         ZUMi/nGlp7HGRSIbeFk4ePCWCnspcAx7a1oZvA9a2nr396pmVAs5cfH33/Vem/TsPE4L
         P8ANHYp8XgJruKQ+1yjdYjefHKH8apdZ05CLskIpWpsnZn2tZ/1+YemfqOavj6mWQL8x
         tgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730266610; x=1730871410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikOu3ozG9IaIbT4Vvh+Yk7rtkItRuerAPcX78kzIHYo=;
        b=m94YiBxRtgBaf11di4upb2TakpvQarFjUDZH7VJDGNE4VVPt2K+ZCy/J67qnGc8Zy9
         49b8TJiaeCWBHBF5/7apDOiTO6JYhnUJB0tL+LsE6LvFhY7YcRPgvF2rI+F6saCkOh+s
         EnhAmuYtBEqD4sew53zoVDrzrhiX9VxTbPP9zupsGE7+C+xi4Fp1sSDya7v/K7s0JjaZ
         DCvyzPTrrbrVGUtuQyOAZa4Uetsj9t0sKVMBoAA5H3pUjElAJ5wfZZsNmiBttF4fl0Vo
         obcM49j7lnCzTAv4Yzv+FQbMQwMelsODLe+H/9+XJx8aYSIHAIRQVe98uBj3lDJfBy+P
         k55Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9q6R7GIFTLJrtzZuE63kbJLQOO2RYe8uHhNG32rB40decobMbQLivIK7RsBz0kFAz/vnfKXc80tcrNjrwVFae@lists.infradead.org
X-Gm-Message-State: AOJu0YzXvnSCLGsSXbpeSV7sInTvE0/U7e0VIx8UjXKvf9/nCsXZfCMb
	ec2+EQko55Zl25/IBmYd1vCELoU/OevIlaaMsU3/VRTXtrF5yNhQ
X-Google-Smtp-Source: AGHT+IHD80oWTlxF4Q/5xsssLYxIBlstNYTuTkFssYy3xHg7FKrFaI5iVLfO9IKHJfZ5p7i6gzDlZA==
X-Received: by 2002:a05:6a00:1a88:b0:71e:8023:c718 with SMTP id d2e1a72fcca58-72062fb828bmr20719687b3a.8.1730266610068;
        Tue, 29 Oct 2024 22:36:50 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 22:36:49 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/6] net: stmmac: Rework macro definitions for gmac4 and xgmac
Date: Wed, 30 Oct 2024 13:36:11 +0800
Message-Id: <2c80c2aeddc65f335d6fdb327916ac193144750c.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730263957.git.0x1207@gmail.com>
References: <cover.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_223651_489625_7F7E68CC 
X-CRM114-Status: GOOD (  17.68  )
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
index 0a90e8f0df29..70ea475046f0 100644
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
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
@@ -185,7 +185,7 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	u32 value;
 
 	if (tx_enable) {
-		cfg->fpe_csr = EFPE;
+		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
 		value = readl(ioaddr + GMAC_RXQ_CTRL1);
 		value &= ~GMAC_RXQCTRL_FPRQ;
 		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
@@ -193,14 +193,14 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
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
@@ -221,24 +221,24 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
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
@@ -252,25 +252,26 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
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


