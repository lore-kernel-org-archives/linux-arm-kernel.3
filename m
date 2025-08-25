Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E70CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfZRCUjbcZcYfJqQ1pyJA0w5HiW+vn44jB/PfWRNK2k=; b=BinFbkviT8vL7tSDdEvq4aIjx9
	J5OrvpsM4mw2ijj/vZskz3lwl5dzAaRBmKwgCZMXfCWVwn94QVUs5SD/lwqxzPXYwbpmnw8J/8nEU
	5Jgytt5OkW86mLRJBK2KuXpm01Gjs79ovHdXOGR2hY6n6lm3SoVufLcehg138sshb+4lrtU6n2R5L
	Fc0k/YahT4IrSeTc6P43ILxHo3kpF+qgrxQopm7PZEwdbaEJM6Wq21PFJbu/vKbEw/DuafPtfVpw/
	qrwN1YK5RvwLPHVzmvBgmpnb2Y79AnmxryB6WCWaYcnr7AnCxY23dNTLB4hJBv/PwAN3xnqJvdsCa
	7j2aYG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYk-00000008kKQ-3GJq;
	Mon, 25 Aug 2025 17:00:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZbV-00000008bQG-2o18;
	Mon, 25 Aug 2025 15:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LfZRCUjbcZcYfJqQ1pyJA0w5HiW+vn44jB/PfWRNK2k=; b=k3cgl2Ye2NFhvxXwnrIKo2obgZ
	YlshUQn8PUtAXokUJ2ZeTDTPX1OZB1rL8KKakzcvLH/Ivt8xBTjkrejp7H1KnJf+B0BdzWkHCWeJ/
	hAIHn4fFab6r96A1ITuIHkWRZtJ47iJjqWR+r86xDKFbD1LiJgNG8nTQQvjR/FarVfJjT4KtZrF0U
	/Uqh2pskwapUBZlgpMf4qdNwywYbfAUeSlxFOxy6TM0ZvGOpXaT616hl1VLiSmVZfEitIrqD7j7EE
	L82v3vzVcfZ5sV36P6TVRm/pPrZstYaD0ccOhUx7s8HWnu58N9+b9UASsFh0KGcot30oKrYVptwJu
	QoVk4hkw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZbP-000000004sA-3EoW;
	Mon, 25 Aug 2025 15:59:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 535D23002ED; Mon, 25 Aug 2025 17:59:23 +0200 (CEST)
Date: Mon, 25 Aug 2025 17:59:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-3-kees@kernel.org>
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

On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:


> +	if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)
> +		if (builtin && cfi_debug)

You could just make that cfi_debug and add:

	if (builtin)
		cfi_debug = false;

at the very end of __apply_fineibt().

