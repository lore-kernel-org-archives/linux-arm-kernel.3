Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqKcCJMv;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JiDLCoST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bOHnuqm9JpBcA8XwXXxzaZDMRZkV0lT5/r8gk4REOYs=; b=oqKcCJMvSNQUSP
	bcfmFXGFQyId5AvoCbK6zlMuKRbv8FNIVmRqRLmz91CrBn/h4bBarNQSPpxuO5XuRn4uGNlHDHrPd
	R0zvUasdPDPkZEj4RzZm5aau/VSo38R8OwhEg3nd1ksGT6ptAipcfuvbUUDjTuXdrHlHmXVY+yvZh
	BUcujcs8OTd0/aF07MQ4Ex0+KGc53DZmgV6hT27VuQIz/5yySjHGZl/c4/A0AWikVtq9LAGGEFYwy
	EgYDM4KyS8X2lXtoiZJP8Qg80zhhUt2GZYcDtz7uE6GisAIObkAZ8xs6+lfA5U9fQHQUoCPd/TPV/
	buekRG6fv3h+bs/CLIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUjW-0000000A6fU-2Bwk;
	Thu, 29 Oct 2026 18:20:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUjU-0000000A6er-02FQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:20:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C9A01682;
	Thu, 29 Oct 2026 11:20:06 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 469CE3F673;
	Thu, 29 Oct 2026 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793298009; bh=cWbcv/OrR3AC8MWmsufB2MOUC/lX1aMLnaTpaG/Zm6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiDLCoSTk0j+JNfFGYPj7s5GQs9Ok0PIGN3GkOADOMJO4HOphVZlHwhzIw81Hsx/W
	 r7U7Y9HdV6FkmNlQsULUl6Qi45DshRgf6ayeyi+lkU7/zlMymKsLRv8tYIDx38k2Po
	 Q1pQyDXi2cM7dXwceosKX8wRfP6ScMXmTszM5nig=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] Set DBM bit on writable pages
Date: Thu, 29 Oct 2026 18:20:05 +0000
Message-ID: <auONmOc-nYsQwCnG@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auExh5laWQbUKmUY@kernel.org>
References: <20261026144413.441566-1-leo.bras@arm.com> <at-lSy7H-K60LhCB@kernel.org> <auCOj9dgk42AE1WX@LeoBrasDK> <auExh5laWQbUKmUY@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_112012_142781_A00E1BDB 
X-CRM114-Status: GOOD (  41.00  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:19:35PM -0700, Oliver Upton wrote:
> On Tue, Oct 27, 2026 at 11:44:15AM +0000, Leonardo Bras wrote:
> > > I'm pretty sure I shared this feedback before, but patches that enable
> > > DBM do not make sense in isolation. We need a single series that
> > > contains the DBM enablement as well as the corresponding HDBSS support.
> > >
> > 
> > Right, 
> > My reasoning is that we can discuss this new version, and make the needed 
> > changes, so Tian could pick this for his own patch series for the next 
> > version. I do not intend to get this merged by itself.
> > 
> > Next time I will make sure to state this in the cover letter so it's clear.
> 
> Can you just work this out off-list? Let's keep the on-list dialogue
> consolidated to a single series to review.

Sure, will try to reduce this noise in kvmarm.

> 
> > > The abstract permission flags need to have a WRITE an DIRTY state, which
> > > we then map to hardware based on the capabilities of the system.
> > > 
> > > !FEAT_HAFDBS:
> > > 
> > > 	DIRTY	=> S2AP[1]
> > > 	WRITE	=> S2AP[1]
> > > 
> > > FEAT_HAFDBS:
> > > 
> > > 	DIRTY	=> S2AP[1]
> > > 	WRITE	=> DBM
> > > 
> > 
> > I agree that it could work, and my first version was based on that.
> > 
> > But looks weird to me that we have to decide the writable bit based on 
> > having a feature enabled.
> > 
> > Take in account that we can only have DBM being the writable bit while 
> > HAFDBS is enabled (not only present), and that it is just enabled during 
> > dirty-tracking. 
> > 
> > It means we would need to convert the whole pagetable between DIRTY=S2AP[1] 
> > and DIRTY=DBM every time we enable or disable dirty-tracking.
> > 
> > My suggestion with this series is to have WRITE=DIRTY=S2AP[1] at all 
> > times, and have DBM to act as a "can be promoted to writable on write" bit.
> > This way we don't actually need to convert between encodings, and it still 
> > works and complies with the architecture.
> 
> There's no such "can be promoted to writable on write" in the indirect
> permission model.

Well, IIUC it's kind of the default behavior, right?
Direct - DBM means HW can promote that page RO->RW, with HAFDBS=on
S2PIE  - All pages can be promoted RO->RW, as long as HAFDBS=on

> This is why I'm suggesting that we align the abstract
> permission bits (i.e. KVM_PGTABLE_PROT_*) with the architecture's own
> abstracted permissions (e.g. uX, pX, RO, RW).
> 

I think the approach you suggest makes sense, and it makes it simpler to 
deal with permission indirection in the future. In order to do like that, 
while keeping a single encoding for direct permission, I suggest we have:

-	KVM_PGTABLE_PROT_W			= BIT(2),
+	KVM_PGTABLE_PROT_DIRTY			= BIT(2),
...
+	KVM_PGTABLE_PROT_DBM			= BIT(6),
...

+#define KVM_PGTABLE_PROT_W	(KVM_PGTABLE_PROT_DBM | 
+				 KVM_PGTABLE_PROT_DIRTY)

(Rationale is: it's writable if it's either dirty, or can be made dirty by 
hardware on a write)

And then replacing by PROT_DIRTY the uses of PROT_W which were only 
tracking the fact it's dirty. I tracked just a couple of those.

When detecting the PROT_* based in PTE encoding, we track PROT_DIRTY, and 
PROT_DBM individually. The same can be done in nested, as we can just 
ignore the PROT_DBM for shadow pagetables, given we want, IIUC, to fault 
and update the original pagetables.

That would avoid switching between encodings while toggling HACDBS, and 
while making use of the DBM without directly associating it with the write 
permission.

What do you think?

> That composes nicely with nested virt as it is unambiguous what
> permissions we're trying to represent in a shadow stage-2. And in the
> non-nested case you can just lay down writable-dirty translations for
> most things and use writable-clean when necessary for HDBSS.
> 
> > > Beyond making the whole HAFDBS easy to reason about, I want this for
> > > FEAT_S2PIE which reimagines bit 7 as a literal dirty bit that can be
> > > managed by software or hardware.
> > 
> > Humm, and would not that work with the above suggested approach?
> > I mean, bit 7 (Dirty, S2AP[1]) will both mean WRITE/DIRTY, but it will be 
> > able to get promoted (nonW->W, or clean->dirty) based on the indirect 
> > permissions.
> 
> There's a bit more though. We need to have an entry in S2PIR_EL2 that
> encodes write permission and select that with PIIndex. So then we wind
> up mapping the abstract WRITE permission bit to two fields into the
> descriptor rather than 1.

Makes sense to me now.

Sorry I took long to reply your message, I was reading the docs for S2PIE 
and thinking on a solution that would make sense for it in the future as 
well.

I hope it's enough, but if it's not, let me know of any suggestions or 
requisites.

Thanks!
Leo


