Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B77FCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzJo+v57ZxkLJuXuEu1oq4QEMvBv7yCM9SGUIid7XD0=; b=Cuxv7aY7jhfTwBSo3i9n+urZYE
	KKMxfQzgsdQcCb15Xwcxs3Dat58CII3yk23DoVsFUmb9ndHT6JLcTbBUXE8K3SkasKzhV2pmtD7NK
	DlG1b1wZ3P2Y2OkosIVp1Gu+WPrOMxCmOEsiUIu3rUsZeBb4f81AidTBQDRCGmh9iWrMKg2IryWcs
	Y18tTv1WPzwEhPhquG2bsqwcFMhwNueTBIW/mSHr1L6gVta+20N6I8RaZAW0JFQMJvcxyttwJ2Xaa
	Vr7T4GXEZQmDnoQdmmTjvjVnm5wXb1BCEmvEwDYPFSyhlaHz3rD0jwF3SpgZuw0m9f8LEa63Iqm8M
	cjJS0gVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC57-0000000DiPJ-1LMt;
	Tue, 06 Jan 2026 18:47:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC55-0000000DiPC-187l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52F8560008;
	Tue,  6 Jan 2026 18:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3363AC116C6;
	Tue,  6 Jan 2026 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767725218;
	bh=gYElRWi3F+sL6tiDQQ+z8/uhb9LB8qgdkYypeszrcW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKlX9NgULu+q8gtHunZBA7GCe3Cuw7IKxG5Lm1fQ1/6dv9KyDF1Ku8mKcBBcialdU
	 +e63dNWRREk4ZSAGRuQ4CVsIdZGiDP5hLmJZ0GH1MRJYYUYdcKFYrfYAQDMdIGFQfu
	 IolGL3EyKmgplZlcAIckRvAPFBo3xpeswQYFkUmPWSf9bFNlN99kCquXv+agQmXp5l
	 4jEyfF6bjeBEWEgT4wXdD8EVHFCKWFDYv1E0JdyrkwPc1WfVaQV/yC1zCW3S7luMl+
	 lrgs7Eca30ONhq506MIlmsIaZ6GrmPASXlplf1rOMxBnOWOyd0IVyYCje5PvawKh5M
	 pz8TTmp/m3Nyw==
Date: Tue, 6 Jan 2026 18:46:52 +0000
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, Ryan Houdek <Sonicadvance1@gmail.com>,
	Billy Laws <blaws05@gmail.com>
Subject: Re: [RFC PATCH v2 0/1] arch: arm64: Implement unaligned atomic
 emulation
Message-ID: <aV1YnOetDHhKe4hz@willie-the-truck>
References: <20251117160841.334224-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117160841.334224-1-andrealmeid@igalia.com>
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

Hi Andre,

On Mon, Nov 17, 2025 at 01:08:40PM -0300, André Almeida wrote:
> This patch proposes adding kernel-side emulation for unaligned atomic
> instructions on ARM64. This is intended for x86 emulators (like FEX)
> that struggle to effectively handle such operations in userspace alone.
> Such handling is required as x86 permits such unaligned accesses (albeit
> sometimes with a performance penalty as in the case of split-locks[1])
> but ARM64 does not and will raise a bus error.

As discussed at LPC, I'm not thrilled with the idea of emulating these
historical warts of x86 on arm64 and having to carry that code forward
forever. The architecture provides a bunch of helpful instructions for
emulating x86 code but for esoteric things like split-lock atomics, I
think we need to draw a line. After all, you can still buy an x86
machine if you want one and they tend to be cheaper and more reliable ;)

> User applications that wish to enable support for this can use the new
> pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`. Some optimizations and
> instructions were left for future revisions of this patchset.
> 
> Emulators like FEX attempt to emulate this in userspace, but with
> caveats in two areas:
> 
>  * Performance
> 
> It should first be noted that due to x86's TSO (total store order)
> memory model, ARM64 atomic instructions must be used for all memory
> accesses.

Just a nit on terminology because it's getting in the way a bit here and
I'm genuinely unsure as to what you're saying. The Arm architecture uses
"atomic instructions" to refer to read-modify-write instructions such as
CAS and SWP. You presumably don't need to use those for everything;
rather I assume you're using LDAPR for plain loads and STLR for plain
stores?

> This results in unaligned loads/stores being much more common
> than one would expect and the overhead of emulating them significantly
> impacting performance.

FEAT_LSE2 should solve this for LDAPR and STLR in the vast majority of
cases, no?

> For this common case of unaligned loads/stores, code backpatching is used
> in FEX to avoid repeated overhead from handling the same faulting access.
> This replaces faulting unaligned atomic ARM64 instructions with regular
> load/stores and memory barriers.

I'm assuming this is only the case on systems without FEAT_LSE2?

> This comes at a cost of introducing significant performance problems if a
> function like memcpy ends up being patched because it very infrequently
> happens to be used with unaligned memory. This is severe enough to make
> games like Mirror's Edge and Assassin's Creed: Origin unplayable without
> application-specific configuration.
> 
> Microbenchmarks[2] measure a 4x decrease in overhead with kernel-side
> handling compared to userspace, and this figure is currently even larger
> when FEX is ran under Wine. Such a dramatic decrease would make it
> reasonable for FEX to default to the no-backpatching path and provide
> consistent performance. 

I wonder if you can defer backpatching until you've got some idea about
the likelihood of the access being misaligned? Or is that what you mean
by "application-specific configuration"?

>  * Correctness:
> 
> x86 atomic accesses can cross 16-byte (LSE2) granules, but there is no
> ARM64 instruction that would allow for direct atomic emulation of this.

I'm assuming these are relatively rare and apply only to locked
instructions so don't, for example, occur in memcpy() as you mentioned
above?

> As such, a lock must be taken for correctness. While this is easy to
> emulate in userspace within a process, correct atomic cross-granule
> operations on shared memory mapped into multiple processes would require
> a lock shared between all FEX instances which cannot be implemented
> safely in userspace as is (robust futexes do not work here as they are
> under the control of the emulated x86 program). Note, this is a less
> coarse restriction than split locks on x86, which are only concerned
> with accesses crossing a 64 byte cacheline size.

Even in the kernel, I'm having a hard time to convince myself that a
global lock gives you correctness here because you're _not_ serialising
with concurrent aligned accesses that could still be conflicting with
the faulting accesses if mixed-size concurrency is in use.

I've struggled to come up with an example that goes wrong, but if we
imagine a 64-bit SWP that straddles a 16-byte boundary and is trying to
set each 32-bit half of a zero-initialised location to 2:

	SWP	(2, 2)

This will trap, but another CPU could concurrently execute a pair of
ordered, aligned 32-bit SWPs on each half, which will not trap:

	SWP	(1, _)	// Set the upper 32-bit word to 1
	DMB	ISH
	SWP	(_, 1)	// Set the lower 32-bit word to 1

My reading of the code is that:

  1. The 64-bit SWP reads upper = 0, lower = 0
  2. The 64-bit SWP writes upper to 2
  3. The first 32-bit SWP executes, setting upper to 1 and returning 2
  4. The second 32-bit SWP executes, setting lower to 1 and returning 0
  5. The 64-bit SWP fails to write lower as it is no longer zero and so
     returns (0, 1)

In which case, the value in memory is (1, 1) but the old value of (0, 1)
returned by the 64-bit SWP doesn't make sense in that case.

What did I miss?

I also notice that your patch doesn't implement support for CAS and I
worry that letting out partial updates from supposedly atomic stores
could cause additional issues there. A CAS that reports failure could
actually have mutated memory, which then feeds into the next iteration
of the CAS loop in userspace.

Anyway, my lack of understanding aside, this doesn't look like an ABI we
should be committing to on arm64.

Cheers,

Will

