Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1921049523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rpidXVVDoCtCkRYl0DmYJZsfgbhv+B1m4hTkd40PP4=; b=JlHa8hjshenQcgt6Ph9teh9NUq
	fNAWEVHSLTuzH2izYS60qnlaBoxC/7holmZ0l5OGnyoFWUsoV3sLaBS3haqzcoBKeDrCVeH/mgHf+
	P+G4sNG5BlOArLG6A1+iRNNvZzG9n4ktGbx+21RVAYIuFioQ9OWOvAsCIQruDPHf3xQYtCokgSi8z
	yUtxYwPxJ0G6DPfnk+J9fQ4PG8LXuxrgIFtxfual6H+HNMw6RKQR4xUamxocyUPkKLgcu9LFoLYQN
	1wNkTJS9WrtAYr7UM2n1yEJCqMgvjQkZFN9Z4pn70E6azGZuHKDVHZpaAjXxZS4JPyAxy1JRkY3i0
	/7Xmycpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFY-0000000BKrd-2VdB;
	Wed, 11 Mar 2026 09:53:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFX-0000000BKqO-1DXh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=5rpidXVVDoCtCkRYl0DmYJZsfgbhv+B1m4hTkd40PP4=; b=NMqi+pQTbO4cwV3xcfvqJ5ubPS
	FDspPmbNSWeCmkyEmoaK8LQzJE4FiFeBMNQk/jlhMl4ljwANeZ347/PrzbRnFQw9ytY1DKI5hg+nd
	34MpPt7b1RwxEoHyT/3v2m7K7dNS5EQZqqZFvwqRKO3HfpVBcYAsywXH/rmRXZvY2jKSGhjGeADC2
	NgQEWpTlOHo1V29g5AJ8scBcQS4RStyZpXs5+kizokLXPyTKPaHhWZPYphURNTjE6DC1ccoDAIMng
	NW8tLO5JwIqAwBKJVH1qHmGDF8E5GO9VYFGTakMnOSU8Yg7Mqvzm79lLk8xXvyVp7VUUUEo2kenzB
	+X14gz4A==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFU-0000000GcNZ-2nDJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5rpidXVVDoCtCkRYl0DmYJZsfgbhv+B1m4hTkd40PP4=; b=CkOvZyjsaGMu3pFYdhbmUEfiki
	efI96mwiwTd03kmdG7WB037nujZp6KXMUOfVJXT25KRS+d+ihRG0zd9EyI+8xrI5CbjQBR505+aSx
	S/JZGu+8DyzqIZKYlYaP9q7eketVQDLnxlepX59q5BSJTJr/UAMlmTkdeML+yoOtZpGtiaUEho5Ch
	bYeTS8qcpyqQ4Y6aHnSthc6SrzwffzgdZy9jrojhw2G/rxoLRvy+vuq3Q1q2Ym6JqwcuYN/MiaknE
	rjx4cDLGFXInDyWa8X0qlNteRW3/D5CPrs1dzgm9rt56uyPugjlHBbrP6b9hFW1vvn79T4IN89o3h
	qWgz3M/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59108 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GFE-0000000068f-2Qet;
	Wed, 11 Mar 2026 09:52:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GFB-0000000CiTJ-0lYt;
	Wed, 11 Mar 2026 09:52:45 +0000
In-Reply-To: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 08/15] net: stmmac: use consistent tests for receive
 buffer size
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GFB-0000000CiTJ-0lYt@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:52:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095304_771970_2FC6043B 
X-CRM114-Status: GOOD (  11.31  )
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

Two out of the three sites that set the receive buffer size (via
stmmac_set_dma_bfsize()) check for rx_q->xsk_pool &&
rx_q->buf_alloc_num. One uses just rx_q->xsk_pool.

Discussing with Yoong Siang Song, the conclusion is that
stmmac_dma_operation_mode() is missing the rx_q->buf_alloc_num
check. Add this check.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1d40168ec68d..787b02c2607a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2612,7 +2612,7 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 		stmmac_dma_rx_mode(priv, priv->ioaddr, rxmode, chan,
 				rxfifosz, qmode);
 
-		if (rx_q->xsk_pool) {
+		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
 			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
 			stmmac_set_dma_bfsize(priv, priv->ioaddr,
 					      buf_size,
-- 
2.47.3


