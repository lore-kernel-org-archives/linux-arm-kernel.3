Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEAFCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUjlDITwgIpNwCirPf+bfrj39gBqgvxMYJg+4zIGTVE=; b=iqqd3YgCDD/tTQwSJLXHoP+PQt
	vS1KSZarYC2/MsC+s9A/N6NbgL32kdmrwh31EWUbFbeCWmn9LqvJvaKdPvVZ4BwV2pP0Y2w5Qm4Yi
	1yLuoUDfg8Xjy4d+Tzy2UDBf7WE1bx3PVyd2D2255HCcoQjNHjvMkFv2tVCxsjEQHcBtuTs48nKe4
	xa4exNOTzZfAS6wGCxo7ozluZGSzeCDhNwXG489VWiavcDUo2EmOJE+ZxLzJu7fAYN/eaDywrU8ct
	Q+UH7ZEqJIIDBB5EA0RmYY42exl6xXcNMKJCFGXm5riLSr3pRN8hfLSaKa6d2EQ2uf4g+Y310R+pj
	G8IInj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTI9-0000000CuJk-1j7H;
	Wed, 05 Nov 2025 02:30:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTI6-0000000CuJF-2EA5;
	Wed, 05 Nov 2025 02:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9420432AD;
	Wed,  5 Nov 2025 02:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4DAC4CEF7;
	Wed,  5 Nov 2025 02:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762309829;
	bh=bQOzSQvNbzdGQPklRvcil44cM6pFiQzeZeHosNNfvcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nIvtc6LqIfLFYinQoIaHxlMUrq8wPRdx01P+TKN4gYUGSLW/63TYX+e1xwo52U44+
	 dfDNz5kEdgoKvfbPeDFsLGJfiVjvr4QXhnHgz0D/TWQ+CiCA+kf/OErQwYiwS+PL/w
	 ntLGWbf85n86vjKO6dfEwfO3Z6zVKuIrRPPLbxBh3jxjKrpc6N1UGes8yhdGA5FJjd
	 tP0CdqbnSXckVsOT1rN7WSEvcOLdm1eWAOfmFtx+2AdJVE0tGqIqZpjYlwSbsjzZZR
	 btMyNcbUdCJ0QCoPOvS5UMb3/k1ntcUOfO4CvPmXlLd8DUZWuHNDq1wnpjdXmQHhJf
	 EDFzEMuK4MICw==
Date: Tue, 4 Nov 2025 18:30:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Xuegang Lu
 <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next 1/2] net: airoha: Add the capability to consume
 out-of-order DMA tx descriptors
Message-ID: <20251104183028.7412aba6@kernel.org>
In-Reply-To: <20251103-airoha-tx-linked-list-v1-1-baa07982cc30@kernel.org>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
	<20251103-airoha-tx-linked-list-v1-1-baa07982cc30@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_183030_619098_21FA5E2B 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Mon, 03 Nov 2025 11:27:55 +0100 Lorenzo Bianconi wrote:
> +		__list_del_entry(&e->list);
> +		list_add_tail(&e->list, &tx_list);

list_move_tail()

> +		e->skb = i ? NULL : skb;
> +		e->dma_addr = addr;
> +		e->dma_len = len;
> +
> +		e = list_first_entry(&q->tx_list, struct airoha_queue_entry,
> +				     list);
> +		index = e - q->entry;
>  
>  		val = FIELD_PREP(QDMA_DESC_LEN_MASK, len);
>  		if (i < nr_frags - 1)

> @@ -2029,10 +2020,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
>  	return NETDEV_TX_OK;
>  
>  error_unmap:
> -	for (i--; i >= 0; i--) {
> -		index = (q->head + i) % q->ndesc;
> -		dma_unmap_single(dev->dev.parent, q->entry[index].dma_addr,
> -				 q->entry[index].dma_len, DMA_TO_DEVICE);
> +	while (!list_empty(&tx_list)) {
> +		e = list_first_entry(&tx_list, struct airoha_queue_entry,
> +				     list);
> +		__list_del_entry(&e->list);
> +		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
> +				 DMA_TO_DEVICE);
> +		e->dma_addr = 0;
> +		list_add_tail(&e->list, &q->tx_list);

and here

