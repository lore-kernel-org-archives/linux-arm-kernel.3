Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79FFC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ov/y1t7Dpez9RlDMwDLU2+3BKfoWfwxweNJ4MdRL9s=; b=il4b6AFcWcAaLVX3MFJSBtrpqs
	shNYOlJPySNamThJQJXBMAez2Yr+RGTsGLu9OUurRkZr9rYHuWd41yiIU3Kd19KMDTxiQy0fGMFXw
	mmPKok+JGGHRv+t/M8nWjirdpmGAhNIUwizEyxIIpWuAG4b+VSXsJnMsUpzHBxRHq3ChCBwV6trc1
	F/2QeRw4lF9ud2XNk/XzBZ4GsfrmIayXPlriqSkhO+MXmCJLHZso+67CuiR3/DnmrtXcPcVcP4vZp
	9BpmBPOUr4l7s369g75yoXPxVoKWDVjJDOZYLlCF8zM6q8jCBLcND9WKjIg0Fg2IZh9P3a0vUBxO7
	K9r/pSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjY-00000008YS2-1jdz;
	Thu, 27 Feb 2025 19:39:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnh8H-000000088UW-0yOm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 16:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Ov/y1t7Dpez9RlDMwDLU2+3BKfoWfwxweNJ4MdRL9s=; b=KOKkPpZuy4OXVvkiO0Y5M/4QeT
	Ks24n3qwEAVTlfVNX9rIPgeZAVBnlpuRscpDSDp5Pj7ScbGAADOXp0BWLAVdsQEUX6O5vJteeLrYA
	jmmpodsZCsX4IuJBMihq4CGBHHX9s8eJ0IpP/cr2aDP5gTKY7I1tQPdD4cBILLtr5OyyJve1RNWST
	5Uw9/bKbqgRQHCmbxkDcc86/cMIXfboUu97s5MXDT4fdDrWsz4SfDfXEGsYxNsxlpuJyq4D87KP8v
	eLljZ6rbbsQLn94dCsPVtry5o5ejVT3fH7Q4HjXZtajayh+M0F0BvcUVmU01ol21kyaBB/EVusWGP
	LfllOMDg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tnh8B-00000003pRG-0nbx;
	Thu, 27 Feb 2025 16:53:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 42319300472; Thu, 27 Feb 2025 17:53:02 +0100 (CET)
Date: Thu, 27 Feb 2025 17:53:02 +0100
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
Message-ID: <20250227165302.GB5880@noisy.programming.kicks-ass.net>
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226121537.752241-1-dongml2@chinatelecom.cn>
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

On Wed, Feb 26, 2025 at 08:15:37PM +0800, Menglong Dong wrote:

> In x86, we need 5-bytes to prepend a "mov %eax xxx" insn, which can hold
> a 4-bytes index. So we have following logic:
> 
> 1. use the head 5-bytes if CFI_CLANG is not enabled
> 2. use the tail 5-bytes if MITIGATION_CALL_DEPTH_TRACKING is not enabled
> 3. compile the kernel with extra 5-bytes padding if
>    MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are both enabled.

3) would result in 16+5 bytes padding, what does that do for alignment?

Functions should be 16 byte aligned.

Also, did you make sure all the code in arch/x86/kernel/alternative.c
still works? Because adding extra padding in the CFI_CLANG case moves
where the CFI bytes are emitted and all the CFI rewriting code goes
sideways.


