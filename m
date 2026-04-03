Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED1EE88D6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhbFZCDZmxv7fECgEQ8sY8Xbb1cxAsjfdjH6IeTihN0=; b=hvjLTv9362IkaBqS4wGEjZzYsg
	eNikxwE1YQ3xTpZMcg5kHyAw6LS4SF6YOEUtC6vtQse+WBhjnoBKMR/OORbJkkUpnc6oE0fJ2u0Y7
	AsoNkEH1d9GPbuFM2zMJryOFZDgMriLzv7iSLPq+Xd8bAfhJqEPrsmBKrSFxF7e94Rgg1r1GhioOF
	XTknyKJRsITnLGBxMavk6WMvJBhhCLNlHMfPIWnFkMGbsm/TegtytmcwMt/xcFhzraOJTul1Cgc60
	wuWcNnXG6z/U8s/BF15SyaLNxIVZEQQw8IzJ5Z+nnH0S7la5uUlTuhoS3bRdweufNJUMisVDsVXkR
	Gv96jGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8mHu-00000002fNp-2b9G;
	Fri, 03 Apr 2026 21:42:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8mHt-00000002fNb-00xz;
	Fri, 03 Apr 2026 21:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C41360008;
	Fri,  3 Apr 2026 21:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E667DC4CEF7;
	Fri,  3 Apr 2026 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775252563;
	bh=bdj8RXu3qgyKpumk5HWckExHJL+wZZpu0L3xUEHMOvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLIXmbTJFOvMHgvmx+IsIiO/p5g2tHkt75ezUxbSbPXEq1I0iflD+reTNHwPbyhnI
	 7/LHdfxoz7QUStvGpRbfPj5izApbuatl2sDSlXuW6XWVOpdnWC/ov4sw1sQ1TyC4Ks
	 EV/b3+NA8+14EvEA29s+Q1n5/Yub5iKu2W+vZwqJBuCO3Vq1QSHDf9u9RBmD3z0gUj
	 /6EdwmvLhdCi5Tc59ENYFSBH1+nzq52VBCmCSViLW49kXcGfduqaZVBfL4OrEMLa8/
	 3HIXzozEmPLifBHuKQ62QiOf/dBv0OHx0VbrsgdaV8j6dKlHhYGM5PyhAV7uJEr/LY
	 7XjcuwFxC1tNw==
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
Subject: Re: [PATCH net] net: airoha: Fix memory leak in airoha_qdma_rx_process()
Date: Fri,  3 Apr 2026 14:42:24 -0700
Message-ID: <20260403214223.2230561-2-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
References: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
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
email says: "more thing to fix.."
---
net: airoha: Fix memory leak in airoha_qdma_rx_process()

This commit fixes a memory leak in the error path of
airoha_qdma_rx_process() by partially reverting a previous commit and
always calling page_pool_put_full_page().

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 95ba99b89428e..91cb63a32d990 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -697,9 +697,8 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)

This problem wasn't introduced by this patch, but while reviewing this
function I noticed the descriptor field msg1 is read from memory before
the ownership bit is validated:

airoha_qdma_rx_process() {
        while (done < budget) {
                struct airoha_queue_entry *e = &q->entry[q->tail];
                struct airoha_qdma_desc *desc = &q->desc[q->tail];
                u32 hash, reason, msg1 = le32_to_cpu(desc->msg1);
                struct page *page = virt_to_head_page(e->buf);
                u32 desc_ctrl = le32_to_cpu(desc->ctrl);

                if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
                        break;

Could this lead to processing stale descriptor metadata? On weakly-ordered
architectures, the CPU might reorder these reads before the device commits
the new descriptor data. 

Are we missing a dma_rmb() after the ownership check?

>  		if (q->skb) {
>  			dev_kfree_skb(q->skb);
>  			q->skb = NULL;
> -		} else {
> -			page_pool_put_full_page(q->page_pool, page, true);
>  		}

This is also an existing issue, but does jumping to this error path on a
scattered packet fragment leave the receive loop in an inconsistent state?

If an error occurs while processing a middle fragment of a packet, q->skb
is freed and set to NULL here. However, the loop continues to the next
descriptor.

Since q->skb is now NULL, won't the next fragment of the same corrupted
packet be erroneously parsed as the start of a brand new Ethernet frame:

                if (!q->skb) { /* first buffer */
                        q->skb = napi_build_skb(e->buf, q->buf_size);

Could this desynchronization allow arbitrary payload to be injected into
the network stack as a legitimate packet? The driver may need to discard
all subsequent fragments until a descriptor without QDMA_DESC_MORE_MASK is
encountered.

> +		page_pool_put_full_page(q->page_pool, page, true);
>  	}
>  	airoha_qdma_fill_rx_queue(q);
>

