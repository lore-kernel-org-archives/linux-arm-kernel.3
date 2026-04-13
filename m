Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025F9F531DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CggsGn6QMsEBufE1DlAnoRc5ZxsulsN4ccCKXX9TEWc=; b=Fj8hpGLKkLtg6WMkY6dtcQ2Zwd
	BXlt93QRwzjhGC8FfNsocMZqYwlaRYOMc7o8h+VFsEwfcXQe4VGCI8vE/FQdB3T5f0/jPumLCx/I6
	FYcCOd0co6YuJzy2yBftskhcniw3IUPEN1lSxD/pvg/55TF6gTb2oelNrjJbxPAKmHkMdQMBCEU1a
	pIwiAR99ibxac5f6RN4OYPIykHkW9F9CDB6hFDxElel04zfSIm7lbB0rzaP0Z/U6WkSl7zqBW9Ot+
	8mRUxkcsPR0PiK/nFlKm1kF0Z+98PI/K8KImUwOa/clLPhEE5NMNPapEBQ1sLeCQ95nwUY5W28K4o
	kWY5jWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCQDT-0000000GSlE-1Cut;
	Mon, 13 Apr 2026 22:57:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCQDR-0000000GSl4-0DYC;
	Mon, 13 Apr 2026 22:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 206D761338;
	Mon, 13 Apr 2026 22:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A729C2BCAF;
	Mon, 13 Apr 2026 22:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776121031;
	bh=5lT5VGCSztp5RHHAfbUGBi5lH094ZC7FcPVmm6uwpds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arl2BT6yZiJTpZwPUCeVbRRMKP+NidZwRNmQ2AlGT48QeXXkxN0Yw5MeJOwzMShK3
	 l7AZfMBEOlioQTR0cDcv4I/JVBrGdjiwLxx66vH8rPoDFuMWXXha8EbQRFnBvoYqHi
	 DsNPogFzWDwW/9yQj5keuIFnU4nP8uNtNJYV0L5aNbcoaopcjx0V6jfr+q2acfHV2k
	 XnvFqYHgRbYobHy2UG6MoxPkSk2ElXQzVpQOCIi+HdYAlYauMvHRALxeqaeNKgI+IM
	 O4RJz08yayli3h8Tymk7BI7/qMu5hR6PTR7BhAJvHdwPLBqhXp5/nGmSMmYv/IWqZ5
	 vJ7abtUUykARA==
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()
Date: Mon, 13 Apr 2026 15:57:09 -0700
Message-ID: <20260413225709.3648413-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org>
References: <20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org>
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
---
net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()

This commit resets DMA TX descriptors in airoha_qdma_cleanup_tx_queue
and synchronizes TX_DMA_IDX to TX_CPU_IDX to notify the hardware that
the ring is empty.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 9285a68f435fe..963ab7b8d166b 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1044,13 +1044,17 @@ static int airoha_qdma_init_tx(struct airoha_qdma *qdma)
[ ... ]
>  	spin_lock_bh(&q->lock);
>  	for (i = 0; i < q->ndesc; i++) {
> -		struct airoha_queue_entry *e = &q->entry[i];
> +		struct airoha_qdma_desc *desc = &q->desc[i];
>  
> +		e = &q->entry[i];

Can this result in a NULL pointer dereference?

If airoha_qdma_init_tx_queue() sets q->ndesc before allocating q->entry and
q->desc, and devm_kzalloc() fails, the error path jumps to
airoha_hw_cleanup().

Because q->ndesc > 0, this cleanup loop would execute and dereference
q->entry[i] and q->desc[i], which may not have been allocated.

[ ... ]
> +		/* Reset DMA descriptor */
> +		WRITE_ONCE(desc->ctrl, 0);
> +		WRITE_ONCE(desc->addr, 0);
> +		WRITE_ONCE(desc->data, 0);
> +		WRITE_ONCE(desc->msg0, 0);
> +		WRITE_ONCE(desc->msg1, 0);
> +		WRITE_ONCE(desc->msg2, 0);

Is it safe to modify these DMA descriptors and reset the ring indices below
without waiting for the hardware DMA engine to become idle?

In airoha_dev_stop(), the driver clears GLOBAL_CFG_TX_DMA_EN_MASK to request
the hardware DMA engine to stop, but it does not appear to poll
GLOBAL_CFG_TX_DMA_BUSY_MASK to ensure it has actually stopped.

Modifying the DMA descriptors and internal ring indices while the hardware
is still actively processing in-flight descriptors could potentially lead
to corrupted DMA fetches or IOMMU faults.

>  		q->queued--;
>  	}
> +
> +	e = list_first_entry(&q->tx_list, struct airoha_queue_entry,
> +			     list);
> +	index = e - q->entry;
> +	/* Set TX_DMA_IDX to TX_CPU_IDX to notify the hw the QDMA TX ring is
> +	 * empty.
> +	 */
> +	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid), TX_RING_CPU_IDX_MASK,
> +			FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
> +	airoha_qdma_rmw(qdma, REG_TX_DMA_IDX(qid), TX_RING_DMA_IDX_MASK,
> +			FIELD_PREP(TX_RING_DMA_IDX_MASK, index));

Could list_first_entry() be called on an empty list here?

If q->tx_list is empty (for example, if allocation failed in
airoha_qdma_init_tx_queue or if no entries had a valid dma_addr), calling
list_first_entry() returns an invalid pointer.

The subsequent pointer arithmetic would produce a garbage index value,
which is then written to the REG_TX_CPU_IDX and REG_TX_DMA_IDX registers.
-- 
pw-bot: cr

