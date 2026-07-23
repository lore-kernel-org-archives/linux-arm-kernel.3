Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67A3C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iglblMPnjAGanPHzfwJ4G7yTcJ+FyPGK1MRMDiMSvoQ=; b=Lo7wwkLYaa6aPFqeMPQMeMkuJ1
	et/dLlULRIAphVrPcjiOnd0/Y8cjPpg6VhBgk1e9xA2+kVlGQhDLkqd7gXV9l2vWRu/RW45COWg5T
	p2K7T8THpgviHkjhM/v79JJOlIg+NFz/f8p5/SaSwERK/cKysbBh8CAMSE11R+PLZNXxE174xFI5t
	t9RzPj1sLv91xtyjRHZwnwJ3tM9ov9zjm4KUuKiUVrmCc5rVOey0/TL3VoKaL6YtQxWurSpct12DA
	q9B1pDTKYzYZzFl5gnr4xMxy08RzO62xqIncuhQzTu+AStTrvVdeIFAlgnZKjP5OC22p0lq0f/tGU
	le51Q5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn2oU-0000000FFze-30Sm;
	Thu, 23 Jul 2026 23:26:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn2oT-0000000FFzU-4744
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 23:26:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21167600AA;
	Thu, 23 Jul 2026 23:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2061F000E9;
	Thu, 23 Jul 2026 23:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784849207;
	bh=iglblMPnjAGanPHzfwJ4G7yTcJ+FyPGK1MRMDiMSvoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JgkzM7dCM/Zxzo/X33WrAwQ6AAb4lf99G+tDra7/PJLz60BVyuGbnByOdwXTvCHUr
	 8ixHDSHqInlknVMXcQa9n0XkZXXdkSNo2VuXqP8GFWbHnVhkRGfTdswcCbcqyHGfmk
	 OlbDd+NmHmHOgbEeFTTzgxwjrDukDaeRj2Aaa/Uc=
Date: Thu, 23 Jul 2026 16:26:46 -0700
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
 <den@virtuozzo.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v6 0/5] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-Id: <20260723162646.350cf3bf415a0855140d139b@linux-foundation.org>
In-Reply-To: <20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org>
References: <20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org>
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

On Thu, 23 Jul 2026 16:16:30 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Kernel page table walkers fall into two broad categories - those ranges
> where no exclusion is required via walk_kernel_page_table_range_lockless()
> and those where exclusion is required via walk_kernel_page_table_range()
> or walk_page_range_debug().
> 
> ...
>
> This series works around this by #ifndef CONFIG_ARM64'ing the mmap read
> lock in vmap logic, then partially reverting commit fa93b45fd397 ("arm64:
> Enable vmalloc-huge with ptdump"), keeping the enablement of huge vmap
> support, and removing the ifdeffery with the partial revert patch.
>
> ...
>

Thanks, I updated the mm-hotfixes-unstable branch to this version.

> ---
> v6:
> * Rebased on latest master of Linus's tree.
> * Updated: 3/5 to drop the init_mm lock over page table allocation in order
>   to avoid deadlocks due to init_mm -> ... -> fs_reclaim -> init_mm
>   dependency cycles, as reported by Chaitanya with thanks!
> * Small cover letter typo fixes.

Here's how v6 altered mm.git:


 arch/x86/mm/pat/set_memory.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--- a/arch/x86/mm/pat/set_memory.c~b
+++ a/arch/x86/mm/pat/set_memory.c
@@ -50,7 +50,8 @@ struct cpa_data {
 	unsigned int	flags;
 	unsigned int	force_split		: 1,
 			force_static_prot	: 1,
-			force_flush_all		: 1;
+			force_flush_all		: 1,
+			init_mm_read_locked	: 1;
 	struct page	**pages;
 };
 
@@ -1250,7 +1251,11 @@ static int split_large_page(struct cpa_d
 
 	if (!debug_pagealloc_enabled())
 		spin_unlock(&cpa_lock);
+	if (cpa->init_mm_read_locked)
+		mmap_read_unlock(&init_mm);
 	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
+	if (cpa->init_mm_read_locked)
+		mmap_read_lock(&init_mm);
 	if (!debug_pagealloc_enabled())
 		spin_lock(&cpa_lock);
 	if (!ptdesc)
@@ -2123,8 +2128,10 @@ static int change_page_attr_set_clr(unsi
 	cpa.force_split = force_split;
 
 	/* Avoid race with concurrent CPA collapse. */
+	cpa.init_mm_read_locked = true;
 	scoped_guard(mmap_read_lock, &init_mm)
 		ret = __change_page_attr_set_clr(&cpa, 1);
+	cpa.init_mm_read_locked = false;
 
 	/*
 	 * Check whether we really changed something:
_


