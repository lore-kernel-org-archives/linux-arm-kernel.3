Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF944C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtsQ/145ecqP7566i0rTsemqZ2lQmlMI7oR3NBPs2bA=; b=E1dPPCgcactURAXPzO0gpOHHXq
	nti7+Hj21f4Wuh0uQhGYHqoVUfO02YSHC9IOsYQMksvSc63MBdPHBBhm3AYhMog0nV0/3/WdL3Fkm
	rREPlsPktH8K2L1LROE+cF3NEEEriIOgCbA61fQmBLT2UN7nGJHCudkz1k4iYQ4Dl5vmLXwvwlUsI
	4jV6q2xDH8FQ7K7vAQNi9IE+zU4Mzlh/0RYJ5CIhPXHcD9oWkQRU1fdtCOWvUWMhJ6Zq+IMUkBA5N
	zPhOTGV+rJ/CYREiTk/1bNHpJVoe0ktoVlFtYgtPRgvxVXCfffyqbvOHjtM+BSCbTCeXtNPBbDSpn
	Ek4YFX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbv7-00000008EpJ-2fGJ;
	Tue, 17 Jun 2025 19:24:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbst-00000008EWS-2EPs;
	Tue, 17 Jun 2025 19:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87D7EA51C03;
	Tue, 17 Jun 2025 19:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA501C4CEE3;
	Tue, 17 Jun 2025 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750188134;
	bh=DIeweH4tJgRpIMI6A93lfPzWuHCR0d9IDLxqeAGEsJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axo6SFaYaKEZtTtcZaKVei2M5O0lKIXRPx4u/MNnAOO+0bF2HOtITPs3y7H0ALP4g
	 KKK04dXoQRHYOgBrwNnMdSyZhnWbSk/GagXcltvVYEn6s0k7veB4uGMXHXE0/A0gkv
	 D/tZbxEYdExfyODv0Ie0mWcHFrKzFSNgt4yu1FRZj9AeiKuZzRcdrojpBJv5fIsnGr
	 IPNAszMnDgJtoFmYVULSx4B/oC7/P/yN5TuUbsv9bhjHsDMcMCDX8r+PvYGhgeNLAv
	 ESPGFAZuTwnWs8tzMkLgW+I1oOtKdoGuqYwO51+lcR2vsGfO0kPfoaBjSRUPHTT2So
	 t99/eHv/dZ9NA==
Date: Tue, 17 Jun 2025 19:22:12 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617192212.GA1365424@google.com>
References: <20250616014019.415791-1-ebiggers@kernel.org>
 <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_122215_708654_BA44A4C0 
X-CRM114-Status: GOOD (  29.68  )
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

On Tue, Jun 17, 2025 at 11:29:15AM -0700, Linus Torvalds wrote:
> On Mon, 16 Jun 2025 at 23:05, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > An additional note on testing: [..]
> 
> Talking about testing - when adding test scripts, can you do it as a
> separate thing entirely - either before or after?
> 
> As it is, this code movement is hard to judge just because the stats
> are all messed up with new tests:
> 
>  77 files changed, 4012 insertions(+), 1756 deletions(-)
> 
> that's 2k+ new lines of code that pretty much entirely hides the
> question of "did this code movement result in a simpler / same / more
> complex end result".
> 
> So in general, I'd really prefer big re-organizations to be *separate*
> from new code changes.
> 
> It's just a pain to review renaming when it's mixed up with other
> changes - whether renaming variables or whole files.
> 
> And that's as true on an individual commit level (we try to avoid
> renaming things *and* making other changes in one go) as it is on a
> pull request level.
> 
> If I see a pull request that only adds new tests, it's a no-brainer.
> 
> If I see a pull request that only re-organizes the code and the
> diffstat just just renames with some small updates for new locations,
> it's a no-brainer.
> 
> If I see a pull request that does both, it's a pain in the arse,
> because then I need to start to look into individual commits and go
> "which does what".

The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
has a negative diffstat once you subtract them.

(And most of the positive diffstat in the tests is generated test vectors.  The
rest is mostly code that I'll reuse later in tests for other hash functions; it
just gets blamed to this one because it's the first one.)

I'd really prefer to keep testing as a first-class citizen.  Tests should be
contributed along with the code itself.

And the point of this patchset is not just "code movement", but rather adding a
library API, including documentation *and tests*.

Later, I'll be converting various in-kernel users to use that API, just as I've
been doing for crc32 and sha256.  It's already been shown that the
"librarification" works well and is much simpler than the old-school Crypto API.

If you really want patches 4-5 in a separate patchset that's based on this one,
I can do that.  Ultimately, the result would be the same.

I think your request for there to be a separate "tests" pull request is a
non-starter, though.  That would imply separate git trees, and we then wouldn't
be able to land tests at the same time as the code itself.

- Eric

