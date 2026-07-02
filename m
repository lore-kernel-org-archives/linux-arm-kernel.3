Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vkCxUYdGc6HsGe8axtJlLSoi45F53TgZTi4SvtWs1s=; b=FxXJlGwKWHmPCXFOKA8iYT/jM2
	Vjq/oFVnAErxkclKXDr+g4BZXnU0vIzpbWlRumGI3xmPbRzJAcdXZmL/N/zwTXtBgBtzvjK0bU7wC
	1aNjMLGObSspnX+avhxUJebuJ9mpF/bM0Ax9t+EjegRaLhm5L8fDOU/yOpD5ftkxKXF/dTn5TkHEG
	qd8Db9DNKV3+iW/JQE1APtZ1QonlkXsk2C7SeweadFFFs2H4qC+nMW11dYJiqZcLUQidxxVoBT/NQ
	9VxnfArxldF8vVUdkv566pECcHSL1fHW9RmiJnOSV5wamY07omlrYiq9XwOrVKdI6i6aooHb3hNg1
	WdCV6/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCii-00000003r9Q-0rWG;
	Thu, 02 Jul 2026 08:24:28 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCif-00000003r8E-2M5l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/vkCxUYdGc6HsGe8axtJlLSoi45F53TgZTi4SvtWs1s=; b=UKpox/91JI/L79cCRqnEpQdtc5
	s2/XQRarW1t80sqshDVMAeJs35evT6IKdH66ZvNe9kOIYH74jF505hNFvLMveN+HiFqwteAgyxO1X
	dHwrrpoK4appFfILDkF9ML94tGPjkenYUj3d1Y6nYz6wx8z5s4MJxWrXNAc3B+vmB6glkBIAZkT1N
	45CaWj7ihuZKmSgiEMZf8iEpEC/YVuvIwFf42jbgaq0Cyssr4QzMZ1wGswJ3n7BP6sPZ3lOEqSc3+
	gix9Gn/9eqpw3U6zpMm3quj6EbIN11lJJgMbiFjum3PTy4nSi4vLowj24hrMDMX+4OLUKeQbJEtd9
	PN5Ixq7Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfCiQ-008Ue0-3A;
	Thu, 02 Jul 2026 08:24:11 +0000
Date: Thu, 2 Jul 2026 01:24:05 -0700
From: Breno Leitao <leitao@debian.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	Kyle McMartin <jkkm@meta.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <akYf9JXqAakxJEHF@gmail.com>
References: <20260701154528.768976-1-kas@kernel.org>
 <20260702001603.GN7525@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702001603.GN7525@ziepe.ca>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012425_606801_F277D749 
X-CRM114-Status: GOOD (  22.61  )
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

On Wed, Jul 01, 2026 at 09:16:03PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 01, 2026 at 04:45:28PM +0100, Kiryl Shutsemau (Meta) wrote:
> > The command, event and PRI queues are sized from the maxima the hardware
> > advertises in IDR1, which can be several megabytes each. On systems with
> > many SMMUv3 instances that cost is paid per instance and adds up to tens
> > of megabytes of coherent DMA in the capture kernel.
> > 
> > A kdump capture kernel runs from a small crashkernel reservation and only
> > has to drive the few devices used to save the dump, so deep queues serve
> > no purpose. The queues carry invalidation commands and fault records, not
> > DMA data, so dump throughput is unaffected; a shallower queue only bounds
> > how many commands may be in flight before a sync, which does not matter for
> > the capture kernel's small device count and modest I/O.
> > 
> > Clamp every queue to a single page when is_kdump_kernel() is true. Doing
> > it in arm_smmu_init_one_queue() covers the command, event and PRI queues
> > in one place. The command queue still holds at least one batch plus a sync
> > (256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
> > command batching keeps working.
> > 
> > Suggested-by: Kyle McMartin <jkkm@meta.com>
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> 
> Make sense to me
> 
> > +	if (is_kdump_kernel()) {
> > +		u32 ent_sz_shift = ilog2(dwords) + 3;
> > +
> > +		q->llq.max_n_shift = min_t(u32, q->llq.max_n_shift,
> > +					   PAGE_SHIFT - ent_sz_shift);
> 
> I saw lately many people saying you should not use min_t, why is it
> needed here?

Good point, it seems that both of them are u32

    - q->llq.max_n_shift is u32 (struct arm_smmu_ll_queue)
    - ent_sz_shift is u32, and PAGE_SHIFT is a small int constant, so
      PAGE_SHIFT - ent_sz_shift promotes to u32 too.

min() should be enough, I would say. With that, please feel free to add:

Reviewed-by: Breno Leitao <leitao@debian.org>


