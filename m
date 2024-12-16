Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1925FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAQx7I2rgSQ3JCNbN5UHIptWn4yYtksCAud/SmWjvj4=; b=c8iuOJXHPzg8mnZYjqx2w6KvnT
	Xmj3bMDFQig9ZUgJQ9ydlQv18fAmalO50fd14r9to+5S604GTwwig5kinJ3LWNrLcZyjsHDyUwkuz
	FSgLERXdbi4rUaTbvo6hvAq5vq+oRZSgIdo7oYlKbR+SbqWrxdISlQF3zMK5BhF1Mv1dkAVPQB59m
	kv0L08WQu1SD3QF7pepxY38n1oRZdLX4YLTsyoNNWos4iVo7jrubzoEKFJ2AmuERduwuqalhbzbuf
	d5QBbw7wNk8Z+6W2nrxd7KO8OKKvqZ4y4btlpUSmZLoAke85fAuri0yfhbanBzzGjf/EZrazCssn8
	pD0NZBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN5Oi-00000009GKz-2x3E;
	Mon, 16 Dec 2024 07:20:08 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN5Nd-00000009GAr-0GmY;
	Mon, 16 Dec 2024 07:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734333540; x=1765869540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B/tur1yDRhI3VM5DW8SthX7SrdrUxSR+1BZUyF4vNVo=;
  b=d8pmFYzDzClqTKjb0Zp/Lycj0W66fwSNbT720t5wWX9yplledQm6DY7J
   ileEHMc6R6F7tI0jZThCm/95XBCURcPom0CaGMNEFTuVHyJi24Uus/uJT
   kapzND0DoZcilNkqQwjy3aAIUkQW0Xtz4sGfmgWMstzfUNdK6z66oSX4e
   XZWp5iUu9SeFZn48JuNKjVOwKv4lofZlvg1VGy+R9MKmSOQWQjjntILna
   gHZVI5+7sahVmsvx+NmehhkSayhQA/C6223JhTPJz9yMpxPTz6sm/116k
   PlvRIylEAVcKcoSZ7xBQptN0XbXoeLw7ceZp3yigkvImNPdZB/pFfEuNg
   g==;
X-CSE-ConnectionGUID: n1cMoWkTSfuA516RRoz8QA==
X-CSE-MsgGUID: bRRJ9D4vRJG1rqhOTFfPcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38634186"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38634186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:18:50 -0800
X-CSE-ConnectionGUID: ilnka3aKQXKw1mue8TxNVg==
X-CSE-MsgGUID: 5zZfyqJdQ2WJrAy7tOosFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97543225"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:18:48 -0800
Date: Mon, 16 Dec 2024 08:15:42 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix error patch in airoha_probe()
Message-ID: <Z1/Tng80hii4dBQU@mev-dev.igk.intel.com>
References: <20241215-airoha_probe-error-path-fix-v1-1-dd299122d343@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215-airoha_probe-error-path-fix-v1-1-dd299122d343@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_231901_364878_19876F5E 
X-CRM114-Status: GOOD (  18.95  )
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

On Sun, Dec 15, 2024 at 06:36:35PM +0100, Lorenzo Bianconi wrote:
> Do not run napi_disable if airoha_hw_init() fails since Tx/Rx napi
> has not been started yet. In order to fix the issue, introduce
> airoha_qdma_disable_napi routine and remove napi_disable in
> airoha_hw_cleanup().
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 33 ++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
> index 6c683a12d5aa52dd9d966df123509075a989c0b3..5bbf5fee2802135ff6083233d0bda78f2ba5606a 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -2138,17 +2138,14 @@ static void airoha_hw_cleanup(struct airoha_qdma *qdma)
>  		if (!qdma->q_rx[i].ndesc)
>  			continue;
>  
> -		napi_disable(&qdma->q_rx[i].napi);
>  		netif_napi_del(&qdma->q_rx[i].napi);
>  		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
>  		if (qdma->q_rx[i].page_pool)
>  			page_pool_destroy(qdma->q_rx[i].page_pool);
>  	}
>  
> -	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++) {
> -		napi_disable(&qdma->q_tx_irq[i].napi);
> +	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
>  		netif_napi_del(&qdma->q_tx_irq[i].napi);
> -	}
>  
>  	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
>  		if (!qdma->q_tx[i].ndesc)
> @@ -2173,6 +2170,21 @@ static void airoha_qdma_start_napi(struct airoha_qdma *qdma)
>  	}
>  }
>  
> +static void airoha_qdma_disable_napi(struct airoha_qdma *qdma)
Nit: similar function for enabling napi is named airoha_qdma_start_napi()
maybe stop here or enable there to be consistent.

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

Thanks

> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
> +		napi_disable(&qdma->q_tx_irq[i].napi);
> +
> +	for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
> +		if (!qdma->q_rx[i].ndesc)
> +			continue;
> +
> +		napi_disable(&qdma->q_rx[i].napi);
> +	}
> +}
> +

[...]

