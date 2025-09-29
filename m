Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF0CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJuiFlK+/0gZsXP4o7JYtSO7IuSV4/7Gt5reigitHHY=; b=p+VW1dx39Lj4IlXeelI5cgyouT
	vc3kxjoCGY6U7e9koJQ14fDoyndQ0NOmVwqXV8DMNkgL89RJgT4sjkc4FbItqfCGhvxmEqEwg8yZK
	lOfZZQzy5O6FOP9i7cPJWuSoX4Bqcg/w7IBOK/jCttUtaOhrTVUY5TFTHhLhrg1lwRi75Y9NTX4wL
	EZoAiKpkIV17E1aqeD+1eQNMSQSpL7DPorPiQxggRR0WtWgdU0Uf7fQSnCsr4sNLUOM/Qczks0uhG
	kzKw0M9fRpagon4sv0bZ1dYMGv2SWyPFeVNqwFZZjQx+TZdUrOzmmUaAUZgULZmoqSsEK6W0tU9FV
	31YT0Ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3M0F-00000003XEg-1liM;
	Mon, 29 Sep 2025 22:05:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3M0C-00000003XDt-1Zik
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 22:05:49 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759183545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FJuiFlK+/0gZsXP4o7JYtSO7IuSV4/7Gt5reigitHHY=;
	b=gQwUWzxeYhEtgDVeU7AFLFiTvqPA/t8/CVreyWg9hookFTLbl5d1p3chrPo0kdQP4aJYsg
	f88RP4R6WoD0NaZPN/8illU88mNkaCXiVxVuGVzGC4ENq5WOy3L7DO/z2Xr8pBx+tIfLQI
	ddewEF4utQ8DakSCVbwU7Hib589snTbcDr+ZFdezzSQA8cduwKY9fYMwbiLRAv8EKTo126
	HydbhDBkooGA1JLbYfmeyj3ZKis1ZvGdjUt6HUv7jPfo9vEahb+LMgaX+MAvbhooG/Ad58
	nA6tmYetPas1K92fc9a2cCM0mbaLrsoF4ikCU7tyQYZMVw+IjNlYBRfmmIrXjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759183545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FJuiFlK+/0gZsXP4o7JYtSO7IuSV4/7Gt5reigitHHY=;
	b=ly9OMH4jtXHbxSRZbH90LuofY4jRb5hJH+PURo3Jqa7oX1J/36nMhA6wh8CuBkzkKQsVbt
	r3Qn/TVxygB37OCg==
To: Peter Zijlstra <peterz@infradead.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang
 < version 17
In-Reply-To: <20250929110400.GL3419281@noisy.programming.kicks-ass.net>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.100835216@linutronix.de> <20250916184440.GA1245207@ax162>
 <87ikhi9lhg.ffs@tglx> <87frcm9kvv.ffs@tglx>
 <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
 <20250929100852.GD3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
 <20250929110400.GL3419281@noisy.programming.kicks-ass.net>
Date: Tue, 30 Sep 2025 00:05:44 +0200
Message-ID: <87qzvo3oef.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_150548_556518_4707E712 
X-CRM114-Status: GOOD (  17.44  )
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

On Mon, Sep 29 2025 at 13:04, Peter Zijlstra wrote:
> On Mon, Sep 29, 2025 at 12:58:14PM +0200, Geert Uytterhoeven wrote:
>> On Mon, 29 Sept 2025 at 12:09, Peter Zijlstra <peterz@infradead.org> wrote:
>> > On Mon, Sep 29, 2025 at 11:38:17AM +0200, Geert Uytterhoeven wrote:
>> >
>> > > > +       # Detect buggy clang, fixed in clang-17
>> > > > +       depends on $(success,echo 'void b(void **);void* c();int f(void){{asm goto("jmp %l0"::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto("jmp %l0"::::l1);return 2;l1:return 1;}}' | $(CC) -x c - -c -o /dev/null)
>> > >
>> > > This is supposed to affect only clang builds, right?  I am using
>> > > gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04) to build for
>> > > arm32/arm64/riscv, and thus have:
>> > >
>> > >     CONFIG_CC_IS_GCC=y
>> > >
>> > > Still, this commit causes
>> > >
>> > >     CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
>> > >     CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
>> > >
>> > > to disappear from my configs? Is that expected?
>> >
>> > Not expected -- that means your GCC is somehow failing that test case.
>> > Ideally some GCC person will investigate why this is so.
>> 
>> Oh, "jmp" is not a valid mnemonic on arm and riscv, and several other
>> architectures...
>
> Ah, d'0h indeed.
>
> void b(void **);void* c();int f(void){{asm goto(""::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto(""::::l1);return 2;l1:return 1;}}
>
> Seems to still finger the issue on x86_64. That should build on !x86
> too, right?

Ooops.

Thanks for the quick fix!

       tglx

