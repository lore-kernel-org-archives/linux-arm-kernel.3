Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAC3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z2zNKjRbgDz18AB/OdbEQN5wpqYTgFBDPBnDwJEk2E=; b=HP7NrTBVcWY6ZNDTeaHiNkOKjT
	ScabTd83GmXNCL7LHi+6Eju5fxpLieY6272NWQY5KnLfqEXEz7HiK3t68fUHNXYaZHVkN3glklADP
	OUsHhu4RrNH/dlqpE+qwLwXJTG7SijyJhGtIt3fvGbOid+X7U/or3ku1G7KyKvWdGxE/UwUk84Fr9
	ziZ+j459O5XAT6+CKCOxDdn7HYPPeX88bK4Ed3UONqHuwsiN0z+OM7BVZrpFEYR8iRLHjO4Inypj/
	7mz/J92GlLO54AqxW9CxejDGn0l1UFvtYpl4uwx9RS6d0fVrGeVEt2DEj4OEO5P9ZxJR2uNCzR3A0
	q/uahMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk17D-0000000FEvo-1cib;
	Wed, 15 Jul 2026 15:01:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk17C-0000000FEv2-0VoA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:01:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29ACC6001D;
	Wed, 15 Jul 2026 15:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95521F000E9;
	Wed, 15 Jul 2026 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127696;
	bh=9Z2zNKjRbgDz18AB/OdbEQN5wpqYTgFBDPBnDwJEk2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPiuISMOHZKbNJ/q+U6zBqKZl6i/54DB+RZCuayF6sI/kqfwtjdaALQ69uJ88Y9Tb
	 t9oj0Gwrjx61elraU/lF3M+8XrCqQFajfZU2mv8YfRrP78r/Wx340y3KQ4iUlEGzM5
	 eE16z35L/cQdoa8olim+hEXZt4VTFLQlzUnuc/usVzrf89juTGp0WUhVkaElN3dhQx
	 LbUCrcNvso4ErQy0XseZ4PxpaGqrP2jfw6djWjwKyuHqNf1PD0jPkdNqnYsTErA07p
	 qx9E+rQb+xIH6dJ9sMrZ7/kfrX+NQDC/1YbeWlscd9NRHmuuwccHGiNexKkLt5Onau
	 bl+psB0aDqyCw==
Date: Wed, 15 Jul 2026 16:01:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH mm-hotfixes v2 0/4] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-ID: <aleYrvnf4nVUCu-f@lucifer>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <alTn7NguEW_4bodu@thinkstation>
 <alTq4V50767L-s5H@lucifer>
 <alUNiWcygLd4rqBo@thinkstation>
 <178404602957.85099.8935151447302412515.b4-reply@b4>
 <alZm0tBf8DpMXimM@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZm0tBf8DpMXimM@thinkstation>
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

+cc Lance for thanks :)

On Tue, Jul 14, 2026 at 06:05:01PM +0100, Kiryl Shutsemau wrote:
> On Tue, Jul 14, 2026 at 05:20:29PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Basically you need the IRQs disabled to get the semi-RCU behaviour and to
> > be able to safely traverse page tables that way.
> >
> > So with CONFIG_PT_RECLAIM you're safe to RCU traverse PTEs only.
>
> I think this is stale. Since 1fb3d8c20bfa ("mm/mmu_gather: replace IPI
> with synchronize_rcu() when batch allocation fails") the !PT_RECLAIM
> fallback is a real grace period -- note your own quote of
> __tlb_remove_table_one() calls tlb_remove_table_sync_rcu(), which is
> synchronize_rcu() nowadays, not the IPI broadcast. The name invites
> the confusion.

Ahhh, nice thank you Lance :)


>
> Together with a37259732a7d ("x86/mm: Make MMU_GATHER_RCU_TABLE_FREE
> unconditional") that means every freeing path through the generic
> mmu_gather is genuine RCU, batched or not, all levels. A plain
> rcu_read_lock() walker is protected; IRQs disabled is not required.

Lovely. I'll probably send a patch to fix the comment then :)

>
> > HAVE_ARCH_TLB_REMOVE_TABLE is set for powerpc, which also enables PTDUMP :)
> > and that's because it actually tracks multiple PTE page tables together as
> > a fragment.
>
> sparc also sets it with SMP. So the audit list for custom
> tlb_remove_table() implementations is powerpc and sparc -- everything
> else gets the generic behaviour above.

Yeah.

>
> No disagreement on the rest: the walker needs
> ptep_get_lockless()/pmdp_get_lockless(), and the ppc kernel-side
> fragments need a look.

Indeed.

I know Suren's been taken a look at this, pinged him off-list (he's also
cc'd) to see where he's at but I'm going to take a general look at this.

I feel that RCU page table freeing is likely to be a requirement for
scalable CoW, so directly impacts me :)

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

Cheers, Lorenzo

