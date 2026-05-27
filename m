Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB57BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS0Qvfn3wnYHQZFbMC98i7Jr1S1IM77hBEnuir22yHQ=; b=WbMrPzu2CcCqPNV05OV+fJAgpC
	6bM3vcRoFWXH4LxF38LkkjQ0pIlgF0p84invqgPVhnQzwrQ2nZ07LCoUxaoDNUkLf4SnL4Su+ft/+
	vk1oBNdmjDbs0nIoSMn527Yt+07MNymlLYbTIhHyZVTOPLhAa0zpxzA/kuv0R/NQRSNWTDcUj5XCs
	gNgJzGrbi3eDTjewBkJJdpciLSkK2BES6rABNifz9pXXPgZQSN353ak1pIZ1S2BBfBL6Kex52gjzi
	8hDt62I/8uG5UklY+r0zc43isuj8OiKUTz1LLw9+l7R5kQj4kfZAGxHCRawfqwKRyD3IgQdWo1KIB
	KeCuJQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9pG-00000003Yih-0uFn;
	Wed, 27 May 2026 08:41:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9pD-00000003YiH-3SIK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:41:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso97759655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779871273; x=1780476073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DS0Qvfn3wnYHQZFbMC98i7Jr1S1IM77hBEnuir22yHQ=;
        b=J2QgYJFqZIZ9g9J2t4iTTZF1ponuwGfunRYaW5m6XKD9i9WiX9zXAhfZnqHPfnWaEg
         L1dtm8+P3zRX6wvQbDfzMVzwgLAzWeyj7BGLZtYRODtVTJ5iGMHEyIsmlPjyKathg8tf
         6LOlEwizucJExz9FxWldAFX8RzPnmSBhl7+ykXX2zGwuO6KmiED4mclZV4/63XnPfla/
         pkO0voR1F0dLkStkDd8jd5cStpay2FnfuBZ+h3Cz3D34tD56C+AjcWXfblkcDvyQSc/r
         xee8LoHAhXV/Hs3TSyZytU9wf/4d/Ey+4GuNihC9+/kbM8Ft+xQj/Sken11ziYypSoUB
         VEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779871273; x=1780476073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DS0Qvfn3wnYHQZFbMC98i7Jr1S1IM77hBEnuir22yHQ=;
        b=RHybgWVhtiBQihSu4bG8ZyfTyr8qG5yVBwKcY7Ydn9ZyVUp23+flu9e5TT4tHJgCTK
         8ciePqkJapL4h66ZUWPbttfjlVqdNBrr8U1cAltlWDzldH/C9PAgJ9m2FtEGml0avBsV
         eph1NscwLX43wJ8wfUAx1vG6bx0+fMUjBGIH51BUD+ItPYWm3Yy5Tp596ZnMNYkPbYbc
         2ibJ/FEG3t6FU6WVuUCdHqswlLwsU/M9u88I1p/4KocRNIcPDOUG/z8TxfeFalp/pNrn
         AvVRmT1VrrdowRPfvOxg6YZIKQwarJVaskJUAYrxYsZoQQ0+WGQBDy2AxQiFiOESv31z
         EHHg==
X-Forwarded-Encrypted: i=1; AFNElJ8KC8dyDtiUTLkV8PE4PPrLUjqAP4AsfQYX4givhmPycpe5o8H4QBLLgROaoGXH2z5afOqMy6DZMYOw5x5gBrXu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/oRUzvACAlTA1ELgGdWpUgpN1k9lCtzevntu09EqEws/DbIlE
	k6ojeve4S3qgfb/1ItWXRFFz9C1l5eUHsKL2newgJaO6j7UkCU8J1mrUJ5aLdZIjN6XlWQ1j5Xv
	PHGpo
X-Gm-Gg: Acq92OExQbMTfqyv4VKemY0XiJwtD2lxQwvsAVGyyNKWu6DW7MWDMmqxXDvQ7Vpkwbl
	zIl07D8n3ciCtL2nJ3zqcCukn/Dj3+RykHgtagVRRstTVQFR1Z+LjYEkL4K27HiBdEVseMJEn7p
	SWX2weSUymV+OQKaqw03WntavDN/NJgpOVLwQxaxedwk/74xhf35ukRbc29athz8CcHGJCqjmP/
	92pVp73O3AHsud6Jp625BHug2atWcuN5bkqWrXmGHpYuk0WaSkocWDtY2J/wGxFQHeY4NKrMA8p
	3tRmK3RQDmEiR5SOrNW1nF786GoyRARdUzBRhRvyg58w/TgcnTx15fJNuelTjEwfEkbijsDaQgA
	EhS4pra1GXEr2Vulh1/HYZL2PbGhTt8nTKA3fJirzlci+GGgD3UykCkKgOvsONq8p5jb4/Bue30
	u9BjAJteAEHfv18+tdUQrVv3SvqVWMPNvV4L2NNya42mQO
X-Received: by 2002:a05:600d:644d:20b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490426c5a3dmr265077595e9.16.1779871273108;
        Wed, 27 May 2026 01:41:13 -0700 (PDT)
Received: from localhost (109-81-80-71.rct.o2.cz. [109.81.80.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm472671585e9.10.2026.05.27.01.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:41:12 -0700 (PDT)
Date: Wed, 27 May 2026 10:41:11 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
Message-ID: <ahauJ9DAqBPnRi1h@tiehlicka>
References: <20260520204628.933654-1-longman@redhat.com>
 <ahQLVgj8zV4xQRh9@tiehlicka>
 <16b36b01-7da2-4ec4-aefa-f06216ec218a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16b36b01-7da2-4ec4-aefa-f06216ec218a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_014115_879847_19B4AF7E 
X-CRM114-Status: GOOD (  24.64  )
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

On Tue 26-05-26 15:55:09, Vlastimil Babka (SUSE) wrote:
> On 5/25/26 10:41 AM, Michal Hocko wrote:
> > On Wed 20-05-26 16:46:27, Waiman Long wrote:
> >> The GFP_ATOMIC flag is to be used in atomic context where user cannot
> >> sleep and need the allocation to succeed. However, it does not support
> >> contexts where preemption or interrupt is disabled under PREEMPT_RT
> >> like raw_spin_lock_irqsave() or plain preempt_disable().
> >>
> >> With the advance of the ALLOC_TRYLOCK allocation flag in the v7.1
> >> kernel, it is possible to allocate memory under such contexts by using
> >> spin_trylock to acquire the spinlock in the memory allocation path. This
> >> does increase the chance that the allocation can fail due to the presence
> >> of concurrent memory allocation requests. So its users must be able to
> >> handle such memory allocation failure gracefully.
> >>
> >> The ALLOC_TRYLOCK flag will only be enabled if none of the
> >> ___GFP_DIRECT_RECLAIM and ___GFP_KSWAPD_RECLAIM flags are set.
> >>
> >> Introduce a new GFP_ATOMIC_RT gfp flag for those PREEMPT_RT
> >> atomic contexts.  This new flag will fall back to GFP_ATOMIC in
> >> non-PREEMPT_RT kernel. GFP_ATOMIC can continue to be used in contexts
> >> where preemption and interrupt are not disabled in PREEMPT_RT kernel
> >> like spin_lock_irqsave().
> > 
> > Before we go this way we need to really be clear we do want to support
> > raw_spinlock (aka RT) contexts. This is a big commitment because it
> > dictates internal allocator locking that would have potentially a much
> > bigger impact long term. I would go this way only after/when we conclude
> > there is absolutely no other way and we need to have allocator in those
> > critical sections. Now you have a single place which complains ATM
> 
> We already have alloc_pages_nolock() which uses ALLOC_TRYLOCK internally
> for these limited contexts. So the support and commitment exist. This
> just exposes it via a new gfp flag alias. But if there's a single user
> and it's already disputed, we don't have to expose it that way indeed.

alloc_pages_nolock is a very constrained allocation context with a very
limited use. That is quite different from something as generically named
as GFP_ATOMIC_RT that one could assume is a good fit for RT sensitive
allocations in general.

-- 
Michal Hocko
SUSE Labs

