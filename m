Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497DCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR2kmM1Rjr5dwTYbwPlBSC0LEAHAfZeRm5vPw4vT7v0=; b=p8fA11Rmddj+BZGkuCy3uwv777
	xcTNjnxtLWZeiVYFwFRQtNoytc4113fVP/lDe4zMoqjYyHGdToYJYDpCjMZeohIaZu7pIyFvdOY1Y
	Tria3E1JTFj6S3nLngOffp9B+Jes3br2eKjHKLZxrC4cNoPEu1PMgIpZvg4ftEVfCJvJ+kz7xZ95a
	gKOV8ZAPmbEM2Fch3tkBbJ6bDLjlJmp39YsZh3NToer5C03LmUm26iDuVQBluNbsvq4Vq0nUvsgT6
	XLXvw7P3CYhldahsH1KMrInhjTF2RN6/uTcHvX6mEiFQgjkodFYZNvqRz5EiGvcgkSobVRzWQrTZP
	5SvVWDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhLe-00000009gQa-2TUW;
	Thu, 11 Jun 2026 15:29:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhLc-00000009gQC-0tvC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 15:29:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF66E1DB5;
	Thu, 11 Jun 2026 08:29:29 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55C7C3FB90;
	Thu, 11 Jun 2026 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781191774; bh=W4sGE5y60NuRQQFw/ECXJXbsg8my09kl0Yt2sv8zJiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQch3SOLhzVqV8/aboIlwSht9zx1/eZ2W6j/y2yy4/sRxrRJs0AJKtfxlcAeUOqZc
	 dAOaukrfwSSISm+5AgEoBUbT9FqBdUqh+7wQTqgCKUxBP6y3IppU7DDVHUWmU4f2/t
	 2iCp4e7Ig21CuPh3NYbyKjqjhz3osfzhW74iUlQc=
Date: Thu, 11 Jun 2026 16:29:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: sk@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org, Huang Ying <ying.huang@linux.alibaba.com>,
	Linu Cherian <linu.cherian@arm.com>
Subject: Re: [PATCH 1/2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <airUWY4jFgxWvQ4s@arm.com>
References: <20260609213615.2788698-1-sk@gentwo.org>
 <20260609213615.2788698-2-sk@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609213615.2788698-2-sk@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_082936_299103_DFFC0DB4 
X-CRM114-Status: GOOD (  16.44  )
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

On Tue, Jun 09, 2026 at 02:34:32PM -0700, sk@gentwo.org wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> There are 3 variants of tlb flush that invalidate user mappings:
> flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> would previously unconditionally broadcast their tlbis to all cpus in
> the inner shareable domain.
> 
> But this is a waste of effort if we can prove that the mm for which we
> are flushing the mappings has only ever been active on the local cpu. In
> that case, it is safe to avoid the broadcast and simply invalidate the
> current cpu.
> 
> So let's track in mm_context_t::active_cpu either the mm has never been
> active on any cpu, has been active on more than 1 cpu, or has been
> active on precisely 1 cpu - and in that case, which one. We update this
> when switching context, being careful to ensure that it gets updated
> *before* installing the mm's pgtables. On the reader side, we ensure we
> read *after* the previous write(s) to the pgtable(s) that necessitated
> the tlb flush have completed. This guarrantees that if a cpu that is
> doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> entry cannot have been seen by any other cpu and we can flush only the
> local cpu.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>

Nit: if you repost someone's patch, please add your signed-off-by.

-- 
Catalin

