Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0961CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 03:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rc0BQgcYMwktFIfCc+amXmngzIQoye0cjtheqjw53zQ=; b=gm7pKMZae3LpAzRPRZDsX5XZt/
	D/cKT4OR2J+hol8aleuPn1Z0Yopkb1c8izKKsoUleAxVjzteQfvv048RmcF5s9kB8bY3jd7xZyz85
	Z2kHmO716Wmj5Y7qVmQmM3Kn7ArWrGm2jtv9BI1WFdD24ZpHXL3gML6STYhIlkZC69M0dY37hZte/
	J+Hn56XWS/3uy6mV5Ol8cSWcE1yv4VbSkry3mFGMKG9JCQiVUVYYqvDILQVNKwSf+Hi6cplKQxan/
	68lgsLeB59u2+ZBBPXmOKbWacH4K6Sbmq7JQ+aoCbswbwg5+pABbkRvhmwFRtSXxDxaQEDAz8nkXT
	R7OnRVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjVN2-000000018QI-2ytY;
	Sun, 16 Feb 2025 03:31:04 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjVLY-000000018Em-1qFp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 03:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rc0BQgcYMwktFIfCc+amXmngzIQoye0cjtheqjw53zQ=; b=jYOUT/DNQz6ndVzPKDPcgy6BGS
	Sbrt/uk1tV1ZGFwl6P5x2Q0ZbtQ8hF6wdBbCCJVtZytfAdZhcm66YhQttvb2L0D6RFTl2ABbNRTKr
	PyewzxHJ2VUArIHg2dlw8DGS3maCYle5MQ5xZjzTLmB0eVGLkUE6WIAYlt2sCgAnS7zExJ7rxRQyz
	U8F6Ug5NkRI6vnr2vuCgI9vZERbyczYpL5ho2vbI74+Zg0pD3ctbwn7lnZwjZfrdnEZSG0e+RmSKe
	rSkCpeXURirWd+jIhugHpG0ydOLYDBkIsu9aTMFz5H3a9BHzmDR+NJMdg66akqLtLTXry4svUdCZx
	tgk088Yw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tjV8X-000gj6-2y;
	Sun, 16 Feb 2025 11:29:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 16 Feb 2025 11:29:26 +0800
Date: Sun, 16 Feb 2025 11:29:26 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, fsverity@lists.linux.dev,
	linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <Z7FblsbOQnJ7sYOA@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <20250215090412.46937c11@kernel.org>
 <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
 <20250216032616.GA90952@quark.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216032616.GA90952@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_192932_479355_4421E8D2 
X-CRM114-Status: GOOD (  14.33  )
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

On Sat, Feb 15, 2025 at 07:26:16PM -0800, Eric Biggers wrote:
>
> Well, the async fallback (using cryptd) occurs only when a kernel-mode FPU
> section in process context is interrupted by a hardirq and at the end of it a
> softirq also tries to use kernel-mode FPU.  It's generally a rare case but also
> a terrible implementation that is really bad for performance; this should never

It may not be rare if the kernel is busy doing bidirectional
TX/RX with crypto.  The process context will be the TX-side
encrypting while the softirq context will do RX-side decryption.

> have been implemented this way.  I am planning to fix it so that softirqs on x86

Sure but it's way better than falling back to the C implementation
on the RX-side.

> will always be able to use the FPU, like they can on some of the other arches
> like arm64 and riscv.

That's great news.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

