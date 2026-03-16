Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B948F30295
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 02:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cK4DSgf4/rvokOqdV9NzEntXk8odHo4nT46mIGyGv8=; b=I0mnM/RhomlkBgd2886iD9N4cG
	/0nGqAKl2BP+7e7Z1ENFG1etQxsEYo/YIVL/G5SOtvt5R98LSNCmR+G3LJol8l9+J75ba2oc/S3W5
	1J8ew2WsjRTbTV7TdCRgp2LdHnBzOQZykfjBnPvjnqcVzs5zu0NJNinXWlAZ+p23hH0e06FP/cHyA
	uV+gZjG8kEOWYvP+b+gFlEL1CP3zGy/aEORHHNegFFNOV/usglfEqihtqpV/G4XhbTLhQlE8pXb/N
	67AMHGSAYnTGTh8WhJ7R7/DTv13jq4EMwJdfnppl5HZGRz6iE75Y2h0IopoHzXCs514VUpA8WJVKG
	lYau7h7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPq-00000003BDF-1VU3;
	Mon, 16 Mar 2026 02:10:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPo-00000003BB3-1s77
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 02:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5cK4DSgf4/rvokOqdV9NzEntXk8odHo4nT46mIGyGv8=; b=LH781E95Aq0FAwABGaa8P2aOeS
	q9GK6jantQoHLQH/3Z7nxHuoQcFObk4sbiixkW0TQHQJDV1cPsZKvxC6A1nIYgy6Wh9q1JXlJpm1/
	6sq0rqlluIQYGE9Zy/MgqtquxewOiGP7swinDu/1YUosuiRjYA0SmFK5Jq4ysG+ryCrs5djbbw9Ie
	2maVEwlazhmH+Y6CRHuYU6MfY2thPL883DmuXBmnLJcsQNjDUsD2lYtHlv13yRPz5JzQh9Me+CEcQ
	euq1j4i0sfhL6WPgFsRrcf12rI4G2uGgLYIc1k6erFZz2LI5MnAWKUWlW/kWya00guM/l/ULpSGUN
	eYwS+YkA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPi-00000000EKJ-0wdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 02:10:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c73a5473bbdso1514242a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 19:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773627034; x=1774231834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cK4DSgf4/rvokOqdV9NzEntXk8odHo4nT46mIGyGv8=;
        b=RzTKCglNnzh2wXoIhm2DGKn3kcBB+UyLLtMwjXxjWNR6k5SWRfp5dFpCNOWCa0L3PU
         0ZqKejezSLDBJsJ+jrvD3AZSs1WN4Pq8nWp07lCQkp5mxQhss6rHtnVb9Ha5rf3pRzWu
         A9XPdTrcrHtdIdw/Rwndvnxm32OEuJ/qfH/BpTfCraT7j4ML2oBbga23dPLZ4ybRCEOF
         Lh/j4eYi/Mx5Guemg9awq/g0rGGG8umPtJvqrB2XwZGK9EgtualpYF9DAk9EMT82Seri
         068YsCdruAbo9rGxQNtgMDZcsoGxDM7fHWvDZc1x1FBp6IPz+YgEM6RdesXOyO6t9w5/
         8KLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627034; x=1774231834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cK4DSgf4/rvokOqdV9NzEntXk8odHo4nT46mIGyGv8=;
        b=XRf2WAC6peyfoAJfeaypBJEzfiOsrqLz7gAhzteaokLI3gGLtYw+sKwMPNCWEPKl4W
         Sg0D1qcoFv0qeMnMQvHT5VZBP4WbD91BYl15HHA+d3l0lHwdt6jEaiCi7rQWlsR+ZnSg
         E6wIcMmx1hshjgooGivyacpIuOGzN2us9BYqpnn+YzwyY/MGswRkqWLaj92bX7m/RzZO
         kuWzk7ZTQH3g/U7T/CwV2Kl2v35HXy/0Rt/ET//OU7R8Pi5C3jYhFiqiMQr276f1V5AO
         D5ufAnUPevJOv3vEj5MmAJv4td/epDE4lAOsT0/ky1YnQQWvWQwwlMfKOHL5ZIplnEb0
         2c+w==
X-Forwarded-Encrypted: i=1; AJvYcCUY/1eEjhbPilUzVscNVVspvD/dumjHI2+Uf4QDePw66Fik8P8qjCBtDRlOnTavRIDBq9mZAPMmIqg2gE/Xa6vD@lists.infradead.org
X-Gm-Message-State: AOJu0YzCWB67OJT7jlr9gSBFBJ9pdQMRpYDNooatRZrrsa4UjNYjNG79
	dICfVHGTf1KVZoJjuzx2Nk+bp7WlkjcG3QFgSrPYjEruEr8IWb6fLb7CfkVgXwsW
X-Gm-Gg: ATEYQzzWZJpLukkBaDRIvK0kjgY85fe/ZAbvMckWdkREUCx8nmnJIDk/tjUfv2Tmzsb
	FboMeMZKApHFFAw3cI/yfuk0iaT+RTvMdAusGPsm/8/aWH59mVtDTbSmKJyyiCuAagxIcxoiRaG
	55l7/ZtmahKjYcYtLYHSpyA0CxSvmv8o/Fm1yqexKPIEQA/L8TLGe7YV7oW5uEl5u/FKIdRnbrk
	vay4MnFpqaO0/lcQUO7sFArxs259Jr1WdsuDOZLexcmuyPtIsW4O81tH+WuCts5cbcsUf7/fA0h
	mJhChJ7AOCozD7Y1nMmjkQZdg7rVKAWfFl9+kaP0E0HLt4laAzYXzpqA6OgIN8SC9N4DnqDYJlo
	d+9fkNajZ1I3H0m7XazOoj/LLeBLCP4nl1MwjX6DPCZ9UNkqjiXk8Jgo6b0lnglde8z/LjYFDXj
	B0NcVaGZu2AYL2OKc63uBPWDGvBH1YiVf13jNQ7/9NHZdQroX7iR0aFRk9AqF6fXIj
X-Received: by 2002:a17:90b:4ccf:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35a21ebca88mr9426301a91.12.1773627033840;
        Sun, 15 Mar 2026 19:10:33 -0700 (PDT)
Received: from luna.turtle.lan (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ffdfb7sm17705805a91.14.2026.03.15.19.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:10:33 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH 3/3] net: stmmac: Remove stmmac_rx()'s `limit`, check desc validity instead
Date: Sun, 15 Mar 2026 19:10:09 -0700
Message-ID: <20260316021009.262358-4-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316021009.262358-1-CFSworks@gmail.com>
References: <20260316021009.262358-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_021038_281673_1A73FB37 
X-CRM114-Status: GOOD (  15.53  )
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

A previous patch ("net: stmmac: Fix NULL deref when RX encounters a
dirty descriptor") fixed a bug where the receive loop may advance to a
still-dirty descriptor (i.e. one with OWN=0 but its buffer(s)
removed+NULLed), causing a panic. That fix worked by tightening the
loop's iteration limit so that it must stop short of the last non-dirty
descriptor in the ring.

This works, and is minimal enough for stable, but isn't an overall clean
approach: it deliberately ignores a (potentially-ready) descriptor, and
is avoiding the real issue -- that both "dirty" and "ready" descriptors
are OWN=0, and the loop doesn't understand the ambiguity.

Thus, strengthen the loop by explicitly checking whether the page(s) are
allocated for each descriptor, disambiguating "ready" pages from "dirty"
ones. Next, because `cur_rx` is now allowed to advance to a dirty
page, also remove the clamp from the beginning of stmmac_rx(). Finally,
resolve the "head == tail ring buffer ambiguity" problem this creates in
stmmac_rx_dirty() by explicitly checking if `cur_rx` is missing its
buffer(s).

Note that this changes the valid range of stmmac_rx_dirty()'s return
value from `0 <= x < dma_rx_size` to `0 <= x <= dma_rx_size`.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d18ee145f5ca..9074668db8be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -375,8 +375,11 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	u32 dirty;
+	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[rx_q->cur_rx];
 
-	if (rx_q->dirty_rx <= rx_q->cur_rx)
+	if (!buf->page || (priv->sph_active && !buf->sec_page))
+		dirty = priv->dma_conf.dma_rx_size;
+	else if (rx_q->dirty_rx <= rx_q->cur_rx)
 		dirty = rx_q->cur_rx - rx_q->dirty_rx;
 	else
 		dirty = priv->dma_conf.dma_rx_size - rx_q->dirty_rx + rx_q->cur_rx;
@@ -5593,7 +5596,6 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
  */
 static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 {
-	int budget = limit;
 	u32 rx_errors = 0, rx_dropped = 0, rx_bytes = 0, rx_packets = 0;
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
@@ -5610,8 +5612,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
 	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
-	limit = min(priv->dma_conf.dma_rx_size - stmmac_rx_dirty(priv, queue) - 1,
-		    (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head;
@@ -5656,6 +5656,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
 
+		/* don't eat our own tail */
+		if (unlikely(!buf->page || (priv->sph_active && !buf->sec_page)))
+			break;
+
 		if (priv->extend_desc)
 			p = (struct dma_desc *)(rx_q->dma_erx + entry);
 		else
@@ -5874,8 +5878,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	/* If the RX queue is completely dirty, we can't expect a future
 	 * interrupt; tell NAPI to keep polling.
 	 */
-	if (unlikely(stmmac_rx_dirty(priv, queue) == priv->dma_conf.dma_rx_size - 1))
-		return budget;
+	if (unlikely(stmmac_rx_dirty(priv, queue) == priv->dma_conf.dma_rx_size))
+		return limit;
 
 	return count;
 }
-- 
2.52.0


