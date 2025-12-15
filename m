Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4E1D5B17F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EhDXSSFOrnvkTDq0XKfeochyF3HK62S5sW6FcwPxcM=; b=1MxiKBwhJDygKRRHF0n2zUkl3B
	Nf/xHsKXmdMGq1QlMUoVe+y26cSCJ/DVr538rNg7go+5x89I0Llz0nMkV+5WDOFBFP+cg+nenCazv
	GBj4ngta5Q12zWraegSudQzHaAl1Kzdf59c9vcqNlYjifn96Q3WnprGuxJbOIHFT0G1xxrMJzmu2H
	9/cUX0igeA97d6Zadwe9Xhygj1A6Eq6ykv9PFQ4DoYmyBxJlSmhmFn5+0eM0Lsmqiz918hVirUc2k
	dBMr75LM0SDtulwzMx0H2+ZpWPf6rmehcjrYXidytg/JW7mWhQElQo9FkT4tPhUzY/Tpi9b5G2RKc
	kFAvKpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAKN-00000003t3O-385P;
	Mon, 15 Dec 2025 15:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAKK-00000003t2k-2WKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:17:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CEB4497;
	Mon, 15 Dec 2025 07:17:24 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECE5A3F73B;
	Mon, 15 Dec 2025 07:17:29 -0800 (PST)
Date: Mon, 15 Dec 2025 15:17:27 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, will@kernel.org,
	tabba@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 2/4] KVM: arm64: Print register encoding if there's no
 accessor
Message-ID: <aUAmh32jCUOWMg8K@raptor>
References: <20251215114409.212512-1-alexandru.elisei@arm.com>
 <20251215114409.212512-3-alexandru.elisei@arm.com>
 <86ike7onhr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ike7onhr.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_071732_734360_B500F1EF 
X-CRM114-Status: GOOD (  26.62  )
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

Hi Marc,

On Mon, Dec 15, 2025 at 01:58:40PM +0000, Marc Zyngier wrote:
> On Mon, 15 Dec 2025 11:44:07 +0000,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > Configuring a register trap without specifying an accessor function is
> > abviously a bug. Instead of calling die() when that happens, let's be a bit
> > more helpful and print the register encoding and kill the virtual machine
> > instead.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arch/arm64/kvm/sys_regs.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index c8fd7c6a12a1..d669f6fef177 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -4668,7 +4668,13 @@ static void perform_access(struct kvm_vcpu *vcpu,
> >  	 * that we don't know how to handle. This certainly qualifies
> >  	 * as a gross bug that should be fixed right away.
> >  	 */
> > -	BUG_ON(!r->access);
> > +	if (!r->access) {
> > +		KVM_BUG(1, vcpu->kvm,
> > +			"Unexpected access to register: { Op0(%2u), Op1(%2u), CRn(%2u), CRm(%2u), Op2(%2u) } (%s)",
> > +			params->Op0, params->Op1, params->CRn, params->CRm, params->Op2,
> > +			str_write_read(params->is_write));
> > +		return;
> > +	}
> 
> Why not writing
> 
> 	if (KVM_BUG(!r>access, ...))
> 		return;
> 
> instead? And you could reuse the format that's already defined in
> print_sys_reg_msg().
> 
> You could instead consider injecting an UNDEF in the guest, which I

Injecting an undefined instruction exception early in the boot process can lead
to an infinite loop of undefined instruction exceptions in the guest. This is
what happens for the unhandled PIRE0_EL1 trap that the previous patch fixes. The
guest access takes place in __cpu_setup(), when there are no vectors installed.

If you're ok with this, I can move forward with the below:

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c8fd7c6a12a1..516072417649 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4668,7 +4668,10 @@ static void perform_access(struct kvm_vcpu *vcpu,
         * that we don't know how to handle. This certainly qualifies
         * as a gross bug that should be fixed right away.
         */
-       BUG_ON(!r->access);
+       if (!r->access) {
+               bad_trap(vcpu, params, r, "Unexpected register access");
+               return;
+       }

        /* Skip instruction if instructed so */
        if (likely(r->access(vcpu, params, r)))

And this is what KVM prints (the register encoding is outside the trace snippet,
if you think that would make a difference to the end user):

[ 4926.964472] ------------[ cut here ]------------
[ 4926.964529] Unexpected Unexpected register access
[ 4926.964713] WARNING: arch/arm64/kvm/sys_regs.c:64 at bad_trap.isra.0+0x70/0x7c, CPU#5: kvm-vcpu-0/179
[ 4926.965014] Modules linked in:
[ 4926.965097] CPU: 5 UID: 0 PID: 179 Comm: kvm-vcpu-0 Not tainted 6.19.0-rc1-dirty #85 PREEMPT
[ 4926.965240] Hardware name: FVP Base RevC (DT)
[ 4926.965316] pstate: 63402005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[ 4926.965442] pc : bad_trap.isra.0+0x70/0x7c
[ 4926.965564] lr : bad_trap.isra.0+0x70/0x7c
[ 4926.965687] sp : ffff800080be39f0
[ 4926.965760] x29: ffff800080be39f0 x28: ffff0008031e2dc0 x27: 0000000000000000
[ 4926.965943] x26: 0000000000000000 x25: 0000000000000000 x24: 000000000000ae80
[ 4926.966124] x23: ffff000800b78048 x22: ffff00080164c9c0 x21: ffff0008031e2dc0
[ 4926.966314] x20: ffff000800b78000 x19: ffff000800b78000 x18: ffffffffff00b468
[ 4926.966506] x17: 0000000000000000 x16: 0000000000000000 x15: ffffa991688ee120
[ 4926.966689] x14: fffffffffe00b467 x13: 0000000000001408 x12: 0000000000001470
[ 4926.966874] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff000875334bc0
[ 4926.967058] x8 : 0000000002bfffa8 x7 : 0000000000000081 x6 : ffff000877f34bc0
[ 4926.967241] x5 : 0000000000000081 x4 : ffffa991674022a8 x3 : 0000000000000001
[ 4926.967423] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008031e2dc0
[ 4926.967605] Call trace:
[ 4926.967664]  bad_trap.isra.0+0x70/0x7c (P)
[ 4926.967805]  perform_access+0xcc/0xd8
[ 4926.967943]  kvm_handle_sys_reg+0x100/0x170
[ 4926.968068]  handle_exit+0x58/0x168
[ 4926.968187]  kvm_arch_vcpu_ioctl_run+0x2f8/0x900
[ 4926.968336]  kvm_vcpu_ioctl+0x168/0xa18
[ 4926.968479]  __arm64_sys_ioctl+0x2ec/0xaf4
[ 4926.968599]  invoke_syscall.constprop.0+0x48/0xc8
[ 4926.968758]  do_el0_svc+0x3c/0xb8
[ 4926.968903]  el0_svc+0x3c/0x160
[ 4926.969014]  el0t_64_sync_handler+0xa0/0xe4
[ 4926.969137]  el0t_64_sync+0x198/0x19c
[ 4926.969255] ---[ end trace 0000000000000000 ]---
[ 4926.969427] kvm [166]:  { Op0( 3), Op1( 0), CRn(10), CRm( 2), Op2( 2), func_write },

Thanks,
Alex

