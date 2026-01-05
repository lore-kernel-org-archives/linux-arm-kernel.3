Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4C6CD0408
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBG+EoK1M2Op6PUuC+ZPwMXf6FUDGEESw74uwVxoB1E=; b=049vBjO1JFR1NZTx5IzLENCPdT
	shuWYb8yOBlrCldQ7FL/Pac8qvEW6eKP/I/R6M6+WCnaLSrfj9X+H9ug0cvKJmZGw1w0zcdwzBx0n
	mFKhkFZKRGqQRQPsWwaqTGAuC72tLsgESDhEbaPfq95TIn8c2L/YGHhWUa0VmhkfYUpsh6Zjk6dyP
	ii81f5A7HSzPW11fR5P9R9gTizsVNv/WhML7hwmrcAVtYHRwGhdNKKkt8+Q+F1SQLj+nM8/KwmuJC
	5LlxOgH25ycbjkJDB5FQWtwma5UYPD9wZq7sX6rgT4aS7y+nq9CR2QT2KRJHQO7Abie8E7K8UvNip
	C62NPPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrvZ-0000000C6zA-2FTa;
	Mon, 05 Jan 2026 21:15:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrvX-0000000C6yy-3Oxg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77F696013A;
	Mon,  5 Jan 2026 21:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D92C116D0;
	Mon,  5 Jan 2026 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767647746;
	bh=IM2DuJa9reEiCLBZk8E9Dct8k60mL22ZGzV0MUiRdLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=El51bi7+imH1giJ9Ep7MrHAH2+KZ4vdS0Xc4iaeVVVorQyVRxjbDjwfylCWGA24M2
	 pQWhRim60LLFJZimahW/BvYZ/panBYw3o1W99hKzDBSrDcVnvSNLADmXQ5ICCL5fIZ
	 IAoA67GeM65lzXWBH2OtCgbvCPvke7mGAUYM4e9wZsqy9BGJ7+WyhHa0FgdtTcE37s
	 RzK7G/zlLiGfFW/5pAT6jMcgu2T1jI610MpQZ3gjF2c/UBhzw4gB/xCQuQWfekMDYb
	 aIo5RrU3Ne8S5jJQJk+s9IVIQCrZTgDm9ULPpDbFgBN6QvnY+CkqJQ+oEWXmLv+V13
	 Z0rz2XAhrxriA==
Date: Mon, 5 Jan 2026 21:15:40 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Laura Abbott <labbott@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>, puranjay@kernel.org,
	usamaarif642@gmail.com, kernel-team@meta.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Fix annotated branch unbootable kernel
Message-ID: <aVwp_BJx84gXHPlD@willie-the-truck>
References: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
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

On Wed, Dec 31, 2025 at 04:44:05AM -0800, Breno Leitao wrote:
> The arm64 kernel doesn't boot with annotated branches
> (PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.
> 
> Bisecting it, I found that disabling branch profiling in arch/arm64/mm
> solved the problem. Narrowing down a bit further, I found that
> physaddr.c is the file that needs to have branch profiling disabled to
> get the machine to boot.
> 
> I suspect that it might invoke some ftrace helper very early in the boot
> process and ftrace is still not enabled(!?).
> 
> Disable branch profiling for physaddr.o to allow booting an arm64
> machine with CONFIG_PROFILE_ANNOTATED_BRANCHES and
> CONFIG_DEBUG_VIRTUAL together.
> 
> Cc: stable@vger.kernel.org
> Fixes: ec6d06efb0bac ("arm64: Add support for CONFIG_DEBUG_VIRTUAL")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Another approach is to disable profiling on all arch/arm64 code, similarly to
> x86, where DISABLE_BRANCH_PROFILING is called for all arch/x86 code. See
> commit 2cbb20b008dba ("tracing: Disable branch profiling in noinstr
> code").

Yes, let's start with arch/arm64/. We know that's safe and then if
somebody wants to make it finer-grained, it's on them to figure out a
way to do it without playing whack-a-mole.

Will

