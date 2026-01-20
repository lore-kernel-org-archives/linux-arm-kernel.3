Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016AED2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUQKreo5qnKQZtG0JdOQZXpE+wY1UWud7H7ntmLdYdw=; b=CP+HA+z4Icag28ZkCny+ME3Vwm
	1+qCqvvcmFTr1/pcsnzHaEM07orq5ELSYlG6PrERZUrMCjEX01kuw8AH2CQ80kn2ANXZuzYTC5zjS
	5ju1ljIeJrjaF4ve1S7diY1wnKJJvSN+UStZUjdriJWbON0MNf91ERw+DIrxC3TmCULb4Wd4s5VO9
	DjNb8AaFX6hbRIvWM4JMtD4cJ7pK/8R9mElaZJ+7qbRHhkiVFNRCQlJ2BkAk8leGixITXLONbLUiK
	DgZgp/Hpk4gIM0vMLsvitiwgugMxCbA+uX4yVx+JpWb/c4B5bJxRmWx3Jt4JVoGdwd0ksjnzqSjlW
	uyjyyjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAAD-00000003kIg-0ZyL;
	Tue, 20 Jan 2026 11:44:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAAA-00000003kH9-1jEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B31AE40A01;
	Tue, 20 Jan 2026 11:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FCBC16AAE;
	Tue, 20 Jan 2026 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768909485;
	bh=ga7aPYBv6vEC6RDrqtoIEfix9L+QcEdkN3Y8HkPOkcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkWJRgPu/hDvAODxQrnmwrwXOrJbzhZZxMuR/yCH3LeFB1QxK6Ha7I2h5gX6AwOs7
	 MBxEkhNAkA9yhOuXfLa19twaYItLLp95LIl5/AdD5eOmzGEzjEc2gAEChKWwWMDXmo
	 p+xpPsDOfCkeqcel6c63KpBx/8pIf/7WrPfw/7hqgRPNc4E8u1fTOXvfJGWtKgHHnn
	 T2vMcCXqILpEXcjonpn8Z/NKjgQ3dUMTIGo8p/TV0qGHVLT6ty3arWv9biC/diIu9o
	 M2oWujiT3qterri1I6f6RGMIGwVSDBcTFTluQNvK2gurhgJs+77FF/Mgw7pczNCfOV
	 sOYi48iM8/xAQ==
Date: Tue, 20 Jan 2026 11:44:38 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, catalin.marinas@arm.com,
	ryan.roberts@arm.com, akpm@linux-oundation.org, david@kernel.org,
	kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
	vbabka@suse.cz, mhocko@suse.com
Subject: Re: [PATCH v5 3/3] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
Message-ID: <aW9qpjyAcFXJNGo4@willie-the-truck>
References: <20260105202328.2418990-1-yeoreum.yun@arm.com>
 <20260105202328.2418990-4-yeoreum.yun@arm.com>
 <aW5qfh_bsGNRd0Vd@willie-the-truck>
 <aW6idotkGVoD692c@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW6idotkGVoD692c@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034446_488991_6BE63FF7 
X-CRM114-Status: GOOD (  29.61  )
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

On Mon, Jan 19, 2026 at 09:30:30PM +0000, Yeoreum Yun wrote:
> Hi Will,
> 
> > On Mon, Jan 05, 2026 at 08:23:28PM +0000, Yeoreum Yun wrote:
> > > The current __kpti_install_ng_mappings() allocates a temporary PGD
> > > while installing the NG mapping for KPTI under stop_machine(),
> > > using GFP_ATOMIC.
> > >
> > > This is fine in the non-PREEMPT_RT case. However, it becomes a problem
> > > under PREEMPT_RT because generic memory allocation/free APIs
> > > (e.g., pgtable_alloc(), __get_free_pages(), etc.) cannot be invoked
> > > in a non-preemptible context, except for the *_nolock() variants.
> > > These generic allocators may sleep due to their use of spin_lock().
> > >
> > > In other words, calling __get_free_pages(), even with GFP_ATOMIC,
> > > is not allowed in __kpti_install_ng_mappings(), which is executed by
> > > the stopper thread where preemption is disabled under PREEMPT_RT.
> > >
> > > To address this, preallocate the page needed for the temporary PGD
> > > before invoking __kpti_install_ng_mappings() via stop_machine().
> > >
> > > Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enabled")
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> > > ---
> > >  arch/arm64/mm/mmu.c | 21 ++++++++++++---------
> > >  1 file changed, 12 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > index 120874a2d35b..6ea5b80ab54f 100644
> > > --- a/arch/arm64/mm/mmu.c
> > > +++ b/arch/arm64/mm/mmu.c
> > > @@ -1360,7 +1360,7 @@ static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
> > >  	return kpti_ng_temp_alloc;
> > >  }
> > >
> > > -static int __init __kpti_install_ng_mappings(void *__unused)
> > > +static int __init __kpti_install_ng_mappings(void *data)
> > >  {
> > >  	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
> > >  	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
> > > @@ -1368,10 +1368,9 @@ static int __init __kpti_install_ng_mappings(void *__unused)
> > >
> > >  	int cpu = smp_processor_id();
> > >  	int levels = CONFIG_PGTABLE_LEVELS;
> > > -	int order = order_base_2(levels);
> > >  	u64 kpti_ng_temp_pgd_pa = 0;
> > >  	pgd_t *kpti_ng_temp_pgd;
> > > -	u64 alloc = 0;
> > > +	u64 alloc = *(u64 *)data;
> > >
> > >  	if (levels == 5 && !pgtable_l5_enabled())
> > >  		levels = 4;
> > > @@ -1382,8 +1381,6 @@ static int __init __kpti_install_ng_mappings(void *__unused)
> > >
> > >  	if (!cpu) {
> > >  		int ret;
> > > -
> > > -		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
> > >  		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
> > >  		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
> > >
> > > @@ -1414,16 +1411,16 @@ static int __init __kpti_install_ng_mappings(void *__unused)
> > >  	remap_fn(cpu, num_online_cpus(), kpti_ng_temp_pgd_pa, KPTI_NG_TEMP_VA);
> > >  	cpu_uninstall_idmap();
> > >
> > > -	if (!cpu) {
> > > -		free_pages(alloc, order);
> > > +	if (!cpu)
> > >  		arm64_use_ng_mappings = true;
> > > -	}
> > >
> > >  	return 0;
> > >  }
> > >
> > >  void __init kpti_install_ng_mappings(void)
> > >  {
> > > +	int order = order_base_2(CONFIG_PGTABLE_LEVELS);
> > > +	u64 alloc;
> > >  	/* Check whether KPTI is going to be used */
> > >  	if (!arm64_kernel_unmapped_at_el0())
> > >  		return;
> > > @@ -1436,8 +1433,14 @@ void __init kpti_install_ng_mappings(void)
> > >  	if (arm64_use_ng_mappings)
> > >  		return;
> > >
> > > +	alloc = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > > +	if (!alloc)
> > > +		panic("Failed to alloc page tables\n");
> >
> > Why are you adding this panic?
> 
> Because original code call the panic() when it fails to create
> mapping of kpti_ng_temp_pgd and I think allocation is also part
> of creating kpti_ng_temp_pgd too.
> So, I added this panic() when allocation is failed for kpti_ng_temp_pgd.

No. The current code seems to assume the allocation will succeed and
panic()s if the call to __create_pgd_mapping_locked() returns an error.

Just make this:

	if (WARN_ON(!alloc))
		return;

Will

