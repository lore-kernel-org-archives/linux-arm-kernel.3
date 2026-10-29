Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9326E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mNelobDH;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LSb42G/4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pvnY73Q0V05Um+rlosdIP96Yb0fzFhR9UVvX1gsB0Yo=; b=mNelobDHdYlBHegPfxnXrzNGFp
	KGtk+CxaECg1S0QC9NWMPRtrP5LyH5zE4X4iJDrOiejRmuH+Cb5QeuBW9Vodzj0j76RJsatbxGFSs
	6YxD4aoIn44RoVLKkXqdzNsoHqdwIL7Tdcdw2i7TRSlaZ28Ea6Hai2VlnV+sJhsqncspLaX/fFunc
	WdO4rD91ptsEtnu2llrr8J261pnBMJ2AXHUCbyeuQtf6ltsxVr/rbOJV0Y6eyWF8/9HqOfCZYj6x8
	6M/wYpO3Z3UPd9EQxQ1QlKj5Ty3KHUm8NTDTgKMnY1iTxnnFgK2lJ5Di9XNSWwgK5l+9P9Ccp83Uo
	n8N6865Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXJ0-0000000AOSH-2pk0;
	Thu, 29 Oct 2026 21:05:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXIw-0000000AORd-48n2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96A81682;
	Thu, 29 Oct 2026 14:04:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2AEB3F59E;
	Thu, 29 Oct 2026 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793307896; bh=AnM4OnNBjAGRdciRyyuMhYkvFvjMOCFE7WXWqQyeFXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSb42G/4AzMi28jRIjLxA2hy9xVDdhvjBX3T0x5KL21W4mh6bcAeON7PSzOy7v7gH
	 pJq/0Ntr/E1A0YLcik771E8X28SlnQY77AbmdbXcZPi5W1ncvnF9+zN9YP0mdbgCbo
	 xnVgMB6oAYh0DMA6ub7ED1hPi1ks4rRphmD/zsDw=
Date: Thu, 29 Oct 2026 21:04:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Message-ID: <auO09UUOqkhXXuoI@arm.com>
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_140459_562813_4B8B050F 
X-CRM114-Status: GOOD (  17.10  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> 
> Switching to init_mm should prevent further accesses through the
> previous address space's translations.
> 
> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
> to the init_mm") avoided installing init_mm.pgd as a user page table.
> At the time, the ASID was held in TTBR0, so installing the reserved
> TTBR0 also switched to ASID 0.
> 
> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
> installing the reserved TTBR0 no longer changes the active ASID.
> Consequently, switching to init_mm leaves the CPU using the previous
> address space's ASID. An empty page table does not prevent TLB hits
> for that ASID.
> 
> This can retain access beyond the lifetime of the backing pages.
> During fullmm teardown, user data pages can be freed before their
> cached translations are invalidated. If those pages are subsequently
> reused for kernel data, an erroneous uaccess that hits a surviving
> translation can read or corrupt that data instead of faulting.
> 
> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Thanks for the report. I think the problem identified is real. My TLA+
model (apart from having a bug in how it modelled speculative TLB
loads), did not exercise this init_mm case. I updated it and it now
shows the problem.

We'll check your fix in the next few days.

-- 
Catalin

