Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E5C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui+ORj1/z8nhcz2rVBcwlFO5TeUDA1QRckff/Axxhfc=; b=vsNjzF1HlnZOc1/38Y0qBdQKMt
	GKENTm4fynkerKWAZ4Nxi5kt9DSxLEWDWV9Bsza2Ypv0xLzMVGWnEw6R5p6/JwZn67wLEwXbFfSpj
	n29LWq/FjIq8lq8m7F/NcvcW04gWVcChePEBh66hpe1IXxjRv5nZfAniyKhYvk82sSyLGOAksJgqa
	b1J3oayGPIrJeJ7hnFwxZaPWwt834fAJmb8pipG8Yp0tvpSIhD4OEyBsuqMsvC1kZrkzV8GXchpjv
	ZC56K4YkRj4YCNdUnrjWr82bfkwhmSfjqAvjambmSA0OXap9GCgMmttLP1ofizyovRjkYJEwVYyH6
	dbG2WOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkoFE-000000038Hw-1eDe;
	Fri, 17 Jul 2026 19:29:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkoFD-000000038Hl-0TtH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 19:29:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30B99600DA;
	Fri, 17 Jul 2026 19:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5171F000E9;
	Fri, 17 Jul 2026 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784316549;
	bh=ui+ORj1/z8nhcz2rVBcwlFO5TeUDA1QRckff/Axxhfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RBUssh5EaLehERy4Cgi0QGmJnAOAqgTzVfUX3zA0MRCL/hp/gU1KuyrB1kS6Q7wSc
	 3CuE6RDTXx/8Yl95lAMi7m9NoXKXnJyX7bcJPQVkywGVvyBnHKTn7ZcFYO3itBGKP1
	 rCb1/Gdr+DbERUhJfZim7lwhNLXLpKzROb62w/uo=
Date: Fri, 17 Jul 2026 12:29:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt
 <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Uladzislau
 Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain
 <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, David Carlier
 <devnexen@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Denis V. Lunev"
 <den@virtuozzo.com>, stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v5 0/5] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-Id: <20260717122908.3d9f4a8ad76a748d859b43f2@linux-foundation.org>
In-Reply-To: <20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org>
References: <20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 17 Jul 2026 18:30:06 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Kernel page table walkers fall into two broad categories - those ranges
> where no exclusion is required via walk_kernel_page_table_range_lockless()
> and those where exclusion is required via walk_kernel_page_table_range()
> or walk_page_range_debug().
> 
> The former category is used only by arm64 arch code operating on ranges it
> both wholly owns and does not concurrently write.
> 
> The latter category consists of kernel page table walkers operating on
> ranges that are wholly owned (but which need exclusion against concurrent
> writers).
> 
> The lock used for exclusion is the mmap lock, and for kernel ranges this
> the mmap lock on init_mm.
> 
> ptdump is a special case being both the only user of
> walk_page_range_debug(), and the only case in which it walks ranges it does
> not own.
> 
> This presents a problem, as page tables may be freed under ptdump. And
> indeed there is a use-after-free bug in the kernel as a result, which this
> series addresses.
> 
> ...
>
> This series works around this by #ifndef CONFIG_ARM64'ing the mmap read
> lock in vmap logic, then partially reverting commit fa93b45fd397 ("arm64:
> Enable vmalloc-huge with ptdump"), keeping the enablement of huge vmap
> support, and removing the ifdeffery with the partial revert patch.
> 

Thanks, I updated mm-hotfixes-unstable to this version.

> v5:
> * Rebased on latest master of Linus's tree.
> * Accumulated tags, thanks everybody!
> * Added additional commit to fix race between CPA collapse/attribute set.
> * Slight commit message tweaks.

Here's how v5 altered mm.git.  This is from the addition of [3/5] - no
other patches changed.


 arch/x86/mm/pat/set_memory.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/arch/x86/mm/pat/set_memory.c~b
+++ a/arch/x86/mm/pat/set_memory.c
@@ -2122,7 +2122,9 @@ static int change_page_attr_set_clr(unsi
 	cpa.curpage = 0;
 	cpa.force_split = force_split;
 
-	ret = __change_page_attr_set_clr(&cpa, 1);
+	/* Avoid race with concurrent CPA collapse. */
+	scoped_guard(mmap_read_lock, &init_mm)
+		ret = __change_page_attr_set_clr(&cpa, 1);
 
 	/*
 	 * Check whether we really changed something:
_


