Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC14C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfbCqchrlviXWCGPv/jztbOY6XLQs0x4v6xEVILnr0I=; b=H3Hb6qVn5PzaAX4JjC6ubwsynv
	iPqkY8IVb0EqLmo/3WKFv4HH+BIhl9TZwq85ClMMzceZ64qaAle2P/3OfLY1lPFrNerznSkGj5o7W
	paRx4c2NxLM8XZEd+08Zfv4qlphXUJ2WgKl2r+gteR9hXe9GKiSvav+8a9sT8JlZWuCPnukZxS5FG
	UI5gxx3px4UOgRPL3Plzso8RjunnYJnEiJ4SheImVQuA1QZUUaixjVAwRQxPlI+k3Lk3g3vL25NFn
	C+X+dI2GPYII2MMBnSHZxPDt3xvnMwbeHB2Php6mXdOl/aL+L/XIwHSG+do5UVm/vMCrHGoWBjDmp
	fpcdizsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgm1f-0000000D1Ob-0dkW;
	Mon, 06 Jul 2026 16:18:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgm1Z-0000000D1Mw-4AOc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:18:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47de008b020so690329f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783354701; x=1783959501; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfbCqchrlviXWCGPv/jztbOY6XLQs0x4v6xEVILnr0I=;
        b=bjCyCkSupj5qNUQYJeGndmipRRA+ap95dpEOYex9JQhD9jZJwUW61F4Ih8Oxey+Z3p
         4xwpj0YNQ0SebN/QKpR9sLaFhLcSqR79tRF61uldrCckf0w/Y1lHjt7SXVqwz+stw1dn
         9iA3bc5VbGFQTzLq5jmwH+JdS1tKQAsGPpYbgqN9r4q2vOcgebrJAjV+YMn4/E17ZG5O
         atlnM+q2i9EXz5xGpX/GGQs/plbU/xL3qCyyktffSaFV7h3d/lqnY8Jj/e33onROBfXA
         TOTA0VC3/XjLQexFyjk/G3TjFlwiozk62wI3iEvRFDseUPqILgQSxzvvW7FOMzvD7wAQ
         jSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354701; x=1783959501;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfbCqchrlviXWCGPv/jztbOY6XLQs0x4v6xEVILnr0I=;
        b=KhaJ9j66vmXpL2JInKZvKyNqIEx4CGMaGHfMmANi/lSJGNi41+SsvPQS7KVQqm1j6T
         GP+i0c2jOSWsop1L+C7xbQB3qDqXtXmyaKsBMw2S2txmaF8i+1Os02Moe1gbLxWPjNBG
         zHgPKBn1lrhaJgsMQuuXG6NT/Qsxo2EEsaKYyNsM7tczBkQAf5gAqt5ZVk2ypesnsjyF
         ilJX9WGzFpSs4bdKjb4Q2ymraoCkGshyCVj5uqpBig/gWNUpOZWuwKaV/RHGH7/gbCQx
         cZVi8K41TDXjDw7U0ibaWjYc30/viGDza/vQInB+Xh3dt4Osm9CgmPc67l8ES2c2+QPJ
         slQg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi9myW44IApEVdA5p+qFTt04EwBXfEOXi3U2zx6+jN39IlEpLtgwrr5s2m4Bt1I1NVI1OnGQlCkkNre7j53VG5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19LJJA/syhxRIkKIuJEUY4o+fRXu/8ZUbrBXe79A1xy3N2QKC
	MfNirk+TXZpOjiPgav0ncV2/BrOyq4u2yLbLRzmkuCHvtcoPE4XoCh5A/s9SwMSKkyQ=
X-Gm-Gg: AfdE7ckmwiDSA7VO/1IFxlZu0HyYIAIwNNRg6X8For02a5JhKqcRjB1923+TeeU5eSt
	6HX4SC1sgY1qiGeuvfu8aerO6JO+NHDT139ojpCDEpCox6I5rHjsYLa7vmEPf3f+7yJlG0MCmXz
	AqFIuQlJ6mkEB3lKzAV8CsL7zgClLc9AePFW27gYgVf48CkKUVm2bbb3HRUCuKxKTMOZqqs6mN8
	s1Im9TY1vYjAKwh4lLLhuZyH6RXGcU/4WF3Qz2SLkbyUXMDvkfdX48YF5rJwZ1Jlsxbi11vZWTo
	2yL23+XdUqv6kHvznAKfX6FLlF5pl0uyPa1ua//2zisgglUT0wM2IVvmw7xz8jlOpe3uPnToKnC
	frhvW8ZIzeB/bmE6ayj1yUoIkmY2a6JiEHnrM9HCm3NNcUznuQ9/3UWqESx3lGjn+ufdioLHkFL
	xpcFs8yOo7O2TMswqD3ry3NlCuqxszT6GKQvlXKk+2ceXA3YY8/WzNEgBJVP/okPCuPRcE7lXlY
	jzlLORkBwRlEEDTfBHfdUf/F9SiQnD2nZWu+LUz4PPaJ8zihenj2ILmzcJEsZhLC5Tiuw5vOQ==
X-Received: by 2002:a5d:6f06:0:b0:460:d18:865c with SMTP id ffacd0b85a97d-479343d1d48mr18732847f8f.1.1783354700990;
        Mon, 06 Jul 2026 09:18:20 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm27210959f8f.37.2026.07.06.09.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:18:20 -0700 (PDT)
From: Daniel Thompson <daniel@riscstar.com>
Date: Mon, 06 Jul 2026 17:17:58 +0100
Subject: [PATCH] net: stmmac: Avoid freeing and re-requesting IRQ during
 XDP set prog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
X-B4-Tracking: v=1; b=H4sIADXVS2oC/x3MQQqDMBAAwK/Inl2IAaPpV0QkjWu7B5O6CVYQ/
 27wOJc5IZEwJXhVJwjtnDiGgqauwH9d+BDyXAxaaaM6ZTB725oDU15X5zHEiWWbMjmZ4z9g77r
 W6rddet9AOX5CCx/PP4zXdQO0r0DCbwAAAA==
X-Change-ID: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5016; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=ouoDiKxWTnKt6awRW6bwvPT2mUd8MHBQltXVbya7+3Y=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBqS9U84VEoQ7ihoE0hX+1OTuNAmOcBS548F96qN
 5yoLvilNcCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCakvVPAAKCRB84yVdOfeI
 oZRjD/4loyK8Dfw5UMFNwkUH9J6/cduTpTFyaslQOTZJTESnRVyseHrhkeVw7cHf3Fi6SVgNmiG
 5yiOYnCAl2WRYSqjGDED6k0mI8ZSVLsz7XS0yFVoke/YtvpQFMAzF/OwWv+Y8iLVLBcQcYlOqYz
 KH4EWYUIQILEvgWHcqWoRmMylNh5ynvN//1ZfG6AISVM/NW7aWToqxh3gC6Mact5sUGFCaScdF2
 O29pPBz6ZWdVJO0sS/Ru7Jw3mK25+al+R4RO3zNF+RpnFy78jIqme7dronYMV59e0vqgrJMG4Eg
 VoqmBXNq2AQNiYIJsOCY+zvvaeOPkhovbZqHWOx3+TVLvj2s2Ycf1aUjJfzWg2fE9IxiqWHuTL3
 261j9O07uS0cnFKvYVPJjQrUpLhYaE9W7jb+KZDnrf/rBDrGC92b4AQhjy2ZDxK8aY7n+zUgtMv
 jehciE0ZzbEy8695AZ1hGEqAkefjWmgAI4QEv4VZWMdJwiCi7q8r3/jGZ0fgft7+XKVwGiZ1+YQ
 rmTGklEohkpxwxFUPQ+AqbHT6avTd7ViPUjfiRMUk2E6M2Brjqdo7vYN5W5pWLJooqG+hJw3zuW
 3Ryqi2C43hWrDS5bmTTMPtY649iAbbgYk8jVLjtT09V7pFHRRAYSZRa5ISCIdBXICaMnEahwzri
 n33WXOa1mrqhCAg==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_091826_323862_424268DC 
X-CRM114-Status: GOOD (  19.54  )
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
removed, I was unable to prove that later actions in
stmmac_xdp_release() are safe when there are concurrent interrupts. To
avoid problems let's also move the code to disable DMA interrupts earlier
in the sequence and explicitly sync the interrupts handler(s).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
This patch was developed (and tested) as part of the TC956x work that
Alex Elder and I have been working on. However the change should work with
any driver that uses the stmmac core so it makes sense to submit it as
a separate patch.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 61 ++++++++++++++++++-----
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3ff1ffa57e224c25f9e77bc28ed10..acd145f1f3069fde6043a9118c793758c5c8f4c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2531,6 +2531,23 @@ static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
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
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		spin_unlock_irqrestore(&ch->lock, flags);
+	}
+}
+
 /**
  * stmmac_start_all_dma - start all RX and TX DMA channels
  * @priv: driver private structure
@@ -3814,6 +3831,33 @@ static void stmmac_free_irq(struct net_device *dev,
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
@@ -7108,8 +7152,9 @@ void stmmac_xdp_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-	/* Free the IRQ lines */
-	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	/* Silence DMA interrupts */
+	stmmac_disable_all_dma_irq(priv);
+	stmmac_synchronize_irq(dev);
 
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
@@ -7156,10 +7201,8 @@ int stmmac_xdp_open(struct net_device *dev)
 	stmmac_reset_queues_param(priv);
 
 	/* DMA CSR Channel configuration */
-	for (chan = 0; chan < dma_csr_ch; chan++) {
+	for (chan = 0; chan < dma_csr_ch; chan++)
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
-		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
-	}
 
 	/* Adjust Split header */
 	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
@@ -7197,10 +7240,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
-	ret = stmmac_request_irq(dev);
-	if (ret)
-		goto irq_error;
-
 	/* Enable NAPI process*/
 	stmmac_enable_all_queues(priv);
 	netif_carrier_on(dev);
@@ -7209,10 +7248,6 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	return 0;
 
-irq_error:
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
-
 init_error:
 	free_dma_desc_resources(priv, &priv->dma_conf);
 dma_desc_error:

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>


