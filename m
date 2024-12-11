Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99B4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsNEwFWdf8+xj8apQ2tpCjXCCbHBW+SvnxbyipiMG7c=; b=Qk7mxeQLSE5OXx099mzFWWclKS
	hdfUX9LByeqI3jl8CULRJvrrqHdPiIshZDDXp916vyfEqDVPRyttaHf656q8zuf/Bfxk5WETiHpL+
	cQac5sKwmBQCttNpTGTmjIBq5JGoUkQu4jHsadJ7cN2WF49LBkMZ5JEB+wSodrtkSWw3UKA4MHEtr
	9IOpG8m6TodXi43ez0tyyKJSjZXPVjeDwZuPYdxrx2QoHWyfpX/bWpAD6OugsyPlvMNdGp8Xhgyo9
	X7Ug/N16ngfY2rIPzP9S6O+QZepXkO+aV8Vw3FqeOeMFXiBP5Q02lsqtS9DV45CmHdwMQcMTfixQH
	Ub+On7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNKz-0000000F5KG-0B1f;
	Wed, 11 Dec 2024 14:05:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNJt-0000000F55H-30WP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:04:06 +0000
Date: Wed, 11 Dec 2024 15:04:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733925844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UsNEwFWdf8+xj8apQ2tpCjXCCbHBW+SvnxbyipiMG7c=;
	b=kWVLS6d4m+EdcwV3DiEN+Tq0iCErqJGk2iwi7xF+AVXRlYxWVxHuSBbykXREOtAi1RWMQA
	8ayx646x4C82OrGgSupCiDY55xXdldBUUmGU/RAvhqvBKsgO8r29iOc8gOtKb2QMTmxoTV
	Boe4qN6fO+Kl8Ciz820pgNZ5sK/hKM262a/Ahb+qUNK1h4zkPb0LcGYp1n+mN0jlYg0GEk
	qm8hRO8nm9alfzkHePtvVRTB9ZaFJiNoE7Q7j9+N++paHbPLmus4EffeRREhL4VG6ZF/Id
	8/CqVJUwrr6vpTPzNWFUIrp+TFHPjA7pNNcNlDoqSoduukWH+JIFzbNaYYY4NA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733925844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UsNEwFWdf8+xj8apQ2tpCjXCCbHBW+SvnxbyipiMG7c=;
	b=OKKVRjHggoTfjau/0sKye5pPUjMe8nsbgsOCCpYuo4jyTYQistgxgsYQz4pnoDQjFIFnH7
	FAG0k5Ffj1lb+UDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Message-ID: <20241211140402.yf7gMExr@linutronix.de>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
 <20241211134811.wM_UADhQ@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211134811.wM_UADhQ@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_060405_885553_C6A7C040 
X-CRM114-Status: GOOD (  10.05  )
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

On 2024-12-11 14:48:11 [+0100], To Arnd Bergmann wrote:
> I guess if you have boxes with 4GiB+ and can proof that the performance
> improves without HIGHPTE (since you don't have to map the page table).
> The question is then how much of low mem has to be used instead and when
> does it start to hurt.

Some numbers have been been documented in commit
   14315592009c1 ("x86, mm: Allow highmem user page tables to be disabled at boot time")

and I would like cite:
| We could probably handwave up an argument for a threshold at 16G of total
| RAM.

which means HIGHPTE would make sense with >= 16GiB of memory.

Sebastian

