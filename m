Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4E4F01834
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKrR/1pd+xHFmw3uYZJD9kuCMKMcc2RsudrYTAR5lDg=; b=PXUczl+LfG0X8+If4/eiNcy2Jh
	ysEEh+pFkRLBb6wcjgcEfiUsKb/RI5QrzAN0iFCe0fVJt5/gmJp63so5gZ5Dgo6ly6K/JfQmUi07J
	91JYGrGLskxCT2WKpbWSSIjwX8K1sbiHHJNZAb0NUa95+YBuZN5HCl00D3kGfplIbRkATKZ7PEcGH
	qeVlPiUj32vI8RHOkljU+aCd0RMnCnSCI7Gb10yiutjFSSUsEQ9USXOf1rwwiFjCtpOzXGBEDiq7s
	fH0Pni2PLQdY1vqEqEaKD3zxvpjx6KRyE84PN7zIt2KL4hB9ZM//uNzBZG/b1NwI+uxQGxfGSQFid
	WNlj7OAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUfh-00000003gud-2SPx;
	Fri, 06 Mar 2026 12:52:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUfd-00000003gtW-1Cqj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:52:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44E80497;
	Fri,  6 Mar 2026 04:52:37 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 367FF3F694;
	Fri,  6 Mar 2026 04:52:42 -0800 (PST)
Date: Fri, 6 Mar 2026 12:52:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 4/4] KVM: arm64: Add SMC hook for SME dvmsync erratum
Message-ID: <aarOF-2I9gr6az4W@arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-5-catalin.marinas@arm.com>
 <aamUFoQV74t4okXx@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamUFoQV74t4okXx@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_045245_366566_6079F1A7 
X-CRM114-Status: GOOD (  18.45  )
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

On Thu, Mar 05, 2026 at 02:32:54PM +0000, Will Deacon wrote:
> On Mon, Mar 02, 2026 at 04:57:57PM +0000, Catalin Marinas wrote:
> > @@ -28,6 +30,15 @@ static struct hyp_pool host_s2_pool;
> >  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
> >  #define current_vm (*this_cpu_ptr(&__current_vm))
> >  
> > +static void pkvm_sme_dvmsync_fw_call(void)
> > +{
> > +	if (cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC)) {
> > +		struct arm_smccc_res res;
> > +
> > +		arm_smccc_1_1_smc(ARM_SMCCC_CPU_SME_DVMSYNC_WORKAROUND, &res);
> > +	}
> > +}
> > +
> >  static void guest_lock_component(struct pkvm_hyp_vm *vm)
> >  {
> >  	hyp_spin_lock(&vm->lock);
> > @@ -553,6 +564,12 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> >  	if (ret)
> >  		return ret;
> >  
> > +	/*
> > +	 * After stage2 maintenance has happened, but before the page owner has
> > +	 * changed.
> > +	 */
> > +	pkvm_sme_dvmsync_fw_call();
> 
> Please note that this will conflict with my patch series adding support
> for protected memory with pkvm. I _think_ the right answer is to
> move this call into host_stage2_set_owner_metadata_locked().

Yes, it needs to be after host_stage2_try(), so it makes sense to move
it to host_stage2_set_owner_metadata_locked(). Let's see which order the
patches go in or we may have to fix the conflict during merge.

We can also leave the pKVM workaround for later once your rework goes
in.

-- 
Catalin

