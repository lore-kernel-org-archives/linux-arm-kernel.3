Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828CFCD043E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 06:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpitPUAOqRhHNiQu5/A59labdYmuVavqAeylGVyamP4=; b=1nEvkdt5Ssx8hUm3FwogIJGObg
	Jmm7W29Vyj6pPJNLYZLLz8UhqCqRDTs4zGoH8DNLvbFTM0fTrV+lu1t3DRPZoFUA47UlwuZDBKx4u
	3vHxMEzkJ6KmevPvtLOqGoiLB6Fvt6RciEzPKDfgZXf8eQ2QbSfsbaQlUhYgKTOdlF8SaX7IWQtmY
	2HIgSFo8x6NCzyjLnpcAHNsLzi+CiykZsKozMkI4e5a5Te+nQmy/CllOhXYSeRXT6oDwkgalNjDkD
	2qVONy3om0LyBuqpChLpoOZt6p6IYkznCHbEKFQmjGs27rkMsmieIY7d2EFjZ1bTEE1uWqSylmEbU
	yKlJ90bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd11b-0000000CU9X-09nJ;
	Tue, 06 Jan 2026 06:58:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd11Z-0000000CU9N-2tYB;
	Tue, 06 Jan 2026 06:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDCEF6011E;
	Tue,  6 Jan 2026 06:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076F4C116C6;
	Tue,  6 Jan 2026 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767682716;
	bh=QQtOk2YRE84AoYQ+kSLZyLAyg4ikVDFr3IES1pY5ozA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gH/mbhwWcmbSviWB2aCXqeJKPYzexAoK01Yg6s6cLwpp5mznoR4J9YtzBX0+JaB2Q
	 RGzl1CWYt5ctBprLFLGJSvPejfop4znvHRnWwqgqpJHcHC0j9ob/Np83XrO9+Cl3TX
	 VS8m3uLgzCzbvtCwipbPzokR0Dek9Wxm/0Ippytis8vLZ/I6x2I70gfKMwQbmEhFro
	 NAdguE5T18zqwp0QS2kDwlBde/OWsN6qjyPmGKZIp7wCv7/K32g7gRemPHItu6WY9g
	 OF83QkAKrc+JLLzKj3XjbpThHQLvD4g3n1HMYbOp1iZmU15u/EOi4JVaYquL+5oCoh
	 XLNrjl71mrNfw==
Date: Mon, 5 Jan 2026 22:58:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jason@zx2c4.com,
	ardb@kernel.org, dengler@linux.ibm.com, freude@linux.ibm.com,
	herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Message-ID: <20260106065817.GB2630@sol>
References: <20260105051311.1607207-20-ebiggers@kernel.org>
 <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
 <20260105190503.53cc31dd@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105190503.53cc31dd@pumpkin>
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

On Mon, Jan 05, 2026 at 07:05:03PM +0000, David Laight wrote:
> On Mon, 5 Jan 2026 15:40:22 +0000
> Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> 
> > >  	/* Most significant octet of plaintextData corresponds to data[0] */
> > >  	swap_buf(r, data, 16);
> > >  
> > > - aes_encrypt(&ctx, data, data); + aes_encrypt_new(&aes, data, data);  
> > 
> > One thing you might want to consider, which reduces the churn in the series.
> > 
> > You can use _Generic() to do type-based dispatch on the first pointer. 
> > Something like this:
> > 
> > void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
> > void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
> >              const u8 in[at_least AES_BLOCK_SIZE]);
> > 
> > #define aes_encrypt(ctx, out, in)                                       \
> >     _Generic(ctx,                                                       \
> >              const struct crypto_aes_ctx *: aes_encrypt(ctx, out, in),  \
> >              aes_encrypt_arg: aes_encrypt_new(ctx, out, in))
> > 
> > 
> > i.e. it keeps the _new()-ism in a single header, without needing to
> > change the drivers a second time.
> 
> You'll need to cast the 'ctx' argument in both calls.
> All the code in an _Generic() must compile cleanly in all the cases.
> (Totally annoying....)
> 
> 	David

It seems it would actually have to be:

#define aes_encrypt(key, out, in) \
_Generic(key, \
	 struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 const struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)key, out, in), \
	 const struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)key, out, in), \
	 struct aes_key *: aes_encrypt_new((const struct aes_key *)key, out, in), \
	 const struct aes_key *: aes_encrypt_new((const struct aes_key *)key, out, in))

#define aes_decrypt(key, out, in) \
_Generic(key, \
	 struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 const struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 struct aes_key *: aes_decrypt_new((const struct aes_key *)key, out, in), \
	 const struct aes_key *: aes_decrypt_new((const struct aes_key *)key, out, in))

Note that both const and non-const args need to be handled.

It also doesn't work for any callers passing a 'void *' or
'const void *' and relying on an implicit cast.  I didn't notice any,
but that needs to be considered too.

I guess maybe it would still be worth it to avoid the "*_new" name
temporarily leaking into too many files.  (It goes away by the end of
the series anyway.)  It's just not quite as simple as you're suggesting,
and all the callers have to be checked for compatibility with it.

- Eric

