Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnUpu6aIGkBvFTLRk8XsqS6jkn7cP+pYPk1SMU1zWj0=; b=rcn56Ud42UcAO/yauCNz8d1ePY
	fPIat7trCRSPGTFsE5LUfT+2RGzW0r55FfR4NzcJPB0t/6qjDWBhaweTQNorO2cZGPLZ1JQNk741K
	jwI++KXwgfCf8ss2tnQVQxbvJbh8WdWy5XnXQNkRjzMhyENhjePXWRhBDA2r7uX2AIYmmuwpXPY3j
	CpVXKY5VplUa9jAox9H4bpRWrnFZOHCyvz3NaSOswt3VtjBiYY+3/VIjMjnOxgyfvgZGSEhoJHcg+
	1iT7L+rjg6Sea1plTYTN/HBtt6YzB85/T1r9KtZA6NKdKjtDseN4mBDP4UzDmXz6SBoATSJbWsVZZ
	NCYmAihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NQk-0000000699H-2bF7;
	Mon, 28 Apr 2025 12:17:50 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mpq-00000005zwP-3Sqi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mnUpu6aIGkBvFTLRk8XsqS6jkn7cP+pYPk1SMU1zWj0=; b=CEUOlbvK/GAsNuym/k6N+Y0xv6
	+at5oP3gUeO0RGzXczUnbrtxYLEudQYFL7yudwFGrpNpHHx/csGAw0zrp4U9mQyeOjjrQbSC4UO15
	PSB3hVYzDIx2/F3M8kNwI7KpDGRggW//O9sOC6HsrnfDksd/bCtMHBP/0u0g986TiBIV411y/xAxC
	wmJ2XhPGw609eY5XDVujevyh0GMfteMHsUXhODm6ym9WiiSOv/a0BpnCvMiUuwxdPMpeX4wWkuuHV
	1wiMOZVAYovWVYVJI5yoN6Vm/X4liHHkOiz4+m4CcCWgPaZ6B3xOKNKlVxD7pnZ8Jf7v59sQ9cSIl
	92kAOvOQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9Mpj-001bAH-1g;
	Mon, 28 Apr 2025 19:39:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 19:39:35 +0800
Date: Mon, 28 Apr 2025 19:39:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] crypto: sun8i-ce-cipher - use
 crypto_skcipher_driver_name()
Message-ID: <aA9o9w1odAIgmK0e@gondor.apana.org.au>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043942_866961_23917537 
X-CRM114-Status: GOOD (  13.86  )
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

On Fri, Apr 25, 2025 at 03:45:15PM +0300, Ovidiu Panait wrote:
> Use crypto_skcipher_driver_name() helper from <crypto/skcipher.h>, instead
> of accessing struct crypto_alg directly.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index 05f67661553c..f03a8fa7bfa2 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/pm_runtime.h>
>  #include <crypto/scatterwalk.h>
> +#include <crypto/skcipher.h>
>  #include <crypto/internal/des.h>
>  #include <crypto/internal/skcipher.h>

If you include internal/skcipher.h, there is no need to include
skcipher.h.

There is no need to resend this as I'll just remove this hunk when
applying the patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

