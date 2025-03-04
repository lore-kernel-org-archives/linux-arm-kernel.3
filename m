Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF57C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv+PIGwL4Os+6UQr8shBumtmGLDADHsIVKfUG7p0oac=; b=zWm1iZsIdCQ/BWibZs8epjs82U
	UyAP8NSS4L75WUX23XIb7qZHWQBIpxa3uGtqWUmXcbL9reiVrRqtHmcgKs9KSDJLkFEhj4mnWyjXE
	RCpP6UkHcv9ewM4Lbs/BH7IbEggdio2nv5WB/kgewI98w0619IjFlG9aZv61va0Jh/DSVVqvMk7m/
	DbbrgfjKzMctpE45PIDULSue9/xJ9ITLd/ZADapRZamqqNMkhWP849IExBT3St4Aur/UTPzOX3n7l
	Uc81bS/MIAcbMgwrz8ZX0u6rJSq1cALw5uOvGu4o23HDG4tdVVlXleHEr2vuK6zIEHpcSV8ThtpaM
	/uvkBPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLe2-00000003Ery-227d;
	Tue, 04 Mar 2025 06:20:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLa7-00000003Dtw-01zr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 06:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wv+PIGwL4Os+6UQr8shBumtmGLDADHsIVKfUG7p0oac=; b=N2WovOaitXsb/19o9wZCWBmkbx
	X6nG7aGP7e9xXTHfVKszHjHGCjHvP1s+unrd0sDaHVZPKiJKHowe9rCsl6nu1rGadL/60ARvewN3e
	ZAPsFep2gcveMkAMNvaShUynEhWKqrFc0bxjw+7cUptYPV2Ug91W/HRfS/0b1SL5xoTedaR6OSfTl
	F/5dr9LwADjHja4YomDwE3U3zdmH4SQF8wYmzJUr+lVJ/mcBBG53xFWkW2J/xpv842f8FpEz0sTV5
	6VJCazUVPutTp+RWfJgFrN7jb0UGwOsQZTD9Ik7ZOdKhY2PJM6Euq67lJgTL1Ysy6PVWKJW1Ixzrd
	SOuZMAag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLa3-00000000I7p-07aa;
	Tue, 04 Mar 2025 06:16:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7544D30049D; Tue,  4 Mar 2025 07:16:35 +0100 (CET)
Date: Tue, 4 Mar 2025 07:16:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	jolsa@kernel.org, davem@davemloft.net, dsahern@kernel.org,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	samitolvanen@google.com, kees@kernel.org, dongml2@chinatelecom.cn,
	akpm@linux-foundation.org, riel@surriel.com, rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
Message-ID: <20250304061635.GA29480@noisy.programming.kicks-ass.net>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn>
 <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304053853.GA7099@noisy.programming.kicks-ass.net>
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

On Tue, Mar 04, 2025 at 06:38:53AM +0100, Peter Zijlstra wrote:
> On Tue, Mar 04, 2025 at 09:10:12AM +0800, Menglong Dong wrote:
> > Hello, sorry that I forgot to add something to the changelog. In fact,
> > I don't add extra 5-bytes anymore, which you can see in the 3rd patch.
> > 
> > The thing is that we can't add extra 5-bytes if CFI is enabled. Without
> > CFI, we can make the padding space any value, such as 5-bytes, and
> > the layout will be like this:
> > 
> > __align:
> >   nop
> >   nop
> >   nop
> >   nop
> >   nop
> > foo: -- __align +5
> > 
> > However, the CFI will always make the cfi insn 16-bytes aligned. When
> > we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
> > like this:
> > 
> > __cfi_foo:
> >   nop (11)
> >   mov $0x12345678, %reg
> >   nop (16)
> > foo:
> > 
> > and the padding space is 32-bytes actually. So, we can just select
> > FUNCTION_ALIGNMENT_32B instead, which makes the padding
> > space 32-bytes too, and have the following layout:
> > 
> > __cfi_foo:
> >   mov $0x12345678, %reg
> >   nop (27)
> > foo:
> 
> *blink*, wtf is clang smoking.
> 
> I mean, you're right, this is what it is doing, but that is somewhat
> unexpected. Let me go look at clang source, this is insane.

Bah, this is because assemblers are stupid :/

There is no way to tell them to have foo aligned such that there are at
least N bytes free before it.

So what kCFI ends up having to do is align the __cfi symbol to the
function alignment, and then stuff enough nops in to make the real
symbol meet alignment.

And the end result is utter insanity.

I mean, look at this:

      50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall_level+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
      56:       66 2e 0f 1f 84 00 00 00 00 00   cs nopw 0x0(%rax,%rax,1)

0000000000000060 <__cfi___probestub_initcall_level>:
      60:       90                      nop
      61:       90                      nop
      62:       90                      nop
      63:       90                      nop
      64:       90                      nop
      65:       90                      nop
      66:       90                      nop
      67:       90                      nop
      68:       90                      nop
      69:       90                      nop
      6a:       90                      nop
      6b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax

0000000000000070 <__probestub_initcall_level>:
      70:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall_level+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4


That's 21 bytes wasted, for no reason other than that asm doesn't have a
directive to say: get me a place that is M before N alignment.

Because ideally the whole above thing would look like:

      50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall_level+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
      56:       66 2e 0f 1f 84 		cs nopw (%rax,%rax,1)

000000000000005b <__cfi___probestub_initcall_level>:
      5b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax

0000000000000060 <__probestub_initcall_level>:
      60:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall_level+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4




