Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B92C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcdbPVe2DJM9MtOvkOYgWRb/x7YeFqOeUTEpaV1gBBk=; b=RUGRn1Ubiqvyz11lZLRVkR20r2
	xf0SMFd9MCa3szty47zpolhdRQjh4cK3zezAqIHiN4a955Y4VCmwc54UPb1EfsPDnlExAhTKdzGbi
	MXYhTfGkwgSDTYAhGEmsn6ZCPPQ5tOGS3j5EVjLV5hVu5KtYf+YC+KTeZbsUQOJaHWxPj9jr8cX2x
	J97SFBrdnui0Mxtb4mnX4e35B0bKyWAI5pYN//K080e0opRO058e8QxB8uJLKMKuIyquPTYF222P0
	xVTxLY5/fUJuoE9tWea3Md5smaQ/Cr/yP6FaB4DthlBzHZ1JqfIvRXb6YaBinssohfBqQB6EF3X8q
	DWr59BDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUkW-00000006RtD-2C5d;
	Sat, 11 Jul 2026 10:15:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUkV-00000006Rt4-0uUb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 10:15:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3603560051;
	Sat, 11 Jul 2026 10:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994561F000E9;
	Sat, 11 Jul 2026 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783764953;
	bh=zcdbPVe2DJM9MtOvkOYgWRb/x7YeFqOeUTEpaV1gBBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcNK8JNVL58HlIMFspMoFE3mEFF7f+x2CSh8cYHC5i2UYivFD5iHxlX4k8seziz3W
	 7JKXwDoO/X7hg7WeYEN0NessED0rrZfTPgZQaAlU5eBD+RVVXNlWyb/q04D8y05R1P
	 M6KAgrLz5/n/FVBNyU4wS7MxQ4A83mu7EVFGMEI8Ol4QxuHbDhSQlvpkeEnvCF+EqY
	 s+Rq3s+y7Xddhetu0ImsMpQWIOUACdzVrupZdkEr/Jjr7DkaAxkeO49Y2Uh/9T4S05
	 KxPWxCI2hDnQ5IbsCGQAR4UhaKG43+Ha5LFDF/vndH8mrNuEeAw/KjJNsmelSaTIOM
	 4wzywWF8FEjvw==
Date: Sat, 11 Jul 2026 13:15:45 +0300
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"
Message-ID: <alIX0XoykjTz69sk@kernel.org>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
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

On Fri, Jul 10, 2026 at 11:49:19AM +0100, Lorenzo Stoakes wrote:
> Subject: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"

Without reading the full changelog this sounds like you are disabling
vmalloc-huge with ptdump ;-)

How about "remove redundant locking guarding ptdump against vmalloc-huge"?

> This partially reverts commit fa93b45fd397 ("arm64: Enable vmalloc-huge
> with ptdump"), retaining vmalloc-huge support but eliminating the now
> redundant mitigation against a race between huge vmap page table freeing
> and ptdump, as this issue has now been fixed at core.
> 
> We also simultaneously remove the arm64 ifdeffery when acquiring the mmap
> read lock upon vmap huge page table promotion as it is no longer required.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>B

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm64/include/asm/ptdump.h |  2 --
>  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
>  arch/arm64/mm/ptdump.c          | 11 ++---------
>  mm/vmalloc.c                    | 15 +++-----------
>  4 files changed, 9 insertions(+), 62 deletions(-)

-- 
Sincerely yours,
Mike.

