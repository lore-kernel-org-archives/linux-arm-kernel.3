Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB44C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zHa5RDJ7BFPeEG5s9a0NaxFKa9A3kGBHIDCocirrLQ=; b=JPRFIA4n/2nJnprfAFxY7lMiM/
	1pitakzEEmC7MnNkzj5UqQdBaOAD4BEvucMWurmCGxiDvNouXJGRPSkIXQeasZMxBtuMggwex1NrE
	uYBUw3yh912xL1C7vP0Ro9nCqsxEN8O/UkJTQxfzLdjyOP1BtMvSGAc+rQKhHnRekpIEjBOZlVI9p
	wQiMb8v4psqjTANJXU9EsM2Uzs7phLDVV8VgXUZXKuRaSFU7VRXUhidUTNIIqV949uPtEEmQriFyd
	6ptFjp97YLzM/yusA73o5/2AwdC744XPgZqBPzaKChlVQgNwVigtbb07gq47XrCSJIPa+Xk17/9Dh
	p/DbpZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNKd-0000000EZRm-026A;
	Thu, 16 Jan 2025 10:42:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNJK-0000000EYxc-3dW4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 10:41:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C98111FB;
	Thu, 16 Jan 2025 02:41:40 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 275473F77D;
	Thu, 16 Jan 2025 02:41:10 -0800 (PST)
Date: Thu, 16 Jan 2025 10:41:07 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
	catalin.marinas@arm.com, mark.rutland@arm.com, james.morse@arm.com,
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v1] arm64: Add TLB Conflict Abort Exception handler to KVM
Message-ID: <20250116104107.GA17031@mazurka.cambridge.arm.com>
References: <20250110172411.39845-3-miko.lenczewski@arm.com>
 <Z4Fr1HkKCm9AXSIA@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4Fr1HkKCm9AXSIA@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_024114_947341_314CFA7D 
X-CRM114-Status: GOOD (  25.04  )
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

On Fri, Jan 10, 2025 at 10:49:56AM -0800, Oliver Upton wrote:
> On Fri, Jan 10, 2025 at 05:24:07PM +0000, Mikołaj Lenczewski wrote:
> > Currently, KVM does not handle the case of a stage 2 TLB conflict abort
> > exception. This can legitimately occurs when the guest is eliding full
> > BBM semantics as permitted by BBM level 2. In this case it is possible
> > for a confclit abort to be delivered to EL2. We handle that by
> > invalidating the full TLB.
> 
> typo: conflict
> 
> Also, a bit of a nitpick, but mentioning that TLB conflict abort routing
> is implementation defined when S2 is enabled is valuable information.
> 
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
> 
> I'm not sure I follow this.
> 
> At this point we've taken a TLB conflict abort out of a specific
> hardware MMU context, and it's unclear to me why a conflict abort in one
> stage-2 MMU has any bearing on the other stage-2 MMUs that could be
> associated with this guest.
> 
> Even in NV, KVM is always responsible for the maintenance of hardware
> stage-2 MMUs. So stage-2 TLBI elision in the guest hypervisor should
> not lead to a stage-2 TLB conflict abort.
> 
> TLBI ALLE1 is a larger hammer than what's actually necessary here. Could
> you perhaps introduce a new invalidation routine,
> __kvm_tlb_flush_vmid_nsh(), that does a TLBI VMALLS12E1 behind the
> scenes?
> 
> If an NV guest is playing games at stage-1 across VMIDs then it gets to
> suffer the consequences (additional TLB conflict aborts).
> 
> -- 
> Thanks,
> Oliver

Apologies for the very late reply. Thank you for taking the time to
review my patch. Will fix the type, and work on fixing the logic there
to use a TLBI VMALLS12E1.

-- 
Kind regards,
Mikołaj Lenczewski

