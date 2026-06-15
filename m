Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DDACD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12xCYe4ieqhwExskYGWu30pRBE8o996AZrPppTl9ixc=; b=dje8aFuhXuQcupr7F1+0lpWM7j
	nvxiCs7zHzgUAlzREvg+E4lZJm0ua5aZdDK8QRF+6rIkrGBqO7sNptsUTkqw6LEfCo8CEbWTzLhfh
	UMRYKcqq6BIBz0eiHki19X09kKcX2pUagJhr/f8MOXOnJulsah3xol26RhDoTX41tUnMYxUNrfxbq
	RcOaGCiyphHiIXULAhV+zIvb0tDbcEE2dXyQkAwP7j9QDDTIi93/PATn3Nzbtqlw5WBRvBc72yHYP
	p/YiwftxtsFf6SrPny3y3ZzuRRLTRHWh64NH+A940Ies4kIgyE8pLdJmZcPKyZdirgvs0czB8imZ4
	Izlhn/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGd0-0000000Ew9K-2zJH;
	Mon, 15 Jun 2026 23:22:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGcy-0000000Ew9E-2tLd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:22:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1D9D432EB;
	Mon, 15 Jun 2026 23:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99DB1F000E9;
	Mon, 15 Jun 2026 23:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781565719;
	bh=12xCYe4ieqhwExskYGWu30pRBE8o996AZrPppTl9ixc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M5u3AMZs/zrNeptcKR/L1LwbH8tGYHQ7LuESwqK2Zr+LXrbIfZvIJUwqYeFNiebGX
	 iFfbLnHb1CUU+oOQIcC08SZRM3Y9YxTPje6vwwuFrMJJNkKBiIyiLJxjVbg3IS2Wl6
	 Y2hBNkowlbIneF8BmmkzejNkJFiKFRNkm0lKT9Mjihmk404AWG6/vrrowxXUwhmI94
	 ERma0k0Hlt8qKKgxQ6hrBQJ8UxAR7pJQ+BlqTaa269l1+oKyzsMRD3IKen+Gr8k4Tu
	 tX43ewxQ533ID9F63RyPZJCJ/nykt11otHxSU1mOFk2tQgga7r/3O9JAA1nYxeQpZ+
	 XU7M8epez5D/A==
Date: Mon, 15 Jun 2026 16:21:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
 <vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
 <jacob.e.keller@intel.com>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net 4/4] net: ti: icssg: Fix XSK zero copy TX during
 application wakeup
Message-ID: <20260615162157.3748bcda@kernel.org>
In-Reply-To: <20260611185744.2498070-5-m-malladi@ti.com>
References: <20260611185744.2498070-1-m-malladi@ti.com>
	<20260611185744.2498070-5-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 12 Jun 2026 00:27:44 +0530 Meghana Malladi wrote:
> @@ -169,9 +169,6 @@ static int emac_xsk_xmit_zc(struct prueth_emac *emac,
>  
>  		num_tx++;
>  	}
> -
> -	xsk_tx_release(tx_chn->xsk_pool);
> -	return num_tx;

Why are you deleting this?

>  }
>  
>  void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
> @@ -279,9 +276,6 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  		num_tx++;
>  	}
>  
> -	if (!num_tx)
> -		return 0;

Does something prevent us from running all this code if budget is 0?
If budget is 0 we can complete normal Tx with skbs but we must
not touch any AF-XDP related state.

>  	netif_txq = netdev_get_tx_queue(ndev, chn);
>  	netdev_tx_completed_queue(netif_txq, num_tx, total_bytes);
>  
> @@ -306,7 +300,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  
>  		netif_txq = netdev_get_tx_queue(ndev, chn);
>  		txq_trans_cond_update(netif_txq);

This looks misplaced, now we will hit it even if we didn't complete 
or submit any Tx.

> +		__netif_tx_lock(netif_txq, smp_processor_id());
>  		emac_xsk_xmit_zc(emac, chn);
> +		__netif_tx_unlock(netif_txq);
>  	}

