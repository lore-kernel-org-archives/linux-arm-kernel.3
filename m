Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176CBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdIdN9cG9v5ZDpF+JPZVStXRPW2Q8Q+gPtoDoWRnaj8=; b=Svmx4szicFMBLNUFCgNcGkMOP9
	a+78JbjjiMnHmclC8CU6/J+YhFLfs1BIJIOHT+S45ImhMFVV+pxqp0uaV/8GmkDbEe3klczp7rdHj
	U+1oknMUUsfvivk99Vq/WH77gOadAZqLmuvS3ugFUsNNGItxuOMcKz+yqdldn+f3I9oIbDcaprbPi
	oWY9HswrroyvVMxb9W3h+mcLc8qaUsebaiA6zYEo/K7jL8EKjKS2W/AnSsJqOlcHMDUKNNI5L4CH4
	eX9QVWH3ScCbO69wBsLA9y/O2EyParCr2PwJOrD49o6royL5JOIhDRRHcPnTAwAaWR57Mc8ygc5aE
	B8eJQaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timWx-0000000DVee-2oPR;
	Fri, 14 Feb 2025 03:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1timU5-0000000DVGA-3MK8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 03:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 535CA5C5BC4;
	Fri, 14 Feb 2025 03:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED176C4CED1;
	Fri, 14 Feb 2025 03:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739504120;
	bh=GHXJGGSXmO3XdJUVBTnqgXpdPTGoAWBnUJGaHHmw8is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGyDKVt7O7hWki5SZw8ElAlXetpN0kOsRzduxYor4iWe1QnJQ85VsefWpe44PiY4M
	 P47TB51v1WwrqxRGhQg2d/uBRc50Fouh0MY6djzFipYz6npZxpbc08LMijaZsGpL4P
	 rQNSWB2jMm0h6sRZrv/MdxqCgqJSThsyH/bCy5O0dGfk5rKLwnKvUPAAX0+vra9uzr
	 aj+xzi04tOoYx3OrRL4gWF/HI4AXcbV9BSGWRBqwuIhHk4tGlzLjOhI5RmM1/9dr8i
	 pq9I2YOjlYE6fzyDEK79ukA5F5qcLCaWcZ+P34aQhdLFqCj1bjJpzL/d2QpKskawNE
	 S/KnXdysA74bA==
Date: Thu, 13 Feb 2025 19:35:18 -0800
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
Message-ID: <20250214033518.GA2771@sol.localdomain>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <Z66uH_aeKc7ubONg@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z66uH_aeKc7ubONg@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_193521_952382_81521F4A 
X-CRM114-Status: GOOD (  23.98  )
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

On Fri, Feb 14, 2025 at 10:44:47AM +0800, Herbert Xu wrote:
> On Wed, Feb 12, 2025 at 10:33:04PM -0800, Eric Biggers wrote:
> > 
> > I've already covered this extensively, but here we go again.  First there are
> > more users of shash than ahash in the kernel, since shash is much easier to use
> > and also a bit faster.  There is nothing storage specific about it.  You've
> > claimed that shash is deprecated, but that reflects a misunderstanding of what
> > users actually want and need.  Users want simple, fast, easy-to-use APIs.  Not
> > APIs that are optimized for an obsolete form of hardware offload and have
> > CPU-based crypto support bolted on as an afterthought.
> 
> The ahash interface was not designed for hardware offload, it's
> exactly the same as the skcipher interface which caters for all
> users.  The shash interface was a mistake, one which I've only
> come to realise after adding the corresponding lskcipher interface.

It absolutely is designed for an obsolete form of hardware offload.  Have you
ever tried actually using it?  Here's how to hash a buffer of data with shash:

	return crypto_shash_tfm_digest(tfm, data, size, out)

... and here's how to do it with the SHA-256 library, for what it's worth:

	sha256(data, size, out)

and here's how to do it with ahash:

	struct ahash_request *req;
	struct scatterlist sg;
	DECLARE_CRYPTO_WAIT(wait);
	int err;

	req = ahash_request_alloc(alg, GFP_KERNEL);
	if (!req)
		return -ENOMEM;

	sg_init_one(&sg, data, size);
	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
					CRYPTO_TFM_REQ_MAY_BACKLOG,
				   crypto_req_done, &wait);
	ahash_request_set_crypt(req, &sg, out, size);

	err = crypto_wait_req(crypto_ahash_digest(req), &wait);

	ahash_request_free(req);
	return err;

Hmm, I wonder which API users would rather use?

The extra complexity is from supporting an obsolete form of hardware offload.

Yes, skcipher and aead have the same problem, but that doesn't mean it is right.

> > Second, these days TLS and IPsec usually use AES-GCM, which is inherently
> > parallelizable so does not benefit from multibuffer crypto.  This is a major
> > difference between the AEADs and message digest algorithms in common use.  And
> > it happens that I recently did a lot of work to optimize AES-GCM on x86_64; see
> > my commits in v6.11 that made AES-GCM 2-3x as fast on VAES-capable CPUs.
> 
> Bravo to your efforts on improving GCM.  But that does not mean that
> GCM is not amenable to parallel processing.  While CTR itself is
> obviously already parallel, the GHASH algorithm can indeed benefit
> from parallel processing like any other hashing algorithm.

What?  GHASH is a polynomial hash function, so it is easily parallelizable.  If
you precompute N powers of the hash key then you can process N blocks in
parallel.  Check how the AES-GCM assembly code works; that's exactly what it
does.  This is fundamentally different from message digests like SHA-* where the
blocks have to be processed serially.

- Eric

