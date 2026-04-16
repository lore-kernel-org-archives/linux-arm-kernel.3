Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23C7F8DFCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 21:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPDDQOkf62DZ4SQDK/iMs4LntSoiBEDtx+kZoNa/z+M=; b=V3EZIVibR2QJCQItqHrLwWOEBh
	/wQGdSuWFWyV7ZZiNnf15VFLREjRpM4nw0yXMXikorMyE60aw5E6XK2ctxPZJdbR5o9cjswVH1NME
	SiU2HMzYupUac14B5sh4sgxFWQB1NvY248JeAc9WsgdBHWpEXoeGxNKWnievZublehWmrc95fl0EO
	Dzrvb/hr1WZwUY43sQ9x61+cZpt79wTDyO6HSST3r4Voe1aPAw8yHtE/EWWDZhXXbnnmgM3ASismX
	1ScSvlpGOdnG6MJcrsokX1NefiRh0bZw/KuTdoKbxUsshQQ9YvOY3NCIxkHgh+CjGDTnrp8be+X6+
	YvL4rDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUjc-000000037Bs-1r6T;
	Thu, 16 Apr 2026 21:58:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUjY-000000037BV-3bpn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 21:58:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8ADE244C;
	Thu, 16 Apr 2026 14:58:40 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECC6B3F641;
	Thu, 16 Apr 2026 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776376726; bh=2Ot5FTvPoNnDmgjuuWF3a8D3xqhKH78K66NWVPjoqnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXqlGymcszaKPWDnLn4Y6wHu/+Ea9CdBDQFHHMWw1Uh55UjIAYge/Kk4HAOGvexRS
	 MHuLDCQSf6WOwfN1vbU4bM44+C3YXJlombMG4upj6Fr8AZrwQl6/806bHbr/gymIfI
	 MWBrzA/tXGlLP1JvtqmBMdhpEY4+trXwUcCLYjp4=
Date: Thu, 16 Apr 2026 22:58:34 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v2 3/4] KVM: arm64: sefltests: Add basic NV selftest
Message-ID: <uzobzrn4ywsb3kmeinqlzk2dcen4vkbmaly55k3ogfkzn4kruu@u57g55wklb5e>
References: <20260412142216.3806482-1-weilin.chang@arm.com>
 <20260412142216.3806482-4-weilin.chang@arm.com>
 <adwofV7yf71OdMFk@sm-arm-grace07>
 <ddr6exocupk6mzshjwvu6sqt57aeqiyxqss3rpgcxxyh54cw4g@rxvm5zh3ybrw>
 <ad1gqsqqOXyYmJoG@sm-arm-grace07>
 <xsdf2k2u4g6n7nmxcgwhiraqodwtteuxqqtnj2dx5sxgu74a7j@yjijkyohkq4i>
 <ad66HasXI2AkEjgK@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad66HasXI2AkEjgK@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_145849_254431_92814963 
X-CRM114-Status: GOOD (  46.15  )
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

On Wed, Apr 15, 2026 at 07:05:17AM +0900, Itaru Kitayama wrote:
> On Tue, Apr 14, 2026 at 11:16:47AM +0100, Wei-Lin Chang wrote:
> > On Tue, Apr 14, 2026 at 06:31:22AM +0900, Itaru Kitayama wrote:
> > > On Mon, Apr 13, 2026 at 10:18:42AM +0100, Wei-Lin Chang wrote:
> > > > Hi Itaru,
> > > > 
> > > > On Mon, Apr 13, 2026 at 08:19:25AM +0900, Itaru Kitayama wrote:
> > > > > On Sun, Apr 12, 2026 at 03:22:15PM +0100, Wei-Lin Chang wrote:
> > > > > > This selftest simply starts an L1, which starts its own guest (L2). L2
> > > > > > runs without stage-1 and 2 translations, it calls an HVC to jump back
> > > > > > to L1.
> > > > > 
> > > > > How do you disable both the nested guest (L2)'s MMU and stage 2
> > > > > translations?
> > > > 
> > > > Guest stage-2 is disabled by not setting HCR_EL2.VM in prepare_hyp(),
> > > > and stage-1 is disabled by not writing to SCTLR_EL12 in init_vcpu(),
> > > > effectively using the default value set by L0. However since SCTLR_EL1
> > > > has many architecturally UNKNOWN bits (including SCTLR_EL1.M), it should
> > > > be better to write a value before running L2 I suppose...
> > > 
> > > Thanks. What do you think of using copy_el2_to_el1() macro in at.c, so we
> > > can prepare in guest_code() to manipulate the SCTLR_EL12 System register 
> > > with the sensible programmed values?
> > 
> > Yes, using copy_el2_to_el1() can give us an L2 stage-1 that is identical
> > to the L1's stage-1. But what I was considering was if guest stage-2 is
> > enabled (which we plan to implement), then those stage-1 page tables
> > will have to be mapped for L2, and its base address translated to L2IPA.
> > It's doable but seems like extra complexity when stage-1 is not so
> > interesting for KVM (except for AT?), it lets the guest do whatever it
> > likes and let the hardware do the translation.
> > 
> > Let me know if you have reasons to want stage-1 for L2, there could be
> > something I should consider but did not.
> 
> By keeping nested guest's MMU enabled, we can exercise the shadow stage
> 2 on the host. But I am fine with you starting nested guest's IPA and I
> hope Marc and Oliver approve this seris and merge upstream.

I think you have guest stage-1 and guest stage-2 confused. Whether the
nested guest's stage-1 MMU is enabled or not does not affect what KVM is
doing with the shadow page tables. Stage-1 MMU translates L2VA -> L2IPA.
Shadow page tables store the combined translation of L2IPA -> L1IPA
(stage-2 PTs L1 built for L2) and L1IPA -> host PA (stage-2 PTs host
built for L1).

Additionally, stage-2 not enabled for L2 does not mean shadow stage-2 is
not exercised, there is still a distince shadow stage-2 for it doing the
work, albeit simple (the stored mapping is the same as the canonical
stage-2).

All in all, if we want to make the shadow page tables more interesting,
what we should do is build a stage-2 for L2, and enable it in L1, not
just turn on L2's stage-1 MMU.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > 
> > Thanks,
> > Wei-Lin Chang
> > 
> > > 
> > > Itaru.
> > > 
> > > > 
> > > > Thanks,
> > > > Wei-Lin Chang
> > > > 
> > > > > 
> > > > > Itaru.
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > > > > ---
> > > > > >  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> > > > > >  .../selftests/kvm/arm64/hello_nested.c        | 103 ++++++++++++++++++
> > > > > >  2 files changed, 104 insertions(+)
> > > > > >  create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
> > > > > > 
> > > > > > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> > > > > > index 3dc3e39f7025..e8c108e0c487 100644
> > > > > > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > > > > > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > > > > > @@ -168,6 +168,7 @@ TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
> > > > > >  TEST_GEN_PROGS_arm64 += arm64/at
> > > > > >  TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
> > > > > >  TEST_GEN_PROGS_arm64 += arm64/hello_el2
> > > > > > +TEST_GEN_PROGS_arm64 += arm64/hello_nested
> > > > > >  TEST_GEN_PROGS_arm64 += arm64/host_sve
> > > > > >  TEST_GEN_PROGS_arm64 += arm64/hypercalls
> > > > > >  TEST_GEN_PROGS_arm64 += arm64/external_aborts
> > > > > > diff --git a/tools/testing/selftests/kvm/arm64/hello_nested.c b/tools/testing/selftests/kvm/arm64/hello_nested.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..97387e4697b3
> > > > > > --- /dev/null
> > > > > > +++ b/tools/testing/selftests/kvm/arm64/hello_nested.c
> > > > > > @@ -0,0 +1,103 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * hello_nested - Go from vEL2 to EL1 then back
> > > > > > + */
> > > > > > +
> > > > > > +#include "nested.h"
> > > > > > +#include "processor.h"
> > > > > > +#include "test_util.h"
> > > > > > +#include "ucall.h"
> > > > > > +
> > > > > > +#define XLATE2GPA	(0xABCD)
> > > > > > +#define L2STACKSZ	(0x100)
> > > > > > +
> > > > > > +/*
> > > > > > + * TPIDR_EL2 is used to store vcpu id, so save and restore it.
> > > > > > + */
> > > > > > +static vm_paddr_t ucall_translate_to_gpa(void *gva)
> > > > > > +{
> > > > > > +	vm_paddr_t gpa;
> > > > > > +	u64 vcpu_id = read_sysreg(tpidr_el2);
> > > > > > +
> > > > > > +	GUEST_SYNC2(XLATE2GPA, gva);
> > > > > > +
> > > > > > +	/* get the result from userspace */
> > > > > > +	gpa = read_sysreg(tpidr_el2);
> > > > > > +
> > > > > > +	write_sysreg(vcpu_id, tpidr_el2);
> > > > > > +
> > > > > > +	return gpa;
> > > > > > +}
> > > > > > +
> > > > > > +static void l2_guest_code(void)
> > > > > > +{
> > > > > > +	do_hvc();
> > > > > > +}
> > > > > > +
> > > > > > +static void guest_code(void)
> > > > > > +{
> > > > > > +	struct vcpu vcpu;
> > > > > > +	struct hyp_data hyp_data;
> > > > > > +	int ret;
> > > > > > +	vm_paddr_t l2_pc, l2_stack_top;
> > > > > > +	/* force 16-byte alignment for the stack pointer */
> > > > > > +	u8 l2_stack[L2STACKSZ] __attribute__((aligned(16)));
> > > > > > +
> > > > > > +	GUEST_ASSERT_EQ(get_current_el(), 2);
> > > > > > +	GUEST_PRINTF("vEL2 entry\n");
> > > > > > +
> > > > > > +	l2_pc = ucall_translate_to_gpa(l2_guest_code);
> > > > > > +	l2_stack_top = ucall_translate_to_gpa(&l2_stack[L2STACKSZ]);
> > > > > > +
> > > > > > +	init_vcpu(&vcpu, l2_pc, l2_stack_top);
> > > > > > +	prepare_hyp();
> > > > > > +
> > > > > > +	ret = run_l2(&vcpu, &hyp_data);
> > > > > > +	GUEST_ASSERT_EQ(ret, ARM_EXCEPTION_TRAP);
> > > > > > +	GUEST_DONE();
> > > > > > +}
> > > > > > +
> > > > > > +int main(void)
> > > > > > +{
> > > > > > +	struct kvm_vcpu_init init;
> > > > > > +	struct kvm_vcpu *vcpu;
> > > > > > +	struct kvm_vm *vm;
> > > > > > +	struct ucall uc;
> > > > > > +	vm_paddr_t gpa;
> > > > > > +
> > > > > > +	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
> > > > > > +	vm = vm_create(1);
> > > > > > +
> > > > > > +	kvm_get_default_vcpu_target(vm, &init);
> > > > > > +	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> > > > > > +	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
> > > > > > +	kvm_arch_vm_finalize_vcpus(vm);
> > > > > > +
> > > > > > +	while (true) {
> > > > > > +		vcpu_run(vcpu);
> > > > > > +
> > > > > > +		switch (get_ucall(vcpu, &uc)) {
> > > > > > +		case UCALL_SYNC:
> > > > > > +			if (uc.args[0] == XLATE2GPA) {
> > > > > > +				gpa = addr_gva2gpa(vm, (vm_vaddr_t)uc.args[1]);
> > > > > > +				vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL2), gpa);
> > > > > > +			}
> > > > > > +			break;
> > > > > > +		case UCALL_PRINTF:
> > > > > > +			pr_info("%s", uc.buffer);
> > > > > > +			break;
> > > > > > +		case UCALL_DONE:
> > > > > > +			pr_info("DONE!\n");
> > > > > > +			goto end;
> > > > > > +		case UCALL_ABORT:
> > > > > > +			REPORT_GUEST_ASSERT(uc);
> > > > > > +			fallthrough;
> > > > > > +		default:
> > > > > > +			TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +end:
> > > > > > +	kvm_vm_free(vm);
> > > > > > +	return 0;
> > > > > > +}
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 

