Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC31C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsZOltiP1R8W8vsyrS5UrPX+wRdKVv3/djndYWU1II4=; b=X+aWJB+f+0Nldhwp9jf49Rspgj
	zKdJv/ubMBspon8nAR2grmNo8B4+b9d6rb5PBsAXESmRkY1jfOl/kteW+nrrrkNT8wWo5Tt4jIKwj
	UjD/qC5zNA4uYGWCaKu9CDLiZDPu9KXHNljVboSi23OH0bG+8iRf7uQ90u98qO0hdIDslW67sRSzz
	OoAFdyjTWpdubSAxZ+DAVI3d12nJmYNBlVWEFEWsEX/AX1bnbdhyjmK27Qc3xrv4xXPuOQnu66nTe
	nwG/CDXG6HRecFiJfqesj9Kl6VRu035HrJpHmc38FIg+hWpDgrJFOrmX1aBBseKAy6c/6p8nH/nIU
	7unwCbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XE1-0000000DQdX-0MxD;
	Thu, 10 Sep 2026 05:21:29 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XDx-0000000DQbz-0YY0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 05:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1789017620;
	bh=DsZOltiP1R8W8vsyrS5UrPX+wRdKVv3/djndYWU1II4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ofOgsQ3z9ZSI+NQTvkYnwJHgLw2f4q224IqWxMZcjXamv8feqMJX7NWm1hjwF9XtV
	 Imbx27zURAqC2sB5W6p1CICDxNhoVSpUh6X7IJ9zw3aEZNyPpMaNX8IC89KouVYu1V
	 WlgDToMzaAc7bVAnDmyqmv01kkQmr7SDGKlnuXpM=
X-QQ-mid: esmtpsz19t1789017609t8b058a96
X-QQ-Originating-IP: DUmqSkz4nEReLFqUyWpMium9HE3atKEqluVbWzOIZ6Q=
Received: from [10.10.7.69] ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 13:19:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6560279084322675743
EX-QQ-RecipientCnt: 14
From: ZhaoJinming <zhaojinming@uniontech.com>
Date: Thu, 10 Sep 2026 13:19:44 +0800
Subject: [PATCH net] net: stmmac: fix stale descriptors and DMA mapping
 leak on Tx map failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>
X-B4-Tracking: v=1; b=H4sIAO89omoC/x2M0QqDMAwAf0XyvEAU7HC/MvYQ2ziDWqWRIhT/f
 WWPB3dXwCSpGLyaAkmymu6xQvtowM8cv4IaKkNHnaOBBrRz29jjpBfmlSMGMY+r8IIT9c9xJNc
 GZqj9kaRa//cbopzwue8fTPoWLXAAAAA=
X-Change-ID: 20260909-stmmac-fix-vlan-desc-leak-f057bb061daa
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>
X-Mailer: b4 0.14.2
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NDtUtlvFer7vvhZCV/FA4NQc2y41TiKxFpgyi8xxS20SWJISRL7hVIFY
	I0QZ3FBzegeQUJEnWZET9xi0jToPT/C/3j0PyQGj5iTPZrHlGUxTLby5eXOw9EWraUrhzD0
	CugrMVlfcJqQgnL0L0MbcJqzE2wY2erVQh/HTyEmy0ON0782AhQNiE4NTuMKBl3S/ei/bTg
	pD7nOEUETIEJnxrN1g7OF7v/MNQS2ELwiefH4iR6OBPqo8LLfA+35KrCodE0ih9L86g/q+x
	6KRfOXltimPkhYDOKeCrBunnLra84etAb/zg2Gpc6077j8tZMUeN9ClSxQJNdFg/zlrsvb4
	NvZwEXlUANBl4BDwbM6qF+0VScg6o4YUxxMi0/W0aOzgFlRtFwRFzI9/Aa7++US7FerxPGk
	y+8lfJcoCpdv435UWjU+fcu6SS8sT9RSZ9OzKR9tmvymAooz321amNeTiNbJwwEwdyyJ+/y
	y/HAGx0R8MOagrHl81lAMWmtVym/xzMsqUb5JxXfVGu4QVhO7M8MA+ZErkFFP6rWLjysMAP
	79BoM/1IIoXVfQmbgGtQcH05+UEHzvhofkPNhtZp1TJT+In9f1WZY0DNaJz0lyp8X/mwXYT
	j+U9k7FPL1at6GwMDMtkAu+7T+SX69MLMK3SzjIWrtDwmSqIWpBvEJT680uvOuSoY1H5pH8
	By+312GkXRCGZrKUXP6VZtjVfUx82HaHx+iYYWfDuyr2JOcbMVoxXn+pNKFfS6o4qdo4b0w
	A9T7yPQyT9Df8AZPBIPblIZkV/i0mvsKPDDhWG558v8i7tPpcFGB7Rs4Lh+X4nOqHkId9MC
	QI1VurVx+NVbJpLSX+6NO0s2LaF2vy4MtMzdY05pyevaMEC5nQ/QmmhZgukfEn5XwQIH4fj
	eoerx0K1XCAFaQyB/tMBQciahDox3YorhVUxs5BryVXFsPW8uX83sA12PWejr/UJYQajrM5
	a0ebTwVf7gKfsLjY/dTtFZ4NTFAK6gD3vdn58WxTlBzBAc56AxC4eQii/73vHT6aHhyuLPw
	QiVao+TncFheqkisAL5bd35m3qtgQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222125_989499_B0601814 
X-CRM114-Status: GOOD (  13.98  )
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

In stmmac_xmit(), when the DMA mapping of the linear part or of a
fragment fails, the error path only frees the skb.  This leaves behind
the DMA mappings already created for the linear part and for the
fragments mapped before the failure, which are never unmapped.

The VLAN context descriptor programmed by stmmac_vlan_insert() is also
left behind with its OWN bit set while tx_q->cur_tx has been advanced
past it, so the DMA engine later consumes the orphaned descriptor and
applies its stale VLAN tag to an unrelated frame.

Release the descriptors and their DMA mappings in the dma_map_err path
with stmmac_release_tx_desc() and stmmac_free_tx_buffer(), walking from
first_entry to entry, then roll back tx_q->cur_tx and release the VLAN
context descriptor.

Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 29 +++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b14454fb10deced6516eb89e2c0c9..2e36c27e2cfb436af3566cf1c3e70d32ce9830a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4769,12 +4769,12 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	unsigned int nopaged_len = skb_headlen(skb);
 	u32 queue = skb_get_queue_mapping(skb);
 	int nfrags = skb_shinfo(skb)->nr_frags;
-	unsigned int first_entry, tx_packets;
+	unsigned int first_entry, entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
 	struct dma_desc *desc, *first_desc;
 	struct stmmac_tx_queue *tx_q;
 	int i, csum_insertion = 0;
-	int entry, first_tx;
+	int first_tx, ret;
 	dma_addr_t dma_addr;
 	u32 sdu_len;
 
@@ -4832,9 +4832,10 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	csum_insertion = skb->ip_summed == CHECKSUM_PARTIAL;
 
 	if (unlikely(is_jumbo)) {
-		entry = stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
-		if (unlikely(entry < 0) && (entry != -EINVAL))
+		ret = stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
+		if (unlikely(ret < 0) && (ret != -EINVAL))
 			goto dma_map_err;
+		entry = ret;
 	} else {
 		bool last_segment = (nfrags == 0);
 
@@ -4984,6 +4985,26 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 dma_map_err:
 	netdev_err(priv->dev, "Tx DMA map failed\n");
+
+	/* entry points one past the last descriptor written for this frame:
+	 * on failure it is the descriptor whose DMA mapping failed, so walk
+	 * from first_entry up to, but not including, entry.  Reset cur_tx
+	 * unconditionally as both stmmac_vlan_insert() and stmmac_jumbo_frm()
+	 * may have advanced it, and release the VLAN context descriptor.
+	 */
+	while (first_entry != entry) {
+		desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
+		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue, first_entry);
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
+	}
+
+	tx_q->cur_tx = first_tx;
+	if (has_vlan) {
+		desc = stmmac_get_tx_desc(priv, tx_q, first_tx);
+		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
+	}
 max_sdu_err:
 	dev_kfree_skb(skb);
 	priv->xstats.tx_dropped++;

---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260909-stmmac-fix-vlan-desc-leak-f057bb061daa

Best regards,
-- 
ZhaoJinming <zhaojinming@uniontech.com>


