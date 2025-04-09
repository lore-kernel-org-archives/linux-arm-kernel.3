Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1187C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCjeZMqKJxtiBc4rJcXjoO7Y+O15qi+77d8VNLPqbAU=; b=FBfLP0xDWFHWT4HKisi1V54YjJ
	VXXMETpkFuTNetwRMrUbogy9YfTciPh4LFon9prhgLlM0fyULNqcPZ6UwKhtZoJ82CgVJkKREAHtS
	uDGNelN7q1fWCyY/JHrwRvr7nJue8cKX8SWw1cUyP3JXiFSRUM8J5AlyMP2I/3RweO0mO7ffNgZmv
	N63PZ5VKSRwc3wXnlZyjhzBuj2uME6J86T/ULukwzPQs+mNVHd/5573xpZ2ZwZuBlEf25usT2/Fs1
	B/UQsx8/lTVWTD5bB2dO8V8jc+fVpqJWi2oPc5v5ZtnXWFmdWZ9xLKtsA18SZ25ZmKA9+PnOYoOFt
	RA8uK0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UkR-00000007BKg-2CmM;
	Wed, 09 Apr 2025 12:41:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UfC-00000007AW3-1xTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F11715A1;
	Wed,  9 Apr 2025 05:36:16 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B53D63F59E;
	Wed,  9 Apr 2025 05:36:13 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:36:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sunxi@lists.linux.dev, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Ovidiu Panait
 <ovidiu.panait.oss@gmail.com>, Samuel Holland <samuel@sholland.org>, LKML
 <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
Message-ID: <20250409133610.59d42bec@donnerap.manchester.arm.com>
In-Reply-To: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_053618_600750_7417E0B6 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, 9 Apr 2025 13:43:39 +0200
Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Apr 2025 13:26:55 +0200
> 
> Two if branches contained duplicate source code.
> Thus avoid the specification of repeated error code assignments by using
> additional labels instead.

Is that really useful? I think the current code reads easier, with the
usual pattern of setting the error code and the goto'ing out.
Now there is one rather opaque label it goes to, so a reader doesn't see
the error code immediately. And it really just saves one line per case
here. Plus the added danger that future changes might break this again.

And then there is the oddity that it jumps *into* an "if" branch, which
looks odd, I think typically we goto the end of the function, outside of
any other statements.

Cheers,
Andre

> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> index ba13fb75c05d..7d31e190bb6a 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> @@ -399,14 +399,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
>  	}
>  	if (len > 0) {
>  		dev_err(ce->dev, "remaining len %d\n", len);
> -		err = -EINVAL;
> -		goto err_unmap_src;
> +		goto e_inval_src;
>  	}
>  	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
>  	cet->t_dst[0].addr = desc_addr_val_le32(ce, addr_res);
>  	cet->t_dst[0].len = cpu_to_le32(digestsize / 4);
>  	if (dma_mapping_error(ce->dev, addr_res)) {
>  		dev_err(ce->dev, "DMA map dest\n");
> +e_inval_src:
>  		err = -EINVAL;
>  		goto err_unmap_src;
>  	}
> @@ -428,16 +428,15 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
>  		j = hash_pad(bf, 2 * bs, j, byte_count, false, bs);
>  		break;
>  	}
> -	if (!j) {
> -		err = -EINVAL;
> -		goto err_unmap_result;
> -	}
> +	if (!j)
> +		goto e_inval_result;
> 
>  	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
>  	cet->t_src[i].addr = desc_addr_val_le32(ce, addr_pad);
>  	cet->t_src[i].len = cpu_to_le32(j);
>  	if (dma_mapping_error(ce->dev, addr_pad)) {
>  		dev_err(ce->dev, "DMA error on padding SG\n");
> +e_inval_result:
>  		err = -EINVAL;
>  		goto err_unmap_result;
>  	}
> --
> 2.49.0
> 


