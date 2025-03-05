Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C43C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQd+YXbVcy+anVu3Oo0CKh2pMjA7PL/ALECEZbNx8P0=; b=i7NFpOTLogiGV/Xa54m6DtUHbR
	s/v0Y6KwerL9JGPjfcyKoJ6LesV8BZGjaGjDAyOtEqjnFdzVwfVK+zQKGE1GN6ZPcDeBIUvIlwnsk
	vESD3jOGe4nZ16e+mBph7TOiWMh0UtNbYdOhUohM92ltAvE7Ormbuzqsibx46EFt202ErB2P+TmCn
	4eH4oB/gFBxL7jgkmHa7UStlqTf2iAY5ycOIb5iKZ9jjsDVEGV26iuUK67gwi0YcJZ9f74v78eDx5
	19hySkiv6GWIdWFn03bKbBv+XR+AtUCk7gZUqN+H8ZqEGnngz1ra+BL9dMaudGv30dBbyliG7Zfwi
	A+4H5V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqHz-00000008Soe-0hCb;
	Wed, 05 Mar 2025 15:04:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqGN-00000008SFf-3iDr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 15:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=TQd+YXbVcy+anVu3Oo0CKh2pMjA7PL/ALECEZbNx8P0=; b=pq/GuTtJ5DpCBUWQIQzZSl1x/0
	bAtbZz2rq2LsFYH9+GYCJDYs0fMep9g3f8u4SW3gM4A4hDY8b0a6RiQ44DMw199BMVcRdOcSwmeoH
	DJOuUDnt1/qBQZVS+OEsOWvukz+GT6P1cM/jDE05Ooa+WqfYqtwgRr/gB51frFITMIh8rMYkTIie9
	NmLCjGYZqcC4bIV4lRaevNPYnt4XqIypbDG6mmAvTFsX1W6ikFviSP7/lqQ3/+HCh6ZQHripIJmuO
	e4nsk5nSjZ2DqmOIrvRozm4qKmJYQbyp1wHTqcHh4Ck7r05dt9izTtHGaPs8BKU7TP+g9P1tDTRo3
	Slw7ACpg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqGK-00000005j34-0aF0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 15:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA10AA4593F;
	Wed,  5 Mar 2025 14:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08294C4CED1;
	Wed,  5 Mar 2025 15:02:11 +0000 (UTC)
Date: Wed, 5 Mar 2025 10:03:06 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 mark.rutland@arm.com, alexei.starovoitov@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net,
 dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com,
 kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org,
 riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
Message-ID: <20250305100306.4685333a@gandalf.local.home>
In-Reply-To: <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
	<20250303132837.498938-2-dongml2@chinatelecom.cn>
	<20250303165454.GB11590@noisy.programming.kicks-ass.net>
	<CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
	<20250304053853.GA7099@noisy.programming.kicks-ass.net>
	<20250304061635.GA29480@noisy.programming.kicks-ass.net>
	<CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
	<20250304094220.GC11590@noisy.programming.kicks-ass.net>
	<6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
	<CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150220_335833_9D6E6842 
X-CRM114-Status: GOOD (  29.43  )
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

On Wed, 5 Mar 2025 09:19:09 +0800
Menglong Dong <menglong8.dong@gmail.com> wrote:

> Ok, let me explain it from the beginning. (My English is not good,
> but I'll try to describe it as clear as possible :/)

I always appreciate those who struggle with English having these
conversations. Thank you for that, as I know I am horrible in speaking any
other language. (I can get by in German, but even Germans tell me to switch
back to English ;-)

> 
> Many BPF program types need to depend on the BPF trampoline,
> such as BPF_PROG_TYPE_TRACING, BPF_PROG_TYPE_EXT,
> BPF_PROG_TYPE_LSM, etc. BPF trampoline is a bridge between
> the kernel (or bpf) function and BPF program, and it acts just like the
> trampoline that ftrace uses.
> 
> Generally speaking, it is used to hook a function, just like what ftrace
> do:
> 
> foo:
>     endbr
>     nop5  -->  call trampoline_foo
>     xxxx
> 
> In short, the trampoline_foo can be this:
> 
> trampoline_foo:
>     prepare a array and store the args of foo to the array
>     call fentry_bpf1
>     call fentry_bpf2
>     ......
>     call foo+4 (origin call)

Note, I brought up this issue when I first heard about how BPF does this.
The calling of the original function from the trampoline. I said this will
cause issues, and is only good for a few functions. Once you start doing
this for 1000s of functions, it's going to be a nightmare.

Looks like you are now in the nightmare phase.

My argument was once you have this case, you need to switch over to the
kretprobe / function graph way of doing things, which is to have a shadow
stack and hijack the return address. Yes, that has slightly more overhead,
but it's better than having to add all theses hacks.

And function graph has been updated so that it can do this for other users.
fprobes uses it now, and bpf can too.

>     save the return value of foo
>     call fexit_bpf1 (this bpf can get the return value of foo)
>     call fexit_bpf2
>     .......
>     return to the caller of foo
> 
> We can see that the trampoline_foo can be only used for
> the function foo, as different kernel function can be attached
> different BPF programs, and have different argument count,
> etc. Therefore, we have to create 1000 BPF trampolines if
> we want to attach a BPF program to 1000 kernel functions.
> 
> The creation of the BPF trampoline is expensive. According to
> my testing, It will spend more than 1 second to create 100 bpf
> trampoline. What's more, it consumes more memory.
> 
> If we have the per-function metadata supporting, then we can
> create a global BPF trampoline, like this:
> 
> trampoline_global:
>     prepare a array and store the args of foo to the array
>     get the metadata by the ip
>     call metadata.fentry_bpf1
>     call metadata.fentry_bpf2
>     ....
>     call foo+4 (origin call)

So if this is a global trampoline, wouldn't this "call foo" need to be an
indirect call? It can't be a direct call, otherwise you need a separate
trampoline for that.

This means you need to mitigate for spectre here, and you just lost the
performance gain from not using function graph.


>     save the return value of foo
>     call metadata.fexit_bpf1 (this bpf can get the return value of foo)
>     call metadata.fexit_bpf2
>     .......
>     return to the caller of foo
> 
> (The metadata holds more information for the global trampoline than
> I described.)
> 
> Then, we don't need to create a trampoline for every kernel function
> anymore.
> 
> Another beneficiary can be ftrace. For now, all the kernel functions that
> are enabled by dynamic ftrace will be added to a filter hash if there are
> more than one callbacks. And hash lookup will happen when the traced
> functions are called, which has an impact on the performance, see
> __ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
> metadata supporting, we can store the information that if the callback is
> enabled on the kernel function to the metadata, which can make the performance
> much better.

Let me say now that ftrace will not use this. Looks like too much work for
little gain. The only time this impacts ftrace is when there's two
different callbacks tracing the same function, and it only impacts that
function. All other functions being traced still call the appropriate
trampoline for the callback.

-- Steve

> 
> The per-function metadata storage is a basic function, and I think there
> may be other functions that can use it for better performance in the feature
> too.
> 
> (Hope that I'm describing it clearly :/)


