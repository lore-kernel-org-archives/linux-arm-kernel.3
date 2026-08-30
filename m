Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F499C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAJxRQQXvVgRQc+qrTy5F1Tifzrj9A/VOza63N0XwI4=; b=2kDSgyorZw7ZhA3v7cd3Uso5r3
	d48DW3DMUiHnaSAbHCl86dAymhyS03XFwKN0/9L/lx232DYqRUTuyuTjy0xDvQACYHAuU3nywd5Ar
	EVsz7UolGTrSGeOs8vOTVyB1BJtuYaoEXBFTMe+mIJvE4sy5cxlc7ihT7XRCwp9K8ZSeczS/fYZKB
	YXkuwEJziuocEa0PQTe0rZmuSlmLTEhAhLsU8YqC5OQlIMC39F7+O6IM04ueCNhnU8CKAZA97lI3U
	6B8eatexf1MdCqfZrp94hqzFVnlZmYO+OCJEsaZxgTI3lP8NzmL8RVgycLC6xJmecTqpEk4sk3PE3
	0BjGnlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQh-00000007Z2Q-3Gga;
	Sun, 30 Aug 2026 07:58:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQf-00000007Yzj-0qAk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:58:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso4391075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076691; x=1788681491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAJxRQQXvVgRQc+qrTy5F1Tifzrj9A/VOza63N0XwI4=;
        b=olq4rqnmR6ZSQvoghrLutMzkcM0dYzjjCSeYnUr4O1wnqJX/5bb3G80DTYHgVJTTMe
         dCzgehBDXeYPzYZ6nS395Vvf2AysGSlYP78BIriL5XyjqTR6YXWB+ylDRW029cTMGUeS
         6PGHae90PzD8wwGeSHvMfXlBn86nYbGyqnnx1m5srKtE91J+DxGME7sRy7tobSd+kGp3
         67hJ7dabPxT4fCJKbTX9/CpnNe0XYm/DvEWJNueBIruKU8SH+kqR8Fo7loZCKK7wApW5
         MzQ1maD5g0bkM7fT/M9QOCXCQ9CnxvvKYqPG2ylcqh189oRyhuEdK61SjIHoi65FBMfp
         0cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076691; x=1788681491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAJxRQQXvVgRQc+qrTy5F1Tifzrj9A/VOza63N0XwI4=;
        b=f9oPPm+Xf9d2vIXQMhVfAgosmbKJboUB4qEcHkB6QKFcOnEomuZQyDA+3czLj86uoh
         WwUf0eraWbssyFprmXuZlAWfW0i19yMj0s9NVqzNl5+2Jyvw3NhraxGYSbHEgS7fnoDS
         1A4PK38YTtNYMuUbUsTXbHV87nFCcsqgz48+TJIOCpQ+U+54LOe6TBuOLBEMvWM8JX4F
         1dw/la38IDwP9LjxRp8f2qIVpzqgeC5aPwdcshwV231poXwAgclV3A+V7qGLq0Q/7O/u
         YoKns4OaNf6mW/gYd7td3+jP8TYnZ3Uib+rfLcdI0P7wavLIBlA4EqIn9Yfw3iQSD/pN
         yolg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1bAtfrje8L+91a9WtZrBZx1U3cV/hH/DbU0MHJRiUg19k1Q9p1Z69qK7WQnerVrV1Ue6QMfANfMXR562oOLWM@lists.infradead.org
X-Gm-Message-State: AFuF++mRb7Q26gSrva3YQqs4D1LZj2xAI6qRMVXz0AMCmv3Sh9hJ++L8
	ZOA+B0C8XLnG+Jmon3tWgerR8EbogKPb+SgI9r3d8NnxGZPHCA6YoL0=
X-Gm-Gg: AR+sD11rugA4xjDF4gJ7Ln380xbxgM4ZUVqmT450LAFvKBVcBepV8cVAIxMMcxycHTc
	rxrpu6r9N29t9HvHlqC1u3URL0q/k5Ago4pxVtisTFd7LmNRVaKgp/OYVSGRsTANAiIPrSxTAy4
	aB9XxOfVJle8vOjr3OY8JT3NiY4QljaAiX1f8EHEPxDBAvQYrsf9kRgZn3Bzl3NmEwi4AAwbsFj
	YQXCUPXjgHViVyYKBiJV6YIVFdfolFEOT6NmM/4mjo8x6xIqsVJrna8lkasN1czaTrBVht34/F1
	05AsABRbxd9Y7oWqUvrp/meKkSUnScWWdmCEyZwrNtQ3iWyzJmJLLJ2yNpFA3a9gMZgGguP47fY
	og7sz9VjWlre9Szkx+v9azJ4bOZCVctKqWKWYtpm3SXKvF4tUQpOQMYq7UJ3wIiaiBT4/UsQyHL
	uR3gF/ah9O3afREkPWyFgVxUpldKWrUTHpRmZ+RzbT0u1MPrIw55A=
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr266282045e9.2.1788076691084;
        Sun, 30 Aug 2026 00:58:11 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:58:10 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net-next 3/4] net: airoha: add rx_stall_recover ethtool counter
Date: Sun, 30 Aug 2026 10:57:16 +0100
Message-ID: <20260830095717.37218-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_005813_273379_796164E8 
X-CRM114-Status: GOOD (  16.54  )
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

Make the RX-ring hw-stall recovery added by the previous commit
observable without grepping dmesg for its dev_warn_ratelimited():
add a custom ethtool -S statistic, rx_stall_recover, incremented once
per completed recovery.

It's tracked per-QDMA-instance rather than per-netdev, since the
stalled ring can carry traffic for more than one netdev at once (VIP
classification shares ring 4 across several protocols/ports on this
hardware) - there's no single netdev to attribute an individual event
to, so all netdevs behind the same QDMA instance report the same
aggregate count.

Kept separate from the actual recovery fix since this adds new
ethtool ABI and has no bearing on correctness; happy to have it queued
independently if that's preferred.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 44 ++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_eth.h |  5 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b53fe5b17653..efb1dd69cc16 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1000,6 +1000,7 @@ static void airoha_qdma_rx_recover_work(struct work_struct *work)
 		napi_enable(&q->napi);
 		napi_schedule(&q->napi);
 
+		qdma->rx_recover_count++;
 		dev_warn_ratelimited(qdma->eth->dev,
 				     "qid=%d RX ring recovered after hw stall (RX DMA paused for %lld us on this QDMA instance)\n",
 				     qid, rx_dma_off_us);
@@ -2600,6 +2601,46 @@ static void airoha_ethtool_get_drvinfo(struct net_device *netdev,
 	strscpy(info->bus_info, dev_name(eth->dev), sizeof(info->bus_info));
 }
 
+static const char airoha_ethtool_stats_str[][ETH_GSTRING_LEN] = {
+	"rx_stall_recover",
+};
+
+static void airoha_ethtool_get_strings(struct net_device *netdev, u32 sset,
+				       u8 *data)
+{
+	int i;
+
+	if (sset != ETH_SS_STATS)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(airoha_ethtool_stats_str); i++)
+		ethtool_puts(&data, airoha_ethtool_stats_str[i]);
+}
+
+static int airoha_ethtool_get_sset_count(struct net_device *netdev, int sset)
+{
+	return sset == ETH_SS_STATS ?
+	       ARRAY_SIZE(airoha_ethtool_stats_str) : -EOPNOTSUPP;
+}
+
+static void airoha_ethtool_get_ethtool_stats(struct net_device *netdev,
+					     struct ethtool_stats *stats,
+					     u64 *data)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct airoha_qdma *qdma;
+
+	rcu_read_lock();
+	qdma = rcu_dereference(dev->qdma);
+	/* aggregate recovery count for the whole qdma instance: the
+	 * stalled ring can carry traffic for more than one netdev (VIP
+	 * classification shares ring 4 across several protocols/ports),
+	 * so there's no single netdev to attribute an individual event to
+	 */
+	data[0] = qdma ? qdma->rx_recover_count : 0;
+	rcu_read_unlock();
+}
+
 static void airoha_ethtool_get_mac_stats(struct net_device *netdev,
 					 struct ethtool_eth_mac_stats *stats)
 {
@@ -3502,6 +3543,9 @@ static const struct net_device_ops airoha_netdev_ops = {
 
 static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
+	.get_strings		= airoha_ethtool_get_strings,
+	.get_sset_count		= airoha_ethtool_get_sset_count,
+	.get_ethtool_stats	= airoha_ethtool_get_ethtool_stats,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
 	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 483d6b59c351..d6591a779743 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -582,6 +582,11 @@ struct airoha_qdma {
 	 */
 	struct work_struct rx_recover_work;
 	DECLARE_BITMAP(rx_recover_mask, AIROHA_NUM_RX_RING);
+	/* count of completed hw-stall recoveries, exposed via ethtool -S
+	 * so a recovery event (and the packets it drops) is observable
+	 * without grepping dmesg for the dev_warn_ratelimited() above
+	 */
+	u32 rx_recover_count;
 
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
-- 
2.55.0


