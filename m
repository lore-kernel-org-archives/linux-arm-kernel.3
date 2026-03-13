Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D9107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQLmomcwIGHuwBkBk5aL5CzzrX9th7u6tDkwCmp4rSA=; b=p55P+SCFB2aim+uy7QVKQE05Su
	cqNpEWB6KJZEI8ae5LmJ+DOTuzdhIzvnRMLS3mRC9d5XJiWIgFjA3kZLWKB5VvaRkjoTrxBLo2Ate
	eY8YOpmVN5ivul1SWP9hX5V5yUg2oI16vIv/mTwBA9KyrJC9mYtON9vZMc1zEh/8YpF6ioZnFxmLb
	p7qdc49KzF5rm1aYErOTOw6vCIdiRSFm9+b4Fi7sbFbYZ15gdbJ8KI/eFKDlCXeyREdS8oZB7gswG
	69dIYlVN3bBAUwssB3TLdx3hW1zofc8/+uULsM8fseZ8JjaEMtGhR5/16yXYr7MRrh8h31whJkgNR
	i66M9kSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w166u-00000000kAc-3ukJ;
	Fri, 13 Mar 2026 17:15:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w166s-00000000k9z-1R7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:15:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aeab6ff148so3765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773422135; x=1774026935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQLmomcwIGHuwBkBk5aL5CzzrX9th7u6tDkwCmp4rSA=;
        b=mCxWoH4EU4Ywpsj5cBZQRs6kQ4/kaf+T0L7UCbxKp3P/WEK3JFZlJMyLYnFXkz9212
         gnByo7rMp4lruRtmia9iXqVNZMkD2lgb8dB6uHUwTKwGb7H3DnrvN2V9bDyvuQQq8RER
         IVJgnRU/UxLBAzU6xSbyn+ozM676qLP3Q46qEyldpys8iT+2gp0yotPwYnrJHqlM4x6/
         uiFOoeiJh+LAW+hRLxe2mGCG2ddMpQYxbJOwMOUJ1gNOKXnSGYPGfpPn5C9e+7CgYKcE
         rj+Apt4hNOPRYDU3W+/pt4t3er3l1Z9G2rQjnHqx4V7f63Gb40vgv6O7k5oItrqVvTuz
         5PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422135; x=1774026935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQLmomcwIGHuwBkBk5aL5CzzrX9th7u6tDkwCmp4rSA=;
        b=UKHNPn8GTCdWRglqqnuchsxUIwB2hYLIGjDcf/15uNYefZCu7WR7d3EKik5u9xDBay
         vicfWgU6wa8E9JJ2l6iMockpT6cOUguXmwPyTkzzshNAeaB+I6FwwVcmdMlcM0S6A9ZU
         6+4LJqpTuBg7CLzuSxmkP3MEGAm9fqXhuwE6Ri4edWbBTMHV2648BRVVCUQK1M1v8b8R
         YUWq77ECKAtGAF3gT589wbzMsvNgNuLOO1ekQ5Ia/DA3WOR52dRPwzNpmR5lNMWIBFyH
         F/5TPCFOcfztF7MGc23K9osOD28fmU140XvxiAp4VL7nFFMGoFwl1QV1kktizJPceDeK
         OMHQ==
X-Gm-Message-State: AOJu0YybPIhjA55n16TYSakDWozjUHHkzCJN7Wc4L5yERHT9A/A+mB9Z
	/gjdUTLvYJ1awmvMIn40kqKlkbys+ojuhi/HO2HaneLZMVXfgTQTLgobQNtZHKDrVQ==
X-Gm-Gg: ATEYQzzvwd4NeRoxp/NOjHcLT1F2MmhxfA9s7OHnh5FKmWrzaLztM6IMOQN2Ur3W5Um
	IjmzjNTb/azPOP+se0qL/hULIZgxFAGY59aLFQwHlxdKUv/fCJJbOa66ylToKRawTSQuokM6/yk
	j9GWaauevVyOHtGOWhTvki0tTzyYTa1jb4yWTwkS6x9mjkakEaLXknPGI619KpZNIOnJ1fvI6+r
	k97u3pRgHV4MdFYpsoUZf/sVZmwDYzSLc+7dhW74g8ItjdG2+AVUCKMlKvHk4Y5Ub16BwjffNz/
	70dkAx1IIOtNjmyfXZefbqSg3ddprZRHsNrv1wvpEQ2GiYFn1+sErJm5k+ZsaUOFW07Y+G4jJHd
	ZRKASrVqqm67HUC9FIFg+0ecfs45EQ17Ke8rvqomuuQIOV4avxwtIgt2zXQfJJe0kVWPjSy1jTh
	dPo5FRxYTgFVvoXsgxjKohdjhNq/Dz4KoWZyUBjpIVbK7O+AN3JcpX4zr63n2ojXg=
X-Received: by 2002:a17:902:e5c4:b0:2ad:6f9b:7818 with SMTP id d9443c01a7336-2b04223ffffmr445ad.23.1773422134975;
        Fri, 13 Mar 2026 10:15:34 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece85e9dfsm27191075ad.87.2026.03.13.10.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:15:34 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:15:29 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will McVicker <willmcvicker@google.com>,
	Sean Christopherson <seanjc@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Message-ID: <abRGMfYdu72Lv8d-@google.com>
References: <20260313061852.4025964-1-cmllamas@google.com>
 <20260313164856.GB213695@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313164856.GB213695@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_101538_406383_43D59681 
X-CRM114-Status: GOOD (  34.56  )
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

On Fri, Mar 13, 2026 at 04:48:56PM +0000, Sami Tolvanen wrote:
> On Fri, Mar 13, 2026 at 06:18:52AM +0000, Carlos Llamas wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > Implement arm64 support for the 'unoptimized' static call variety, which
> > routes all calls through a single trampoline that is patched to perform a
> > tail call to the selected function.
> > 
> > Since static call targets may be located in modules loaded out of direct
> > branching range, we need to use a ADRP/ADD pair to load the branch target
> > into R16 and use a branch-to-register (BR) instruction to perform an
> > indirect call. Unlike on x86, there is no pressing need on arm64 to avoid
> > indirect calls at all cost, but hiding it from the compiler as is done
> > here does have some benefits:
> > - the literal is located in .rodata, which gives us the same robustness
> >   advantage that code patching does;
> > - no performance hit on CFI enabled Clang builds that decorate compiler
> >   emitted indirect calls with branch target validity checks.
> > 
> > Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> 
> Does this need a Co-developed-by tag as well?

The bulk of modifications came from the rebase itself and suggestions
from Ard. I skipped the Co-developed-by tag for this reason.

> 
> > ---
> > v7:
> >   - Took Ard's v3 patch (as it leaves the code patching logic out) and
> >     rebased it on top  of mainline 7.0-rc3.
> >   - Dropped the changes to arch/arm64/lib/insn.c and instead switched to
> >     the (now) existing aarch64_insn_write_literal_u64().
> >   - Added the RET0 trampoline define which points to the generic stub
> >     __static_call_return0.
> >   - Made the HAVE_STATIC_CALL conditional on CFI as suggested by Ard.
> >   - Added .type and .size sections to the trampoline definition to
> >     support ABI tools.
> > 
> >  arch/arm64/Kconfig                   |  1 +
> >  arch/arm64/include/asm/static_call.h | 33 ++++++++++++++++++++++++++++
> >  arch/arm64/kernel/Makefile           |  1 +
> >  arch/arm64/kernel/static_call.c      | 20 +++++++++++++++++
> >  arch/arm64/kernel/vmlinux.lds.S      |  1 +
> >  5 files changed, 56 insertions(+)
> >  create mode 100644 arch/arm64/include/asm/static_call.h
> >  create mode 100644 arch/arm64/kernel/static_call.c
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 38dba5f7e4d2..9ea19b74b6c3 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -252,6 +252,7 @@ config ARM64
> >  	select HAVE_RSEQ
> >  	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
> >  	select HAVE_STACKPROTECTOR
> > +	select HAVE_STATIC_CALL if CFI
> >  	select HAVE_SYSCALL_TRACEPOINTS
> >  	select HAVE_KPROBES
> >  	select HAVE_KRETPROBES
> > diff --git a/arch/arm64/include/asm/static_call.h b/arch/arm64/include/asm/static_call.h
> > new file mode 100644
> > index 000000000000..331580542fd4
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/static_call.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_STATIC_CALL_H
> > +#define _ASM_STATIC_CALL_H
> > +
> > +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
> > +	asm("	.pushsection .static_call.text, \"ax\"			\n" \
> > +	    "	.align	3						\n" \
> > +	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
> > +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
> > +	    "	hint	34	/* BTI C */				\n" \
> 
> It doesn't really matter either way, but do we still support toolchains
> that don't understand "bti c"?

I tested with this early. A 8.2 gcc from the arm archives and it failed
to build:

   Error: selected processor does not support `bti c'

However, this was _before_ I added the conditional on CFI. Maybe clang
doesn't have this problem and technically speaking CFI would gate the
"bti c" usage? Because you can't have CFI and "old" gcc.

The CFI conditional might be later removed though so maybe lets keep it
as is?

--
Carlos Llamas

