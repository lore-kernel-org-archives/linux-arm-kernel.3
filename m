Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF9C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cuC0lOh0Lckca47to1/3++g3IvJVT68iM2ptamoarU=; b=x4MOEZ54IZXq0wBnWIjrlQgaCu
	o6hw+ob8RpMc2oFQspsmQQJ5kMdvBGpfeyZ+DLoj4nf9pL5Rl/2iuYa4JE9X8sD5qOeJmr5C9mfBU
	kHIgOtYE/mU0cyC0k1YYfWA0KbBF31FBgAzg7PAkyCkIXVIP0VPY6tdEVozdv+y79yu3GxyCtmIR3
	7CyPJGmZGkGZIpqZeB7hZvycNtCerK20PJ9orsraKRed/MTydVM66OZghhwIcgJidS+76oZ/xd0EB
	imdJrsZgZLFKZkudnzyU4U62NGCG9KGcSzOSHq/ydo2PnWMR7Bilt/0T1D9xVRWYs4BUzSCLmuNKb
	lxf450zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKyj-0000000BEit-0FjV;
	Mon, 10 Aug 2026 08:03:25 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKyf-0000000BEhr-0r2l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786349002; x=1817885002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gTCgRTRbO71RhS/662ipRYrMCfFYH4BSpUcquX2qvVg=;
  b=idrCyWjfPXWtFitk2frsEH0czgbN650UZ0+scUbyT0s1VygmhtSzurCP
   3A+jraIG2ngUvyHU5JhlWKl6KUEbQnBd+yNj3zDLL8LIvigEm+JcAFMfM
   K1P86pkXyQIaJyuuyEMuL11IfLdQubtkp/IeM+f5GwgqG8s8NDnB9PL4u
   Bf9oYY2BB3dg4ALOvWcan3R8TbR5qcZVcUW4NsOG228bkzgfO7QAcHjYd
   2ALv7HnRaAQoUzICEnaCRjQM/bR11bwwVu7/Vs0iABz7TPVeyjJtwU63o
   NBwqyqGTS650C/gYWZzkV1ymbuh+KSSvu1dIv5VPuOWoSICLGtsfig6mE
   A==;
X-CSE-ConnectionGUID: EWF0M70/TBe/QGfQQ/WSsQ==
X-CSE-MsgGUID: E8i8RbzaSle3yoeMBTyniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="250334002"
X-IronPort-AV: E=Sophos;i="6.25,215,1779116400"; 
   d="scan'208";a="250334002"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 17:03:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 96758C01ACA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 08:03:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 423EAC17092
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 08:03:18 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.69.80])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 3776520000EC;
	Mon, 10 Aug 2026 08:03:09 +0000 (UTC)
Date: Mon, 10 Aug 2026 17:03:02 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 21/45] KVM: arm64: CCA: Handle realm enter/exit
Message-ID: <anl7EwU9jSig-uQs@FCCLS0092175.localdomain>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-22-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803134403.80630-22-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_010322_558152_55934CF8 
X-CRM114-Status: GOOD (  17.59  )
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

On 08/03 14:43, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.

Hi Steven,

I found that when the host kernel is booting with pseudo-NMI enabled
(irqchip.gicv3_pseudo_nmi=1), Realm VMs fail boot successfully and the
watchdog reports RCU stalls and soft lockups.

After some investigations, I confirmed that arch_timer interrupts
are not being delivered to some CPUs. This appears to be because PMR is
000000c0 (GICV3_PRIO_IRQ), as shown below:

  [  248.769692] pmr: 000000c0

For normal VMs, KVM opens PMR before entering the guest, because having
IRQs masked via PMR when entering the guest means the GIC will not
signal the CPU of interrupts of lower priority, and in the worst case
a guest exit may never occur.
(See __kvm_vcpu_run in arch/arm64/kvm/hyp/vhe/switch.c)

[  248.756980] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  248.758649] rcu:     3-...0: (113 ticks this GP) idle=d2ec/1/0x4000000000000000 softirq=1631/1633 fqs=297
[  248.759413] rcu:     4-...0: (7 ticks this GP) idle=b77c/1/0x4000000000000000 softirq=1589/1589 fqs=297
[  248.760101] rcu:     (detected by 7, t=6003 jiffies, g=4553, q=86 ncpus=8)
[  248.760731] Sending NMI from CPU 7 to CPUs 3:
[  248.766814] NMI backtrace for cpu 3
[  248.768285] CPU: 3 UID: 0 PID: 387 Comm: kvm-vcpu-0 Not tainted 7.2.0-rc2-00267-g7326f0114689 #238 PREEMPT(lazy)
[  248.768681] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
[  248.768936] pstate: 61402009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  248.769021] pc : kvm_rec_enter+0xa0/0xb8
[  248.769585] lr : kvm_rec_enter+0x24/0xb8
[  248.769655] sp : ffff800084943830
[  248.769692] pmr: 000000c0
[  248.769757] x29: ffff800084943830 x28: ffff0000079c6c00 x27: 0000000000000000
[  248.770441] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[  248.770536] x23: 0000000080000000 x22: 0000000000000001 x21: 0000000049d99000
[  248.770590] x20: 0000000049d9a000 x19: ffff00000e018000 x18: 0000000000000000
[  248.770647] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[  248.770756] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  248.770863] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff8000812ab1bc
[  248.771018] x8 : 0000000000000000 x7 : 0000000000000020 x6 : 0000000000000080
[  248.771123] x5 : 0000000000000004 x4 : 0000000000000040 x3 : 0000000000000000
[  248.771172] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[  248.771385] Call trace:
[  248.771612]  kvm_rec_enter+0xa0/0xb8 (P)
[  248.771757]  kvm_arm_vcpu_enter_exit+0x8c/0x218
[  248.771796]  kvm_arch_vcpu_ioctl_run+0x274/0x890
[  248.771843]  kvm_vcpu_ioctl+0x180/0xb50
[  248.771883]  __arm64_sys_ioctl+0xb4/0x118
[  248.771920]  invoke_syscall.constprop.0+0xb8/0x120
[  248.771954]  do_el0_svc+0x48/0xc8
[  248.771982]  el0_svc+0x48/0x280
[  248.772012]  el0t_64_sync_handler+0xa0/0xe8
[  248.772041]  el0t_64_sync+0x1ac/0x1b0
[...]

> [...]
> +int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	int ret;
> +
> +	ret = rmi_rec_enter(rec->rec_phys, rec->run_phys);
> +	if (!ret)
> +		load_realm_timer_state(vcpu);
> +
> +	return ret;
> +}

In my testing environment, adding local_daif_mask/restore() in line with
__kvm_vcpu_run() fixes the issue, and Realm VMs successfully boot
without RCU stalls or soft lockups.

However, I'm not sure if we can safely call local_daif_mask/restore()
here, bacause they call trace_hardirqs_off/on(), which presumably cannot
be called from noinstr context.

For reference, the VHE hyp path seems to call local_daif_mask/restore()
from noinstr context, but I'm not sure why this is considered safe:
  noinstr kvm_arm_vcpu_enter_exit()
    kvm_call_hyp_ret(__kvm_vcpu_run, vcpu) <- normal function call for VHE
      local_daif_mask()
        trace_hardirqs_off()
      local_daif_restore()
        trace_hardirqs_off/on()

The following change works in my test environment.
Any thoughts on the issue and the proposed fix?

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index c242dfc2c7a6..dd7cb2d7db88 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1307,7 +1307,13 @@ int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
        struct realm_rec *rec = &vcpu->arch.rec;
        int ret;

+       local_daif_mask();
+       pmr_sync();
+
        ret = rmi_rec_enter(rec->rec_phys, rec->run_phys);
+
+       local_daif_restore(DAIF_PROCCTX_NOIRQ);
+
        if (!ret)
                load_realm_timer_state(vcpu);

Thanks,
Kohei

