Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E93ACA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGfEP9YKt+sxdoo5ymI5NTrv8fzOq/Y6MXhmWkaNL/o=; b=QP4yGA04VwFpTC5ilIIMSCctW+
	+aGCDuoUm3TiD5DnkbCes0KIcjuyE3soov7WZA0WLjiqrJBPttET+05wyEld/N4U9YcJVtbbJNP8Z
	QBJHVDBdJNCOPHxJOoLglkdROJI4E2jj6cIJxHWohCGlEHaIV/DQCu+9xhebQXpE1it+S26O6A9lt
	R4sUcHKv2iI9XaavYYVVcvBZGoH7bjr96ARoGvwy+6y9k6DW/q62ujbKGbT9pFqyvvlEQW+dxQZgM
	P0gbkwxOLB2Q12tqaYC006Sq/fYSWK3sf/2F6SRJnw2P8JlCeemhrdkVQbOpXR5an5ez0oQ35XNlz
	fTc0HlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8nb-00000007m9x-19dH;
	Thu, 01 Oct 2026 04:53:39 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8nY-00000007m9M-3A90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:53:37 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-81b02c279beso3672517a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790830415; x=1791435215; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qGfEP9YKt+sxdoo5ymI5NTrv8fzOq/Y6MXhmWkaNL/o=;
        b=QRu28ZwjJhbAEoqr0deKHMQsW/TS6CvxbN8YtsGS4QGoQhZCVN/jORQs8YLIl2al7b
         ekYcbMgoFsjpO9AW5icZKWWQGNB2aKMshlE/aaQAWMGTbe1yaaBkpDeElbXPTLiNCC3m
         UpazKbtNhlJIjm2+8f79/m8LoJpD6/acIxXUtCZuweHF9/pxLugVTKg7LvPg0+xABniz
         Mw99c6n7xbaqKMg1fs6QiXda+8aEVxe1mUb8VJNpwMHYFOtYJfni3TZhxqdOGYsQ2DqZ
         tior9BSwZUg6w4TwVMMLiq+jXAfd7y9Rhb8EBGYDOM/Ke8ZKuMg06F1PH+AsZFobu76G
         ELBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790830415; x=1791435215;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qGfEP9YKt+sxdoo5ymI5NTrv8fzOq/Y6MXhmWkaNL/o=;
        b=wxFl0qiMPkP0aBVyJofyehy4ucqYZKcqd+ZMtDO+//hYvAw164skzo+rsxMC8/sPM2
         2rpEd39cg1+gFwyxQFec4999/MQtPavR312huUZLOvNFdSalIPV1If1mBZzjZ8LcQ2JJ
         E36UjaVdjUkDVb+h3pLTXrf+IKJBEtmZHvcAxVSzuagTK286T68lAGjtapzhuGnC8I4Y
         kkkTRb/j0n4Sj2G7oxT7vqTtmDZsjMu/Y/L4FbCmo1Xsjp8n/45xbUdyEBiNMt3jQX0D
         8rfpaD5K3TcpN8XaK83BstPmM9STTlb1/K/0u6J6bMUfvILMqgsnmZCV/A8D8d2MtGX6
         t6AQ==
X-Forwarded-Encrypted: i=1; AKwUvByZZWcUXIiUnjspN3ZP7cm8sx95ZjkE1+691VKw3mmImgyb0+cKe9jsvjm/ZHjaXaIuKu293nPFw0meBtimJP5E@lists.infradead.org
X-Gm-Message-State: AFuF++mGccqbhViZC8NsKKewtVjAdXC0wEPrtFjT914MMDPsx7VnYrEQ
	HwWEFQvHV1aqkFlPhNerFfJonVntRaFS897YEvhPLRRX5W2JqhX6B3mP
X-Gm-Gg: AYBFou3sMwV3qSLQb6JKofY6iItVMmgYr146Ci6DVy149rPFAKtE7oqwxIR3VugWd5M
	a2mcJmJuKY1UzKume1FOq+pDBQUQwDd3kAtZCy2IpxqekDApC+tgYLIIy0BtqcHE6O1CCt8jgOQ
	DE1CAp4yTMsNf0Ybs/rNgO69/Kdl+qK83viW51Hc+wATwfmh7PnHYLjdIrSz7xwc/LZ1OoRTeSk
	toIvkDP2UbMGsDrfh5HG25k+wftseXBEqQPL1Dr9AJWzlq/omrwDXhexDj1gsb8M1bJyc32Uedm
	QfmGUnDcGdQ1mwqA6iUCjrDoI3imat7sN+48JfYm7fFhvhYmX/NhE6QtEkDAx9oSzcR0CXR6Hbb
	0T5giMn8sZ4jxSaYRxfav/90/jImhQTcq9Mu0FLSEA6LTTvCXd6ADMifa5pfoGFKQ+TTfGSSh7W
	7aAj04VnwpfcnHGjd6twfPOfkMbmJ3jX+7TZmOdr/kkgMdxbIl+Q4Tw4GcbAmG3yb3mXtdejgiE
	/O4RoSuj3FWPXZoRA9fg3CgQe0mKyjFkuDCu7ewXIB0Y3ot0Wuwy2++UVSs07MSPBctttYd9ha6
	2AxFhcbzLxkkf/rgLOTHLX4iYAn6TZk48Maiapei/egzsHXHgLvmXgiVwEJbXDpAzbSyzbCDRpD
	A9EqzznT5pp9iQf6ERzCPlP2esDKzynM=
X-Received: by 2002:a05:6830:621a:b0:805:352c:a6a1 with SMTP id 46e09a7af769-8204aa5b392mr3774356a34.24.1790830415616;
        Wed, 30 Sep 2026 21:53:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212aa1b208sm1788977a34.14.2026.09.30.21.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:53:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:53:26 -0600
Subject: [PATCH net] net: stmmac: take ownership of saved RX state at poll
 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MTQ6DIBCFr2JmXRJwLKBXMS5GHFoWaAu0MTHev
 aTt7n3v74DMKXCGoTkg8TvksK0V1KUBd6f1xiIslaGVrZY9SpFLjORE2quiwkJ2Co3iDtk6qKt
 HYh/27+MIKxeYfmbi56u+l38yU2bhthhDGRqD5rqgRd1RT6S1n1EZpWfHnj1aYkdLbViYzvMDl
 9fpd7IAAAA=
X-Change-ID: 20260930-stmmac-rx-state-041371e43e8c
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_215336_813957_139CC7FE 
X-CRM114-Status: GOOD (  14.43  )
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

When a saved partial packet completes with a poll budget of one, the
old loop can leave state_saved and state.skb pointing at an skb that
has already been delivered or freed. The next poll then reuses that
pointer, causing a use-after-free or double free.

Take the saved state at poll entry and clear the stored ownership
immediately. Save it again only if the packet remains incomplete,
including when the next descriptor is still DMA-owned. Release a
saved partial skb when the RX ring is destroyed.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ec62fa7418f4..1a4d03aaaf78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2149,6 +2149,11 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		dma_free_rx_skbufs(priv, dma_conf, queue);
 
+	if (rx_q->state_saved)
+		dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = 0;
+
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
 
@@ -5726,6 +5731,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	struct stmmac_xdp_buff ctx;
 	bool fcs_stripped = false;
 	int xdp_status = 0;
+	bool in_progress = rx_q->state_saved;
 	int bufsz;
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
@@ -5740,6 +5746,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
 	}
+	if (in_progress) {
+		skb = rx_q->state.skb;
+		error = rx_q->state.error;
+		len = rx_q->state.len;
+		rx_q->state.skb = NULL;
+		rx_q->state_saved = false;
+	}
+
 	while (count < limit) {
 		unsigned int buf1_len = 0, buf2_len = 0;
 		enum pkt_hash_types hash_type;
@@ -5748,12 +5762,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		int entry;
 		u32 hash;
 
-		if (!count && rx_q->state_saved) {
-			skb = rx_q->state.skb;
-			error = rx_q->state.error;
-			len = rx_q->state.len;
-		} else {
-			rx_q->state_saved = false;
+		if (!in_progress) {
 			skb = NULL;
 			error = 0;
 			len = 0;
@@ -5787,6 +5796,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5971,7 +5982,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls || skb) {
+	if (in_progress || skb) {
 		rx_q->state_saved = true;
 		rx_q->state.skb = skb;
 		rx_q->state.error = error;

---
base-commit: 7375d38364a9aa66fb31716bcefef38aecad75d8
change-id: 20260930-stmmac-rx-state-041371e43e8c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


