Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72684E7DF13
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAotCLeZyiINnLo/dYSD4BE++0CoAWt914tHyyKTDIs=; b=XE2Ax8ifXGyjSThbNXmmeLopw5
	nzLnjV79lQyH8BSfsWxclxi9hrYFjO/hdEov9UT+UlpxZtj+cQA4zhcKfmNl7q+584e+BgbFzOMl6
	OZu1y+8FbJ2Eftpkzlm6Lh17aidWOsfPzRHemxcUV7U6BiYtOsi2lCROhJk8Ruw9Uw/M1x7bwp9aE
	Fg6u3aIBpn9sfKZCNtU7OZ1tRwIAq1Y3Cp+jszEk4bMip05TZLqu945Z4BqzETaL6mizmG0k7IG+8
	IqAEamVoeRkTeYHyKonlA9FT3AQ5QcSYatZoxeL/5KTFnSqNzCMBXlM3QdM28QwuHaO9krLRb5Z+p
	P929EUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmy2o-00000005Nrh-0DhW;
	Mon, 02 Feb 2026 17:49:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmy2l-00000005NrK-2UQt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:49:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so46206495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770054537; x=1770659337; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAotCLeZyiINnLo/dYSD4BE++0CoAWt914tHyyKTDIs=;
        b=KFABUZbER/pY10c+aMqaXhBCvJbBQuKE23TXY5fGAX7EAusJ26E2ZYOWX05UPl1Mfk
         kvdV6HB8FdwJIrlDy6325jVN59+fccQe2+wRUaRWVg/E2WhItJ93NFZwqFKsr8dPB3B3
         t8gimOyyrW1fw+9X2L/vDvm5ltZG0y5zwjGVBiXZE2DCjKjzBI6Qdnosql7YSCxzX5Bd
         q+KJyGDV7TgOJGbHauGs8O0i1s+8VjYtgJQOleZ+TxyHjGm7zbJ+424hvmqrrC7dktgW
         GDeRztpzB9M2/xuGWs77y+NR48SVPLHCfDduZy7+yhoGJvNKrO4jRNtpcDUClhUE6xBp
         minQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054537; x=1770659337;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAotCLeZyiINnLo/dYSD4BE++0CoAWt914tHyyKTDIs=;
        b=LMjWoqPYqf0WotU1NS3CvL1CioOZgUYBfl4o62EslUnnX1/IFdZsKLbaW/ZYv3JjzK
         6PcErfoqelUskU5TL+ij/kiMDUP/LW5+zi73AXCF07aMi7Q5ZoEgxMq5PUGE48N/Ssta
         XK6DsrfOxZB3erdo6Ouj3dduZMb9BaD+yd4uwNtcsAU8XjezG31kcbrI/OSIfhp29iHE
         uLhX3XzaBJ7IHrYRQoB7+oyUa99sj6MXI8fTdN2M+ji21GoiC3HdmGjDS18qaJNhbgUW
         LVCQuqFU9ob/s9S/T1IzDzCfeTbgwi2nxRD7uKYnq9/GRPoIbRpiW1vbne//hq3iX2Or
         Rmhg==
X-Forwarded-Encrypted: i=1; AJvYcCURotqZt7zeIxvL/+cUYwmDBiaqQCJqZxBRSNsXWyhr7X/DlQYnastnWzRGjIL0F/m/p2OZeid7YmZELDqCPCR4@lists.infradead.org
X-Gm-Message-State: AOJu0YziNYxUgvHwkdFK8svBoiNjLaiSFCGIU8FlfmGnL4GwAQefts+m
	k7Qy8pRvzfra2CYGlqOEh8EV8xwjaSitloFTRNFWnI+YwvQW/dBlYxu9cVz6g4RTqg==
X-Gm-Gg: AZuq6aJojdnqwSCL2pQygKiBeDrIoBffLn1Rucvwbfb47qg3fe7cuwHXQgehtOYkKWd
	uHbWQam2o3dyej95c8yq/M3v1E+Oo93lPUF7zQRoo8L/BeCR2NvkvRPN78oUUYmh8lK5VsW/cBs
	qW6/L/3DUnNOW4/NVi5x7GPovLPH4iTnG+EEA9wPJKEoQ2jKucT1LdwQCbR37ruH6xYQu3RbWz4
	8RgrYMKDfEkCKJHtXgN2gYgWUtMLonhPJoghbAwC40okMSVe6dmOH0CaPrj2JHDZtSEt8DtKLcd
	9xOA98MZJraaL3kk8RFxnzYmSrpWdJ+7y0LHBIVylFtkIZWT7askeVozca8Qf0qGDRPMJDtKjhC
	WZqswGJjGwQfR9Jmf6SoVgBYWWsOIGUCGFtEDRpB2+op4ic6u1W/k4hJHmIWufL7LB3FANQMOUa
	l/iL8C+TBLpLLsx/pF2cAO+WtVkXZZgPNWEwCLxbXNURjpV/0=
X-Received: by 2002:a05:600c:a00a:b0:471:1717:411 with SMTP id 5b1f17b1804b1-482db481be4mr157883855e9.24.1770054536894;
        Mon, 02 Feb 2026 09:48:56 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:34d8:ac7:1851:db23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbcf9c3fsm115055905e9.4.2026.02.02.09.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:48:56 -0800 (PST)
Date: Mon, 2 Feb 2026 18:48:47 +0100
From: Marco Elver <elver@google.com>
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYDjf8apiadheFuM@elver.google.com>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-3-elver@google.com>
 <aYDEiOutq3_O8irP@willie-the-truck>
 <20260202160139.GF1282955@noisy.programming.kicks-ass.net>
 <aYDLUhWMdvzKpTK9@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYDLUhWMdvzKpTK9@willie-the-truck>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_094859_789520_9DFCAEDD 
X-CRM114-Status: GOOD (  30.49  )
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

On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:
> I know that CONFIG_LTO practically depends on Clang, but it's a bit
> grotty relying on that assumption here. Ideally, it would be
> straightforward to enable the strong READ_ONCE() semantics on arm64
> regardless of the compiler.

Does it matter for GCC versions that do not support LTO? Because I'm
quite sure that if, one day, we add support for GCC LTO, that GCC
version will be new enough that it'll just take the __typeof_unqual__()
version and it'll "just work".

The problem with older GCC versions was that their __auto_type did not
actually strip qualifiers (which it should have) -- this was fixed at
some point.

On Mon, Feb 02, 2026 at 04:05PM +0000, Will Deacon wrote:
> On Mon, Feb 02, 2026 at 05:01:39PM +0100, Peter Zijlstra wrote:
> > On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:
> > 
> > > Since we're not providing acquire semantics for the non-atomic case,
> > > what we really want is the generic definition of __READ_ONCE() from
> > > include/asm-generic/rwonce.h here. The header inclusion mess prevents
> > > that, but why can't we just inline that definition here for the
> > > 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> > > we use that to implement __unqual_scalar_typeof() when it is available?
> > 
> > We are?
> 
> Great! Then I don't grok why we need to choose between
> __unqual_scalar_typeof() and __typeof_unqual__() in the arch code. We
> should just use the former and it will DTRT.

The old __unqual_scalar_typeof() is still broken where
__typeof_unqual__() is unavailable - for the arm64 + LTO case that'd be
Clang <= 18, which we still have to support.

We could probably just ignore the performance issue ('volatile' reload
from stack, rare enough though given volatile variables are not usually
allowed) for these older versions and just say "use the newer compiler
to get better perf", but the 'const' issue will break the build:

| --- a/arch/arm64/include/asm/rwonce.h
| +++ b/arch/arm64/include/asm/rwonce.h
| @@ -46,7 +46,7 @@
|  #define __READ_ONCE(x)							\
|  ({									\
|  	auto __x = &(x);						\
| -	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
| +	auto __ret = (__unqual_scalar_typeof(*__x) *)__x;		\
|  	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
|  	auto __retp = &__ret;						\
|  	union { typeof(*__ret) __val; char __c[1]; } __u;		\

Results in:

| In file included from arch/arm64/kernel/asm-offsets.c:11:
| In file included from ./include/linux/arm_sdei.h:8:
| In file included from ./include/acpi/ghes.h:5:
| In file included from ./include/acpi/apei.h:9:
| In file included from ./include/linux/acpi.h:15:
| In file included from ./include/linux/device.h:32:
| In file included from ./include/linux/device/driver.h:21:
| In file included from ./include/linux/module.h:20:
| In file included from ./include/linux/elf.h:6:
| In file included from ./arch/arm64/include/asm/elf.h:141:
| ./include/linux/fs.h:1344:9: error: cannot assign to non-static data member '__val' with const-qualified type 'typeof (*__ret)' (aka 'struct fown_struct *const')
|  1344 |         return READ_ONCE(file->f_owner);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| ./include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
|    50 |         __READ_ONCE(x);                                                 \
|       |         ^~~~~~~~~~~~~~
| ./arch/arm64/include/asm/rwonce.h:76:13: note: expanded from macro '__READ_ONCE'
|    76 |                 __u.__val = *(volatile typeof(*__x) *)__x;              \
|       |                 ~~~~~~~~~ ^
| ./include/linux/fs.h:1344:9: note: non-static data member '__val' declared const here
|  1344 |         return READ_ONCE(file->f_owner);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| ./include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
|    50 |         __READ_ONCE(x);                                                 \
|       |         ^~~~~~~~~~~~~~
| ./arch/arm64/include/asm/rwonce.h:52:25: note: expanded from macro '__READ_ONCE'
|    52 |         union { typeof(*__ret) __val; char __c[1]; } __u;               \
|       |                 ~~~~~~~~~~~~~~~^~~~~

... and many many more such errors.

It's an unfortunate mess today, but I hope sooner than later we bump the
minimum compiler versions that we can just unconditionally use
__typeof_unqual__() and delete __unqual_scalar_typeof(),
__rwonce_typeof_unqual() workaround and all the other code that appears
to be conditional on USE_TYPEOF_UNQUAL:

	% git grep USE_TYPEOF_UNQUAL
	arch/x86/include/asm/percpu.h:#if defined(CONFIG_USE_X86_SEG_SUPPORT) && defined(USE_TYPEOF_UNQUAL)

