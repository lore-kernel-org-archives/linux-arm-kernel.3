Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7892C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+t0ThrIYIg8kRh+6KjbsFKWZobuMu8npO6bHx5WsaE=; b=Xn2sqmrReOjkytaKpkqxB5UIJl
	WUAR4dVHN8cWOVI+mI+iOqUDPI7uk0MrAQY8Qk1iBzOl/jY7vg7/TSwz2/cQAGfSpq9VXHGVvU6HQ
	JiZAkn8WcB7k5wBgfIIPL3L9f5epA0VHkvXFTX8/wYgsPsLoQIlIaO5F1JNG6CcQMdoFEmttsWEzI
	uNRMZoMRDPYftgICNvxJ/BFEjbp6j0U7KLfP4Iom5u7oDj2RPmAURci+dtG6YctkmheeSdWoLA6h9
	YHa4x+x0PHGEMhk/80l9YLlh6MK9GD3FDHmB/hSKxAnbcTvjebBdqtwc6UN1OST2/vZDppxwX5S0S
	26Z1z0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vwV-0000000BQH6-2LEl;
	Thu, 10 Apr 2025 17:43:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2unr-0000000BCnb-3t1j;
	Thu, 10 Apr 2025 16:31:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso8237825e9.2;
        Thu, 10 Apr 2025 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302658; x=1744907458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+t0ThrIYIg8kRh+6KjbsFKWZobuMu8npO6bHx5WsaE=;
        b=iukuGtDT6rZFEZ677t+yFveYin/WXNsxuKwRGSgGXWt3MB4ITWWZkC75GC0skuiRb4
         F1aKYVL7C6OAuB9zoRPhKqGkh/voqsLSE1CnL5WkdHuIMNadnZu668/DfbukGnG+XnR/
         H+YMlFU/rcy6f52QQnZf4kbDRJvOAFUVULAzf5/0bGdA1lHvG+Oz8ZeoHBkeOL6BycQO
         r5CZAJ7VvvqXOypLnZCnEGL3W1bmdCyLbdXJ1OPXYNUszZ07n9FdkA1R3UZvNrP8uBKU
         vjaOnH49vRGlvwjtbF8cA1CjhBcIVDzlp2QVoKD/pRbU9E5qtdU5l86otk09JPkIxr+c
         fOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302658; x=1744907458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+t0ThrIYIg8kRh+6KjbsFKWZobuMu8npO6bHx5WsaE=;
        b=Qlni5LSVD/jQU+4jxBSftfUVixRywGsIxYHXRMkyW+I+zTfA6tIOQD1oRZvE30MuUn
         yzwzyaId6YNxtjCnfDliBXIZ1owCRBh0/kYyO18xmsRH/1zcYOzd41H7DKiZKyYcTVnu
         TZK1WF5ofZlnAInHRp0Q6ok+JTyazmEnEcrfMXNLsQIbJIuqtQgZW6nWMZx99N43HFTI
         yGc3fIpo8uxUUo4U/9AxqRQ7xsxscdHiJXsHIZ9MF3KvVjUNVZWgxAnAMDOrxif9kP5C
         MjVQDB+RgyOW198S+ZwBxZrSI7a1OU4WW7Lqo/A6ZlrqMq1nBeJICp8jgsPs2PJfXGPi
         0Hjg==
X-Forwarded-Encrypted: i=1; AJvYcCWZG2oP9HLoifD7O5VBgF3/L+0j3iK4QUiRwYm2/fNFz/CoPOl/Co+BOhLsIu3eYv6vg29wRs5KGHguzPp0JDfz@lists.infradead.org, AJvYcCWs5aJ6O0XdCma8XhIP0vRgS34dviOwu/YrJVfHTcYVhNJreR74WBhDsGG9G4wAxJ9SyMnFf8PIcRtkQdD1NjU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8e07MtLqf74AVUPmT6nerLKXzErLNFOdzsmrTI12l0Q6smsQh
	Ki50seVGxQ1rT6Opxc5WdKH3e2LYf0YeOt2ndQRqkXhI4Wgx3iEJ
X-Gm-Gg: ASbGncuP4Tbp1VDkEMHZ1xyf2mb6KG+K9k7mNCHpu9PtIdvDWhWshvI0wCYOVyLJKC+
	6XJPDWwi19MqljxI7Q3P/9HPagnUaEWZli9hea6b4h8h4Q2fuSC1sH/z4LLQ7BJTYj0fQ4VARRH
	WISGLGbtmiCNEqGW+xE3frUScU8vuB+E2aXwO/LctY+XKQs7toNbIcWbM3v4SbcnDymNxi2Fw9l
	tdVsPE9gKAgJidj53hxMIW/eWe2DEV8zG4c+49o80D6kk3bLhSiDNybJ7GIrLsg/6ICAhGJI2lN
	iqClW7lSBduBeNg9diuqFToY5mM1CZ4cXWXziC0E0QuU+pq1pn/etEfQG4gyzIjFQsl8hHVZtbr
	x4PwNp+Nzuw==
X-Google-Smtp-Source: AGHT+IFY5aV83GlIg+n7ieI6jdJYgPToMMFEdF0UZ8l6w8maxikCyARfM8V5dWLEqlrZ22qBBqnhFw==
X-Received: by 2002:a05:600c:190e:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-43f2d798f69mr35478345e9.3.1744302658070;
        Thu, 10 Apr 2025 09:30:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:57 -0700 (PDT)
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
Subject: [net-next PATCH 4/6] net: dsa: mt7530: move pkt stats and err MIB counter to eth_mac stats API
Date: Thu, 10 Apr 2025 18:30:12 +0200
Message-ID: <20250410163022.3695-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093059_967603_8F2673F3 
X-CRM114-Status: GOOD (  14.98  )
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

Drop custom handling of TX/RX packet stats and error MIB counter and handle
them in the standard .get_eth_mac_stats API

The MIB entry are dropped from the custom MIB table and converted to
a define providing only the MIB offset.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530.c | 70 ++++++++++++++++++++++++++++++++--------
 drivers/net/dsa/mt7530.h | 14 ++++++++
 2 files changed, 70 insertions(+), 14 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f183a604355e..2202c657930e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -34,24 +34,10 @@ static struct mt753x_pcs *pcs_to_mt753x_pcs(struct phylink_pcs *pcs)
 static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0x00, "TxDrop"),
 	MIB_DESC(1, 0x04, "TxCrcErr"),
-	MIB_DESC(1, 0x08, "TxUnicast"),
-	MIB_DESC(1, 0x0c, "TxMulticast"),
-	MIB_DESC(1, 0x10, "TxBroadcast"),
 	MIB_DESC(1, 0x14, "TxCollision"),
-	MIB_DESC(1, 0x18, "TxSingleCollision"),
-	MIB_DESC(1, 0x1c, "TxMultipleCollision"),
-	MIB_DESC(1, 0x20, "TxDeferred"),
-	MIB_DESC(1, 0x24, "TxLateCollision"),
-	MIB_DESC(1, 0x28, "TxExcessiveCollistion"),
-	MIB_DESC(2, 0x48, "TxBytes"),
 	MIB_DESC(1, 0x60, "RxDrop"),
 	MIB_DESC(1, 0x64, "RxFiltering"),
-	MIB_DESC(1, 0x68, "RxUnicast"),
-	MIB_DESC(1, 0x6c, "RxMulticast"),
-	MIB_DESC(1, 0x70, "RxBroadcast"),
-	MIB_DESC(1, 0x74, "RxAlignErr"),
 	MIB_DESC(1, 0x78, "RxCrcErr"),
-	MIB_DESC(2, 0xa8, "RxBytes"),
 	MIB_DESC(1, 0xb0, "RxCtrlDrop"),
 	MIB_DESC(1, 0xb4, "RxIngressDrop"),
 	MIB_DESC(1, 0xb8, "RxArlDrop"),
@@ -811,6 +797,61 @@ mt7530_get_sset_count(struct dsa_switch *ds, int port, int sset)
 	return ARRAY_SIZE(mt7530_mib);
 }
 
+static void mt7530_get_eth_mac_stats(struct dsa_switch *ds, int port,
+				     struct ethtool_eth_mac_stats *mac_stats)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	/* MIB counter doesn't provide a FramesTransmittedOK but instead
+	 * provide stats for Unicast, Broadcast and Multicast frames separately.
+	 * To simulate a global frame counter, read Unicast and addition Multicast
+	 * and Broadcast later
+	 */
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_UNICAST, 1,
+			       &mac_stats->FramesTransmittedOK);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_SINGLE_COLLISION, 1,
+			       &mac_stats->SingleCollisionFrames);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_MULTIPLE_COLLISION, 1,
+			       &mac_stats->MultipleCollisionFrames);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_UNICAST, 1,
+			       &mac_stats->FramesReceivedOK);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_BYTES, 2,
+			       &mac_stats->OctetsTransmittedOK);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_ALIGN_ERR, 1,
+			       &mac_stats->AlignmentErrors);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_DEFERRED, 1,
+			       &mac_stats->FramesWithDeferredXmissions);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_LATE_COLLISION, 1,
+			       &mac_stats->LateCollisions);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_EXCESSIVE_COLLISION, 1,
+			       &mac_stats->FramesAbortedDueToXSColls);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_BYTES, 2,
+			       &mac_stats->OctetsReceivedOK);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_MULTICAST, 1,
+			       &mac_stats->MulticastFramesXmittedOK);
+	mac_stats->FramesTransmittedOK += mac_stats->MulticastFramesXmittedOK;
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_BROADCAST, 1,
+			       &mac_stats->BroadcastFramesXmittedOK);
+	mac_stats->FramesTransmittedOK += mac_stats->BroadcastFramesXmittedOK;
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_MULTICAST, 1,
+			       &mac_stats->MulticastFramesReceivedOK);
+	mac_stats->FramesReceivedOK += mac_stats->MulticastFramesReceivedOK;
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_BROADCAST, 1,
+			       &mac_stats->BroadcastFramesReceivedOK);
+	mac_stats->FramesReceivedOK += mac_stats->BroadcastFramesReceivedOK;
+}
+
 static const struct ethtool_rmon_hist_range mt7530_rmon_ranges[] = {
 	{ 0, 64 },
 	{ 65, 127 },
@@ -3163,6 +3204,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_strings		= mt7530_get_strings,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
+	.get_eth_mac_stats	= mt7530_get_eth_mac_stats,
 	.get_rmon_stats		= mt7530_get_rmon_stats,
 	.get_eth_ctrl_stats	= mt7530_get_eth_ctrl_stats,
 	.set_ageing_time	= mt7530_set_ageing_time,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index a651ad29b750..0cc999fa1380 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -424,6 +424,14 @@ enum mt7530_vlan_port_acc_frm {
 /* Register for MIB */
 #define MT7530_PORT_MIB_COUNTER(x)	(0x4000 + (x) * 0x100)
 /* Each define is an offset of MT7530_PORT_MIB_COUNTER */
+#define   MT7530_PORT_MIB_TX_UNICAST	0x08
+#define   MT7530_PORT_MIB_TX_MULTICAST	0x0c
+#define   MT7530_PORT_MIB_TX_BROADCAST	0x10
+#define   MT7530_PORT_MIB_TX_SINGLE_COLLISION 0x18
+#define   MT7530_PORT_MIB_TX_MULTIPLE_COLLISION 0x1c
+#define   MT7530_PORT_MIB_TX_DEFERRED	0x20
+#define   MT7530_PORT_MIB_TX_LATE_COLLISION 0x24
+#define   MT7530_PORT_MIB_TX_EXCESSIVE_COLLISION 0x28
 #define   MT7530_PORT_MIB_TX_PAUSE	0x2c
 #define   MT7530_PORT_MIB_TX_PKT_SZ_64	0x30
 #define   MT7530_PORT_MIB_TX_PKT_SZ_65_TO_127 0x34
@@ -431,6 +439,11 @@ enum mt7530_vlan_port_acc_frm {
 #define   MT7530_PORT_MIB_TX_PKT_SZ_256_TO_511 0x3c
 #define   MT7530_PORT_MIB_TX_PKT_SZ_512_TO_1023 0x40
 #define   MT7530_PORT_MIB_TX_PKT_SZ_1024_TO_MAX 0x44
+#define   MT7530_PORT_MIB_TX_BYTES	0x48 /* 64 bytes */
+#define   MT7530_PORT_MIB_RX_UNICAST	0x68
+#define   MT7530_PORT_MIB_RX_MULTICAST	0x6c
+#define   MT7530_PORT_MIB_RX_BROADCAST	0x70
+#define   MT7530_PORT_MIB_RX_ALIGN_ERR	0x74
 #define   MT7530_PORT_MIB_RX_UNDER_SIZE_ERR 0x7c
 #define   MT7530_PORT_MIB_RX_FRAG_ERR	0x80
 #define   MT7530_PORT_MIB_RX_OVER_SZ_ERR 0x84
@@ -442,6 +455,7 @@ enum mt7530_vlan_port_acc_frm {
 #define   MT7530_PORT_MIB_RX_PKT_SZ_256_TO_511 0x9c
 #define   MT7530_PORT_MIB_RX_PKT_SZ_512_TO_1023 0xa0
 #define   MT7530_PORT_MIB_RX_PKT_SZ_1024_TO_MAX 0xa4
+#define   MT7530_PORT_MIB_RX_BYTES	0xa8 /* 64 bytes */
 #define MT7530_MIB_CCR			0x4fe0
 #define  CCR_MIB_ENABLE			BIT(31)
 #define  CCR_RX_OCT_CNT_GOOD		BIT(7)
-- 
2.48.1


