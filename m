Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA7C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uitd6oh6KCpbNrNNeOPO+tzBZw/kd9RgRigYJVdjhfM=; b=ZB7kmxez0343tqc7wKsZxMgmgh
	Bj9aJH3XjxSdvrB6G3BEIYHFmIa6fgr9i4rbhBWHbHZPZPDbmNk0siC65XMET/5KG91yyI2fZ2DF5
	4/uQpRZxDu5nwliiK5OM8flbuYgnAo8XABnY2oIAF+QnBeUjdl6n9LyGHh7AVbmhLuol0r9wK3PfT
	WwjW0txYUdNXM34hxvBIPIJRj/z1ZdQWoyy+5A8A3MZ3bqfxvgx2P6ik/uUAkSG0P8arXdoiMQE1y
	SC4wYIM0RKx64i3D+NSqKRajNdr/9zkJ3tqOlNaHxh5tdMHZGG8srV0t0UnS6h5kXpd3EG2DqqmTO
	WqsZFwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9qT-00000001bvy-36PW;
	Mon, 30 Jun 2025 08:26:33 +0000
Received: from jpms-ob01-os7.noc.sony.co.jp ([2001:cf8:acf:41::7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9lq-00000001bHr-03cD;
	Mon, 30 Jun 2025 08:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1751271706; x=1782807706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uitd6oh6KCpbNrNNeOPO+tzBZw/kd9RgRigYJVdjhfM=;
  b=sR56bwsXgniv3TFeOh0Tpx4ay6jxssKSdNiANbZsHcjrhV/MZzbR4OId
   pS0qLUqpvTPbr5VOSHMQrslhZZw8pye+qLBMDiPo4ZkUprCPsSeea0FCO
   BKmJj+BxiATmxRba72tDlkmJpyBPbA06D5hn0kY8DAAx4ojVb+yDTcI+J
   A22FXI+38ZrxXXy3ha2twS9SN8G2GXT2fBpe0TqZGmhibSsrZW5nTGc1b
   xuBVWgGKFbyZNE71ehOPZurBvtNcTcz1f701QgsG+02d8khmvzHC87Kze
   p4+KT1+0L4yKrHDgw2Lo86nDpzOLVofKoC03bHdywAEJHINbli5Z2/5+0
   A==;
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 17:21:38 +0900
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="2622884"
Received: from unknown (HELO JPC00244420..) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 30 Jun 2025 17:21:37 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	James Morse <james.morse@arm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: [RFC PATCH] kernel/cpu: in freeze_secondary_cpus() ensure primary cpu is of domain type
Date: Mon, 30 Jun 2025 17:20:59 +0900
Message-ID: <20250630082103.829352-1-shashank.mahadasyam@sony.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_012146_274446_E4E54598 
X-CRM114-Status: GOOD (  29.39  )
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

On an x86 machine, when cpu 0 is isolated with "isolcpus=", on initiating
suspend to memory, a warning is triggered, followed by a kernel crash. This is
on a defconfig + CONFIG_ENERGY_MODEL kernel:

$ cat /proc/version
Linux version 6.16.0-rc4 (shashank@machine) (gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #56 SMP PREEMPT_DYNAMIC Mon Jun 30 16:27:42 JST 2025
$ cat /proc/cmdline
kernel-6.16-rc4 console=tty0 initrd=ramdisk.cpio.lz4 console=ttyS4,115200n8 no_console_suspend ignore_loglevel isolcpus=0
$ echo mem > /sys/power/state
[  124.899083] PM: suspend entry (deep)
    <snip>
[  125.169816] smpboot: CPU 2 is now offline
[  125.174167] ------------[ cut here ]------------
[  125.178838] WARNING: CPU: 1 PID: 20 at kernel/sched/topology.c:2459 build_sched_domains+0x1246/0x1550
[  125.188117] Modules linked in:
[  125.191232] CPU: 1 UID: 0 PID: 20 Comm: cpuhp/1 Tainted: G S                  6.16.0-rc4 #56 PREEMPT(voluntary)
[  125.201453] Tainted: [S]=CPU_OUT_OF_SPEC
    <snip>
[  125.303753] Call Trace:
[  125.306248]  <TASK>
[  125.308394]  ? cpu_attach_domain+0x3f1/0x730
[  125.312710]  ? __kmalloc_cache_noprof+0x26a/0x300
[  125.317465]  partition_sched_domains+0x294/0x7f0
[  125.322136]  cpuset_reset_sched_domains+0x1e/0x30
[  125.326893]  sched_cpu_deactivate+0x11d/0x160
[  125.331298]  ? __pfx_sched_cpu_deactivate+0x10/0x10
[  125.336225]  cpuhp_invoke_callback+0x107/0x470
[  125.340714]  ? __pfx_smpboot_thread_fn+0x10/0x10
[  125.345385]  cpuhp_thread_fun+0xdb/0x160
[  125.349352]  smpboot_thread_fn+0xeb/0x220
[  125.353411]  kthread+0xf3/0x1f0
[  125.356600]  ? __pfx_kthread+0x10/0x10
[  125.360402]  ? __pfx_kthread+0x10/0x10
[  125.364204]  ret_from_fork+0x7d/0xd0
[  125.367832]  ? __pfx_kthread+0x10/0x10
[  125.371634]  ret_from_fork_asm+0x1a/0x30
[  125.375614]  </TASK>
[  125.377848] ---[ end trace 0000000000000000 ]---
[  125.382511] BUG: unable to handle page fault for address: 0000000087520483
[  125.389436] #PF: supervisor read access in kernel mode
[  125.394613] #PF: error_code(0x0000) - not-present page
[  125.399800] PGD 0 P4D 0
[  125.402374] Oops: Oops: 0000 [#1] SMP NOPTI
[  125.406601] CPU: 1 UID: 0 PID: 20 Comm: cpuhp/1 Tainted: G S      W           6.16.0-rc4 #56 PREEMPT(voluntary)
[  125.416819] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
    <snip>
[  125.430828] RIP: 0010:partition_sched_domains+0x36d/0x7f0
[  125.436265] Code: 02 00 48 8b 4d 00 41 bc 01 00 00 00 4c 89 c0 74 a0 b8 40 00 00 00 48 85 c9 74 05 f3 48 0f bc c1 48 98 48 8b 04 c5 e0 bb 85 86 <4e> 8b bc 30 c0 0a 00 00 8b 05 f5 8f 75 01 85 c0 0f 84 090
[  125.455082] RSP: 0018:ffffb185001dfd90 EFLAGS: 00010246
[  125.460352] RAX: 0000000100000003 RBX: ffff98ac9cae6cd0 RCX: 0000000000000000
[  125.467529] RDX: 0000000000000000 RSI: ffff98ac80bf1ed8 RDI: 0000000000000040
[  125.474715] RBP: ffff98ac9cae6cc8 R08: ffff98ac80bf1ed0 R09: fffffffffffffffe
[  125.481894] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
[  125.489070] R13: 0000000000000001 R14: ffffffff8751f9c0 R15: 0000000000000004
[  125.496248] FS:  0000000000000000(0000) GS:ffff98b068749000(0000) knlGS:0000000000000000
[  125.504379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  125.510166] CR2: 0000000087520483 CR3: 0000000122f01004 CR4: 0000000000f70ef0
[  125.517351] PKRU: 55555554
[  125.520097] Call Trace:
[  125.522590]  <TASK>
[  125.524733]  cpuset_reset_sched_domains+0x1e/0x30
[  125.529484]  sched_cpu_deactivate+0x11d/0x160
[  125.533894]  ? __pfx_sched_cpu_deactivate+0x10/0x10
[  125.538814]  cpuhp_invoke_callback+0x107/0x470
[  125.543305]  ? __pfx_smpboot_thread_fn+0x10/0x10
[  125.547971]  cpuhp_thread_fun+0xdb/0x160
[  125.551933]  smpboot_thread_fn+0xeb/0x220
[  125.555991]  kthread+0xf3/0x1f0
[  125.559174]  ? __pfx_kthread+0x10/0x10
[  125.562966]  ? __pfx_kthread+0x10/0x10
[  125.566758]  ret_from_fork+0x7d/0xd0
[  125.570383]  ? __pfx_kthread+0x10/0x10
[  125.574184]  ret_from_fork_asm+0x1a/0x30
[  125.578149]  </TASK>
[  125.580382] Modules linked in:
[  125.583485] CR2: 0000000087520483
[  125.586853] ---[ end trace 0000000000000000 ]---
[  125.591507] RIP: 0010:partition_sched_domains+0x36d/0x7f0
[  125.596954] Code: 02 00 48 8b 4d 00 41 bc 01 00 00 00 4c 89 c0 74 a0 b8 40 00 00 00 48 85 c9 74 05 f3 48 0f bc c1 48 98 48 8b 04 c5 e0 bb 85 86 <4e> 8b bc 30 c0 0a 00 00 8b 05 f5 8f 75 01 85 c0 0f 84 090
[  125.615763] RSP: 0018:ffffb185001dfd90 EFLAGS: 00010246
[  125.621032] RAX: 0000000100000003 RBX: ffff98ac9cae6cd0 RCX: 0000000000000000
[  125.628211] RDX: 0000000000000000 RSI: ffff98ac80bf1ed8 RDI: 0000000000000040
[  125.635390] RBP: ffff98ac9cae6cc8 R08: ffff98ac80bf1ed0 R09: fffffffffffffffe
[  125.642568] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
[  125.649745] R13: 0000000000000001 R14: ffffffff8751f9c0 R15: 0000000000000004
[  125.656923] FS:  0000000000000000(0000) GS:ffff98b068749000(0000) knlGS:0000000000000000
[  125.665054] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  125.670849] CR2: 0000000087520483 CR3: 0000000122f01004 CR4: 0000000000f70ef0
[  125.678026] PKRU: 55555554
[  125.680773] note: cpuhp/1[20] exited with irqs disabled

This happens because in order to offline the last secondary cpu, i.e. cpu 1,
build_sched_domains() ends up being passed an empty cpumask, since the only remaining
cpu (cpu 0) is isolated. It warns and fails, after which perf domains are
are attempted to be built, which crashes the kernel. The same problem occurs
during cpu hotplug, but that was fixed by
commit 38685e2a0476127d ("cpu/hotplug: Don't offline the last non-isolated CPU").

Fix this by ensuring that the primary cpu, the last standing cpu, is of domain
type, so that build_sched_domains() is not passed an empty cpumask.

---

While this patch fixes the panic, I do have some questions about the code its
concerned with:

1. build_sched_domains() returns an error code, but none of its callers do
   anything meaningful with it. partition_sched_domains_locked() calls it, and
   ignores the return value. sched_init_domains() calls it, does return its
   error code, but its caller sched_init_smp() ignores the return value. So, in
   all the call chains leading to build_sched_domains(), its return value
   is ignored.

   So, is any failure in build_sched_domains() so fatal that it should crash
   the kernel, or should its callers actually handle the error?

2. This concerns the following snippet of freeze_secondary_cpus():

        if (primary == -1) {
            primary = cpumask_first(cpu_online_mask);
            if (!housekeeping_cpu(primary, HK_TYPE_TIMER))
                primary = housekeeping_any_cpu(HK_TYPE_TIMER);
        } else {
            if (!cpu_online(primary))
                primary = cpumask_first(cpu_online_mask);
        }

    suspend_disable_secondary_cpus() calls freeze_secondary_cpus() with primary = -1,
    if CONFIG_PM_SLEEP_SMP_NONZERO_CPU, and primary = 0 otherwise. On x86 and arm64,
    for example, it's called with primary = 0. In the primary != -1 branch, why
    isn't primary checked for HK_TYPE_TIMER as is done in the primary == 1 branch?
    On x86 this is fine, since it doesn't advertise ARCH_SUSPEND_NONZERO_CPU,
    cpu 0 will be removed out of the nohz_full mask even if it's specified. And it
    also cannot be offlined. So on x86, the primary cpu will always be online and
    non-nohz_full. But on arm64, for example, cpu 0 _can_ be offlined. So
    cpumask_first(cpu_online_mask) will find the next online cpu, which may not
    be non-nohz_full.

    Also, why the requirement for the primary cpu to be of HK_TYPE_TIMER?

3. Referring to the above snippet of freeze_secondary_cpus(), if a primary cpu
   is specified and it's offline, why are we trying to find another online cpu?
   The caller specified a primary cpu because that's the one they want. If they
   wanted any ol' online cpu to be primary, they could have passed -1. If we look
   at all the callers of freeze_secondary_cpus():

   (a) riscv's hibernate_resume_nonboot_cpu_disable() calls with sleep_cpu, which is
       the cpu the system hibernated on. This call doesn't rely on the "if the
       specified primary is offline, then find another online cpu" fallback
       behavior because sleep_cpu is online'd, if required, by bringup_hibernate_cpu()
       in arch_hibernation_header_restore() before
       hibernate_resume_nonboot_cpu_disable() is called.

   (b) arm64's case is the same as riscv. Again, no reliance on the fallback.

   (c) x86's hibernate_resume_nonboot_cpu_disable() calls with an explicit 0. Again,
       no reliance on the fallback since cpu 0 cannot be offlined on x86.

   (d) suspend_disable_secondary_cpus() calls it with 0 if CONFIG_PM_SLEEP_SMP_NONZERO_CPU,
       and -1 otherwise. So the question is, are there architectures which rely
       on the fallback behavior even though they don't have
       CONFIG_PM_SLEEP_SMP_NONZERO_CPU? arm64 and riscv sure do. They can
       suspend/hibernate on any cpu, but they don't have CONFIG_PM_SLEEP_SMP_NONZERO_CPU.
       Shouldn't arm64 and riscv advertise ARCH_SUSPEND_NONZERO_CPU (which
       in turn enables CONFIG_PM_SLEEP_SMP_NONZERO_CPU)?

    There's possibly only one case of reliance on this fallback behavior.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 kernel/cpu.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index a59e009e0be4..d9167b0559a5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1902,12 +1902,28 @@ int freeze_secondary_cpus(int primary)
 
 	cpu_maps_update_begin();
 	if (primary == -1) {
-		primary = cpumask_first(cpu_online_mask);
-		if (!housekeeping_cpu(primary, HK_TYPE_TIMER))
-			primary = housekeeping_any_cpu(HK_TYPE_TIMER);
+		primary = cpumask_first_and_and(cpu_online_mask,
+								housekeeping_cpumask(HK_TYPE_TIMER),
+								housekeeping_cpumask(HK_TYPE_DOMAIN));
+		if (primary >= nr_cpu_ids) {
+			error = -ENODEV;
+			pr_err("No suitable primary CPU found. Ensure at least one non-isolated, non-nohz_full CPU is online\n");
+			goto abort;
+		}
 	} else {
-		if (!cpu_online(primary))
-			primary = cpumask_first(cpu_online_mask);
+		if (!cpu_online(primary)) {
+			primary = cpumask_first_and(cpu_online_mask,
+								housekeeping_cpumask(HK_TYPE_DOMAIN));
+			if (primary >= nr_cpu_ids) {
+				error = -ENODEV;
+				pr_err("No suitable primary CPU found. Ensure at least one non-isolated CPU is online\n");
+				goto abort;
+			}
+		} else if (!housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
+			error = -ENODEV;
+			pr_err("Primary CPU %d should not be isolated\n", primary);
+			goto abort;
+		}
 	}
 
 	/*
@@ -1943,6 +1959,7 @@ int freeze_secondary_cpus(int primary)
 	else
 		pr_err("Non-boot CPUs are not disabled\n");
 
+abort:
 	/*
 	 * Make sure the CPUs won't be enabled by someone else. We need to do
 	 * this even in case of failure as all freeze_secondary_cpus() users are
-- 
2.43.0


