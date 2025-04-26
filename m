Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C33AC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 18:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo4JdOmDlpbxDOAUm42LDGfnVqBYFAjDDVr/rEREloo=; b=ZAVUXTaMEA799x2E9bZKv+INlw
	bABHLQZBmmEyidnuX6zOK5DzpqeDIqAXuaYjoKA9O/C8Qlvws+MfFxru+pR1kUQxs1lSBy1k8AZli
	Uj/IPKGRWKbn2PYcB8ezYWCHRsWXFJ9KQ8xOecPoIO36CXEb+QBAToRM15VwpPehShph/38nk2zmY
	q+6GT8TkuuO2+YPlYSQs2sdAdYXUKSENW+tthCGEjHZAeeqSAdERbJu0+IBMuJazSh72Sf0Ev16H9
	JJx53ulInCntdDUDsRdipeItFvYtNMsU8/+LkZivuKXwo8KvwN6woMjeCJMCHjmgY0PWdQpkshI8i
	6n2neYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ju5-00000002NT6-0wkM;
	Sat, 26 Apr 2025 18:05:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8jsB-00000002NJG-1ynD;
	Sat, 26 Apr 2025 18:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13AE16115D;
	Sat, 26 Apr 2025 18:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C994C4CEE2;
	Sat, 26 Apr 2025 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745690608;
	bh=thPYajZSkuIUqKSQ0PKrjdP700DcSK2zwAu2Gky2T80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAIxHEC/RBFXC7YAAr3+tsr8rzEcee3Oga1vMPOVdLEclJGRGGYsap6d40ssYdREa
	 631y8iWvrWajenPInP5JKnMuJ2fzsFVn4xbQ/K+cHhgPVnyuchNRRoD0ozvKffZkS3
	 MqUsr8paPOUnFmn+B8HDI8yKlJGh1TXUf3fq6tuJ1SIjPZir6nq73386jFGlYKnBTI
	 uo2ZHr9L3pkwpshwb0rthNh+eao6mVOKjQYtoSDUrpgKEgzJXu+h6VzFzy4Z/K4auE
	 MgMeah9RtM9RNppv7fmQMq0y8aXytAvAE0U5aitXE09LbzHtDgGADWAkJrVYOWn55s
	 dQXkKhP5hQ5yw==
Date: Sat, 26 Apr 2025 11:03:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <20250426180326.GA1184@sol.localdomain>
References: <20250426065041.1551914-12-ebiggers@kernel.org>
 <aAy6g3nblKtRj1l3@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAy6g3nblKtRj1l3@gondor.apana.org.au>
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

On Sat, Apr 26, 2025 at 06:50:43PM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > +void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
> > +                       const u8 *data, size_t nblocks)
> > +{
> > +       if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
> > +               kernel_fpu_begin();
> > +               static_call(sha256_blocks_x86)(state, data, nblocks);
> > +               kernel_fpu_end();
> > +       } else {
> > +               sha256_blocks_generic(state, data, nblocks);
> > +       }
> 
> Why did you restore the SIMD fallback path? Please provide a real
> use-case for doing SHA2 in a hardirq or I'll just remove it again.

The SHA-256 library functions currently work in any context, and this patch
series preserves that behavior.  Changing that would be a separate change.

But also as I've explained before, for the library API the performance benefit
of removing the crypto_simd_usable() doesn't seem to be worth the footgun that
would be introduced.  Your position is, effectively, that if someone calls one
of the sha256*() functions from a hardirq, we should sometimes corrupt a random
task's FPU registers.  That's a really bad bug that is very difficult to
root-cause.  My position is that we should make it just work as expected.

Yes, no one *should* be doing SHA-256 in a hardirq.  But I don't think that
means we should corrupt a random task's FPU registers if someone doesn't follow
best practices, when we can easily make the API just work as expected.

- Eric

