Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062F7CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM+R+mbJK8RLBqpDdx1wr25PKa74we7OacPAq9nMC0I=; b=4I5rqEI9ePlWAvD7ra3QHdGkdR
	vgJHe2dbgKkLrB+aJShnAOOIfnju18ReXFTpAWUfpxSNOfA7Xb8y+BJPhAPPkBTcBWjLx+ubxEL+l
	GJK5hjDj7InI7Xu7CYNVW059MQoHRABdK32i1lr036z47XErl7OctY550JuITqC0+I3aurdTW3ffK
	0fm+N+Yq9qFArBuFs9YYaMGjRSRWQxn9Hh2+LJIXRqsXHiJgdI5i8b1HKsiORcX81bWUNjp0cPJiY
	Cj1bLIohee2VrSIdtSKNkczGXIfIJ/dCNXBS8JGk5Gn0z65uwY7ohdfQgof3lvFHCRUh9i6+5M6XU
	hVoArJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMuV-00000000SYX-0uTW;
	Thu, 15 Oct 2026 14:58:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMuP-00000000SWq-0RXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:58:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48af27fe287so504883f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792076295; x=1792681095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HM+R+mbJK8RLBqpDdx1wr25PKa74we7OacPAq9nMC0I=;
        b=sB2uuR1r8IDV/nPpvpU2RBt8VDMcfFh0fab1egUuYEAAB4wpy5nMBPVmcelmfE10C9
         ZYp+wKqPsd2nWZinbk1YOF+eBIcbz7a1b9K0OamUMPE4m6/viR9OAa/k7Eo2msjyScKQ
         ZmGREN0hpgawDQRmVyPCZTjoK4XaTx8bwzkX1XkF0bmy67NGcbvBjdc3O/6V/5TgOvcU
         IDRb+jG6OoOz3EL7p4W99/TzyEEknUGh/t4/khc7qJ5qbMATZCbLnmiPqyo1MH9OWOXS
         8ksr793Wc0qupHl5RmRh9TYu/nSR/SauRZn/SRjI30byRW+0hlph+3fKCFvTUcuThuU1
         d5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076295; x=1792681095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HM+R+mbJK8RLBqpDdx1wr25PKa74we7OacPAq9nMC0I=;
        b=f+/dir/bqoAUgbDQx+EWvY+DdFNUUeu876wSNWQUnlkfE6LzVbum5+Pzwx3QCLRPMs
         9AKn+3bsW3C7IvNMclfR4/5VeOzigUkdsjTlAoGqbD8LPE4Tn6YAijfp4vG21txPmoyt
         +CO+HUWKPG00XkILTXAxE+pFWCdjbBI+slBWenTwhoFwSTJvmZIzeoNvq4FAYAKE16lk
         mzpYuHmcjgh5NZhZ6G5gynNlLtVjpNqK5OD6zOuSr5+B64eet2Ios1j6eRyou6AOKMkE
         gs0TrIImaqmaF6ixcFWl8c1yKfUe8K+FeaGh06ockMPVQfyobIlz2pJGjgwV5wkj0lHH
         syHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNo+64hdoYXmwp0oHUqb9Nk5An1viGBGL5HSB88w8vwF9TpQQpiXgKrY5NUW/Wj5wbyaOtEErhD9EQW/6LpLz8@lists.infradead.org
X-Gm-Message-State: AFq9FYKB62H/aIjveOiZAr4ZhPBGJEXHbsMa7jILGEZsIodBGNYkNmId
	sVQjHGKlGpiKluIiNSzB49PCRgg3i0km7TEFmqXWm4JcP1IAk9vsEcvUlxk88D/0Vyw=
X-Gm-Gg: AYBFou2x0d6dg8iYextq1IXUyNXD/Acsyv9mgllqONtO8KBhEjgcMFE2Y7KfaD3KwwG
	CWEt0xbvUlu/GY9pdBa4+StZoCBfvqSlMxAldHhVy7DLh9MIAnqKYi/zbJ/Vk81zCXnhhJ+RAWV
	XEVyV+f3932LEFqSE0vjhebHdk/j20lI8WK9SgROWjjptdAP9OSBJQay/a9XtXoZkRrsT378hfI
	/8sAnBlnxQWBLzRo300nXFLCVmFvg0qlJWzn8XtmbVVsq0tAM13KKZ0gJjB5fNwQJS3v7j4C8Qu
	7J5D5ay2s8bVqCe0TVWZEisx7ZBuo5VwASETS3tauMGnnrtExl4Dyf7smepnIPa6nLHTri+B2yh
	+JsRZcYhi504rnIubi3uc1DDJhbpIYPnB/HTITETNcgkREt2Y5a9fjCICL8qH4zBMsqKpnPLWrp
	axtlPHBV+Rcvl/SQYeD0qVexdgcwcafLoF1tt5+QhoQ/VGy5xnycFhYrBVYToIYkPrkJeplm0TM
	TYbxwiY/IyRJdVx3K62IkMBQy0z3sgezJjiz4OkLdcpcaXs1/tAAYjCspPrmrTPqfM2Ce5Ehf3T
	OQuZydL0nFPLYzM4GagMlLgfGJIhgVd9nX5IXvqxixZ6GiAi8O+fI81QLKNfkgCiBWxakQ==
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr30543201f8f.37.1792076295196;
        Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm19738293f8f.40.2026.10.15.07.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
From: Daniel Thompson <daniel@riscstar.com>
Date: Thu, 15 Oct 2026 15:55:02 +0100
Subject: [PATCH net-next v3 2/2] net: stmmac: Avoid freeing and
 re-requesting IRQ during XDP set prog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc956x-stmmac-no_irq_teardown-v3-2-8189870be545@riscstar.com>
References: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
In-Reply-To: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Eric Dumazet <edumazet@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5397; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=Xmsh8vLkxa+urAg9ZzBey5HhQUknHpXB+xWvp5JB6io=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBq0On0886l08HHREvWrJqdn0hcWlbVy9OPSK05v
 3jBqmxmICCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCatDp9AAKCRB84yVdOfeI
 oVUJD/9PRRiCUW/mNpgCqony21Y+ly09GrfxL7uqhj8q7gbv3J7MfZzTgMES0M6JKRyOUTAWMbW
 mdRzY0OHRDgRt01w5WKjbMjHKriUKKfk40tc7BLkyYmI2DRz3uAYVE5e5Nh7GLXylUtF9z/QtF9
 YjFgKjuhdfSknG+uoXjgTwASLwOAjFHoHdkgOE3Q+8akX0b99GZb+WRvbNxXVEnTrgBjd65cMvK
 U49YCfVG3Y4LkLOhZHNWRjs+NzvBvU0DqHF93X9cMQzzaFG47gaWbzwIcUEgsvTm5U0U+wbwLKS
 zFccajtkdEBVDGQdvdtLre3N+JRcuyEM///kbv4u/PgqFeTrcnpjiwuQXOaFHz4dX5fgRVGXSGM
 RxRl/xUENymJW+9VIdG4SDmIsKVrZ+K9K4smCGuki9lHJm2ev5j5ruLxN8ePCOZx+hhzi3ODiX7
 sPkd0pIyACcYwhdR264p7xgILqRgTjje1USdjq+0TiVtd9hTSbIsW+/8BtC0JDxOBI1lfZwOtzW
 lPy/dGg/KH02/QaJYKzf0KIxxiVIk62+9KMYdt7JH9IIMY4HjVrq67ocMu09Fs+hB9V4u1+jusd
 TOBMZnXTwmhsWV+nTxj6CloIkRFtCsiUncePB8XlUuKBOBuFiF4iOzGL2Ip6bmD25BIV+jdKDSN
 +q/Y6jCTmK2tnHg==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075817_214884_9297C3C9 
X-CRM114-Status: GOOD (  20.58  )
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

Currently stmmac will run a full cycle of IRQ tear down and setup when
setting up a new XDP program. This makes tuning TSN systems difficult
because whenever a new XDP program is installed then the irq threads will
be stopped and restarted which will undo any thread tuning.

The problem is avoided by removing stmmac_free_irq()/stmmac_request_irq()
from stmmac_xdp_release()/stmmac_xdp_open().

stmmac_free_irq() implicitly synchronizes interrupts and, with that
removed, nothing else disables interrupts or makes later actions by
stmmac_xdp_release() safe when there are concurrent interrupts. Thus we
must replace the code to free the IRQ with code to disable (and sync) DMA
interrupts. We also need to avoid re-initializing the DMA channel. Happily
the reinit is redundant, it is sufficient to rely on the re-enabling
of interrupts at the end of stmmac_xdp_open().

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 65 +++++++++++++++++------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b80fe66cf199adbd31b79a484b2970aef211b51..f1359637007e211b505dd74577232cdc079baf46 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -144,6 +144,7 @@ static const char *stmmac_dwxgmac_phyif[4] = {
 	[PHY_INTF_RGMII]	= "RGMII",
 };
 
+static void stmmac_synchronize_irq(struct net_device *dev);
 static irqreturn_t stmmac_interrupt(int irq, void *dev_id);
 /* For MSI interrupts handling */
 static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id);
@@ -2520,6 +2521,23 @@ static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
 	}
 }
 
+static void stmmac_disable_all_dma_irq(struct stmmac_priv *priv)
+{
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 dma_csr_ch = max(rx_channels_count, tx_channels_count);
+	u8 chan;
+
+	for (chan = 0; chan < dma_csr_ch; chan++) {
+		struct stmmac_channel *ch = &priv->channel[chan];
+		unsigned long flags;
+
+		spin_lock_irqsave(&ch->lock, flags);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_ALL);
+		spin_unlock_irqrestore(&ch->lock, flags);
+	}
+}
+
 /**
  * stmmac_start_all_dma - start all RX and TX DMA channels
  * @priv: driver private structure
@@ -3816,6 +3834,33 @@ static void stmmac_free_irq(struct net_device *dev,
 	}
 }
 
+static void stmmac_synchronize_irq(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	struct stmmac_msi *msi = priv->msi;
+	int j;
+
+	for (j = priv->plat->tx_queues_to_use - 1; msi && j >= 0; j--) {
+		if (msi->tx_irq[j] > 0)
+			synchronize_irq(msi->tx_irq[j]);
+	}
+
+	for (j = priv->plat->rx_queues_to_use - 1; msi && j >= 0; j--) {
+		if (msi->rx_irq[j] > 0)
+			synchronize_irq(msi->rx_irq[j]);
+	}
+
+	if (msi && msi->sfty_ue_irq > 0 && msi->sfty_ue_irq != dev->irq)
+		synchronize_irq(msi->sfty_ue_irq);
+	if (msi && msi->sfty_ce_irq > 0 && msi->sfty_ce_irq != dev->irq)
+		synchronize_irq(msi->sfty_ce_irq);
+	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+		synchronize_irq(priv->wol_irq);
+	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
+		synchronize_irq(priv->sfty_irq);
+	synchronize_irq(dev->irq);
+}
+
 static int stmmac_msi_init(struct stmmac_priv *priv,
 			   struct stmmac_resources *res)
 {
@@ -7141,8 +7186,9 @@ void stmmac_xdp_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-	/* Free the IRQ lines */
-	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	/* Silence DMA interrupts */
+	stmmac_disable_all_dma_irq(priv);
+	stmmac_synchronize_irq(dev);
 
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
@@ -7165,7 +7211,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 rx_cnt = priv->plat->rx_queues_to_use;
 	u8 tx_cnt = priv->plat->tx_queues_to_use;
-	u8 dma_csr_ch = max(rx_cnt, tx_cnt);
 	struct stmmac_rx_queue *rx_q;
 	struct stmmac_tx_queue *tx_q;
 	bool sph_en;
@@ -7188,12 +7233,6 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	stmmac_reset_queues_param(priv);
 
-	/* DMA CSR Channel configuration */
-	for (chan = 0; chan < dma_csr_ch; chan++) {
-		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
-		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_TXRX);
-	}
-
 	/* Adjust Split header */
 	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 
@@ -7230,10 +7269,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
-	ret = stmmac_request_irq(dev);
-	if (ret)
-		goto irq_error;
-
 	/* Enable NAPI process*/
 	stmmac_enable_all_queues(priv);
 	netif_carrier_on(dev);
@@ -7242,10 +7277,6 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	return 0;
 
-irq_error:
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
-
 init_error:
 	free_dma_desc_resources(priv, &priv->dma_conf);
 dma_desc_error:

-- 
2.47.3


