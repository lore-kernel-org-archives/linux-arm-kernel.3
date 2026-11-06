Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30218606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zA20rXaQ;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k8ZsrgO/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x0suRdZ6/DF0tbptt+Dz30G9c7M6uSYDspT/LuLlnuM=; b=zA20rXaQDA10jD
	6Oj7H3hSF0Yhl/7OVvCu3OBa+tNmkxavKnE4Xai9BABgnrzEYeFBhhWcrP7J14rO5b04YmT4+xmB/
	ZA5V0k1QP6V0PD/rQ319JCEqSIOK5Yh0MjHKZQ6CKvmJ3yVukO8DpKKPnP6TJ8g8DTu8ZLxAmov8u
	Q8Kx4syqhLiB1qDqZ5XFv6jxlh4Z//EHntxqal5GRUjHeG2p9OGBKVAeIaEeLcOc97+RbFrhmMN+R
	pmV7UleDgNFLyfAv3LDZFL96h/VSOESLDXus22r7VQVBI2kyCRjK5mp0rzzvwBYB4PT27bXG1nPxP
	GCVRtn9HejKU3E9J2f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFtk-0000000BetI-0CJV;
	Fri, 06 Nov 2026 09:06:12 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFte-0000000BepL-3fqM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=x0
	suRdZ6/DF0tbptt+Dz30G9c7M6uSYDspT/LuLlnuM=; b=k8ZsrgO/gGZjMnHHiD
	G2oXQYV0mkoAFKpqAXiK9xMILaV0idwWttTqIVBt9qK5rB6923Phrln8Eshqwhb5
	J7JeyIdgqZ804sjdc/R2c6Vf6nflQsY0DTFTgNf0xR2jDcBiUKNKTjXl8oAZAaCJ
	X7yl1Qq8wbS0SguxU8bWT1rmo=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3_7hJmO1qqwdQFQ--.15084S6;
	Fri, 06 Nov 2026 17:05:41 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net-next v6 RESEND 4/4] net: stmmac: hold RTNL when reading descriptor rings in descriptors_status
Date: Fri,  6 Nov 2026 17:05:06 +0800
Message-Id: <20261106090507.1020751-5-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106090507.1020751-1-dinghui1111@163.com>
References: <20261106090507.1020751-1-dinghui1111@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_7hJmO1qqwdQFQ--.15084S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrW7Kr4rAr4kXr13Ww17ZFb_yoW5CrWrpa
	y3CayqkrykJF15Ja1DCw48Xa45Ga95tFW3Wrn7Gr1fA3WjvFZ0gwnIgry3WFyDGFWkX3Z3
	K3Wq93sxGFW8C37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6XdbUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0QVVgWrtmGVRiAAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_010607_327346_CDABD36F 
X-CRM114-Status: GOOD (  13.65  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

The descriptors_status debugfs entry inspects the descriptor rings
without any synchronization against the control-plane paths that
tear them down (ndo_stop, MTU change, XDP program release, XSK pool
reconfiguration). All of those paths hold RTNL, so take the same
lock around the reader.

Holding RTNL also makes it safe to report queues whose descriptor
rings are not allocated: the interface may be IFF_UP with unallocated
rings when an internal reopen fails (e.g. an MTU change whose
__stmmac_open() call fails), as those paths do not clear IFF_UP.
Skip such queues with a hint instead of dereferencing a NULL pointer
in stmmac_rings_status_show().

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b093119e752f..0f4af7ec3fc8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6707,8 +6707,10 @@ static int stmmac_rings_status_show(struct seq_file *seq, void *v)
 	u8 tx_count = priv->plat->tx_queues_to_use;
 	u8 queue;
 
+	rtnl_lock();
+
 	if ((dev->flags & IFF_UP) == 0)
-		return 0;
+		goto out;
 
 	for (queue = 0; queue < rx_count; queue++) {
 		struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
@@ -6716,10 +6718,20 @@ static int stmmac_rings_status_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "RX Queue %d:\n", queue);
 
 		if (priv->extend_desc) {
+			if (!rx_q->dma_erx) {
+				seq_puts(seq, "Extended descriptor ring not allocated\n");
+				continue;
+			}
+
 			seq_printf(seq, "Extended descriptor ring:\n");
 			sysfs_display_ring((void *)rx_q->dma_erx,
 					   priv->dma_conf.dma_rx_size, 1, seq, rx_q->dma_rx_phy);
 		} else {
+			if (!rx_q->dma_rx) {
+				seq_puts(seq, "Descriptor ring not allocated\n");
+				continue;
+			}
+
 			seq_printf(seq, "Descriptor ring:\n");
 			sysfs_display_ring((void *)rx_q->dma_rx,
 					   priv->dma_conf.dma_rx_size, 0, seq, rx_q->dma_rx_phy);
@@ -6732,16 +6744,29 @@ static int stmmac_rings_status_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "TX Queue %d:\n", queue);
 
 		if (priv->extend_desc) {
+			if (!tx_q->dma_etx) {
+				seq_puts(seq, "Extended descriptor ring not allocated\n");
+				continue;
+			}
+
 			seq_printf(seq, "Extended descriptor ring:\n");
 			sysfs_display_ring((void *)tx_q->dma_etx,
 					   priv->dma_conf.dma_tx_size, 1, seq, tx_q->dma_tx_phy);
 		} else if (!(tx_q->tbs & STMMAC_TBS_AVAIL)) {
+			if (!tx_q->dma_tx) {
+				seq_puts(seq, "Descriptor ring not allocated\n");
+				continue;
+			}
+
 			seq_printf(seq, "Descriptor ring:\n");
 			sysfs_display_ring((void *)tx_q->dma_tx,
 					   priv->dma_conf.dma_tx_size, 0, seq, tx_q->dma_tx_phy);
 		}
 	}
 
+out:
+	rtnl_unlock();
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(stmmac_rings_status);
-- 
2.34.1


