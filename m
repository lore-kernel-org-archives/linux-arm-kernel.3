Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94320CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVSxnwIJqZkRreJjQfIbbsxCcEJwuhlGaTzg7HTiWVo=; b=MHXSjDyFUSl2VX57KtWLd5JA65
	tStoF/lTGaH3wzZdN4a4+PeB2R8aVaH2jHgnjRe9fNDi2TIUZj1CbN0sQmXy4U3JSH/aXMAa3n+Se
	Fw7dZr3DrOZPu42dKsF+VI5WmxpA19K9Z3WTFOazxlUzp+ZYuUbfHfIGomEC5/ASnojysuZlS0cjA
	C2Bys+omQS/g8gFAkUzQRzJCYUCm5H0DSHeo+zk7BPT84dxoc345NcY1nqRMuK8NunCWgJHbjkRpJ
	ypasmiiQ6w2ZwQHhI/wHOi8SY44rMXDJCmpAKzGgvhiPaai4rRRrw1N9E6/ahJ/POPeoEU4CyPPzl
	TTBqB2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWyU-00000003X9X-1fEj;
	Tue, 29 Sep 2026 12:30:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWyT-00000003X9N-3ksW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:30:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC6A0600D1;
	Tue, 29 Sep 2026 12:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DEB1F000FF;
	Tue, 29 Sep 2026 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685020;
	bh=QVSxnwIJqZkRreJjQfIbbsxCcEJwuhlGaTzg7HTiWVo=;
	h=From:To:Cc:Subject:Date;
	b=ICPG7vJnAzgTQM2w+rZppwMb+SCGx+5MYluqDgDo7PyScOsCn4Rr/0zi+A14DkDJf
	 BR+q9nX5vKv7YBXjFb7KQShAOujypriP/jyGlj7H0jMoLA1aA5y0/x5O/RFdicgu6M
	 wzFRCEgYfxCj14u0bTMTERETJUWIq2dikDw2O7IGNRdm1jRWMNTwDjFH35SELcfBXw
	 jh9SSsQZdozVlPUsFPEkUH/P4Q79ZpSKAjt5IpXiNVo2LRHKo+zAfoYpgzhimNHdbJ
	 bwopsB+IAvgauJa/ALSnSOd8s5w6DKCU2rkoBdn+mIohsKdPDx9OpLabR+OeFV5TNO
	 //DNVUdkT/77A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: Disable checksum insertion for XDP frame TX
Date: Tue, 29 Sep 2026 20:10:25 +0800
Message-ID: <20260929121025.20821-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

stmmac enables TX checksum insertion for XDP frames whenever the queue
supports it. XDP frames carry no TX checksum offload request, so this
can overwrite a checksum already present in the packet.

Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
so that the packet is sent with its checksum fields unchanged.

Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Fixes: 8b278a5b69a2 ("net: stmmac: Add support for XDP_REDIRECT action")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b..8fe75b00974f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5184,7 +5184,6 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 {
 	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
-	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
 	unsigned int entry = tx_q->cur_tx;
 	enum stmmac_txbuf_type buf_type;
 	struct dma_desc *tx_desc;
@@ -5229,7 +5228,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
 
 	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->descriptor_mode, true, true,
+			       false, priv->descriptor_mode, true, true,
 			       xdpf->len);
 
 	tx_q->tx_count_frames++;
-- 
2.53.0


