Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B423ECDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaJ8Osbu4lG/JFmmJfjdc4RCODGcJoxWFg9Wpj4CK+g=; b=U3b7OHW8KUa9V/NnND4031oFbt
	RV747iolMqm7dmhxRcXrAYOb87Q048WqaP/0zotO7VY9EiNZw7XzSIUB19oU5nj/fQtbG4+m4ZdGy
	QiAvQHBnbYMhqtobWpia/1OrW+z8i4ybNNEOfJlssAJJolLBCX8Zs8q9VOFAHVTWDs3is0RkoIFLC
	QeBmzTwAoXDgU9eJkf2Je0WcdNVhr8f6jBk1kodqYIZERO1ZQWcGZzwB0v/kPUhyus6cVLhaQdyb7
	b39wMbMVFk/Bfy+vccUgdSfYFoXy/hL+4RP25Z/VCJkRQUEl2IazEBZ3zB6n8C5dEyziX6quH4W1L
	fo/f1Tng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcenz-00000008mr9-2dUK;
	Thu, 25 Jun 2026 07:47:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcenw-00000008mpY-1jvo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:47:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A1131595;
	Thu, 25 Jun 2026 00:47:12 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49B373F905;
	Thu, 25 Jun 2026 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782373637; bh=taRzNsewWMsoN79Rc+pXWddh1F0snwscIHWxMQBShrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sc73ZfWX6p5DvnhS5Y/pUdFeNf7lEJvZ634c1QVGmMeujm945Z/4B4r28QpQQ2CZR
	 ByzhlnIY2hMBQIjzbns1FgKGgilevTIRF89W2tVbuMh08zjiLLNls5/UH3bMdEqpBz
	 ak3sLARYAAucAqDNpWzBnwX94P3k8Uz1AEZz3xOg=
Date: Thu, 25 Jun 2026 08:47:04 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/3] KVM: arm64: nv: Shadow ptdump fixes
Message-ID: <fabkknc7dqpve4oo2hsgcsodq4syfgg5bp54qi6cywzssaue7u@ow3q6tupzwyz>
References: <20260623142443.648972-1-weilin.chang@arm.com>
 <ajty6I7ZqodP4ous@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajty6I7ZqodP4ous@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_004720_619629_D9F6B029 
X-CRM114-Status: GOOD (  31.60  )
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

On Wed, Jun 24, 2026 at 03:02:16PM +0900, Itaru Kitayama wrote:
> Hi Wei-Lin,
> 
> On Tue, Jun 23, 2026 at 03:24:40PM +0100, Wei-Lin Chang wrote:
> > Hi,
> > 
> > This series fixes two bugs regarding the shadow ptdump debugfs files.
> > It is based on kvmarm/fixes + [1] ("KVM: arm64: Reassign nested_mmus
> > array behind mmu_lock").
> > 
> > The first is a UAF. A nested mmu can still be accessed when the debugfs
> > file is being closed, after the nested mmus are freed. I can observe
> > this by turning on CONFIG_KASAN and closing the file after the VM is
> > destroyed. To fix this, mmu access is avoided in the .release()
> > callback.
> > 
> > The second is sleeping in atomic context, found by Itaru [2] (thanks).
> > Originally the code creates a debugfs file whenever a context gets bound
> > to an s2 mmu instance, and deletes it when it gets unbound. Problem is
> > the bind/unbind is done with the mmu_lock held, and debugfs file
> > creation and deletion can sleep. This is observable by using
> > CONFIG_DEBUG_ATOMIC_SLEEP. The new approach is just have one debugfs
> > file for each s2 mmu instance, and show their state + information when
> > requested, which can be invalid, or VTCR + VTTBR + whether s2 enabled +
> > ptdump.
> > 
> > The fixes are tested with CONFIG_PROVE_LOCKING,
> > CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> > 
> > Thanks!
> > Wei-Lin Chang
> > 
> > [1]: https://lore.kernel.org/kvmarm/aiKIVVeIr1aAB1yp@v4bel/
> > [2]: https://lore.kernel.org/kvmarm/aiuF0KSvvv-ZozI1@sm-arm-grace07/
> > 
> > Wei-Lin Chang (3):
> >   KVM: arm64: nv: Print nested mmu info in kvm_ptdump_guest_show()
> >   KVM: arm64: ptdump: Store both mmu and kvm pointers in
> >     kvm_ptdump_guest_state
> >   KVM: arm64: nv: Move to per nested mmu ptdump files
> > 
> >  arch/arm64/kvm/nested.c | 16 +++++++++++-----
> >  arch/arm64/kvm/ptdump.c | 29 +++++++++++++++++++----------
> >  2 files changed, 30 insertions(+), 15 deletions(-)
> > 
> > -- 
> > 2.43.0
> 
> At end of the execution of the shadow stage 2 selftest I see:
> 
> [  569.228448] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [  569.228712] Mem abort info:
> [  569.229091]   ESR = 0x0000000096000046
> [  569.229165]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  569.229213]   SET = 0, FnV = 0
> [  569.229244]   EA = 0, S1PTW = 0
> [  569.229276]   FSC = 0x06: level 2 translation fault
> [  569.229312] Data abort info:
> [  569.229341]   ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
> [  569.229369]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [  569.229397]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  569.229458] user pgtable: 4k pages, 48-bit VAs, pgdp=000000006dce3000
> [  569.229545] [0000000000000098] pgd=0800000048b63403, p4d=0800000048b63403, pud=0800000048b7f403, pmd=0000000000000
> ** replaying previous printk message **
> [  569.229545] [0000000000000098] pgd=0800000048b63403, p4d=0800000048b63403, pud=0800000048b7f403, pmd=0000000000000000
> [  569.236428] Internal error: Oops: 0000000096000046 [#1]  SMP
> [  569.237974] Modules linked in:
> [  569.238644] CPU: 1 UID: 0 PID: 824 Comm: shadow_stage2 Not tainted 7.1.0-rc4+ #59 PREEMPT(full)
> [  569.239139] Hardware name: QEMU QEMU Virtual Machine, BIOS 2024.02-2ubuntu0.7 11/27/2025
> [  569.239632] pstate: 61402009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [  569.240004] pc : down_write+0x50/0xe8
> [  569.240450] lr : down_write+0x34/0xe8
> [  569.240696] sp : ffff80008252ba20
> [  569.240965] x29: ffff80008252ba20 x28: 0000000000000000 x27: 0000000040000200
> [  569.241346] x26: 0000000000000200 x25: ffffd1bf542891a0 x24: 0000000000000001
> [  569.241625] x23: 0000000000000098 x22: ffff000000637480 x21: ffffd1bf57abc518
> [  569.241985] x20: 0000000000000000 x19: 0000000000000098 x18: ffff80008253d090
> [  569.242261] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  569.242568] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  569.242904] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffd1bf5532388c
> [  569.243335] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> [  569.243638] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [  569.244056] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> [  569.244507] Call trace:
> [  569.244778]  down_write+0x50/0xe8 (P)
> [  569.245094]  __simple_recursive_removal+0x68/0x230
> [  569.245322]  simple_recursive_removal+0x20/0x50
> [  569.245498]  debugfs_remove+0x64/0xc0
> [  569.245655]  kvm_nested_s2_ptdump_remove_debugfs+0x20/0x48
> [  569.245960]  kvm_arch_flush_shadow_all+0x4c/0xc0
> [  569.246100]  kvm_mmu_notifier_release+0x3c/0x90
> [  569.246344]  mmu_notifier_unregister+0x68/0x148
> [  569.246594]  kvm_destroy_vm+0x130/0x2d8
> [  569.246829]  kvm_device_release+0xf8/0x170
> [  569.246969]  __fput+0xf4/0x350
> [  569.247147]  fput_close_sync+0x4c/0x138
> [  569.247291]  __arm64_sys_close+0x44/0xa0
> [  569.247493]  invoke_syscall+0xa8/0x138
> [  569.247727]  el0_svc_common.constprop.0+0x4c/0x140
> [  569.248059]  do_el0_svc+0x28/0x58
> [  569.248236]  el0_svc+0x48/0x218
> [  569.248420]  el0t_64_sync_handler+0xc0/0x108
> [  569.248690]  el0t_64_sync+0x1b4/0x1b8
> [  569.249737] Code: b9000820 d503201f d2800000 d2800021 (c8e07e61)
> [  569.250624] ---[ end trace 0000000000000000 ]---
> [  569.251589] note: shadow_stage2[824] exited with preempt_count 1
> [  569.253677] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [  569.254391] Mem abort info:
> [  569.254416]   ESR = 0x0000000096000046
> [  569.254436]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  569.254479]   SET = 0, FnV = 0
> [  569.254493]   EA = 0, S1PTW = 0
> [  569.254506]   FSC = 0x06: level 2 translation fault
> [  569.254522] Data abort info:
> [  569.254530]   ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
> [  569.254544]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [  569.254559]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  569.254574] user pgtable: 4k pages, 48-bit VAs, pgdp=000000006dce3000
> [  569.254602] [0000000000000098] pgd=0800000048b63403, p4d=0800000048b63403, pud=0800000048b7f403, pmd=0000000000000000
> [  569.254709] Internal error: Oops: 0000000096000046 [#2]  SMP
> [  569.257747] Modules linked in:
> [  569.258124] CPU: 1 UID: 0 PID: 824 Comm: shadow_stage2 Tainted: G      D             7.1.0-rc4+ #59 PREEMPT(full)
> [  569.258642] Tainted: [D]=DIE
> [  569.258862] Hardware name: QEMU QEMU Virtual Machine, BIOS 2024.02-2ubuntu0.7 11/27/2025
> [  569.259232] pstate: 60402009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  569.259549] pc : down_write+0x50/0xe8
> [  569.259814] lr : down_write+0x34/0xe8
> [  569.259960] sp : ffff80008252b310
> [  569.260175] x29: ffff80008252b310 x28: 0000000000000000 x27: 0000000040000200
> [  569.260507] x26: 0000000000000200 x25: ffffd1bf542891a0 x24: 0000000000000001
> [  569.260891] x23: 0000000000000098 x22: ffff000000637480 x21: ffffd1bf57abc518
> [  569.261278] x20: 0000000000000000 x19: 0000000000000098 x18: ffff80008253d138
> [  569.261652] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  569.262180] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  569.262572] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffd1bf5532388c
> [  569.263299] x8 : ffff80008252b508 x7 : 0000000000000000 x6 : 0000000000000000
> [  569.263950] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [  569.264428] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> [  569.264799] Call trace:
> [  569.265039]  down_write+0x50/0xe8 (P)
> [  569.265441]  __simple_recursive_removal+0x68/0x230
> [  569.265817]  simple_recursive_removal+0x20/0x50
> [  569.266132]  debugfs_remove+0x64/0xc0
> [  569.266411]  kvm_nested_s2_ptdump_remove_debugfs+0x20/0x48
> [  569.266782]  kvm_arch_flush_shadow_all+0x4c/0xc0
> [  569.267059]  kvm_mmu_notifier_release+0x3c/0x90
> [  569.267564]  __mmu_notifier_release+0x88/0x2a0
> [  569.267736]  exit_mmap+0x430/0x490
> [  569.267943]  __mmput+0x3c/0x178
> [  569.268068]  mmput+0xa4/0xd8
> [  569.268221]  do_exit+0x274/0xb00
> [  569.268335]  make_task_dead+0x98/0x1f0
> [  569.268634]  die+0x194/0x1a0
> [  569.268893]  die_kernel_fault+0x1d0/0x3c0
> [  569.269139]  __do_kernel_fault+0x280/0x290
> [  569.269348]  do_page_fault+0x128/0x7d8
> [  569.269550]  do_translation_fault+0x74/0xc0
> [  569.269767]  do_mem_abort+0x50/0xd0
> [  569.269945]  el1_abort+0x44/0x80
> [  569.270122]  el1h_64_sync_handler+0x54/0xd0
> [  569.270306]  el1h_64_sync+0x80/0x88
> [  569.270683]  down_write+0x50/0xe8 (P)
> [  569.270997]  __simple_recursive_removal+0x68/0x230
> [  569.271217]  simple_recursive_removal+0x20/0x50
> [  569.271704]  debugfs_remove+0x64/0xc0
> [  569.271948]  kvm_nested_s2_ptdump_remove_debugfs+0x20/0x48
> [  569.272212]  kvm_arch_flush_shadow_all+0x4c/0xc0
> [  569.272510]  kvm_mmu_notifier_release+0x3c/0x90
> [  569.272731]  mmu_notifier_unregister+0x68/0x148
> [  569.272960]  kvm_destroy_vm+0x130/0x2d8
> [  569.273210]  kvm_device_release+0xf8/0x170
> [  569.273490]  __fput+0xf4/0x350
> [  569.273748]  fput_close_sync+0x4c/0x138
> [  569.274023]  __arm64_sys_close+0x44/0xa0
> [  569.274289]  invoke_syscall+0xa8/0x138
> [  569.274560]  el0_svc_common.constprop.0+0x4c/0x140
> [  569.274838]  do_el0_svc+0x28/0x58
> [  569.275066]  el0_svc+0x48/0x218
> [  569.275321]  el0t_64_sync_handler+0xc0/0x108
> [  569.275556]  el0t_64_sync+0x1b4/0x1b8
> [  569.275844] Code: b9000820 d503201f d2800000 d2800021 (c8e07e61)
> [  569.276068] ---[ end trace 0000000000000000 ]---
> [  569.277042] note: shadow_stage2[824] exited with preempt_count 1
> [  569.277234] Fixing recursive fault but reboot is needed!
> 
> the kernel is based off of kvmarm/fixes, applied your series and
> Hyunwoo's patch as well. Could you take a look at this?

Thanks once more!

This is caused by kvm_destroy_vm_debugfs() being called before
mmu_notifier_unregister() in kvm_destroy_vm(). In mmu notifier release I
remove each nested mmu's debugfs file, but all is removed priorly, so of
course UAF and bad dereferences happen.

I didn't catch this because mmu notifier release can also be called
independently before kvm_destroy_vm(). It looks like in my case kvmtool
doesn't close the VM fd on normal exit, so at process exit mm_struct
goes away before kvm, triggering mmu notifier release to free the nested
mmus and the shadow ptdump files before VM destruction. Hence when
kvm_destroy_vm(), the bug is avoided.

I don't see a way out with this per-mmu file scheme. The core issue is
mmus have a different lifetime than the VM's debugfs directory, and
both's removal can happen in parallel, i.e. the VM debugfs directory
can be removed anytime we are in mmu notifier release freeing the mmus
and their shadow ptdump files.

The original idea of just having one "nested_mmus" file could be sound,
we'll just have to take the mmu_lock to check if mmu->pgt is still alive
when getting information.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > 

