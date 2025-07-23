Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axez/drPlFRtg8s8kl9RYutepH8uGY5oXk4jruL3+3s=; b=X04zW9Ue4w3eomzs7H1RCzrcrk
	dALH0FLyiNhBJwvKG5DQzgCniCGwNJKbod6QvQkQI5pGu2/JGy2LEa8P/mdbPwp3PaJXj7sXJHZYH
	KaBuKAPXtSMnjDqlrYwr4bFLqPhWOgq+1jqKzwrTke3DWQuBJXJQD3qvVzT8j5Ir8B1Zpp6LxPRBc
	aZZXrhcLDbqjBdT4fdP+PesAUXx1PjYHjXT0nNqUh4vI1j7EJqSw8Z0H8WJlKHBhhu8xn94adkiOV
	qGV2xOPzHpZ5qDeSr9L/HLL291fxz3obmJSkoUef5FknFc0AT+JPfVIpKh8PJmB0PUFiicFKIMp5w
	Qb5OmA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYNL-00000004tBc-1p2k;
	Wed, 23 Jul 2025 12:15:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYKf-00000004srW-2AOF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:12:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4E5D41913;
	Wed, 23 Jul 2025 12:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515B8C4CEE7;
	Wed, 23 Jul 2025 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753272744;
	bh=DG1NBtHVraXrCvfT0GvO2Zt6YdgH46eGtjzUJCLccQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QttaBP7LzXrtQDNljNclyA1B3pCA62XqtmZ8SrA93OSljgPa0SeW5Q6apYdrARtaK
	 PNFiaKVJth/Ha+kNN5lc12A6wf9OJ2qWGOBeaTAIarGFkt3BCYYa+pOYtaW8cZsbL0
	 jl4E4jydOe40YMT1m03bIiBB6+PBfatRZ1u+79GzVrOJphJXjI9B4T//ywuUFwPGT4
	 oqRBx2baV1phs1R2KNCUi7VhJ86ElNaW06rN7TRy92R5DHP1nuNTyLh7lXid4JUZSX
	 OIyIIMkUwQP+Grq3JOG/5uTuZmZYbCr6vjXKoxoG+nOLjRajBD0d1WW4lNh4CR8nQ0
	 /uHrEg186Vvow==
Date: Wed, 23 Jul 2025 17:42:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ste_dma40: simplify d40_handle_interrupt()
Message-ID: <aIDRpSN0z3Ri1Fkh@vaman>
References: <20250720022129.437094-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720022129.437094-1-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_051225_580864_2E764494 
X-CRM114-Status: GOOD (  17.04  )
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

On 19-07-25, 22:21, Yury Norov wrote:
> From: Yury Norov (NVIDIA) <yury.norov@gmail.com>

What is the meaning of NVIDIA in your name?

Pls add the subsystem name to the patch as well (this and others you
sent)


> 
> Use for_each_set_bit() iterator and drop housekeeping code.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  drivers/dma/ste_dma40.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index d52e1685aed5..6cc76f935c7c 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1664,7 +1664,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  	int i;
>  	u32 idx;
>  	u32 row;
> -	long chan = -1;
> +	long chan;
>  	struct d40_chan *d40c;
>  	struct d40_base *base = data;
>  	u32 *regs = base->regs_interrupt;
> @@ -1677,15 +1677,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  	for (i = 0; i < il_size; i++)
>  		regs[i] = readl(base->virtbase + il[i].src);
>  
> -	for (;;) {
> -
> -		chan = find_next_bit((unsigned long *)regs,
> -				     BITS_PER_LONG * il_size, chan + 1);
> -
> -		/* No more set bits found? */
> -		if (chan == BITS_PER_LONG * il_size)
> -			break;
> -
> +	for_each_set_bit(chan, (unsigned long *)regs, BITS_PER_LONG * il_size) {
>  		row = chan / BITS_PER_LONG;
>  		idx = chan & (BITS_PER_LONG - 1);
>  
> -- 
> 2.43.0

-- 
~Vinod

