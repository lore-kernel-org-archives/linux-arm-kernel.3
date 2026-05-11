Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E35CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EheeGE/p+1J8j8QYjiEv5mhShPe0v0QRETFOv0WgVms=; b=cKNw14zl823syt9olF+lIKVchM
	uMHrZYsKCYvjtv1YF7PKxIRGqTTlooVUlsGVFcJhdJki6MEJfWuE5pkCYfhT9oam3If/2nlYLwPXK
	ADx3tXmfGxUOOe/1QcPrem8slRJEzCjujMmA/061Ut29N50by2QEKxVkWRENNw934e2b/4icdrN23
	BaIjWTFz0ovELNumsbNmborgG91dECSSFKbldbI6Y4nD1X6ivrVBLXkZBRuwoT1o+c2xybq1NMCoy
	wNV1zbQnAhMmHWIR/gWvybo4DLBErwS/tpeuHOrpJtOqpYjSoeJoexsMX9t8P/ctutUsniVoYctOx
	/EZ1jecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNMi-0000000D1Su-453S;
	Mon, 11 May 2026 09:55:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNMg-0000000D1SH-2Ksx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6274A16F2;
	Mon, 11 May 2026 02:55:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DB663F85F;
	Mon, 11 May 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778493350; bh=tcU3HJufotj/UvR3tN2iq7lgKLHXjVobKvi7RTv0g60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2VudrBuK0ncaD4uyM46moXZO64SF3RTMJlMOuI9FeKk9p4IzD3Fa0Y2+sxPKMZHM
	 eprWHXHGM7KNxPHLiUFkwUk2z7cGKqysVzwo6qqGyPzwWT01FJt1Qx260WgbYYPoUx
	 2GqoDDr6dbNowU1WZsHp6Jfb6MJZSYifqtg0gBQQ=
Date: Mon, 11 May 2026 10:55:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, punit.agrawal@oss.qualcomm.com,
	rafael.j.wysocki@intel.com, fengchengwen@huawei.com,
	chenl311@chinatelecom.cn, suzuki.poulose@arm.com, maz@kernel.org,
	timothy.hayes@arm.com, lpieralisi@kernel.org,
	mrigendra.chaubey@gmail.com, arnd@arndb.de, sudeep.holla@kernel.org,
	yangyicong@hisilicon.com, jic23@kernel.org, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH v2] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <agGnonc5n64ct72T@arm.com>
References: <20260427023507.1247418-1-ruanjinjie@huawei.com>
 <54093ddf-e237-4cc0-9fe1-2989916c1f72@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54093ddf-e237-4cc0-9fe1-2989916c1f72@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_025554_696283_B7EE30C7 
X-CRM114-Status: GOOD (  27.94  )
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

On Mon, May 11, 2026 at 11:17:43AM +0800, Jinjie Ruan wrote:
> On 4/27/2026 10:35 AM, Jinjie Ruan wrote:
> > On arm64, when booting with `maxcpus` greater than the number of present
> > CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
> > but have not yet been registered via register_cpu(). Consequently,
> > the per-cpu device objects for these CPUs are not yet initialized.
> > 
> > In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
> > _cpu_up() for these unregistered CPUs eventually leads to
> > sysfs_create_group() being called with a NULL kobject (or a kobject
> > without a directory), triggering the following warning in
> > fs/sysfs/group.c:
> > 
> > 	if (WARN_ON(!kobj || (!update && !kobj->sd)))
> > 		return -EINVAL;
> > 
> > When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
> > enumerated CPUs as "present" regardless of their status in the MADT. This
> > causes issues with SMT hotplug control. For instance, with QEMU's
> > "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
> > follows: the first four CPUs are marked Enabled while the remaining four
> > are marked Online Capable to support potential hot-plugging.
> > 
> > Fix this by:
> > 
> > 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
> >    entry before calling set_cpu_present() during SMP initialization.
> > 
> > 2. Properly managing the present mask in acpi_map_cpu() and
> >    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
> >    other architectures like x86 and LoongArch.
> > 
> > This ensures that only physically available or explicitly enabled CPUs
> > are in the present mask, keeping the SMT control logic consistent with
> > the actual hardware state.
> > 
> > How to reproduce:
> > 
> > 	1. echo off > /sys/devices/system/cpu/smt/control
> > 		psci: CPU1 killed (polled 0 ms)
> > 		psci: CPU3 killed (polled 0 ms)
> > 
> > 	2. echo 2 > /sys/devices/system/cpu/smt/control
> > 
> > 	Detected PIPT I-cache on CPU1
> > 	GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
> > 	CPU1: Booted secondary processor 0x0000000001 [0x410fd082]
> > 	Detected PIPT I-cache on CPU3
> > 	GICv3: CPU3: found redistributor 3 region 0:0x0000000008100000
> > 	CPU3: Booted secondary processor 0x0000000003 [0x410fd082]
> > 	------------[ cut here ]------------
> > 	WARNING: fs/sysfs/group.c:137 at internal_create_group+0x41c/0x4bc, CPU#2: sh/181
> > 	Modules linked in:
> > 	CPU: 2 UID: 0 PID: 181 Comm: sh Not tainted 7.0.0-rc1-00010-g8d13386c7624 #142 PREEMPT
> > 	Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
> > 	pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > 	pc : internal_create_group+0x41c/0x4bc
> > 	lr : sysfs_create_group+0x18/0x24
> > 	sp : ffff80008078ba40
> > 	x29: ffff80008078ba40 x28: ffff296c980ad000 x27: ffff00007fb94128
> > 	x26: 0000000000000054 x25: ffffd693e845f3f0 x24: 0000000000000001
> > 	x23: 0000000000000001 x22: 0000000000000004 x21: 0000000000000000
> > 	x20: ffffd693e845fc10 x19: 0000000000000004 x18: 00000000ffffffff
> > 	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > 	x14: 0000000000000358 x13: 0000000000000007 x12: 0000000000000350
> > 	x11: 0000000000000008 x10: 0000000000000407 x9 : 0000000000000400
> > 	x8 : ffff00007fbf3b60 x7 : 0000000000000000 x6 : ffffd693e845f3f0
> > 	x5 : ffff00007fb94128 x4 : 0000000000000000 x3 : ffff000000f4eac0
> > 	x2 : ffffd693e7095a08 x1 : 0000000000000000 x0 : 0000000000000000
> > 	Call trace:
> > 	 internal_create_group+0x41c/0x4bc (P)
> > 	 sysfs_create_group+0x18/0x24
> > 	 topology_add_dev+0x1c/0x28
> > 	 cpuhp_invoke_callback+0x104/0x20c
> > 	 __cpuhp_invoke_callback_range+0x94/0x11c
> > 	 _cpu_up+0x200/0x37c
> > 	 cpuhp_smt_enable+0xbc/0x114
> > 	 control_store+0xe8/0x1d4
> > 	 dev_attr_store+0x18/0x2c
> > 	 sysfs_kf_write+0x7c/0x94
> > 	 kernfs_fop_write_iter+0x128/0x1b8
> > 	 vfs_write+0x2b0/0x354
> > 	 ksys_write+0x68/0xfc
> > 	 __arm64_sys_write+0x1c/0x28
> > 	 invoke_syscall+0x48/0x10c
> > 	 el0_svc_common.constprop.0+0x40/0xe8
> > 	 do_el0_svc+0x20/0x2c
> > 	 el0_svc+0x34/0x124
> > 	 el0t_64_sync_handler+0xa0/0xe4
> > 	 el0t_64_sync+0x198/0x19c
> > 	---[ end trace 0000000000000000 ]---
> 
> Hi, just a gentle ping on this v2 patch. It’s been about two weeks, and
> I was wondering if there are any further comments or if there's anything
> else I should address? Thanks!

No comments from me but I'd like James Morse to review, in case he
recalls the decisions made at the time. I think Jonathan already said
that he doesn't fully remember.

Given that it's just a warning rather than some kernel panic, I'm happy
to wait until the upcoming merging window (for 7.2). In the meantime:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

