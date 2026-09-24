Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7427BC98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsOroaMqsON+Ipvrk/sDig1wazXCxXd9rgUKWquGlcE=; b=JmZ5zgnAeZfm3O05YIiro0LoUF
	6dJmkda3Y2Pm996P5VppfClLOF7QHfuedlJnp3Ywig/CCCu761A35/jbENMCzRFXfY63G/A+Ewth2
	oyzHH5nAA0aIdG8dLEX+lcXOiuhHcndMtWzpqqbRZiQyZx75Z6OQ25ggwn172V9pDLrQ0PcOvrx/4
	CGpEFg5ijUYxvvZT/Z9vdu7lFWQnNEfIUONQDV+MANI35ytFX3/Ld1uXcDytix7YEqaVfV+xTXQiM
	GHh1TBjmB6batuIP2DXrR04OcynzRFtJGmIFFWIOj1qORWme2w/+NK64nmg/c33vsfQrvZdyPhtFG
	ltr1dEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nVk-0000000Boj7-0kbH;
	Thu, 24 Sep 2026 17:45:32 +0000
Received: from mail-oa2-x0f.google.com ([2607:f8b0:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV7-0000000BoRP-42BL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:55 +0000
Received: by mail-oa2-x0f.google.com with SMTP id 586e51a60fabf-491c13d63d9so141283fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271893; x=1790876693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsOroaMqsON+Ipvrk/sDig1wazXCxXd9rgUKWquGlcE=;
        b=NqXJTqiv6xKrz/ljEYs4A4BAjYS5P9zdh//gRe2NtDVRYoDHSb5qb5jVh6f+55Tdjr
         H0bYvs0ri9ZoDaqtxbjxqwaPD6Bzzss31Jm+I/lOSuCeZMaqYWB3Da0Kcy2Q1iIPUu0Q
         povWIwa5ivIUfOpPQ63Z45Y3HGGxFopkIG6w6LElXzxOQGF3VJnMEGBRJUPFhiM8sbV9
         hGb377OxbvwMn2NwaRjbkK/XzMN6JqeYJWtKfpNDyI0DA2nheZ77A0AwWNMslrKLbRbL
         LjJpItGzj+qMFjB2ylWDlp3KFhX8VdY4VePFqDLSnhAzO0QrgMe6YilI6mkG9f711jdl
         KS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271893; x=1790876693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsOroaMqsON+Ipvrk/sDig1wazXCxXd9rgUKWquGlcE=;
        b=V7yAUvYCRkDT/yt1im69oU86EQIAJEhVqCXnYYcbh+uD3mAvQ+V8U++H+bA9WfhZox
         BcPW08TItyX4rT0s1MSRdLINhOHvRgilZZILvGpUvFcMSl1C6WEcIgwiV1G1l1jQi3ei
         KOccQk4DcMjlE3YIm2AH/3QRueSUmS8tMBuUbYojaaw30hflpLRfqaNFmRNcqVz3xKqE
         bY2f8HlzLyWnwgmzkYCGLEDaJwJydndCmSIkJdfLwiicBGuMlbUQk05Gt5Mugwt3whgy
         IYhl1LaY1iLv7HPoqxHiVs1/IKp3lbF9v5BQEN1fWpSwYS6Yb1Pu906FwfL7WHthA6kR
         FARg==
X-Forwarded-Encrypted: i=1; AKwUvBwE195aRU1xse0X7WiRXPWvrXcGNY4wWN7m1z5Vr1wjYniBu2RQJ/LmI1qGE2Adv6atp3k+fLNH7IXiValrSmTV@lists.infradead.org
X-Gm-Message-State: AFuF++kv3klBuDXHjgJxsm4n2gw17sgDOnk2bIWbdpiLPPLq9S6xeHeb
	+/FgKOUO0aNkbKZs5dANTFyzCDV76WfU53inCQSAyokNgCcH3wd5lrBf
X-Gm-Gg: AYBFou3aCsIUEGEE5CyJtgej9det0CGkUtLyHS4Z3Pel9NZYxrGwDw2kG5nOH5nGq/M
	pQBRh4BBwh5t0BzYr0PPQWLBOnpl1cG3jbmZQ/Tc/15sU8tXULQIcYgXuKaeZA8hcYh2T6jrnR5
	SNMWdnb/jyL3JwUm12xOkWpelJLIYyZBxF05uZloTE8Ur9SVIMcjGhZBulkCITD0FXPio81KFwk
	TvlEk223JuILHrl98vwldg0+nRHWyGa43u9AAcaF/J5kJEY0h6phAWLQjDwZPO0LJkBXtQXyaxg
	IPmFnyCtEJlksqWIi7BzHytH0lyvDwuBYxgB0WFVfnrALJ1D/qRpVxT7G+t5ZfJzO+oBmBaVHRZ
	34a8xH/0dNR58L2aTzI3hnl8kWsTOI87em7+VRab1bqhUs5ymh30hEaIsyFPOxTrQtipq8xJcPU
	j150vG5l5r7SEuXncDV5KmcTYJLcpvPGH7CzC464/hvcNZlUvXWZH8uAyc6j8naJ2MjvnA8K3zg
	oGjBE7JmT6xx7x3UY9kzHslPqMwZBL7nXxGVllrfqcvtOLAeLXqafyANkDjgjVCbgGg+IwfLoa/
	w5/smsa3UxC6MXReMwCU3XKLwnkwN8IDJ0R40rNXULFBYrr0qTRHzT/KEFrIprW3O1qGOFK056I
	x4BzJ2V1z3+huUnLzwRakjQ==
X-Received: by 2002:a05:6870:3907:b0:447:1ceb:7cc6 with SMTP id 586e51a60fabf-491e539b4b4mr3344946fac.15.1790271892922;
        Thu, 24 Sep 2026 10:44:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:40 -0600
Subject: [PATCH net v3 10/10] net: stmmac: retain DMA resources across MTU
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-10-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104454_093380_98E97376 
X-CRM114-Status: GOOD (  28.87  )
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

Releasing the current datapath before reopening with a new MTU loses the
working configuration when hardware setup fails. Keep the old rings and
IRQ registrations until replacement hardware setup succeeds, so an
ordinary setup error can restore the old MTU without allocating new rings
or requesting interrupts again.

The preceding changes provide safe allocation unwind, stable DMA/IRQ
objects and a no-reset path for normal-size MTUs. For jumbo transitions,
prepare the replacement first, then quiesce the old queues and drain IRQ
handlers and network readers. Fill holes in the old RX buffer array before
resetting DMA, without altering its descriptors. Rollback can then rebuild
the old rings without allocations.

Only a successful reset permits old descriptors to be rewritten or retired:
clearing a DMA enable bit need not finish an in-flight frame immediately.
Separate buffer allocation from descriptor initialization so preparation
can fail without changing the active rings.

Publish the prospective MTU before MAC setup, since dwmac1000 uses it to
select receive limits. On error, restore the old MTU and configuration
before resetting and rebuilding the old rings. If that reset also fails,
retain the old rings and leave the administratively-up interface detached,
with IRQs released and NAPI stopped, until ordinary down/up recovery.
Distinguish this HALTED state from SUSPENDED, which still owns its IRQs.

Preserve coalescing, PHC registration and packet timestamp filters instead
of running a complete close/open. Reinitialize timestamp hardware after
reset without creating a new PHC. This does not preserve continuous PHC
time across the reset.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 327 +++++++++++++++++-----
 2 files changed, 257 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f07623a1285c..8ebf40789568 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -265,6 +265,8 @@ enum stmmac_datapath_state {
 	STMMAC_DATAPATH_RUNNING,
 	/* Resources retained, NAPI and DMA stopped; also after failed resume. */
 	STMMAC_DATAPATH_SUSPENDED,
+	/* Failed MTU rollback: rings retained, but no IRQs or running NAPI. */
+	STMMAC_DATAPATH_HALTED,
 };
 
 struct stmmac_priv {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d17c68f55caf..1a552455a633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1629,24 +1629,10 @@ static void stmmac_clear_descriptors(struct stmmac_priv *priv,
 		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
 }
 
-/**
- * stmmac_init_rx_buffers - init the RX descriptor buffer.
- * @priv: driver private structure
- * @dma_conf: structure to take the dma data
- * @p: descriptor pointer
- * @i: descriptor index
- * @flags: gfp flag
- * @queue: RX queue index
- * Description: this function is called to allocate a receive buffer, perform
- * the DMA mapping and init the descriptor.
- */
-static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
-				  struct stmmac_dma_conf *dma_conf,
-				  struct dma_desc *p,
-				  int i, gfp_t flags, u32 queue)
+static int stmmac_alloc_rx_buffer(struct stmmac_priv *priv,
+				  struct stmmac_rx_queue *rx_q,
+				  struct stmmac_rx_buffer *buf)
 {
-	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
-	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
 	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
 
 	if (priv->dma_cap.host_dma_width <= 32)
@@ -1663,19 +1649,49 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 		if (!buf->sec_page)
 			return -ENOMEM;
-
 		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
-	} else {
-		buf->sec_page = NULL;
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
 	}
 
+	return 0;
+}
+
+static void stmmac_init_rx_buffer_desc(struct stmmac_priv *priv,
+				       struct stmmac_dma_conf *dma_conf,
+				       struct dma_desc *p,
+				       struct stmmac_rx_buffer *buf)
+{
+	if (buf->sec_page)
+		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
+	stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, !!buf->sec_page);
 	buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
 
 	stmmac_set_desc_addr(priv, p, buf->addr);
 	if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
 		stmmac_init_desc3(priv, p);
+}
+
+/**
+ * stmmac_init_rx_buffers - allocate a receive buffer and init its descriptor
+ * @priv: driver private structure
+ * @dma_conf: structure to take the dma data
+ * @p: descriptor pointer
+ * @i: descriptor index
+ * @flags: gfp flag
+ * @queue: RX queue index
+ */
+static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
+				  struct stmmac_dma_conf *dma_conf,
+				  struct dma_desc *p,
+				  int i, gfp_t flags, u32 queue)
+{
+	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
+	int ret;
+
+	ret = stmmac_alloc_rx_buffer(priv, rx_q, buf);
+	if (ret)
+		return ret;
+	stmmac_init_rx_buffer_desc(priv, dma_conf, p, buf);
 
 	return 0;
 }
@@ -2132,6 +2148,63 @@ static void stmmac_free_tx_skbufs(struct stmmac_priv *priv)
 		dma_free_tx_skbufs(priv, priv->dma_conf, queue);
 }
 
+/* NAPI is stopped, but DMA may still be using the old rings. Fill holes in
+ * the software buffer array without changing any descriptors. If allocation
+ * fails, the old rings can continue unchanged. Otherwise rollback after a
+ * reset will not need to allocate buffers.
+ */
+static int stmmac_prepare_rx_buffers(struct stmmac_priv *priv)
+{
+	struct stmmac_dma_conf *dma_conf = priv->dma_conf;
+	u32 queue, i;
+	int ret;
+
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+		struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+
+		for (i = 0; i < dma_conf->dma_rx_size; i++) {
+			ret = stmmac_alloc_rx_buffer(priv, rx_q, &rx_q->buf_pool[i]);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/* Only after a successful DMA reset, and with all RX buffers prepared. */
+static void stmmac_reinit_dma_desc(struct stmmac_priv *priv)
+{
+	struct stmmac_dma_conf *dma_conf = priv->dma_conf;
+	u32 queue, i;
+
+	stmmac_free_tx_skbufs(priv);
+	stmmac_reset_queues_param(priv);
+	init_dma_tx_desc_rings(priv->dev, dma_conf);
+	stmmac_clear_descriptors(priv, dma_conf);
+
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+		struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+
+		if (rx_q->state_saved)
+			dev_kfree_skb_any(rx_q->state.skb);
+		rx_q->state.skb = NULL;
+		rx_q->state_saved = 0;
+		rx_q->rx_count_frames = 0;
+		rx_q->buf_alloc_num = dma_conf->dma_rx_size;
+
+		for (i = 0; i < dma_conf->dma_rx_size; i++)
+			stmmac_init_rx_buffer_desc(priv, dma_conf,
+						   stmmac_get_rx_desc(priv, rx_q, i),
+						   &rx_q->buf_pool[i]);
+
+		if (priv->descriptor_mode == STMMAC_CHAIN_MODE)
+			stmmac_mode_init(priv, stmmac_get_rx_desc(priv, rx_q, 0),
+					 rx_q->dma_rx_phy, dma_conf->dma_rx_size,
+					 priv->extend_desc);
+	}
+}
+
 /**
  * __free_dma_rx_desc_resources - free RX dma desc resources (per queue)
  * @priv: private structure
@@ -3285,12 +3358,13 @@ static int stmmac_prereset_configure(struct stmmac_priv *priv)
 /**
  * stmmac_init_dma_engine - DMA init.
  * @priv: driver private structure
+ * @reinit: rebuild the retained rings after a successful reset
  * Description:
  * It inits the DMA invoking the specific MAC/GMAC callback.
  * Some DMA parameters can be passed from the platform;
  * in case of these are not passed a default is kept for the MAC or GMAC.
  */
-static int stmmac_init_dma_engine(struct stmmac_priv *priv)
+static int stmmac_init_dma_engine(struct stmmac_priv *priv, bool reinit)
 {
 	u8 rx_channels_count = priv->plat->rx_queues_to_use;
 	u8 tx_channels_count = priv->plat->tx_queues_to_use;
@@ -3310,6 +3384,9 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		return ret;
 	}
 
+	if (reinit)
+		stmmac_reinit_dma_desc(priv);
+
 	/* DMA Configuration */
 	stmmac_dma_init(priv, priv->ioaddr, priv->plat->dma_cfg);
 
@@ -3657,6 +3734,7 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
+ *  @reinit: rebuild retained descriptor rings after the DMA reset
  *  Description:
  *  this is the main function to setup the HW in a usable state because the
  *  dma engine is reset, the core registers are configured (e.g. AXI,
@@ -3666,7 +3744,7 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
  *  0 on success and an appropriate (-)ve integer as defined in errno.h
  *  file on failure.
  */
-static int stmmac_hw_setup(struct net_device *dev)
+static int stmmac_hw_setup(struct net_device *dev, bool reinit)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 rx_cnt = priv->plat->rx_queues_to_use;
@@ -3688,7 +3766,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	phylink_rx_clk_stop_block(priv->phylink);
 
 	/* DMA initialization and SW reset */
-	ret = stmmac_init_dma_engine(priv);
+	ret = stmmac_init_dma_engine(priv, reinit);
 	if (ret < 0) {
 		phylink_rx_clk_stop_unblock(priv->phylink);
 		netdev_err(priv->dev, "%s: DMA engine initialization failed\n",
@@ -3804,8 +3882,7 @@ static void stmmac_free_irq(struct net_device *dev,
 		for (j = irq_idx - 1; msi && j >= 0; j--) {
 			if (msi->tx_irq[j] > 0) {
 				irq_set_affinity_hint(msi->tx_irq[j], NULL);
-				free_irq(msi->tx_irq[j],
-					 &priv->channel[j]);
+				free_irq(msi->tx_irq[j], &priv->channel[j]);
 			}
 		}
 		irq_idx = priv->plat->rx_queues_to_use;
@@ -3814,8 +3891,7 @@ static void stmmac_free_irq(struct net_device *dev,
 		for (j = irq_idx - 1; msi && j >= 0; j--) {
 			if (msi->rx_irq[j] > 0) {
 				irq_set_affinity_hint(msi->rx_irq[j], NULL);
-				free_irq(msi->rx_irq[j],
-					 &priv->channel[j]);
+				free_irq(msi->rx_irq[j], &priv->channel[j]);
 			}
 		}
 
@@ -4080,14 +4156,40 @@ static int stmmac_request_irq(struct net_device *dev)
 	return ret;
 }
 
+/* Balance disable_irq()/enable_irq() for every registered IRQ, including
+ * shared lines. Unlike freeing and requesting IRQs, this cannot fail.
+ */
+static void stmmac_set_irq_state(struct stmmac_priv *priv, bool enable)
+{
+	void (*set_state)(unsigned int) = enable ? enable_irq : disable_irq;
+	struct stmmac_msi *msi = priv->msi;
+	int irq = priv->dev->irq;
+	u32 i;
+
+	set_state(irq);
+	if (priv->wol_irq > 0 && priv->wol_irq != irq)
+		set_state(priv->wol_irq);
+	if (priv->sfty_irq > 0 && priv->sfty_irq != irq)
+		set_state(priv->sfty_irq);
+	if (!msi)
+		return;
+	if (msi->sfty_ce_irq > 0 && msi->sfty_ce_irq != irq)
+		set_state(msi->sfty_ce_irq);
+	if (msi->sfty_ue_irq > 0 && msi->sfty_ue_irq != irq)
+		set_state(msi->sfty_ue_irq);
+	for (i = 0; i < priv->plat->rx_queues_to_use; i++)
+		if (msi->rx_irq[i] > 0)
+			set_state(msi->rx_irq[i]);
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
+		if (msi->tx_irq[i] > 0)
+			set_state(msi->tx_irq[i]);
+}
+
 /**
- *  stmmac_setup_dma_desc - Generate a dma_conf and allocate DMA queue
- *  @priv: driver private structure
- *  @mtu: MTU to setup the dma queue and buf with
- *  Description: Allocate and generate a dma_conf based on the provided MTU.
- *  Allocate the Tx/Rx DMA queue and init them.
- *  Return value:
- *  the dma_conf allocated struct on success and an appropriate ERR_PTR on failure.
+ * stmmac_setup_dma_desc - allocate and initialize a DMA configuration
+ * @priv: driver private structure
+ * @mtu: MTU to size the receive buffers for
+ * Return: the allocated configuration, or an ERR_PTR on failure
  */
 static struct stmmac_dma_conf *
 stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
@@ -4220,7 +4322,7 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_reset_queues_param(priv);
 
-	ret = stmmac_hw_setup(dev);
+	ret = stmmac_hw_setup(dev, false);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto init_error;
@@ -4341,8 +4443,9 @@ static void stmmac_quiesce(struct stmmac_priv *priv)
 static void __stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	enum stmmac_datapath_state state = priv->datapath;
 
-	/* A failed MTU reopen has already released the data path. */
+	/* There may be no resources left after detached XDP reconfiguration. */
 	if (priv->datapath == STMMAC_DATAPATH_DOWN)
 		return;
 
@@ -4354,7 +4457,8 @@ static void __stmmac_release(struct net_device *dev)
 	priv->datapath = STMMAC_DATAPATH_DOWN;
 
 	/* Free the IRQ lines */
-	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	if (state != STMMAC_DATAPATH_HALTED)
+		stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
 	/* TX error IRQs can restart a queue after the first quiescence. */
 	stmmac_stop_tx_queues(priv);
@@ -6234,6 +6338,113 @@ static void stmmac_set_rx_mode(struct net_device *dev)
 	stmmac_set_filter(priv, priv->hw, dev);
 }
 
+static int stmmac_reconfigure_mtu(struct net_device *dev, int mtu)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	struct stmmac_dma_conf *old_conf = priv->dma_conf;
+	struct stmmac_dma_conf *new_conf;
+	int old_mtu = dev->mtu;
+	int ret, restore_ret;
+	u32 chan;
+
+	new_conf = stmmac_setup_dma_desc(priv, mtu);
+	if (IS_ERR(new_conf))
+		return PTR_ERR(new_conf);
+
+	netif_device_detach(dev);
+	phylink_stop(priv->phylink);
+	stmmac_quiesce(priv);
+	timer_delete_sync(&priv->eee_ctrl_timer);
+	if (stmmac_fpe_supported(priv))
+		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
+
+	/* An IRQ can recover a TX error and restart a queue. Drain handlers
+	 * before the final TX stop, and keep the registrations for rollback.
+	 */
+	stmmac_set_irq_state(priv, false);
+	netif_tx_disable(dev);
+	synchronize_net();
+
+	ret = stmmac_prepare_rx_buffers(priv);
+	if (ret)
+		goto restart;
+
+	stmmac_stop_all_dma(priv);
+	phylink_prepare_resume(priv->phylink);
+
+	/* MAC receive limits must be programmed for the prospective MTU. */
+	WRITE_ONCE(dev->mtu, mtu);
+	priv->dma_conf = new_conf;
+	stmmac_reset_queues_param(priv);
+	ret = stmmac_hw_setup(dev, false);
+	if (ret) {
+		stmmac_stop_all_dma(priv);
+		stmmac_mac_set(priv, priv->ioaddr, false);
+		priv->dma_conf = old_conf;
+		WRITE_ONCE(dev->mtu, old_mtu);
+
+		/* Reuse the retained rings. Reinitialize them only after reset
+		 * has completed, not merely after clearing the DMA enable bits.
+		 */
+		restore_ret = stmmac_hw_setup(dev, true);
+		if (restore_ret) {
+			stmmac_stop_all_dma(priv);
+			stmmac_mac_set(priv, priv->ioaddr, false);
+			stmmac_set_irq_state(priv, true);
+			stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+			netif_tx_disable(dev);
+			stmmac_stop_all_dma(priv);
+			priv->datapath = STMMAC_DATAPATH_HALTED;
+			netdev_err(dev, "MTU rollback failed: %pe; interface remains detached\n",
+				   ERR_PTR(restore_ret));
+			goto free_new;
+		}
+	} else {
+		/* Hardware setup completed its reset before using the new rings.
+		 * The old DMA allocations can now be released safely.
+		 */
+		free_dma_desc_resources(priv, old_conf);
+		kfree(old_conf);
+		for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+			hrtimer_setup(&new_conf->tx_queue[chan].txtimer,
+				      stmmac_tx_timer, CLOCK_MONOTONIC,
+				      HRTIMER_MODE_REL);
+	}
+
+	/* Restore timestamping without registering a new PHC or resetting the
+	 * user's packet timestamp filters. Timestamping can also be used without
+	 * a registered PHC (CONFIG_PTP_1588_CLOCK=n).
+	 */
+	if ((priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp) &&
+	    priv->plat->clk_ptp_rate) {
+		unsigned long flags;
+
+		write_lock_irqsave(&priv->ptp_lock, flags);
+		stmmac_init_tstamp_counter(priv, priv->systime_flags);
+		if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
+			stmmac_hwtstamp_correct_latency(priv, priv);
+		write_unlock_irqrestore(&priv->ptp_lock, flags);
+	}
+	stmmac_set_rx_mode(dev);
+	stmmac_vlan_restore(priv);
+
+restart:
+	stmmac_enable_all_queues(priv);
+	stmmac_enable_all_dma_irq(priv);
+	stmmac_set_irq_state(priv, true);
+	phylink_start(priv->phylink);
+	netif_device_attach(dev);
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		stmmac_tx_timer_arm(priv, chan);
+	if (!ret)
+		return 0;
+
+free_new:
+	free_dma_desc_resources(priv, new_conf);
+	kfree(new_conf);
+	return ret;
+}
+
 /**
  *  stmmac_change_mtu - entry point to change MTU size for the device.
  *  @dev : device pointer.
@@ -6248,9 +6459,7 @@ static void stmmac_set_rx_mode(struct net_device *dev)
 static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	struct stmmac_dma_conf *old_conf = priv->dma_conf;
 	int txfifosz = priv->plat->tx_fifo_size;
-	struct stmmac_dma_conf *dma_conf;
 	const int mtu = new_mtu;
 	int ret;
 
@@ -6276,36 +6485,9 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	 */
 	if (netif_running(dev) &&
 	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
-		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
-		/* Try to allocate the new DMA conf with the new mtu */
-		dma_conf = stmmac_setup_dma_desc(priv, mtu);
-		if (IS_ERR(dma_conf)) {
-			netdev_err(priv->dev, "failed allocating new dma conf for new MTU %d\n",
-				   mtu);
-			return PTR_ERR(dma_conf);
-		}
-
-		netif_device_detach(dev);
-		__stmmac_release(dev);
-
-		ret = __stmmac_open(dev, dma_conf);
-		if (ret) {
-			priv->dma_conf = old_conf;
-			free_dma_desc_resources(priv, dma_conf);
-			kfree(dma_conf);
-			/*
-			 * Keep the administrative state and PHY/PM ownership until
-			 * ndo_stop(), but prevent use of the released data path.
-			 */
-			netif_device_detach(dev);
-			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
+		ret = stmmac_reconfigure_mtu(dev, mtu);
+		if (ret)
 			return ret;
-		}
-
-		kfree(old_conf);
-
-		stmmac_set_rx_mode(dev);
-		netif_device_attach(dev);
 	}
 
 	WRITE_ONCE(dev->mtu, mtu);
@@ -7091,7 +7273,8 @@ static int stmmac_bpf(struct net_device *dev, struct netdev_bpf *bpf)
 	 * suspended rings before their pool or XDP buffer layout can change.
 	 * Leave the interface detached until it is closed and reopened.
 	 */
-	if (priv->datapath == STMMAC_DATAPATH_SUSPENDED)
+	if (priv->datapath == STMMAC_DATAPATH_SUSPENDED ||
+	    priv->datapath == STMMAC_DATAPATH_HALTED)
 		__stmmac_release(dev);
 
 	switch (bpf->command) {
@@ -8470,7 +8653,7 @@ int stmmac_resume(struct device *dev)
 	stmmac_free_tx_skbufs(priv);
 	stmmac_clear_descriptors(priv, priv->dma_conf);
 
-	ret = stmmac_hw_setup(ndev);
+	ret = stmmac_hw_setup(ndev, false);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto error_stop_dma;

-- 
2.53.0


