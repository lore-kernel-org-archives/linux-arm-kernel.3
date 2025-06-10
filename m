Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C4C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijj/kgQ1/3fFIkkk9vUFgfYNo0mzKr6rXHhJ9w9nI50=; b=TRtedQx6z6wc1UdlNu3EOorXgE
	un3+QKENIXoi2awlVyq3cYIQGzBebcmCjlTXt1HYjJdrE/WNKuKaaXaZ9Zri18BZ8ELLFkwoZdLU2
	ks7nKGMLLXl4HF+bqR6Hz+CpcAhUfgLnu0zx80PT2D3gjHygmLjWxu1uMsz5pGo7wTzpH53Pwv9q9
	CvWRs/eGq+QPEtcMbGJWJgrGljmOz+NNVzLQQSutqEftuhZ1pnLlXz2Wl/33wgS4dgUuqIYfGy6mH
	skGJG8dAWFfaPTIewaw9fLclgG+7K4Nt3d/w7YP5c8UiWG62+MuAOHINLYHrW1Sv+KiCumQCfMNEN
	OAUxoUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lQ-00000008F2n-1uGC;
	Tue, 10 Jun 2025 22:48:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2wa-00000007erz-2L33;
	Tue, 10 Jun 2025 17:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 041FA614AC;
	Tue, 10 Jun 2025 17:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D748C4CEED;
	Tue, 10 Jun 2025 17:39:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TLokPYgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1749577164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijj/kgQ1/3fFIkkk9vUFgfYNo0mzKr6rXHhJ9w9nI50=;
	b=TLokPYgU2JOEdQndAvw9+JV28T5jssbviJD7hlMW/fJJWgwg7N1xBB6JMMINtsdD2jc1wR
	9vxPjpyhcdGVqfZKknbrL3tvYcbtlmFpSutoV8Knv518B4pawM2wjrJYa0svP2Pstv+4eW
	hu9USEEBUy1uuH8Mnd+AajCHjJgPyQQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dec6911f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Jun 2025 17:39:24 +0000 (UTC)
Date: Tue, 10 Jun 2025 11:39:22 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <aEhtyvBajGE80_2Z@zx2c4.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aETPdvg8qXv18MDu@zx2c4.com>
 <20250608234817.GG1259@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250608234817.GG1259@sol>
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

On Sun, Jun 08, 2025 at 04:48:17PM -0700, Eric Biggers wrote:
> On Sat, Jun 07, 2025 at 05:47:02PM -0600, Jason A. Donenfeld wrote:
> > On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> > > Having arch-specific code outside arch/ was somewhat controversial when
> > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > warranted.  It's better from a technical perspective, as it enables the
> > > improvements mentioned above.  This model is already successfully used
> > > in other places in the kernel such as lib/raid6/.  The community of each
> > > architecture still remains free to work on the code, even if it's not in
> > > arch/.  At the time there was also a desire to put the library code in
> > > the same files as the old-school crypto API, but that was a mistake; now
> > > that the library is separate, that's no longer a constraint either.
> > 
> > I can't express how happy I am to see this revived. It's clearly the
> > right way forward and makes it a lot simpler for us to dispatch to
> > various arch implementations and also is organizationally simpler.
> > 
> > Jason
> 
> Thanks!  Can I turn that into an Acked-by?

Took me a little while longer to fully review it. Sure,

    Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Side note: I wonder about eventually turning some of the static branches
into static calls.

Jason

