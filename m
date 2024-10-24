Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B51ECE8E82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0aXMVOrwPr9Sl/iuXyHgVBd5RGlvAqyrC0d7nUJHRc=; b=EnD2dsjHkFrhI5O6pzaKVv5phU
	8dbfxNOtpW1pQnuCReU20VwhXCBsszsjRXxD3g4uugoMT6OmvzPPm87C4fBZrggPD3TjHYN2KlcHL
	m6EmSeAMSoUVhK7KNj0GgB9mLmudxfaerQS8CRSw1ryoHeLY/VZ5cywl+3oa4/H1/x+8k7rlD96PK
	N/ymhfI4JEZ0wUehyLd13WE9SCcUltyHtC9AdzSa/Bq0saE55ZVj9b8azijF2G9He4riG/dCrT3+S
	ZNF7yu5R417IwhXPHa4KhTFPi6DuS7fB2mDtjSfYPfOZKpldAYLHU1zDRz/hEvNHs6qxnaB8cj2T/
	agiNce+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yrh-00000000kGk-19b8;
	Thu, 24 Oct 2024 14:31:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xjn-00000000TNR-3KxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:18:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC4B9A4540A;
	Thu, 24 Oct 2024 13:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21B2C4CECC;
	Thu, 24 Oct 2024 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729775930;
	bh=tyI7JDkp0t33YbBcSFvFoSSEBcFZuHm9pqI3LNWIbmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QS90Y9zusgjWlncMcUS0Hbjl3NF3iem9EQ//727OBCCjvQDez0N0wvZ+uJbyDSkNE
	 znswK6t/2WOAE99SVSXVgqhTjF9LvcsMadEB6PuS3kpZ4R+jQiuKrP4PqyfasG/Hsa
	 9jjQZ6etYJ8fVt2RbYzBYWoBjK5ygLm34iBXHg9IR8zSEXtnXGFcxRn2kz7T6/0NLR
	 ohxVEAd70vCT8nKCZERaWIwPhOLdBSsuk97wfmisdMoPaOoStt/20iEaQPkW7V8T8Q
	 DvryfvWHJlDt2tXSqhLZkD6QlowlJeUkjmvEXRkx96RP7cNq45aB1UQOPKSqbmKxHP
	 UhJCMKzyq9wtA==
Date: Thu, 24 Oct 2024 14:18:45 +0100
From: Will Deacon <will@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jordan Niethe <jniethe@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kaslr: rename physmem_end and PHYSMEM_END to
 direct_map_physmem_end
Message-ID: <20241024131844.GI30704@willie-the-truck>
References: <20241009025024.89813-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009025024.89813-1-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_061851_925932_72508F7B 
X-CRM114-Status: GOOD (  18.91  )
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

On Tue, Oct 08, 2024 at 07:50:24PM -0700, John Hubbard wrote:
> For clarity. It's increasingly hard to reason about the code, when KASLR
> is moving around the boundaries. In this case where KASLR is randomizing
> the location of the kernel image within physical memory, the maximum
> number of address bits for physical memory has not changed.
> 
> What has changed is the ending address of memory that is allowed to be
> directly mapped by the kernel.
> 
> Let's name the variable, and the associated macro accordingly.
> 
> Also, enhance the comment above the direct_map_physmem_end definition,
> to further clarify how this all works.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Jordan Niethe <jniethe@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> David Hildenbrand, I recall you had an unanswered question in this
> vicinity [1] when tglx's recent kaslr fix was being reviewed. Maybe this
> will help with that.
> 
> 
> [1] https://lore.kernel.org/linux-mm/ee205448-5fdd-495e-9d7c-c8a2b59f9c9e@roeck-us.net/T/#mdf442f077c9023590e144dbed2b04a109793484d
> 
> thanks,
> John Hubbard
> 
> 
>  arch/arm64/include/asm/memory.h         |  2 +-
>  arch/x86/include/asm/page_64.h          |  2 +-
>  arch/x86/include/asm/pgtable_64_types.h |  2 +-
>  arch/x86/mm/init_64.c                   |  2 +-
>  arch/x86/mm/kaslr.c                     | 14 +++++++++-----
>  include/linux/mm.h                      |  6 +++---
>  kernel/resource.c                       |  4 ++--
>  mm/memory_hotplug.c                     |  2 +-
>  mm/sparse.c                             |  2 +-
>  9 files changed, 20 insertions(+), 16 deletions(-)

For arm64:

Acked-by: Will Deacon <will@kernel.org>

Will

