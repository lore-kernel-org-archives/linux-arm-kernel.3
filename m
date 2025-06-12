Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577A6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbCKtTuOdkhgYtqG/w3nE7tuIp9hwEek7jWMovF/OnU=; b=aMGXUd9++VfSkXUeHv+DUPLDy8
	99KUWzFhCJJFXE0Ifl3MQ+DJFYgkJfJl0nRFlkbnHfbhyQquQMegGgm1HNxv+zz083rz/LtuTmsJJ
	zLa18wg5+nyqpBlMmLt8LkBkORTMbbh1VGgN7N5WP7+hJmn5Da1VOWR67DRdGQAZXa8/T89J6egWw
	lsmWawNxDY2Q3W7nEXT1pV4aGiIhZaI8bisr98QcoQJJ4KsrXGM1i9poa3sDJPoK+8hwR7DjVWYWv
	7bUcdQ0xhZ8L0+VaMNs/2VZgE4X2NWZS0+KLFd/gdXUG/wLajjylWqsoo/eP3kE9OY3XAW7sNlVx/
	mLaIGA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcSw-0000000CSnb-0teK;
	Thu, 12 Jun 2025 07:35:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcAc-0000000CPcF-3NeJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:16:20 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C7GFkd2800733;
	Thu, 12 Jun 2025 02:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749712575;
	bh=AbCKtTuOdkhgYtqG/w3nE7tuIp9hwEek7jWMovF/OnU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VGa6aVfYLHpN7KPmNapC3ewWlCYp5YUIGJuoZ4sukZy9c1W2CuW5oKnbb7JZtE3j/
	 ItIQV/ssUfvNoadQ62u59TowTAbC82mAwk5xJN0UXfH80MNCxSKcyE7V0A5rcrTeXL
	 RF8kH+I6LVSuS4lFPEb+fPdbTkC4XIt/u8gbCys4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C7GF9G2380847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 02:16:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 02:16:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 02:16:14 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C7FTKU1608959;
	Thu, 12 Jun 2025 02:16:10 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>
Subject: [PATCH v2 08/17] dmaengine: ti: k3-udma: move resource management functions to k3-udma-common.c
Date: Thu, 12 Jun 2025 12:45:12 +0530
Message-ID: <20250612071521.3116831-9-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612071521.3116831-1-s-adivi@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_001618_944242_54FC27D4 
X-CRM114-Status: GOOD (  26.48  )
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

Move functions responsible for allocation and release of udma
resources such as channels, rings and flows from k3-udma.c
to the common k3-udma-common.c file.

The implementation of these functions is largely shared between K3 UDMA
and K3 UDMA v2. This refactor improves code reuse and maintainability
across multiple variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 423 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 423 --------------------------------
 drivers/dma/ti/k3-udma.h        |  25 ++
 3 files changed, 448 insertions(+), 423 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 13f3d5cec2135..76f8c8cae676b 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1863,3 +1863,426 @@ enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 	}
 }
 
+/**
+ * __udma_alloc_gp_rflow_range - alloc range of GP RX flows
+ * @ud: UDMA device
+ * @from: Start the search from this flow id number
+ * @cnt: Number of consecutive flow ids to allocate
+ *
+ * Allocate range of RX flow ids for future use, those flows can be requested
+ * only using explicit flow id number. if @from is set to -1 it will try to find
+ * first free range. if @from is positive value it will force allocation only
+ * of the specified range of flows.
+ *
+ * Returns -ENOMEM if can't find free range.
+ * -EEXIST if requested range is busy.
+ * -EINVAL if wrong input values passed.
+ * Returns flow id on success.
+ */
+int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
+{
+	int start, tmp_from;
+	DECLARE_BITMAP(tmp, K3_UDMA_MAX_RFLOWS);
+
+	tmp_from = from;
+	if (tmp_from < 0)
+		tmp_from = ud->rchan_cnt;
+	/* default flows can't be allocated and accessible only by id */
+	if (tmp_from < ud->rchan_cnt)
+		return -EINVAL;
+
+	if (tmp_from + cnt > ud->rflow_cnt)
+		return -EINVAL;
+
+	bitmap_or(tmp, ud->rflow_gp_map, ud->rflow_gp_map_allocated,
+		  ud->rflow_cnt);
+
+	start = bitmap_find_next_zero_area(tmp,
+					   ud->rflow_cnt,
+					   tmp_from, cnt, 0);
+	if (start >= ud->rflow_cnt)
+		return -ENOMEM;
+
+	if (from >= 0 && start != from)
+		return -EEXIST;
+
+	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);
+	return start;
+}
+
+int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
+{
+	if (from < ud->rchan_cnt)
+		return -EINVAL;
+	if (from + cnt > ud->rflow_cnt)
+		return -EINVAL;
+
+	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
+	return 0;
+}
+
+struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id)
+{
+	/*
+	 * Attempt to request rflow by ID can be made for any rflow
+	 * if not in use with assumption that caller knows what's doing.
+	 * TI-SCI FW will perform additional permission check ant way, it's
+	 * safe
+	 */
+
+	if (id < 0 || id >= ud->rflow_cnt)
+		return ERR_PTR(-ENOENT);
+
+	if (test_bit(id, ud->rflow_in_use))
+		return ERR_PTR(-ENOENT);
+
+	if (ud->rflow_gp_map) {
+		/* GP rflow has to be allocated first */
+		if (!test_bit(id, ud->rflow_gp_map) &&
+		    !test_bit(id, ud->rflow_gp_map_allocated))
+			return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(ud->dev, "get rflow%d\n", id);
+	set_bit(id, ud->rflow_in_use);
+	return &ud->rflows[id];
+}
+
+void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow)
+{
+	if (!test_bit(rflow->id, ud->rflow_in_use)) {
+		dev_err(ud->dev, "attempt to put unused rflow%d\n", rflow->id);
+		return;
+	}
+
+	dev_dbg(ud->dev, "put rflow%d\n", rflow->id);
+	clear_bit(rflow->id, ud->rflow_in_use);
+}
+
+#define UDMA_RESERVE_RESOURCE(res)					\
+struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
+					       enum udma_tp_level tpl,	\
+					       int id)			\
+{									\
+	if (id >= 0) {							\
+		if (test_bit(id, ud->res##_map)) {			\
+			dev_err(ud->dev, "res##%d is in use\n", id);	\
+			return ERR_PTR(-ENOENT);			\
+		}							\
+	} else {							\
+		int start;						\
+									\
+		if (tpl >= ud->res##_tpl.levels)			\
+			tpl = ud->res##_tpl.levels - 1;			\
+									\
+		start = ud->res##_tpl.start_idx[tpl];			\
+									\
+		id = find_next_zero_bit(ud->res##_map, ud->res##_cnt,	\
+					start);				\
+		if (id == ud->res##_cnt) {				\
+			return ERR_PTR(-ENOENT);			\
+		}							\
+	}								\
+									\
+	set_bit(id, ud->res##_map);					\
+	return &ud->res##s[id];						\
+}
+
+UDMA_RESERVE_RESOURCE(bchan);
+UDMA_RESERVE_RESOURCE(tchan);
+UDMA_RESERVE_RESOURCE(rchan);
+
+int udma_get_tchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (uc->tchan) {
+		dev_dbg(ud->dev, "chan%d: already have tchan%d allocated\n",
+			uc->id, uc->tchan->id);
+		return 0;
+	}
+
+	/*
+	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
+	 * For PKTDMA mapped channels it is configured to a channel which must
+	 * be used to service the peripheral.
+	 */
+	uc->tchan = __udma_reserve_tchan(ud, uc->config.channel_tpl,
+					 uc->config.mapped_channel_id);
+	if (IS_ERR(uc->tchan)) {
+		ret = PTR_ERR(uc->tchan);
+		uc->tchan = NULL;
+		return ret;
+	}
+
+	if (ud->tflow_cnt) {
+		int tflow_id;
+
+		/* Only PKTDMA have support for tx flows */
+		if (uc->config.default_flow_id >= 0)
+			tflow_id = uc->config.default_flow_id;
+		else
+			tflow_id = uc->tchan->id;
+
+		if (test_bit(tflow_id, ud->tflow_map)) {
+			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
+			clear_bit(uc->tchan->id, ud->tchan_map);
+			uc->tchan = NULL;
+			return -ENOENT;
+		}
+
+		uc->tchan->tflow_id = tflow_id;
+		set_bit(tflow_id, ud->tflow_map);
+	} else {
+		uc->tchan->tflow_id = -1;
+	}
+
+	return 0;
+}
+
+int udma_get_rchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (uc->rchan) {
+		dev_dbg(ud->dev, "chan%d: already have rchan%d allocated\n",
+			uc->id, uc->rchan->id);
+		return 0;
+	}
+
+	/*
+	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
+	 * For PKTDMA mapped channels it is configured to a channel which must
+	 * be used to service the peripheral.
+	 */
+	uc->rchan = __udma_reserve_rchan(ud, uc->config.channel_tpl,
+					 uc->config.mapped_channel_id);
+	if (IS_ERR(uc->rchan)) {
+		ret = PTR_ERR(uc->rchan);
+		uc->rchan = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+int udma_get_chan_pair(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int chan_id, end;
+
+	if ((uc->tchan && uc->rchan) && uc->tchan->id == uc->rchan->id) {
+		dev_info(ud->dev, "chan%d: already have %d pair allocated\n",
+			 uc->id, uc->tchan->id);
+		return 0;
+	}
+
+	if (uc->tchan) {
+		dev_err(ud->dev, "chan%d: already have tchan%d allocated\n",
+			uc->id, uc->tchan->id);
+		return -EBUSY;
+	} else if (uc->rchan) {
+		dev_err(ud->dev, "chan%d: already have rchan%d allocated\n",
+			uc->id, uc->rchan->id);
+		return -EBUSY;
+	}
+
+	/* Can be optimized, but let's have it like this for now */
+	end = min(ud->tchan_cnt, ud->rchan_cnt);
+	/*
+	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
+	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
+	 */
+	chan_id = ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
+	for (; chan_id < end; chan_id++) {
+		if (!test_bit(chan_id, ud->tchan_map) &&
+		    !test_bit(chan_id, ud->rchan_map))
+			break;
+	}
+
+	if (chan_id == end)
+		return -ENOENT;
+
+	set_bit(chan_id, ud->tchan_map);
+	set_bit(chan_id, ud->rchan_map);
+	uc->tchan = &ud->tchans[chan_id];
+	uc->rchan = &ud->rchans[chan_id];
+
+	/* UDMA does not use tx flows */
+	uc->tchan->tflow_id = -1;
+
+	return 0;
+}
+
+int udma_get_rflow(struct udma_chan *uc, int flow_id)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (!uc->rchan) {
+		dev_err(ud->dev, "chan%d: does not have rchan??\n", uc->id);
+		return -EINVAL;
+	}
+
+	if (uc->rflow) {
+		dev_dbg(ud->dev, "chan%d: already have rflow%d allocated\n",
+			uc->id, uc->rflow->id);
+		return 0;
+	}
+
+	uc->rflow = __udma_get_rflow(ud, flow_id);
+	if (IS_ERR(uc->rflow)) {
+		ret = PTR_ERR(uc->rflow);
+		uc->rflow = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+void udma_put_rchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->rchan) {
+		dev_dbg(ud->dev, "chan%d: put rchan%d\n", uc->id,
+			uc->rchan->id);
+		clear_bit(uc->rchan->id, ud->rchan_map);
+		uc->rchan = NULL;
+	}
+}
+
+void udma_put_tchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->tchan) {
+		dev_dbg(ud->dev, "chan%d: put tchan%d\n", uc->id,
+			uc->tchan->id);
+		clear_bit(uc->tchan->id, ud->tchan_map);
+
+		if (uc->tchan->tflow_id >= 0)
+			clear_bit(uc->tchan->tflow_id, ud->tflow_map);
+
+		uc->tchan = NULL;
+	}
+}
+
+void udma_put_rflow(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->rflow) {
+		dev_dbg(ud->dev, "chan%d: put rflow%d\n", uc->id,
+			uc->rflow->id);
+		__udma_put_rflow(ud, uc->rflow);
+		uc->rflow = NULL;
+	}
+}
+
+void udma_free_tx_resources(struct udma_chan *uc)
+{
+	if (!uc->tchan)
+		return;
+
+	k3_ringacc_ring_free(uc->tchan->t_ring);
+	k3_ringacc_ring_free(uc->tchan->tc_ring);
+	uc->tchan->t_ring = NULL;
+	uc->tchan->tc_ring = NULL;
+
+	udma_put_tchan(uc);
+}
+
+void udma_free_rx_resources(struct udma_chan *uc)
+{
+	if (!uc->rchan)
+		return;
+
+	if (uc->rflow) {
+		struct udma_rflow *rflow = uc->rflow;
+
+		k3_ringacc_ring_free(rflow->fd_ring);
+		k3_ringacc_ring_free(rflow->r_ring);
+		rflow->fd_ring = NULL;
+		rflow->r_ring = NULL;
+
+		udma_put_rflow(uc);
+	}
+
+	udma_put_rchan(uc);
+}
+
+void udma_free_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+
+	udma_terminate_all(chan);
+	if (uc->terminated_desc) {
+		ud->reset_chan(uc, false);
+		udma_reset_rings(uc);
+	}
+
+	cancel_delayed_work_sync(&uc->tx_drain.work);
+
+	if (uc->irq_num_ring > 0) {
+		free_irq(uc->irq_num_ring, uc);
+
+		uc->irq_num_ring = 0;
+	}
+	if (uc->irq_num_udma > 0) {
+		free_irq(uc->irq_num_udma, uc);
+
+		uc->irq_num_udma = 0;
+	}
+
+	/* Release PSI-L pairing */
+	if (uc->psil_paired) {
+		navss_psil_unpair(ud, uc->config.src_thread,
+				  uc->config.dst_thread);
+		uc->psil_paired = false;
+	}
+
+	vchan_free_chan_resources(&uc->vc);
+	tasklet_kill(&uc->vc.task);
+
+	bcdma_free_bchan_resources(uc);
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+	udma_reset_uchan(uc);
+
+	if (uc->use_dma_pool) {
+		dma_pool_destroy(uc->hdesc_pool);
+		uc->use_dma_pool = false;
+	}
+}
+
+void bcdma_put_bchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->bchan) {
+		dev_dbg(ud->dev, "chan%d: put bchan%d\n", uc->id,
+			uc->bchan->id);
+		clear_bit(uc->bchan->id, ud->bchan_map);
+		uc->bchan = NULL;
+		uc->tchan = NULL;
+	}
+}
+
+void bcdma_free_bchan_resources(struct udma_chan *uc)
+{
+	if (!uc->bchan)
+		return;
+
+	k3_ringacc_ring_free(uc->bchan->tc_ring);
+	k3_ringacc_ring_free(uc->bchan->t_ring);
+	uc->bchan->tc_ring = NULL;
+	uc->bchan->t_ring = NULL;
+	k3_configure_chan_coherency(&uc->vc.chan, 0);
+
+	bcdma_put_bchan(uc);
+}
+
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index e102f219ce34e..342530457be8e 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -423,135 +423,6 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/**
- * __udma_alloc_gp_rflow_range - alloc range of GP RX flows
- * @ud: UDMA device
- * @from: Start the search from this flow id number
- * @cnt: Number of consecutive flow ids to allocate
- *
- * Allocate range of RX flow ids for future use, those flows can be requested
- * only using explicit flow id number. if @from is set to -1 it will try to find
- * first free range. if @from is positive value it will force allocation only
- * of the specified range of flows.
- *
- * Returns -ENOMEM if can't find free range.
- * -EEXIST if requested range is busy.
- * -EINVAL if wrong input values passed.
- * Returns flow id on success.
- */
-static int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
-{
-	int start, tmp_from;
-	DECLARE_BITMAP(tmp, K3_UDMA_MAX_RFLOWS);
-
-	tmp_from = from;
-	if (tmp_from < 0)
-		tmp_from = ud->rchan_cnt;
-	/* default flows can't be allocated and accessible only by id */
-	if (tmp_from < ud->rchan_cnt)
-		return -EINVAL;
-
-	if (tmp_from + cnt > ud->rflow_cnt)
-		return -EINVAL;
-
-	bitmap_or(tmp, ud->rflow_gp_map, ud->rflow_gp_map_allocated,
-		  ud->rflow_cnt);
-
-	start = bitmap_find_next_zero_area(tmp,
-					   ud->rflow_cnt,
-					   tmp_from, cnt, 0);
-	if (start >= ud->rflow_cnt)
-		return -ENOMEM;
-
-	if (from >= 0 && start != from)
-		return -EEXIST;
-
-	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);
-	return start;
-}
-
-static int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
-{
-	if (from < ud->rchan_cnt)
-		return -EINVAL;
-	if (from + cnt > ud->rflow_cnt)
-		return -EINVAL;
-
-	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
-	return 0;
-}
-
-static struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id)
-{
-	/*
-	 * Attempt to request rflow by ID can be made for any rflow
-	 * if not in use with assumption that caller knows what's doing.
-	 * TI-SCI FW will perform additional permission check ant way, it's
-	 * safe
-	 */
-
-	if (id < 0 || id >= ud->rflow_cnt)
-		return ERR_PTR(-ENOENT);
-
-	if (test_bit(id, ud->rflow_in_use))
-		return ERR_PTR(-ENOENT);
-
-	if (ud->rflow_gp_map) {
-		/* GP rflow has to be allocated first */
-		if (!test_bit(id, ud->rflow_gp_map) &&
-		    !test_bit(id, ud->rflow_gp_map_allocated))
-			return ERR_PTR(-EINVAL);
-	}
-
-	dev_dbg(ud->dev, "get rflow%d\n", id);
-	set_bit(id, ud->rflow_in_use);
-	return &ud->rflows[id];
-}
-
-static void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow)
-{
-	if (!test_bit(rflow->id, ud->rflow_in_use)) {
-		dev_err(ud->dev, "attempt to put unused rflow%d\n", rflow->id);
-		return;
-	}
-
-	dev_dbg(ud->dev, "put rflow%d\n", rflow->id);
-	clear_bit(rflow->id, ud->rflow_in_use);
-}
-
-#define UDMA_RESERVE_RESOURCE(res)					\
-static struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
-					       enum udma_tp_level tpl,	\
-					       int id)			\
-{									\
-	if (id >= 0) {							\
-		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
-		}							\
-	} else {							\
-		int start;						\
-									\
-		if (tpl >= ud->res##_tpl.levels)			\
-			tpl = ud->res##_tpl.levels - 1;			\
-									\
-		start = ud->res##_tpl.start_idx[tpl];			\
-									\
-		id = find_next_zero_bit(ud->res##_map, ud->res##_cnt,	\
-					start);				\
-		if (id == ud->res##_cnt) {				\
-			return ERR_PTR(-ENOENT);			\
-		}							\
-	}								\
-									\
-	set_bit(id, ud->res##_map);					\
-	return &ud->res##s[id];						\
-}
-
-UDMA_RESERVE_RESOURCE(bchan);
-UDMA_RESERVE_RESOURCE(tchan);
-UDMA_RESERVE_RESOURCE(rchan);
-
 static int bcdma_get_bchan(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -585,223 +456,6 @@ static int bcdma_get_bchan(struct udma_chan *uc)
 	return 0;
 }
 
-static int udma_get_tchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (uc->tchan) {
-		dev_dbg(ud->dev, "chan%d: already have tchan%d allocated\n",
-			uc->id, uc->tchan->id);
-		return 0;
-	}
-
-	/*
-	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
-	 * For PKTDMA mapped channels it is configured to a channel which must
-	 * be used to service the peripheral.
-	 */
-	uc->tchan = __udma_reserve_tchan(ud, uc->config.channel_tpl,
-					 uc->config.mapped_channel_id);
-	if (IS_ERR(uc->tchan)) {
-		ret = PTR_ERR(uc->tchan);
-		uc->tchan = NULL;
-		return ret;
-	}
-
-	if (ud->tflow_cnt) {
-		int tflow_id;
-
-		/* Only PKTDMA have support for tx flows */
-		if (uc->config.default_flow_id >= 0)
-			tflow_id = uc->config.default_flow_id;
-		else
-			tflow_id = uc->tchan->id;
-
-		if (test_bit(tflow_id, ud->tflow_map)) {
-			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
-			clear_bit(uc->tchan->id, ud->tchan_map);
-			uc->tchan = NULL;
-			return -ENOENT;
-		}
-
-		uc->tchan->tflow_id = tflow_id;
-		set_bit(tflow_id, ud->tflow_map);
-	} else {
-		uc->tchan->tflow_id = -1;
-	}
-
-	return 0;
-}
-
-static int udma_get_rchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (uc->rchan) {
-		dev_dbg(ud->dev, "chan%d: already have rchan%d allocated\n",
-			uc->id, uc->rchan->id);
-		return 0;
-	}
-
-	/*
-	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
-	 * For PKTDMA mapped channels it is configured to a channel which must
-	 * be used to service the peripheral.
-	 */
-	uc->rchan = __udma_reserve_rchan(ud, uc->config.channel_tpl,
-					 uc->config.mapped_channel_id);
-	if (IS_ERR(uc->rchan)) {
-		ret = PTR_ERR(uc->rchan);
-		uc->rchan = NULL;
-		return ret;
-	}
-
-	return 0;
-}
-
-static int udma_get_chan_pair(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int chan_id, end;
-
-	if ((uc->tchan && uc->rchan) && uc->tchan->id == uc->rchan->id) {
-		dev_info(ud->dev, "chan%d: already have %d pair allocated\n",
-			 uc->id, uc->tchan->id);
-		return 0;
-	}
-
-	if (uc->tchan) {
-		dev_err(ud->dev, "chan%d: already have tchan%d allocated\n",
-			uc->id, uc->tchan->id);
-		return -EBUSY;
-	} else if (uc->rchan) {
-		dev_err(ud->dev, "chan%d: already have rchan%d allocated\n",
-			uc->id, uc->rchan->id);
-		return -EBUSY;
-	}
-
-	/* Can be optimized, but let's have it like this for now */
-	end = min(ud->tchan_cnt, ud->rchan_cnt);
-	/*
-	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
-	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
-	 */
-	chan_id = ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
-	for (; chan_id < end; chan_id++) {
-		if (!test_bit(chan_id, ud->tchan_map) &&
-		    !test_bit(chan_id, ud->rchan_map))
-			break;
-	}
-
-	if (chan_id == end)
-		return -ENOENT;
-
-	set_bit(chan_id, ud->tchan_map);
-	set_bit(chan_id, ud->rchan_map);
-	uc->tchan = &ud->tchans[chan_id];
-	uc->rchan = &ud->rchans[chan_id];
-
-	/* UDMA does not use tx flows */
-	uc->tchan->tflow_id = -1;
-
-	return 0;
-}
-
-static int udma_get_rflow(struct udma_chan *uc, int flow_id)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (!uc->rchan) {
-		dev_err(ud->dev, "chan%d: does not have rchan??\n", uc->id);
-		return -EINVAL;
-	}
-
-	if (uc->rflow) {
-		dev_dbg(ud->dev, "chan%d: already have rflow%d allocated\n",
-			uc->id, uc->rflow->id);
-		return 0;
-	}
-
-	uc->rflow = __udma_get_rflow(ud, flow_id);
-	if (IS_ERR(uc->rflow)) {
-		ret = PTR_ERR(uc->rflow);
-		uc->rflow = NULL;
-		return ret;
-	}
-
-	return 0;
-}
-
-static void bcdma_put_bchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->bchan) {
-		dev_dbg(ud->dev, "chan%d: put bchan%d\n", uc->id,
-			uc->bchan->id);
-		clear_bit(uc->bchan->id, ud->bchan_map);
-		uc->bchan = NULL;
-		uc->tchan = NULL;
-	}
-}
-
-static void udma_put_rchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->rchan) {
-		dev_dbg(ud->dev, "chan%d: put rchan%d\n", uc->id,
-			uc->rchan->id);
-		clear_bit(uc->rchan->id, ud->rchan_map);
-		uc->rchan = NULL;
-	}
-}
-
-static void udma_put_tchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->tchan) {
-		dev_dbg(ud->dev, "chan%d: put tchan%d\n", uc->id,
-			uc->tchan->id);
-		clear_bit(uc->tchan->id, ud->tchan_map);
-
-		if (uc->tchan->tflow_id >= 0)
-			clear_bit(uc->tchan->tflow_id, ud->tflow_map);
-
-		uc->tchan = NULL;
-	}
-}
-
-static void udma_put_rflow(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->rflow) {
-		dev_dbg(ud->dev, "chan%d: put rflow%d\n", uc->id,
-			uc->rflow->id);
-		__udma_put_rflow(ud, uc->rflow);
-		uc->rflow = NULL;
-	}
-}
-
-static void bcdma_free_bchan_resources(struct udma_chan *uc)
-{
-	if (!uc->bchan)
-		return;
-
-	k3_ringacc_ring_free(uc->bchan->tc_ring);
-	k3_ringacc_ring_free(uc->bchan->t_ring);
-	uc->bchan->tc_ring = NULL;
-	uc->bchan->t_ring = NULL;
-	k3_configure_chan_coherency(&uc->vc.chan, 0);
-
-	bcdma_put_bchan(uc);
-}
-
 static int bcdma_alloc_bchan_resources(struct udma_chan *uc)
 {
 	struct k3_ring_cfg ring_cfg;
@@ -847,19 +501,6 @@ static int bcdma_alloc_bchan_resources(struct udma_chan *uc)
 	return ret;
 }
 
-static void udma_free_tx_resources(struct udma_chan *uc)
-{
-	if (!uc->tchan)
-		return;
-
-	k3_ringacc_ring_free(uc->tchan->t_ring);
-	k3_ringacc_ring_free(uc->tchan->tc_ring);
-	uc->tchan->t_ring = NULL;
-	uc->tchan->tc_ring = NULL;
-
-	udma_put_tchan(uc);
-}
-
 static int udma_alloc_tx_resources(struct udma_chan *uc)
 {
 	struct k3_ring_cfg ring_cfg;
@@ -917,25 +558,6 @@ static int udma_alloc_tx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-static void udma_free_rx_resources(struct udma_chan *uc)
-{
-	if (!uc->rchan)
-		return;
-
-	if (uc->rflow) {
-		struct udma_rflow *rflow = uc->rflow;
-
-		k3_ringacc_ring_free(rflow->fd_ring);
-		k3_ringacc_ring_free(rflow->r_ring);
-		rflow->fd_ring = NULL;
-		rflow->r_ring = NULL;
-
-		udma_put_rflow(uc);
-	}
-
-	udma_put_rchan(uc);
-}
-
 static int udma_alloc_rx_resources(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -2024,51 +1646,6 @@ static int udma_resume(struct dma_chan *chan)
 	return 0;
 }
 
-static void udma_free_chan_resources(struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	struct udma_dev *ud = to_udma_dev(chan->device);
-
-	udma_terminate_all(chan);
-	if (uc->terminated_desc) {
-		ud->reset_chan(uc, false);
-		udma_reset_rings(uc);
-	}
-
-	cancel_delayed_work_sync(&uc->tx_drain.work);
-
-	if (uc->irq_num_ring > 0) {
-		free_irq(uc->irq_num_ring, uc);
-
-		uc->irq_num_ring = 0;
-	}
-	if (uc->irq_num_udma > 0) {
-		free_irq(uc->irq_num_udma, uc);
-
-		uc->irq_num_udma = 0;
-	}
-
-	/* Release PSI-L pairing */
-	if (uc->psil_paired) {
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
-		uc->psil_paired = false;
-	}
-
-	vchan_free_chan_resources(&uc->vc);
-	tasklet_kill(&uc->vc.task);
-
-	bcdma_free_bchan_resources(uc);
-	udma_free_tx_resources(uc);
-	udma_free_rx_resources(uc);
-	udma_reset_uchan(uc);
-
-	if (uc->use_dma_pool) {
-		dma_pool_destroy(uc->hdesc_pool);
-		uc->use_dma_pool = false;
-	}
-}
-
 static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index ca3d7aebba13b..75b0348fffc5d 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -648,6 +648,31 @@ void udma_dbg_summary_show(struct seq_file *s,
 		struct dma_device *dma_dev);
 #endif /* CONFIG_DEBUG_FS */
 
+int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt);
+int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt);
+struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id);
+void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow);
+int udma_get_tchan(struct udma_chan *uc);
+int udma_get_rchan(struct udma_chan *uc);
+int udma_get_chan_pair(struct udma_chan *uc);
+int udma_get_rflow(struct udma_chan *uc, int flow_id);
+void udma_put_rchan(struct udma_chan *uc);
+void udma_put_tchan(struct udma_chan *uc);
+void udma_put_rflow(struct udma_chan *uc);
+void udma_free_tx_resources(struct udma_chan *uc);
+void udma_free_rx_resources(struct udma_chan *uc);
+void udma_free_chan_resources(struct dma_chan *chan);
+void bcdma_put_bchan(struct udma_chan *uc);
+void bcdma_free_bchan_resources(struct udma_chan *uc);
+
+#define _UDMA_RESERVE_RESOURCE(res)					\
+struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
+					       enum udma_tp_level tpl,	\
+					       int id);
+_UDMA_RESERVE_RESOURCE(bchan);
+_UDMA_RESERVE_RESOURCE(tchan);
+_UDMA_RESERVE_RESOURCE(rchan);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.34.1


