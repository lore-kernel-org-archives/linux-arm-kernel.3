Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAD8F99351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBJpx/WgTzQTJVK4tn9rHHDlfR/K86CEVs4Z2TnHt0s=; b=Ks1KlHB8HjtryMaOZtkCJ8yvvS
	DeReKB1cKYff79KeBbv50UcakjpfH0hVR+kNYBMwyEBfOYzKwiFWuE4vXERp8EurAbQKJ3koO7D6r
	BOVX232pzpJ+X5hd/7d/vyg18SR9GmOgmPFruH6V6lvsjBTekDFcztcbB3+IMsq4rdtjN3PXLP9K6
	/oN/kyVKb+lH99Jo7xrQRG1jCWq5tR5cG/JAmDm4BUt+/MTMBF0GIauI7to9Ts1GYUrEQBAe7DufB
	2LkqqEyCUJtSzUwtEVpZnHwEZS74iub0rIZm2ASQiYEhUA7SJ/aFxoZUHEavTJSJvbveYJb3wDGqI
	P2T1YLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvA-0000000BINJ-3gpP;
	Thu, 23 Apr 2026 09:00:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpv4-0000000BILo-353d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=xBJpx/WgTzQTJVK4tn9rHHDlfR/K86CEVs4Z2TnHt0s=; 
	b=bFq9fzltYEiVavjVtc+vdeaill1Bwv8zaChgD1DzEz7SvrhW6nwzteZ78GArSM8UAcVXm1FefAd
	+DsbNkFiFzUmSQ9oAOQiU97ApNIvOLgL9UdtWvRLULmGWOqGHC3SNlPaBzppyTQHNsJx5eYedYmt+
	rh4xVHeC4EuIGh2QXqAoFI4q/PGbsxVHpel9+cNa7IZO72Hu5VtShPHqAS4hWwi8Gx5ITNH90pl9Z
	2dbJc/KBYIy176MUx+iApuQmOJ555QAP1gCAYU4svWazc8Mvfo3BecfI2CrMX4hc8nO+8PuDXAGbK
	29CIUIkGUrhMMe6lOppy75v1i2uO4qQ6OSnA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFput-008Bgo-2U;
	Thu, 23 Apr 2026 17:00:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Apr 2026 17:00:11 +0800
Date: Thu, 23 Apr 2026 17:00:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Message-ID: <aenfmxOvtHaAODqH@gondor.apana.org.au>
References: <20260423065600.2081989-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423065600.2081989-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020022_771336_842F2C35 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 23, 2026 at 08:55:42AM +0200, Arnd Bergmann wrote:
>
> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> index 58a76e2ba64e..813c4bc6312a 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> @@ -247,12 +247,14 @@ static int sun4i_ss_debugfs_show(struct seq_file *seq, void *v)
>  				   ss_algs[i].stat_req, ss_algs[i].stat_opti, ss_algs[i].stat_fb,
>  				   ss_algs[i].stat_bytes);
>  			break;
> +#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
>  		case CRYPTO_ALG_TYPE_RNG:
>  			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
>  				   ss_algs[i].alg.rng.base.cra_driver_name,
>  				   ss_algs[i].alg.rng.base.cra_name,
>  				   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
>  			break;

Does this work?

			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG))
				seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
					   ss_algs[i].alg.rng.base.cra_driver_name,
					   ss_algs[i].alg.rng.base.cra_name,
					   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
			break;

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

