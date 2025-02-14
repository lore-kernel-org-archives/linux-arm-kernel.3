Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57474C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRcqZx7cq1tKhDqsyELxcn18fJsJApZHR4xRqwkuGIs=; b=rFguET+5lUfSYpH6A1XnOfVp+x
	1pheEVCcrCgCZuT5F14HzbW5KnS0IuSDD4g23/VyeFvgySBieaeJHPU606Ejy6wXtcOgnrE3LDiFm
	J0/LKpyraEY3xeGTpmh3WXf7TgMfpSWRGXw3EU4P4wE0LeAoM7r88IC2htaq2/H8PxhDsHyYQzJ5R
	kEtRoCpLnML4e+Rz44j4m/BNTFFM2MZki1nnb09RgwOAVJ9XTtnFVjxpjRmi6CUEI41scuDY+Wheb
	jm9bg/0IGgtGuGsJTyV3Nh8uQCnN8L/TE8hOySQEUh73Qv1BZzF4n6SRJYOAnQVif6XF8QKNi5QcQ
	hw62KTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinMK-0000000DbaM-0CHS;
	Fri, 14 Feb 2025 04:31:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinKs-0000000DbMv-0HE0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03E5C5C2308;
	Fri, 14 Feb 2025 04:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC6EC4CEDD;
	Fri, 14 Feb 2025 04:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739507393;
	bh=kJfkFaSW6aJQb8uFoWo8v4ScxVtaWTGd54TPudR6gnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdP10B/d07a8NOBmx+NMyNq7E4ryvlAzNRtxyr9IhOOrkL3F76sOwT0kQsy75C15J
	 NdH8ijzNrzam/YU/kpqouZ2Gpdz6bE0ex62pPOyTv4Q40hIuslm3iDr89O6+KMocJp
	 /XCJwCOz7jf1mdTwPujOnuz2dpvZaXAaKr7bHmeFIQ5uO3Zzw31UEGy9AKmeNFXZxT
	 mQV5OPxyxp1QZxbBx1DLhUuYCGjTp7ahg0RfGQ5/mUco3sFrqZI5vbzuasB5k5Olj5
	 vgtCg+agVsu/TeRxXSUzqhllmhb1w+7l4FaVFdkqtD5p2GTgzVT5T8TLnCGwvHDFPH
	 EOZ/pqHoqYmjQ==
Date: Thu, 13 Feb 2025 20:29:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: fsverity@lists.linux.dev, linux-crypto@vger.kernel.org,
	dm-devel@lists.linux.dev, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <20250214042951.GB2771@sol.localdomain>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <Z66uH_aeKc7ubONg@gondor.apana.org.au>
 <20250214033518.GA2771@sol.localdomain>
 <Z669mxPsSpej6K6K@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z669mxPsSpej6K6K@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_202954_217687_C25AAC6E 
X-CRM114-Status: GOOD (  24.29  )
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

On Fri, Feb 14, 2025 at 11:50:51AM +0800, Herbert Xu wrote:
> On Thu, Feb 13, 2025 at 07:35:18PM -0800, Eric Biggers wrote:
> >
> > It absolutely is designed for an obsolete form of hardware offload.  Have you
> > ever tried actually using it?  Here's how to hash a buffer of data with shash:
> > 
> > 	return crypto_shash_tfm_digest(tfm, data, size, out)
> > 
> > ... and here's how to do it with the SHA-256 library, for what it's worth:
> > 
> > 	sha256(data, size, out)
> > 
> > and here's how to do it with ahash:
> 
> Try the new virt ahash interface, and we could easily put the
> request object on the stack for sync algorithms:
> 
> 	SYNC_AHASH_REQUEST_ON_STACK(req, alg);
> 
> 	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL, NULL);
> 	ahash_request_set_virt(req, data, out, size);
> 
> 	return crypto_ahash_digest(req);

That doesn't actually exist, and your code snippet is also buggy (undefined
behavior) because it never sets the tfm pointer in the ahash_request.  So this
just shows that you still can't use your own proposed APIs correctly because
they're still too complex.  Yes the virt address support would be an improvement
on current ahash, but it would still be bolted onto an interface that wasn't
designed for it.  There would still be the weirdness of having to initialize so
many unnecessary fields in the request, and having "synchronous asynchronous
hashes" which is always a fun one to try to explain to people.  The shash and
lib/crypto/ interfaces are much better as they do not have these problems.

> > What?  GHASH is a polynomial hash function, so it is easily parallelizable.  If
> > you precompute N powers of the hash key then you can process N blocks in
> > parallel.  Check how the AES-GCM assembly code works; that's exactly what it
> > does.  This is fundamentally different from message digests like SHA-* where the
> > blocks have to be processed serially.
> 
> Fair enough.
> 
> But there are plenty of other users who want batching, such as the
> zcomp with iaa, and I don't want everybody to invent their own API
> for the same thing.

Well, the IAA and zswap people want a batch_compress method that takes an array
of pages
(https://lore.kernel.org/linux-crypto/20250206072102.29045-3-kanchana.p.sridhar@intel.com/).
They do not seem to want the weird request chaining thing that you are trying to
make them use.  batch_compress is actually quite similar to what I'm proposing,
just for compression instead of hashing.   So there is no conflict with my
proposal, and in fact they complement each other as they arrived at a similar
conclusion.  Hash and compression are different algorithm types, so they can
never use exactly the same API anyway, just similar ones.  And FWIW, zswap is
synchronous, so yet again all the weird async stuff just gets in the way.

- Eric

