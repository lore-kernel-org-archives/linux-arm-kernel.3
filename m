Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iy4t8MP1XmaefyYZYG0ZiSqiRlYn1bEaC89mUDnJ6SY=; b=FVis54BnGF9VBPZ/vKK2kvEmM1
	3AVtEYsh4Uulg9X0FwvXuRlJI8BfDjUL5dg9U4be7yz3YtlibOlWAw9mfjeZETcj027H+luK5hGYq
	kCr9pgt4yxwfDXGk1E5Zc2jlxlHWwXAm07UHF7TnSj5QFOJzeR82RACDc2/Iqcs7CWSWmIr/QMP/8
	1hYcv3FsGCHYE4fE4kSGSByFhisAcJNraLggYDTjHzI4sa6os/Rg/1XG871OrCQncS1lg34gCEeaE
	rwrEDToL9YbcwdAa64amAkC9stxKU1+ithQVRAmQZXuOgUR6RIBVetU2jdnR5+RV0p7bL9UHBnGVG
	lbF0Ny4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEG6-00000003zNP-0cvx;
	Sat, 03 May 2025 14:54:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEEA-00000003zHi-0Iih
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 14:52:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64FFE1007;
	Sat,  3 May 2025 07:52:18 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D03C73F66E;
	Sat,  3 May 2025 07:52:25 -0700 (PDT)
Date: Sat, 3 May 2025 15:52:18 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64/fpsimd: Avoid warning when sve_to_fpsimd() is
 unused
Message-ID: <aBYtk_Azv84QA9C3@J2N7QTR9R3>
References: <20250430173240.4023627-1-mark.rutland@arm.com>
 <bb9783ec-126d-4938-a6f3-dd5930f1c3b6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb9783ec-126d-4938-a6f3-dd5930f1c3b6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_075230_160319_3A3265DB 
X-CRM114-Status: GOOD (  21.08  )
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

On Sat, May 03, 2025 at 04:10:43PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 30, 2025, at 19:32, Mark Rutland wrote:
> >
> > diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> > index b0874402f7ecc..422b9d43b1e64 100644
> > --- a/arch/arm64/kernel/fpsimd.c
> > +++ b/arch/arm64/kernel/fpsimd.c
> > @@ -649,7 +649,7 @@ static void __fpsimd_to_sve(void *sst, struct 
> > user_fpsimd_state const *fst,
> >   * task->thread.uw.fpsimd_state must be up to date before calling this
> >   * function.
> >   */
> > -static void fpsimd_to_sve(struct task_struct *task)
> > +static inline void fpsimd_to_sve(struct task_struct *task)
> >  {
> >  	unsigned int vq;
> >  	void *sst = task->thread.sve_state;
> 
> I just sent a different patch (adding an #ifdef) before I
> saw this one is already applied.
> 
> Avoiding the #ifdef does make your version nicer, though this
> may come back later, since I think this would still be a warning
> at W=1 level, see this bit in linux/compiler.h:
> 
> /*
>  * GCC does not warn about unused static inline functions for -Wunused-function.
>  * Suppress the warning in clang as well by using __maybe_unused, but enable it
>  * for W=1 build. This will allow clang to find unused functions. Remove the
>  * __inline_maybe_unused entirely after fixing most of -Wunused-function warnings.
>  */
> #ifdef KBUILD_EXTRA_WARN1
> #define __inline_maybe_unused
> #else
> #define __inline_maybe_unused __maybe_unused
> #endif
> #define inline inline __gnu_inline __inline_maybe_unused notrace
> 
> IIRC, gcc never warns for unused inline functions, but clang warns
> about them when they are defined in a .c file rather than a header.

Fair, though with W=1 there's an existing issue with sme_free() that no-one has
complained about:

| [mark@lakrids:~/src/linux]% git clean -qfdx
| [mark@lakrids:~/src/linux]% usekorg-llvm 19.1.0 make ARCH=arm64 LLVM=1 -s defconfig             
| [mark@lakrids:~/src/linux]% ./scripts/config -d ARM64_SVE                          
| [mark@lakrids:~/src/linux]% usekorg-llvm 19.1.0 make ARCH=arm64 LLVM=1 -s W=1 arch/arm64/kernel/fpsimd.o
| arch/arm64/kernel/fpsimd.c:208:20: warning: unused function 'sme_free' [-Wunused-function]
|   208 | static inline void sme_free(struct task_struct *t) { }
|       |                    ^~~~~~~~
| arch/arm64/kernel/fpsimd.c:676:20: warning: unused function 'sve_to_fpsimd' [-Wunused-function]
|   676 | static inline void sve_to_fpsimd(struct task_struct *task)
|       |                    ^~~~~~~~~~~~~
| 2 warnings generated.

... so we'd want to do something consistent there (and probably for a
few related functions).

How important is fixing W=1? I note we have a *tonne* of warnings today;
so I assume we can punt that to a future cleanup?

Mark.

