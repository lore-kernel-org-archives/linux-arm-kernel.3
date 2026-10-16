Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D1FCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blwq1pXBCQjTGMl+JWvwWp+PQ7nHppX+egLYS89xJeg=; b=iyIViTAR84DjNorPTtyveqeKWt
	9OGMqECah1uefAqW/Yqth4eU4pLDFdOBZKgUxmnAgW+fWXKX5pplLAEPzJG7WDUp87lQpkW3ReW9E
	hMgYj+C+nq4fK34MLa5X6hOo/psQ9C6AqZA8u32bwrLHJb710g+eC6s0j0ReECbngRCbhWwXFatKg
	h9NI6i6vLyJmLPIgxdHU8f40gSMkDvLZiMxFVOMa2aZpGZpLpbqh9ZTbViW34KqJ2bhXZErptKrXo
	3cneQKR+lnwSeXviaQ+O3vaH6gIItmECc8llVlBBBEuBZMtsTPZVXnBdWN2kYfFD0SXVQU1sDPeEA
	h+zLyR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigk-000000036mh-2QSu;
	Fri, 16 Oct 2026 14:13:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigh-000000036m1-0Ud0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:13:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F35301A1255;
	Fri, 16 Oct 2026 14:13:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8F06075D;
	Fri, 16 Oct 2026 14:13:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4AF1103281F4;
	Fri, 16 Oct 2026 16:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792160010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=blwq1pXBCQjTGMl+JWvwWp+PQ7nHppX+egLYS89xJeg=;
	b=JFRXNfY/cQ7P5wBnYY3ft07I0gMR2s634u1n99dDArTUzg20EF9olCxy8ILqkbo0repWYr
	i+RrkZdPbVFBgH55Aqc1KO+IXoxfihLwqJsuAYnJ86Xjor29wt8YmkhHh4DjIdxTIQq3lL
	uLQBczkD04IIx3RGgqLe0Jogt5UcIlwv2LTduSz15I27CbTwUNkNOqBlH2M9NgFAvD2z1B
	ig27IjqWg5Wp8kzHYklPqM5rW4wvVPq6QFNJnSf6PBQV7tPHgdXy3JuAPbyoRt1xqt85Mq
	f7JsigUmSzMK3tcvmm4b93soNc46q7k2pfSvC/zMV0DTgz1MlnKzLOVXsA3JOg==
Message-ID: <84af909c-a94e-4408-a24d-d3fd729cd90e@bootlin.com>
Date: Fri, 16 Oct 2026 16:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: stmmac: fix XDP TX DMA address for
 compound RX pages
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071335_299972_5455FDCE 
X-CRM114-Status: GOOD (  18.80  )
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

Hi Lorenzo,

On 10/12/26 17:24, Lorenzo Bianconi wrote:
> When RX buffers are compound pages (order > 0), only the head page
> carries the DMA address programmed by the page pool
> (page_pool_get_dma_addr()). stmmac_xdp_xmit_xdpf() computed the head
> buffer's bus address from the page that happens to contain the data:
> 
> 	page = frag ? skb_frag_page(frag)
> 		    : virt_to_page(xdpf->data);
> 	dma_addr = page_pool_get_dma_addr(page);
> 	...
> 
> RX pages become compound as soon as dma_buf_sz needs more than one page
> (pp_params.order = order_base_2(num_pages) > 0), which happens from an
> MTU around 3000 bytes once dma_buf_sz reaches 4096. If an XDP program
> moves the data forward with bpf_xdp_adjust_head() by more than about a
> page, xdpf->data points into a tail page whose struct page has no DMA
> address: page_pool_get_dma_addr() then returns a bogus bus address, and
> dma_sync_single_for_device() together with the TX descriptor transmit
> from the wrong location.
> 
> Use virt_to_head_page() to read the DMA base of the buffer and keep the
> offset relative to the head page (sizeof(*xdpf) + xdpf->headroom), which
> is correct no matter which page the data ends up in.
> 
> Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b8b4de4c5b1a..ca61ab449e32 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5301,7 +5301,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  			struct page *page;
>  
>  			page = frag ? skb_frag_page(frag)
> -				    : virt_to_page(xdpf->data);
> +				    : virt_to_head_page(xdpf->data);
>  			dma_addr = page_pool_get_dma_addr(page);
>  			if (frag)
>  				dma_addr += skb_frag_off(frag);
> 


