Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E568ACD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8EvjVihfI26BEVs2HPcIc2E2fqgxAiSxDYAkfFNUH8=; b=zixyoGqVUP30yZG1V+QuPKiTZI
	mQvMBOD1ls8CHTaAh0zY1amOrwjs655S7YvIL0gNHs8CxIUdQUZD+mbpme4dZ0bgKcIRkoveqKi73
	0o1D4dVcu1fsaX4BUYVIV1Z8v692ZD5BIjNBiLuxa87I1cucCKmIYp37MGLdNUfPiBCI3X912Dh7p
	8wWn/ewsKSWU7NL19SSxfAh1fyGAfTieJEno/k2/b8KoBeoEeoSoW4HtjcPQFPNxUFhjMbQNwh98+
	jhQQ9iUEgD/E/c/Opwm97EUWzreouHdGFDK5xyZe3MZusLfX++kxBmS6Yj5SkYxllZRgtkc+VbRX8
	YbfHAWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYhO4-0000000Cqif-0S4H;
	Sun, 14 Jun 2026 09:44:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYhO2-0000000CqiZ-2Wbo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 09:44:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2243743CCB;
	Sun, 14 Jun 2026 09:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3F71F000E9;
	Sun, 14 Jun 2026 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781430253;
	bh=Q8EvjVihfI26BEVs2HPcIc2E2fqgxAiSxDYAkfFNUH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PHXiPLJ/KCRkg26Rd2plr0CDbM7KJnG5oooL8TAiIeKipYQtv81cnN5+SCIQudha1
	 sw+WB5aP/5vaEzukp9yBII1tA8NHAxBz+c30c/YBJzL3P8Cw6oSUZwqU+JAnxnLw9e
	 l4Yhw2AWaG6gNB4JSLhH7D4f3G+8lGyWWYR6+vsHqMT6gPeDjZruOQkNbisim9DKty
	 oroxHX+E1hbidS6zBa286zJg38tAD3TS5qkC+yWAnKJmVj4+XJhttou21wspJKzM9d
	 XdxilPTq6cssoTv9L7NQMMVANjDo3nzME++Fkac3uoPlFG11Hg6sODWe3e9AuGWC3V
	 Z9e2Y0JZCYBjg==
Date: Sun, 14 Jun 2026 10:44:07 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: sk@gentwo.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
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
Message-ID: <ai5352mbktTaWHvq@willie-the-truck>
References: <20260609213615.2788698-1-sk@gentwo.org>
 <20260609213615.2788698-2-sk@gentwo.org>
 <airUWY4jFgxWvQ4s@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <airUWY4jFgxWvQ4s@arm.com>
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

On Thu, Jun 11, 2026 at 04:29:29PM +0100, Catalin Marinas wrote:
> On Tue, Jun 09, 2026 at 02:34:32PM -0700, sk@gentwo.org wrote:
> > From: Ryan Roberts <ryan.roberts@arm.com>
> > 
> > There are 3 variants of tlb flush that invalidate user mappings:
> > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > would previously unconditionally broadcast their tlbis to all cpus in
> > the inner shareable domain.
> > 
> > But this is a waste of effort if we can prove that the mm for which we
> > are flushing the mappings has only ever been active on the local cpu. In
> > that case, it is safe to avoid the broadcast and simply invalidate the
> > current cpu.
> > 
> > So let's track in mm_context_t::active_cpu either the mm has never been
> > active on any cpu, has been active on more than 1 cpu, or has been
> > active on precisely 1 cpu - and in that case, which one. We update this
> > when switching context, being careful to ensure that it gets updated
> > *before* installing the mm's pgtables. On the reader side, we ensure we
> > read *after* the previous write(s) to the pgtable(s) that necessitated
> > the tlb flush have completed. This guarrantees that if a cpu that is
> > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > entry cannot have been seen by any other cpu and we can flush only the
> > local cpu.
> > 
> > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> 
> Nit: if you repost someone's patch, please add your signed-off-by.

I have a feeling this patch is horribly broken, so I'll reply on the
original.

Will

