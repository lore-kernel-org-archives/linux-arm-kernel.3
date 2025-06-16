Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F68EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JhRGK4jXnVQ6+DekEGOh8HvxWAfgHU9rMzaDKfUDnRk=; b=i3z3qS9knsBaDO
	SSAhz4PHxB3GHmo7xbvS8zUmWuldqv6lcG/Ed2AdULx4lkIKqxbxI3W/DzLA9ePD5pPe7wuMRwi6l
	pXDfQJK+M1REGgpswy6KNfl7pbMhgvS3SNJui2qUwqymUR2LxRcmFjj2ymCdSiJZp3hcx4zP4v7iB
	sauyE38B+i1hpCIYBYozf4UqOU6M1+u1ecTakb10qt+PxVajivsL2TaMW0I7ffQZefO73FiLjVjD/
	rEhZ5BG2exqir67nlrCQJPUQ8IJcjriZIxvwTokbg9X/ROGUuB5oLYjdSoR33/dc9ApGtf0T+nlhG
	cPWd7w0p2Q+E6L3uUXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0pI-00000003I4M-2CD1;
	Mon, 16 Jun 2025 03:48:04 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0VA-00000003Fhh-0rXJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JhRGK4jXnVQ6+DekEGOh8HvxWAfgHU9rMzaDKfUDnRk=; b=OdgbtJr9jj783tzS1GGx7gt/BG
	3NWVVg3wKvybuNw4Xv0qkLx/l8Wfe+R8+FYvEkH/5kA+oaNXbkxzL4Rcl9MpumeCBgOp/qt3eilXf
	cI+oxD5ALq9JHLMk1SLHbgapBxlrleT0KGZFnq9hvsVNc1hkjPTwoFEMRcCLU4bJjFghQLbyMnlol
	/lFxRxlA1Y9dg5BNsbPR5zEdKI84X4oax/ANWBdBTD137lFxJCtO+bf98lMAOi8y0qZ7rKw4A5ygz
	T7fK8KIBwuKpdKm/xwCcqpRCtLBcrSI2Z3O3euJ5g2bdF8FvTsPAfN39LA8g0JP4y6E2vjqaXHBrj
	Rkqlsamw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uR0Ft-000Iud-1C;
	Mon, 16 Jun 2025 11:27:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Jun 2025 11:27:09 +0800
Date: Mon, 16 Jun 2025 11:27:09 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Jason@zx2c4.com,
	ardb@kernel.org, kent.overstreet@linux.dev
Subject: Re: [PATCH] lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch()
Message-ID: <aE-PDfmowagPegen@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010654.367302-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202716_261900_3D2B5F13 
X-CRM114-Status: GOOD (  16.15  )
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

Eric Biggers <ebiggers@kernel.org> wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> For some reason arm64's Poly1305 code got changed to ignore the padbit
> argument.  As a result, the output is incorrect when the message length
> is not a multiple of 16 (which is not reached with the standard
> ChaCha20Poly1305, but bcachefs could reach this).  Fix this.

Sorry, it was a cut-n-paste error since I copy the code from
the update function where the padbit is always 1.

> diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
> index 6a661cf048213..c9a74766785bd 100644
> --- a/arch/arm64/lib/crypto/poly1305-glue.c
> +++ b/arch/arm64/lib/crypto/poly1305-glue.c
> @@ -36,18 +36,18 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>        if (static_branch_likely(&have_neon)) {
>                do {
>                        unsigned int todo = min_t(unsigned int, len, SZ_4K);
> 
>                        kernel_neon_begin();
> -                       poly1305_blocks_neon(state, src, todo, 1);
> +                       poly1305_blocks_neon(state, src, todo, padbit);

This would do the wrong thing if someone ever tried to pad a
message more than 4K and called the block function with padbit == 0.
Fortunately it can't happen today as there is no digest interface
to poly1305.

Looking around it seems that this pattern is replicated across
all of our poly1305 implementations so it isn't a big deal.

I presume you will be picking this up via the lib/crypto tree?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

