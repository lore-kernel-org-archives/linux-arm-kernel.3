Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B5D74963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rMTL6l4+ePH78ifD4HQ4rzCV1XSwWL49wAuSNSzsWs=; b=isx2vK1MhmPtPoFNeMEhmk7+Qg
	VR9eNJlQFNhC935bnPDJvNFoHgTCyhLFCP41z/CsnvfhPDiwuL+YvH4c7xarwN0WRY8SY5yD61At7
	kJ0XAM/TgsVpzJJd9S+KehLHq4Xz6csi0inbpt/SW1wk9UWzG3sGyJKX8Lv8m4vGfrx1hMqAz4tZB
	M5Wd1YKCEB+uJjV4Y8a6k4XKgtefi9yByRVsoqinOL90ROnZsuhqwCaXN/hMHEErWBOPPNv84j4z4
	VoaL+h9XvBXc7Ta7TRVxhHqM2R4SE7fY2VMwJyfi371Zp93qr40PMagboUXCvfe6ghNe+NcH9vZH3
	JJWnEhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t61Xf-0000000GoVQ-2ayA;
	Wed, 30 Oct 2024 05:46:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t61OJ-0000000GmmY-29MK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 05:37:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7209415ca51so1296287b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730266630; x=1730871430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rMTL6l4+ePH78ifD4HQ4rzCV1XSwWL49wAuSNSzsWs=;
        b=AgQRq9MFnvfodKfNylY0RB8y5VgeDKa9a6bKdzw4qwgIfSzRT6hvDX8vPXynYawlcg
         MdQAHSVK0zu6YlHBlcJ/juax+2bywnDhwT9Z/8P+69uAgs0UXrIVL4rVpPwYvfNeuq+h
         DUTbuhoZEJCBx0kefjfnBYDxdFJs2uWckrMEiXHLz7H6BGT0rMR/wwHQoIfEI8SofKOn
         efL6vO4g1L+Mu71CNAyI4X9INbKArnK8p89wjHUIQ+mpOQwuHZ0CDhz4MM/5h7T5HXw1
         bnUfUT8U9vJeUvzJvj/YzUE3Fnp8Ucp1Xv/xJvdSbLEA4256eLhyj4ubCllaL2ja2BV6
         4grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730266630; x=1730871430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rMTL6l4+ePH78ifD4HQ4rzCV1XSwWL49wAuSNSzsWs=;
        b=ZfNAwobM450xHkblsl2/B1TbZkwi1oiJt5a4r2OXua1tuFquqfTCi7PRM/oZ/lXQSZ
         ANn01Ops1wefOzgkIHNAcZ6bYSQDh7d3BzQ8Ip8ION7/g40aLKUGMK/R+Cv9mAlyFVUF
         feihwvrwCeS+qBFfUCwQVfeG8yuo/EfF5i9sA0dAitV1UCexonsJQ1908l9bkOLrOfwp
         jXbPr53u1y09QRuJg8gBp64mlqbevPB9m7l7HbbsGbWY3zEeTm0paZd/G56IjlIHmVyt
         kjr/2w6cVImA3EG8S7/wN2jladPmkOGyYijGlgRJQX0JovvC4euB21bh3ZZd7zbZMaP6
         aLkw==
X-Forwarded-Encrypted: i=1; AJvYcCWouZ1WgpQDx5I2rd6iyzB2Cgx8i2kzmmFjKGB+ErajuGbP5BV+lb/pXEXFIStoY9M9unz/zQDe3pdw+6UJLljd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr2x5HWbuHu8fAb2GmzLGvgBNYFpihBFA+I4PAoaitIjw2fmh9
	d+rUx0gAwViOyej7jm6HIZSLwJIM2IZWX53J0zlENZquKS40a5Ty
X-Google-Smtp-Source: AGHT+IE7CgyZn27XxCFhKxyFp3BVb7USJ5mFVVGQGJSHnnvwU5HqtIlFwQl/alcMVDkE7vGIRyO7AA==
X-Received: by 2002:a05:6a00:985:b0:71e:52ec:638d with SMTP id d2e1a72fcca58-72062fb21d1mr21241676b3a.10.1730266630361;
        Tue, 29 Oct 2024 22:37:10 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 22:37:09 -0700 (PDT)
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
Subject: [PATCH net-next v6 5/6] net: stmmac: xgmac: Complete FPE support
Date: Wed, 30 Oct 2024 13:36:14 +0800
Message-Id: <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730263957.git.0x1207@gmail.com>
References: <cover.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_223711_575360_3F5D5D47 
X-CRM114-Status: GOOD (  16.46  )
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

Implement the necessary fpe_map_preemption_class callback for xgmac.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 43 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  3 ++
 3 files changed, 48 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index de6ffda31a80..9a60a6e8f633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1545,6 +1545,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1601,6 +1602,7 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 46a4809d5094..ab72fcd5fc79 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -343,6 +343,49 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	return 0;
 }
 
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack, u32 pclass)
+{
+	u32 val, offset, count, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 num_tc = ndev->num_tc;
+
+	if (!num_tc) {
+		/* Restore default TC:Queue mapping */
+		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+		}
+	}
+
+	/* Synopsys Databook:
+	 * "All Queues within a traffic class are selected in a round robin
+	 * fashion (when packets are available) when the traffic class is
+	 * selected by the scheduler for packet transmission. This is true for
+	 * any of the scheduling algorithms."
+	 */
+	for (u32 tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (pclass & BIT(tc))
+			preemptible_txqs |= GENMASK(offset + count - 1, offset);
+
+		for (u32 i = 0; i < count; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+		}
+	}
+
+	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+
+	return 0;
+}
+
 const struct stmmac_fpe_reg dwmac5_fpe_reg = {
 	.mac_fpe_reg = GMAC5_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = GMAC5_MTL_FPE_CTRL_STS,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 00e616d7cbf1..9a0adb8ee23d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -35,6 +35,9 @@ void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
 
 int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 				    struct netlink_ext_ack *extack, u32 pclass);
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack,
+				      u32 pclass);
 
 extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
 extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
-- 
2.34.1


