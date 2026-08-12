Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE8C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeggauZLbTa0cVLjmlSBBSu9Yw/mpHbQH4f9jbYHQLU=; b=osStEPkzVlhwv49aurlgQU62LJ
	EAzEPMgLlP0CpgA450mhRanFzJ5vJi21LpD2VTCZeovOCJCbOnjNdCg6GebzA/V8jkatuZXncm9C8
	BD1K0f+FO8O07bLKHhDTsWblfrI9Lv2ysHjpd4xe5IBEA7qZY1bGA4e2KXVpFtTm2yx2m/HYmBt7w
	qvt11d1aijKwWO0AtviTGl6TjuwkNt1Eb/qYaqn4XyOBgUWN+F/po2UbJzxegsEY7BYQMAe74eGBh
	xRLdliUeNlWtygAslPoNs5ZLoOlcmMlos1boGkMgPRrHP3NxzXLL8sL73LPhO+1YqJVDkCBGg5Zjn
	2XrlzFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3JL-0000000FZOJ-0sBS;
	Wed, 12 Aug 2026 07:23:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3JH-0000000FZNO-3UcH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:23:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CEA241A15AD;
	Wed, 12 Aug 2026 07:23:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0E796045E;
	Wed, 12 Aug 2026 07:23:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28CC511C4C898;
	Wed, 12 Aug 2026 09:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786519406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OeggauZLbTa0cVLjmlSBBSu9Yw/mpHbQH4f9jbYHQLU=;
	b=qUlFyI6nSPc/fwqX33WHWVNbtlqGMROCfBplHaqgW+ysj2dvvGQ5cj0JcS3kteMbo3XCkq
	6SKNHG+OGiXP8pRTqYOE9FKOR4TzBa5zHUUNO3HB1BM7v7IB9C3+voRA8FfnP0TGriguvJ
	KQO7iHidOkBidpmRUDsmeMBBdkRW8b/ucyVsxjLDfGS+m89bNCf0AaINLC4hl9YzS9cwn4
	UNpbbyivbO3fBNiaX8ws3F532qvJUwHWbURY5CHdtcZc4l3oA505dsKyLrhrvlbkYu92yr
	wzonAP8xsfV8erQPA3A332JvA3U+NpNsNtKoShLD3ZsmnWx9OHS9U4AeMrdhTA==
Message-ID: <65494f6d-50fe-4bdb-98d9-7150d9a4fc91@bootlin.com>
Date: Wed, 12 Aug 2026 09:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: use dma_addr_t for DMA addresses
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260811192703.1765416-1-elder@riscstar.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260811192703.1765416-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_002336_062643_228B330A 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Alex,

On 8/11/26 21:27, Alex Elder wrote:
> In jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c"),
> an unsigned integer local variable is used to hold the value returned
> by dma_map_single().  On systems where a dma_addr_t is 64 bits, the
> subsequent dma_mapping_error() check of the returned value operates
> only on the low 32 bits (whose high bit won't be sign-extended).  In
> this case, dma_mapping_error() would return 0 (no error) even if there
> were one.
> 
> Fix this in both spots by using a dma_addr_t for the local variable.

Thanks :)

I was wondering if it would silently hides another address size related
issue a little bit lower, as we now have :

  dma_addr_t des2;

  des2 = dma_map_single(...);

  desc->des2 = cpu_to_le32(des2);

desc->des2 is __le32, so for 64 bit addresses we silently truncate the
address.

However I don't see how jumbo would work on 64-bits anyways as des3 is the next
chunk of the jumbo frame...

I think this is good as-is, so

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/linux-devicetree/20260606010122.21A211F00899@smtp.kernel.org/
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 3 ++-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> index fc04a23342cfc..ec25193d287bb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> @@ -20,9 +20,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	unsigned int nopaged_len = skb_headlen(skb);
>  	struct stmmac_priv *priv = tx_q->priv_data;
>  	unsigned int entry = tx_q->cur_tx;
> -	unsigned int bmax, buf_len, des2;
> +	unsigned int bmax, buf_len;
>  	unsigned int i = 1, len;
>  	struct dma_desc *desc;
> +	dma_addr_t des2;
>  
>  	desc = tx_q->dma_tx + entry;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> index 78fc6aa5bbe95..664d8cfb58cdc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> @@ -20,8 +20,9 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	unsigned int nopaged_len = skb_headlen(skb);
>  	struct stmmac_priv *priv = tx_q->priv_data;
>  	unsigned int entry = tx_q->cur_tx;
> -	unsigned int bmax, len, des2;
> +	unsigned int bmax, len;
>  	struct dma_desc *desc;
> +	dma_addr_t des2;
>  
>  	if (priv->extend_desc)
>  		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
> 
> base-commit: 31397cf1819210bd63fa3d2c7d8c24f7c8667d99


