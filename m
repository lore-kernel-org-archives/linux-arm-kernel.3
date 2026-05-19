Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153FBCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZXiomvDJKM07Dk9Ji2mrTmXN5fYHCggl6JxDynWw50=; b=4UkGPBERqvdz4GR9KK4L83bi15
	fX3iHwalCcSNQLHZmChK3D0lsekreFhphVX/58ZctfY4OPSadmKQ+pM5UqmJOfzq+q1hMgatlVplb
	/1eoi+7exNRHPd1EnXRHWxHQVBD7uJ+KhmYL4xRstHfTgbpCZKJijwmdsxILunbeWtE+7LHuEq41b
	FT1DSAS66P78FnNcJmeQjkq4bZSyWRSBc94tJa5Ffj/NKxVHNqAhwDrhzIFKfYbBieN/VNZ7fFzxv
	pS+wsYxcRooqmNnEWnZDDIlfaKfx9M++tFGqp6/JZ4gr8/w+Dip+YfIkZR0D4jzSoluSDmFkhTS95
	kmATuFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNyj-00000002LOA-37bC;
	Tue, 19 May 2026 17:11:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNyi-00000002LNw-30RV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 17:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E101160229;
	Tue, 19 May 2026 17:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6DFC2BCC6;
	Tue, 19 May 2026 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779210695;
	bh=62vx8mX+NUzIAl4O0uDmSYpMMtEoa4nb7RMkDjQFU9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRUJWOs7kfmxRw1IyuEx9VNmI+HtBY+RUHfIO4Wrcr7Z60Py1vJdh8cqsfX/MI9sX
	 85wED6Nhx+Wv8GGEbyqmzcIWf2zSmFf29XHERwlPl2D9pT49EizsxHThcfKl4WkAb/
	 NEkW74HrJMDH7B/47xhcIIDNSgYxQemoqodDbhMlMd9EoW7InETveW2nAc3hRkWplH
	 9Jj86eOqcU0sCrYlJNdX/JUkiyfP8GHwb3i40GL5hWX8Fawr8nkqGdKfOyVPFq5e+5
	 88qkzSaYK7+TLbI968s35OlA318ZNtHjcN8Bvq6zXPiOtOSWC7E+W+RbtMTW07doeJ
	 vJqxr1j+6uXqA==
Date: Tue, 19 May 2026 07:11:34 -1000
From: Tejun Heo <tj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot
 installs
Message-ID: <agyZxmHoueGwBAQg@slm.duckdns.org>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-2-tj@kernel.org>
 <9ba50fd2-077e-4291-9276-9adb18186873@kernel.org>
 <agtuPrgIDNKSu2Oo@slm.duckdns.org>
 <2f02d90d-cdc9-48ef-abe3-99e00f22595f@kernel.org>
 <297658c4ae2d6e7103f5968efc936224@kernel.org>
 <04b03066-86d3-4c0b-b077-307fd0f3bc9c@kernel.org>
 <5590fd3d-dae1-4070-b52f-bc40982ac678@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5590fd3d-dae1-4070-b52f-bc40982ac678@kernel.org>
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

On Tue, May 19, 2026 at 11:40:48AM +0200, David Hildenbrand (Arm) wrote:
> On 5/19/26 11:05, David Hildenbrand (Arm) wrote:
...
> >> The only requirements are that the kernel doesn't oops and the
> >> violation gets caught. Beyond that, behavior at the address is
> >> unspecified, and which installer wins the race doesn't matter as
> >> long as kernel integrity holds.
> > 
> > You'll have inconsistent TLB state.

Wouldn't it still be either or with both cases being okay?

> > I really don't like that approach.
> > 
> > We should really try to just take the lock, and remove any code under the lock
> > that could trigger such unpleasant deadlocks.
> > 
> > Is that feasible?
> 
> ... or can we run into similar problems with kprobes? (I am obviously no bpf
> expert ...)

Yeah, I mean, that was just the first TP I found scanning the code. Any
kprobes or other TPs in the path would behave the same.

When this fault triggers, the BPF program has already malfunctioned, so it's
not going to be a high frequency path and performance isn't a primary
consideration. So, anything that can ensure that the kernel doesn't crash or
lock up would be fine. Any better ideas?

Thanks.

-- 
tejun

