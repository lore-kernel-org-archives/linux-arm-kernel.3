Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4046D74963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C65iSuG0SeBMCqYH1NdUht+kybu/VrrIgZJP1m5UYP0=; b=u1NU1UUW8SHuc0RYruF80jrZo+
	jCn/PbceqphUeZO0bOnq8fscUw+S8chmBdQdH758af5maNthVIIpB1w5Ro31pPKy5UceBWVj7Bnkc
	iw4sRL2k1N/FFMmUMZN5bepQRW4R1PPa7kH5cdmwdyQeeVAKTo6Rw8/bgHBuU5OLEECeQh7B9GWXT
	JLoZr9EqW2zT8ALosLn3FgFS0szOmM317Jp+8aNRhN6Tr5hxLbWcqCYrvVWudzzoSCNeFI/1vHwPn
	pl+UWhqUyfT6gIExlx7VPjW5J94cSAne5r/bf/uQpcsgb3hnIzMFwjz36Ir2vhfgz0/BvgbN7k02Z
	j363cFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t61UV-0000000GoEj-0gwX;
	Wed, 30 Oct 2024 05:43:35 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t61O6-0000000Gmk6-0q8L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 05:37:00 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-71806621d42so3592157a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 22:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730266617; x=1730871417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C65iSuG0SeBMCqYH1NdUht+kybu/VrrIgZJP1m5UYP0=;
        b=XZ7YnhjtiEo30Kvc4AMi8mDLFzIDc5Vhmu+eOMEO21+MTVNHePZQpaHr05TVGw83+5
         MyoCrXz9nFYJl13GpspSqBoRHkhIypX0YksKYAOCyFai4epXkNZWHHe+k3SsOatkS4bO
         kAUJ7rr/pLGQyo719D4wwI0RvdY2oOR+nPi+PbncXmxyL8C29I/axA+0Euqr1L2QQIDY
         XfGyDMwS9pGgeF2TZXnfU0BdEyNy5cKEz9BXC13pKaeaVDznc1nuo+eNGnkCQiB6BwPk
         BTh/Ih+qOXK3gGaeAUwbXTE6xtbHUrhWVVnRyWhbXenr8AXgwqMFIlRQ1Q9biquyKCi6
         qBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730266617; x=1730871417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C65iSuG0SeBMCqYH1NdUht+kybu/VrrIgZJP1m5UYP0=;
        b=itWsm6rphiojI88O0m9zWZGTJqMAS4yBWURZjmPPxMcpBReOg/apIRdMfYrhdm7ODu
         IfFcKjzG6F1JuzZiLyQ3uxJDvF3xZwNGGpoHs6KBz3+TyRBLsnzSl7cbc2GP4O9LcwSf
         iK4i5CLvx8fI7drIrdTEK/gu7lC1m130JeoO5OfyKi2oaS62thdURzL0dlkHCabiU9Hd
         yKGcE35L5R7nda5xw7sB1HCFYUElFPcaEn5is2gB7QF0DgNwAmAxnDkgNMmYY0RhbXe7
         MdJohVI1RiWddORqy2902cA+bOED7w7CF7LYCrXUtQKrKSEvXtnw2dQrpV8raECHLpzg
         IjIw==
X-Forwarded-Encrypted: i=1; AJvYcCWS+6Mxt42MK3fWlEK0Sb3AI18DLpSk2ar1xIPb4ZcXgpWBfIUhlSH8VATjrYlWPQZlTiroqtql0ngoKbzna2qy@lists.infradead.org
X-Gm-Message-State: AOJu0YyjOC7DBH0KycDY5MDm6VDdB+bfy1Uw9Gv6GKeV6XNFeLGWaXDF
	it5juRM2Wa+mShBDF6v8Y9MgsSZa1M9BOxoLgtEawc/64nebf5nL
X-Google-Smtp-Source: AGHT+IE38kB/Ir1s7cp7WJpA7dOBHXQKVQHXV8GEOD4QeBtSMgRtX5ubCsXdrSOPbyC24E7Cq3anCw==
X-Received: by 2002:a05:6830:2648:b0:718:1957:4b88 with SMTP id 46e09a7af769-71867f1b2f8mr14205690a34.2.1730266616795;
        Tue, 29 Oct 2024 22:36:56 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 22:36:56 -0700 (PDT)
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
Subject: [PATCH net-next v6 3/6] net: stmmac: Refactor FPE functions to generic version
Date: Wed, 30 Oct 2024 13:36:12 +0800
Message-Id: <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730263957.git.0x1207@gmail.com>
References: <cover.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_223658_277182_52B28EEC 
X-CRM114-Status: GOOD (  20.41  )
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

FPE implementation for DWMAC4 and DWXGMAC differs only for:
1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
3) Bit offset of Frame Preemption Interrupt Enable

Refactor FPE functions to avoid code duplication.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |   1 -
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  10 --
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   2 -
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 155 +++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  23 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  16 +-
 11 files changed, 110 insertions(+), 133 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 28fff6cab812..0c050324997a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -69,7 +69,6 @@
 #define GMAC_RXQCTRL_TACPQE		BIT(21)
 #define GMAC_RXQCTRL_TACPQE_SHIFT	21
 #define GMAC_RXQCTRL_FPRQ		GENMASK(26, 24)
-#define GMAC_RXQCTRL_FPRQ_SHIFT		24
 
 /* MAC Packet Filtering */
 #define GMAC_PACKET_FILTER_PR		BIT(0)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 4d217926820a..c25781874aa7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1262,11 +1262,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_arp_offload = dwmac4_set_arp_offload,
 	.config_l3_filter = dwmac4_config_l3_filter,
 	.config_l4_filter = dwmac4_config_l4_filter,
-	.fpe_configure = dwmac5_fpe_configure,
-	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
-	.fpe_irq_status = dwmac5_fpe_irq_status,
-	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
-	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
 	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
@@ -1317,11 +1312,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_arp_offload = dwmac4_set_arp_offload,
 	.config_l3_filter = dwmac4_config_l3_filter,
 	.config_l4_filter = dwmac4_config_l4_filter,
-	.fpe_configure = dwmac5_fpe_configure,
-	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
-	.fpe_irq_status = dwmac5_fpe_irq_status,
-	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
-	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
 	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 917796293c26..efd47db05dbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -85,7 +85,6 @@
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
 #define XGMAC_RQ			GENMASK(7, 4)
-#define XGMAC_RQ_SHIFT			4
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
@@ -96,6 +95,7 @@
 #define XGMAC_LPIIS			BIT(5)
 #define XGMAC_PMTIS			BIT(4)
 #define XGMAC_INT_EN			0x000000b4
+#define XGMAC_FPEIE			BIT(15)
 #define XGMAC_TSIE			BIT(12)
 #define XGMAC_LPIIE			BIT(5)
 #define XGMAC_PMTIE			BIT(4)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 111ba5a524ed..de6ffda31a80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1545,7 +1545,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
-	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1602,7 +1601,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
-	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 88cce28b2f98..cfc50289aed6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -6,6 +6,7 @@
 
 #include "common.h"
 #include "stmmac.h"
+#include "stmmac_fpe.h"
 #include "stmmac_ptp.h"
 #include "stmmac_est.h"
 
@@ -185,6 +186,7 @@ static const struct stmmac_hwif_entry {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
 			.est_off = EST_GMAC4_OFFSET,
+			.fpe_reg = &dwmac5_fpe_reg,
 		},
 		.desc = &dwmac4_desc_ops,
 		.dma = &dwmac4_dma_ops,
@@ -205,6 +207,7 @@ static const struct stmmac_hwif_entry {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
 			.est_off = EST_GMAC4_OFFSET,
+			.fpe_reg = &dwmac5_fpe_reg,
 		},
 		.desc = &dwmac4_desc_ops,
 		.dma = &dwmac410_dma_ops,
@@ -225,6 +228,7 @@ static const struct stmmac_hwif_entry {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
 			.est_off = EST_GMAC4_OFFSET,
+			.fpe_reg = &dwmac5_fpe_reg,
 		},
 		.desc = &dwmac4_desc_ops,
 		.dma = &dwmac410_dma_ops,
@@ -246,6 +250,7 @@ static const struct stmmac_hwif_entry {
 			.ptp_off = PTP_XGMAC_OFFSET,
 			.mmc_off = MMC_XGMAC_OFFSET,
 			.est_off = EST_XGMAC_OFFSET,
+			.fpe_reg = &dwxgmac3_fpe_reg,
 		},
 		.desc = &dwxgmac210_desc_ops,
 		.dma = &dwxgmac210_dma_ops,
@@ -267,6 +272,7 @@ static const struct stmmac_hwif_entry {
 			.ptp_off = PTP_XGMAC_OFFSET,
 			.mmc_off = MMC_XGMAC_OFFSET,
 			.est_off = EST_XGMAC_OFFSET,
+			.fpe_reg = &dwxgmac3_fpe_reg,
 		},
 		.desc = &dwxgmac210_desc_ops,
 		.dma = &dwxgmac210_dma_ops,
@@ -353,6 +359,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		mac->est = mac->est ? : entry->est;
 
 		priv->hw = mac;
+		priv->fpe_cfg.reg = entry->regs.fpe_reg;
 		priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
 		priv->mmcaddr = priv->ioaddr + entry->regs.mmc_off;
 		if (entry->est)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index d5a9f01ecac5..64f8ed67dcc4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -420,15 +420,6 @@ struct stmmac_ops {
 				bool en, bool udp, bool sa, bool inv,
 				u32 match);
 	void (*set_arp_offload)(struct mac_device_info *hw, bool en, u32 addr);
-	void (*fpe_configure)(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			      u32 num_txq, u32 num_rxq,
-			      bool tx_enable, bool pmac_enable);
-	void (*fpe_send_mpacket)(void __iomem *ioaddr,
-				 struct stmmac_fpe_cfg *cfg,
-				 enum stmmac_mpacket_type type);
-	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
-	int (*fpe_get_add_frag_size)(const void __iomem *ioaddr);
-	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
 	int (*fpe_map_preemption_class)(struct net_device *ndev,
 					struct netlink_ext_ack *extack,
 					u32 pclass);
@@ -530,16 +521,6 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, config_l4_filter, __args)
 #define stmmac_set_arp_offload(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_arp_offload, __args)
-#define stmmac_fpe_configure(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_configure, __args)
-#define stmmac_fpe_send_mpacket(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_send_mpacket, __args)
-#define stmmac_fpe_irq_status(__priv, __args...) \
-	stmmac_do_callback(__priv, mac, fpe_irq_status, __args)
-#define stmmac_fpe_get_add_frag_size(__priv, __args...) \
-	stmmac_do_callback(__priv, mac, fpe_get_add_frag_size, __args)
-#define stmmac_fpe_set_add_frag_size(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_set_add_frag_size, __args)
 #define stmmac_fpe_map_preemption_class(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
 
@@ -678,6 +659,7 @@ struct stmmac_est_ops {
 	stmmac_do_void_callback(__priv, est, irq_status, __args)
 
 struct stmmac_regs_off {
+	const struct stmmac_fpe_reg *fpe_reg;
 	u32 ptp_off;
 	u32 mmc_off;
 	u32 est_off;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 816b979e72cc..1d86439b8a14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -152,6 +152,7 @@ struct stmmac_fpe_cfg {
 	 */
 	spinlock_t lock;
 
+	const struct stmmac_fpe_reg *reg;
 	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
 
 	enum ethtool_mm_verify_status status;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 2792a4c6cbcd..1d77389ce953 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1271,7 +1271,7 @@ static int stmmac_get_mm(struct net_device *ndev,
 	unsigned long flags;
 	u32 frag_size;
 
-	if (!priv->dma_cap.fpesel)
+	if (!stmmac_fpe_supported(priv))
 		return -EOPNOTSUPP;
 
 	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
@@ -1294,7 +1294,7 @@ static int stmmac_get_mm(struct net_device *ndev,
 	else
 		state->tx_active = false;
 
-	frag_size = stmmac_fpe_get_add_frag_size(priv, priv->ioaddr);
+	frag_size = stmmac_fpe_get_add_frag_size(priv);
 	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
 
 	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
@@ -1329,7 +1329,7 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
 	if (!cfg->verify_enabled)
 		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 
-	stmmac_fpe_set_add_frag_size(priv, priv->ioaddr, frag_size);
+	stmmac_fpe_set_add_frag_size(priv, frag_size);
 	stmmac_fpe_apply(priv);
 
 	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 70ea475046f0..ee86658f77b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -27,6 +27,20 @@
 #define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
 #define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
 
+struct stmmac_fpe_reg {
+	const u32 mac_fpe_reg;		/* offset of MAC_FPE_CTRL_STS */
+	const u32 mtl_fpe_reg;		/* offset of MTL_FPE_CTRL_STS */
+	const u32 rxq_ctrl1_reg;	/* offset of MAC_RxQ_Ctrl1 */
+	const u32 fprq_mask;		/* Frame Preemption Residue Queue */
+	const u32 int_en_reg;		/* offset of MAC_Interrupt_Enable */
+	const u32 int_en_bit;		/* Frame Preemption Interrupt Enable */
+};
+
+bool stmmac_fpe_supported(struct stmmac_priv *priv)
+{
+	return (priv->dma_cap.fpesel && priv->fpe_cfg.reg);
+}
+
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
@@ -38,25 +52,19 @@ void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 
 	if (is_up && fpe_cfg->pmac_enabled) {
 		/* VERIFY process requires pmac enabled when NIC comes up */
-		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
-				     priv->plat->tx_queues_to_use,
-				     priv->plat->rx_queues_to_use,
-				     false, true);
+		stmmac_fpe_configure(priv, false, true);
 
 		/* New link => maybe new partner => new verification process */
 		stmmac_fpe_apply(priv);
 	} else {
 		/* No link => turn off EFPE */
-		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
-				     priv->plat->tx_queues_to_use,
-				     priv->plat->rx_queues_to_use,
-				     false, false);
+		stmmac_fpe_configure(priv, false, false);
 	}
 
 	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
 }
 
-void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
+static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
 
@@ -68,8 +76,7 @@ void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
 
 	/* LP has sent verify mPacket */
 	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
-		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
-					MPACKET_RESPONSE);
+		stmmac_fpe_send_mpacket(priv, MPACKET_RESPONSE);
 
 	/* Local has sent verify mPacket */
 	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER &&
@@ -107,8 +114,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
 	case ETHTOOL_MM_VERIFY_STATUS_INITIAL:
 	case ETHTOOL_MM_VERIFY_STATUS_VERIFYING:
 		if (fpe_cfg->verify_retries != 0) {
-			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						fpe_cfg, MPACKET_VERIFY);
+			stmmac_fpe_send_mpacket(priv, MPACKET_VERIFY);
 			rearm = true;
 		} else {
 			fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
@@ -118,10 +124,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
 		break;
 
 	case ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED:
-		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
-				     priv->plat->tx_queues_to_use,
-				     priv->plat->rx_queues_to_use,
-				     true, true);
+		stmmac_fpe_configure(priv, true, true);
 		break;
 
 	default:
@@ -154,6 +157,9 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
 	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
 	spin_lock_init(&priv->fpe_cfg.lock);
+
+	if (priv->dma_cap.fpesel && !priv->fpe_cfg.reg)
+		dev_info(priv->device, "FPE on this MAC is not supported by driver.\n");
 }
 
 void stmmac_fpe_apply(struct stmmac_priv *priv)
@@ -164,10 +170,7 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
 	 * Otherwise let the timer code do it.
 	 */
 	if (!fpe_cfg->verify_enabled) {
-		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
-				     priv->plat->tx_queues_to_use,
-				     priv->plat->rx_queues_to_use,
-				     fpe_cfg->tx_enabled,
+		stmmac_fpe_configure(priv, fpe_cfg->tx_enabled,
 				     fpe_cfg->pmac_enabled);
 	} else {
 		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
@@ -178,50 +181,55 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
 	}
 }
 
-void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			  u32 num_txq, u32 num_rxq,
-			  bool tx_enable, bool pmac_enable)
+void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
+			  bool pmac_enable)
 {
+	struct stmmac_fpe_cfg *cfg = &priv->fpe_cfg;
+	const struct stmmac_fpe_reg *reg = cfg->reg;
+	u32 num_rxq = priv->plat->rx_queues_to_use;
+	void __iomem *ioaddr = priv->ioaddr;
 	u32 value;
 
 	if (tx_enable) {
 		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
-		value = readl(ioaddr + GMAC_RXQ_CTRL1);
-		value &= ~GMAC_RXQCTRL_FPRQ;
-		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
-		writel(value, ioaddr + GMAC_RXQ_CTRL1);
+		value = readl(ioaddr + reg->rxq_ctrl1_reg);
+		value &= ~reg->fprq_mask;
+		/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
+		value |= (num_rxq - 1) << __ffs(reg->fprq_mask);
+		writel(value, ioaddr + reg->rxq_ctrl1_reg);
 	} else {
 		cfg->fpe_csr = 0;
 	}
-	writel(cfg->fpe_csr, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	writel(cfg->fpe_csr, ioaddr + reg->mac_fpe_reg);
 
-	value = readl(ioaddr + GMAC_INT_EN);
+	value = readl(ioaddr + reg->int_en_reg);
 
 	if (pmac_enable) {
-		if (!(value & GMAC_INT_FPE_EN)) {
+		if (!(value & reg->int_en_bit)) {
 			/* Dummy read to clear any pending masked interrupts */
-			readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+			readl(ioaddr + reg->mac_fpe_reg);
 
-			value |= GMAC_INT_FPE_EN;
+			value |= reg->int_en_bit;
 		}
 	} else {
-		value &= ~GMAC_INT_FPE_EN;
+		value &= ~reg->int_en_bit;
 	}
 
-	writel(value, ioaddr + GMAC_INT_EN);
+	writel(value, ioaddr + reg->int_en_reg);
 }
 
-int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+void stmmac_fpe_irq_status(struct stmmac_priv *priv)
 {
+	const struct stmmac_fpe_reg *reg = priv->fpe_cfg.reg;
+	void __iomem *ioaddr = priv->ioaddr;
+	struct net_device *dev = priv->dev;
+	int status = FPE_EVENT_UNKNOWN;
 	u32 value;
-	int status;
-
-	status = FPE_EVENT_UNKNOWN;
 
 	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
-	value = readl(ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	value = readl(ioaddr + reg->mac_fpe_reg);
 
 	if (value & STMMAC_MAC_FPE_CTRL_STS_TRSP) {
 		status |= FPE_EVENT_TRSP;
@@ -243,35 +251,41 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
 
-	return status;
+	stmmac_fpe_event_status(priv, status);
 }
 
-void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
+void stmmac_fpe_send_mpacket(struct stmmac_priv *priv,
 			     enum stmmac_mpacket_type type)
 {
-	u32 value = cfg->fpe_csr;
+	const struct stmmac_fpe_reg *reg = priv->fpe_cfg.reg;
+	void __iomem *ioaddr = priv->ioaddr;
+	u32 value = priv->fpe_cfg.fpe_csr;
 
 	if (type == MPACKET_VERIFY)
 		value |= STMMAC_MAC_FPE_CTRL_STS_SVER;
 	else if (type == MPACKET_RESPONSE)
 		value |= STMMAC_MAC_FPE_CTRL_STS_SRSP;
 
-	writel(value, ioaddr + GMAC5_MAC_FPE_CTRL_STS);
+	writel(value, ioaddr + reg->mac_fpe_reg);
 }
 
-int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
+int stmmac_fpe_get_add_frag_size(struct stmmac_priv *priv)
 {
-	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ,
-			 readl(ioaddr + GMAC5_MTL_FPE_CTRL_STS));
+	const struct stmmac_fpe_reg *reg = priv->fpe_cfg.reg;
+	void __iomem *ioaddr = priv->ioaddr;
+
+	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ, readl(ioaddr + reg->mtl_fpe_reg));
 }
 
-void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
+void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size)
 {
+	const struct stmmac_fpe_reg *reg = priv->fpe_cfg.reg;
+	void __iomem *ioaddr = priv->ioaddr;
 	u32 value;
 
-	value = readl(ioaddr + GMAC5_MTL_FPE_CTRL_STS);
+	value = readl(ioaddr + reg->mtl_fpe_reg);
 	writel(u32_replace_bits(value, add_frag_size, FPE_MTL_ADD_FRAG_SZ),
-	       ioaddr + GMAC5_MTL_FPE_CTRL_STS);
+	       ioaddr + reg->mtl_fpe_reg);
 }
 
 #define ALG_ERR_MSG "TX algorithm SP is not suitable for one-to-many mapping"
@@ -329,27 +343,20 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	return 0;
 }
 
-void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			    u32 num_txq, u32 num_rxq,
-			    bool tx_enable, bool pmac_enable)
-{
-	u32 value;
-
-	if (!tx_enable) {
-		value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-
-		value &= ~STMMAC_MAC_FPE_CTRL_STS_EFPE;
-
-		writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-		return;
-	}
-
-	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
-	value &= ~XGMAC_RQ;
-	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
-	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
-
-	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-	value |= STMMAC_MAC_FPE_CTRL_STS_EFPE;
-	writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-}
+const struct stmmac_fpe_reg dwmac5_fpe_reg = {
+	.mac_fpe_reg = GMAC5_MAC_FPE_CTRL_STS,
+	.mtl_fpe_reg = GMAC5_MTL_FPE_CTRL_STS,
+	.rxq_ctrl1_reg = GMAC_RXQ_CTRL1,
+	.fprq_mask = GMAC_RXQCTRL_FPRQ,
+	.int_en_reg = GMAC_INT_EN,
+	.int_en_bit = GMAC_INT_FPE_EN,
+};
+
+const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
+	.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
+	.mtl_fpe_reg = XGMAC_MTL_FPE_CTRL_STS,
+	.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
+	.fprq_mask = XGMAC_RQ,
+	.int_en_reg = XGMAC_INT_EN,
+	.int_en_bit = XGMAC_FPEIE,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 25725fd5182f..00e616d7cbf1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -22,24 +22,21 @@ struct stmmac_priv;
 struct stmmac_fpe_cfg;
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
-void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
+bool stmmac_fpe_supported(struct stmmac_priv *priv);
 void stmmac_fpe_init(struct stmmac_priv *priv);
 void stmmac_fpe_apply(struct stmmac_priv *priv);
-
-void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			  u32 num_txq, u32 num_rxq,
-			  bool tx_enable, bool pmac_enable);
-void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
-			     struct stmmac_fpe_cfg *cfg,
+void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
+			  bool pmac_enable);
+void stmmac_fpe_send_mpacket(struct stmmac_priv *priv,
 			     enum stmmac_mpacket_type type);
-int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
-int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
-void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
+void stmmac_fpe_irq_status(struct stmmac_priv *priv);
+int stmmac_fpe_get_add_frag_size(struct stmmac_priv *priv);
+void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
+
 int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 				    struct netlink_ext_ack *extack, u32 pclass);
 
-void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			    u32 num_txq, u32 num_rxq,
-			    bool tx_enable, bool pmac_enable);
+extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
+extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
 
 #endif
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ab547430a717..883b4b814125 100644
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
@@ -5943,12 +5943,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		stmmac_est_irq_status(priv, priv, priv->dev,
 				      &priv->xstats, tx_cnt);
 
-	if (priv->dma_cap.fpesel) {
-		int status = stmmac_fpe_irq_status(priv, priv->ioaddr,
-						   priv->dev);
-
-		stmmac_fpe_event_status(priv, status);
-	}
+	if (stmmac_fpe_supported(priv))
+		stmmac_fpe_irq_status(priv);
 
 	/* To handle GMAC own interrupts */
 	if ((priv->plat->has_gmac) || xmac) {
@@ -7733,7 +7729,7 @@ int stmmac_suspend(struct device *dev)
 	}
 	rtnl_unlock();
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
 	priv->speed = SPEED_UNKNOWN;
-- 
2.34.1


