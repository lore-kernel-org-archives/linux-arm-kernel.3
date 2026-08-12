Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694D1C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXOOKWoV7MEnR9+bM1yW21aczulQD8XP9QPvyBJVi5Q=; b=BLkvjsBx3uomuis8Gt5/dTs/v5
	fdk7Mn8CeS1ZNgLBOsws7LWq/wsNEo7MwMaWdqD/V8MkvCA1vyTkWgn9gSZYoqixdAUn7Y/VAvQ/M
	Oky/XOC8PZNPC03XH3tbimJw6+p7hcmMqr85eb9BsDEHpbJKdC8kjcrGHZillZj+NWmFCGbCRnRA0
	qoKjvT+ZR3wFHIMKbg65g3X5H46ucR8b+0WFgBtExtEc9AEr6o1cfu9GhCDhATIDloVmfMWlVTX11
	VahkrurNpBQusz/Mq22EDC0outfSPIKIuTwmeut0HLJTk8moMT9tAY8cR4kf/MA6WX5qdkvfHbeFZ
	WkaP7QOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Mp-0000000GKRB-0XVZ;
	Wed, 12 Aug 2026 13:51:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Mm-0000000GKQj-17vi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95556153B;
	Wed, 12 Aug 2026 06:51:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B3253F66F;
	Wed, 12 Aug 2026 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786542695; bh=7nCoc+Gd4dBqkVM3L9DgfcWFTtT0Go8fgXf2EaF6ryw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdhIzOxU4DrVBTfWu9sQVemCRyfbINm+gJGsobbhcHm6RT2xmNZhB26+0R9dosOlZ
	 xJoZ5cz12TtS+PoAC7Z6fjscj7CPeR3vEFkFy0T4SY9x7smJreqT9+FtH5Fyd4YiTR
	 1YAp2YSqYL4igzdFr1iNMh6k+hMv25AjPvBXLAdU=
Date: Wed, 12 Aug 2026 14:51:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <anx6YbPMVz3OlpA5@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
 <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_065136_388703_ACBAF56D 
X-CRM114-Status: GOOD (  36.12  )
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

On Wed, Aug 12, 2026 at 06:12:09PM +0530, Pavan Kondeti wrote:
> On Tue, Aug 11, 2026 at 04:11:13PM +0100, Suzuki K Poulose wrote:
> > On 11/08/2026 15:44, Catalin Marinas wrote:
> > > On Mon, Aug 03, 2026 at 02:43:23PM +0100, Steven Price wrote:
> > > > If the host attempts to access granules that have been delegated for use
> > > > in a realm these accesses will be caught and will trigger a Granule
> > > > Protection Fault (GPF).
> > > > 
> > > > A fault during a page walk signals a bug in the kernel and is handled by
> > > > oopsing the kernel. A non-page walk fault could be caused by user space
> > > > having access to a page which has been delegated to the kernel and will
> > > > trigger a SIGBUS to allow debugging why user space is trying to access a
> > > > delegated page.
> > > > 
> > > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > > ---
> > > > Changes since v10:
> > > >   * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > > > Changes since v2:
> > > >   * Include missing "Granule Protection Fault at level -1"
> > > > ---
> > > >   arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
> > > >   1 file changed, 22 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > > index 85e23388f9bb..ea3ae0ca7dba 100644
> > > > --- a/arch/arm64/mm/fault.c
> > > > +++ b/arch/arm64/mm/fault.c
> > > > @@ -909,6 +909,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
> > > >   	return 0;
> > > >   }
> > > > +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > > +{
> > > > +	const struct fault_info *inf = esr_to_fault_info(esr);
> > > > +
> > > > +	die_kernel_fault(inf->name, far, esr, regs);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > > +{
> > > > +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
> > > > +		return 0;
> > > > +
> > > > +	return 1;
> > > > +}
> > > 
> > > Is there a valid case for fixup_exception() here? IOW, do we ever have a
> > > valid user mapping of the pages delegated to a guest? If the above is
> > > considered a kernel bug, I'd not silently ignore this (like return less
> > > bytes copied or -EFAULT to user) but rather warn, potentially
> > > rate-limited.
> > 
> > Good question. This shouldn't be a valid case. We expect the VMM to use
> > guest_memfd and that should prevent any mmaps and thus fixups shouldn't
> > be required. That said, this series doesn't enforce that the VMM uses
> > GMEM backed memslots for Guest RAM. We should probably do that while
> > mapping things in.
> > 
> > With that, we could drop that fixup and scream a bit.
> 
> There is a valid case for fixup_exception() to be needed here in GPF
> handling.
> 
> -000 |load_unaligned_zeropad(inline)
> -000 |hash_name(inline)
> -000 |link_path_walk()
> -001 |path_lookupat()
> -002 |filename_lookup()
> -003 |vfs_statx()
> -004 |vfs_fstatat()
> 
> We observed this in Android running Gunyah when the page is mapped in
> EL1 but unmapped at EL2. path_lookupat() can actually handle this
> via fixup_exeption() when a word load crosses the page boundary.
> However, Gunyah injects a Synchronous External Abort and we have
> a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
> injects [2] such faults back to EL1 and fixup_exception() is taken care.

Ah, good point, completely forgot about load_unaligned_zeropad(). Since
we don't unmap the linear map for delegated pages, we'll need the
fixup_exception(). And I guess warning in this case is not desirable
either. We could limit it to EX_TYPE_KACCESS_ERR_ZERO and
EX_TYPE_LOAD_UNALIGNED_ZEROPAD, though not sure it's worth it.

-- 
Catalin

