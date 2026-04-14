Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D3EF9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LifbwY70QfagqJIHXRVWerVCEUP79XyKWILpEfdVw58=; b=XJNOpIheg2HBJcohM/xZGGVlVi
	+7te+HI7HfTZNIkYefMkLXIW7egOZyVvTnkgek2K8ZWnFfijC+ciad2+AVdX90fQ9eTyLx2pCY7K7
	GuF8TYNqVgnCi70FFcB9L2HmvKvKg0qzRiU4YB5WYpCsCwBVjh/76mbGljNPK5ENmVU0WMqsnHgZR
	f9qRepxmgsQ7XpAU7zsQBVShselsSE4wFEwj2ew3Y8u1woKyIWI/YUUe0tPNT6wWyMnDeEUcEq87P
	IBCpiYk+SBUBB32HwbLZvsXmfyVFMgpUoVkwcCaSh1hWNbtdO5leEgSzF6jeAjDKoEBpmgKVyzWIm
	D5gRW22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCm28-00000000HbO-3lbC;
	Tue, 14 Apr 2026 22:15:00 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCm26-00000000Hak-0fa2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 22:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776204897; x=1807740897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ZIxJwnwdeV1eFOf4rMBuZ5xOv59qiRJZo+CxJ4Si4Y=;
  b=ZQj7MwZYTvCEe8AqkcxgAvk1lbbGnjKAwR0ffktULDTWXqNPg59PZyOO
   QwLfTJ7fSR7hA35ZtreVJGOjm+uSP2RtlaxE7PoI6tyellNr/1ryis1Ml
   dwGPUdfraw8AmqGOE8udUaQj766NKj2MrYdihT67xy7FuscWBSNM2p/eQ
   UP8kv0lqrHoHpnfBclAKL3yrxaE9VL8qYfWKn1RcuBcSL6kFaqeqXCgRL
   hhNR1M76P7pisadzWCJR75iXuNs9KQvO3864heJ7nbMQWY7ZNFE2hlwsQ
   4WZLNNNTH/kDfiAC9McJkY6qyjNLeWl0w+MzB7P6Qf2C3Jw3dKgWya1Jt
   w==;
X-CSE-ConnectionGUID: 0SudNhHwRpuQu+tX8a6X3A==
X-CSE-MsgGUID: klGnVN6HQ/eMw7dfxoLlXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="224415536"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="224415536"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 07:14:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2DD63820736
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 22:14:55 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D6E00C0081F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 22:14:54 +0000 (UTC)
Received: from sm-arm-grace07 (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 698681000083;
	Tue, 14 Apr 2026 22:14:49 +0000 (UTC)
Date: Wed, 15 Apr 2026 07:14:46 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v2 2/4] KVM: arm64: sefltests: Add helpers for guest
 hypervisors
Message-ID: <ad68VjnGQ3trs7AN@sm-arm-grace07>
References: <20260412142216.3806482-1-weilin.chang@arm.com>
 <20260412142216.3806482-3-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412142216.3806482-3-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_151458_500912_EA2AEDAA 
X-CRM114-Status: GOOD (  21.75  )
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

On Sun, Apr 12, 2026 at 03:22:14PM +0100, Wei-Lin Chang wrote:
> Add helpers so that guest hypervisors can run nested guests. SP_EL1
> save/restore is added to allow nested guests to use a stack.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  .../selftests/kvm/include/arm64/nested.h      | 17 +++++++
>  tools/testing/selftests/kvm/lib/arm64/entry.S |  5 ++
>  .../testing/selftests/kvm/lib/arm64/nested.c  | 46 +++++++++++++++++++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
> index 86d931facacb..7928ef89494a 100644
> --- a/tools/testing/selftests/kvm/include/arm64/nested.h
> +++ b/tools/testing/selftests/kvm/include/arm64/nested.h
> @@ -21,8 +21,17 @@
>  
>  extern char hyp_vectors[];
>  
> +enum vcpu_sysreg {
> +	__INVALID_SYSREG__,   /* 0 is reserved as an invalid value */
> +
> +	SP_EL1,
> +
> +	NR_SYS_REGS
> +};
> +
>  struct cpu_context {
>  	struct user_pt_regs regs;	/* sp = sp_el0 */
> +	u64 sys_regs[NR_SYS_REGS];
>  };
>  
>  struct vcpu {
> @@ -37,9 +46,17 @@ struct hyp_data {
>  	struct cpu_context hyp_context;
>  };

I am not sure of these structs you introduced only for nested guest feature
testing, as the KVM arm64 code they are quite complex and involved, 
extracring part of those and add members as hello_nested or simliar
tests evolve, then add test cases to me seems fragile. 
But if you have strong reason to add these would you mind explaining a bit?

Thanks,
Itaru.

>  
> +void prepare_hyp(void);
> +void init_vcpu(struct vcpu *vcpu, vm_paddr_t l2_pc, vm_paddr_t l2_stack_top);
> +int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data);
> +
> +void do_hvc(void);
>  u64 __guest_enter(struct vcpu *vcpu, struct cpu_context *hyp_context);
>  void __hyp_exception(u64 type);
>  
> +void __sysreg_save_el1_state(struct cpu_context *ctxt);
> +void __sysreg_restore_el1_state(struct cpu_context *ctxt);
> +
>  #endif /* !__ASSEMBLER__ */
>  
>  #endif /* SELFTEST_KVM_NESTED_H */
> diff --git a/tools/testing/selftests/kvm/lib/arm64/entry.S b/tools/testing/selftests/kvm/lib/arm64/entry.S
> index 33bedf5e7fb2..df3af3463c6c 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/entry.S
> +++ b/tools/testing/selftests/kvm/lib/arm64/entry.S
> @@ -3,6 +3,11 @@
>   * adapted from arch/arm64/kvm/hyp/entry.S
>   */
>  
> + .globl do_hvc
> + do_hvc:
> +	hvc	#0
> +	ret
> +
>  /*
>   * Manually define these for now
>   */
> diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
> index 06ddaab2436f..b30d20b101c4 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/nested.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
> @@ -4,7 +4,53 @@
>   */
>  
>  #include "nested.h"
> +#include "processor.h"
>  #include "test_util.h"
> +#include <asm/sysreg.h>
> +
> +void prepare_hyp(void)
> +{
> +	write_sysreg(HCR_EL2_E2H | HCR_EL2_RW, hcr_el2);
> +	write_sysreg(hyp_vectors, vbar_el2);
> +	isb();
> +}
> +
> +void init_vcpu(struct vcpu *vcpu, vm_paddr_t l2_pc, vm_paddr_t l2_stack_top)
> +{
> +	memset(vcpu, 0, sizeof(*vcpu));
> +	vcpu->context.regs.pc = l2_pc;
> +	vcpu->context.regs.pstate = PSR_MODE_EL1h | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
> +	vcpu->context.sys_regs[SP_EL1] = l2_stack_top;
> +}
> +
> +void __sysreg_save_el1_state(struct cpu_context *ctxt)
> +{
> +	ctxt->sys_regs[SP_EL1] = read_sysreg(sp_el1);
> +}
> +
> +void __sysreg_restore_el1_state(struct cpu_context *ctxt)
> +{
> +	write_sysreg(ctxt->sys_regs[SP_EL1], sp_el1);
> +}
> +
> +int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data)
> +{
> +	u64 ret;
> +
> +	__sysreg_restore_el1_state(&vcpu->context);
> +
> +	write_sysreg(vcpu->context.regs.pstate, spsr_el2);
> +	write_sysreg(vcpu->context.regs.pc, elr_el2);
> +
> +	ret =  __guest_enter(vcpu, &hyp_data->hyp_context);
> +
> +	vcpu->context.regs.pc = read_sysreg(elr_el2);
> +	vcpu->context.regs.pstate = read_sysreg(spsr_el2);
> +
> +	__sysreg_save_el1_state(&vcpu->context);
> +
> +	return ret;
> +}
>  
>  void __hyp_exception(u64 type)
>  {
> -- 
> 2.43.0
> 

