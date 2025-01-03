Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009ADE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSqNWSBaV4p1bQlMmFCc0ZsTCUtJFbgo6rfxh+KNAgM=; b=ByYr5MkSHVsZ9vFHNojraH7auo
	7LG+AOpMn8CMNFLv4u3xiw0OR0FbWQVJjJl0EGc71HAteZjEJ/x3zpxw24rqrelMcJ9RIDm+h+W34
	vEkoNInuH/sOSPFWQsn4sJrBQ60CcDcZbTcxvfKu9YzZPD+B1vuj0aAx8sprQjsiYmNTOENvPAT47
	8NksNUGaqqCSf+iNhWLGuo3/bZmPFPiFfs6vPsHiiGqNXprNImSyRNRE0C4jd6eltbQNuiqr25Vti
	9mEsk0rY33XylKhhuNvM3E9iKNPe1kDhPX+Q7wKgDYR+iprKkscrdvpbRz5/StNUVFdSoTyva0Cnt
	1YTFEyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlyZ-0000000De3v-3EgI;
	Fri, 03 Jan 2025 18:00:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlwl-0000000Ddok-41NN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 17:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ACD95C64E1;
	Fri,  3 Jan 2025 17:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5D1C4CECE;
	Fri,  3 Jan 2025 17:58:52 +0000 (UTC)
Date: Fri, 3 Jan 2025 17:58:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, will@kernel.org,
	ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, chenfeiyang@loongson.cn,
	chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
Message-ID: <Z3glWkXg6EnVx8WU@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
 <Z2W5Bs0bZANI6NKv@arm.com>
 <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
 <Z3bXIjJjEaoOaxbH@arm.com>
 <abb6612b-8845-411b-bfc2-751538cb06b7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb6612b-8845-411b-bfc2-751538cb06b7@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_095856_081463_81F90DEB 
X-CRM114-Status: GOOD (  36.04  )
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

On Fri, Jan 03, 2025 at 10:43:51AM +0800, Zhenhua Huang wrote:
> On 2025/1/3 2:12, Catalin Marinas wrote:
> > On Fri, Dec 27, 2024 at 08:27:18AM +0530, Anshuman Khandual wrote:
> > > On 12/21/24 00:05, Catalin Marinas wrote:
> > > > On Mon, Dec 09, 2024 at 05:42:27PM +0800, Zhenhua Huang wrote:
> > > > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > > > index fd59ee44960e..41c7978a92be 100644
> > > > > --- a/arch/arm64/mm/mmu.c
> > > > > +++ b/arch/arm64/mm/mmu.c
> > > > > @@ -1169,7 +1169,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
> > > > >   				unsigned long addr, unsigned long next)
> > > > >   {
> > > > >   	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> > > > > -	return 1;
> > > > > +
> > > > > +	return pmd_sect(*pmdp);
> > > 
> > > Please change this as pmd_sect(READ_ONCE(*pmdp)) instead.
> > > 
> > > > >   }
> > > > >   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> > > > 
> > > > Don't we need this patch only if we implement the first one? Please fold
> > > > it into the other patch.
> > > 
> > > Seems like these patches might not be related.
> > > 
> > > While creating huge page based vmemmap mapping during vmemmap_populate_hugepages(),
> > > vmemmap_check_pmd() validates if a populated (i.e pmd_none) PMD already represents
> > > a huge mapping and can be skipped there after.
> > > 
> > > Current implementation for vmemmap_check_pmd() on arm64, unconditionally returns 1
> > > thus asserting that the given populated PMD entry is a huge one indeed, which will
> > > be the case unless something is wrong. vmemmap_verify() only ensures that the node
> > > where the pfn is allocated from is local.
> > > 
> > > int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
> > >                                  unsigned long addr, unsigned long next)
> > > {
> > >          vmemmap_verify((pte_t *)pmdp, node, addr, next);
> > >          return 1;
> > > }
> > > 
> > > However it does not really check the entry to be a section mapping which it should.
> > > Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
> > > case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
> > > original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
> > > this does not need a "Fixes: " tag.
> > 
> > I did not say the patch is wrong, only that it wouldn't be needed unless
> > we have the other patch in this series. However, if we do apply the
> > other patch, we definitely need this change, so keeping them together
> > would make it easier to backport.
> 
> Hi Catalin,
> 
> Based on our current discussion on patchset #1, we will prohibit
> hugepages(vmemmap mapping) for all hotplugging sections...The flow:
> vmemmap_populate
> 	vmemmap_populate_hugepages
> 		vmemmap_check_pmd
> 
> will *only* be called for non-early sections. Therefore, with patchset #1, I
> don't see the patch as essential.. Would it be acceptable if we do not
> backport this patch?  Anshuman's suggestion seems reasonable to me and I
> separated the patch out:
> https://lore.kernel.org/lkml/20250102074047.674156-1-quic_zhenhuah@quicinc.com/

Ah, ok, so if you only call vmemmap_populate_basepages() for hotplugged
memory, the vmemmap_check_pmd() won't even be called. So yeah, in this
case there won't be any dependency on this change. If we somehow end up
with a mix of vmemmap basepages and hugepages for hotplugged memory, we
probably need to update vmemmap_check_pmd() as well (and backport
together).

-- 
Catalin

