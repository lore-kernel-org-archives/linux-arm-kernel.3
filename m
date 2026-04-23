Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB1F9935A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0A9Om1d5u1UIlsgQUCfL3HrY0EjlRzF90bBHBVrORU=; b=RBkeuokmg6WnonJzph/AK6m+DB
	Fu8ygeFZsdRe1TKn3NTMu8aAZtV7PEki7S84LtDPzyuaBmSxbd4OLUXqn/P12fODTIMi7Iqf/7RuH
	VwTFBy9Xr3adk4HcyHYmDjE9Sl/w9a3OjhOSKPGA1fCX/t/43OxB3VzfIMrNxZxmPBX1yBZw1tWYi
	w1/7YCucO4jItIqyBJM7ZX3681FnBgjNcBCmMM2BlErbzW3lsUx7qgEEr6ie9HeV1aE3Ike2JNU+W
	O7tolK3fA+uhCYPL3U32ZPDpgoeSJVreSBNEA4+vp2OyraKbBRIZVWFYHl46eQzWNKsKydA/iSwl8
	kq8K94ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqba-0000000BPdc-2Kdy;
	Thu, 23 Apr 2026 09:44:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqbY-0000000BPdG-1bk1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61A7A43805;
	Thu, 23 Apr 2026 09:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF8FC2BCAF;
	Thu, 23 Apr 2026 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776937455;
	bh=fDvsL0aY81zyDVkYCGzXT70F+YYlXrLKm52ouhe2SKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3+CI0sMhoEpkBBhgojks254wglba/Eook+DIoF0VfPZxEnr1J843GDhv95EZbrZO
	 hhZny20ipACHgc7Grzufn5r7EDOqd83xUB7iOX/lKEzJVpjis2Pkxk/XiC5n3rTCgT
	 ooykqhyj3yosOz0l2ajeZQhf2xcMX6L32J8Kb14p2fupQL3MCLdBFWxQOjG/hpztoE
	 3g43NCr3mUVU9522Y6PehQW9PwuE7+oX3SfV4bgmH9cr8I98ibPoMx7yX2yYptB+NT
	 FrVq7RJahnxZq6+jsTAs3JuCtk1fXFmc8dIVhep+XXhh0f4+5TXiCMkAlpa4O9w4rD
	 ToACv09BiCBuQ==
Date: Thu, 23 Apr 2026 10:44:08 +0100
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
Message-ID: <aenp6FHzx9rtUQkZ@willie-the-truck>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422162351.GK3611611@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_024416_466387_5A747C03 
X-CRM114-Status: GOOD (  21.18  )
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

On Wed, Apr 22, 2026 at 01:23:51PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 22, 2026 at 06:44:31AM +0000, Evangelos Petrongonas wrote:
> > The motivation is live update of the hypervisor: we want to kexec into a
> > new kernel while keeping DMA from passthrough devices flowing, which
> > means the SMMU's translation state has to survive the handover. The Live
> > Update Orchestrator work [1] and the in-progress  "iommu: Add live
> > update state preservation" series [2] are building exactly this plumbing
> > on top of KHO; [2]'s cover letter calls out Arm SMMUv3 support as future
> > work, and an earlier RFC from Amazon [3] sketched the same idea for
> > iommufd.
> 
> It would be appropriate to keep this patch with the rest of that out
> of tree pile, for example in the series that enables s2 only support
> in smmuv3.
> 
> > For this use case, Stage 2 is materially easier to persist than Stage 1,
> > for structural rather than performance reasons: 
> 
> I don't think so. The driver needs to know each and every STE that
> will survive KHO. The ones that don't survive need to be reset to
> abort STEs. From that point it is trivial enough to include the CD
> memory in the preservation.
> 
> It would help to send a preparation series to switch the ARM STE and
> CD logic away from dma_alloc_coherent and use iommu-pages instead,
> since we only expect iommu-pages to support preservation..

Does iommu-pages provide a mechanism to map the memory as non-cacheable
if the SMMU isn't coherent? I really don't want to entertain CMOs for
the queues.

Will

