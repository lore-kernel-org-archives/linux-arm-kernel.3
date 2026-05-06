Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A0CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrx+HqhAxeOv5DoMJYmySVbA1MpZzn0b1/D3AeLRg58=; b=NaaWtfhrG04pv8Tfiui9ju1oCX
	xGhj78w5lFUawO1F0fmFygneqXF51lX7NSTUkWtT0PjtP6EOno7IvN9ZFa2n1gX6IM5OX0ZOOE6Y2
	iFVyfouh2cnQT3lSoJTlUpfsQ9nnk7d81GNU0WoJ0BB0cTKgSYllyCFGCsn65P9jejRcC2gHpOQfm
	qumpyBetqsBhlmbmOPfNoocAjCDoo5SOHEHqEVvgFv7UrE97+qeUMQs6C7eoCnDHsuD/2BRZyhYHc
	xiTYw+znNTh4oiovKLc+xU5uV3wg16Ovl1d6v2yA2DAUMbnugA8oBDKd6kcpTrWdBVMfeBaSk3kor
	f/Q75o8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZxq-00000000YkO-2c8p;
	Wed, 06 May 2026 10:58:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZxp-00000000Yk3-1nDX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:58:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46BBF3319;
	Wed,  6 May 2026 03:58:43 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E06A3F836;
	Wed,  6 May 2026 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778065128; bh=aQfsV2SqE6kU4SVIid6MOpxYl3B3Uko4bftEJ8oCdog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpI7YXBx7bQ0HlHyprN3ILWivU+ISemkX0wJ31Ad1W6z7Qlkutk71D+vaoCehQjEY
	 bdO0wfarRKzrWvnQnoIOtNnFC6sVjeMJsKwCpzC7Hi4TnkZmrwvvImqjV7s7sPFVYG
	 vhJ+Ca76Us05zKFsGC+F4zuxEuSDOWW2raT2IyO4=
Date: Wed, 6 May 2026 11:58:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Sauerwein <dssauerw@amazon.de>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	nh-open-source@amazon.com
Subject: Re: [PATCH] arm64: Fix garbled logs caused by race between multiple
 stack traces
Message-ID: <afse5Ld52p7DmidK@arm.com>
References: <20260430084738.73909-1-dssauerw@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430084738.73909-1-dssauerw@amazon.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_035849_504059_CB009D1B 
X-CRM114-Status: GOOD (  15.78  )
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

On Thu, Apr 30, 2026 at 08:47:38AM +0000, David Sauerwein wrote:
> When multiple stack traces are printed at the same time, the lines that
> contain register values may get split into multiple separate lines.
> Some stray empty lines may appear as well.
> 
> [ 2013.814455] ------------[ cut here ]------------
> [ 2013.814455] ------------[ cut here ]------------
> [ 2013.814459] WARNING: CPU: 12 PID: 626 at src/arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3860 mark_page_dirty_in_slot+0x5c/0xd8
> [ 2013.814457] WARNING: CPU: 3 PID: 620 at src/arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3860 mark_page_dirty_in_slot+0x5c/0xd8
> [...]
> [ 2013.814483] x29: ffff8000873b3b10
> [ 2013.814484] x29: ffff800083fd3b10
> [ 2013.814484]  x28: ffff00001d71e300 x27: 0000000000000001
> [ 2013.814486] x26: ffff800080c63b80 x25: ffff800080c63000
> [ 2013.814487]  x28: ffff00001d71a100 x27: 0000000000000001
> [ 2013.814488]  x24: 0000000000401b14
> [ 2013.814489]
> [ 2013.814489] x26: ffff800080f5bb80 x25: ffff800080f5b000
> [ 2013.814491]
> [ 2013.814491] x23: ffff0000117b2000 x22: ffff00001e22bd88 x21: 0000ff9cc1b14000
> [ 2013.814493]  x24: 0000000000402230
> [ 2013.814494]
> [ 2013.814495] x20: ffff800080c63000
> [ 2013.814495] x23: ffff00001d916f00
> [ 2013.814496]  x19: 0000000000000000 x18: ffff8000808c1660
> [ 2013.814497] x17: 0000000000000000
> [...]
[...]
> @@ -235,12 +235,22 @@ void __show_regs(struct pt_regs *regs)
>  	i = top_reg;
>  
>  	while (i >= 0) {
> -		printk("x%-2d: %016llx", i, regs->regs[i]);
> +		/*
> +		 * Buffer is big enough to hold the output for 3 register
> +		 * plus some extra.
> +		 */
> +		char buf[80];
> +		int len;
> +
> +		len = scnprintf(buf, sizeof(buf), "x%-2d: %016llx",
> +				i, regs->regs[i]);
>  
>  		while (i-- % 3)
> -			pr_cont(" x%-2d: %016llx", i, regs->regs[i]);
> +			len += scnprintf(buf + len, sizeof(buf) - len,
> +					 " x%-2d: %016llx",
> +					 i, regs->regs[i]);
>  
> -		pr_cont("\n");
> +		printk("%s\n", buf);

While the above does solve the line splitting, the trace is still not
that readable as we get line interleaving.

I wonder whether we could do something like dump_stack_lvl() at the
show_regs() level to synchronise the printing. If that works, we
wouldn't need the above change (which isn't incorrect but maybe we can
do better).

Thanks.

-- 
Catalin

