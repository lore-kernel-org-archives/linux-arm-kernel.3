Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD97DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppl3k/1XV3MuY0Kll6UzkekILtMNImeydz43pL3vtTg=; b=1MYO4Ry8urj7OQ0Y9uJNVvfC8u
	f08xuGvCi4Uf3ZBZIf1NxJF5h8ajdub/3W7R0YsTWfC8EJ/YyoylqEWkazM5umMavSnIIqUreCDHu
	ZXwXzLZuFvtGUEdPL54pyux/sUxUY2HyTJ7h9RbmGl+zBCRBJobm/voPV58JadLEdRcoxswlbu7kj
	8ioNMxpBesNa0U7zuGUu9Dzfq2UqyIIk/IJ78zHcLkPgHlyGiBUo83rzoPwdJN37S3WU6xR79khWH
	OJGffZ6fiWwZp19WFxG5GjrfK2PLT138raTrbaaW4z7viqyWZGiKJuj/ZaHq1rEttujhwOaMXAfXk
	7YrnekEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNLr-0000000EZu1-2dzZ;
	Thu, 16 Jan 2025 10:43:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNKT-0000000EZOz-1j2U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 10:42:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6358C11FB;
	Thu, 16 Jan 2025 02:42:53 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EFCF3F77D;
	Thu, 16 Jan 2025 02:42:23 -0800 (PST)
Date: Thu, 16 Jan 2025 10:42:21 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
	catalin.marinas@arm.com, mark.rutland@arm.com, james.morse@arm.com,
	will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v1] arm64: Add TLB Conflict Abort Exception handler to KVM
Message-ID: <20250116104221.GB17031@mazurka.cambridge.arm.com>
References: <20250110172411.39845-3-miko.lenczewski@arm.com>
 <865xmgw1n1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <865xmgw1n1.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_024225_492416_85B0DD40 
X-CRM114-Status: GOOD (  29.93  )
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

On Wed, Jan 15, 2025 at 03:13:54PM +0000, Marc Zyngier wrote:
> On Fri, 10 Jan 2025 17:24:07 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
> > 
> > Currently, KVM does not handle the case of a stage 2 TLB conflict abort
> > exception. This can legitimately occurs when the guest is eliding full
> > BBM semantics as permitted by BBM level 2. In this case it is possible
> > for a confclit abort to be delivered to EL2. We handle that by
> > invalidating the full TLB.
> > 
> > The Arm ARM specifies that the worst-case invalidation is either a
> > `tlbi vmalls12e1` or a `tlbi alle1` (as per DDI0487K section D8.16.3).
> > We implement `tlbi alle1` by extending the existing
> > __kvm_flush_vm_context() helper to allow for differentiating between
> > inner-shareable and cpu-local invalidations.
> > 
> > This commit applies on top of v6.13-rc2 (fac04efc5c79).
> > 
> > Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> > ---
> >  arch/arm64/include/asm/esr.h       |  8 ++++++++
> >  arch/arm64/include/asm/kvm_asm.h   |  2 +-
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c |  2 +-
> >  arch/arm64/kvm/hyp/nvhe/tlb.c      |  9 +++++++--
> >  arch/arm64/kvm/hyp/vhe/tlb.c       |  9 +++++++--
> >  arch/arm64/kvm/mmu.c               | 13 +++++++++++++
> >  arch/arm64/kvm/vmid.c              |  2 +-
> >  7 files changed, 38 insertions(+), 7 deletions(-)
> >
> 
> [...]
> 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index c9d46ad57e52..7c0d97449d23 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1756,6 +1756,19 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >  	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
> >  	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
> >  
> > +	if (esr_fsc_is_tlb_conflict_abort(esr)) {
> > +
> > +		/* Architecturely, at this stage 2 tlb conflict abort, we must
> > +		 * either perform a `tlbi vmalls12e1`, or a `tlbi alle1`. Due
> > +		 * to nesting of VMs, we would have to iterate all flattened
> > +		 * VMIDs to clean out a single guest, so we perform a `tlbi alle1`
> > +		 * instead to save time.
> > +		 */
> > +		__kvm_flush_vm_context(true);
> > +
> > +		return 1;
> > +	}
> > +
> 
> This is broken. At this stage, you are preemptible, so whatever
> invalidation you are performing might be happening on the wrong CPU
> (and I really don't want to see a broadcast invalidation).
> 
> I really don't see why this can't be handled as a fixup in the inner
> run loop, which would save *a lot* of cycles and do the right thing.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Aplogies for my very late reply. Thank you for tatking the time to
review my patch. Will work on this.

-- 
Kind regards,
Mikołaj Lenczewski

