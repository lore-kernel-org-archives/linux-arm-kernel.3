Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U//SWqsSuLmODkgmWfKKvBT1rxqLiXQ+CAgE+X4XDvo=; b=w+utZMz5tVgpK/is0GZMPGTxum
	nwftpoDZnkegKEygdD5T9RZbvCOpbqxdY1WBgrGF27sX+2y03A7Hx/FrXxV8RlIQwPPP3jpiGbpa0
	dDj4RyKStTYigvN7qQsTuLWprfkt5c8gmwdTkW2bZSkgdaEgYY76EzupsVmuJK2T88gOFf/2eBT8Z
	PIfeXNNyHVy6NZUTUQyB1vstPDalE3AbK7B6qQUSh96Vh1Tu2uSMMNCTeqHgUtauXuHFlKkvCL+iI
	fHcMSKhuZ4RBlEieYiCBMhwN8bUXNFdt5OTsSdPHhcspGO8IlVZwh4gu5hGATHJmOE1fwwDdCY0lk
	bWVnVcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITw-0000000Gslg-3jlR;
	Thu, 16 Jul 2026 09:34:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITv-0000000Gskj-1ga1;
	Thu, 16 Jul 2026 09:34:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF3D2600B0;
	Thu, 16 Jul 2026 09:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B15F1F00A3F;
	Thu, 16 Jul 2026 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784194454;
	bh=U//SWqsSuLmODkgmWfKKvBT1rxqLiXQ+CAgE+X4XDvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SNkheOaz+Gp6pRbLdV1BgSspAJ+pAR2RdCuDknuTynArmyOHteBn8Ix/9v+f/ffwj
	 7ZbLIwWyyKUwHqJaZA7TpqKaP2/IHrun9BS3ayahed50VDUOXbcfoFUf1S1H75UtcA
	 2XHnsonI4JziYGu3umH7y24rA8zsNcNWpE6Zo1LXT0Cy92r2tB3sVDxQpO5zigPBkZ
	 oibGCkBL99AKIz+rzWFut2VZYzMUVapQpZKHuQEaeXwqiK2XYj50826mc9VRoTNQ0w
	 uGkOcmkXATZMG6CKRHzOvYBeU/KpwACieipTNSRaWBlrAbezO4MVd+93DZoKlg9cJi
	 JcB2fcZdmHdQg==
From: Simon Horman <horms@kernel.org>
To: jackbb_wu@compal.com
Cc: Simon Horman <horms@kernel.org>,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wen-zhi.huang@mediatek.com,
	shi-wei.yeh@mediatek.com,
	Minano.tseng@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/7] net: wwan: t9xx: Add control DMA interface
Date: Thu, 16 Jul 2026 10:34:06 +0100
Message-ID: <20260716093406.231071-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709-t9xx_driver_v1-v4-3-a8c009d509c5@compal.com>
References: <20260709-t9xx_driver_v1-v4-3-a8c009d509c5@compal.com>
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
--- Patch [3]: [PATCH v4 3/7] net: wwan: t9xx: Add control DMA interface ---
commit ee2f68157a30f68c2d68e46c572820b187896695
Author: Jack Wu <jackbb_wu@compal.com>

net: wwan: t9xx: Add control DMA interface

This patch adds the Cross Layer Direct Memory Access (CLDMA) interface for
the control plane to translate data between the host and device. It
implements GPD ring traversal for TX and RX paths and hardware interrupt
handling.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> index 0000000000000..3bab14d35d78d
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> [ ... ]
> +static void mtk_cldma_tx_done_work(struct work_struct *work)
> +{
> [ ... ]
> +		req = txq->req_pool + txq->free_idx;
> +
> +		rmb(); /* ensure HWO setup done before HWO read */
> +
> +		if (!req->data_vm_addr || (req->gpd->tx_gpd.gpd_flags & CLDMA_GPD_FLAG_HWO))
> +			break;

[Severity: High]
Is a dma_rmb() needed after checking the hardware ownership flag? On weakly
ordered architectures, speculative execution might read payload or length
fields before the ownership check is fully ordered in memory.

> [ ... ]
> +static void mtk_cldma_rx_done_work(struct work_struct *work)
> +{
> [ ... ]
> +again:
> +	for (i = 0; i < rxq->nr_gpds; i++) {
> +		req = rxq->req_pool + rxq->free_idx;
> +		if (!req->skb) {
> [ ... ]
> +		}
> +
> +		if (req->gpd->rx_gpd.gpd_flags & CLDMA_GPD_FLAG_HWO)
> +			break;
> +
> +		mtk_cldma_rx_skb_adjust(mdev, rxq, req);

[Severity: High]
Similarly, would we need a dma_rmb() here before attempting to read the
receive length out of the descriptor in mtk_cldma_rx_skb_adjust?

> +		do {
> +			ret = rxq->rx_done(req->skb, rxq->arg,
> +					   atomic_read(&rxq->need_exit) ? true : false);
> +			if (ret == -EAGAIN)
> +				usleep_range(1000, 2000);
> +			else
> +				req->skb = NULL;
> +		} while (ret == -EAGAIN);
> +
> +		ret = mtk_cldma_reload_rx_skb(mdev, rxq, req);
> +		if (ret)
> +			goto out;

[Severity: High]
If mtk_cldma_reload_rx_skb fails due to memory pressure, it jumps to out
without advancing rxq->free_idx. Will this cause the worker to permanently
stall the queue, as subsequent runs will constantly evaluate the same slot
without being able to make progress?

> [ ... ]
> +static void mtk_cldma_txq_free(struct cldma_drv_info *drv_info, u32 txqno)
> +{
> [ ... ]
> +		for (j = 0; j < txq->nr_bds; j++) {
> +			bd_dsc = req->bd_dsc_pool + j;
> +			dma_pool_free(drv_info->bd_dma_pool, bd_dsc->bd,
> +				      bd_dsc->bd_dma_addr);
> +		}
> +		kfree(req->bd_dsc_pool);
> +		dma_pool_free(drv_info->gpd_dma_pool, req->gpd, req->gpd_dma_addr);
> +		txq->free_idx = (txq->free_idx + 1) % txq->nr_gpds;
> +	}
> +
> +	kfree(txq->req_pool);
> +	kfree(txq);
> +}

[Severity: Critical]
Does this incorrectly free memory managed by devres? The arrays req_pool and
bd_dsc_pool are allocated using devm_kcalloc during initialization.
Calling kfree directly on devres-managed memory causes slab allocator
corruption and later double-frees when the device is detached. This same
pattern appears to be present in mtk_cldma_rxq_free as well.

> [ ... ]
> +static int mtk_cldma_reload_rx_skb(struct mtk_md_dev *mdev, struct rxq *rxq,
> +				   struct rx_req *req)
> +{
> [ ... ]
> +err_free_skb:
> +	if (nr_bds) {
> [ ... ]
> +		for (i = 0; i < nr_bds; i++) {
> +			bd_dsc = req->bd_dsc_pool + i;
> +			if (!bd_dsc->skb)
> +				break;
> +			if (!dma_mapping_error(mdev->dev, bd_dsc->data_dma_addr))
> +				dma_unmap_single(mdev->dev, bd_dsc->data_dma_addr,
> +						 req->frag_size, DMA_FROM_DEVICE);
> +			bd_dsc->data_dma_addr = 0;
> +			bd_dsc->skb->next = NULL;
> +			dev_kfree_skb_any(bd_dsc->skb);

[Severity: High]
Can this lead to a double free? After calling dev_kfree_skb_any here, the
pointer bd_dsc->skb is not set to NULL. During driver teardown,
mtk_cldma_rxq_free will iterate over this array, observe bd_dsc->skb is
still populated, and attempt to free it a second time.

> [ ... ]
> +static int mtk_cldma_txbuf_set(struct cldma_drv_info *drv_info, struct sk_buff *skb,
> +			       struct tx_req *req, int nr_bds)
> +{
> [ ... ]
> +	} else {
> +		req->data_dma_addr = dma_map_single(mdev->dev, skb->data,
> +						    skb->len, DMA_TO_DEVICE);

[Severity: High]
Does this code safely handle non-linear SKBs? When nr_bds is 0, this maps
skb->data using the full skb->len instead of skb_headlen(skb). Could this
cause an out-of-bounds read past the linear buffer for fragmented packets?

> [ ... ]
> +int mtk_cldma_submit_tx(void *dev, struct sk_buff *skb)
> +{
> [ ... ]
> +	req->data_len = skb->len;
> +	req->skb = skb;
> +	req->data_vm_addr = skb->data;
> +
> +	wmb(); /* ensure req and data msg set done before HWO setup */
> +
> +	req->gpd->tx_gpd.gpd_flags |= CLDMA_GPD_FLAG_HWO;

[Severity: High]
Could there be a race condition here with mtk_cldma_tx_done_work?
By setting req->data_vm_addr before setting the CLDMA_GPD_FLAG_HWO flag, a
concurrent execution of the completion worker might observe data_vm_addr as
non-NULL but with the hardware ownership flag still cleared, misinterpreting
this intermediate state as a completed transmission.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> index 68dddd652effc..2f51e150750da 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> [ ... ]
> @@ -998,6 +1036,7 @@ static void mtk_pci_remove(struct pci_dev *pdev)
>  	}
>  
>  	pci_clear_master(pdev);
> +	mtk_pci_dev_exit(mdev);
>  	mtk_pci_free_irq(mdev);

[Severity: High]
Is it intended to call pci_clear_master before mtk_pci_dev_exit? Disabling
bus mastering before the hardware queues are fully shut down via MMIO
commands in mtk_pci_dev_exit might block pending hardware DMA transactions
or completion descriptors, which can lead to PCIe Master Aborts or hangs.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c
> index 0000000000000..55297cfcdbc61
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c
> [ ... ]
> +static void mtk_ctrl_trb_handler(struct trb_srv *srv, struct trans_list *trans_list, u32 qno)
> +{
> [ ... ]
> +		case TRB_CMD_TX:
> +			err = mtk_cldma_submit_tx(trans->dev, skb);
> +			if (err) {
> +				if (trans_list->tx_burst_cnt[qno]) {
> +					kick = true;
> +					break;
> +				}
> +				if (err == -EAGAIN)
> +					return;

[Severity: High]
If mtk_cldma_submit_tx returns -EAGAIN due to DMA mapping failures, this
returns immediately and leaves the skb on the list. Since the budget is not
consumed and the queue remains non-empty, mtk_ctrl_chs_is_busy_or_empty
will evaluate to false. Could this cause the mtk_ctrl_trb_thread loop to
spin continuously without sleeping, leading to a CPU lockup?

> [ ... ]
> +static int mtk_ctrl_trb_thread(void *args)
> +{
> +	struct trb_srv *srv = args;
> +
> +	for (;;) {
> +		wait_event_interruptible(srv->trb_waitq,
> +					 !mtk_ctrl_chs_is_busy_or_empty(srv) ||
> +					 kthread_should_stop() || kthread_should_park());

[Severity: High]
Can this cause an infinite loop if a signal is delivered to the thread?
Using wait_event_interruptible without checking signal_pending(current) or
flushing signals means it will immediately return -ERESTARTSYS on every loop
iteration once a signal is pending, permanently burning a CPU core.

> [ ... ]
> +static void mtk_ctrl_remove_radix_tree(struct mtk_ctrl_trans *trans)
> +{
> +	struct radix_tree_iter iter;
> +	struct queue_info *queue;
> +	void __rcu **slot;
> +
> +	radix_tree_for_each_slot(slot, &trans->queue_tbl, &iter, 0) {
> +		queue = radix_tree_deref_slot(slot);
> +		if (!queue)
> +			continue;
> +		radix_tree_delete(&trans->queue_tbl, iter.index);
> +		kfree(queue);
> +	}
> +}

[Severity: High]
Is it safe to iterate over the radix tree and call radix_tree_delete without
holding rcu_read_lock? Because the tree operations use RCU for internal
node memory management, doing this locklessly might allow the grace period
to expire, causing a use-after-free when the iterator accesses nodes.

