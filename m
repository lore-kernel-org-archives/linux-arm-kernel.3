Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E791ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 01:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9LFBu3yJsDQ69TLBDzRvOENcK1uacHJ+6beUmMVpe8=; b=IjHNCtThjleVMdiZbEwk5vRbxU
	OSI70/9hWvxXdDF2lSuRbyWXwFPouxTHnsTbFZg0e45/0DY7SH+aIBVDHFX83gJKVKq2pUIz4d5PC
	w16+4PSpyHm4KJJkLx9VP9SmlbcDhGRvpzvss2WCNjDjQOJf/R45VnXpTIg/BvgkfaVtJBuSUQB9y
	BU4r2cSYdccAobBa6U/PBXr8U0CdNkq1C3Z7+Kk0tb69wF0cWwqQ0uOg5/HzNP/PyhspzUsjcaiVq
	RaUcJWI2XC4gKuTVsygtgaJwqD93eDs+vyLJxJ8GTCL5aLva2f1PfMVH1Dj96SezMZO6acjJ1Ho4M
	DSADGwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjC1-00000004s01-1b7K;
	Wed, 30 Sep 2026 01:33:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjC0-00000004rzu-1k3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 01:33:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D245343CED;
	Wed, 30 Sep 2026 01:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9C71F000FF;
	Wed, 30 Sep 2026 01:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790731987;
	bh=E9LFBu3yJsDQ69TLBDzRvOENcK1uacHJ+6beUmMVpe8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JM+sYz85EuQ1Pc/ToqHwjyyrWQ5qhidcHK9+vHBv+X7ngHQWkQZRKjoh+Wr8soW/w
	 NTuJWuYafs2kVosOh4Y7o39wnniNajmM8M74eKQQHwVLyCPiFGZj+O88KRg8n0Qd4L
	 LZM3KNyJcsj772lBhwVM54vOk1DJZtO46jwJQhnHNApkEQY6PtqjiphyIkaGpcibbE
	 3193lTulW2YDMNQfbygaldH06RuZOju+p92y7soxpbWLHiI+u+/ePHRVnThchZuYm4
	 lD4kvzzptU1HIMytqiANY1luTHfm0qLMV0qI2KH5aLz4Vb2ueJIFwny9NW18+N0TdH
	 mZoHF4G4UzYxA==
Date: Tue, 29 Sep 2026 18:33:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Biggers
 <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Marco
 Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20260929183306.24a26c74@kernel.org>
In-Reply-To: <20260927131838.6774-1-demyansh@gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 27 Sep 2026 15:17:56 +0200 Demian Shulhan wrote:
> arm64 currently uses the generic csum_partial_copy_nocheck(), which
> performs memcpy() followed by a second pass for csum_partial(). This
> double pass exerts unnecessary pressure on the L1 cache.
> 
> Replace it with a single-pass implementation. The new implementation
> provides a general-purpose register path for short buffers and atomic
> contexts, and a kernel-mode NEON path for lengths >= 1024 bytes.
> 
> Measured in-kernel on an Ampere Altra (Neoverse-N1):
> - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
>   4096 bytes.
> On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> 1.6-2.4x above. No length or alignment regresses on either
> microarchitecture.
> 
> Patch 1 implements the fused routines and the dispatcher.
> Patch 2 adds KUnit test coverage for the new API and internal paths.
> 
> Tested: in-kernel benchmark module on Neoverse-N1 with both
> implementations cross-checked (0 mismatches); KUnit suite under QEMU
> (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> testing of both routines against a naive reference with PROT_NONE guard
> pages, gcc 13 and clang 18 W=1 builds, checkpatch --strict.
> 
NIPA CI flagged a regression from this patch: the new "checksum" KUnit
suite fails on the x86-64 test kernel (ARCH=x86_64, qemu). Specifically:

  test_csum_copy_small_all_alignments  (len=0, src_off=0, dst_off=0)
  test_csum_copy_patterns              (len=1, src_off=0, dst_off=0)
  test_csum_copy_zero_len

All three failures involve a zero-length (or very short) copy. Digging
into it, x86-64's csum_partial_copy_generic() (arch/x86/lib/csum-copy_64.S)
seeds its accumulator with -1 (0xffffffff) rather than 0:

    movl  $-1, %eax
    ...
    cmpl  $8, %ecx
    jb    .Lshort

For len == 0 (and other very short lengths that never execute an
add/adc against the seed) it returns that -1 unmodified, which folds to
0. The naive reference used by the new tests, and csum_partial()'s own
convention for an empty input, instead treat the "empty checksum" as raw
sum 0, which folds to 0xffff. So the new tests' expectations don't match
the pre-existing x86-64 assembly implementation for these edge cases.

It looks like the tests were validated against the new arm64
implementation and against memcpy()+csum_partial() under QEMU on arm64,
but not run against x86-64's existing csum_partial_copy_nocheck()
implementation, which is what our CI kunit runner builds by default.

Could you take a look at either:
  - adjusting the zero/short-length expectations in the new test to
    match the existing (documented?) x86-64 behavior, or
  - treating this as a real x86-64 bug and fixing
    csum_partial_copy_generic()'s handling of very short lengths,

whichever is judged correct? Happy to share the full kunit log if useful.

