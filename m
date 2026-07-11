Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96412C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 10:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oDfAhKxe2iIPvXBwZ8w8OqX8bhaAtUgCdeCLElZr0U=; b=Mwh8aErwxoXR7mUil8ojcweM1x
	YWIa4Z7eg6Fc8rv9cspJ9+NzRoVrdwCnGtmtpPUaaM/M6DmWgteuYpj54QMfvZfNLkTqE1lbOHIV7
	5xZADjQCdMxuswul91Uhuw0xvSVl2NzQuoTT7FZkeVhVQEX7/UwIaytdhr1phJ8lj6smydXTufUjv
	keQvD+gcMC6HEZYbqeneBo8xBvG7eYSjMiQ9XHbawSUjzK665t5AmJtv7Yj1Rs8nroO1qqJTNXIL+
	z2FvAwZbPMOV3pSNqH9gZxl78BuU2UItC9OIYXtTKOTTzslPivWMLJX/8LS0WNiXbHiRSnrkQU8fP
	APGbxcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUsQ-00000006Saf-0GXO;
	Sat, 11 Jul 2026 10:24:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUsP-00000006SaV-1aHn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 10:24:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EAA440103;
	Sat, 11 Jul 2026 10:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4901F000E9;
	Sat, 11 Jul 2026 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783765444;
	bh=0oDfAhKxe2iIPvXBwZ8w8OqX8bhaAtUgCdeCLElZr0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AFQ3gLCG2F8EzmcbnFgC7gXQ7+rlVe/CyFvWTelU67y/+n/6aQbX1XOkmykw9tUPE
	 /P6+6BOidbH5gVI5CZO/bLXo4usru/OohXH8TOztGB9Udw8iDDo+Xllxib24tFY0ai
	 KphhFdvjtDOeXDxc5dCTXugSF0bSqxKlqRtyJn1svzNNlgc55jvSdlVUsVFTVlXTiT
	 uNdRAFdU9OOiUI5/b7/bNe7XjHBaQ/QR5BW6pvhYuYZWXWIPke/bHWwwzbzW8WS442
	 r8u5zEzFk3ZH/Chl213qDo0W4krI6Ew6mEcQuxNV+fma+WognwtqI8K7B7RyyHR9Vj
	 Dq8zG9EMFIhhw==
Date: Sat, 11 Jul 2026 13:23:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Carlier <devnexen@gmail.com>,
	Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
Message-ID: <alIZugA2b2gnPOrp@kernel.org>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
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

On Fri, Jul 10, 2026 at 11:49:18AM +0100, Lorenzo Stoakes wrote:
> Currently there is a nasty race between ptdump and vmap when attempting to
> map a huge P4D, PMD or PUD entry.
>
> This patch resolves the issue by simply having
> vmap_try_huge_[p4d,pud,pmd]() hold the mmap read lock on init_mm while
> invoking [p4d,pud,pmd]_free_[pud,pmd,pte]_page() and
> [p4d,pud,pmd]_set_huge().
> 
> Fixes: b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page table")
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
> Link: https://lore.kernel.org/linux-mm/20260706203128.162335-1-devnexen@gmail.com/
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/mmap_lock.h |  1 +
>  mm/pagewalk.c             | 22 +++++++++++----------
>  mm/vmalloc.c              | 50 ++++++++++++++++++++++++++++++++++++++---------
>  3 files changed, 54 insertions(+), 19 deletions(-)

-- 
Sincerely yours,
Mike.

