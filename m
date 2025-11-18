Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0672CEE342
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOcOyrt7B3d6M/YJeQqipiAsK0U27c1TIdKy6sm+Bow=; b=EWPg+Z2ubKVjMHJ3oMn3tANrtE
	cytcnNrkLnipGSQmToxOHh26E7gbtZ5Io7dduAvqbr6jm04FLjQkssbB/l4RT0D9ehRnqAV705vn+
	tBW8C0d26j72XqcSOu/RvfQlecf0gT2GI5ozEpGk9LqMO0jkFJ2KiEU1MvrjClxROWzW9oJqDqMNB
	UXDSY1SsqtwC/YUA3j+Kh3mjWiNtWwwwaZV9he1HN131v5S5WLYWn2yp1g0zmds4303E68MHJYVgX
	cNyroQejt1+gCi1qQHZ8Y9Bin9XYDZPq/iO7NokXeCjC1l+FZzqWFGr28nTlEvEcWknj89BBiPhk6
	PgxVzF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPIf-00000000q6A-30hK;
	Tue, 18 Nov 2025 17:15:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPId-00000000q3A-3Tqe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 164E4443F5;
	Tue, 18 Nov 2025 17:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BF3C4CEF1;
	Tue, 18 Nov 2025 17:15:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YfKZxk8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1763486121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOcOyrt7B3d6M/YJeQqipiAsK0U27c1TIdKy6sm+Bow=;
	b=YfKZxk8xKb6bVagqRNxtq+ac/O7JjFfKz0zIS9AyHrWzdMxp37QmwGa29OK0B/9KCuFRAM
	zmk1FkQFYnkk3XIzyjKbirpQt6s0/IAtDq8UOF923rej4SYPaUh1vbM0yNoRNHnDcCljvX
	eBnf9l881UVtObkjMzdZzSYNmXE+Y/s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69c9bda7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 18 Nov 2025 17:15:20 +0000 (UTC)
Date: Tue, 18 Nov 2025 18:15:17 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <aRyppb8PCxFKVphr@zx2c4.com>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091527_909894_FAEC60A8 
X-CRM114-Status: GOOD (  25.19  )
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

On Mon, Nov 17, 2025 at 05:47:05PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 17, 2025, at 12:31, Ryan Roberts wrote:
> > On 17/11/2025 11:30, Ryan Roberts wrote:
> >> Hi All,
> >> 
> >> Over the last few years we had a few complaints that syscall performance on
> >> arm64 is slower than x86. Most recently, it was observed that a certain Java
> >> benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
> >> get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
> >> ideas about how performance could be improved.
> 
> 
> >> I believe this helps the mean latency significantly without sacrificing any
> >> strength. But it doesn't reduce the tail latency because we still have to call
> >> into the crng eventually.
> >> 
> >> So here's another idea: Could we use siphash to generate some random bits? We
> >> would generate the secret key at boot using the crng. Then generate a 64 bit
> >> siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
> >> new hash). As long as the key remains secret, the hash is unpredictable.
> >> (perhaps we don't even need the timer value). For every hash we get 64 bits, so
> >> that would last for 10 syscalls at 6 bits per call. So we would still have to
> >> call siphash every 10 syscalls, so there would still be a tail, but from my
> >> experiements, it's much less than the crng:
> 
> IIRC, Jason argued against creating another type of prng inside of the
> kernel for a special purpose. 

Yes indeed... I'm really not a fan of adding bespoke crypto willynilly
like that. Let's make get_random_u*() faster. If you're finding that the
issue with it is the locking, and that you're calling this from irq
context anyway, then your proposal (if I read this discussion correctly)
to add a raw_get_random_u*() seems like it could be sensible. Those
functions are generated via macro anyway, so it wouldn't be too much to
add the raw overloads. Feel free to send a patch to my random.git tree
if you'd like to give that a try.

Jason

