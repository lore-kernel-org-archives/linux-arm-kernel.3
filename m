Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E94EBFD21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EVVnRscnj6EDiTCh8XD69BCiK/HfbkoFLnqLMdnIZo=; b=Vr0F1KnKxNbsW+y6TiEYX8lzji
	DBf5d9CmP4OylOmAdDM+8XzDRv9EsXK3IxAA7bFvhgvw5LolfqYDxcvYF1qHUCPVP6GGmCAzHiTOS
	qX0HGd6GG0v66tCFKUav/xlThlIjOCIgKfcd5p8SxW1FQwK18xdqfihU9JVJ8+dZTFd0tyEOsptno
	NWXTuje++yw/IbJmg9AM3LIa0ZdOJO3nCR70KiO5W79FLK759JDajDxQnjlLUnwqiXV4bquPNphc/
	zF4OIkzbqte76IEIO5t9V0EOHYkX8WHSLHi4DC7VZhziTAo/gnYr4O+yulbZpGQeg5zsefjmz7xh9
	DpuNnzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDRd-0000000FLmF-0Nuf;
	Mon, 13 Apr 2026 09:19:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDRb-0000000FLlm-1VQE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:19:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22AC132E0;
	Mon, 13 Apr 2026 02:18:52 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 984D53F93E;
	Mon, 13 Apr 2026 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776071937; bh=g0ESrCViHyCxKf3iu65baEykiub0+SeZDWwUl391xKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFSjKH6+MOZGPpPhNp2SfF7rSHgMFE3bKQUfqbKUL42XZwtXTwqeq2Id2dfuQDLJF
	 0JUw61Nds3kLespdZfnvipzqo5o3idh1vCJxMgVxw0gKxLHmCUWdLgRkLbsix0Hwoc
	 zSyBawg5/azVBHRjL5M/dy2fbzFpp0yiQEOuyUpU=
Date: Mon, 13 Apr 2026 10:18:42 +0100
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
Message-ID: <ddr6exocupk6mzshjwvu6sqt57aeqiyxqss3rpgcxxyh54cw4g@rxvm5zh3ybrw>
References: <20260412142216.3806482-1-weilin.chang@arm.com>
 <20260412142216.3806482-4-weilin.chang@arm.com>
 <adwofV7yf71OdMFk@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adwofV7yf71OdMFk@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_021859_494403_5AAA46F3 
X-CRM114-Status: GOOD (  25.24  )
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

Hi Itaru,

On Mon, Apr 13, 2026 at 08:19:25AM +0900, Itaru Kitayama wrote:
> On Sun, Apr 12, 2026 at 03:22:15PM +0100, Wei-Lin Chang wrote:
> > This selftest simply starts an L1, which starts its own guest (L2). L2
> > runs without stage-1 and 2 translations, it calls an HVC to jump back
> > to L1.
> 
> How do you disable both the nested guest (L2)'s MMU and stage 2
> translations?

Guest stage-2 is disabled by not setting HCR_EL2.VM in prepare_hyp(),
and stage-1 is disabled by not writing to SCTLR_EL12 in init_vcpu(),
effectively using the default value set by L0. However since SCTLR_EL1
has many architecturally UNKNOWN bits (including SCTLR_EL1.M), it should
be better to write a value before running L2 I suppose...

Thanks,
Wei-Lin Chang

> 
> Itaru.
> 
> > 
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >  .../selftests/kvm/arm64/hello_nested.c        | 103 ++++++++++++++++++
> >  2 files changed, 104 insertions(+)
> >  create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c
> > 
> > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> > index 3dc3e39f7025..e8c108e0c487 100644
> > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > @@ -168,6 +168,7 @@ TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
> >  TEST_GEN_PROGS_arm64 += arm64/at
> >  TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
> >  TEST_GEN_PROGS_arm64 += arm64/hello_el2
> > +TEST_GEN_PROGS_arm64 += arm64/hello_nested
> >  TEST_GEN_PROGS_arm64 += arm64/host_sve
> >  TEST_GEN_PROGS_arm64 += arm64/hypercalls
> >  TEST_GEN_PROGS_arm64 += arm64/external_aborts
> > diff --git a/tools/testing/selftests/kvm/arm64/hello_nested.c b/tools/testing/selftests/kvm/arm64/hello_nested.c
> > new file mode 100644
> > index 000000000000..97387e4697b3
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/arm64/hello_nested.c
> > @@ -0,0 +1,103 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * hello_nested - Go from vEL2 to EL1 then back
> > + */
> > +
> > +#include "nested.h"
> > +#include "processor.h"
> > +#include "test_util.h"
> > +#include "ucall.h"
> > +
> > +#define XLATE2GPA	(0xABCD)
> > +#define L2STACKSZ	(0x100)
> > +
> > +/*
> > + * TPIDR_EL2 is used to store vcpu id, so save and restore it.
> > + */
> > +static vm_paddr_t ucall_translate_to_gpa(void *gva)
> > +{
> > +	vm_paddr_t gpa;
> > +	u64 vcpu_id = read_sysreg(tpidr_el2);
> > +
> > +	GUEST_SYNC2(XLATE2GPA, gva);
> > +
> > +	/* get the result from userspace */
> > +	gpa = read_sysreg(tpidr_el2);
> > +
> > +	write_sysreg(vcpu_id, tpidr_el2);
> > +
> > +	return gpa;
> > +}
> > +
> > +static void l2_guest_code(void)
> > +{
> > +	do_hvc();
> > +}
> > +
> > +static void guest_code(void)
> > +{
> > +	struct vcpu vcpu;
> > +	struct hyp_data hyp_data;
> > +	int ret;
> > +	vm_paddr_t l2_pc, l2_stack_top;
> > +	/* force 16-byte alignment for the stack pointer */
> > +	u8 l2_stack[L2STACKSZ] __attribute__((aligned(16)));
> > +
> > +	GUEST_ASSERT_EQ(get_current_el(), 2);
> > +	GUEST_PRINTF("vEL2 entry\n");
> > +
> > +	l2_pc = ucall_translate_to_gpa(l2_guest_code);
> > +	l2_stack_top = ucall_translate_to_gpa(&l2_stack[L2STACKSZ]);
> > +
> > +	init_vcpu(&vcpu, l2_pc, l2_stack_top);
> > +	prepare_hyp();
> > +
> > +	ret = run_l2(&vcpu, &hyp_data);
> > +	GUEST_ASSERT_EQ(ret, ARM_EXCEPTION_TRAP);
> > +	GUEST_DONE();
> > +}
> > +
> > +int main(void)
> > +{
> > +	struct kvm_vcpu_init init;
> > +	struct kvm_vcpu *vcpu;
> > +	struct kvm_vm *vm;
> > +	struct ucall uc;
> > +	vm_paddr_t gpa;
> > +
> > +	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
> > +	vm = vm_create(1);
> > +
> > +	kvm_get_default_vcpu_target(vm, &init);
> > +	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> > +	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
> > +	kvm_arch_vm_finalize_vcpus(vm);
> > +
> > +	while (true) {
> > +		vcpu_run(vcpu);
> > +
> > +		switch (get_ucall(vcpu, &uc)) {
> > +		case UCALL_SYNC:
> > +			if (uc.args[0] == XLATE2GPA) {
> > +				gpa = addr_gva2gpa(vm, (vm_vaddr_t)uc.args[1]);
> > +				vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL2), gpa);
> > +			}
> > +			break;
> > +		case UCALL_PRINTF:
> > +			pr_info("%s", uc.buffer);
> > +			break;
> > +		case UCALL_DONE:
> > +			pr_info("DONE!\n");
> > +			goto end;
> > +		case UCALL_ABORT:
> > +			REPORT_GUEST_ASSERT(uc);
> > +			fallthrough;
> > +		default:
> > +			TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
> > +		}
> > +	}
> > +
> > +end:
> > +	kvm_vm_free(vm);
> > +	return 0;
> > +}
> > -- 
> > 2.43.0
> > 

