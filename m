Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81677F47CC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8kAMoEEm4RgDUZi0RTTSp1n7mMruJk7xeTsERQ6Evk=; b=B7XJcQg7BQmSbkyHdgT4IYMajp
	9dN4s28940OrDUIwGhGeVENbMlY9hwMh8OjOzwoG2juH3mgD9JmH9xXqSMffWZhZTA87PhfRIMcJu
	EEva0tqoWNkVMMy/xanNZ4smg1OHDxlKI2cI6Db+7zIzAbOSqHT4tMUCv1e/driXWDP9+Na17Bqj+
	Hbdvj1r13h44sLV7xGLTyhlLxe9RhyYnNCW/45SZraWAvoduXmmnIKGj56fwsmA5yvwfDN87/RcHh
	s4UvFeBNpb21GF+bBXppzRTuSquVXxj1+JAOJNn+A0etqoMr5ApfV3BpMOcWLR6KROO3ACfIHGLV3
	t/KdoVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEX7-00000002T4l-0Mdj;
	Thu, 05 Mar 2026 19:38:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEX5-00000002T4f-2aL4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:38:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D61B60053;
	Thu,  5 Mar 2026 19:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FEAC116C6;
	Thu,  5 Mar 2026 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772739529;
	bh=4P7IvlDXVMb8aJ5U3oJEZWYqkie/zWLUSvgwf2HKGvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siqIkm649lFn7xIxhr0WIePvk7wKgedglH6M6oR19DfqgX0GKWyk9p+7ounXWRR36
	 3ML4TK6cMVqVoRaB7G08WOaps4+8zgHxCHrUooER+oHibIAXsPL8A63mXpOJQusbIf
	 acvx5Oj+WHaoUeil144hzsdqZ7uzoi9HO+B8HUEosPw82NkbPJeXSXu8nfiINAE5DM
	 9P22GVQuRol8fTzTetZbPTWqK3c2+P8NRxlXEg7XalaD8jTl21vp9oPdZf3kb8sYX9
	 3Phyo+X8PDnmDIrETtBriD3GLPOC3oJ/uIhkXDg3xS25l8lyMJLWcbEZQKv8CaXfp0
	 lxC9PMnCgvY0w==
Date: Thu, 5 Mar 2026 11:38:47 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	catalin.marinas@arm.com, will@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 1/1] crypto: arm64/aes-neonbs - Move key expansion off
 the stack
Message-ID: <20260305193847.GG2796@quark>
References: <20260305183229.150599-1-yphbchou0911@gmail.com>
 <20260305183229.150599-2-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305183229.150599-2-yphbchou0911@gmail.com>
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

On Fri, Mar 06, 2026 at 02:32:24AM +0800, Cheng-Yang Chou wrote:
> aesbs_setkey() and aesbs_cbc_ctr_setkey() trigger -Wframe-larger-than=
> warnings due to struct crypto_aes_ctx being allocated on the stack,
> causing the frame size to exceed 1024 bytes.
> 
> Allocate struct crypto_aes_ctx on the heap instead to reduce stack
> usage. Use a goto-based cleanup path to ensure memzero_explicit() and
> kfree() are always called.
> 
> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
> ---
>  arch/arm64/crypto/aes-neonbs-glue.c | 39 ++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
> index cb87c8fc66b3..a24b66fd5cad 100644
> --- a/arch/arm64/crypto/aes-neonbs-glue.c
> +++ b/arch/arm64/crypto/aes-neonbs-glue.c
> @@ -76,19 +76,25 @@ static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
>  			unsigned int key_len)
>  {
>  	struct aesbs_ctx *ctx = crypto_skcipher_ctx(tfm);
> -	struct crypto_aes_ctx rk;
> +	struct crypto_aes_ctx *rk;
>  	int err;
>  
> -	err = aes_expandkey(&rk, in_key, key_len);
> +	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
> +	if (!rk)
> +		return -ENOMEM;
> +
> +	err = aes_expandkey(rk, in_key, key_len);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	ctx->rounds = 6 + key_len / 4;
>  
>  	scoped_ksimd()
> -		aesbs_convert_key(ctx->rk, rk.key_enc, ctx->rounds);
> -
> -	return 0;
> +		aesbs_convert_key(ctx->rk, rk->key_enc, ctx->rounds);
> +out:
> +	memzero_explicit(rk, sizeof(*rk));
> +	kfree(rk);
> +	return err;
>  }
>  
>  static int __ecb_crypt(struct skcipher_request *req,
> @@ -133,22 +139,27 @@ static int aesbs_cbc_ctr_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
>  			    unsigned int key_len)
>  {
>  	struct aesbs_cbc_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
> -	struct crypto_aes_ctx rk;
> +	struct crypto_aes_ctx *rk;
>  	int err;
>  
> -	err = aes_expandkey(&rk, in_key, key_len);
> +	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
> +	if (!rk)
> +		return -ENOMEM;
> +
> +	err = aes_expandkey(rk, in_key, key_len);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	ctx->key.rounds = 6 + key_len / 4;
>  
> -	memcpy(ctx->enc, rk.key_enc, sizeof(ctx->enc));
> +	memcpy(ctx->enc, rk->key_enc, sizeof(ctx->enc));
>  
>  	scoped_ksimd()
> -		aesbs_convert_key(ctx->key.rk, rk.key_enc, ctx->key.rounds);
> -	memzero_explicit(&rk, sizeof(rk));
> -
> -	return 0;
> +		aesbs_convert_key(ctx->key.rk, rk->key_enc, ctx->key.rounds);
> +out:
> +	memzero_explicit(rk, sizeof(*rk));
> +	kfree(rk);
> +	return err;
>  }

Instead of memzero_explicit() followed by kfree(), just use
kfree_sensitive().

Also, single patches should not have a cover letter.  Just send a single
patch email with all the details in the patch itself.

As for the actual change, I guess it's okay for now.  Ideally we'd
refactor the aes-bs key preparation to not need temporary space.

- Eric

