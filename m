Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3DACD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoVKhzzmIrNFG1UZP8NlLw5m4P+ZkY+UrKc384/A01c=; b=u6Q3WY5FQ5aHodfcyRtIT0sUY4
	ae7aIWOLoPti4ZEhAQIjWkGDXmXOBpVm9xxBDHWStpJz1lmi3Su1PLbkdmhQfOHU47LGaXhyD8Foc
	YA7n1/j0whr539RmaWmEhy0G/Q46UMII2KEa6jNIIR4Ruf8txaaf/j7ovXn2g5PbSCmEjiImY7jBi
	mE8U35bLxAVj/zPRkM995kcn/1bdSxSlA5l9xriByMChhAmarruTWK/AjWc7RCkHFAWHF9dPyU3vs
	PBFPxk745Xsed73F7AJtYqAOfx8O1o6+7aIKRK3a/2GetCA8Dd5BZ1bEzdLyUXxLeFWxQ0LCYiYAJ
	yjGNd7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqRx-00000006nJn-0w00;
	Fri, 29 May 2026 06:12:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqRu-00000006nIx-0jHB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=PoVKhzzmIrNFG1UZP8NlLw5m4P+ZkY+UrKc384/A01c=; 
	b=cC0+4cRYSBdg1Ia1D5a53vjxX/DCxbbNTWHu/uwdEPa+CZQB0l0vfFG8wgnJt6TaP5wdklXnfDM
	3/uJPvxERoWwaueKdVheUVyCYWGJ7GqaswEGFr9Kdw47hCd8GaXRYeXHsOiYnA+OSV8ozV5FAM0TN
	BYHTf9Le4XBPqEuJ9E/hu5oe+84evLWwkrncIxq+lc5J7ws7BLfb0b4Zr0CHwcdWppcj8XVo6y3Wt
	vhe5jJ0V5xPGZfITJB7W9KmzdAU2/NQuZ1UUFfcpf8x/7TBcW5QgZPLdQJyyWz79qeGXx7vKyfOYA
	O3fz/b1wY1ponZNHylgVvI4zbAGEpj/xpPKg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wSqRf-000dL1-1P;
	Fri, 29 May 2026 14:11:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 29 May 2026 14:11:47 +0800
Date: Fri, 29 May 2026 14:11:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tianchu Chen <tianchu.chen@linux.dev>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss: restrict PRNG seed length to prevent
 heap overflow
Message-ID: <ahkuI-Z2w0sea_ba@gondor.apana.org.au>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_231202_216803_CDAB94A7 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, May 28, 2026 at 02:53:17PM +0000, Tianchu Chen wrote:
>
> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> index 491fcb7b8..010fa891c 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> @@ -8,6 +8,8 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *seed,
>  	struct rng_alg *alg = crypto_rng_alg(tfm);
>  
>  	algt = container_of(alg, struct sun4i_ss_alg_template, alg.rng);
> +	if (slen > sizeof(algt->ss->seed))
> +		return -EINVAL;

This should simply ignore the extra data instead of failing.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

