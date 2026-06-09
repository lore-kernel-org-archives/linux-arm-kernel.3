Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C051CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDnT/R8r7fr0S+byBNjg5mZPhI3/Z2+xQc0Imi0qg1U=; b=mRDQM5293UgntEREHcYRbxBX2Q
	sw3/4AIbZDuN3/sgtEoI6gAlzlRdVyHh+JlJu8ilQNY68irQMl/8L2CgZ7nr9qncsZpX7czN1xRKN
	rNOtMy06hQ7RqdR7+m3mMIJjvnuentZ1aExgtbP73oxg3zJ34AlAis21bYvrk0mBUMV8cKMcK90fI
	2zvtErH9PegADfZmLvY9zLc+YLR07iXdFU7VuS4Uv7HwQXVCkK4Srbz0zqe0SLFcpQ93/VVWN8taG
	VYVzm/iPD3sh02pFNvTiiCq2xUAfXch8GLXFSvnM1w59e+r9/Q0z00dh++Fyp5NOaT7yGiTRpOdIu
	hq2VilQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2OY-00000006JHD-00jB;
	Tue, 09 Jun 2026 19:45:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2OW-00000006JH1-0Rtg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:45:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4141D4399E;
	Tue,  9 Jun 2026 19:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D041F00893;
	Tue,  9 Jun 2026 19:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1781034351;
	bh=sDnT/R8r7fr0S+byBNjg5mZPhI3/Z2+xQc0Imi0qg1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WAftlABopgVwyK7vGdX/rtSLAO9xtr0zc+DLl4US/9eBTEMgAwekI2vvfzqxbkLvT
	 Wd4X5e2nqodqCSdGijAYC7Pm0so6Nq5F0UhcYuMuxk2QEPxd8donUTVOuSSVYE3uBv
	 Zw7XdRWDnVlqpb2ACbHDkFj65maHJqMxriyS8hL0=
Date: Tue, 9 Jun 2026 12:45:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, hpa@zytor.com, david@kernel.org,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 yang@os.amperecomputing.com, jannh@google.com, Dave Hansen
 <dave.hansen@intel.com>
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero
 folio read-only
Message-Id: <20260609124549.aff7e774603c4af188009408@linux-foundation.org>
In-Reply-To: <20260609143801.7917-2-xueyuan.chen21@gmail.com>
References: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
	<20260609143801.7917-2-xueyuan.chen21@gmail.com>
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

On Tue,  9 Jun 2026 22:37:59 +0800 Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:

> The huge zero folio is shared globally, and its contents should never
> change after initialization. As Jann Horn pointed out[1], the kernel has
> had bugs, including security bugs, where read-only pages were later written
> to. If the persistent huge zero folio is read-only in the direct map, such
> writes fault instead of silently corrupting the shared zero contents.
> 
> Add arch_make_pages_readonly() so mm code can request read-only direct-map
> protection for a page range. Direct-map protection is
> architecture-specific, so the generic weak implementation does nothing.
> 
> This was inspired by Jann Horn's read-only zero page work[1] and follow-up
> discussion[2] with Yang Shi.
> 
> [1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
> [2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/
> 
> ...
>
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -308,6 +308,11 @@ static unsigned long shrink_huge_zero_folio_scan(struct shrinker *shrink,
>  	return 0;
>  }
>  
> +bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
> +{
> +	return false;
> +}
> +
>  static struct shrinker *huge_zero_folio_shrinker;
>  
>  #ifdef CONFIG_SYSFS
> @@ -982,8 +987,14 @@ static int __init thp_shrinker_init(void)
>  		 * that get_huge_zero_folio() will most likely not fail as
>  		 * thp_shrinker_init() is invoked early on during boot.
>  		 */
> -		if (!get_huge_zero_folio())
> +		if (!get_huge_zero_folio()) {
>  			pr_warn("Allocating persistent huge zero folio failed\n");
> +			return 0;
> +		}
> +
> +		arch_make_pages_readonly(folio_page(huge_zero_folio, 0),
> +					HPAGE_PMD_NR);

Can it simply pass the folio?



