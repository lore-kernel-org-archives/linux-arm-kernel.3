Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3506FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMKt/wPLq9KRfU6Jf04/z1jGFWH/wF4jH0NXJm6Bhlo=; b=JIQD8rxwH6kZbZW662HzhUYR7y
	SjKdq3s3aqFpPG+AMWo/dK1TYkm1O0OCnxc5FcEfyXd+MLY3EfBjv0f3I7psbG4r9HxVppCQ/cgKB
	UDd2zwNBsGpxyHAWZ2e03IZfGYpq5WPX+NgeQQdDGoFXLSqowOmBr0D6G9tK2cXsAXwhxiili7CRl
	T4knNcYEV8xjFiNroKxUtWUhflor1ui78fQxG0E2xJzYpdMvfWVZ2NtIoz1Swptcfv7rdGCvg3CWD
	NsuRZuuROS1wzn+EX+dMvopMkA5MYNbBakj25kiCUZ5aHIHskd7sxNWKCBJS4k0KOzvEFYaNoXK2O
	7gXDvEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1Lq-0000000G1x7-0LX4;
	Fri, 13 Jun 2025 10:09:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ08b-0000000Fob7-2xGU;
	Fri, 13 Jun 2025 08:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wMKt/wPLq9KRfU6Jf04/z1jGFWH/wF4jH0NXJm6Bhlo=; b=P2ppK4slPzIPIUpPaOllJTjG98
	8niRUGkbT+FrJOgGWk+t0x00GeyyJugkpkx343d8Ud5i+rQ98fiklT78X1dPz+KN2cXSNRT+Ra6w9
	rBtTsEiy72njlgeFpGqirRh10ymTzmjDn75oB5SI01lQ+07bLaF9NcLtxy3oWzA/VT9fK6HccT5NI
	0LGt0qc2tdWD6GC+N2pn5SQVjf/P1ImmwQqoVi00eEsPqQQyPrThG8yf5lginln8b5eZy2bd7ryoI
	ZgMLy29CbXLiUCRlQf9HPzEorAtQuYSSsgvwoGTwk02dZc63x6kTMhT/Q5o6oGcC67affiCbmJ50y
	c7lL8VHQ==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ08Y-00000002wFy-1bhl;
	Fri, 13 Jun 2025 08:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wMKt/wPLq9KRfU6Jf04/z1jGFWH/wF4jH0NXJm6Bhlo=; b=ejeNYxJxjqQkEf+Qtb4/A1GtfZ
	b7jAaCx+igD/opjcpb3XKwVwchdM/PXR4tiwHprFmt4/L2Xs+ZpChWQHUuX2LYsCxrUU+eiustbeA
	ZKVolER6TWQLfjepmarO/P1DHA89vwzY7ArJk9gDAzisKwslfsuuBqb/Wg3/aWQPZOOjQoyMRELCP
	8Xbl2WNglxWI/mZ9MWHvlGbxuFigF+67XenNjqAmRVolrvDDN1QbLFg2RHZ/qe/i3LN+yRpvaWrJm
	DTsKHT9mnfmMylzfbbw6eoUAmVq33jZS3a+a6lk6aGGMWMPA7TQxzmLPlMLIij5j0NMLYobmukZhv
	QJp9aG1g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uQ08Q-00CsF4-2w;
	Fri, 13 Jun 2025 16:51:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 16:51:38 +0800
Date: Fri, 13 Jun 2025 16:51:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
Message-ID: <aEvmmr0huGGd2Psv@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613055439.GB163131@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_095146_658923_7ADE50B5 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, Jun 12, 2025 at 10:54:39PM -0700, Eric Biggers wrote:
>
> Actually, crypto_ahash::base::fb is initialized if CRYPTO_ALG_NEED_FALLBACK,
> which many of the drivers already set.  Then crypto_ahash_update() calls
> ahash_do_req_chain() if the algorithm does *not* have
> CRYPTO_AHASH_ALG_BLOCK_ONLY set.  Which then exports the driver's custom state
> and tries to import it into the fallback.
> 
> As far as I can tell, it's just broken for most of the existing drivers.

This fallback path is only meant to be used for drivers that have
been converted.  But you're right there is a check missing in there.

Thanks,

---8<---
Ensure that drivers that have not been converted to the ahash API
do not use the ahash_request_set_virt fallback path as they cannot
use the software fallback.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Fixes: 9d7a0ab1c753 ("crypto: ahash - Handle partial blocks in API")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/ahash.c b/crypto/ahash.c
index e10bc2659ae4..992228a9f283 100644
--- a/crypto/ahash.c
+++ b/crypto/ahash.c
@@ -347,6 +347,9 @@ static int ahash_do_req_chain(struct ahash_request *req,
 	if (crypto_ahash_statesize(tfm) > HASH_MAX_STATESIZE)
 		return -ENOSYS;
 
+	if (crypto_hash_no_export_core(tfm))
+		return -ENOSYS;
+
 	{
 		u8 state[HASH_MAX_STATESIZE];
 
diff --git a/include/crypto/internal/hash.h b/include/crypto/internal/hash.h
index 0f85c543f80b..f052afa6e7b0 100644
--- a/include/crypto/internal/hash.h
+++ b/include/crypto/internal/hash.h
@@ -91,6 +91,12 @@ static inline bool crypto_hash_alg_needs_key(struct hash_alg_common *alg)
 		!(alg->base.cra_flags & CRYPTO_ALG_OPTIONAL_KEY);
 }
 
+static inline bool crypto_hash_no_export_core(struct crypto_ahash *tfm)
+{
+	return crypto_hash_alg_common(tfm)->base.cra_flags &
+	       CRYPTO_AHASH_ALG_NO_EXPORT_CORE;
+}
+
 int crypto_grab_ahash(struct crypto_ahash_spawn *spawn,
 		      struct crypto_instance *inst,
 		      const char *name, u32 type, u32 mask);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

