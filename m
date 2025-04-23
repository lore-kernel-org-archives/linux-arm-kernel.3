Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9586DC3ABA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY125ErN3/M8lwOZlBVVABb23iCS1LCPtq9Z/AmQGvc=; b=3RyzDRDQm1voyc46X4iICia/Lc
	S8hAYLXppNOKfV85divpvsZ26u7N9KRmFbYiVBYmWlfEE1Z8+6PJHV8TQgwJHybOgNFMRy/ziL09H
	UdgO5KFUXVI/JvNKLBMQaMyydtr24PNgAU88W9YnGgBqXc4NLSo7x3By735mu7O+3el2qgCsZoWi4
	QeFz59bMSVDGlWZhpAlNWzspwg2qL2W/3YN0AbLQ7ueGF/wOOtMafEm8/euafLbwnp4LV00kEWRYX
	NRqDzVcfwFMrpGtGWchqjAIbYUca4mzMwIKKeSWE8/KTZ7BrPmBAuFB+9KlhnHQxi+P12OSA2I8T4
	l54EQUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnC-0000000AXD4-0z8X;
	Wed, 23 Apr 2025 13:05:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y3d-0000000AHUc-0nwR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7B55615E9;
	Wed, 23 Apr 2025 11:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3D1C4CEEB;
	Wed, 23 Apr 2025 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406864;
	bh=OXIT2Mkp/X1FfEchdqAzjOM5PYg0vflOSJBG7v9Aedw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQ5nyM23wz9ka7GGbET2QYg8DsE98EZupnkR/JcsxsgSQazsyxKH8ikhqvsaIHste
	 O0Py5pCACuZp+UTH9JTXs4gmWeSyncmjD9VXWVHM5AClBTcCTQ9OP0M8w2xr0TDjOU
	 LCnMBd/4GcmXm+g7k9JTR2NrOQ/W9lAiX6hdPi4WHfrRds1oA4f9PqvShPiIRY7Lc8
	 AknZKbth2cHCDBzYAxZHhCpZvPTzicdQZhYvCOOwvayh8pSmj756RIs8I3HzzN7qFo
	 v+V763+IrJMEvGePqKJ0Ize7tYzouTcooirZSmUU+x2cbGLR1qqTr3MJeBNN3fb4nQ
	 p3XqyRWHL3yBw==
Date: Wed, 23 Apr 2025 14:14:15 +0300
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
Subject: Re: [PATCH v3 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-ID: <aAjLhzrW3KsThGwF@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-8-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-8-dwmw2@infradead.org>
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

On Wed, Apr 23, 2025 at 08:52:49AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
> 
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> Use for_each_valid_pfn() to skip the pointless iterations.
> 
> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/mm_init.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

-- 
Sincerely yours,
Mike.

