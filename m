Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7709CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krJe8yV8IQ5q17uTwD2a+k61avLmokiZ6lpNbWzhrlc=; b=EOWZKkfGRVukKJALMrtukdmVpB
	WyHcur7FU4zGxTitfqtKMaAlnRccIDdpIfIA+/a9Zr/pJtt6OnX1xe4gamaVhWiWfHweXajrfwawI
	qIZXtar61Yzbi712avou5j3r8qSxJ0TMEZJKDAJIVFTKG1P5ElDj/YzJx4PSGl2uE2n3BwuNjTelp
	jdczB2wcvazKS5/VdINWK7qJrH6cPXE7fE2e30TYBoUOtweFnZahrv8S/InOGEejobfWxx5nH4I90
	8Qpp4Z7JzYTjK9j/1/CuAFPOa0rkEebRR2gnggUSvUra6fMSlXnFE/LZf4th59IxbUuXgtSLcIv84
	qbQ/fvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinlu-0000000Dehe-3B9x;
	Fri, 14 Feb 2025 04:57:50 +0000
Received: from [144.6.53.87] (helo=abb.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinkS-0000000DeMc-0NY7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=krJe8yV8IQ5q17uTwD2a+k61avLmokiZ6lpNbWzhrlc=; b=c1/zVKRkjdwM1WpA0c5enod/bf
	+yxkYSufqwlKCAjaDrBf0ozX89Gb0qwUbIhRMpyaTch+lg/+KPTbNVtpf6kDGqT3xsGffRue7wEdo
	CAaz8vRA84F04vnFZnZnPQ7IQxIXLl6q7YWpMaLFOMJ4dbGPhfabx1V+D5A/mjD7itFRk7kMCpCGV
	KgwDk+WjgYS8BPgxrRHEoUAl5uvbI2LN7m62lWq8uN3RxdqTzR1mPo9RM8wW/U1yjyHQvt39Qz28z
	9LVCuz3yoqwsiRs1EDZy8O5gsTZAFpDb3lQZd8Cv0NpfWbw2yAWlNm5NNHfW6l0kHXBkIyiJ/mKwn
	ziT7ok3Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tinXO-000EO9-0Y;
	Fri, 14 Feb 2025 12:56:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Feb 2025 12:56:10 +0800
Date: Fri, 14 Feb 2025 12:56:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
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
Message-ID: <Z67M6iSoMyvGwkAF@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <Z66uH_aeKc7ubONg@gondor.apana.org.au>
 <20250214033518.GA2771@sol.localdomain>
 <Z669mxPsSpej6K6K@gondor.apana.org.au>
 <20250214042951.GB2771@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214042951.GB2771@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_205620_131389_7C14DB2B 
X-CRM114-Status: GOOD (  16.11  )
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

On Thu, Feb 13, 2025 at 08:29:51PM -0800, Eric Biggers wrote:
>
> That doesn't actually exist, and your code snippet is also buggy (undefined
> behavior) because it never sets the tfm pointer in the ahash_request.  So this

Well thanks for pointing out that deficiency.  It would be good
to be able to set the tfm in the macro, something like:

#define SYNC_AHASH_REQUEST_ON_STACK(name, _tfm) \
	char __##name##_desc[sizeof(struct ahash_request) + \
			     MAX_SYNC_AHASH_REQSIZE \
			    ] CRYPTO_MINALIGN_ATTR; \
	struct ahash_request *name = (((struct ahash_request *)__##name##_desc)->base.tfm = crypto_sync_ahash_tfm((_tfm)), (void *)__##name##_desc)

> just shows that you still can't use your own proposed APIs correctly because
> they're still too complex.  Yes the virt address support would be an improvement
> on current ahash, but it would still be bolted onto an interface that wasn't
> designed for it.  There would still be the weirdness of having to initialize so
> many unnecessary fields in the request, and having "synchronous asynchronous
> hashes" which is always a fun one to try to explain to people.  The shash and
> lib/crypto/ interfaces are much better as they do not have these problems.

I'm more than happy to rename ahash to hash.  The only reason
it was called ahash is to distinguish it from shash, which will
no longer be necessary.

> never use exactly the same API anyway, just similar ones.  And FWIW, zswap is
> synchronous, so yet again all the weird async stuff just gets in the way.

I think you're again conflating two different concepts.  Yes
zswap/iaa are sleepable, but they're not synchronous.  This comes
into play because iaa is also useable by IPsec, which is most
certainly not sleepable.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

