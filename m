Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB3F46C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbcLRJcfe/+ope5XqVqJMfku8LV5vV/VmY2tYb7poPU=; b=2+C7UVEvQm3nw6hyMxHozeotgE
	mRGw7DkFdudEv4pETHl8tJHKasM5if8MAmB4U8o+kwmDsi4jtunKfFGGQnvmM4v8QQdlXnL+iKsTA
	IuugZ4FVLLGuIkL6zLhANonQYSC/ECn51ArvsBIjlkPcwLERLqkqxbrCu+SVb87diSSNPNdOR5h28
	boz+nRz8EQ8d2ixgtc12SJ34G3ht2uKuwqHvBhGBldw1I942JJVkNf6TXD171BCNYfK2MfYNol2pP
	kVVCWyTuJ6GxuV0FzkIFrFOWZBceiqnBVeQRa+1GOL47xvFJoUCbyPeqjL/C0AwMCfUzPMKsRzUs5
	QKKYvHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lpj-00000005GRG-377W;
	Mon, 06 Apr 2026 15:25:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lph-00000005GQt-0Gft;
	Mon, 06 Apr 2026 15:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D50DB401A6;
	Mon,  6 Apr 2026 15:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBFEC4CEF7;
	Mon,  6 Apr 2026 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489143;
	bh=+yePk80g3HBJ5qAZcvtjH9PyYcTFDWBiq+ZEyc+7Iig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWu+KzaER67hdPMQSysMNSWFLen+qitWYpvuVBdwyD3zLJzo3yOFhE4008hwYJtWv
	 b9ujJEQQYjUkF3Rqjm5JMvVtfCocdF12+Od+z2YoSLaRitMIf1YJvFEIP5n72ARNnd
	 txp34XhepFVRt1sNY9/r9QePctldmjt5NvCBFUsN0CW5LM48ZqjwyKWEUrymNG2HLH
	 2o8cHHGNOS2sYhVf6GKo0UMH8WMK20EhLUrc7xOZ8XakksPFrn1X4JrJoHu8Gc9cLt
	 l1z+TO4h1UhDGCWj+5LwOLteTlpaiAFFslWvbOU5LUfcRcse1SaqQPBRHn9pe+Z0fd
	 kRadrig3A9tbQ==
From: Simon Horman <horms@kernel.org>
To: lorenzo@kernel.org
Cc: 'Simon Horman' <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	xuegang.lu@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Add dma_rmb() and READ_ONCE() in airoha_qdma_rx_process()
Date: Mon,  6 Apr 2026 16:25:23 +0100
Message-ID: <20260406152523.417779-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-airoha_qdma_rx_process-fix-reordering-v2-1-181e6e23d27b@kernel.org>
References: <20260403-airoha_qdma_rx_process-fix-reordering-v2-1-181e6e23d27b@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_082545_275386_17923253 
X-CRM114-Status: GOOD (  16.19  )
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

From: 'Simon Horman' <horms@kernel.org>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
net: airoha: Add dma_rmb() and READ_ONCE() in airoha_qdma_rx_process()

This commit adds a missing dma_rmb() to ensure DMA read operations are
completed and uses READ_ONCE() to prevent compiler reordering when accessing
descriptor fields.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 95ba99b89428e..f1843bc5b9914 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -612,15 +611,17 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
>  	while (done < budget) {
>  		struct airoha_queue_entry *e = &q->entry[q->tail];
>  		struct airoha_qdma_desc *desc = &q->desc[q->tail];
> -		u32 hash, reason, msg1 = le32_to_cpu(desc->msg1);
> -		struct page *page = virt_to_head_page(e->buf);
> -		u32 desc_ctrl = le32_to_cpu(desc->ctrl);
> +		u32 hash, reason, msg1, desc_ctrl;
>  		struct airoha_gdm_port *port;
>  		int data_len, len, p;
> +		struct page *page;
>  
> +		desc_ctrl = le32_to_cpu(READ_ONCE(desc->ctrl));
>  		if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
>  			break;
[ ... ]
> @@ -633,10 +634,12 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
>  		if (!len || data_len < len)
>  			goto free_frag;

Could this jump lead to an uninitialized pointer dereference?

The initialization of page was removed from the declarations above, so it
is uninitialized at this point.

Later in the function, the error path looks like this:

free_frag:
		if (q->skb) {
			dev_kfree_skb(q->skb);
			q->skb = NULL;
		} else {
			page_pool_put_full_page(q->page_pool, page, true);
		}

If q->skb is NULL, passing the uninitialized page to
page_pool_put_full_page() might cause a crash.

Also, this isn't a bug introduced by this patch, but does this error path
leak the page associated with the current descriptor?

If we hit an error on a scattered fragment while q->skb is not NULL, the
SKB is freed, but the current page (which hasn't been attached to the SKB
yet) bypasses the else branch and isn't returned to the page pool.

>  
> -		p = airoha_qdma_get_gdm_port(eth, desc);
> +		msg1 = le32_to_cpu(READ_ONCE(desc->msg1));
> +		p = airoha_qdma_get_gdm_port(eth, msg1);
>  		if (p < 0 || !eth->ports[p])
>  			goto free_frag;

Similarly, taking this jump leaves page uninitialized before reaching the
error handling path.

>  
> +		page = virt_to_head_page(e->buf);
>  		port = eth->ports[p];
>  		if (!q->skb) { /* first buffer */

