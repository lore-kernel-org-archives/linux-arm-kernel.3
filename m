Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE11AC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOTyaBK2KKJpatsunAGspQ5hLNvxaFeB75t6zJtPUos=; b=A5um8Lrm397u6mssZr6m/9BM2z
	YohLLEkmXP85J5/O+Xo+lYjMQcC9NfOwHrDdZ3/3G8IO+pjG59VYfigLoPryttvrlOvKZ/pRNhy+X
	IUZKsVrD1myG3DeGddoTyzV+hF1u/KX10u6sOWOdgh2mKIVsrKqECLJc95dgwC8E8rd/HYnes7LKr
	cPkybqIup/7C3wBfpo/YgkxYWfF4KHyV82uHyNLHAeEf0/jHGkiWFuAWUQpXTpT008tYjgLQkgsHm
	+Ah+kDsh5DyYJmbSIMuz7tlFcBn6/MR2aUaKpomaLN1JZCt9DoKqVzAg08lknjBRf+DVay0KhZ6S9
	GUH1pyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hz0-0000000BkUU-2dYF;
	Wed, 09 Sep 2026 13:04:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hyz-0000000BkUE-0YAa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:04:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69AB560211;
	Wed,  9 Sep 2026 13:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541401F00A3A;
	Wed,  9 Sep 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788959096;
	bh=KOTyaBK2KKJpatsunAGspQ5hLNvxaFeB75t6zJtPUos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBrCSlZdpNET5vXckVufbjagiAVg4XHBw76w1UoGlyTZ29Y7yam5UTgUTzNxwhjAH
	 9p3AzZ3X1F+eXdaS3Ie06eqlOXHML+7woAtl9ENsEl7JvQPVVrJacYKKoyLl4IC4Jt
	 av50Q9DsSei9LmDbgT8sFoaLHjkXBQ6NVaq9ypZZqta8djSfRj5TbwkNJYROpG5+8q
	 q9InoiPSbbgAskhF0PxHsXgP1sNOfZnIJpy/U/odGh0crr3nhSI93KrAnuUeI4O1mB
	 Xix49eTvas35TVxa2uFaBg3fKGALP53lnM4FgyrR3rk420ddJsVqafw3DK0KkbKmBJ
	 lJElcrDMUp4xg==
Date: Wed, 9 Sep 2026 14:04:50 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zeng Heng <zengheng@huaweicloud.com>, suzuki.poulose@arm.com,
	anshuman.khandual@arm.com, gshan@redhat.com, david@kernel.org,
	wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Message-ID: <aqFZco-0kpQIIxZQ@willie-the-truck>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
 <aqFWAWNzYagW2NNH@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFWAWNzYagW2NNH@arm.com>
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

On Wed, Sep 09, 2026 at 01:50:09PM +0100, Catalin Marinas wrote:
> On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
> > From: Zeng Heng <zengheng4@huawei.com>
> > 
> > Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> > that process's /proc/<pid>/cmdline triggers a spurious WARN in
> > ioremap_prot() through generic_access_phys():
> > 
> >   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
> >   Call trace:
> >     generic_access_phys+0x1c8/0x228 (P)
> >     __access_remote_vm+0x2b4/0x398
> >     access_remote_vm+0x14/0x30
> >     get_mm_cmdline+0xf8/0x2a0
> >     proc_pid_cmdline_read+0x68/0x120
> > 
> > generic_access_phys() passes the full pgprot derived from the user PTE
> > to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> > which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> > On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> > reports the pfn and generic_access_phys() reaches ioremap_prot().
> > The PTE_USER assertion, which is meant to catch kernel prots being
> > passed by mistake, then fires for a PROT_NONE user mapping
> > that legitimately lacks PTE_USER, producing the spurious WARN.
> > 
> > Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> > front so that generic_access_phys() cleanly fails the access instead
> > of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> > is only meaningful when PTE_VALID is clear, so both bits must be
> > checked together.
> > 
> > Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> > Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > ---
> >  arch/arm64/include/asm/io.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> > index 21c8e400107c..bbfbc4682639 100644
> > --- a/arch/arm64/include/asm/io.h
> > +++ b/arch/arm64/include/asm/io.h
> > @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
> >  	pgprot_t prot;
> >  	ptval_t user_prot_val = pgprot_val(user_prot);
> >  
> > +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> > +	     PTE_PRESENT_INVALID)
> > +		return NULL;
> > +
> >  	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
> >  		return NULL;
> 
> I wonder whether we should just drop the warning and return NULL if
> !PTE_USER && PTE_UXN. The latter check would also catch execute-only
> mappings (Sashiko pointed out this case still trips the warning). The
> PROT_NONE case would be covered automatically as well since PTE_USER is
> cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
> relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
> issue by chance.

Hmm, do we want exec-only mappings to be readable via /dev/mem?

Will

