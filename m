Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F305EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65T4rBQvy6mFilnie1q3glh+nsrM26bK761iT5MKkEQ=; b=rJKAA+cKhSkK2QyXPMTmZN8EFS
	uLNJLOJFh24/ydEmtGGD7B9cgMElFSzs4wIEdmpUEwtq6QV+gQneAwzXXGQGieckeAn6xluGgPpxq
	v+UrCq7i1p7YSkGgPzNWjjMH5ORhuxDr2dJie0SR9qQmWNtZ6ERcamqxhsGyckrVV9or1prKostzw
	OVDenYU6iP6rRYRJVlgspHlXLu9VirfiJd1iiIg0AaXwXdno+nBObeQI/8GduGlwcFgobjpInyDyA
	12PEW/inwz/aL1RxK0Z9Mi/+yU/xalO4YPWJtzr1aTt0bDsbPijEMV19ssELja+B/8PwOyYznc3lC
	eVlLowEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilzO-0000000DRA4-2U5P;
	Fri, 14 Feb 2025 03:03:38 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilhH-0000000DOMD-3MoV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=65T4rBQvy6mFilnie1q3glh+nsrM26bK761iT5MKkEQ=; b=crG3z6NxOhqIo4edos2ddK19x9
	hWQSi3nAdhK010ZkcRwyeT/b7++m63S5YNZcODozEpBJOgP/hasAC3UwlWnFjWlOcuxZl6tHYs4l6
	6CdnKwqrBKWVhX/71+itsWvFCZPIi5xG1gs60s6n4iM2+RSM+EG2zasTj5Py8FPoAqUifwAFUeSF7
	jz3SIn2+ft0+9dsPngX+XYAY40kD7KeiEKr2GMLKn4zN7UML+XlDViVY9nEWPOxDqUIKfr4y2IiG8
	uHyVA8/XvOed0PTCNxcEp+sHeenwZAK2TFyGrWhXuNWJe+/SMmo5c/8xDxp+RWJ+TWkWRU6yqFsJt
	i0IQW4xQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tilUE-000DGZ-2e;
	Fri, 14 Feb 2025 10:44:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Feb 2025 10:44:47 +0800
Date: Fri, 14 Feb 2025 10:44:47 +0800
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
Message-ID: <Z66uH_aeKc7ubONg@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213063304.GA11664@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_184455_838595_D1B959D7 
X-CRM114-Status: GOOD (  13.29  )
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

On Wed, Feb 12, 2025 at 10:33:04PM -0800, Eric Biggers wrote:
> 
> I've already covered this extensively, but here we go again.  First there are
> more users of shash than ahash in the kernel, since shash is much easier to use
> and also a bit faster.  There is nothing storage specific about it.  You've
> claimed that shash is deprecated, but that reflects a misunderstanding of what
> users actually want and need.  Users want simple, fast, easy-to-use APIs.  Not
> APIs that are optimized for an obsolete form of hardware offload and have
> CPU-based crypto support bolted on as an afterthought.

The ahash interface was not designed for hardware offload, it's
exactly the same as the skcipher interface which caters for all
users.  The shash interface was a mistake, one which I've only
come to realise after adding the corresponding lskcipher interface.


> Second, these days TLS and IPsec usually use AES-GCM, which is inherently
> parallelizable so does not benefit from multibuffer crypto.  This is a major
> difference between the AEADs and message digest algorithms in common use.  And
> it happens that I recently did a lot of work to optimize AES-GCM on x86_64; see
> my commits in v6.11 that made AES-GCM 2-3x as fast on VAES-capable CPUs.

Bravo to your efforts on improving GCM.  But that does not mean that
GCM is not amenable to parallel processing.  While CTR itself is
obviously already parallel, the GHASH algorithm can indeed benefit
from parallel processing like any other hashing algorithm.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

