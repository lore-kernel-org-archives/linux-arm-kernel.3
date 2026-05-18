Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E56CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oymZOlMj6aZm2jiVzI4Upf5k8ifuN/pveVWUu4TydLQ=; b=bMwMP9J+OeUIZP+VUDYYzJvoD2
	MXeXXi45XN6wkRY6l02mpdAsxMtjgu6TXRYI+A644GW+ElbXy5yOH6ZkNOFVUSPp/TjNGhubNiC2a
	FErBWX8A6MWHvwqpIvujvkaYW/zgKwjr4mqUSX5+Fq5OHuD8JqRBwD8a3bsDGJsFrIm/vXBw1gqpU
	IWAKufaDa8SassyssZtcwZnvk3XYU+fLeTG87UOSqb7/yKqTzl3NnMb7B/mz3XanF/PLlFOPDQ7Z5
	ghvLZY7PBMxc9W8YrGqnQsMLld52LZS0Y4/cWsdFqr1WM0W7lCTsRnIdIJsxNXGR9PeLc3dhlHcBS
	18FPC4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsHc-0000000EZ4n-2Bpd;
	Mon, 18 May 2026 07:21:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsHR-0000000EZ2N-2uYs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oymZOlMj6aZm2jiVzI4Upf5k8ifuN/pveVWUu4TydLQ=; b=bcr6ZW+6uMYVPPdYnu1n5lZvLE
	SGn2E8l0rK+cjQ+R6Sj5HL59towTXB6p12v2CEvZTRYmeGs2QkOf4gLowmIrvuI3JiuVpU2DOQQiu
	ndfkYABp9AVnYFrMPoKMGIujfaB+EX05Vg83yfMS2mbf0dy0/Ghhaty6xMyz/eRsGISxsZdQitFOR
	kBmGZPmASGz9S7TSlR7rOPtuNlSAhUKb6vCKWR0NYuqbdYs6gBQeYkthJrz5ORo1qBuec7q+BFWEp
	Y0NW5xhU2pyfHfK2jwpm1QeszCSqZfOkFSFOnoR0fhrifOkzGQX8T7FNYmekXVm65m4u8QGeakwRx
	sx+RmmBA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsHL-0000000A9JE-24Bl;
	Mon, 18 May 2026 07:20:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BBF7B300329; Mon, 18 May 2026 09:20:42 +0200 (CEST)
Date: Mon, 18 May 2026 09:20:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
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
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] sched_ext: Sub-allocator over kernel-claimed BPF
 arena pages
Message-ID: <20260518072042.GP3102624@noisy.programming.kicks-ass.net>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-8-tj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517211232.1670594-8-tj@kernel.org>
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

On Sun, May 17, 2026 at 11:12:31AM -1000, Tejun Heo wrote:
> Build a per-scheduler sub-allocator on top of pages claimed from the BPF
> arena registered in the previous patch. Subsequent kernel-managed
> arena-resident structures (e.g. per-CPU set_cmask cmask) carve their storage
> from this pool.
> 
> scx_arena_pool_init() creates a gen_pool. scx_arena_alloc() returns the
> kernel VA. On exhaustion, the pool grows by claiming more pages via
> bpf_arena_alloc_pages_sleepable(). Chunks are added at the kernel-side
> mapping address; callers translate to the BPF-arena form themselves if
> needed.
> 
> Allocations sleep (GFP_KERNEL) - they may grow the pool through vzalloc and
> arena page allocation. All current consumers run from the enable path (after
> ops.init() and the kernel-side arena auto-discovery, before validate_ops()),
> where sleeping is fine.
> 
> scx_arena_pool_destroy() walks each chunk, returns outstanding ranges to the
> gen_pool with gen_pool_free() and then calls gen_pool_destroy(). The
> underlying arena pages are released when the arena map itself is torn down,
> so the pool destroy doesn't free them explicitly.

Should this really be part of scx rather than be part of the bpf-arena
thing proper?

