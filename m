Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619A7C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBrZiyJnberI9b7VUjJupq60gfZ6LzSJ4B4JH6KDxtA=; b=tJCWLT/Gdzvmp0KUP+0HaTqUe7
	vCGrybCoOJfn5D7x7PGeu2L+ZBob/dcZ/Rd608WwXjjNXnaoI+OTjtHntLXzMpU7/VBLLurz0UEfz
	aYXr2UU8/pmGg0B/si2vPoL4KDwYBnO6PuuA1bxXgeOGD4U0darZf5xAB1QJeOpa/H2SWF0QgP32D
	+Yu0Bpn/710oclwr8YQTMrSRKeoNeW8OO6MvZEf1noedXK7logTtjlrP9POkdFgOL/dWPkxgWqHr+
	7qA0V1WJq/6pqdyAcosanJypdpcTBLHks7TF2OSNQI7+VM9Y3xciq4V2a4RnZwj6aCEOZvkFi6fcQ
	FHBn4CRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFDM-0000000ACmN-2CWj;
	Tue, 21 Jul 2026 18:29:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFDL-0000000ACmC-06F8;
	Tue, 21 Jul 2026 18:29:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADCEA42A71;
	Tue, 21 Jul 2026 18:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF4B1F00A3A;
	Tue, 21 Jul 2026 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658550;
	bh=UBrZiyJnberI9b7VUjJupq60gfZ6LzSJ4B4JH6KDxtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gp6XbFXomuiNUL8/5g0E38L1hLDlFPRFvPMTTyCgWQBNTqqQLQuUB+s6pzz7agr14
	 N9pISFj7Aqysz4dxYykxm6/PcBMqwymPVydn8l5doP7dGw63rtDgY3J3w7+iCd2dwn
	 raQb1OGdk1t5E2yX8S2g00aPuPp2+6dZqqd0g44YDiwH+wxLAthEItWNbjsFl8dBHx
	 8BI1icWsPCV3f/3kezXi7WgT58OOGLnXYtGTnzmvJRW4iXX8nBTXgUYu30RCoNS6wF
	 fH2kWBuFqMBANpbmNVc+7cLE+ZwcY66ZqhCCT8XuyFNX3ZeC96jda4LJGcOYbRliLw
	 lxENtlBS6t0dQ==
Date: Tue, 21 Jul 2026 21:28:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <al-6aLMJONOMfW2v@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
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

On Tue, Jul 21, 2026 at 10:19:43AM -0700, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> > Currently there are 6 independent implementations for set_memory and
> > set_direct_map APIs.
> 
> So with all mm/x86/CPA patches flying around, can we first agree on which tree
> is going to collect everything?

I hope all the fixes flying around will be merged before I even get to v1 :)

In any case, I'm going to wait for the fixes to settle before posting this
not as RFC. Obviously, the code movement will include all the merged fixes
then.
 
> And if I want to review patches in that area, what am I applying it ontop?
> linux-next perhaps...

This set is on top of v7.2-rc1. It includes a patch Dave took to tip and one
fix from those flying around.
 
> Let's sort out the workflow first so that we don't get lost on fruitless bug
> chases and fingerpointing.

I'll take it via the memblock tree? ;-)

> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Sincerely yours,
Mike.

