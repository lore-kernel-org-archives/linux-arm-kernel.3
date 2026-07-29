Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFC1C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4o5uQ4Z4ZmC9hYG7I6GTwOWReuDWttRkZLNtPRp0blc=; b=WRUaG3bAwJTSGySL+a07nA8BlT
	70j74anmeHGf4sCF4BrrlqL21epVpkTsQAwKxRWJVSJkXLtfZdnYdnTd+pxbAlQdNTyJva6muGByT
	OdVZV7MbZ/LLFNnwaD29bmvQ68fJc8OD7yHDoELrPKKfOfhqEVcoC1SjmAeBFRxXhz7Oj6dkB4/dA
	q5/WOnY++0sIVE3wxT87OWSaIap7mp/a5tuJcSkhqPR1S33u31e6DQX7x5YKw+VFzXgesxF0llcXL
	NkNdzyboXO/jKSeA0OE2gCFdB6FKeTcKdgf4KEfCX3+Um2jbJ2yxOFAxPLxpko+nRzRczmsxmIV4S
	OxP+cROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp61s-00000008Mtj-2MgB;
	Wed, 29 Jul 2026 15:17:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp61p-00000008MtF-34kq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:17:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E1F1684;
	Wed, 29 Jul 2026 08:16:59 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EF353F763;
	Wed, 29 Jul 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785338223; bh=l2KGUYqW0UfMsHtQ5m9chnamEWLhEe2YPIHzEgOQPTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IrINi992JDxSzObZPgC2ZDiKIaq2Ox0SRSnnKuPayaGAptDRrqk8polkETNxgIuak
	 FOERoGq28jGE5o+lVefw5575Rfo4gGYd9xQM8A2Kqyu2xeZ+jCAPr5Na5udLniJI7d
	 PdufV4u2/yaZhZJFt8sLnk9iWysGOLEJeygwvTIo=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware dirty tracking
Date: Wed, 29 Jul 2026 16:16:51 +0100
Message-ID: <amoZY8uGLf1PEpjK@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <96516762-f004-4c2a-a9c6-6fbad49ad6ae@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <20260709104026.2612599-4-zhengtian10@huawei.com> <aliKo7dTZzKcWHzI@kernel.org> <0943eb14-9ffb-4dbb-9219-060e97bca2a7@huawei.com> <alpIfIOFfrudBzD5@LeoBrasDK> <al4bYajWE-v6wofu@LeoBrasDK> <96516762-f004-4c2a-a9c6-6fbad49ad6ae@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_081705_847203_312467B1 
X-CRM114-Status: GOOD (  40.24  )
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

On Wed, Jul 29, 2026 at 04:51:59PM +0800, Tian Zheng wrote:
> 
> 
> On 7/20/2026 8:58 PM, Leonardo Bras wrote:
> > On Fri, Jul 17, 2026 at 04:21:32PM +0100, Leonardo Bras wrote:
> > > On Fri, Jul 17, 2026 at 11:58:06AM +0800, Tian Zheng wrote:
> > > > 
> > > > On 7/16/2026 3:39 PM, Oliver Upton wrote:
> > > > > Hi Tian,
> > > > > 
> > > > > On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
> > > > > > -	if (prot & KVM_PGTABLE_PROT_W)
> > > > > > +	if (prot & KVM_PGTABLE_PROT_W) {
> > > > > >    		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> > > > > > 
> > > > > > +		/*
> > > > > > +		 * No DEVICE filter needed here: relax_perms is only called
> > > > > > +		 * on FSC_PERM faults. Device pages always get full RW from
> > > > > > +		 * initial mapping and are never write-protected during
> > > > > > +		 * migration, so they never trigger a permission fault.
> > > > > > +		 */
> > > > > > +		if (pgt->flags & KVM_PGTABLE_S2_DBM)
> > > > > > +			set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> > > > > > +	} else {
> > > > > > +		/*
> > > > > > +		 * Clear DBM on W→RO downgrade to prevent hardware from
> > > > > > +		 * silently upgrading RO+DBM back to W+dirty, which would
> > > > > > +		 * bypass KVM's write tracking and cause data corruption.
> > > > > > +		 */
> > > > > > +		clr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> > > > > > +	}
> > > > > > +
> > > > > This block makes it pretty evident that the DBM bit really *is* the
> > > > > write permission bit. I'd much rather we introduce the concept of dirty
> > > > > state to the page table library and migrate the abstract write
> > > > > permission to the DBM field, even if we don't have FEAT_HAFDBS.
> > > > > 
> > > 
> > > Ohh, that's an amazing idea!
> > 
> > Thinking about that again...
> > If we adopt the encoding with DBM being the write-permission bit, and all
> > PTEs have it since the start, how can we have lazy-splitting happening?
> > 
> > Only way I think of is removing both DBM and S2_S2AP_W bit from writable
> > PTEs during dirty-track enable, and re-adding them during the first write
> > fault. If we don't remove the DBM bit, systems with HDBSS would just dirty
> > it by hardware, without causing a fault.
> > 
> > DBM=0 would need to happen only in the first write-protect (only on
> > lazy-splitting). All other write-protecting would just clean the S2_S2AP_W
> > bit, as everything is already split.
> > 
> > Is that what was intended?
> > 
> > Thanks!
> > Leo
> > 
> Hi Leo,
> 
> I think the cleanest way to handle this is to simply avoid setting DBM
> on block mappings. If we only set DBM on page-level PTEs, then block
> mappings will naturally stay DBM=0 and trigger a write fault on first
> access — exactly what we need for lazy splitting.
> 
> When the fault occurs, the block gets split into page-level PTEs, and at
> that point we can set DBM=1 on the resulting leaf entries. This way:
> 
> 1. Lazy split works naturally (fault -> split -> set DBM=1)
> 
> 2. No need to clear DBM globally at dirty-track enable
> 
> 3. No special handling for block mappings
> 
> So I think global DBM is still viable — we just need to filter out block
> mappings when setting the DBM bit. That way the lazy split path is preserved
> without extra complexity.

Hi Tian,

Humm, but would not that be contrary to what Oliver suggested: changing the 
encoding from the PTE for all entries?

(Like, if the PTE is writable, it has to have DBM set)

IIUC what you said, on first faulting of the page in the VM:
- If the entry is a page (level-3 leaf) and writable, add DBM
- If it's a block entry (leaf but not a level-3), don't add DBM

So after we enable dirty-logging:
- a level-3 entry would not fault, using HDBSS, and
- a block entry would fault, do the splitting, and add DBM to level-3 
  entries during the split.

If I got that correct, that would be clean indeed.

But then we would have a different encoding for block entries and page 
entries. In page entries, DBM could be used to say if the page is writable, 
but on block entries one would have to look at the 'dirty-bit'.

Would that be ok?

Thanks!
Leo

