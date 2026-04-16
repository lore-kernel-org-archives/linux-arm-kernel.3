Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678D2F8E499
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWY96JR33bceN36ECMvcqyhv9H+Hk4+2VjNMi1Ocf9M=; b=bMVJYtwdaGJj05vYU7mf9jMA7Q
	jEiAARobh9cFIpozgJVhp1LvcZuQdAZdGBZ+ueiInY5EaNi4qmN7k9NwGm436V/kYkB0Y0zxSoZxw
	eRkriKd8SCVtM0QFo1mMaxEDvWFG4snJJ22WaTJIGpSqUvdAEjutcVBtzIjtt+r8PnDB3P0ik88a5
	A0ZDXgkdUEXj+5rEjCcYYa/t+TyKhjTQSl3SnkQdooI5sx8tBjyaCoxnjNQeMI/efATeuhRulO11m
	UFOnsD1OKfKYvXcPFA2JbIPu9dyYhOAlAPWg1vwUD2IiBWJj4BRJF7ZkIYkbj9uTZcHmJcDjYYWTE
	ZXXv5f9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDWJk-00000003Cl8-0Bgh;
	Thu, 16 Apr 2026 23:40:16 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDWJg-00000003Ck4-0aKD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 23:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776382812; x=1807918812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nY5mGUtsHm/DH8Clav1C2yzxZNNNZ0YPXwIDnOkmLx8=;
  b=qlRUmxVIyRDcFFZ2JqGwXi67KDj6xdrfEhCL3N1icw/ixiuqiU+V+HJt
   0xJtlFADqy30BQxnEV/dtpcrxC7yGgY3WgPr0Co+lbDhsqTtYKQcxyv5D
   GAkW3yvbehuQWhlJywrNM7D38qmdccca5X5PHUJmwWJernevKq0BDHY+X
   mRbnjWRpkh9mhoSFExvvEiGMGFCzC258tbcR2ULFKymM3AG9lTNhB5vJ0
   v0V0wdlFqYE2PS+PT6zi7QzHeyq5N2L8su8CsekTv48BtXIxENjG+XoJ6
   YckvTQW9tNghWet9F9ZJmv108Esj3qg2/0JkUqPBdPhHK716xUCaj4a70
   A==;
X-CSE-ConnectionGUID: s8F4hfoOQdivyoMB0bI7RQ==
X-CSE-MsgGUID: 7BYcpm0fTwGxm3fnWUafxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="236692290"
X-IronPort-AV: E=Sophos;i="6.23,183,1770562800"; 
   d="scan'208";a="236692290"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 08:39:59 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C108A1002B8B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 23:39:58 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6CF74140124F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 23:39:58 +0000 (UTC)
Received: from sm-arm-grace07 (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 017BC14005BB;
	Thu, 16 Apr 2026 23:39:52 +0000 (UTC)
Date: Fri, 17 Apr 2026 08:39:49 +0900
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
Message-ID: <aeFzRfEMGlMGFvX7@sm-arm-grace07>
References: <20260412142216.3806482-1-weilin.chang@arm.com>
 <20260412142216.3806482-3-weilin.chang@arm.com>
 <ad68VjnGQ3trs7AN@sm-arm-grace07>
 <2grav6nkabbab3e4gm4vtca63kqrpaegq4xqlhdhwc4l32v65i@x5ksiimtk4er>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2grav6nkabbab3e4gm4vtca63kqrpaegq4xqlhdhwc4l32v65i@x5ksiimtk4er>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_164012_462881_165BF791 
X-CRM114-Status: GOOD (  28.66  )
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

On Thu, Apr 16, 2026 at 11:15:57PM +0100, Wei-Lin Chang wrote:
> On Wed, Apr 15, 2026 at 07:14:46AM +0900, Itaru Kitayama wrote:
> > On Sun, Apr 12, 2026 at 03:22:14PM +0100, Wei-Lin Chang wrote:
> > > Add helpers so that guest hypervisors can run nested guests. SP_EL1
> > > save/restore is added to allow nested guests to use a stack.
> > > 
> > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > ---
> > >  .../selftests/kvm/include/arm64/nested.h      | 17 +++++++
> > >  tools/testing/selftests/kvm/lib/arm64/entry.S |  5 ++
> > >  .../testing/selftests/kvm/lib/arm64/nested.c  | 46 +++++++++++++++++++
> > >  3 files changed, 68 insertions(+)
> > > 
> > > diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
> > > index 86d931facacb..7928ef89494a 100644
> > > --- a/tools/testing/selftests/kvm/include/arm64/nested.h
> > > +++ b/tools/testing/selftests/kvm/include/arm64/nested.h
> > > @@ -21,8 +21,17 @@
> > >  
> > >  extern char hyp_vectors[];
> > >  
> > > +enum vcpu_sysreg {
> > > +	__INVALID_SYSREG__,   /* 0 is reserved as an invalid value */
> > > +
> > > +	SP_EL1,
> > > +
> > > +	NR_SYS_REGS
> > > +};
> > > +
> > >  struct cpu_context {
> > >  	struct user_pt_regs regs;	/* sp = sp_el0 */
> > > +	u64 sys_regs[NR_SYS_REGS];
> > >  };
> > >  
> > >  struct vcpu {
> > > @@ -37,9 +46,17 @@ struct hyp_data {
> > >  	struct cpu_context hyp_context;
> > >  };
> > 
> > I am not sure of these structs you introduced only for nested guest feature
> > testing, as the KVM arm64 code they are quite complex and involved, 
> > extracring part of those and add members as hello_nested or simliar
> > tests evolve, then add test cases to me seems fragile. 
> > But if you have strong reason to add these would you mind explaining a bit?
> 
> Sorry, I don't quite get all of your points. I understand your argument
> being evolving these structs as time goes is fragile. For this didn't
> KVM itself evolve like this?
> 
> As for having these structs, how can we make L1 a small hypervisor
> without them?

You're correct and I was wrong. We will just have to change the structs for 
nested virtualization selftests as we add more test cases.

Itaru.

> 
> Thanks,
> Wei-Lin Chang
> 
> > 
> > Thanks,
> > Itaru.
> > 
> > >  
> > > +void prepare_hyp(void);
> > > +void init_vcpu(struct vcpu *vcpu, vm_paddr_t l2_pc, vm_paddr_t l2_stack_top);
> > > +int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data);
> > > +
> > > +void do_hvc(void);
> > >  u64 __guest_enter(struct vcpu *vcpu, struct cpu_context *hyp_context);
> > >  void __hyp_exception(u64 type);
> > >  
> > > +void __sysreg_save_el1_state(struct cpu_context *ctxt);
> > > +void __sysreg_restore_el1_state(struct cpu_context *ctxt);
> > > +
> > >  #endif /* !__ASSEMBLER__ */
> > >  
> > >  #endif /* SELFTEST_KVM_NESTED_H */
> > > diff --git a/tools/testing/selftests/kvm/lib/arm64/entry.S b/tools/testing/selftests/kvm/lib/arm64/entry.S
> > > index 33bedf5e7fb2..df3af3463c6c 100644
> > > --- a/tools/testing/selftests/kvm/lib/arm64/entry.S
> > > +++ b/tools/testing/selftests/kvm/lib/arm64/entry.S
> > > @@ -3,6 +3,11 @@
> > >   * adapted from arch/arm64/kvm/hyp/entry.S
> > >   */
> > >  
> > > + .globl do_hvc
> > > + do_hvc:
> > > +	hvc	#0
> > > +	ret
> > > +
> > >  /*
> > >   * Manually define these for now
> > >   */
> > > diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
> > > index 06ddaab2436f..b30d20b101c4 100644
> > > --- a/tools/testing/selftests/kvm/lib/arm64/nested.c
> > > +++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
> > > @@ -4,7 +4,53 @@
> > >   */
> > >  
> > >  #include "nested.h"
> > > +#include "processor.h"
> > >  #include "test_util.h"
> > > +#include <asm/sysreg.h>
> > > +
> > > +void prepare_hyp(void)
> > > +{
> > > +	write_sysreg(HCR_EL2_E2H | HCR_EL2_RW, hcr_el2);
> > > +	write_sysreg(hyp_vectors, vbar_el2);
> > > +	isb();
> > > +}
> > > +
> > > +void init_vcpu(struct vcpu *vcpu, vm_paddr_t l2_pc, vm_paddr_t l2_stack_top)
> > > +{
> > > +	memset(vcpu, 0, sizeof(*vcpu));
> > > +	vcpu->context.regs.pc = l2_pc;
> > > +	vcpu->context.regs.pstate = PSR_MODE_EL1h | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
> > > +	vcpu->context.sys_regs[SP_EL1] = l2_stack_top;
> > > +}
> > > +
> > > +void __sysreg_save_el1_state(struct cpu_context *ctxt)
> > > +{
> > > +	ctxt->sys_regs[SP_EL1] = read_sysreg(sp_el1);
> > > +}
> > > +
> > > +void __sysreg_restore_el1_state(struct cpu_context *ctxt)
> > > +{
> > > +	write_sysreg(ctxt->sys_regs[SP_EL1], sp_el1);
> > > +}
> > > +
> > > +int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data)
> > > +{
> > > +	u64 ret;
> > > +
> > > +	__sysreg_restore_el1_state(&vcpu->context);
> > > +
> > > +	write_sysreg(vcpu->context.regs.pstate, spsr_el2);
> > > +	write_sysreg(vcpu->context.regs.pc, elr_el2);
> > > +
> > > +	ret =  __guest_enter(vcpu, &hyp_data->hyp_context);
> > > +
> > > +	vcpu->context.regs.pc = read_sysreg(elr_el2);
> > > +	vcpu->context.regs.pstate = read_sysreg(spsr_el2);
> > > +
> > > +	__sysreg_save_el1_state(&vcpu->context);
> > > +
> > > +	return ret;
> > > +}
> > >  
> > >  void __hyp_exception(u64 type)
> > >  {
> > > -- 
> > > 2.43.0
> > > 

