Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB992C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yp8ly4CoZ1xK5KOd2D0Pg5wxYPtdg+xF05sqpTsePU=; b=Er1NCLQFd65VdfqkUP0iGAWu7j
	GLLEyryRUMhKYZF2tMdFKEH8HTMBAWI6o4nNsUVwejT8Gdx+CMB2qDBVYWniG6lFiYqJdq4JwLnaR
	xUkHhFmQ0i7YLSwq7EEY3VwJ2HisQeKvzg1labFJKT+m0MP/cVIR+8N4OLsjXEPmbeYuDpI8teNbE
	PpLMm33dEOFR5IQkSDosF3OJxjs3s810OE9Z5q8Mp5Jl5lkfzXsPmXSdyv+w/L68RSR0t/XSXs4sk
	fPZwizAgCqBe47sB+A2aTlDbTS0p8XZD5D+uFHCN5+IuIeA6iC2g2qVfbVgptBKuEVbKVJJODUHHK
	TcJjvsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt22-00000008rSH-13jb;
	Wed, 05 Mar 2025 17:59:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsxO-00000008qq3-0VJn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 17:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:In-Reply-To:References;
	bh=6yp8ly4CoZ1xK5KOd2D0Pg5wxYPtdg+xF05sqpTsePU=; b=f25L5z2Fv5Aoa2O4x02lLmRqTN
	kcPcaDrHqTAO/mWwcYQNtgsAgdPZP2KCIVSv9wWzMynH+i1TnV3VuFY9v+9xkCbikHpKYfqJu0zF9
	bfsuaNJKkxfHNPv/4f16K2neszc5BOq2cCs14fth1EC9XZj5th6Ols1zGfMSu1cJxfzbGfLytSYBC
	58QrYSb+HtE+hb2P0Dla5abM5LZi3gv6KS1BhMELl6BaiTF1J1UgdKk+WWZYc9MA6siSirFJTjW1a
	dCLJPQdn5FViZrZElAtTeDf2gjRcXj4CM3W+7SUKU+hACP0L59eutG1Pq9Ya7urPQXU6VBBz7sKer
	Q8ugdOFg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsxK-00000000fjg-3i19
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6yp8ly4CoZ1xK5KOd2D0Pg5wxYPtdg+xF05sqpTsePU=; b=yf7Qjgdjp3HkjKaQyBca+vXFbG
	8yZxvvj1OYBOYrsvUVFJEqgaUMQxD5j4bIXG9e4lmHgs4H4MbxPkckwmG+6gt6iRk2tQO0veVV7uQ
	0aWe1BlD3pnOmqhKidvwBOAbsGByafmP2lDbLTfXuTpdSetQcNrYGJetZFiD6s8KXFMMiUIzkE2vH
	/utGOC8ie450eBha+tSDsV8OxtdHGdw7v0BjvvTF93hBoDAaVpzgHxQo1HxBbAxctuRptgDu47PHa
	GMRBLovr1Y+LPtJYp+eMV3cOxfOtxbx36rKXMe3dDQJVZ3ssO/bLj3wTLj8EYpysbfBiKY++1RO88
	efiijohQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34082 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tpsx2-0004fX-34;
	Wed, 05 Mar 2025 17:54:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tpswi-005U6C-Py; Wed, 05 Mar 2025 17:54:16 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: avoid shadowing global buf_sz
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Mar 2025 17:54:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_175455_033733_C0B8A345 
X-CRM114-Status: GOOD (  10.61  )
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

stmmac_rx() declares a local variable named "buf_sz" but there is also
a global variable for a module parameter which is called the same. To
avoid confusion, rename the local variable.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 334d41b8fa70..cb5099caecd0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5475,10 +5475,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
 	int xdp_status = 0;
-	int buf_sz;
+	int bufsz;
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
-	buf_sz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
+	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
 	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
@@ -5591,7 +5591,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			net_prefetch(page_address(buf->page) +
 				     buf->page_offset);
 
-			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
+			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
 
-- 
2.30.2


