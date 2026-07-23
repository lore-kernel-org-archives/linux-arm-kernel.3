Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72780C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 23:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnn7yL0Nr/R1HUS7NQmyspKVad9BEXrUGyw69tYwFFg=; b=IuXZgJCgu54ae831bcmdkUzqP/
	Atg4rljpwufQgnl3ZQF7O4UMceA6oUDyRGYJ+B0kiBSnYWS2BbPXKIj7/caZz/PadzRxYLG/W/Hch
	XkHuuuAImq6Z92szhb02s+TEseE+x8bPOdHQn7qMpdIDSuSE5d8fSFDH4UzgTvbbJyWiQYOGFx99y
	5Hx2JwghP7I1qhuZLBlMPKpihx7t5vvsZtX38KxJcUxuKmW39TYDVtzqip6FECY7dI6ZCoVgOXEYj
	OIrxsPE5hwGKatnxJb+l55Vi6UzPJhz0zPeZ3llyTa5H9eXCCaSjiqTikyZhq1oQOqTDWSVm6mRDo
	6+o/Jy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn2u5-0000000FGMw-1Unz;
	Thu, 23 Jul 2026 23:32:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn2u3-0000000FGMG-4Avw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 23:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9981600AA;
	Thu, 23 Jul 2026 23:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3451F000E9;
	Thu, 23 Jul 2026 23:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784849554;
	bh=Hnn7yL0Nr/R1HUS7NQmyspKVad9BEXrUGyw69tYwFFg=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=f/SknRcIQDU4nSUdLwTCBM+cM+91dauPs197nxRVx1N0wb3jnV3jCafryW7ZOFFW6
	 mpHT5EbCorhe2AhynbP7TbxpHlTRIDogQW4O+ytb05thuP2OtJXAZzs0IZuCW5mmz3
	 fqGiOHS6IgLSc55WYASy9ioVTGMC6KCSVKazcJ9U=
Date: Thu, 23 Jul 2026 16:32:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, David
 Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal
 Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>, Toshi Kani
 <toshi.kani@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Kiryl
 Shutsemau <kas@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Denis V. Lunev" <den@virtuozzo.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v6 0/5] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-Id: <20260723163233.54b38cfc682a25eb6edf7cc7@linux-foundation.org>
In-Reply-To: <20260723162646.350cf3bf415a0855140d139b@linux-foundation.org>
References: <20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org>
	<20260723162646.350cf3bf415a0855140d139b@linux-foundation.org>
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

On Thu, 23 Jul 2026 16:26:46 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> @@ -1250,7 +1251,11 @@ static int split_large_page(struct cpa_d
>  
>  	if (!debug_pagealloc_enabled())
>  		spin_unlock(&cpa_lock);
> +	if (cpa->init_mm_read_locked)
> +		mmap_read_unlock(&init_mm);
>  	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
> +	if (cpa->init_mm_read_locked)
> +		mmap_read_lock(&init_mm);
>  	if (!debug_pagealloc_enabled())
>  		spin_lock(&cpa_lock);
>  	if (!ptdesc)

btw, this affects your later "x86/mm/pat: allocate split page tables as
kernel page tables".  Which I resolved thusly:

static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
			    unsigned long address)
{
	pte_t *pte;

	if (!debug_pagealloc_enabled())
		spin_unlock(&cpa_lock);
	if (cpa->init_mm_read_locked)
		mmap_read_unlock(&init_mm);
	pte = pte_alloc_one_kernel(&init_mm);
	if (cpa->init_mm_read_locked)
		mmap_read_lock(&init_mm);
	if (!debug_pagealloc_enabled())
		spin_lock(&cpa_lock);
	if (!pte)
		return -ENOMEM;

	if (__split_large_page(cpa, kpte, address, pte))
		pte_free_kernel(&init_mm, pte);

	return 0;
}



