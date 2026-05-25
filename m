Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70502CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGM0HnwsQ+sAC0d9nq1+H2+fQIQXp7hPnnfrzxBYUA0=; b=3lLWe9kBb+QR41pQvS1UyPpYuJ
	PFEKfjh7uYniW8QOH5RqOYGYu85vcOrPWgEMTXc92L2k11HO3ULMAadxAmZ686WOOrDYxpgkBgehf
	T0AXpJXxGi8Se/IrIuBKX2NlgD6GS9vP/RNbJZFPmvM2/B7iGO/sF5P7j/ZYkjLqq0VxIlnr2jd83
	2DVbrExXOdCnMGYUyJnTNhQgObhmiw3iZllJznc4wyc4/8lELI1k9pXeiVjU9gEj7JLFqMe6zQVEq
	CsIKKNrlCuDT4qQT7Z21bgewgksYRMtrVLTU3Jj+p+H9v5UFtLtdAXbUROFaUFdnELUoFN4viYmdC
	uLR+3EmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQsx-0000000GgTa-02bN;
	Mon, 25 May 2026 08:42:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQst-0000000GgSc-2xXC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:42:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso44881545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779698521; x=1780303321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGM0HnwsQ+sAC0d9nq1+H2+fQIQXp7hPnnfrzxBYUA0=;
        b=TBwWhb7mL4dmxgchfoYYAFcCgHwFu4D0qbAyva96h1NttbiY3+Rmv6IMbqFqEjZW2d
         eA8tVl7+P0h7WGdj+gyZeYagnQU+0Z5jKECcSwh8P/5kHuuCmhwOq2QA0VzfRoz6dvJQ
         LFsncSJf+ht8bUgWno928mqsS4KFoGfxQXfVKvasnzhc/5hrfyFqwENCVFOJnq1NIeGL
         TNBzPyJ99E2uObt06VJJGKRnglWGa9BwdE9qgpu+OJKZeWPTl+KOB92zu9S0m+5ZMltX
         L0PQQdTGUynJQCrEwPJFzJ3snY8DuE2ROGU8E2JB6eizvSypZCXDNXPCfSpL3PyhAvAb
         KJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698521; x=1780303321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGM0HnwsQ+sAC0d9nq1+H2+fQIQXp7hPnnfrzxBYUA0=;
        b=W770CoYopa2hrYM4LFNcU6IVKjNE9Cx0wVvGA9zWOBApNMQxea+KgiTQnXdHmHnCYk
         qj155bBx04XZxmgjJMzI3v4+tVQv/vkul8v2IFGilnBx1Q64bXpJF7zSafYaAVk1G9U4
         uSmOn2REPhvEa/0JSPX3pwx3OWvph31NrM1T/ZdByJgYWblpn+r3yrVkrQl4/9mAmreO
         u1IAVY3Agai9Ns5Rph8BAgr2J++4GVib2AbFrPNcONy+T8Dz5dgKaUjNlqEmKcYpmerk
         730VrMclFVxtb5xIW+jz96Fo4RXTT7/BCEIQ1id3ECdf5fCZAPrX13KuIqJsSjBpWMX6
         26ww==
X-Forwarded-Encrypted: i=1; AFNElJ8flYeZYzQNwqOyo6lkwQ1HQK7B1owVEK8yJ7TmYf/UljC0YBNELk3fHAd4k8+GLtftY7WEVMigMG5nDdU8pFGU@lists.infradead.org
X-Gm-Message-State: AOJu0YyDnYDtKBfrhKYndBgrHVJ57YcoqPH2zz8WbZv/ssbuMLGVuAoZ
	6AWZrZdtfGXgpUn4TjcOR1zYS787xazfTS+da2rWgYYgFvRBwkJHE2ZQLZMoiQF2U8w=
X-Gm-Gg: Acq92OE0lW/AVBPlv8YhZukW5S1VbleQhNuQ1qKrswidHMn3PVphIRUmlbYkcXwBmyv
	KvxoSV5zYPpHEdapS4I9ABervPIo2kMbBC5OAdbBCuGlhejk52LHNXlN9vprnaun6So0QXUYIG6
	iioiE05NfPaE+3WOVJDrWOtX03I1YxfjR6enzbzbVU7ddQuEiWogvnTLcA2Lo4adA1PTp10Ruqy
	Ssji1Mr445vyan0RljG2vp3kOtKBoZrKoDig5GIlYi+TeUZ7agQ20byAtB7eIC2Mg2wfVXjbghP
	mX0HeJfbnSt61dKc5BGy5ChuCSXrySme0ONkBLcp8pErCKJQhdJUF/NR40SvjnPUS/40eNghfVu
	M+m0cp3Dw6Ea6GPq8JMp9MwUChNq3Gou11igtGh3f7CTo+eLtOYgdg6tDOPZlAPU3pCOyu1KzVV
	v52aTUikUZ8rtUjB5BgfiIAVltfyH8jvgH5eDS
X-Received: by 2002:a05:600c:6095:b0:490:51b9:2309 with SMTP id 5b1f17b1804b1-49051b924b1mr152029475e9.29.1779698520913;
        Mon, 25 May 2026 01:42:00 -0700 (PDT)
Received: from localhost (109-81-80-247.rct.o2.cz. [109.81.80.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428ee444sm82000815e9.24.2026.05.25.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:42:00 -0700 (PDT)
Date: Mon, 25 May 2026 10:41:58 +0200
From: Michal Hocko <mhocko@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
Message-ID: <ahQLVgj8zV4xQRh9@tiehlicka>
References: <20260520204628.933654-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520204628.933654-1-longman@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_014203_763179_8CB11293 
X-CRM114-Status: GOOD (  17.43  )
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

On Wed 20-05-26 16:46:27, Waiman Long wrote:
> The GFP_ATOMIC flag is to be used in atomic context where user cannot
> sleep and need the allocation to succeed. However, it does not support
> contexts where preemption or interrupt is disabled under PREEMPT_RT
> like raw_spin_lock_irqsave() or plain preempt_disable().
> 
> With the advance of the ALLOC_TRYLOCK allocation flag in the v7.1
> kernel, it is possible to allocate memory under such contexts by using
> spin_trylock to acquire the spinlock in the memory allocation path. This
> does increase the chance that the allocation can fail due to the presence
> of concurrent memory allocation requests. So its users must be able to
> handle such memory allocation failure gracefully.
> 
> The ALLOC_TRYLOCK flag will only be enabled if none of the
> ___GFP_DIRECT_RECLAIM and ___GFP_KSWAPD_RECLAIM flags are set.
> 
> Introduce a new GFP_ATOMIC_RT gfp flag for those PREEMPT_RT
> atomic contexts.  This new flag will fall back to GFP_ATOMIC in
> non-PREEMPT_RT kernel. GFP_ATOMIC can continue to be used in contexts
> where preemption and interrupt are not disabled in PREEMPT_RT kernel
> like spin_lock_irqsave().

Before we go this way we need to really be clear we do want to support
raw_spinlock (aka RT) contexts. This is a big commitment because it
dictates internal allocator locking that would have potentially a much
bigger impact long term. I would go this way only after/when we conclude
there is absolutely no other way and we need to have allocator in those
critical sections. Now you have a single place which complains ATM
without much of an explanation why this cannot be really handled in
other way. Have you even considered any options to pull the allocation
from within the raw spin lock section?

-- 
Michal Hocko
SUSE Labs

