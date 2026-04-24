Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB61FED3EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zKflapK0+bktjIs1iUdOrcurlF9DL6mXrjwlTDFBE8=; b=KdteUsK9xoJUMVipljSaiCyxU1
	sVMpQNcsHWr9SPAElQId5GriubmFVbZxxm9Du14H/8worKa5NhT7IqPM2WeSplEAaLKRBiwvqCHMa
	VDgEk86mdpCR1KWFxXXm9GWMlnJvB+oC7UhrQcfHot9zaR0RgS+oKO/b0qK39lZp5tpgQJOHXDFYx
	PL3RHei/fpoOU0FboeHwHWlAc1tplCCF6d5tqNi+7+0EyUo1SWb+86g30vHSo+s6d0KBmJ95Hgfmn
	Sf7aPByNEAH+DLw4UvQEoFNhBD44bbahWHILZdVhh2FPUsyRimrXq4rk3h+aPMnufTTxzxdAF1vRQ
	Te3WOumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIyG-0000000DQYe-1lmd;
	Fri, 24 Apr 2026 16:01:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIyD-0000000DQYF-3k7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51730404E2;
	Fri, 24 Apr 2026 16:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC45DC19425;
	Fri, 24 Apr 2026 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777046493;
	bh=WOG+Fz92/zHztMNljeKjVYSh8yhdUV+2hZiJ4s0U7pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMlr5elmIrCp2UsJN2f5fAr2iKdsMtc5nmCYtxgK8U2AmEcfWX1s6IR4hjV/434Ag
	 x9H2urDs6s0MfrvgL2QIxMxIdOnZX5a4s91bG4YTPZiXGHPI3gA+4vRuIGnQIJCXEt
	 q6q129bIux5Ssg45yiaeE6pYPiSv6hJTvW5F5OdVT15t8GPkHJFBzbBne4GzE5Me9S
	 obAqMJ5UrNV/nltVrTYYshkRi/Af4NsZJtOkqXbeluQ07xWmOV40zczK8OpTg81dnt
	 FYYfIqgQvuz8srm7jrj3vsUBOYSCbX0O4hxkVU6VX2ItzcTc1RKNgCq5xJ33wL5yz/
	 pL5JUDasBTECQ==
Date: Fri, 24 Apr 2026 17:01:27 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Evangelos Petrongonas <epetron@amazon.de>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <aeuT1-TB6dOT5ZQ2@willie-the-truck>
References: <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
 <aepRy7Gp7Ng85Zr7@willie-the-truck>
 <20260423223716.GS3611611@ziepe.ca>
 <aeuJQW8bGLY-O_vv@willie-the-truck>
 <20260424154256.GF3611611@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424154256.GF3611611@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_090133_990283_5F7D4E20 
X-CRM114-Status: GOOD (  36.96  )
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

On Fri, Apr 24, 2026 at 12:42:56PM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 24, 2026 at 04:16:17PM +0100, Will Deacon wrote:
> > > > > STE/CD is pretty simple now, there is only one place to put the CMO
> > > > > and the ordering is all handled with that shared code. We no longer
> > > > > care about ordering beyond all the writes must be visible to HW before
> > > > > issuing the CMDQ invalidation command - which is the same environment
> > > > > as the pagetable.
> > > > 
> > > > You presumably rely on 64-bit single-copy atomicity for hitless updates,
> > > > no?
> > > 
> > > Yes, just like the page table does..
> > > 
> > > I hope that's not a problem or we have a issue with the PTW :)
> > 
> > You trimmed the part from my reply where I think we _do_ have an issue
> > with the PTW. Here it is again:
> > 
> >   The non-coherent case looks more fragile, because I don't _think_ the
> >   architecture provides any ordering or atomicity guarantees about cache
> >   cleaning to the PoC. Presumably, the correct sequence would be to write
> >   the PTE with the valid bit clear, do the CMO (with completion barrier),
> >   *then* write the bottom byte with the valid bit set and do another CMO.
> 
> I wasn't sure if you are being serious.
> 
> CMO + barriers must provide an ordering guarentee about cache cleaning
> to POC otherwise the entire Linux DMA API is broken. dma_sync must
> order with following device DMA. IMHO that's not negotiable for Linux.

The problem is with concurrent DMA (from the page-table walker) and I
don't see anything that guarantees that in the CPU architecture. I don't
think the streaming DMA API pretends to handle that case, does it? It
relies on a pretty rigid ownership concept from what I understand.

> All ARM iommus rely on 64 bit atomic non tearing. No bugs reported?

It's hard to judge as I don't think SMMUs tend to perform a lot of
speculative address translation when DMA isn't active. 

> Any fix to that is going to have major performance downsides..
> 
> I also strongly suspect it is provided on real HW. It would be hard to
> even build HW where <= 64 bit quanta can tear.
> 
> Maybe this is something ARM should take a look at.

Yes, we should ask. Maybe I missed something in the Arm ARM, but I can
also seeing it being a pain to specify this behaviour all the way out to
the PoC and I wouldn't be so bold as to say that it's hard to build HW
that would exhibit problems here.

> > > And if Samiullah can tackle dma_alloc_coherent then maybe the whole
> > > question is moot.
> > 
> > Yes, that would be great, but we probably need to fix the page-table
> > code too.
> 
> You really want to deal with the likely perf regressions that would
> cause on Android/etc?

Of course I'd rather that the architecture said that our current code
is fine, but if it doesn't then I don't have much choice, really. At the
very least, we should minimise the number of places where we rely on
non-architected behaviour and so keeping the CDs and STEs non-cacheable
remains my preference.

Will

