Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B7C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp3qbRcMK+qSRdTP5DC3t5nOlTWwJjVKhzB6RRrS/G4=; b=3bSz46boB07y4jVf6OhT8u1Qqw
	W68MXaeTSwIYaSFQgxNxT4hNybPCUvl/o8dc1yNVUmHJFeP/d4uDpPsWZvB/mgTMB/sMKQ95xTzp6
	naIX/WYTDa5oDpuO4IjeKHalETWa2DHughJbW7o7K2nXwnvQdBy4ZMWcIx82yWlBrGN7excUF5rTz
	wOtqTrskDT+4uLSWiWLYwDNaTPgBV4nnhY0jb0akFKNdShFSDsMMFYUqjj7X4tbw5VlbTw4AOje00
	lwU3c28ejQhBG97Qb/qEfdtqfOrrcU4m+MXU2qLM9aT8b07z7RqTg+hHka+7ROL8Ir4o0oEdVO0Yo
	FIhUX4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92a9-00000005tAp-0yCk;
	Tue, 22 Sep 2026 15:38:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92a6-00000005t82-1Rws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:38:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4593B1576;
	Tue, 22 Sep 2026 08:38:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF1F93F86F;
	Tue, 22 Sep 2026 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790091532; bh=HrFOMvILt8mde757UBXQoH0Qn6la3KXBni8ZkY+U82c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZWMOlc5+LWH03p20wnXsaCTXtx5uUx9RUpYepDAs94yOCNGJPmdDx36nIjjwvZs6
	 iMGwFCxikjdKaJkxfkNuNc3It9gHlRkUGYU1nvAO2Ci6mpHOlooi8wVjjNJxUcHxUn
	 CkoYeED0HQDySx4myZIdTQKCzbTkNWK2QN1FxjnQ=
Date: Tue, 22 Sep 2026 16:38:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <arKhCKdlqNQwZn8E@arm.com>
References: <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
 <20260921121739.GM11599@ziepe.ca>
 <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
 <20260921123725.GN11599@ziepe.ca>
 <yq5a1pam4ocu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a1pam4ocu.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083854_492840_12A477EA 
X-CRM114-Status: GOOD (  15.88  )
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

On Mon, Sep 21, 2026 at 08:56:41PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Sep 21, 2026 at 02:24:21PM +0200, Christian König wrote:
> >
> >> I also don't see where mem_cc_shared_granule_size is added?
> >
> > Patch 1:
> >
> > https://lore.kernel.org/all/20260904103452.1197239-2-aneesh.kumar@kernel.org/
> >
> > Aneesh, please be sure to use get_maintainers on series like this so
> > everyone gets cc'd.
> 
> For v7, I included only the maintainer entries because the recipient
> list was getting too long, but I added the mailing lists.

I could not see Christian in the recipients of v7. Sometimes the list cc
is enough but my inbox for example is already around 4000 new email, so
easy to miss.

Recommendation: add Cc: lines to each patch with the people that must
ack your changes (the maintainers for those specific patches). You can
then collate all the cc's from your patches, add them to the cover
letter and use --cc-cover with git send-email.

Of course, the list can get large. You can then make a call with who to
drop: colleagues you talk to regularly can be skipped for example, maybe
reviewers if there are too many for a subsystem. I would not drop people
that gave you feedback already on a previous version and not the
maintainers you need acks from (you can drop them if they already acked
your patches).

-- 
Catalin

