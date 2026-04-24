Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A96FED3E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaCdOObf5UPcAvD+z2xe46ZSwFGPYF4x6Up09Mib5CA=; b=yonIRqY6XHB4m1TtKaM9kUetZ1
	e5iwjgHKKT/W6Bk23WymvCFDnjRmwThEJfhpHVmEOY5xNOkbtcuKG1Px/wHyyi44g/lvjkBpHCHpH
	AU7p8XCmCjZOmujN8iTEnHYz34F5vEQYo3QXZ+DJNJbcxu+0Fnc1fiANcVts+/sEb/K6VXd7IIbue
	YeASMwSVTxh6LOa3JAMnbOulToLiNi7eNuEbtG3hJbXhavWBAGL5mujv0vRBTCfDDGwEdN7pBgocm
	OG0boDjlBYMUvU7uDBU5Irf98ay1GZjV2DnGe4DnaLYFedzqw++zvVEidrjDvlFnJVovQ6Xrj5zLS
	FaFpdHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIGY-0000000DNWW-1YU5;
	Fri, 24 Apr 2026 15:16:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIGV-0000000DNW8-41NQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 15:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D15F41690;
	Fri, 24 Apr 2026 15:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95047C19425;
	Fri, 24 Apr 2026 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777043782;
	bh=nrM3UKcrO7tPwOt1LFMCFnX8PG4XqEiYfdua6M/CYZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6v7GrWsEyBK2JTdhH44O/VJffVliTLN/jxYcPHtXzEA3iIKF1gnE3HGxGa9SKEQA
	 RS7yTV0uv7X/4/m3kSfAS4hKfKLkfs/T231MtXN7LZH4G6Oq5otf3NdFktwJTloTB/
	 AO/SVqd3Vzh3GyM8KS82GO1bSOmBWKyslzNbrFj80ipoaHN4HDTc14XqNe+SGZ+ymG
	 i2FQpB8i/+GN99DxFVUqc028G3/n7yltam8zR7wSeIQZRovjqGiOPyvFKHUR6HZFKC
	 niK8h5kYh3SfA4v1gs9iKh7L5JIC4yU5amMeESkf8nVxOeHry7hfqPBqTDutoLCpT8
	 +MFE/f+awrvyA==
Date: Fri, 24 Apr 2026 16:16:17 +0100
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
Message-ID: <aeuJQW8bGLY-O_vv@willie-the-truck>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
 <aepRy7Gp7Ng85Zr7@willie-the-truck>
 <20260423223716.GS3611611@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423223716.GS3611611@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_081624_035336_7147BDC5 
X-CRM114-Status: GOOD (  37.38  )
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

On Thu, Apr 23, 2026 at 07:37:16PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 23, 2026 at 06:07:23PM +0100, Will Deacon wrote:
> 
> > I don't think it's that odd given that the STE/CD entries are bigger
> > than PTEs and the SMMU permits a lot more relaxations about how they are
> > accessed and cached compared to the PTW.
> 
> Well I'm not sure bigger really matters, but I wasn't aware there was
> a spec relaxation here that would make the cachable path not viable
> for STE but not PTW...

Things like the SMMU being allowed to cache invalid structures and
loading structures using multiple, unordered accesses are the things
that worry me relative to the page-tables. But see below.

> > Having said that, the page-table code looks broken to me even in the
> > coherent case:
> > 
> > 	ptep[i] = pte | paddr_to_iopte(paddr + i * sz, data);
> > 
> > as the compiler can theoretically make a right mess of that.
> 
> Heh, great. The iommupt stuff does better.. It does a 64 bit cmpxchg
> to store a table pointer and a 64 bit WRITE_ONCE to store the pte,
> then a CMO through the DMA API.
> 
> DMA API has to guarentee the right ordering, so we only have the
> question below:
> 
> > > STE/CD is pretty simple now, there is only one place to put the CMO
> > > and the ordering is all handled with that shared code. We no longer
> > > care about ordering beyond all the writes must be visible to HW before
> > > issuing the CMDQ invalidation command - which is the same environment
> > > as the pagetable.
> > 
> > You presumably rely on 64-bit single-copy atomicity for hitless updates,
> > no?
> 
> Yes, just like the page table does..
> 
> I hope that's not a problem or we have a issue with the PTW :)

You trimmed the part from my reply where I think we _do_ have an issue
with the PTW. Here it is again:

  The non-coherent case looks more fragile, because I don't _think_ the
  architecture provides any ordering or atomicity guarantees about cache
  cleaning to the PoC. Presumably, the correct sequence would be to write
  the PTE with the valid bit clear, do the CMO (with completion barrier),
  *then* write the bottom byte with the valid bit set and do another CMO.

> > > I also don't like this "lot of systems thing". I don't want these
> > > powerful capabilities locked up in some giant CSP's proprietary
> > > kernel.  I want all the companies in the cloud market to have access
> > > to the same feature set. That's what open source is supposed to be
> > > driving toward. I have several interesting use cases for this
> > > functionality already.
> > 
> > Sorry, the point here was definitely _not_ about keeping this out of
> > tree, nor was I trying to say that this stuff isn't important. But the
> > mobile world doesn't give a hoot about KHO and _does_ tend to care about
> > the impact of CMO, so we have to find a way to balance the two worlds.
> 
> Yes, that make sense.
> 
> My argument is that the CMO on STE/CD shouldn't bother mobile, you
> could even view it as an micro-optimization because we do occasionally
> read-back the STE/CD fields.

I was against that read-back, iirc :)

> And if Samiullah can tackle dma_alloc_coherent then maybe the whole
> question is moot.

Yes, that would be great, but we probably need to fix the page-table
code too.

Will

