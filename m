Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A00C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blutrRn1i/QISvkT8lwfDm11OzWCMqLq0rQmGe9BVCc=; b=2XT56niJjW/3kWnkOYARBUlakU
	I6C8U5JIOJCViiXXrzkvyn6fRxhlvVWMmQNfx8Zw8ffXBR43uzvAbrOcOKaMTk1D87TelPEJsqJY7
	fCmNGJEnVCGwTNklItaWsQR6ig4jfIYvoTMrCWqI11G3TCITt741xppHHTwDH2R3qYqE4uDXeJue6
	HvRpC5rGxpJLxq1N20la1vokccT3Gct99Ncp2ZZQk11V5Rft+T9XLcrO9z+9PKLNGTP4BfE7Ee0Wz
	tTBAXVQfYxhR4aLmuV7eBmhUgdzGRnX0fWz6S/txphUaxWZetjxsVx4ydJySkiKB/IXH/MXvsFytb
	hFur2L9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50bD-0000000GeGa-0WYh;
	Fri, 11 Sep 2026 12:43:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50b3-0000000GeER-47Xa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:43:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4485B1655;
	Fri, 11 Sep 2026 05:43:06 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A4F3F7B4;
	Fri, 11 Sep 2026 05:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789130589; bh=AYEkP013J/2d/muDFR6I2PEvoL5OJnQHcQnfIXL8Gdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7t2/5Lam2g8qRhPXwbiismNNJmPzYkbs1njyR8gmpp7Vck5F0dEP+USPHwGkVj4y
	 zyEVPrSL46la0hde1suMA5O66hKqdPYQmIy0jLuQtj8JZiZhItI8liJqlOlZKutbU7
	 R7cp0KjoRS0TqixmTVP9fKudIHZb6fIM75NhVQfI=
Date: Fri, 11 Sep 2026 13:42:57 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Subject: Re: [PATCH 8/8] KVM: selftests: Add nested pre-fault test for arm64
Message-ID: <g45xmukndzivuxowpjxlajrjzx2ljevliroenbx4h4wgrnpoi6@eozuucl3usi3>
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
 <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
 <aqOgEQKBGH-YqGr3@sm-arm-grace07>
 <aqPIUtNTJFwUvJME@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqPIUtNTJFwUvJME@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054314_111901_B67A58DB 
X-CRM114-Status: GOOD (  34.45  )
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

On Fri, Sep 11, 2026 at 10:32:17AM +0100, Lorenzo Stoakes (ARM) wrote:
> +cc Wei-Lin
> 
> On Fri, Sep 11, 2026 at 03:30:41PM +0900, Itaru Kitayama wrote:
> > Hi Lorenzo,
> >
> > On Tue, Aug 25, 2026 at 05:00:42PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > From: Jack Thomson <jackabt@amazon.com>
> > >
> > > Add an arm64 nested-virt selftest for KVM_PRE_FAULT_MEMORY. The guest
> > > enters vEL1 and exits to userspace with a nested/shadow stage-2 MMU as
> > > the vCPU's last-run context.
> > >
> > > Before prefaulting, userspace enables HCR_EL2.VM and points VTTBR_EL2 at
> > > an empty nested stage-2 root. A prefault implementation that incorrectly
> > > treats the userspace GPA as an L2 IPA will fail the ioctl; the correct
> > > path targets the canonical stage-2 and succeeds.
> > >
> > > Restore the original nested state before resuming the guest, then touch
> > > the prefaulted range to check that vEL1 still runs correctly.
> > >
> > > Signed-off-by: Jack Thomson <jackabt@amazon.com>
> > > [ljs: partial progress, >4 KiB pgsize, commit msg, comment fixups]
> > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > ---
> > >  tools/testing/selftests/kvm/Makefile.kvm           |   1 +
> > >  .../selftests/kvm/arm64/nv_pre_fault_memory_test.c | 206 +++++++++++++++++++++
> > >  2 files changed, 207 insertions(+)
> >
> > I wonder whether this selftest can use functions Wei-Lin proposed
> > some time ago [1]: 20260325003620.2214766-1-weilin.chang@arm.com
> > or would you prefer this test as propose, since it is clear as
> > to what needs to be done to enter L2.
> 
> I think if these aren't merged yet then that could be a follow up?

This selftest doesn't require setting up L1's stage-2 for L2, so to me
the current approach is okay.

[...]

> > > +static void guest_code(void)
> > > +{
> > > +	u64 sp;
> > > +
> > > +	GUEST_ASSERT_EQ(get_current_el(), 2);
> > > +
> > > +	/*
> > > +	 * Mirror the EL2 translation regime into the real EL1 registers so
> > > +	 * that vEL1 runs on the test's stage-1 page tables. With E2H=1, the
> > > +	 * _EL1 accessors read the EL2 registers, and the _EL12 accessors
> > > +	 * write the real EL1 registers.
> > > +	 */
> > > +	write_sysreg_s(read_sysreg(sctlr_el1), SYS_SCTLR_EL12);
> > > +	write_sysreg_s(read_sysreg(tcr_el1), SYS_TCR_EL12);
> > > +	write_sysreg_s(read_sysreg(ttbr0_el1), SYS_TTBR0_EL12);
> > > +	write_sysreg_s(read_sysreg(mair_el1), SYS_MAIR_EL12);
> > > +	write_sysreg_s(read_sysreg(cpacr_el1), SYS_CPACR_EL12);

Just FYI, the at.c selftest uses a macro for these.

> > > +
> > > +	/* Run vEL1 on the same stack. */
> > > +	asm volatile("mov %0, sp" : "=r"(sp));
> > > +	write_sysreg(sp, sp_el1);
> > > +
> > > +	/*
> > > +	 * Drop TGE so that vEL1 is a nested context rather than host EL0.
> > > +	 * KVM backs it with a shadow stage-2 MMU even though vstage-2 is
> > > +	 * disabled (HCR_EL2.VM=0).
> > > +	 */
> > > +	write_sysreg(read_sysreg(hcr_el2) & ~HCR_EL2_TGE, hcr_el2);
> > > +	isb();
> > > +
> > > +	write_sysreg(PSR_MODE_EL1h | PSR_F_BIT | PSR_I_BIT | PSR_A_BIT |
> > > +		     PSR_D_BIT, spsr_el2);
> > > +	write_sysreg((u64)guest_el1_code, elr_el2);
> > > +	asm volatile("eret");
> > > +
> > > +	GUEST_ASSERT(false);
> > > +}
> > > +

[...]

> > > +
> > > +static struct nested_s2_state enable_empty_nested_s2(struct kvm_vcpu *vcpu)
> > > +{
> > > +	struct nested_s2_state state = {
> > > +		.hcr_el2 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2)),
> > > +		.vttbr_el2 = vcpu_get_reg(vcpu,
> > > +					   KVM_ARM64_SYS_REG(SYS_VTTBR_EL2)),
> > > +	};
> > > +
> > > +	TEST_ASSERT(!(state.hcr_el2 & HCR_EL2_TGE),
> > > +		    "vCPU should be in nested/vEL1 context");
> > > +
> > > +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2),
> > > +		     NESTED_S2_ROOT_GPA);
> > > +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
> > > +		     state.hcr_el2 | HCR_EL2_VM);
> > > +
> > > +	return state;
> > > +}
> > > +
> > > +static void restore_nested_s2(struct kvm_vcpu *vcpu,
> > > +			      struct nested_s2_state *state)
> > > +{
> > > +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2), state->hcr_el2);
> > > +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2),
> > > +		     state->vttbr_el2);
> > > +}
> > > +
> > > +int main(void)
> > > +{
> > > +	struct nested_s2_state s2;
> > > +	struct kvm_vcpu_init init;
> > > +	struct kvm_vcpu *vcpu;
> > > +	struct kvm_vm *vm;
> > > +	struct ucall uc;
> > > +	u64 npages;
> > > +

[...]

> > > +
> > > +	/*
> > > +	 * The vCPU's last-run context is vEL1, backed by a shadow stage-2
> > > +	 * MMU. Enable nested stage-2 with an empty root so that the ioctl
> > > +	 * fails if it tries to interpret the userspace GPA as an L2 IPA.
> > > +	 *
> > > +	 * Prefault in two halves so that the second ioctl exercises a
> > > +	 * repeated shadow-MMU attach and canonical stage-2 swap.
> > > +	 *
> > > +	 * (Note that an implementation that wrongly populates shadow
> > > +	 * stage-2 page tables would not be caught as userland can't
> > > +	 * inspect these.)
> > > +	 */
> > > +	s2 = enable_empty_nested_s2(vcpu);
> > > +	pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE / 2);
> > > +	pre_fault(vcpu, TEST_MEM_GPA + TEST_MEM_SIZE / 2, TEST_MEM_SIZE / 2);
> > > +	restore_nested_s2(vcpu, &s2);

Sorry I don't get what enable_empty_nested_s2(), restore_nested_s2()
brings to the test?

After quickly going through the prefault implementation there isn't
anything about it that is nested related, how would giving L2 an empty
stage-2 translation affect the outcome if it misinterprets the GPA as an
L2 IPA?

In other words would there be potential false positives if we don't call
these functions?

Thanks,
Wei-Lin Chang

> > > +
> > > +	/* Resume at vEL1 and touch the prefaulted range. */
> > > +	vcpu_run(vcpu);
> > > +	switch (get_ucall(vcpu, &uc)) {
> > > +	case UCALL_DONE:
> > > +		break;
> > > +	case UCALL_ABORT:
> > > +		REPORT_GUEST_ASSERT(uc);
> > > +		break;
> > > +	default:
> > > +		TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> > > +	}
> > > +
> > > +	kvm_vm_free(vm);
> > > +	return 0;
> > > +}
> > >
> > > --
> > > 2.55.0
> > >
> 
> --
> Cheers, Lorenzo

