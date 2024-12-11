Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C624EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7zPCRbNobZB2rLY4klNUfuL4Nc1TSS5AqwC+M05YI8=; b=FwZ3NogsZbYVHRcNoj431gQGnU
	8+itDxUPfxOaXleSIPfAjcb6FwgUMGHzJFC8i3S2BGO2HcLr8RvYQRlAnij1rjqYpP6mrxBvlJmvK
	+45lEevrICUXEQgNSzxHbDK6t1KTMQuK6Wci1ubC7EDoHHaEh09qK1eLgcsN+BIjAE4zyj6vlmMUs
	+GaXye+4fOfACRdORKbrl1yEpfg18+JkHj0QaaaXv2QyBNC7dW7JocFhx+QfhCV7e/d/iP+LaxODv
	UcLOzmKxC8KpYgSRgeeKbMQXhvba9shnYQ2+QIZ7EY4nxB89K2Cu32iRkZm+j0lhQjKwre5OCXR3Z
	MabgJ/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMoW-0000000EzCZ-1IH0;
	Wed, 11 Dec 2024 13:31:40 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMmc-0000000EyqJ-2UPo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:29:44 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso723251e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733923781; x=1734528581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7zPCRbNobZB2rLY4klNUfuL4Nc1TSS5AqwC+M05YI8=;
        b=Dh4LpkartsyVlqMXoXxFnAA9IfXiJ3XMW6YHTV9kgZd9aDyGOU+2hf9Eul1NkA7OZe
         V3lzDHwD+f3R7DayukXbecyKv9Nmikb/8WNHqFwTHr7dA4MlBj6IJ+NOloqFG+wHQ7XH
         uijbJ7kpOBiHs/Oy/5uvyHSb68kTz64crPOjkcvJYsr803L9Qyn0Kq1iPaPDmpG0f3fj
         4onbyDQkxgj2M4ZFhJ7bQEYX/wB4tEL4oSP/kxuHtmbJM8CyrzParA83R3YVNwq0+O+s
         eWtf2VQYLCT7FnzYKh3o/TMFMBV1HCRGBtAc+YMoKQvCDBxdpxq0wpmZjJlf5SGluUGK
         xV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923781; x=1734528581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7zPCRbNobZB2rLY4klNUfuL4Nc1TSS5AqwC+M05YI8=;
        b=P2kwFPifIJluChc/IlU0JNNQYcjcfrwBue8GrMi0bOzhFoTDXA3GqieHBnLTgJYsW+
         +kKmrHGwJz2n4+zhj3LYlx+sVuArlPMzbMjpYpp1d4ZsVQ0rt3v7hCaAbWh0P9fE80Eg
         yMIHiCgpF+ojs5eWo4WFWBdL+CpIZcNckii82sDWkwO1PBOWPAJgvfzXKhWEAn9pq7OO
         x/kL0KmDwrq6C2zBJJtOUdUpQRi1lydGWT7/Bq/TPox9OgAarhHyBktoaOURcdaWJJaw
         EMu479iFLaMKDJ9cS77Z8r6XeK+U3QRo2Kz+XYLJAD0ur20xwcRIBaOAL8RwkEJzwDq1
         Mj5Q==
X-Gm-Message-State: AOJu0Yz3BbKs2/gb5rX47OgtJcr0f6bI9M8FuZFKiJ8BGUOmxEkjmGn9
	4n3GHqX+nu36dJE0qqXOFxt1Q9LxGCNak9Wh6M7/5UBY5X7vIiJpIuAV/pbDl+rYnTLQBdrH7tK
	LHNFPjUXrYe9WsiNfLjY9Rxrw9stG0MHr58qcgw==
X-Gm-Gg: ASbGnctvfmvt9FEJp2D+PuSvTjqvupzBYWHrm6EG41euLCjckZ5CIYJ4uxowbVerkgJ
	6ltJKZ+uIIdbA0YRjBh8bS/6xY0k+AfX0RA==
X-Google-Smtp-Source: AGHT+IFgSwAzChMV6MPtTrzqAT5fEZJhpVqpZ7rEneJDnxJfXq2+f607r/zOzxJe6hnLdIwQ0jSdAOyNE+c9jLtr2FA=
X-Received: by 2002:a05:6512:3d9e:b0:53e:2246:c262 with SMTP id
 2adb3069b0e04-5402a6ba964mr927083e87.0.1733923780650; Wed, 11 Dec 2024
 05:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-3-arnd@kernel.org>
In-Reply-To: <20241210160556.2341497-3-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Dec 2024 14:29:29 +0100
Message-ID: <CACRpkdZaoD2vqbCi1AFUa6mF2_=c3Nu4R0CvxFAep0VMgtMtOQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Russell King <linux@armlinux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_052942_649500_790303B8 
X-CRM114-Status: GOOD (  23.48  )
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

On Tue, Dec 10, 2024 at 5:06=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> gup_pgd_range() is invoked with disabled interrupts and invokes

There is no gup_pgd_range() in the kernel, is this patch a bit
old?

There is gup_fast_pgd_range().
See 23babe1934d7637b598e4c9d9f3876e318fa63a4
gup.c contains:

  get_user_pages_fast attempts to pin user pages by
  walking the page tables directly and avoids taking locks.
(...)
   Let's consistently call the "fast-only" part of GUP "GUP-fast"
   and rename all relevant internal functions to start with
   "gup_fast", to make it clearer that this is not ordinary GUP.
   The current mixture of "lockless",  "gup" and "gup_fast" is
   confusing.

So fast GUP is supposed to be lockless, and should just not
have this problem. So it can't be addressing gup_fast_pgd_range()
right?

> __kmap_local_page_prot() via pte_offset_map(), gup_p4d_range().
> With HIGHPTE enabled, __kmap_local_page_prot() invokes kmap_high_get()
> which uses a spinlock_t via lock_kmap_any(). This leads to an
> sleeping-while-atomic error on PREEMPT_RT because spinlock_t becomes a
> sleeping lock and must not be acquired in atomic context.

I think this needs to be inspected by David Hildenbrand, if he consistently
rename the GPU functions to be "fast" and there is a lock somewhere
deep in there, something must be wrong and violating the API
contract.

> The loop in map_new_virtual() uses wait_queue_head_t for wake up which
> also is using a spinlock_t.
>
> Since HIGHPTE is rarely needed at all, turn it off for PREEMPT_RT
> to allow the use of get_user_pages_fast().
>
> [arnd: rework patch to turn off HIGHPTE instead of HAVE_PAST_GUP]

HAVE_FAST_GUP

I'm still confused, how can something that is supposed to be
lockless "fast" acquire a spinlock? Something is odd here.

> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> There is an open question about whether HIGHPTE is still needed
> at all, given how rare 32-bit machines with more than 4GB
> are on any architecture. If we instead decide to remove HIGHPTE
> altogether, this patch is no longer needed.

I'm more asking if HIGHPTE even acquires a spinlock anymore
as it is supposed to be "fast"/lockless. If it does, it is clearly violatin=
g
the "fast" promise of the fast GUP API and should not exist.

Yours,
Linus Walleij

