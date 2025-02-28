Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB4AC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht7ZbMwfV+utVkqPlmDB+z3+2vIA7uWpPnlzueknb74=; b=PF+IPZSK5E6sPMTydEomXp3GwQ
	3d5BmDG2LjO5vyBsZhovhoqKdFbFLD2fGcFa/QrrjXyTs2IDoBZQKlHlx317FMICtMsJn2JVtvJfB
	OfGQKjfBVNtGGxNs2UZMYxKHL+dP7KUYTJy4psJIIjKnbeyaXNntS4FUrGqjF/TNGOKAxlRLuave5
	OjlXbLdONIHqL8/10TWlsGYbW1FppqxsC2AwhZv7nADiMCqByp4s4ubgB4POorZHnMrZDC29JmJPu
	cu51asBQv841oZyuWLCUYJkDu9gdsUsOzLMZu+q4dQo0Bcnx/vJ15lp50Ni1xJfwFFGhsi8sbkt6u
	rQu7v2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyAJ-0000000AgwW-16XA;
	Fri, 28 Feb 2025 11:04:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxcl-0000000AbO3-0Bxb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 28 Feb 2025 10:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ht7ZbMwfV+utVkqPlmDB+z3+2vIA7uWpPnlzueknb74=; b=A977MKLp8As/l9zJTJHg41iGfQ
	125R3PcMRlqReyzxem0p2D/9Y5E1pOHy+vt77I5lHaozgtYpfhRDt/YrYOUxZPFhDLGv67eMAqoYp
	kmeGtsKh54ngtP8lV1LWjzKre3i6vOWW2tumWhnDzBIz49ogvT7L34BoJW/QT0nSH6h1RDDcbsNX4
	+mNsqnEMerPGw/8NErqU28i5XWJmgTERh+Vu4Oqvi/7IPPbbih388NtU5ZC/Tg/d4y/vbePN0zz4c
	TEvDofTVvCFK5/WqOTJk5gbzVJyRrHWpYrmDpJvGiL8Ejp6VRLmL+Ie4Edc7+wjxFSa2aKYwqTqz9
	rqzWw3bg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxce-00000003x53-2kvA;
	Fri, 28 Feb 2025 10:29:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 84C9E300780; Fri, 28 Feb 2025 11:29:35 +0100 (CET)
Date: Fri, 28 Feb 2025 11:29:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	dongml2@chinatelecom.cn, akpm@linux-foundation.org, rppt@kernel.org,
	graf@amazon.com, dan.j.williams@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2] add function metadata support
Message-ID: <20250228102935.GM31462@noisy.programming.kicks-ass.net>
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
 <20250227165302.GB5880@noisy.programming.kicks-ass.net>
 <CADxym3YCZ5dqXMFesNaAF_Z2EWWCj0bJyKQ+BnNw2c=g39CRFA@mail.gmail.com>
 <20250228102646.GW11590@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228102646.GW11590@noisy.programming.kicks-ass.net>
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

On Fri, Feb 28, 2025 at 11:26:46AM +0100, Peter Zijlstra wrote:
> On Fri, Feb 28, 2025 at 05:53:07PM +0800, Menglong Dong wrote:
> 
> > I tested it a little by enabling CFI_CLANG and the extra 5-bytes
> > padding. It works fine, as mostly CFI_CLANG use
> > CONFIG_FUNCTION_PADDING_BYTES to find the tags. I'll
> > do more testing on CFI_CLANG to make sure everything goes
> > well.
> 
> I don't think you understand; please read:
> 
> arch/x86/kernel/alternative.c:__apply_fineibt() 
> 
> and all the code involved with patching FineIBT. I think you'll find it
> very broken if you change anything here.
> 
> Can you post an actual function preamble from a kernel with
> CONFIG_FINEIBT=y with your changes on?
> 
> Ex.
> 
> $ objdump -wdr build/kernel/futex/core.o
> 
> Disassembly of section .text:
> 
> 0000000000000000 <__cfi_futex_hash>:
>        0:       b9 93 0c f9 ad          mov    $0xadf90c93,%ecx
> 
> 0000000000000005 <.Ltmp0>:
>        5:       90                      nop
>        6:       90                      nop
>        7:       90                      nop
>        8:       90                      nop
>        9:       90                      nop
>        a:       90                      nop
>        b:       90                      nop
>        c:       90                      nop
>        d:       90                      nop
>        e:       90                      nop
>        f:       90                      nop
> 
> 0000000000000010 <futex_hash>:
>       10:       f3 0f 1e fa             endbr64
>       14:       e8 00 00 00 00          call   19 <futex_hash+0x9>      15: R_X86_64_PLT32      __fentry__-0x4
>       19:       8b 47 10                mov    0x10(%rdi),%eax
> 
> 
> Any change to the layout here *WILL* break the FineIBT code.
> 
> 
> If you want to test, make sure your build has FINEIBT=y and boot on an
> Intel CPU that has CET-IBT (alderlake and later).

Oh, wait, not true, tigerlake also has IBT.

