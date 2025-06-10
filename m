Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A1C71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GotRg1Si1hTKaYuqrLlayWjjPnDKXporodQ26epGM9U=; b=yqHBenCrfdSCJQUw7IpNno3F9g
	DxhNKMV15ndHp5ypizZl5wUzeVHBzj6QPyMVDdOcsmQWrFTJ6hlmF3wI/X+ooOEw8rYgUqugPb+wr
	0W/DsRfMNo4XLki/VqRPlLVSE6jk8JaSEi+EZiP9r5lCX48jRmfFcGhksH0FeFirlih2q4zyAB+YK
	bLUr/Ju312DxRkBt3v7Q7QeBf6o8ubsft8ti3uc+RJUaYEblk2Zge20rvr4E/lBjc01p1DKCJr5mu
	jMA/6jWnqmQnpLl77VdNnClXSLjal1UYFeT7pii1Q1Sj9eSbUkploZZtGwkYKycPDIsfSIIbqkBJl
	EfoQN1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mI-00000008GaR-2O2c;
	Tue, 10 Jun 2025 22:49:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Oe-00000007tZ2-3xz8;
	Tue, 10 Jun 2025 19:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9C5644B79;
	Tue, 10 Jun 2025 19:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FAEC4CEED;
	Tue, 10 Jun 2025 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582752;
	bh=eJzXTcGjqeHES133w/mCLelMBBcBENx890a5ygHX1H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VaI2+LQhuUUCHinnXIKNJGDX1SFqmIEkgM49ZG9mFtgdSJtyidxE5kSPaTUdtIRoe
	 x8gwG8h5JFpcv2x49bFujV90PS+vJ0dv/ZdkpuflWTUErcb97YgGQv2W6l9qVPbl16
	 v8SyhbEe0m3HO6534SqykjGShxll+Ne/4t8f1iJYheRExnhSX55A4hNPQKnkRcYq5L
	 hc0Tmlxcb6hRLqfqF7Unr6UlRwwPll4NW5PiZ7zHf35KF4TOdiyOcT86XrweAAiuH8
	 NHMgbbCpwoQbMy2vS7ZoKum77mLaoScoDb3mUTDNNDNTl+qp1ZRyBmI7CkispOKzd9
	 LnPbDInTrzhvw==
Date: Tue, 10 Jun 2025 12:12:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250610191208.GD1649@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aETPdvg8qXv18MDu@zx2c4.com>
 <20250608234817.GG1259@sol>
 <aEhtyvBajGE80_2Z@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEhtyvBajGE80_2Z@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_121233_025485_5A4F7F01 
X-CRM114-Status: GOOD (  31.01  )
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

On Tue, Jun 10, 2025 at 11:39:22AM -0600, Jason A. Donenfeld wrote:
> On Sun, Jun 08, 2025 at 04:48:17PM -0700, Eric Biggers wrote:
> > On Sat, Jun 07, 2025 at 05:47:02PM -0600, Jason A. Donenfeld wrote:
> > > On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> > > > Having arch-specific code outside arch/ was somewhat controversial when
> > > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > > warranted.  It's better from a technical perspective, as it enables the
> > > > improvements mentioned above.  This model is already successfully used
> > > > in other places in the kernel such as lib/raid6/.  The community of each
> > > > architecture still remains free to work on the code, even if it's not in
> > > > arch/.  At the time there was also a desire to put the library code in
> > > > the same files as the old-school crypto API, but that was a mistake; now
> > > > that the library is separate, that's no longer a constraint either.
> > > 
> > > I can't express how happy I am to see this revived. It's clearly the
> > > right way forward and makes it a lot simpler for us to dispatch to
> > > various arch implementations and also is organizationally simpler.
> > > 
> > > Jason
> > 
> > Thanks!  Can I turn that into an Acked-by?
> 
> Took me a little while longer to fully review it. Sure,
> 
>     Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Side note: I wonder about eventually turning some of the static branches
> into static calls.

Yes, Linus was wondering the same thing earlier.  It does run into a couple
issues.  First, only x86 and powerpc implement static_call properly; everywhere
else it's just an indirect call.  Second, there's often some code shared above
the level at which we'd like to do the dispatch.  For example, consider crc32_le
on x86.  If we expand the CRC_PCLMUL macro and inline crc32_le_arch and
crc32_le_base as the compiler does, crc32_le ends up as:

    u32 crc32_le(u32 crc, const u8 *p, size_t len)
    {
            if (len >= 16 && static_branch_likely(&have_pclmulqdq) &&
                crypto_simd_usable()) {
                    const void *consts_ptr;

                    consts_ptr = crc32_lsb_0xedb88320_consts.fold_across_128_bits_consts;
                    kernel_fpu_begin();
                    crc = static_call(crc32_lsb_pclmul)(crc, p, len, consts_ptr);
                    kernel_fpu_end();
                    return crc;
            }
            while (len--)
                    crc = (crc >> 8) ^ crc32table_le[(crc & 255) ^ *p++];
            return crc;
    }

The existing static_call selects between 3 different assembly functions, all of
which require a kernel-mode FPU section and only support len >= 16.

We could instead unconditionally do a static_call upon entry to the function,
with 4 possible targets.  But then we'd have to duplicate the kernel FPU
begin/end sequence in 3 different functions.  Also, it would add an extra
function call for the case where 'len < 16', which is a common case and is
exactly the case where per-call overhead matters the most.

However, if we could actually inline the static call into the *callers* of
crc32_le(), that would make it more worthwhile.  I'm not sure that's possible,
though, especially considering that this code is tristate.

Anyway, this is tangential to this patchset.  Though the new way the code is
organized does make it more feasible to have e.g. a centralized static_call in
the future if we choose to go in that direction.

- Eric

