Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF8F589DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qVBvXxlgya89SxaZAr5N0EnIlllRggjnL98TRto1Gs=; b=tsnHWcipFi0/15X5rWxQPvgT6h
	4OSZm50rP6UJU0hlp/XcXnyIpzey227uA6u2ozw2W+nsUIZUnXAdcfkdA0IkKNls5RFu918UhYetv
	EWwq1/s1+Er0YtoPnNCsRdwG2oRD1vMkmTCuhkbiVASkxLOEBu/VG4VGsxfN9XRm0FUWweD58Kd2N
	5fTjqEbWXtGG89NfZmQkC9sri3/1e7YzJDRlmNyr+EyG1sxFnFlWGSQCAihvCGR/ArYO9DBYZNyO+
	44divAPywt+lXVPwHbhgUT/tmsGDTqdmGmBc3oj3alZG6rUWgOoW15ibUDLHLmMHne1fzkwqqEcQs
	0XbQ8zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuxs-0000000BpFR-0QHZ;
	Thu, 23 Apr 2026 14:23:36 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuxm-0000000BpCK-07Jf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:23:34 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8eea23d01f7so122788985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776954208; x=1777559008; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qVBvXxlgya89SxaZAr5N0EnIlllRggjnL98TRto1Gs=;
        b=RGAF66ZMCXHKV1++kOPfhu1JTWF3h62qDmffI9MDqRPmUJtL128tRkHXCqa+KDCoPq
         SaUI1T1oolk7+z9QAfrLna2uEfra6gHYdl6Qgh6Nf8HMZSqZ+WKv1vYJCMKbvixqT2FJ
         rOFbCuZryEkcXLA3ukhvPbtnyLZ6Z/WiqjLTfxwWu4jInc12waNmn4F5azSRQP+pLFi6
         l13BG4Oy3quwIqMgxntl/FE9o4lKUbRfVJjUiI4b/UoP0NXuzpMgZGEILJtECeV/eLgd
         68v2DJa70kG/9DKXlDkE2/40qy9blAoL4vkFRgBiQtC+EvQMQeSUPEv82JTCChatz8JU
         smxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776954208; x=1777559008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qVBvXxlgya89SxaZAr5N0EnIlllRggjnL98TRto1Gs=;
        b=PbDCrSW0iCy+Igu0gH3nqUA9B9kToI3hEm84jMP97s7c6B7pTKbwAqVg85MJyhuykB
         tyoh4Xzlbjxtm+dUN5/8MoAzZfnZyztp1C17ulJU6ntatYWyAIyuLsAa4EAISNvGvOHr
         q4m+45FMTVXG1l1DETq0y7cNgIig4gknvwSecNrFWwayhyw+uE8WAbo9xs8oqYQk+57p
         qbRM0tMm5dEsU3zYx4S+/srrolDxVKKMNvwqDQfWPpGIoPp7L8m/Pl3kzr1GZsHGSBCM
         Sh6tMa0luFcAste5eAYFQgNXO93PFTDOIUF9B+Ld5M2qa+PuBboftd3VfK19MGn77VsL
         nFNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+chtLUdebZ+7K8z/CiVaNAFLDCAH3URh5l+bYMaGK4Mu/RhoItg6ViCWaBnCdgf+fvUOyBy0dq/5SRtH0f3Ofh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/M8hvPE9CSHuLzGIzvl7mYi0W5Hz9eIAgMAG5mJPwg2BPdB4M
	Z3r1DAjPeCM2vonYOE4qle0+23kM9iTt8QAVgljHmyLGRrgvPNj1Fa7TZJ7nA3wI2no=
X-Gm-Gg: AeBDieu/6QPfXCbEIGwOPtafJJCzL3FFCskCURaSPl32aiSfaES2tYX75VyL3y/V2KY
	BZkJtRG2TJfreu4BouwvznKwBazdVbqwnNABkcr6BGMNXk+ev2K6SK9kzLRcC0cBBqIXXzCK5Rb
	GKQ9OI+f9MV2BJIJLgWmnZ6l7E1n7vzyrjDwLaTGAR8uUdr3vtwDia1P6IUofAK5YOb9do9vjx4
	M83WdmMINNsHW3o3R4CiUyk3cKyIJB903GaC/QR78F4MV//C5nakfExnWr7vGPif82mFY/J6jdm
	QfqhqCnSPdPt9Fi6iOeA5mmDzO0K8nmFIQD2OSpYTXxMKxDsJVbGwgMgjeNc1NZ56Pj7tO3fBTp
	wcPIghQCdWmWUNzxb1Xk5sY9Zz5BG66Rfkxcy/CDzhPIui9zgysmwOFwt8ZjapyaSMbMlQBZ+Ef
	FpnbaGhy9T1Xj+OQSdR2Q8stnwS4TodY/myj22WDF5wxdqP1mAQLUKVvSFyEFWd2CwtIc/kJGKX
	E8xVz59/0se0Sg/rlnJwNcXHvA=
X-Received: by 2002:a05:620a:649b:b0:8ea:b4d3:b19c with SMTP id af79cd13be357-8eab4d3b2d6mr2477211985a.28.1776954208170;
        Thu, 23 Apr 2026 07:23:28 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb9becc6c3sm1028305785a.39.2026.04.23.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:23:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wFuxi-0000000EEOw-3RUE;
	Thu, 23 Apr 2026 11:23:26 -0300
Date: Thu, 23 Apr 2026 11:23:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Evangelos Petrongonas <epetron@amazon.de>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260423142326.GP3611611@ziepe.ca>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aenqxasLJ8yKYqbT@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_072330_180845_2A82050D 
X-CRM114-Status: GOOD (  39.69  )
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

On Thu, Apr 23, 2026 at 10:47:49AM +0100, Will Deacon wrote:
> On Thu, Apr 23, 2026 at 10:44:08AM +0100, Will Deacon wrote:
> > On Wed, Apr 22, 2026 at 01:23:51PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Apr 22, 2026 at 06:44:31AM +0000, Evangelos Petrongonas wrote:
> > > > The motivation is live update of the hypervisor: we want to kexec into a
> > > > new kernel while keeping DMA from passthrough devices flowing, which
> > > > means the SMMU's translation state has to survive the handover. The Live
> > > > Update Orchestrator work [1] and the in-progress  "iommu: Add live
> > > > update state preservation" series [2] are building exactly this plumbing
> > > > on top of KHO; [2]'s cover letter calls out Arm SMMUv3 support as future
> > > > work, and an earlier RFC from Amazon [3] sketched the same idea for
> > > > iommufd.
> > > 
> > > It would be appropriate to keep this patch with the rest of that out
> > > of tree pile, for example in the series that enables s2 only support
> > > in smmuv3.
> > > 
> > > > For this use case, Stage 2 is materially easier to persist than Stage 1,
> > > > for structural rather than performance reasons: 
> > > 
> > > I don't think so. The driver needs to know each and every STE that
> > > will survive KHO. The ones that don't survive need to be reset to
> > > abort STEs. From that point it is trivial enough to include the CD
> > > memory in the preservation.
> > > 
> > > It would help to send a preparation series to switch the ARM STE and
> > > CD logic away from dma_alloc_coherent and use iommu-pages instead,
> > > since we only expect iommu-pages to support preservation..
> > 
> > Does iommu-pages provide a mechanism to map the memory as non-cacheable
> > if the SMMU isn't coherent? 

No, it has to use CMOs today.

It looks like all the stuff dma_alloc_coherent does to make a
non-cached mapping are pretty arch specific. I don't know if there is
a way we could make more general code get a struct page into an
uncached KVA and meet all the arch rules?

I also think dma_alloc_coherent is far to complex, with pools and
more, to support KHO.

> > I really don't want to entertain CMOs for > the queues.
> 
> Sorry, I said "queues" here but I was really referring to any of the
> current dma_alloc_coherent() allocations and it's the CDs that matter
> in this thread.

queues shouldn't change they are too performance sensitive

> The rationale being that:
> 
> 1. A cacheable mapping is going to pollute the cache unnecessarily.
> 2. Reasoning about atomicity and ordering is a lot more subtle with CMOs.

The page table suffers from all of these draw backs, and the STE/CD is
touched alot less frequently. It is kind of odd to focus on these
issues with STE/CD when page table is a much bigger problem.

STE/CD is pretty simple now, there is only one place to put the CMO
and the ordering is all handled with that shared code. We no longer
care about ordering beyond all the writes must be visible to HW before
issuing the CMDQ invalidation command - which is the same environment
as the pagetable.

> 3. It seems like a pretty invasive driver change to support live update,
>    which isn't relevant for a lot of systems.

That's sort of the whole story of live update.. Trying to keep it
small means using the abstractions that support it like iommu-pages.

IMHO live update is OK to require coherent only, so at worst it could
use iommu-pages on coherent systems and keep using the
dma_alloc_coherent() for others.

I also don't like this "lot of systems thing". I don't want these
powerful capabilities locked up in some giant CSP's proprietary
kernel.  I want all the companies in the cloud market to have access
to the same feature set. That's what open source is supposed to be
driving toward. I have several interesting use cases for this
functionality already.

It will run probably $50-100B of AI cloud servers at least, I think
that is enough justification.

Jason

