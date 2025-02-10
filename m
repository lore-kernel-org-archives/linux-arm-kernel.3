Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB923C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 20:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=perwAGRgEJNnspfpmsr22K3usox8CU4TWBBB5uIhoSI=; b=J8a78F8EKqqjGOmCyiL8o5qFaI
	4YvopJ5t56QzcvLU9uewYuRsaikREUtun8LbptnrwPYxAt5y9lJhhR8VfyKkxLyH6J0G47SBYidvx
	G8gO/meYWjgMN3xmGOAGEpufUTYnQNjZSSHgQ9IJiYFIBzH2sDOh8amEFd5HVosIuDaoxwJ1+vTrV
	k854laIxtQzglccmpFNn7m00PvCz7ncgDND2mGkiqjeUQY4keWc3cs2gZPI8FRDR1ZO8m5L0z0Ibv
	Kf9wKo4F5LexdRCbjXSTCmP663JtCwyiNDJRvs3diA/GsqSe8uA4IxXeuBEhfX8XG3Is3Wl+a4g4l
	k4WDHsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tha3Y-00000001Gn8-0jmD;
	Mon, 10 Feb 2025 20:07:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZzt-00000001GLG-2MAD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 20:03:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F7551477;
	Mon, 10 Feb 2025 12:03:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 496553F58B;
	Mon, 10 Feb 2025 12:03:10 -0800 (PST)
Date: Mon, 10 Feb 2025 20:03:04 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 2/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <Z6pbeIsIMWexiDta@J2N7QTR9R3>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-3-mark.rutland@arm.com>
 <20250210161242.GC7568@willie-the-truck>
 <Z6owjEPNaJ55e9LM@J2N7QTR9R3>
 <20250210180637.GA7926@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210180637.GA7926@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_120313_642401_6221B387 
X-CRM114-Status: GOOD (  18.13  )
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

On Mon, Feb 10, 2025 at 06:06:38PM +0000, Will Deacon wrote:
> On Mon, Feb 10, 2025 at 04:59:56PM +0000, Mark Rutland wrote:
> > On Mon, Feb 10, 2025 at 04:12:43PM +0000, Will Deacon wrote:
> > > On Thu, Feb 06, 2025 at 02:10:56PM +0000, Mark Rutland wrote:
> > | static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
> > | {
> > | 	...
> > | 
> > | 	/* Valid trap */
> > | 
> > | 	/*
> > | 	 * Enable everything EL2 might need to save/restore state.
> > | 	 * Maybe each of the bits should depend on system_has_xxx()
> > | 	 */
> > | 	cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN */
> > | 	isb();
> > | 
> > | 	...
> > | 
> > | 	/* Write out the host state if it's in the registers */
> > | 	if (is_protected_kvm_enabled() && host_owns_fp_regs())
> > | 		kvm_hyp_save_fpsimd_host(vcpu);
> > | 	
> > | 	/* Restore guest state */
> > | 
> > | 	...
> > | 
> > | 	/*
> > | 	 * Enable traps for the VCPU. The ERET will cause the traps to
> > | 	 * take effect in the guest, so no ISB is necessary.
> > | 	 */
> > | 	cpacr_guest = CPACR_EL1_FPEN;
> > | 	if (vcpu_has_sve(vcpu))
> > | 		cpacr_guest |= CPACR_EL1_ZEN;
> > | 	if (vcpu_has_sme(vcpu))			// whenever we add this
> > | 		cpacr_guest |= CPACR_EL1_SMEN;
> > | 	cpacr_clear_set(CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN,
> > | 			cpacr_guest);
> > | 
> > | 	return true;
> > | }
> > 
> > ... where we'd still have the CPACR write to re-enable traps, but it'd
> > be unconditional, and wouldn't need an extra ISB.
> > 
> > If that makes sense to you, I can go spin that as a subsequent cleanup
> > atop this series.
> 
> That looks very clean, yes please! Don't forget to drop the part from
> kvm_hyp_save_fpsimd_host() too.

Yep, that was the idea!

To avoid confusion: I've sent out v3 of this series *without* the
change, and I'll prepare that as a follow-up.

Mark.

