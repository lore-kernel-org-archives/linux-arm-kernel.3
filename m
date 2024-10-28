Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E09D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IK0+tz6UgrWkk3eQKtuPkyttD+TXu0biBXSgNcL1KU=; b=fw1qWRkTo1ZVcHC1Axhy15GMYR
	UBifdzLXNUUPRz5crbz7pSMHQ/MMEoIaWnkAfOH3JFEwgR9RXx+SOKZSFm6nUX7SKyXOoM2cRoiil
	tkIzP9v2rklGuWD/YZ17ix3bPeGINTpP/JLkcBEjsZ4NE8JCLy29z25/iepIKxVA/843cwr/WjzXk
	s2tRFgnr8iYfxu+gwbdCEuPLRd1lD7lnQup66jX3KddxutMvwRdz3f4UMsdnf1J509aI0/33ahRT/
	OoNFcqI+jmoyzjq59VYZNBn2nQ/aWb1z+EiIpEKkGXk3K+b08H76hTnQsYFSQrbCT9GVeq9qmfloe
	nu2qHzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GWB-00000009Rom-1y7g;
	Mon, 28 Oct 2024 03:34:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5G75-00000009PHO-16sA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:08:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c805a0753so35856285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 20:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730084894; x=1730689694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IK0+tz6UgrWkk3eQKtuPkyttD+TXu0biBXSgNcL1KU=;
        b=Kpso1aHZ4TqiEqEe9Bp8fvwukGWE4nH8Y0fQ+lXrjcvi8JLX2q+thxtB4RFIF4AzZL
         B0h7/i81BtUF3VqDQoqz3YTACCPwHLV6LYIMZaeavQ0AfB3BqRZRufHqKywQHrhLojgb
         MiujEgkpvhrg+FZQ1W7FAPTGkF7bFgE80Tjl9neOzC2SeAzUXQgmNHWAAOAG5bA+q+VX
         QzIMAmaeeH9QVTpRO9+xTGIX0KOKVjynFzOPbdYGvRhirH1mEykem9vkEupcWCz2KQwO
         GO1jwFAKq5t9Oi57eqJqhh4Zu7htaY957cIgzbmBxs/ZKhuHFHRA2gY0j8khzSO0aKnF
         YY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730084894; x=1730689694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IK0+tz6UgrWkk3eQKtuPkyttD+TXu0biBXSgNcL1KU=;
        b=jxAz4aWH1QDwID2yfNLE7u3mmzYw+kgeDavSrz40LBlHb/55fNpfhAeFHUHzyCI0UP
         R6tFwxcJXlnANQ+LheI36+sAj9pY6jZn9UXWYYV3/qWTNomoCdd6SYzdWMg5cMQbo3wV
         DXEEXAryRWsrBlhX8P14TzaF40Wc7zsvb5LECuSnNPQrssQ2d4L3tZ0gSFCw9GlEvPAq
         +wFf71RV5n1okbKPpzcgVYiaK766QC00EzvBroN64LY/AG9D8qSf8QKnqgO4SRYNkWXb
         xwVJLSh2MdM1rzTW+OYK63F/xfjnW1EGFbbl1D3yu+0qWOAhNFrUsgkmDCXiKZ2QeY+R
         PA5w==
X-Forwarded-Encrypted: i=1; AJvYcCXNEP4szWE2vdd8gHdPduTIy/E4vnOHGGRZIRV/XKu8y9e72+rQula+6DBK7zFyhMbwHZGjJKkC87Mv+7KOqcum@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ymxJu42ibRyd5MWsYdYut4fabS4s3aNOkAKEtUi0T0Yu20v0
	R52DFn8b1Iff2k4VLiaeWtdCXwoh44C5cSUmUy7Ua80/I/ExkCgy
X-Google-Smtp-Source: AGHT+IE1LfTy77L+XgqKFk08IJORYTgfKR/xYxHxwpKcRnPD2X0/L4nVVPTJb2xMm9Vl7axWq/7AFQ==
X-Received: by 2002:a17:902:cf0a:b0:20c:9d79:cf85 with SMTP id d9443c01a7336-210c6c932ecmr92308935ad.54.1730084894044;
        Sun, 27 Oct 2024 20:08:14 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:08:13 -0700 (PDT)
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
Subject: [PATCH net-next v5 5/6] net: stmmac: xgmac: Complete FPE support
Date: Mon, 28 Oct 2024 11:07:28 +0800
Message-Id: <3126dce1a85138a7760096fc15c580a5c6bbf5c9.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730084449.git.0x1207@gmail.com>
References: <cover.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_200815_329524_5937D787 
X-CRM114-Status: GOOD (  16.07  )
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
index ce5dc896f9d8..541fe6ce87f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -350,6 +350,49 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
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
index 0b601a9fd805..ea18ea738da6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -34,6 +34,9 @@ void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
 
 int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 				    struct netlink_ext_ack *extack, u32 pclass);
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack,
+				      u32 pclass);
 
 extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
 extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
-- 
2.34.1


