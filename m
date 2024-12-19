Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EBEE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrtyvNSCQjkLqr8VNmV3rKdBtoV3zwe8M9+ALqikDdk=; b=cMEkixtfF0LGuIgEwi9QYj2krC
	H5FqKPc7oYKL5Pc8oYLuQ6BpLzY1T76DZnJ6/l0//xpam7LN2I/vsayV3uoTYUFuj/XxQ775akVDS
	gNBbk8o62KTSSHX7LRS4Md7Hu9NFVeaCSO9Gt30Cn8WyhmAoVXa//RVkEDw2jJoydTbqtYr1Qh9tw
	DTrn+ipQz/gpCF7UyjmBg4fP8fqO483it86gWilsAulLHpUc6f3uS+d3fM7j9RMVH0xhWWKT+MC8w
	WyUNspeLXkk4S9v0nRfer0MsqaXZ19txukGhgPhJUY1YlfrFU4r4iBZ0bTeufOIrSmT0oud8pdRNf
	fZM/TeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJMS-00000002Lj7-02V0;
	Thu, 19 Dec 2024 16:26:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJLK-00000002LQr-2Twz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 061705C56E8;
	Thu, 19 Dec 2024 16:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6849EC4CECE;
	Thu, 19 Dec 2024 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734625541;
	bh=nXz2uSjZrSWNgu8SPCsO1bxfNxJF4UNu8itinwXzN7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyThoSvze/DgZ+fZudEMvO4Z5habXpyhA5iPcasP+6VcO5ZAz8GGmNxoPNQ/A+qL6
	 Ozvd+TBBB6gbu2ZBISf3yOJUpVNh9VhPu1G4+ev2kxNgcY8L2y6XkHgBCEdbZbYBk+
	 jRtnKuJnH8P+hHhmbofx7qIkXuF3eljMU+XMTiZy56/Z5SoMX7UYSCRLk0DysxPxKz
	 NCBggaSl5ZG12yNvP+Nean8m+TMpBIb+ZG98yDXh7SLeNzdKxf4cDXEmXBDolhx7ms
	 b9ORFF1BIqEFvBx8cgYIOG7nrN/spjJWDY8AON3U4tPUKdPbGLJ/d4xfZsdZwnKYVA
	 iSDzacxnK6xgw==
Date: Thu, 19 Dec 2024 16:25:35 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	catalin.marinas@arm.com, corbet@lwn.net, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	liunx-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20241219162535.GD24724@willie-the-truck>
References: <20241211154611.40395-1-miko.lenczewski@arm.com>
 <20241211154611.40395-3-miko.lenczewski@arm.com>
 <20241211210243.GA17155@willie-the-truck>
 <20241213161726.GA30314@mazurka.cambridge.arm.com>
 <21e72a5d-d488-4011-9abc-9f717e1c6643@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21e72a5d-d488-4011-9abc-9f717e1c6643@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_082542_726897_737FFA82 
X-CRM114-Status: GOOD (  35.62  )
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

On Fri, Dec 13, 2024 at 02:34:57PM -0800, Yang Shi wrote:
> On 12/13/24 8:17 AM, Mikołaj Lenczewski wrote:
> > > > +static int do_conflict_abort(unsigned long far, unsigned long esr,
> > > > +			     struct pt_regs *regs)
> > > > +{
> > > > +	if (!system_supports_bbml2())
> > > > +		return do_bad(far, esr, regs);
> > > > +
> > > > +	/* if we receive a TLB conflict abort, we know that there are multiple
> > > > +	 * TLB entries that translate the same address range. the minimum set
> > > > +	 * of invalidations to clear these entries is implementation defined.
> > > > +	 * the maximum set is defined as either tlbi(vmalls12e1) or tlbi(alle1).
> > > > +	 *
> > > > +	 * if el2 is enabled and stage 2 translation enabled, this may be
> > > > +	 * raised as a stage 2 abort. if el2 is enabled but stage 2 translation
> > > > +	 * disabled, or if el2 is disabled, it will be raised as a stage 1
> > > > +	 * abort.
> > > > +	 *
> > > > +	 * local_flush_tlb_all() does a tlbi(vmalle1), which is enough to
> > > > +	 * handle a stage 1 abort.
> > > > +	 */
> > > > +
> > > > +	local_flush_tlb_all();
> > > > +
> > > > +	return 0;
> > > > +}
> > > Can we actually guarantee that we make it this far without taking another
> > > abort? Given that I'm yet to see one of these things in the wild, I'm
> > > fairly opposed to pretending that we can handle them. We'd be much better
> > > off only violating BBM on CPUs that are known to handle the conflict
> > > gracefully. Judging by your later patch, this is practically keyed off
> > > the MIDR _anyway_...
> > > 
> > > Will
> 
> Hi Mikołaj,
> 
> > Thanks for reviewing. Apologies for the delay in responding, and for
> > spam (replied instead of group-replied).
> > 
> > There should not be an option to take another fault while performing the
> > handler, as long as the mappings covering the fault handler table or any
> > code in this path are not screwed with. This is discussed further in the
> > resent patch series [1].
> 
> Will lead me to this thread when we discussed about my series
> (https://lore.kernel.org/lkml/20241211223034.GA17836@willie-the-truck/#t).
> My series tried to use large mapping for kernel linear mapping when
> rodata=full. The common part of the both series is BBM lv2 support. My
> series depends on BBM lv2 to change page table block size when changing
> permission for kernel linear mapping.
> 
> Handling TLB conflict should be ok for your usecase since the conflict
> should just happen in user address space. But it may be not fine for my
> usecase. At least the TLB conflict handler needs to depend on
> CONFIG_VMAP_STACK otherwise the kernel stack pointer points to kernel linear
> address space. I'm not quite sure whether there is any other corner case
> which can trigger recursive abort in the path or not, maybe bad stack
> handler? So Will suggested MIDR based lookup. IIUC, he suggested just enable
> BBM lv2 support on the CPUs which can handle TLB conflict gracefully. This
> should make our lives easier. But the downside is maybe fewer CPUs can
> actually advertise BBM lv2 support.

Since most of them seem to be broken anyway, I still think this (having
an allowlist and not handling the conflict abort in the kernel) is the
right approach.

Will

