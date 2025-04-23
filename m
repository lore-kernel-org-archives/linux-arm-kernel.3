Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5D5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB9gJfX3ddP3G7roo43WmQs18QJ7VOUyedMT8uu+v0g=; b=AbGmstZVx4o9qwVgLQnKDqkdtQ
	fvXJvSAkBe5CiZW0a6joDt1LijTSPQERBu8hnz4SRVVyic59YIOAzciWdKNu2SBjjWwRUfkUPiEmV
	eroJJbynklBbeAhRZI7GlOBO17pPk4rcHT6Cdp/GlL8iBOYJ+AXum3SgMsPy9QcBrhdwwK7kGDYSS
	Nrerc2apUkTmPpqq4N7InxD/Rb4zlxQZbsu9HWV6UpRUzRqY+ATuwg9WC8CXG0BCkdnXeuyd57tK0
	FCD8etKr2PEUtp6fTam9OOS+q6yUtIEE4yADrMmJvY73EKrD/jf/RyVTkuTA2FgsECjU7Hk5i9wEH
	dtw7EdJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnA-0000000AXBI-1R5T;
	Wed, 23 Apr 2025 13:05:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y1w-0000000AH4U-1aGE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CFE1449B9;
	Wed, 23 Apr 2025 11:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82F6C4CEE2;
	Wed, 23 Apr 2025 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406760;
	bh=Fv5TS4xMmfeWcV7l671CjJfLu8DhprFRLLXeresKHUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9ByRV4Io+e5UaXQhF/o2OWhKsnIxqOOO4OmJ/Z9SgDUD7CJfW6TJ6koC0MCqXagn
	 FnYW3sLXMXhr7Mwg/xaSbw5QWA4AxvoDWlfxyJsOaoxi9mBGZAwUoQyLK+8PYOQG9a
	 kB3jkpuSrz2y/5ZZpMbS5BkdC2nxk2F2rtIq2mKjFwstF4QAv38Di4zhIyquBso2tE
	 y5+lyG9uC0u82Zw4dcn0l0OHmNWIiYpvnkiBpojE6hxGYLZyb/5spB/BOIoHMzmHiZ
	 YUSi+DhYrC3vQaw/hF/pdbRrXS/gtoFahrbt36cdQahfk/K3WIYxkLOh2H3VJEooqg
	 wi9nhH0ebLwCw==
Date: Wed, 23 Apr 2025 14:12:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 4/7] mm, PM: Use for_each_valid_pfn() in
 kernel/power/snapshot.c
Message-ID: <aAjLHscwOECGda90@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-5-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-5-dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_041240_446590_74223914 
X-CRM114-Status: GOOD (  12.24  )
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

On Wed, Apr 23, 2025 at 08:52:46AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  kernel/power/snapshot.c | 42 ++++++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
> 

-- 
Sincerely yours,
Mike.

