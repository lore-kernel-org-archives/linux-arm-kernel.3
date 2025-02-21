Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B784C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkBZbRCYoKDPKIOL0aJVf8p6jtQHhfsXXG2i8URHKe4=; b=fiszdzo/m6EhGlCOu2XLYiD5gz
	Iojdu2P3qHMyFPeRQ85xrKgZIaXYxKldggbXNOmFSN6faPspwNFECMLj3F0q1KNAi3nQ5PkI4/I6j
	r5bjFHOaJY3f75Zh5Amub2J9UpOxNvGnVUCsE1PSYeFd7Rb39bPWX6ULsQsElTxkF/Tx2LK38bKZT
	8JWABlLnCz+ZEKHop1OHBvKekHjVI5uGfhUPgNEquJ7VSpFUI1ODPv6L4INfKTw5Gq8c0dP9M17lb
	cR9J9iCaaj+EENh62tnxOThXTVzrCuWgYx6/CsqLz3ymhW0or/T/CjgOWXTuvrxAmpD4z7nfSEaku
	V87YrjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlI2J-00000003jJq-3s6e;
	Fri, 21 Feb 2025 01:41:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlI0n-00000003ix9-3ZNM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:39:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0241BA8;
	Thu, 20 Feb 2025 17:39:47 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BEF83F59E;
	Thu, 20 Feb 2025 17:39:27 -0800 (PST)
Date: Fri, 21 Feb 2025 01:37:21 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, David Laight
 <david.laight.linux@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: clean up rate counting
Message-ID: <20250221013721.32468f6c@minigeek.lan>
In-Reply-To: <20250203112930.650813-1-abelova@astralinux.ru>
References: <20250203112930.650813-1-abelova@astralinux.ru>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_173929_984177_26FB0ABC 
X-CRM114-Status: GOOD (  24.01  )
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

On Mon,  3 Feb 2025 14:29:28 +0300
Anastasia Belova <abelova@astralinux.ru> wrote:

Hi,

> If n = 255, the result of multiplication of n and 24000000
> may not fit int type. Swap division and shift with multiplication.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

I guess this is effectively a v2 of this patch?
https://lore.kernel.org/linux-sunxi/20250120084719.63116-1-abelova@astralinux.ru/T/#u

In this case, and for the records, I'd like to repeat some comments of
mine from this former patch, about this being mostly irrelevant:
- PLL4 is PLL_PERIPH0, which is meant to be fixed to 960MHz. Linux
  would not change this frequency.
- the Allwinner A80 is both old and quite rare/obscure: the most
  prominent board (Cubieboard4) was broken for a while and nobody
  noticed
- this "allwinner,sun9i-a80-pll4-clk" clock is not used by any DT
  in the kernel, so it's effectively dead code

So do we really need this change? Or asked another way: What does this
patch fix, exactly?

Some comments still, regardless:

> Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/clk/sunxi/clk-sun9i-core.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> index d93c7a53c6c0..639c83ed63b8 100644
> --- a/drivers/clk/sunxi/clk-sun9i-core.c
> +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> @@ -25,12 +25,12 @@
>  
>  static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  {
> -	int n;
> -	int m = 1;
> -	int p = 1;
> +	unsigned int n;
> +	unsigned int m = 1;
> +	unsigned int p = 1;
>  
>  	/* Normalize value to a 6 MHz multiple (24 MHz / 4) */
> -	n = DIV_ROUND_UP(req->rate, 6000000);
> +	n = DIV_ROUND_UP(req->rate, 6000000ul);

What would the "unsigned long" change here? This is 32-bit code, so int
and long are the same size. And regardless, how does changing the
divisor type help anyway?

>  
>  	/* If n is too large switch to steps of 12 MHz */
>  	if (n > 255) {
> @@ -50,7 +50,11 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  	else if (n < 12)
>  		n = 12;
>  
> -	req->rate = ((24000000 * n) >> p) / (m + 1);
> +	/* Division and shift should be done before multiplication to
> +	 * avoid overflow. The result will be correct because '>> p' and
> +	 * '/ (m + 1)' are both just conditional 'divide by 2'
> +	 */
> +	req->rate = ((24000000ul >> p) / (m + 1)) * n;

This looks OKish, since indeed the divisors are just 1 or 2, so we
don't lose any precision here. But again: what is "ul" supposed to fix?

Also the comment reads slightly wrong to me: Normally division
and shift _should_ be done *after* multiplication to avoid loss of
precision. The comment here should state that we _can_ do it the other
way around here, since the divisors are small and divide the dividend
"cleanly".

Cheers,
Andre


>  	req->n = n;
>  	req->m = m;
>  	req->p = p;


