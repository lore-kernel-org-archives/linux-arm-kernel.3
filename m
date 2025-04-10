Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA3AC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2YZc1LaMVkn7aFFV6kzKwyOO/D0/i0GDUriI0k11XQ=; b=npy9+TRPFUZ/rTJu0ogc4BNtU0
	WSxfbqbYecyIJcwZOecNHzivttBf7VjWS3Lr1F9SFcfdSp9wMOmo/3ySSU31qCLw+BRGQvfO+SXWB
	ApiXNLh/lWBnbtx7Fydp7QaEEN6FFwiAPrJn/jz5m8o1+q9uR0+Z1Ov4hPfeTF3ms5bpuNHKZmE0r
	VWQW1+NmL1HYjNe5/ATYNHge743c2blbnfsMRUZvBGVy8SO0ocf2e/e3PeRs9Lpibo4rOFuso92Fy
	AToO7qdYVT4+Vx7N0vWV/esgR0E4r7MS/1pdz3Ehdxvg3xWeZgy9BGbE0OP3C5caVgK13jPfeMCzD
	w2AE4SuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vt0-0000000BPaz-12bh;
	Thu, 10 Apr 2025 17:40:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2unp-0000000BCmJ-1IPN;
	Thu, 10 Apr 2025 16:30:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso12025765e9.3;
        Thu, 10 Apr 2025 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302656; x=1744907456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2YZc1LaMVkn7aFFV6kzKwyOO/D0/i0GDUriI0k11XQ=;
        b=iY43D+cbwPd1I16cktBMOf4mwbpfWIm6AZxd5Yymph7hsd5EpHmyTYeCZ4wRcHk7CT
         /751iaARLnZF7xTxfK8WkxnoybN8jgXwR4C3tkxIw7pCGuybwEW+sMkTfm2v/GA9gfNU
         DzVwywVzt+dAc9qM0pDMcCc+z/vCTW8VF3zTgLxrAgvigeMZpyEqLwEkH+9ZhzN68hpD
         dhZT1U1m+wdiJ92s2atxhar0w6bGd2+O0D1fUmcf6f03ocRgTUxsd9lrgRkvE+vqEQgQ
         GE1dckNPbrgFBonTYaPGrsa4E17jHLcydSaiUbl+nboY3TZ3Fq68JokhOhc4cJmWLRzN
         Cymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302656; x=1744907456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2YZc1LaMVkn7aFFV6kzKwyOO/D0/i0GDUriI0k11XQ=;
        b=EN/O422FpChMWVDnp2CZNB91OnSOF5Iztl98LMP3dZ8Y3czqpBbA2mmoo2WqueC5W1
         jn6p6oNGlAMlwkCxWXjZaTSW6Ln9m2G0ZSaKv0WNbp1AhqmX3jrM4Fev7Rc9qLXgf0rI
         B1WvnCpGp8bwnhryi2/0R+CfyDqSkFQoI3d4kE24xWACpQ1HFHh+u5myO/Pdasmja+N+
         Dl846fqRo+MhltUzVlJ8zRnzIfnR4seqe3Ujsjzl5bsPFbyf6UrGx5pnhqkI+f/wHgN9
         ROQ21D3VcslxUTKPiweju3cDXTUTNuBy4iP6ncoDhAhuXgWTEDlAwQZpaX+0KjUiGbex
         UdGg==
X-Forwarded-Encrypted: i=1; AJvYcCV0eG91LjQha0iH37iMhhG1SAmqQYoA1Kb9dlv+se4L690wNVXz55vLYiUinfa9ZmgrWihyi5T4nbtRlxM8VCdZ@lists.infradead.org, AJvYcCXKtU2V+GBrlyuOaq4ooDnpWHaOkLx/oMJgwpdBFiJiQrJLFh0qdk28CoxHDUUoLmbATsjO3fFkc59EtdpgWEg=@lists.infradead.org
X-Gm-Message-State: AOJu0YySpz7TdOxum3vg8mE2bPlHlCQj94e2EI0fM94N8rvxenkDrAoq
	k6aPl5DavM5daayOrIrW8CUMKGnYmx0pbG2QpgQARIe+RiOjzMuQ
X-Gm-Gg: ASbGnct4Isy57Uq4t4CmnsdqMOL3M+8wy2CsaYFGcWvPYrfLJM+vSOpJdZ1U753YI2V
	Ecu5UbtyZY13vSBg+ka7acVysxyeWjqdX1+2FFWYBHDyQVmg77Ean+mWoiFWKrWRh3xvn9f87ws
	knU1NPovymvjBW99dkRZI/kiSU9DQjE4qTTozFZqPDA7cFPft7fjxdd8Ohg1Plv3VTnlYpAW22a
	+XgvwdHGtuJ52r+z3M3puh4fUj3QJc2w1C7mXKk7UWo6B0W+5uCcOaqkUbCEPlCTHWE4UGQHFzx
	QHxpgRi8Uqq7kmFxNSqqNfZpAmU1+pFhYni7H4MLtLD326vpWXgUq8qZ7r1G7AyKs/wNdudjyEc
	/oylUfvkf1Q==
X-Google-Smtp-Source: AGHT+IHVp+FavjYbgAfIwEPvJkscRMse+kNVdLuitvwX+OUB4oudwxYscfeW6fHR/DYQRCY2BecERA==
X-Received: by 2002:a05:600c:510f:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43f2ff9bf72mr24084135e9.22.1744302655492;
        Thu, 10 Apr 2025 09:30:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 2/6] net: dsa: mt7530: move pkt size and rx err MIB counter to rmon stats API
Date: Thu, 10 Apr 2025 18:30:10 +0200
Message-ID: <20250410163022.3695-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093057_358063_68BF1487 
X-CRM114-Status: GOOD (  14.23  )
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

Drop custom handling of packet size and RX error MIB counter and handle
them in the standard .get_rmon_stats API

The MIB entry are dropped from the custom MIB table and converted to
a define providing only the MIB offset.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530.c | 71 +++++++++++++++++++++++++++++++---------
 drivers/net/dsa/mt7530.h | 17 ++++++++++
 2 files changed, 72 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 85a040853194..54a6ddc380e9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -44,12 +44,6 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0x24, "TxLateCollision"),
 	MIB_DESC(1, 0x28, "TxExcessiveCollistion"),
 	MIB_DESC(1, 0x2c, "TxPause"),
-	MIB_DESC(1, 0x30, "TxPktSz64"),
-	MIB_DESC(1, 0x34, "TxPktSz65To127"),
-	MIB_DESC(1, 0x38, "TxPktSz128To255"),
-	MIB_DESC(1, 0x3c, "TxPktSz256To511"),
-	MIB_DESC(1, 0x40, "TxPktSz512To1023"),
-	MIB_DESC(1, 0x44, "Tx1024ToMax"),
 	MIB_DESC(2, 0x48, "TxBytes"),
 	MIB_DESC(1, 0x60, "RxDrop"),
 	MIB_DESC(1, 0x64, "RxFiltering"),
@@ -58,17 +52,7 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0x70, "RxBroadcast"),
 	MIB_DESC(1, 0x74, "RxAlignErr"),
 	MIB_DESC(1, 0x78, "RxCrcErr"),
-	MIB_DESC(1, 0x7c, "RxUnderSizeErr"),
-	MIB_DESC(1, 0x80, "RxFragErr"),
-	MIB_DESC(1, 0x84, "RxOverSzErr"),
-	MIB_DESC(1, 0x88, "RxJabberErr"),
 	MIB_DESC(1, 0x8c, "RxPause"),
-	MIB_DESC(1, 0x90, "RxPktSz64"),
-	MIB_DESC(1, 0x94, "RxPktSz65To127"),
-	MIB_DESC(1, 0x98, "RxPktSz128To255"),
-	MIB_DESC(1, 0x9c, "RxPktSz256To511"),
-	MIB_DESC(1, 0xa0, "RxPktSz512To1023"),
-	MIB_DESC(1, 0xa4, "RxPktSz1024ToMax"),
 	MIB_DESC(2, 0xa8, "RxBytes"),
 	MIB_DESC(1, 0xb0, "RxCtrlDrop"),
 	MIB_DESC(1, 0xb4, "RxIngressDrop"),
@@ -829,6 +813,60 @@ mt7530_get_sset_count(struct dsa_switch *ds, int port, int sset)
 	return ARRAY_SIZE(mt7530_mib);
 }
 
+static const struct ethtool_rmon_hist_range mt7530_rmon_ranges[] = {
+	{ 0, 64 },
+	{ 65, 127 },
+	{ 128, 255 },
+	{ 256, 511 },
+	{ 512, 1023 },
+	{ 1024, MT7530_MAX_MTU },
+	{}
+};
+
+static void mt7530_get_rmon_stats(struct dsa_switch *ds, int port,
+				  struct ethtool_rmon_stats *rmon_stats,
+				  const struct ethtool_rmon_hist_range **ranges)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_UNDER_SIZE_ERR, 1,
+			       &rmon_stats->undersize_pkts);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_OVER_SZ_ERR, 1,
+			       &rmon_stats->oversize_pkts);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_FRAG_ERR, 1,
+			       &rmon_stats->fragments);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_JABBER_ERR, 1,
+			       &rmon_stats->jabbers);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PKT_SZ_64, 1,
+			       &rmon_stats->hist[0]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PKT_SZ_65_TO_127, 1,
+			       &rmon_stats->hist[1]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PKT_SZ_128_TO_255, 1,
+			       &rmon_stats->hist[2]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PKT_SZ_256_TO_511, 1,
+			       &rmon_stats->hist[3]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PKT_SZ_512_TO_1023, 1,
+			       &rmon_stats->hist[4]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PKT_SZ_1024_TO_MAX, 1,
+			       &rmon_stats->hist[5]);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PKT_SZ_64, 1,
+			       &rmon_stats->hist_tx[0]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PKT_SZ_65_TO_127, 1,
+			       &rmon_stats->hist_tx[1]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PKT_SZ_128_TO_255, 1,
+			       &rmon_stats->hist_tx[2]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PKT_SZ_256_TO_511, 1,
+			       &rmon_stats->hist_tx[3]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PKT_SZ_512_TO_1023, 1,
+			       &rmon_stats->hist_tx[4]);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PKT_SZ_1024_TO_MAX, 1,
+			       &rmon_stats->hist_tx[5]);
+
+	*ranges = mt7530_rmon_ranges;
+}
+
 static int
 mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 {
@@ -3115,6 +3153,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_strings		= mt7530_get_strings,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
+	.get_rmon_stats		= mt7530_get_rmon_stats,
 	.set_ageing_time	= mt7530_set_ageing_time,
 	.port_enable		= mt7530_port_enable,
 	.port_disable		= mt7530_port_disable,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index c3ea403d7acf..9bc90d1678f7 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -423,6 +423,23 @@ enum mt7530_vlan_port_acc_frm {
 
 /* Register for MIB */
 #define MT7530_PORT_MIB_COUNTER(x)	(0x4000 + (x) * 0x100)
+/* Each define is an offset of MT7530_PORT_MIB_COUNTER */
+#define   MT7530_PORT_MIB_TX_PKT_SZ_64	0x30
+#define   MT7530_PORT_MIB_TX_PKT_SZ_65_TO_127 0x34
+#define   MT7530_PORT_MIB_TX_PKT_SZ_128_TO_255 0x38
+#define   MT7530_PORT_MIB_TX_PKT_SZ_256_TO_511 0x3c
+#define   MT7530_PORT_MIB_TX_PKT_SZ_512_TO_1023 0x40
+#define   MT7530_PORT_MIB_TX_PKT_SZ_1024_TO_MAX 0x44
+#define   MT7530_PORT_MIB_RX_UNDER_SIZE_ERR 0x7c
+#define   MT7530_PORT_MIB_RX_FRAG_ERR	0x80
+#define   MT7530_PORT_MIB_RX_OVER_SZ_ERR 0x84
+#define   MT7530_PORT_MIB_RX_JABBER_ERR	0x88
+#define   MT7530_PORT_MIB_RX_PKT_SZ_64	0x90
+#define   MT7530_PORT_MIB_RX_PKT_SZ_65_TO_127 0x94
+#define   MT7530_PORT_MIB_RX_PKT_SZ_128_TO_255 0x98
+#define   MT7530_PORT_MIB_RX_PKT_SZ_256_TO_511 0x9c
+#define   MT7530_PORT_MIB_RX_PKT_SZ_512_TO_1023 0xa0
+#define   MT7530_PORT_MIB_RX_PKT_SZ_1024_TO_MAX 0xa4
 #define MT7530_MIB_CCR			0x4fe0
 #define  CCR_MIB_ENABLE			BIT(31)
 #define  CCR_RX_OCT_CNT_GOOD		BIT(7)
-- 
2.48.1


