Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7EBD3B9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 23:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u3OlWaahLtO9NoZXjfgTMx2QYqqlSsbjYBcPVq2h2E=; b=EZiR22j4SepkPJejkb/oQ4Ez38
	KcOLUB0glEPYHlzQfnpN50ptPsdT2Nprazq8tnF67wPG+T9XZDY+3u87d2tly5GQ8oOKUofPRaZz7
	fkLdTgykDZ+BeR2xmB9b/Ev8i+rcML7lPaIiqSFvCgiGjL2ZiFUNhaFF9QJZU98zul5JZEWAgbCvA
	eMH+oi+6kaW9FmD5EzEyvogCvgqYafyb1OrAPViVU2jyc07L+4ohQg52CkYoI8xmP3d7/xfL2ohS3
	Un3fFJCx6bmBmjXXlQShMRNa8IUVtPpmccSPcPJtSByTMnX0MW/bwdJSqmooGaQ5CD73rgFM7c10a
	PxVwfo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT74c-0000000EuJr-1KOg;
	Tue, 09 Dec 2025 23:24:50 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT74Y-0000000EuJM-2p5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 23:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=1u3OlWaahLtO9NoZXjfgTMx2QYqqlSsbjYBcPVq2h2E=; 
	b=QFf6fJj34Unm/pgYLMhFQZ0drNCKLXD0WqoWSyezxh9yP/e5aL/gWlb3TOzQtf2yPsq7FTeTIPG
	ju8lKL7Esqfi2H1Lj4CMu/bcSljLmF5JscKn7O6doxEgRpatal/fRkwLdLILeu4n6gFroswF0FN1c
	bi8aP6oCcZCUoXN9+BiLisjRQdUu8m12PZKE6AyNzhBqxem1NzBhZKGMZ8V7mxwCCO0hr9HOivzk9
	8oX5c+lsCkM9mqMa9PHeT+m6n37Qz1N8ICpmOOE60dUtReWyoOgL0McOIYwe/q5efvK2nsftu09Kj
	eu6m1I4CInyXMiA5comAEcWDkzcpBA7j75XQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vT74J-00995H-0L;
	Wed, 10 Dec 2025 07:24:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 10 Dec 2025 07:24:31 +0800
Date: Wed, 10 Dec 2025 07:24:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH] crypto: arm64/ghash - Fix incorrect output from
 ghash-neon
Message-ID: <aTivr6JtPIxFmKLS@gondor.apana.org.au>
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com>
 <20251209223417.112294-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209223417.112294-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_152447_332430_484A5E95 
X-CRM114-Status: GOOD (  14.24  )
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

On Tue, Dec 09, 2025 at 02:34:17PM -0800, Eric Biggers wrote:
> Commit 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block
> handling") made ghash_finup() pass the wrong buffer to
> ghash_do_simd_update().  As a result, ghash-neon now produces incorrect
> outputs when the message length isn't divisible by 16 bytes.  Fix this.
> 
> (I didn't notice this earlier because this code is reached only on CPUs
> that support NEON but not PMULL.  I haven't yet found a way to get
> qemu-system-aarch64 to emulate that configuration.)
> 
> Fixes: 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block handling")
> Cc: stable@vger.kernel.org
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/linux-crypto/DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com/
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> If it's okay, I'd like to just take this via libcrypto-fixes.
> 
>  arch/arm64/crypto/ghash-ce-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for catching this!

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

