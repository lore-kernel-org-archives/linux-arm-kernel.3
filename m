Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13301CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 18:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwpO+pOOZTWBchQdW/Dv7jGhsKusDPQYZ/nVee/aPKo=; b=Mvxp0CLHKysvnRRefTXFvmKipT
	SK30iYaBEaQBNIyvOD6ppriEymHs+wSvueudgeTUBKWc6SkpMjvkMLWBsgWkBoMnPL+LMhdw3gmof
	G97Xaa/Qc2mPgZdGuMGMgX1qSFoD95ZDQkJJZb5vsTzujTV/AfXMfsg2UbcZDNoGR3SGdEuBMPLHA
	YSx0tspUHIGxOBjYD68lg7HdmyjrjOkkEjUP4ItJ4/cFfeoNax/jBUwdk3T9L4y30Ql2lDxFbPEEO
	2jpcXjBMvGw3pgdQAGhCdzGIDnY1Y6YoNnDJIC5EVocJvMq3yeG/DEaVh5q4E3t2NPxHylcjwi019
	5KfyZBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2Bl-000000088it-4Amb;
	Fri, 29 May 2026 18:44:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2Bj-000000088iO-32yh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 18:44:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C810942A85;
	Fri, 29 May 2026 18:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842341F00893;
	Fri, 29 May 2026 18:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780080246;
	bh=ZwpO+pOOZTWBchQdW/Dv7jGhsKusDPQYZ/nVee/aPKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BO85kgePRyguLqXdsSmYSPPbc2M9M1R9D7u7yNKftG8vO83z5DOcpC1hVIDZvumcT
	 QWxKTrqcHbY4mwtZyZS6Ri4wQ8M2wE5vozWmFRthBrdQTSjixI1eNMVZe401kMXp9x
	 VKQXxqMh1mY8BQveioCajwIz3qEgPD3Wz7WFV799FuuXrDcApB+DKzZxCKjOMBtPc8
	 xHIQ50diUzeyAWDTfME/K/4V9hozcFX8TbJXdud7+hlk9p/n3YoI3H2L1udoyJNVo2
	 5aUAa1AzYtzcKeTBeKIaIbwzo5WR4sOI3s9svJydmcCnk5t2Y6uhwHfkazwN33Ed9k
	 vzcg2+4l1sZBA==
Date: Fri, 29 May 2026 08:44:05 -1000
From: Tejun Heo <tj@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
Message-ID: <ahnedQ33ZH8ogjbC@slm.duckdns.org>
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-3-tj@kernel.org>
 <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org>
 <DIUMP21RASZI.2VNQV45RIL209@gmail.com>
 <3901fe0537edee9d7acdfd91695ead28@kernel.org>
 <CAADnVQJ+CqAszS2sSVu7gSfA_g4oaTR+SWmLNMX3_8c=OdR7NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQJ+CqAszS2sSVu7gSfA_g4oaTR+SWmLNMX3_8c=OdR7NQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_114407_804626_EF6EF1B2 
X-CRM114-Status: GOOD (  16.72  )
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

Hello,

On Fri, May 29, 2026 at 11:38:21AM -0700, Alexei Starovoitov wrote:
...
> > 1. The racing write. set_pte_at() and the scratch installer's
> > ptep_try_set() hit the same PTE with no common lock. On x86-64 and arm64
> > set_pte_at() is a single atomic store, so it can't tear against the
> > cmpxchg, but a plain store racing a cmpxchg isn't atomic in general.
> > David, is that the worry - an arch where set_pte_at() is split and could
> > tear - or something else?
> >
> > 2. The SEGV. It's a BPF program failure propagating out as a SEGV. Maybe
> > not ideal, but as long as we surface the BPF error properly, it doesn't
> > necessarily seem broken to me.
> 
> returning EBUSY because apply_range_set_cb() hit scratch page
> is SEGV out of arena_vm_fault() and arguably ok-ish,
> but bpf_arena_alloc_pages() returning NULL because scratch page
> was in the range just sucks.
> Earlier bpf prog passed the wrong arena addr to kfunc and triggered
> that scratch page. It broke the contract and kept the pieces,
> so ok-ish too, but overwriting scratch page with proper page
> during bpf_arena_alloc_pages() is imo much better behavior.
> That scratch page will cause all future bpf_arena_alloc_pages() fail as well.
> Hence I prefer that check removed.

Yeah, let's do that. David, would that be enough? Or are you still concerned
about set_pte_at() competing with ptep_try_set()?

Thanks.

-- 
tejun

