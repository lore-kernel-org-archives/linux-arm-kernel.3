Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEA0E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDrHezrIz5cTXpjA6dJ5uIqtYCcnxWcs7DL1g5f/WEU=; b=N2bFr3P5u2JCDr+6Fn0dPQvwtB
	v6nyCZcCthiXe2jqe0vszGHxDiqHbpddB0AFQjwaOFDore1I0WJZFuqu/H/lWEoUWkqJx0tc1Gm2b
	ODp0Nvl1f2F2V7pc2hKwlIK6T9ItuHQgSeXRkQ8Ga+x1XaFGKy0kWHuqcAbl7q9v85tVi4fjN+aPu
	bJnDVnEm6nCeN9pdoUwlWAVA3GgwnxgNXEdz4fJBeSlkqi1vmw/Wt/fy1Wbo3yxFDP+S+PwaYMMaT
	1u7IOAfrCUroQB9L07P8Q+8rKz63LM5ayEIyPhMh6bg6C+YjXsklnz0ldCGDZxka5y4ZHbLWRNAlT
	sLDsPUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpWs-0000000FwOL-0M50;
	Wed, 18 Dec 2024 08:35:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpVl-0000000FwBP-2GHX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 08:34:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2166360285dso53774235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734510868; x=1735115668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDrHezrIz5cTXpjA6dJ5uIqtYCcnxWcs7DL1g5f/WEU=;
        b=JFXh1PEJgrsgPmgNr+4kqUSgrgD8ibuE2mg7rhn7JOx50JfHhfaYWvmrMOiOp7Ks+N
         8mhYIRG+CEouRUp/h31oY5eQgwjFmsWYkW/sGRZlryuZWQp0sufx9J0iw/aPt94b3HIS
         HOVe/7/0aLd7h2JxylrJ5FZSxFXU+y1y4TkNpF7K7BL+vDYT77ZpalSZn4EilMcIeqOc
         mrwdv34f6Sirk4TkgA4JFaJRs3/sto9+5601G5P77xso/n6GeaGVzmvshP6n741AQaeb
         9mFj/w2rPtaOGbqG0UqtMRzV9AWOrwUBAs0YGELoojTIEvAhL955EOSlULowqnYnuuKs
         q6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734510868; x=1735115668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDrHezrIz5cTXpjA6dJ5uIqtYCcnxWcs7DL1g5f/WEU=;
        b=FxWrChdwmiV4CMHPK7q1dR6R/0QotK+s2jgvzweeQzbZTm2uLSuRjK4BSXxJUSoaxG
         xxD8hNf4FNrQ41djoncLu6cInwJ3PG/bY6pT9Qazpw2IYty9rIVJ1JUyb9ze2hbcC1Bl
         MI7w9H2HsWDldnJgwCYX6X8AENlknoQS0HMU/ogqQFbnwdDZzvh3XsM61rdLcw1F0+me
         cMijnvtQ6jBYR+me9sscZn3gc2DKdVjbSEkRFoaMQbPAnUMKhXlYkjtsSXaPU1Y+u9Aj
         V9up4i+TsKFIyuKDkQ9PiXpFJYUlNtMGVwahcE3R2PuZTUz+vaj0U3WGzKYcikQIsvlj
         1x4g==
X-Forwarded-Encrypted: i=1; AJvYcCUr7TGQalk295G+ncZ93Pq0tSMuDBpaQqr9IAv7UjOMB4BL4wdyYEym2YJv+IVwNcxfJzeOhfz3TCtPqjqHgU53@lists.infradead.org
X-Gm-Message-State: AOJu0YwmoSiiIy6F7a7kU5WepUM+61bOMXJcB8iOVZv9m9fZIYXByxmk
	ZtgP7aKt7lpfON68hfm2qu2rtUqWEBF08+AQW0TNvS8FHRnW3CBw
X-Gm-Gg: ASbGncvAt4IwohCsGdexvad+bm1JxxpWzwqz2nkSPvnIrEfVpqKUOkJMlSSL9YpJIQq
	MmCiqQgNge1n1CD5ActG8gWCsZXiiEyBf1yJZYv1ezlzez8B7UcJu5l9jHf81NabtlFhqjaL+ra
	78L5fUyFjiheJAH+m0GFQVHFzYQWJHmsEQ/cM7a1iN8iSTjOrghPUSqozFHfwCcUBGmgwMvqXK0
	JbxDcNgmM7Hju5atzzlCX5YCKFpYCgvc5VMbv/1IzlIRIIOVx6itsUcdSAXYBz+kDOjnA==
X-Google-Smtp-Source: AGHT+IGtJJCUk3iuXtE8y8mYuVun1NG2Fd8lbXIzpgpbU7+72x9qCy3AunOkM68r/azCHGKP3Ipq1g==
X-Received: by 2002:a17:902:ccd2:b0:216:7cef:99b3 with SMTP id d9443c01a7336-218d7280492mr30713875ad.52.1734510868506;
        Wed, 18 Dec 2024 00:34:28 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a206a098sm70772485ad.270.2024.12.18.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 00:34:28 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Simon Horman <horms@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1] net: stmmac: Drop useless code related to ethtool rx-copybreak
Date: Wed, 18 Dec 2024 16:34:07 +0800
Message-Id: <20241218083407.390509-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_003429_574861_EE9A4F5F 
X-CRM114-Status: GOOD (  14.27  )
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
Pool"), the driver always copies frames to get a better performance,
zero-copy for RX frames is no more, then these code turned to be
useless and users of ethtool may get confused about the unhandled
rx-copybreak parameter.

This patch mostly reverts
commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")

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


