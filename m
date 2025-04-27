Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3673C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2RcUQv/8dBIN2L2LWxeQcaAIEeCjjfBUxKcWps9ai0=; b=xuRyD6xoBTYV0ExnDOY0q7xInG
	OoidLx3zGR/vgtyPU0KMDaxs6jeBtulRWcmpskliJLq4NAdRoJpMRpAAEGzGYAnMN7imApMgqIVzc
	VjThR236eq9CdV/O5gRRW/B68UEsrVOKbdfgLEpF5LFiW3rSiIbh3mcjhSwZjJwBFtbqlEEPMGTav
	m7wKnv/+F1zfCr9QLZkdRpPl3HsodWcm1Z8ZENTlbWxV78q1biOQi/LFUyrOQt/mryvIE6DADBF78
	kptNvlCX5WMzEdmVCXGmV5nbeWOXk18N4vXAllhkD+dGKe/yRa7z6j7ipAPtfNMrB9qMa/QgffWYD
	PphXk4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91p8-00000003aLX-0Mwt;
	Sun, 27 Apr 2025 13:13:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91nC-00000003aDb-41y6;
	Sun, 27 Apr 2025 13:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 078886116F;
	Sun, 27 Apr 2025 13:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8414C4CEE3;
	Sun, 27 Apr 2025 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745759493;
	bh=hIg9xiL1wTkWBQvd+WTVpN2UA7enXw1novSCVk6FraQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Js5eBBxoHlcS56/LWyr45u7eRowNxoCYA6Md7I33bPaPRQLs3baLIHPlyTp0csghf
	 mNCXTEbu1yNMtMOT7JTf854tXYRVvArrq3HZEnVUBQlFqylkwky2LSYaFxEK8/Kw5X
	 Z/AcD9AseJYp4rgJMRwQ8XY9rmHzUm+sI/ac4vuLvW0OU9Ii9N2xfO9Puzy+QkAVof
	 Nyn3ibUt23OszHmj1FWPHbibu4rE+VmW/6hBdidH2RcSqJWI7TquPP9TueEjIP/oSw
	 /d5OvCZ/JlLLJjOP3DLWAlgxyVxgFiRpBDxeOK061Pq27N2K0t8Z0HoPDa2VNsTeb+
	 FuI4gqQiU6ppA==
Date: Sun, 27 Apr 2025 06:11:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250427131138.GC1161@quark>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
 <aA4mAlozk3RvxvTe@gondor.apana.org.au>
 <20250427125641.GB1161@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427125641.GB1161@quark>
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

On Sun, Apr 27, 2025 at 05:56:43AM -0700, Eric Biggers wrote:
> On Sun, Apr 27, 2025 at 08:41:38PM +0800, Herbert Xu wrote:
> > On Sun, Apr 27, 2025 at 05:35:14AM -0700, Eric Biggers wrote:
> > >
> > > Well, barely a day and you've already ruined my patch series.  Now instead of a
> > > clean design where the crypto_shash API is built on top of the normal library
> > > API (sha256_update() etc.), there's now a special low-level API
> > > "sha256_choose_blocks()" just for shash that it's built on top of instead, for
> > > no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
> > > macro that doesn't work with size_t, and putting my name on your broken code
> > > that uses it.
> > 
> > Your design is unacceptable because you're forcing the partial block
> > handling on shash where it's not needed,
> 
> Excuse me?  It's the other way around.  In my version the partial block handling
> is only in the library, not shash.  In your version you've forced it into the
> shash layer, even though the library does it already.  I understand that you've
> added support for partial block handling to crypto/shash.c and you want to feel
> like your work is useful, but in this case it's not, since the libray has to
> handle arbitrary-length inputs anyway.
> 
> > just as you're forcing the hardirq support on everything.
> 
> If you want crypto_shash to warn on hardirq usage you should just put a
> WARN_ON(in_hardirq()) in crypto_shash_*(), which will actually achieve that.
> Not add a shash-specific non-hardirq-safe low-level API to the library that can
> silently corrupt random tasks' SIMD registers on production systems.

By the way, as I mentioned in my cover letter:

    For now the SHA-256 library is well-covered by the crypto_shash
    self-tests, but I plan to add a test for the library directly later.

But due to your gratuitous changes where crypto_shash is no longer built on top
of the normal SHA-256 library API, that's no longer the case.

So while I do still plan to add a SHA-256 library test anyway, I don't see the
reason for not also making crypto_shash just do the right thing.

- Eric

