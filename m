Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E43CC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4lnURhfzLt4ZG1kGMIJ3ymz+Jww91zPev1XOVrjOkY=; b=VJuxxsxzxnkCFAKDwpMKZu9N1x
	TGGUzYgi+d7qGsk42TdLee+ErAgzS97KFK0qsJZJojybdfIFHA7aMfyaR06RwTjusXG5Kaee22jna
	8hbZK0JELnooY3F4uwdbXpNFHS86Hivbc+rCEp11wHK3PXTFfgWhqHNxGowTbikGiAtNs/1Oq0Ymc
	KOIhtzk695wFw89rx4Ueox8E7d7f2ijsXNnGjV0dMgxJv1LsZaiEC79i/8rk2oLSmrkvbCciNOrce
	9IeUXmTDk+e4AAuL8ramo3Zyk6XsAEjf/Et02T/BB/Np6GszKUguYC3Z7j6M3aw9pSB37xgMpSFFH
	HVYxmGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkq-0000000A9Un-2Ynv;
	Wed, 11 Jun 2025 14:48:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHnK-00000009Tmr-3GXU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AF6F4414A;
	Wed, 11 Jun 2025 09:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C82C4CEEE;
	Wed, 11 Jun 2025 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749634254;
	bh=cOgg6lgUEFyEcbnuu0dGxi33Q451rEg1KMhORQ9NOrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8EXLgY0os1ciSmYdYccnRrocKIZhcauR/+N6/zk9jHx6M4ktKWEupjt5VVLnCHms
	 qoMAdEgjR2Nu8aFQoAZfPqukuivAWisRUOekKy8v10lubTD62JRMZtyomIPuQsqBER
	 xRw952Jcs7n6/HL9/6x1ID/mQrieAHaaOZEpGXpFHGttdnUlkhphm9Jq04ZIhVN93X
	 uSflwDAXO/Fhs2OBGOBIY0bbNp4tLA53UGj/Sn0hyCdtqWWvQefYpdAe5Eu5nDuWe8
	 JkTl5DmPKGDOUX36hVOWOeZq7qiMlEwKO2aTdFI5noS40x6Gx2o7hNw69Gb86qSNLR
	 JPO8pfPD067iA==
Date: Wed, 11 Jun 2025 10:30:49 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v2] arm64: Enable vmalloc-huge with ptdump
Message-ID: <20250611093048.GA10885@willie-the-truck>
References: <20250610160048.11254-1-dev.jain@arm.com>
 <e10d0c8f-c86b-4e26-8006-f38734993796@arm.com>
 <1cf5e639-dcf8-492b-9164-493ee45cc0ac@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cf5e639-dcf8-492b-9164-493ee45cc0ac@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_023054_834759_7A08DCA8 
X-CRM114-Status: GOOD (  25.89  )
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

On Wed, Jun 11, 2025 at 08:32:51AM +0530, Dev Jain wrote:
> 
> On 11/06/25 12:30 am, Ryan Roberts wrote:
> > On 10/06/2025 17:00, Dev Jain wrote:
> > > arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> > > because an intermediate table may be removed, potentially causing the
> > > ptdump code to dereference an invalid address. We want to be able to
> > > analyze block vs page mappings for kernel mappings with ptdump, so to
> > > enable vmalloc-huge with ptdump, synchronize between page table removal in
> > > pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> > > use mmap_read_lock and not write lock because we don't need to synchronize
> > > between two different vm_structs; two vmalloc objects running this same
> > > code path will point to different page tables, hence there is no race.
> > > 
> > > For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> > > 512 times again via pmd_free_pte_page(). Note that there is no need to
> > > move __flush_tlb_kernel_pgtable() to immediately after pud_clear(); the
> > > only argument against this would be that we immediately require a
> > > dsb(ishst) (present in __flush_tlb_kernel_pgtable()) after pud_clear(),
> > > but that is not the case, since the transition is from
> > > valid -> invalid, not vice-versa.
> > > 
> > > No issues were observed with mm-selftests. No issues were observed while
> > > parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> > > sysfs in a loop.
> > > 
> > > v1->v2:
> > >   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> > I thought we agreed that we would use a static key and some rcu synchronize
> > magic? What was the reason for taking this approach?
> 
> As I understand it, the RCU magic won't work, I had replied here:
> https://lore.kernel.org/all/6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com/

Regardless, it's still not acceptable to penalise the common code because
of a debug option so I'm not going to merge this as-is.

Lemme go reply on the other thread.

Will

