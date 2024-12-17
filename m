Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF5E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RHB7BdWE+mdq4KW1atHm3QasLuffzsNyx3HPRXiGpvM=; b=qOfxVU1XonZZN7ZGrIOY0U+ub1
	QGXAyPc4K/++FAAqLbqImTRTMLtfaoxb6+7hZe+3fsNaw0t0AnEufBtxCRtO5potfesW/4ut64m1C
	RdzZ9UJMYiEk7Ko2qBWPaHOIvJsa6MXMsCrj+wH95J03keJ4lRcqBtzudQQaIt/gm3g3nVo2+rvsG
	NFitTzHdNBnq289JvAaar+FXoe5mjwzBxb8nyMX4Nv4jc4Sy+/xopuImm0d+9oldE8eokToASYrKg
	dCgG1swv87a7fglpU+Wc2JBFyyzV/g28Ohct+t2OXKczDWQS6g5hjqwOcJLiifROL7/5cJmL5jMpi
	2fWWUBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUCu-0000000CzbU-00bj;
	Tue, 17 Dec 2024 09:49:36 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNThz-0000000CsIc-3SmJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:17:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21661be2c2dso36780365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734427059; x=1735031859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHB7BdWE+mdq4KW1atHm3QasLuffzsNyx3HPRXiGpvM=;
        b=PNF/ofDXP7ggiBkpIm8A609VIH+2CgNq7olq6WtyF1PxoP2HeOMZ766VyJIu0mwiQ0
         hgPbbtqItLoKIviYpdFMOpjVAY3NcS8bEhJkPWikpl7TjFZObzipfp/Gy24Y4DA8hj3W
         pBdprIs9Pu6LySrJP8jO7iO8RMmbXFQqRVPAEmjzSxo0/WktDjjyW75Sm7PYcSFulopL
         ec5+xeIRfrTWbS3RCK+4JMtvMhmPmYxoLZAfxWEuRDsNnJS9v8VEKruSvIGfzjsvS2qR
         enjZxzr+jZSWILYxRPmGC2HqhysQFktLK6RX36oDB1eTlhH61ybWZp+pAIbafjKwoXAj
         P3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427059; x=1735031859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHB7BdWE+mdq4KW1atHm3QasLuffzsNyx3HPRXiGpvM=;
        b=oM5wN+p2ogOWbySKDOLRYIVHIz2xY+kPGw5iFcUhdsVifB38lNJ4rx8Y1P3FSuuHb2
         EVDFZ6g85B3IClXqZKeqBE4SiCZRt9QYeMxnKAsyF372C2upQBntBdmLBAdmszC01y1T
         BkKt0tC9+FmIGFTA+loZztbkiytl4ssonK+0Uwr4OeaWkdosOkaRF9e7jj/Nz/8BuPfR
         CdG5Ti0YfXeCKNDdw1F8/Py4dWs5rx8KuU8dtlbBaBtxpGXHFzs9dox+y6+npgK/1KEM
         FxYixcmdpWMvi6w8kPkJTgijtAd0M6JsRGhuYgBGGt00mgrZLu5vubPD3t0DYW3tsrXh
         sp9g==
X-Forwarded-Encrypted: i=1; AJvYcCXCI1TMV3zKUftJVAmg1DASC36LrKinFyATBSr8asPtgcuJtGay/ulKAD8kTS251joXA4L0bTBfWZJIOlEzwjZ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Eypi/2qtm9T08qnFw5AybeTgn2djWUf0gw69/QCamYaLNMB4
	cPNCd1+gp4FOUkZxPmhofAMoYPLKkNaycnhPOV5jjPtH5g6bkDrU
X-Gm-Gg: ASbGncuAYyB5EWTiT+jnbDfF1piv4fAiyuiEbvWL3iUljRnniedfCQs6xtDUcLn5RvI
	vaTeoxcy5U2kH+xk/HY9MxoFQHk/PaP+3ZPTnrdbeOKxo3Uqey9Zbgk2Nu9BLqrXnJpOEoGObIC
	MwaZ1d0GOdNRHvNF8JWAHGAQz2cP+amEgY9H6zjwAbz9U12fLoAXW6RSUUB/7YWMwtdqFgfTL/n
	LSVV1rjFW7kr5+7ZHAR/7IUatU2zLNaS9kkIYwau03BKXEJayQ0B4hLkjDZ0QTGWA+YaA==
X-Google-Smtp-Source: AGHT+IEpUUha2LoiankVqO1OxKO8y+rZTQ9zEw/8VBZ4PS0Jm8U+EJqmmiMzkJu6dtkcwNLxH8qP9g==
X-Received: by 2002:a17:903:41cd:b0:215:8ca3:3bac with SMTP id d9443c01a7336-218929a1f14mr212249005ad.16.1734427058537;
        Tue, 17 Dec 2024 01:17:38 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1db74e3sm55007165ad.30.2024.12.17.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:17:37 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net v1] net: stmmac: Drop useless code related to ethtool rx-copybreak
Date: Tue, 17 Dec 2024 17:17:12 +0800
Message-Id: <20241217091712.383911-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011739_866020_1004DBEB 
X-CRM114-Status: GOOD (  13.37  )
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

After commit 2af6106ae949 ("net: stmmac: Introducing support for Page
Pool"), these code turned to be useless and users of ethtool may get
confused about the unhandled rx-copybreak parameter.

This patch mostly reverts
commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")

Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 39 -------------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  5 ---
 3 files changed, 46 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1d86439b8a14..b8d631e559c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -126,7 +126,6 @@ struct stmmac_rx_queue {
 	unsigned int cur_rx;
 	unsigned int dirty_rx;
 	unsigned int buf_alloc_num;
-	u32 rx_zeroc_thresh;
 	dma_addr_t dma_rx_phy;
 	u32 rx_tail_addr;
 	unsigned int state_saved;
@@ -266,7 +265,6 @@ struct stmmac_priv {
 	int sph_cap;
 	u32 sarc_type;
 
-	unsigned int rx_copybreak;
 	u32 rx_riwt[MTL_MAX_TX_QUEUES];
 	int hwts_rx_en;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1d77389ce953..16b4d8c21c90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1227,43 +1227,6 @@ static int stmmac_get_ts_info(struct net_device *dev,
 		return ethtool_op_get_ts_info(dev, info);
 }
 
-static int stmmac_get_tunable(struct net_device *dev,
-			      const struct ethtool_tunable *tuna, void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret = 0;
-
-	switch (tuna->id) {
-	case ETHTOOL_RX_COPYBREAK:
-		*(u32 *)data = priv->rx_copybreak;
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
-static int stmmac_set_tunable(struct net_device *dev,
-			      const struct ethtool_tunable *tuna,
-			      const void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret = 0;
-
-	switch (tuna->id) {
-	case ETHTOOL_RX_COPYBREAK:
-		priv->rx_copybreak = *(u32 *)data;
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
 static int stmmac_get_mm(struct net_device *ndev,
 			 struct ethtool_mm_state *state)
 {
@@ -1390,8 +1353,6 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.set_per_queue_coalesce = stmmac_set_per_queue_coalesce,
 	.get_channels = stmmac_get_channels,
 	.set_channels = stmmac_set_channels,
-	.get_tunable = stmmac_get_tunable,
-	.set_tunable = stmmac_set_tunable,
 	.get_link_ksettings = stmmac_ethtool_get_link_ksettings,
 	.set_link_ksettings = stmmac_ethtool_set_link_ksettings,
 	.get_mm = stmmac_get_mm,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16b8bcfa8b11..6bc10ffe7a2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -77,7 +77,6 @@ module_param(phyaddr, int, 0444);
 MODULE_PARM_DESC(phyaddr, "Physical device address");
 
 #define STMMAC_TX_THRESH(x)	((x)->dma_conf.dma_tx_size / 4)
-#define STMMAC_RX_THRESH(x)	((x)->dma_conf.dma_rx_size / 4)
 
 /* Limit to make sure XDP TX and slow path can coexist */
 #define STMMAC_XSK_TX_BUDGET_MAX	256
@@ -107,8 +106,6 @@ static int buf_sz = DEFAULT_BUFSIZE;
 module_param(buf_sz, int, 0644);
 MODULE_PARM_DESC(buf_sz, "DMA buffer size");
 
-#define	STMMAC_RX_COPYBREAK	256
-
 static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
 				      NETIF_MSG_LINK | NETIF_MSG_IFUP |
 				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
@@ -3927,8 +3924,6 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
-
 	buf_sz = dma_conf->dma_buf_sz;
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
-- 
2.34.1


