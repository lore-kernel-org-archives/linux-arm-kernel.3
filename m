Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7C8FED9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxZfwk4j7fdh1lLHSbjgNk4ZAr0h0feEpqn4ubU4naE=; b=uQrhmpPMcoWw4V7y9bzrytXojh
	lyPYRRh5XntDwoPBS2TPO7w7LIX7HjziOo0lzpbRd1kxPvrsZVvBmdrF25MEXtBGhB/tlKh4Y3Zu5
	LJs8jL8wDznhBF2Fl2GIPB+LlbS6IRxSWSc5BZffTaMkI13y5WIsSL5eC7mSrU8OFFl6oWGhhHms/
	XGYsRC8JkCvd0XOxphNV4RauBm1fNeGOdH0iuIpfZ6Molnxi1MFMQngCtDOHSGD52xRV/Bcly6xb2
	3C2bZyYrZLcbAnfJA+EhwwWkNwvuhgQ7gWNNWIzm8I51aUyWHsXIeTKksj/be4VmYPSh3ZlZz3q8I
	BRBSSSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WG8-00000006jTJ-2XEH;
	Tue, 17 Mar 2026 15:23:04 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WG7-00000006jSt-0tEp;
	Tue, 17 Mar 2026 15:23:03 +0000
Date: Tue, 17 Mar 2026 08:23:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64: Drop checks for
 CONFIG_KERNEL_MODE_NEON
Message-ID: <ablx17_Fw_CzCqSu@infradead.org>
References: <20260314175049.26931-1-ebiggers@kernel.org>
 <38a37b02-602a-42a4-8974-b8a6cd750c3e@app.fastmail.com>
 <ablpCtKCV5goM_AD@infradead.org>
 <ef71c58d-3950-474e-bddb-fc95f8d18b07@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef71c58d-3950-474e-bddb-fc95f8d18b07@app.fastmail.com>
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

On Tue, Mar 17, 2026 at 04:08:24PM +0100, Ard Biesheuvel wrote:
> 
> On Tue, 17 Mar 2026, at 15:45, Christoph Hellwig wrote:
> > On Tue, Mar 17, 2026 at 12:09:34PM +0100, Ard Biesheuvel wrote:
> >> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >> 
> >> Actually, we should just get rid of CONFIG_KERNEL_MODE_NEON entirely on arm64, although there is some code shared with ARM that would still need some checks. But anything that is arm64-only should never look at this at all.
> >
> > I'll also drop it from the XOR series.
> >
> 
> Ack - mind cc'ing me on the next revision?

Sure.

> 
> > Talking about which (sorry for highjacking this thread), arm32 and arm64
> > have completely different neon XOR implementations, where arm32 uses
> > #pragma GCC optimize "tree-vectorize" or clang auto-vectorization of
> > the generic C implementation, and arm64 uses intrinsics.  Is there any
> > chance those could share a single implementation?
> 
> If we're migrating the XOR arch code to live under lib (if that is what
> you are proposing),

That's what is happening right now:

https://lore.kernel.org/linux-raid/20260311115754.ca2206d1428c49c3bd6e93cf@linux-foundation.org/T/#t


