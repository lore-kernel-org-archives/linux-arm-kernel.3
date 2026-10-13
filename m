Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2764ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrXyBemWv7jnGNfU4QhDPOUtyZxybBdqnf686rGi3gg=; b=NbpAN0/9LYtNd+h5m2EM71JB0K
	YesSOipebLy9Ap5D2SZdd0hwBNN5rxfBHk1LoUviR6aA3+olWuL1Rh+E1oKBiFFZegL7ActzKVOgV
	kK6Ra2RBUxcZmLGwIy0Itj/e4nmr71z273+ThIIN5/N1K8+F/LIgvcIMlsw88KdWsdsIy3IWGux3l
	MQTyfUQtcuBmQMzXw/17dgwi0jbZy9ZL2q3OpdATXJ+UsJ27XvHTvtyG9vW7bw3L7QejagV9Ux1/0
	ZwPpIPQpvmpKMrUuL368IKFGnittNPDQKRkn2Em3JtZqEgdj4GcB3EO3wmWAbrjpM3hOfcWrUrpUQ
	eKZhPbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYKL-0000000CNuT-3KaI;
	Tue, 13 Oct 2026 08:57:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYKI-0000000CNsr-1cww
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:57:39 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791881853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrXyBemWv7jnGNfU4QhDPOUtyZxybBdqnf686rGi3gg=;
	b=QqjJIJzeRqDDmILZP4lIyZRkSz/ek3CZHZj6Y65EjMp7GmDGg7uYGTMLGCcWbPx0gzOB68
	QQNLFdhuoNZGD0PiL47H4QPw/T8Qvz5XC7mqdVJt6xmyl4zVHbNh8N0oo0gk62d7q3ekTM
	/tFNsALN4SEIA5U3Y1qI8A43OWZ1Ue80534xf8yndFIyAzBAtjLi7Ig23XcWM+zbHb0NbU
	1DS4BbaG2qOYUx9M8GU7eeZ2NlkEpsTCk8hspwWs8lgW4geKo5+5CMaQsW8f3ptkxfrVzX
	5NM9vGZC4Uv/5J0l67+tSxzdbSBUXMTfhdXus9LOgzomJSK6xd3P6XE/CBcIoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791881853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrXyBemWv7jnGNfU4QhDPOUtyZxybBdqnf686rGi3gg=;
	b=vyTUJhmAvFRV5nYN6ZU4EgZNtTA5BxScv0T+sRq9WDAjoVFM6bS2qLOkP7uoL7Rv0Tcrta
	D7CkIQiAv7ROG1DQ==
Date: Tue, 13 Oct 2026 10:57:21 +0200
Subject: [PATCH net v3 1/2] net: stmmac: Disable NAPI before stopping Tx
 queues in stmmac_xdp_release()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stmmac_xsk_crashes-v3-1-50fca7790af2@linutronix.de>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
In-Reply-To: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=S8z+I2qn3fUP3ib3Mdb8hOU7c0gVBWfhLFwfJOqGccA=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBqzfJ8qnIKOhyemW9CBxZPoZbsy8uaA/POwUu3B
 S48CwgQWNKJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCas3yfAAKCRDBk9HyqkZz
 glp2D/40XljttzmsCQlBnQ8DpnUkd7udr4JVxzzMmkZqdeCM+3m0MKqibuOBHxANbtIYhQ1NoV1
 PQn8DaHoMPrHdYOlLfTmiV68IlzY+QlWBKIjJaII+/c0rhXeSjlTN55iN+IIj2e7odv6Hpf4HsI
 aPZODy9TpP7x008hia11moSK99KAIzl2IBmVyDNEiGTDy9V0E/yKvlVIcdntIgyLi+WKMgJajxe
 ravZRnHhtQpmGQ3OS15T77KeL4Q1Vwg/XOdyS3oFWvfjdF0QGdKqeF19Fyac9eejwFhpqszSwRP
 BCeC6y9laV78vku04ju9fhbmC15EeRuupfpvZHgWtdVTwmRXg60RaMEQWxVjLBMRDOJCCyNuD6Z
 BF7L3ZjGaaagqKtUoZ8YkR68dotnFY5sPfskdcN5m3nxzB48itfL6OvjrakxlcveMqL092jJ8q8
 TER9ajHWXoRz7PM+R9zQ0W8j7tbC9nGt9iEeyQazPofnRu2sC73OBIPXW14HQ+4eq5i2oLFoKrF
 5w3c44XNgW7wEdzfbjXTeD2VZIkQdGM/Ary5OxFfwGvYqbamcBcT/cPwoMLlHfLfbjDI9rVL566
 hjNqnorwvyTegv+P8Hc3vvtv6ZQvHPuXWQDfWaa3ZKQWHct2GLHxGSmbf9TGaa9bXz4y2Js0PIG
 qBxN731od/MRaGQ==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_015738_602303_CEA752AC 
X-CRM114-Status: GOOD (  12.30  )
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

Attaching an XDP program while Tx traffic is running results in kernel
crashes in stmmac_xmit() -> dwmac4_set_addr().

Loading an XDP program tears down and reallocates all DMA resources via
stmmac_xdp_release() and stmmac_xdp_open(). stmmac_xdp_release() stops
the Tx queues before disabling NAPI:

 stmmac_xdp_release:
   netif_tx_disable
   stmmac_disable_all_queues
   ...
   free_dma_desc_resources

A Tx NAPI poll may still be in flight at that point. stmmac_tx_clean()
takes the Tx queue lock, reaps completed descriptors and wakes the queue
again when it observes it stopped with enough descriptors available.
Nothing stops the queue afterwards, so the Tx path resumes while
free_dma_desc_resources() releases the descriptor rings underneath it.

On non-coherent platforms dma_free_coherent() tears down the vmalloc
mapping of the descriptors, so the subsequent stmmac_xmit() faults on an
unmapped address instead of corrupting memory silently.

Disable NAPI first and stop the Tx queues afterwards, which is the order
already used by __stmmac_release().

The issue can be easily reproduced by:

 1. Run iperf
 2. Run application which opens an AF_XDP/ZC socket

Assisted-by: Claude:claude-opus-5
Fixes: 77711683a504 ("net: stmmac: ensure tx function is not running in stmmac_xdp_release()")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # stm32mp215
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27a35..2aa5a2695473 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7132,15 +7132,15 @@ void stmmac_xdp_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
-	/* Ensure tx function is not running */
-	netif_tx_disable(dev);
-
 	/* Disable NAPI process */
 	stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+	/* Ensure tx function is not running */
+	netif_tx_disable(dev);
+
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 

-- 
2.47.3


