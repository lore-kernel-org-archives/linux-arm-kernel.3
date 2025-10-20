Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDE3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEogeImBHDdkSsawfxztJ8Fyt/RfGz3geqiubiemebU=; b=4CYZB/1GG0889bDPtOzPmLzdld
	YTN+CCu8Zw6qzdKMpifJr0n+PCc40P0W6JhW7+Zz0PiST3O0G9caqh2g663SG9pZAnAjJmKuqffxr
	aWfxhQbbTJ3vIRVVu4fWZV7JedDzoVLthkgvtUt1YXylCRj1iP9bu9X/S1nVhAl9GVeoPup1MByBi
	Wpz+Iw800BnxrP24cf8mtdULPnJCWE/ZOz3w5ip/w7CemOolVIj/OUMqRFGk79Rs9YTXj8g1t3Oda
	FfIFRccrvhN4+K6M81MmCEwpaH8Z9J3oabhQELBdtRfQwQ0f2Iz09V2XcRVhcKZc0abUJ8Z1A4Y+W
	zNyoluPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuA4-0000000EZ3c-2VhV;
	Mon, 20 Oct 2025 17:59:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuA1-0000000EZ2P-3i12
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3804B41719;
	Mon, 20 Oct 2025 17:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F22C4CEF9;
	Mon, 20 Oct 2025 17:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760983149;
	bh=x7GUYv8Ms47fFopUIi3Wz6TTbTv7Y2GnvOK59yf3mcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIwu3N3RIH04/zJHOEAoM7ocAG9NiaDVkyJ306sift4cHMx3Tb2f/ippaSK8Fg06m
	 6IQXodbTyF3Qn2c8aDBNoAVRP6uZT4YfvSbV/KeUzZiYZHUyMEJW0Pbfi8/fKQNP3+
	 pDGdjuzWzXILebjnLWC8McdJmoz/tKPyQwLAhX/T0UQmYRShJMBWRvW45Z1d1FMa6W
	 s2Dn0RtbK5qByuihJwoqQzl2p1ofOCvEBa9Bfw1Q3yhHuxwDJn4cH0vmPgAfOXoB9i
	 iMRB0KkL4qetti2maqpV8j/O4nn5UDYIT0eifLYn9cGmrEOg+7i5oDkN/hHaIRQa4v
	 MoYDtbKU4Sn8A==
Date: Mon, 20 Oct 2025 10:57:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Holger Dengler <dengler@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 15/17] lib/crypto: s390/sha3: Migrate optimized code into
 library
Message-ID: <20251020175736.GC1644@sol>
References: <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-16-ebiggers@kernel.org>
 <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105909_964795_54B83AB1 
X-CRM114-Status: GOOD (  32.90  )
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

On Mon, Oct 20, 2025 at 04:00:42PM +0200, Holger Dengler wrote:
> On 20/10/2025 02:50, Eric Biggers wrote:
> > Instead of exposing the s390-optimized SHA-3 code via s390-specific
> > crypto_shash algorithms, instead just implement the sha3_absorb_blocks()
> > and sha3_keccakf() library functions.  This is much simpler, it makes
> > the SHA-3 library functions be s390-optimized, and it fixes the
> > longstanding issue where the s390-optimized SHA-3 code was disabled by
> > default.  SHA-3 still remains available through crypto_shash, but
> > individual architectures no longer need to handle it.
> > 
> > Note that the existing code used both CPACF_KIMD_SHA3_224 and
> > CPACF_KIMD_SHA3_256 after checking for just CPACF_KIMD_SHA3_256, and
> > similarly for 384 and 512.  I've preserved that behavior.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> The current code also cover a performance feature, which allows (on
> supported hardware, e.g. z17) to skip the ICV initialization.

I'm not sure if by "ICV" you mean "Integrity Check Value" or "Initial
Chaining Value", but SHA-3 doesn't have either of those.  It just starts
with a state of all zeroes.  I assume that skipping the
zero-initialization of the state is what you're referring to?

> support has been introduced with 88c02b3f79a6 ("s390/sha3: Support
> sha3 performance enhancements"). Unfortunately, this patch removes
> this support. Was this intended?

For now, yes.  I should have explained more in the patch, sorry.

As currently proposed, lib/crypto/sha3.c supports arch-specific
overrides of sha3_absorb_blocks() and sha3_keccakf().  Those cover the
Keccak-f permutation which is by far the most performance critical part.
This strategy is working well in the SHA-2, SHA-1, and MD5 libraries,
which support the same level of arch overrides.

We could update lib/crypto/sha3.c to allow architectures to override
more of the code.  But we need to consider the tradeoffs:

- Risk of bugs.  QEMU doesn't support the s390 SHA-3 instructions, so no
  one except the s390 folks can test the code.  I can try to write code
  for you, but I can't test it.  And the s390 SHA-3 code has had bugs;
  see commits 992b7066800f, 68279380266a5, 73c2437109c3.

  The first priority should be correctness.

- The proposed change to the init functions would cause the format of
  'struct __sha3_ctx' to be architecture-dependent.  While we can do
  that if really needed, it's something that's best avoided for
  simplicity.  It opens up more opportunity for error.

- As I mentioned, Keccak-f is by far the most performance critical part
  anyway.  The initial state is just all zeroes, and initializing it is
  very lightweight.  Also consider that these contexts are often on the
  stack, and people increasingly set the "init all stack variables to
  zero" kernel hardening option anyway.

  I'll also note that commit 88c02b3f79a6 has no performance data in it.
  So it's not clear that it actually helped much.

- The library has an optimization to greatly reduce the size of the
  context: instead of buffering data separately, it just XOR's data into
  the state.  So, if there's a sha3_*_init() followed by a sha3_update()
  of less than 1 block, it will have to initialize the state anyway.  We
  can delay it until that point on s390.  But again: complexity.

- These potential additional s390 optimizations would presumably help
  the most on short messages.  However, on short messages, merely
  switching to the library often gives a large performance improvement
  due to eliminating the very slow call to crypto_alloc_shash().  That's
  actually a lot more important.

I would suggest that we drop the sha3_*_init() optimization from
consideration for now.  Providing overrides for the one-shot functions
sha3_{224,256,384,512}() should be simpler as well as possibly a bit
more useful, and I would suggest exploring that.

I guess I can try to write the code for you again.  But again, without
QEMU support I cannot test it.  The first priority in cryptography code
is correctness, so that's not a great position to be in.

Note that for new optimized code I'm requiring QEMU support for the
instructions it uses.  This one would only be allowed because code that
used these instructions already existed in arch/s390/crypto/.

> Please also add me and Harald Freudenberger to the cc: list for this patch.

Will do, thanks.

- Eric

