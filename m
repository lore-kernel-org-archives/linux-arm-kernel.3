Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B038E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcEdyf32adcRhq16rtWJRAyApwazxa43Y8h9mC5uJpw=; b=VwXSDY+EiUMppSlBhbbxwkFNdO
	zsN6i3hKQWzaFtuUdxWs5YGI70JRq9q7Xlf6YhvyE+tzatHQax/jpo0ggBgNqnoKQkQptcoTsT6lT
	0K2DraP/RNmxJ3d2iVt6P7asGgRE7/5D7TJdr4cEkllc+mVbAtAoYVW+QR4688XuylTxxwPJ09Oy2
	kGkl6wCRYCgRe78na7T/b7sbsJsADa5/wCaaVE0IEezgCAI4oYLvcNPtPKHBMNkzv4TqZrLZqcTA2
	Z2jwOmttkS1BhVF7arkymfNBPvtD4+K+/7R0qTYSQMZHbSxLtApOsbbqC6WMnxCyqsrb7gmYbX6CG
	8zP3kPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN6B-0000000F2dm-35kB;
	Wed, 11 Dec 2024 13:49:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN4Z-0000000F2L4-0gYZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:48:16 +0000
Date: Wed, 11 Dec 2024 14:48:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733924892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcEdyf32adcRhq16rtWJRAyApwazxa43Y8h9mC5uJpw=;
	b=ZGQcZ/uGgidddEs3TRPAx70QGE3OqHBArWQm7LVbRXrH5zIpemuLwluP9BPgjfarNJE6VR
	Gzxooaltlx1/u2IwRGJO52dzZGQwj0Ms2OoAuQZeeX6AsBBjyW4/AgU4NjBafj+cf7S7MY
	7Kh7/ZXdSTtRZ9uwX2i5YMsGj5j1JibsBKKZARQOkXdYifAlL+gcPRAUkrCwGkAguD3FgN
	ANx019KPS3XZArgZhr3v/7ngtE8B9Cc7QwNjjcZvBmIPyHDw2avGieG0NAQLcUKLk0Uysk
	7R0CR9ju70YGRTU51uj7HfXwOINQR09eq8hBMjZUhn6CWSmFpL50yoneP/aARw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733924892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcEdyf32adcRhq16rtWJRAyApwazxa43Y8h9mC5uJpw=;
	b=uGWJ1/QJNPCk1yC0pohHZHR/KTLJ5f/gqbruvx+vLUe+FfiAu8MBPugFmO1OS8sANofSdq
	tSQ1JxBa0i/sKKAA==
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
Message-ID: <20241211134811.wM_UADhQ@linutronix.de>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210160556.2341497-3-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_054815_345147_D2EB768B 
X-CRM114-Status: GOOD (  17.53  )
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

On 2024-12-10 17:05:54 [+0100], Arnd Bergmann wrote:
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>=20
> gup_pgd_range() is invoked with disabled interrupts and invokes
> __kmap_local_page_prot() via pte_offset_map(), gup_p4d_range().

s@gup_pgd_range@gup_fast_pgd_range@
s@gup_p4d_range@gup_fast_p4d_range@

The functions got renamed=E2=80=A6

> With HIGHPTE enabled, __kmap_local_page_prot() invokes kmap_high_get()
> which uses a spinlock_t via lock_kmap_any(). This leads to an
> sleeping-while-atomic error on PREEMPT_RT because spinlock_t becomes a
> sleeping lock and must not be acquired in atomic context.
>=20
> The loop in map_new_virtual() uses wait_queue_head_t for wake up which
> also is using a spinlock_t.
>=20
> Since HIGHPTE is rarely needed at all, turn it off for PREEMPT_RT
> to allow the use of get_user_pages_fast().
>=20
> [arnd: rework patch to turn off HIGHPTE instead of HAVE_PAST_GUP]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

This version works, too. Thanks.

> ---
> There is an open question about whether HIGHPTE is still needed
> at all, given how rare 32-bit machines with more than 4GB
> are on any architecture. If we instead decide to remove HIGHPTE
> altogether, this patch is no longer needed.

HIGHPTE isn't much about 4GiB+ but about the page-table which is
offloaded to HIGHMEM. Maybe it is more likely to be needed with 4GiB+ of
memory. No idea. X86 had support for up to 64GiB of memory and is the
only architecture supporting HIGHPTE :)

I guess if you have boxes with 4GiB+ and can proof that the performance
improves without HIGHPTE (since you don't have to map the page table).
The question is then how much of low mem has to be used instead and when
does it start to hurt.

Sebastian

