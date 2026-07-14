Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91174C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1UQ1who+MzGJnhRAGQnZjnEvcZY391rlmuNIJbBr8I=; b=uKB/G2WDDEo8uZ9EiOzQLvQ8ih
	JrrSgg9EWHwhYVyN9oC+ExhKNqrcrdOy2dXJaaUy5fMkuNU1WUDq9G6pov+eu9j+McodUlkUk+N/n
	AXXRo+A4G7ZDdarS/8dm4I90lr+59EzLkc/4D9oFjBtMI/TibqVPPpqP/QHVOYCNoOax2RmVXIZzp
	uuIpZIQebl/O4U1f+l8zBpVoc0Phvd3AjQgpCXvNoPbri6EygczOdNRCbQ2PgW+soJfvwl3qJto0y
	6ZLtyYXwgm/4hZUiS9VxKwPhycVzAMjvXTJ4gaSov5a4YqpoWJMlTwT8hm37xsqYvpWGr3hD54PAW
	QuUA39KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZiy-0000000BUSt-2n9W;
	Tue, 14 Jul 2026 09:46:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZix-0000000BUSe-1Ols
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:46:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EE36601EC;
	Tue, 14 Jul 2026 09:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4AE1F000E9;
	Tue, 14 Jul 2026 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784022406;
	bh=E1UQ1who+MzGJnhRAGQnZjnEvcZY391rlmuNIJbBr8I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Wx5oJE4RDEO4dpFV0phT403AjtH8RYoSYzbGWynEUfagmkrDOBkIbSFsS+x53Ry+Z
	 5EyDiYSdAlSv9M9WXQCsigWqSLQqxT60I3cGYCq+cTtojdHF9mL5k6OUmcHi9JboFn
	 GEb5fgFiZIjw/cz5FWDvHJte2fMyl2uab32nxlFj2pXeb84lc9s0I0zXS6z3d6SXXl
	 VP1FX7yrz+0z7UUMLnhbYRTPjdYSiE/+1upFXAxeEEBWrK+9mI+jbnZLn34Nu0FyLx
	 lh9kNwEY/9P0B8kcjQOWOs0RkuOPBOwgdAthkIV9aVwNzhJUf3oauqhZB02agLe1es
	 olERYlqWI2iYw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH mm-hotfixes v2 1/4] mm/vmalloc: acquire init_mm lock on
 huge vmap to avoid ptdump UAF
From: Lorenzo Stoakes <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
In-Reply-To: <alUUfGnM_vbhOTVK@thinkstation>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-1-ad134cc3a12a@kernel.org>
 <alUUfGnM_vbhOTVK@thinkstation>
Date: Tue, 14 Jul 2026 10:46:30 +0100
Message-Id: <178402239024.69739.1681992582238824793.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415; i=ljs@kernel.org;
 h=from:subject:message-id; bh=a7VMRw+J+v8nzO2qena+1Qa+1xYq9bL9avRWJ8DcXDM=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLCWMtnZOXOu+4kNGHDhr83f+jpc3x//2kdX9irTVzJ1
 lqvT5qXd5SyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAi7TMZ/heEXvVdbXTATHn5
 Vw8+tT+vdm+4V+LvWbF054M3B9t/T21gZPjK4SQ4J9OKY9Nhx39/5+0WvP0neuI64/CWJqVTqp8
 mmzEBAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

On 2026-07-13 17:42 +0100, Kiryl Shutsemau wrote:
> On Sun, Jul 12, 2026 at 11:42:24AM +0100, Lorenzo Stoakes wrote:
> > Currently there is a nasty race between ptdump and vmap when attempting to
> > map a huge P4D, PMD or PUD entry.
>
> <... skip 145 lines of commit message :P >
>
> The code looks good to me, but I think the commit message needs some
> love. It is long, and the pieces of the story are scattered: the race
> itself only shows up around the middle, after several paragraphs of
> ptdump background (including the arm32 and EFI notes that the text
> itself says are not relevant to the bug), and the one genuinely subtle
> part -- why the read lock is sufficient -- is not spelled out at all.
>
> Something along these lines would be much easier to follow:
>
> 1. The race, up front. Diagram, if we you feel like it;
> 2. The fix, and why the read lock is enough;
> 3. Why a trylock;
> 4. The arm64 wrinkle and the temporary ifdeffery patch 4 removes;
> 5. Secondary changes (guard class, walk_page_range_debug() assert);
> 6. History, if you feel like it.
>
> Point 2 is the one I care about most -- the same reasoning would also
> help in the comment in vmap_try_huge_pmd(), where "Therefore, acquire
> the mmap read lock" is doing a lot of unexplained work.
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
>


Yeah that's fair, I will reword!

Cheers, Lorenzo


