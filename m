Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B6BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vk/Pmtw5V1S5Wy95XZKiQxPxVWpzziuE+PvkoAYgcUs=; b=IgOTEyB0g+NsKaSd0WLVwBjp2v
	3gjSftqFyHrLNvCigVicVsq0KTn/y0EjJTiBerBAFjUSeVdaJMeNL/5PR+h9A335zfxUoYU56dkFx
	4tduPAsqivq0RQb4aFfvGxJRPRykQVRJBk3J9Buy1aH40wbT0jAkQFjKevLKjFtKdbELy3nK1qgvt
	DsbT6trLuibzk/0pDvMBv/KAbNdJV+jz0M0KZGIq311hb/R1M2j96HQ+OB/HLY30WWGruUJV0xLil
	vH1HYNkU0dYt+nxmwWTDzcXHW6J57Noexm+6JP+ekyr7Odloa9MhywANDv6uML53fxlHnpbwlw2CW
	bTKLtgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju39-0000000E1b2-10yc;
	Wed, 15 Jul 2026 07:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju37-0000000E1ae-2BYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:28:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97954600BB;
	Wed, 15 Jul 2026 07:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226311F000E9;
	Wed, 15 Jul 2026 07:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100536;
	bh=Vk/Pmtw5V1S5Wy95XZKiQxPxVWpzziuE+PvkoAYgcUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KCWKi30MM2OO4LbExOFY2K96V4NJnrOuSYk2LaflLMjhkhQxOtZ8oF5qHjCyMhZjy
	 fPI9vhQ68B18TFLQc3JbwI/Bza/bFsu5vcGWnxMof6ezZ2Al6zMpJSuqppPOTYXzYT
	 8+D5XxspV4qS44G7arRn0036MucchjV9d63PSsiJbu1DSE6GwYB0emo7MC2q4heaGB
	 TKK6px3LaBeex8N46xrQYxluBESDOGdkya0vb+VTMG0INmsmp1l+C1gSOSe8CTqgcr
	 pRlVqlQ7TMusHrBvhsj2AwYxV1OOC6mM8wt75yCtk/bubtRjZK+Pe103PlnYk0FR5u
	 LwNn3Od+F1tEg==
Date: Wed, 15 Jul 2026 08:28:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org, syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v3 0/4] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-ID: <alc0YTcSVuBMdo8A@lucifer>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <e2d9f516-2dae-4356-830a-14b99fd32a90@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2d9f516-2dae-4356-830a-14b99fd32a90@intel.com>
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

On Tue, Jul 14, 2026 at 10:31:52AM -0700, Dave Hansen wrote:
> On 7/14/26 10:24, Lorenzo Stoakes wrote:
> >  arch/arm64/include/asm/ptdump.h |  2 --
> >  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
> >  arch/arm64/mm/ptdump.c          | 11 ++---------
> >  arch/x86/mm/pat/set_memory.c    | 14 +++++++++++---
> >  include/linux/mmap_lock.h       |  1 +
> >  mm/pagewalk.c                   | 36 ++++++++++++++++++++--------------
> >  mm/ptdump.c                     |  7 +++++++
> >  mm/vmalloc.c                    | 41 ++++++++++++++++++++++++++++++---------
> >  8 files changed, 78 insertions(+), 77 deletions(-)
>
> BTW, this is super nice. It fixes a bug, makes the architectures more
> consistent, and is effectively neutral on lines-of-code.
>
> Very cool.

Thanks very much Dave, that's very kind of you to say :)

Cheers, Lorenzo

