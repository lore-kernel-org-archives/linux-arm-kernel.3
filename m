Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A98DCDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0klIJiYQNQ9PnKEApf54sowiYvefRGXUDdYSuJHV+hQ=; b=vFphaLOyBA4t6jiyLlrx/uLDZk
	bP+Jz/HM5Ftehl/xZdpsKUEBrBWZywjcn29jDwIgOaH+EPkE9ha+/KLR1C4J8p8RcazeSB7j36RsB
	uf50+fKtknyyHpKDBC5TjB/R1P3UuHf21HrRCogK4nDhsxY4CH7hO21wOzXSwasitxXCUay1cZbEA
	Hg8Hkm2t2MV3tZnuJ9v9PZH4BsEBe/LGVZyBthFIeqQF7O5MBR3fEmJYkwD4V2l6LKx8kjtviOjHB
	C1VCqdtaoP3Ne5A2pAFCaZkGEUeCh290x4wTpZnMcsb2Rj3mPa8FRrgJeAb5c/COYJcUEPjFtBu0q
	1N/DmGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5iW-0000000BJNC-1xyc;
	Fri, 26 Jun 2026 12:31:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5iT-0000000BJMZ-3vx2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:31:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95FCE1F91;
	Fri, 26 Jun 2026 05:31:21 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F03A63F905;
	Fri, 26 Jun 2026 05:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782477086; bh=tqFkPrKngbGi7F0q/LI40ZThdY9KNHFk+D0fm50gQjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVhLEjmND/1ppqrylbSCf40EEwgAUbq5bha46ZrHXo88poshwImABCbxO9rYR9eu/
	 YnAwzhsKmnpUI4/jHaBBTiRi6FRGkjIfvgb0O/CdDl5OI5ljJvMs0S9x56bw3RU1H5
	 Cgx9DuIB4SiJIaJJuQFAr3kCmt51EDfErGH0kZ2w=
Date: Fri, 26 Jun 2026 13:31:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] arm64/mm: Optimize TLB flush in
 unmap_hotplug_[pmd|pud]_range()
Message-ID: <aj5xGiFqLFveuKsj@arm.com>
References: <20260626012845.475959-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626012845.475959-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_053130_102065_120BCF93 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 26, 2026 at 02:28:45AM +0100, Anshuman Khandual wrote:
> flush_tlb_kernel_range() could flush down an entire block mapping just with
> a single PAGE_SIZE stride. This capability was being used umapping PMD and
> PUD based block mappings in unmap_hotplug_[pmd|pud]_range().
> 
> But later on the commit 48478b9f7913
> ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()") replaced
> this PAGE_SIZE stride with [PMD|PUD]_SIZE strides, hence forcing multiple
> PAGE_SIZE stride based TLB flushes on platforms where TLB range operation
> is not supported. Revert back to the earlier TLB behaviour along with the
> required comments that were dropped earlier.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Ben Hutchings <ben@decadent.org.uk>
> Closes: https://lore.kernel.org/all/b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk/
> Fixes: 48478b9f7913 ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()")
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

