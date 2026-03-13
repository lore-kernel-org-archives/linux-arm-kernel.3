Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F5106FD9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNn4XaZ2VS/zsHBYZQFDgNHq36gX0XLH6P9/sAQlBTs=; b=0KQIbtKUGSwCwzHWDegDjBok4t
	0YFSZMvnr2ohOUGxLt9P8+5mADkmyfzEgANWugpHMyiug1OWa4vEt6ZFo9YkWE1LBuz/kUongwzJX
	AQ13Z6/aamCXFiXLsUiQAa9ueezr11ksvTUK8WglVm8TZRms3/+PH/vnbU+T2FQJtSXS+M4PNvP2f
	3fP3Feyt3iV+7bb+3mfEqcKyFQzA3ij/3GVob5Ml9f3bvCixCRzrCs0zGGno2qjOtKMH2Q566siPj
	riY0rXuycAlFfuDzhGJGn2RruiLGMm07Y+fgcl+lLyoXS7pw+U2elczIkyDIDU3aFVlU/8tnNBdOa
	7C8Uno5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yG5-0000000HJYi-2S2x;
	Fri, 13 Mar 2026 08:52:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yG3-0000000HJYW-3nfZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 08:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fNn4XaZ2VS/zsHBYZQFDgNHq36gX0XLH6P9/sAQlBTs=; b=k9BizMQjRcxXSRxrmcBLQsGtE8
	/8eSNUfEeYypk/SSHa9YJjp9vBT1b0ICYWDh1kX+XEzhfpE0M7zxWKJ4PyVNfO3+0UfOgm6KWhSkS
	XTOchJBJ2ZqGvt4X7FVNDKLhZ04DbhNxRFzkPCtLy4Er1rsGN06au4kPLBC1Pqmn+8InT6JkXEmMr
	ITEZATm4uV5RtjF4NiimiU7wDwfbJDKsrMHhULw4bm9tV+fY1IRAgveh8iwTABwqKnYV1Xw7jF1NO
	SVrZpY/66pmOoII+tLjvkx9x9Z3gMJuef+haCw1lZ0AFsv0lFhTVYJ3uYjpN/ETx1zXxXWOeTH94H
	NhpYsHjg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yG0-00000002tqI-3vp6;
	Fri, 13 Mar 2026 08:52:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 62F78301BD5; Fri, 13 Mar 2026 09:52:32 +0100 (CET)
Date: Fri, 13 Mar 2026 09:52:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will McVicker <willmcvicker@google.com>,
	Sean Christopherson <seanjc@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Message-ID: <20260313085232.GJ606826@noisy.programming.kicks-ass.net>
References: <20260313061852.4025964-1-cmllamas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313061852.4025964-1-cmllamas@google.com>
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

On Fri, Mar 13, 2026 at 06:18:52AM +0000, Carlos Llamas wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a single trampoline that is patched to perform a
> tail call to the selected function.
> 
> Since static call targets may be located in modules loaded out of direct
> branching range, we need to use a ADRP/ADD pair to load the branch target
> into R16 and use a branch-to-register (BR) instruction to perform an
> indirect call. Unlike on x86, there is no pressing need on arm64 to avoid
> indirect calls at all cost, but hiding it from the compiler as is done
> here does have some benefits:
> - the literal is located in .rodata, which gives us the same robustness
>   advantage that code patching does;
> - no performance hit on CFI enabled Clang builds that decorate compiler
>   emitted indirect calls with branch target validity checks.
> 
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

