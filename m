Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394FDD0BB73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vq/el8SDEUzHww6+pTvugVJXjv8HRz8p8ZSj3pXNDbk=; b=UbnSIbHxH89ZIzIcFyuCPJdGE8
	1r5aDAi27TBQAzIOxWHr7ANQfbj+DjqyLScOa/63oMvRbiIW71b0iZdG9bCZ/DTSAgtEheQpor8HS
	KVGaORhBdXnBALP+S69sPHTJWPq2eVFaa66mbMmBifndTytxVs/mJfSY21VoYTmKo+Nwo7Y8Yph4r
	F7VHG//q8QFPL3bqLSivmR0NK4B7iXqHM9x+cIwdrVdWgG1KxMcexGzvG2dbk5dMC9AzhY/Aq0kKP
	X30e7j0zD+qJE4PPeyDX85cL3wUjIo2ljQyK//pQQPvh57HPJThHAGYadTflNxOvXy0dtv1bx1MXW
	hk0+H1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tSz-0000000HLKs-3MGX;
	Thu, 24 Oct 2024 08:45:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tGO-0000000HIWg-0VBv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:32:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2e050b1c3so1246033a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729758731; x=1730363531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vq/el8SDEUzHww6+pTvugVJXjv8HRz8p8ZSj3pXNDbk=;
        b=S4LgWfzhg2Ipca+KN+FeOZRHo9tLlY4pgE2zLLahpFLLarUFSk1XQVw24GUPFMfoIP
         ipO1233KKG0xpFfFKwvbFjIoYWXqvx8ESicOLLkbGIKEPO0s4+RrjX/0OsD1fmY9SCQN
         OvsAfkymPhr3/0CtvFR59vOie8exMdsYTR9zkZyToOKdelL24AwjmPiGpuVfT2jp/Jer
         8Zoy7yz52hM/Khf3VUHQDIZZHza5KBYXkWr5V2NA84igN5dUBem7pSA0qXJ8mR6NQHQj
         aOTmVUD4ToMgMqZ9DZgEWSZXmnrcWGtv9dcnV2F7x3ck6DLemvGBfkWzVmvHiX8n0NuJ
         osOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729758731; x=1730363531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq/el8SDEUzHww6+pTvugVJXjv8HRz8p8ZSj3pXNDbk=;
        b=VlVej0FG5auEo3HGTHfnbx5NuMr4M+5ah2eKegxYTPLCqxS7snOBiOxOR+X0gDhSAg
         TaELqBfmROZQr3s5iakO8T+rNuH58iLIgrOitlQRS8/0pgcXp64Fta6g9kcRlP7hDmRE
         0x5XkFdkYy7vVKaXeRwjNvS45FFJpHc/i/ClW9pJi3XB6jeemDFo4+OlpFfa2alNxOYG
         s3fL7qFyJ40Bzq6p4K2U03/Jqg+jibGKoskJRPyUDLRLj/zgm96HKTRhvgXE2fhFHetb
         lam1L7xHT7I33MRYUFMPeNiojwE2y1Sx7+icHZ1U8kBouDpdDQcKiroAFzffEDCqSEci
         Hndg==
X-Forwarded-Encrypted: i=1; AJvYcCUAoNY+I+tiorAJDd1FriMxu8IxnqJzjjBdaMSRNZqj7+n9N+xKRn4Cvxhkgny8tTOtzX4f+H+yVsRBctGhJ+EA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/CVmuaL2wMOGN+I25YD7X2NfUTvxHP+kDgccUV4XTQPZK1HPQ
	KFptovG3Hi3Cces4EkqV7OyOOhb36m6xAsPiM9NjrKPFddsGu7yO
X-Google-Smtp-Source: AGHT+IHwjsbgefkXOJzeNdSxiJt2hUHwx1jGdvUi7g05IerbcBRmo0LH++Eh5cEiic4v8e17OaHYVA==
X-Received: by 2002:a17:90a:fa16:b0:2c9:90fa:b9f8 with SMTP id 98e67ed59e1d1-2e77e5fa97fmr2097554a91.10.1729758731043;
        Thu, 24 Oct 2024 01:32:11 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:32:10 -0700 (PDT)
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
Subject: [PATCH net-next v4 5/6] net: stmmac: xgmac: Complete FPE support
Date: Thu, 24 Oct 2024 16:31:20 +0800
Message-Id: <1b73889f76493a6d2882c7e3aa9d981b34b265d3.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729757625.git.0x1207@gmail.com>
References: <cover.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013212_188129_8E980562 
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
index c9c2e0b00a0c..f41329169cc8 100644
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


