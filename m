Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD29C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YzNA3/scbwIBR4finIHpKfCJYnST6BJaG5EXmlWXE0=; b=M4jPMQGzsbeHS4wDZujQYwyqd3
	FedEHZOVeXd8ZpMAPQSj59zEag9hFMfUEGOhMv0SSGCJQLr4AZH0ffz47z0ZKXXVVRVa47kRhGnoM
	CtqDgkmyjmlzWMKsZl7w6MKIXo9+btFipXLYk/5NpgkdAwgXUgOUi6ZjTq5GceBRvlXUHd21UpHUN
	i3GpA33k35EVh2R0PT818v7IURADibpGqRz7BfET3sMIzyMR/FyQYDC4u/9sb/5eJp2WkWUulLLY2
	lbeNlKQ3byeh6NKGz7dN2dCkX5IVlyVHIIdjz+/Ootz6/4arglF3KUf1DfAlwnLk4hM2cvQtNPr7y
	PWV2953g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Llp-0000000CQtK-3704;
	Wed, 09 Sep 2026 17:07:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lln-0000000CQsm-2V2e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:07:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087641576;
	Wed,  9 Sep 2026 10:07:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C9DA3F528;
	Wed,  9 Sep 2026 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788973654; bh=c5qeh6n3w5VJERpQI1n41LBdMbnNmSq8tLkrJN3GLsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK7WulIXo7NKVRgtVb1RIRU4JI6/mubVOwVGJ48NfRDvLNGn5B4yqtlFRA/DJMeKs
	 H5vedQe+8dSrVst59OnoEPyUNRdUflfKDlLaOIstPkqGRmpTPC5roZ6LUYSKBinUg+
	 SoQtpqo2FYB8i14RBY6IWy4heJ9pBty8m/ebv1NA=
Date: Wed, 9 Sep 2026 18:07:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Zeng Heng <zengheng@huaweicloud.com>, suzuki.poulose@arm.com,
	anshuman.khandual@arm.com, gshan@redhat.com, david@kernel.org,
	wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Message-ID: <aqGSUg488DHcQp9N@arm.com>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
 <aqFWAWNzYagW2NNH@arm.com>
 <aqFZco-0kpQIIxZQ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFZco-0kpQIIxZQ@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_100735_714728_2B1EBB83 
X-CRM114-Status: GOOD (  33.39  )
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

On Wed, Sep 09, 2026 at 02:04:50PM +0100, Will Deacon wrote:
> On Wed, Sep 09, 2026 at 01:50:09PM +0100, Catalin Marinas wrote:
> > On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
> > > From: Zeng Heng <zengheng4@huawei.com>
> > > 
> > > Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> > > that process's /proc/<pid>/cmdline triggers a spurious WARN in
> > > ioremap_prot() through generic_access_phys():
> > > 
> > >   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
> > >   Call trace:
> > >     generic_access_phys+0x1c8/0x228 (P)
> > >     __access_remote_vm+0x2b4/0x398
> > >     access_remote_vm+0x14/0x30
> > >     get_mm_cmdline+0xf8/0x2a0
> > >     proc_pid_cmdline_read+0x68/0x120
> > > 
> > > generic_access_phys() passes the full pgprot derived from the user PTE
> > > to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> > > which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> > > On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> > > reports the pfn and generic_access_phys() reaches ioremap_prot().
> > > The PTE_USER assertion, which is meant to catch kernel prots being
> > > passed by mistake, then fires for a PROT_NONE user mapping
> > > that legitimately lacks PTE_USER, producing the spurious WARN.
> > > 
> > > Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> > > front so that generic_access_phys() cleanly fails the access instead
> > > of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> > > is only meaningful when PTE_VALID is clear, so both bits must be
> > > checked together.
> > > 
> > > Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> > > Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > > ---
> > >  arch/arm64/include/asm/io.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> > > index 21c8e400107c..bbfbc4682639 100644
> > > --- a/arch/arm64/include/asm/io.h
> > > +++ b/arch/arm64/include/asm/io.h
> > > @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
> > >  	pgprot_t prot;
> > >  	ptval_t user_prot_val = pgprot_val(user_prot);
> > >  
> > > +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> > > +	     PTE_PRESENT_INVALID)
> > > +		return NULL;
> > > +
> > >  	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
> > >  		return NULL;
> > 
> > I wonder whether we should just drop the warning and return NULL if
> > !PTE_USER && PTE_UXN. The latter check would also catch execute-only
> > mappings (Sashiko pointed out this case still trips the warning). The
> > PROT_NONE case would be covered automatically as well since PTE_USER is
> > cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
> > relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
> > issue by chance.
> 
> Hmm, do we want exec-only mappings to be readable via /dev/mem?

Ah, yes, got confused on how it reaches this path. It doesn't make sense
to allow exec-only to be readable. Also if we mmap(PROT_EXEC) /dev/mem,
PTE_UXN ends up set anyway via pgprot_noncached(). But it does have
PTE_VALID, so the above won't catch it.

Checking !PTE_USER should be sufficient here and return NULL. For the
warning, I think we can check PTE_NG first but it only works without
kpti.

-- 
Catalin

