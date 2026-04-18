Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A164BF99C7C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiyR+njkeuBu2oS92njlUUsvQDTNdSraiu30/CsDGfg=; b=K5JxN+D5yiFfiUOKzd8yb8t8sr
	OKW6GA2z/hVL5E+rIMqqMLin81Co1MjImdPFYuYbJ+BFqMnyyjjeKJTWawMcl+0Mkh58COf4TMTLs
	L32PfJaPxeiwxETQu0Y42IDIzZcquLWJAavlSwklZlRqJ8xZ3EhdHUM21XHcR5NNEKxjrL+R2Qife
	6FpUjydnWOp4c2TBBViWl/0V7kWIe9anQESgFSHLqHlMiyvGzSOFXcQi1Ly68X3i+xOfdHi2yqGBE
	7aEAgrVbKTW96DSyatruCdqezi+0i+9UkGRFbnzxLan2Wsy6hq3rqdBysNCTeIZ4t3Qb2zIJxZAy4
	tFSMXKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE4Gu-00000004xc6-2YzF;
	Sat, 18 Apr 2026 11:55:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE4Gq-00000004xbl-2NnD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 11:55:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82A901A32;
	Sat, 18 Apr 2026 04:55:22 -0700 (PDT)
Received: from arm.com (unknown [10.57.89.252])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7AE3F7B4;
	Sat, 18 Apr 2026 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776513328; bh=VqmTXRTORJkbDoNWA9yhBVoDBff2QWw2M+4+UlpEc/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWYTDNqDGl9Su3Lk8W7qmydTSHNzPJvnRJbmi5jeNZzilHwMXIGBztncdBPA0lqBx
	 UZETXjlo6Shd9bTdjAdfuiv9kbShKklGLF6qOKdTrs8wML72BaNd7AVbn9+sOOAl6a
	 jiN2ggL+csRfhVhuJwZFNjPfWaehcxFIJhjc4/20=
Date: Sat, 18 Apr 2026 12:55:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: tglx@kernel.org, peterz@infradead.org, sudeep.holla@kernel.org,
	yangyicong@hisilicon.com, dietmar.eggemann@arm.com,
	Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <aeNxKpHzTQX4_kId@arm.com>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417075534.3745793-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_045532_783580_5AB02813 
X-CRM114-Status: GOOD (  30.47  )
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

+ James Morse, linux-arm-kernel

On Fri, Apr 17, 2026 at 03:55:34PM +0800, Jinjie Ruan wrote:
> When booting with `maxcpus` greater than the number of present CPUs (e.g.,
> QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present' but have not
> yet been registered via register_cpu(). Consequently, the per-cpu device
> objects for these CPUs are not yet initialized.
> 
> In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
> _cpu_up() for these unregistered CPUs eventually leads to
> sysfs_create_group() being called with a NULL kobject (or a kobject
> without a directory), triggering the following warning in
> fs/sysfs/group.c:
> 
> 	if (WARN_ON(!kobj || (!update && !kobj->sd)))
> 		return -EINVAL;
> 
> Fix this by adding a check for get_cpu_device(cpu). This ensures that
> SMT is only enabled for CPUs that have successfully completed their
> base device registration in sysfs.
> 
> How to reproduce:
> 
> 	1. echo off > /sys/devices/system/cpu/smt/control
> 		psci: CPU1 killed (polled 0 ms)
> 		psci: CPU3 killed (polled 0 ms)
> 
> 	2. echo 2 > /sys/devices/system/cpu/smt/control
> 
> 	Detected PIPT I-cache on CPU1
> 	GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
> 	CPU1: Booted secondary processor 0x0000000001 [0x410fd082]
> 	Detected PIPT I-cache on CPU3
> 	GICv3: CPU3: found redistributor 3 region 0:0x0000000008100000
> 	CPU3: Booted secondary processor 0x0000000003 [0x410fd082]
> 	------------[ cut here ]------------
> 	WARNING: fs/sysfs/group.c:137 at internal_create_group+0x41c/0x4bc, CPU#2: sh/181
> 	Modules linked in:
> 	CPU: 2 UID: 0 PID: 181 Comm: sh Not tainted 7.0.0-rc1-00010-g8d13386c7624 #142 PREEMPT
> 	Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
> 	pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : internal_create_group+0x41c/0x4bc
> 	lr : sysfs_create_group+0x18/0x24
> 	sp : ffff80008078ba40
> 	x29: ffff80008078ba40 x28: ffff296c980ad000 x27: ffff00007fb94128
> 	x26: 0000000000000054 x25: ffffd693e845f3f0 x24: 0000000000000001
> 	x23: 0000000000000001 x22: 0000000000000004 x21: 0000000000000000
> 	x20: ffffd693e845fc10 x19: 0000000000000004 x18: 00000000ffffffff
> 	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> 	x14: 0000000000000358 x13: 0000000000000007 x12: 0000000000000350
> 	x11: 0000000000000008 x10: 0000000000000407 x9 : 0000000000000400
> 	x8 : ffff00007fbf3b60 x7 : 0000000000000000 x6 : ffffd693e845f3f0
> 	x5 : ffff00007fb94128 x4 : 0000000000000000 x3 : ffff000000f4eac0
> 	x2 : ffffd693e7095a08 x1 : 0000000000000000 x0 : 0000000000000000
> 	Call trace:
> 	 internal_create_group+0x41c/0x4bc (P)
> 	 sysfs_create_group+0x18/0x24
> 	 topology_add_dev+0x1c/0x28
> 	 cpuhp_invoke_callback+0x104/0x20c
> 	 __cpuhp_invoke_callback_range+0x94/0x11c
> 	 _cpu_up+0x200/0x37c
> 	 cpuhp_smt_enable+0xbc/0x114
> 	 control_store+0xe8/0x1d4
> 	 dev_attr_store+0x18/0x2c
> 	 sysfs_kf_write+0x7c/0x94
> 	 kernfs_fop_write_iter+0x128/0x1b8
> 	 vfs_write+0x2b0/0x354
> 	 ksys_write+0x68/0xfc
> 	 __arm64_sys_write+0x1c/0x28
> 	 invoke_syscall+0x48/0x10c
> 	 el0_svc_common.constprop.0+0x40/0xe8
> 	 do_el0_svc+0x20/0x2c
> 	 el0_svc+0x34/0x124
> 	 el0t_64_sync_handler+0xa0/0xe4
> 	 el0t_64_sync+0x198/0x19c
> 	---[ end trace 0000000000000000 ]---
> 
> Cc: stable@vger.kernel.org
> Fixes: eed4583bcf9a6 ("arm64: Kconfig: Enable HOTPLUG_SMT")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  kernel/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index bc4f7a9ba64e..df725d92ad4f 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -2706,6 +2706,13 @@ int cpuhp_smt_enable(void)
>  	cpu_maps_update_begin();
>  	cpu_smt_control = CPU_SMT_ENABLED;
>  	for_each_present_cpu(cpu) {
> +		/*
> +		 * Skip CPUs that have not been registered in sysfs yet.
> +		 * This avoids triggering NULL kobject warnings for maxcpus.
> +		 */
> +		if (!get_cpu_device(cpu))
> +			continue;
> +
>  		/* Skip online CPUs and CPUs on offline nodes */
>  		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
>  			continue;

I spent some time trying to understand how we can get into this
situation. It seems to be an ACPI only thing.

Since commit eba4675008a6 ("arm64: arch_register_cpu() variant to check
if an ACPI handle is now available.") as part of the virtual CPU hotplug
series, arch_register_cpu() can defer registering the CPU devices. IIUC
this is done later via acpi_processor_hotadd_init(). smp_prepare_cpus(),
however, still marks them as present.

cpuhp_smt_enable(), if triggered later, walks the present cpus and
attempts _cpu_up(). cpuhp_up_callbacks() will call topology_add_dev()
(registered as a CPUHP_TOPOLOGY_PREPARE callback) and warn since
get_cpu_device() returns NULL. I think this can't happen during early
_cpu_up() calls since smp_init() is called before the topology callback
has been registered (slightly later during do_basic_setup()).

I'm not sure what the best fix should be. If we go with something along
the lines of the above, I wonder whether we should instead return an
error in the topology_add_dev() callback if get_cpu_device() returns
NULL. It feels a bit wrong to add a check for sysfs in
cpuhp_smt_enable() just because of some callbacks attempted by
_cpu_up(). There's precedent in cpu_capacity_sysctl_add() returning
-ENOENT. However, this messes up the smt control enabling since
cpuhp_smt_enable() will bail out early and return an error.

Another option would have been to avoid marking such CPUs present but I
think this will break other things. Yet another option is to register
all CPU devices even if they never come up (like maxcpus greater than
actual CPUs).

Opinions? It might be an arm64+ACPI-only thing.

-- 
Catalin

