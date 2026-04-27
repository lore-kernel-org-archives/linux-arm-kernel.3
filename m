Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E6BFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5TkgjwxbUuArCO4ICwo8xJ3fv0RVK8UqGSazM8m0Bg=; b=0ZfJ+CbYH0Y71MIQz16X90iyKO
	Sn1NGovg2Xk5wKKi9fgpmAXqKQuCf52SYx76cJv17BpWQH7YGLR+EmYoVzLGw6FIEHI3zyT7HlqS9
	ERa3FK+06hm8oKbLT863uO5aUlrlIxYteim66ykLXBpohdvkuxdt3tfpwsp0QROqPvC8Pe//GCpYs
	Mzv+SDef+RIbnKeJO+FrLqIIdTtrBpAflZLQ5UQryBBn5ZsXjnlN+iNu7CunExJEAYK8o1U21O23c
	tKKNVk92BVfW37nGqfEDka3RSHcvIYIXQ+OPNSwWE4VdM7ejABW7hrcEiVGhD3tqBU+knOqUXgljb
	j2bZsD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHH0N-0000000GQV6-3TzA;
	Mon, 27 Apr 2026 08:07:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHH0J-0000000GQUb-3Jgy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:07:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7413A4E42B13;
	Mon, 27 Apr 2026 08:07:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40F85600D1;
	Mon, 27 Apr 2026 08:07:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2C8D1072227A;
	Mon, 27 Apr 2026 10:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777277256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=V5TkgjwxbUuArCO4ICwo8xJ3fv0RVK8UqGSazM8m0Bg=;
	b=sS2k5mmQAU4Zb7zznUnG859IoZPkdpzVfbBEqSt2jdp3iibOyd685Y3UoWN8fV1P2FA6DF
	RwuoebpIjbLNXLCXAdZYOBwssrqtL3Wo1rvYugVJdkLpqsLU/D5ua1v7PK4RUfTJD1k0JD
	QLzZucGMsbZzapITl7u1LR0NwXlj6BhPXKUb+nknCxQD7381AKuojgb0Fh7ck7UPmKyAoT
	lypZEI24eyFSSzHnH+5SiBlyRK0uFd6pscE/hNu4iwqRRwdb5vOhMneFZTuYzqfcXZaDE3
	tPscWq0H0c3SLSHSn3Fyc8/B5EdtMjlVcEp7zy2BZPKvyzeRcuGs+kco/GMxkA==
Message-ID: <d83c971e-659c-433e-888a-dc1bdffe975e@bootlin.com>
Date: Mon, 27 Apr 2026 10:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: fix RX DMA leak on TX alloc failure
To: dev.taqnialabs@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260425-stmmac-rx-desc-cleanup-v1-1-1a18a704c422@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260425-stmmac-rx-desc-cleanup-v1-1-1a18a704c422@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_010743_990270_563BA383 
X-CRM114-Status: GOOD (  13.18  )
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



On 25/04/2026 14:38, Abid Ali via B4 Relay wrote:
> From: Abid Ali <dev.taqnialabs@gmail.com>
> 
> Free RX DMA resources when alloc_dma_tx_desc_resources() fails in
> alloc_dma_desc_resources().
> 
> Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 13d3cac05..8bb843b55 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2370,8 +2370,12 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
>  		return ret;
>  
>  	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
> +	if (ret) {
> +		free_dma_rx_desc_resources(priv, dma_conf);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;
>  }

This change looks correct, however you're missing a Fixes: tag
indicating when was this issue introduced. You must also indicate what
tree you're targetting (in this case, net) :

Please look here for the process information :

https://docs.kernel.org/process/maintainer-netdev.html

Maxime
>  
>  /**
> 
> ---
> base-commit: 028ef9c96e96197026887c0f092424679298aae8
> change-id: 20260425-stmmac-rx-desc-cleanup-440f05845492
> 
> Best regards,


