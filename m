Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttQ9IlSas/7byHbl3N830DTSnlGxfWvdLVjZQAWvIdk=; b=y66xf6htVMlhlzZfbNgV5kFwAa
	DE0BIs7pd17kD+NBfOl9zZ5Il+kQVhKBK8ZlNIqVLQumJYdjd8d7YRLEzt4YvpZJu80c7uOReIxdu
	26B6zQHZuO/gAA9jFXIMvZ4UMkOhX+A4M/a4l2OVGCkJAu2Trs8Nz0SiLLDwxYE7uuQKYKspf7S/M
	CjHJKeKVPTSN80qpTGW2z7vmjbaRGAHBI3ZLVbbzXfnMH6r2UKcrMhrlCdznz8wZMgZ43VEZ6/MfK
	3CHLey6SL0V1bWnNLXRGuIPgJfk2a2V0N2Q5l+/tw+qXjCqNbRJGH39KWqrWjF3KNUva4IxnAZNL4
	gN8c7tOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLi2-0000000BnMm-3w2t;
	Thu, 03 Jul 2025 15:18:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXK0H-0000000BUsS-0nl8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9B7E45AE9;
	Thu,  3 Jul 2025 13:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7F2C4CEF0;
	Thu,  3 Jul 2025 13:29:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jKOzT2lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1751549364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttQ9IlSas/7byHbl3N830DTSnlGxfWvdLVjZQAWvIdk=;
	b=jKOzT2lb2+tzjr/h7XdTM6pY64vKrZT+NyVEfAjhWGFUqRwxcaTHGJG7y2sxpY2y6iQ8bo
	XokFr/A5k9b/+tlJZt+UyTwpaq/Ff/5lpia1H9WzWV8b7+avnJ4CLcb8mg57R0/vlS44se
	0Ah1gTu1dh32SLD8z1M8TXiwfjwdL2E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d211acee (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 3 Jul 2025 13:29:24 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:29:21 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Gu Bowen <gubowen5@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Message-ID: <aGaFsaUOuNd1xs8m@zx2c4.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <aGaCTOJ30KNPOBIC@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGaCTOJ30KNPOBIC@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_062929_291014_AD9491BD 
X-CRM114-Status: GOOD (  30.79  )
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

On Thu, Jul 03, 2025 at 03:14:52PM +0200, Jason A. Donenfeld wrote:
> Hi,
> 
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> > To reintroduce the sm2 algorithm, the patch set did the following:
> >  - Reintroduce the mpi library based on libgcrypt.
> >  - Reintroduce ec implementation to MPI library.
> >  - Rework sm2 algorithm.
> >  - Support verification of X.509 certificates.
> > 
> > Gu Bowen (4):
> >   Revert "Revert "lib/mpi: Extend the MPI library""
> >   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
> >   crypto/sm2: Rework sm2 alg with sig_alg backend
> >   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
> 
> I am less than enthusiastic about this. Firstly, I'm kind of biased
> against the whole "national flag algorithms" thing. But I don't know how
> much weight that argument will have here. More importantly, however,
> implementing this atop MPI sounds very bad. The more MPI we can get rid
> of, the better.
> 
> Is MPI constant time? Usually the good way to implement EC algorithms
> like this is to very carefully work out constant time (and fast!) field
> arithmetic routines, verify their correctness, and then implement your
> ECC atop that. At this point, there's *lots* of work out there on doing
> fast verified ECC and a bunch of different frameworks for producing good
> implementations. There are also other implementations out there you
> could look at that people have presumably studied a lot. This is old
> news. (In 3 minutes of scrolling around, I noticed that
> count_leading_zeros() on a value is used as a loop index, for example.
> Maybe fine, maybe not, I dunno; this stuff requires analysis.)
> 
> On the other hand, maybe you don't care because you only implement
> verification, not signing, so all info is public? If so, the fact that
> you don't care about CT should probably be made pretty visible. But
> either way, you should still be concerned with having an actually good &
> correct implementation of which you feel strongly about the correctness.
> 
> Secondly, the MPI stuff you're proposing here adds a 25519 and 448
> implementation, and support for weierstrauss, montgomery, and edwards,
> and... surely you don't need all of this for SM-2. Why add all this
> unused code? Presumably because you don't really understand or "own" all
> of the code that you're proposing to add. And that gives me a lot of
> hesitation, because somebody is going to have to maintain this, and if
> the person sending patches with it isn't fully on top of it, we're not
> off to a good start.
> 
> Lastly, just to nip in the bud the argument, "but weierstrauss is all
> the same, so why not just have one library to do all possible
> weierstrauss curves?" -- the fact that this series reintroduces the
> removed "generic EC library" indicates there's actually not another user
> of it, even before we get into questions of whether it's a good idea.

I went looking for reference implementations and came across this
"GmSSL" project and located:

https://github.com/guanzhi/GmSSL/blob/master/src/sm2_sign.c#L271
which uses some routines from
https://github.com/guanzhi/GmSSL/blob/master/src/sm2_z256.c

I have no idea what the deal actually is here -- is this any good? has
anybody looked at it? is it a random github? -- but it certainly
_resembles_ something more comfortable than the MPI code. Who knows, it
could be terrible, but you get the idea.

Jason

