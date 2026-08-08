Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED03C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YL3HWaNN5b5xlcbD6Iu0baOSlDyk7lrzsw42UJpYVQ=; b=j3fbpHhs85xcgbcmjRxdFwhAU+
	+sy8HQvb1N8y5XNJ7/2hB4QtUIla2/Fuqhg6svDKYVhVoAiGjO9c8tI+DgST5rfOjeFtPEzau0fcO
	Rd4MGd1T2GFGYywpyPuML8E2UxpheWRKGxaxvaV4ZreEedPw/4A3UD/TcYiClK08ciwWXav/l5abc
	2GRuH/NjrombQtwW86WlPixIHGiwx354ZueUP9iyDbpIBgs9k+3W1yQ2qHw7ZZqfxDjyl7ofkfZK0
	+ipjaGj8cs6IDKdYaYNIhq7bKiSHM99QAc2r+qQIboPLk243q3ZN/VKbH3BwbHCKWpA9qLG0W04Sn
	nucra9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV82-00000008vTF-3be0;
	Sat, 08 Aug 2026 00:41:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV81-00000008vT2-0JcO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:41:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8310D6001A;
	Sat,  8 Aug 2026 00:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAE91F000E9;
	Sat,  8 Aug 2026 00:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149692;
	bh=6YL3HWaNN5b5xlcbD6Iu0baOSlDyk7lrzsw42UJpYVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K53J4EwgWESmb4+iPlvtXScn1NwwXR6CY25zq1b7E5QgLdz/dD0opuhjJH39GouHr
	 XVNhK1u3QBJK9ibmFxUFN2rabfvb4xxojyfbsq41XdaDKgVoB+Nesx1h3zyZUVLgaB
	 1n3CeyuyjHRZ7YsukULcTlLCvRXP/HMA5FDxnhNN+ZyBBaXzMrU1l25o5AI3p5Ty9n
	 a9vZUGce40/6/tVwfjQN7HlqOdbO8lAZOBb3nnzSWsdjrk/GeECo2qeHeHw+t60gZR
	 wcR0POjMlY0zTnqFXXBva+wwEKCnUOSekdeWFDCF2ZEc+5bjc/hlyfeebh1lZ9ykIH
	 xmIJokT0MVUQA==
Date: Fri, 7 Aug 2026 17:41:30 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, Miroslav Benes <mbenes@suse.cz>, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 21/21] klp-build: Add arm64 syscall patching macro
Message-ID: <rumkp7mj6x4jo3r4x3erzkcwqkssbf5n46fxvrgcan7u4n2fuk@pkleqal5rqgr>
References: <3bf3cee43039fc4da84e83d0891a92e25f40f00f.1778642121.git.jpoimboe@kernel.org>
 <20260515024439.AF2B7C2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515024439.AF2B7C2BCB3@smtp.kernel.org>
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

On Fri, May 15, 2026 at 02:44:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The arm64 __KLP_SYSCALL_DEFINEx macro omits the ALLOW_ERROR_INJECTION declaration, silently breaking BPF error injection for livepatched syscalls.
> --
> 
> commit b4d1a9ea352f196a7fd3e7198fdade51440d08e5
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> klp-build: Add arm64 syscall patching macro
> 
> This commit adds arm64 support for KLP_SYSCALL_DEFINEx(). The commit
> message states it is mirroring the arm64 __SYSCALL_DEFINEx() pattern from
> arch/arm64/include/asm/syscall_wrapper.h.
> 
> > diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_helpers.h
> > index 99d68d0773fa8..4b647b83865f9 100644
> > --- a/include/linux/livepatch_helpers.h
> > +++ b/include/linux/livepatch_helpers.h
> > @@ -72,6 +72,25 @@
> >  	}								\
> >  	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
> >  
> > +#elif defined(CONFIG_ARM64)
> > +
> > +#define __KLP_SYSCALL_DEFINEx(x, name, ...)				\
> > +	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
> > +	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
> > +	asmlinkage long __arm64_sys##name(const struct pt_regs *regs);	\
> > +	asmlinkage long __arm64_sys##name(const struct pt_regs *regs)	\
> > +	{								\
> > +		return __se_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));\
> > +	}								\
> 
> Does this macro definition omit the ALLOW_ERROR_INJECTION declaration?
> 
> The standard arm64 __SYSCALL_DEFINEx() macro explicitly registers the top-level
> syscall handler with ALLOW_ERROR_INJECTION() to enable BPF error injection
> workflows like bpf_override_return(). The x86 implementation correctly
> preserves this functionality.
> 
> Because this macro is missing that declaration, it looks like it might
> introduce a regression where BPF cannot inject errors into the replacement
> syscalls in a livepatch module on arm64.

Fixed.

-- 
Josh

