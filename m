Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5914D0E6F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujarf0HhLd0YUbNiTzYBNfsZtAIBvfeqtU76RofDTew=; b=EmeJrPONcavN2mWIC1Mf4QAiNP
	/kP7tZ2G+9Vi7YV+yWm12BxCGsIj+vlWE+8EqDYHzxBMKQG1WTYB/Glny6EBWyBiWbjrmTjMd8OFP
	5aMcKxD0aMsq7doG8e6Clm0/o1eltBCUSZFbQLHrWG1Ix3vfdGXpENM0aEMGgkmbaEJ5Aj8B67Uik
	tkmaffIehKZPW/WcKj161Jt4TAoIPXMj1rkf5AxiJfv8U601Ud1+gAwMtJBkgtiurEBwsHcDe/i4B
	GJmJ0CWtRhVTrvGvWm9XlildkQxpZL7xn4h2vhP7zwatFjny5NISYZbsuucbNzlNDf/vSuX9hMZKs
	QQsGHR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvV1-0000000DY0G-2hoa;
	Tue, 25 Nov 2025 16:02:39 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvUy-0000000DXz8-2Y4B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ujarf0HhLd0YUbNiTzYBNfsZtAIBvfeqtU76RofDTew=; b=aXmDuS9atrcFgVvKmBnzcQmoZq
	Zs5GjYNJ3IoaqY/v/uk+jaWaLmnUJUUb9M3XGpuxHmwMhL1LKNrLtLAySNO4T8hkxT8ZrO+6PFZa7
	sBvGgGlyat0YpoCMHF0mppYhRcgfPlzWRCKFTe7S2fM30oCdHqmk7cXOiNNiuojScDwvd7DMalWHP
	X0F8VxuIKRAFwotSUPdq4QtBcZTHZMP28jbSb24R8qK3yDsi9NgPrh6pd9Zj+tDdAcP8jhcb+REXw
	6zEn5sTlLweSbLM4O52/Mi7zC08QaP1wsIUX4v3alBOEHVaC3sii9eEe/NH94q0WZFv5vkkKlkNCU
	D7F3PuiQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vNvUj-003Vwc-JH; Tue, 25 Nov 2025 16:02:21 +0000
Date: Tue, 25 Nov 2025 08:02:16 -0800
From: Breno Leitao <leitao@debian.org>
To: john.ogness@linutronix.de, pmladek@suse.com, linux@armlinux.org.uk, 
	paulmck@kernel.org
Cc: usamaarif642@gmail.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	rmikey@meta.com
Subject: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_080236_656467_5F694191 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

Hello,

I am reporting a CSD lockup issue that occurs during kexec on ARM64 hosts,
which I have traced to the amba-pl011 serial driver waiting for hardware with
IRQs disabled in the nbcon atomic write path.


PROBLEM SUMMARY:
================
During kexec, a CSD lockup occurs when pl011_console_write_atomic() performs
an unbounded busy-wait for hardware synchronization while IRQs are disabled.
This blocks other CPUs for extended periods (>11 seconds observed), triggering
CSD lock timeouts.


KERNEL VERSION:
===============
Observed on kernel 6.13, but the code path appears similar in upstream.


ERROR MESSAGE:
==============
  mlx5_core 0000:03:00.0: Shutdown was called
  kvm: exiting hardware virtualization
  arm-smmu-v3 arm-smmu-v3.10.auto: CMD_SYNC timeout at 0x00000103 [hwprod 0x00000104, hwcons 0x00000102]
  smp: csd: Detected non-responsive CSD lock (#1) on CPU#4, waiting 5000000032 ns for CPU#00 do_nothing (kernel/smp.c:1057)
  smp:     csd: CSD lock (#1) unresponsive.
  Sending NMI from CPU 4 to CPUs 0:
  NMI backtrace for cpu 0
  pstate: 03401009 (nzcv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
  pc : pl011_console_write_atomic (./arch/arm64/include/asm/vdso/processor.h:12 drivers/tty/serial/amba-pl011.c:2540)
  lr : pl011_console_write_atomic (drivers/tty/serial/amba-pl011.c:292 drivers/tty/serial/amba-pl011.c:298 drivers/tty/serial/amba-pl011.c:2539)
  sp : ffff80010e26fae0
  pmr: 000000c0
  x29: ffff80010e26fae0 x28: ffff800082ddb000 x27: 00000000000000e0
  x26: 0000000000000001 x25: ffff8000826a8de8 x24: 00000000000008eb
  x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
  x20: ffff00009c19c880 x19: ffff80010e26fb88 x18: 0000000000000018
  x17: 696f70646e452065 x16: 4943502032303830 x15: 3130783020737361
  x14: 6c63203030206570 x13: 746e696f70646e45 x12: 0000000000000000
  x11: 0000000000000008 x10: 0000000000000000 x9 : ffff800081888d80
  x8 : 0000000000000018 x7 : 205d313332363336 x6 : 362e31202020205b
  x5 : ffff000097d4700f x4 : ffff80010e26f99f x3 : ffff800081125220
  x2 : 0000000000000052 x1 : 000000000000000a x0 : ffff00009c19c880
  Call trace:
  pl011_console_write_atomic (./arch/arm64/include/asm/vdso/processor.h:12 drivers/tty/serial/amba-pl011.c:2540) (P)
  nbcon_emit_next_record (kernel/printk/nbcon.c:1049)
  __nbcon_atomic_flush_pending_con (kernel/printk/nbcon.c:1517)
  __nbcon_atomic_flush_pending.llvm.15488114865160659019 (./arch/arm64/include/asm/alternative-macros.h:254 ./arch/arm64/include/asm/cpufeature.h:808 ./arch/arm64/include/asm/irqflags.h:192 kernel/printk/nbcon.c:1562 kernel/printk/nbcon.c:1612)
  nbcon_atomic_flush_pending (kernel/printk/nbcon.c:1629)
  printk_kthreads_shutdown (kernel/printk/printk.c:?)
  syscore_shutdown (drivers/base/syscore.c:120)
  kernel_kexec (kernel/kexec_core.c:1045)
  __arm64_sys_reboot (kernel/reboot.c:794 kernel/reboot.c:722 kernel/reboot.c:722)
  invoke_syscall (arch/arm64/kernel/syscall.c:50)
  el0_svc_common.llvm.14158405452757855239 (arch/arm64/kernel/syscall.c:?)
  do_el0_svc (arch/arm64/kernel/syscall.c:152)
  el0_svc (./arch/arm64/include/asm/alternative-macros.h:254 ./arch/arm64/include/asm/cpufeature.h:808 ./arch/arm64/include/asm/irqflags.h:73 arch/arm64/kernel/entry-common.c:169 arch/arm64/kernel/entry-common.c:182 arch/arm64/kernel/entry-common.c:749)
  el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:820)
  el0t_64_sync (arch/arm64/kernel/entry.S:600)
  smp: csd: Re-sending CSD lock (#1) IPI from CPU#04 to CPU#00
  Workqueue: events_unbound toggle_allocation_gate

  Call trace:
  show_stack (arch/arm64/kernel/stacktrace.c:503) (C)
  dump_stack_lvl (lib/dump_stack.c:122)
  smp_call_function_many_cond.llvm.3022501501692466737 (lib/dump_stack.c:? kernel/smp.c:305 kernel/smp.c:326 kernel/smp.c:336 kernel/smp.c:884)
  kick_all_cpus_sync (kernel/smp.c:1076)
  __jump_label_update (kernel/jump_label.c:522)
  jump_label_update (kernel/jump_label.c:921)
  static_key_enable_cpuslocked (kernel/jump_label.c:?)
  toggle_allocation_gate (kernel/jump_label.c:224 mm/kfence/core.c:849)
  process_scheduled_works (kernel/workqueue.c:3245 kernel/workqueue.c:3321)
  worker_thread (./include/linux/list.h:373 kernel/workqueue.c:950 kernel/workqueue.c:3403)
  kthread (kernel/kthread.c:391)
  ret_from_fork (arch/arm64/kernel/entry.S:863)
  smp: csd: CSD lock (#1) got unstuck on CPU#04, CPU#00 released the lock.
  kexec_core: Starting new kernel


ROOT CAUSE ANALYSIS:
====================
The issue occurs through the following sequence:

1. System initiates kexec shutdown on an ARM64 host
2. NBCON enters atomic mode during shutdown (printk_kthreads_shutdown)
3. NBCON calls pl011_console_write_atomic() with the following call path:

   local_irq_save()
     __nbcon_atomic_flush_pending_con()
       pl011_console_write_atomic()

4. Inside pl011_console_write_atomic(), the driver performs an unbounded
busy-wait for the hardware to become ready before leaving ->write_atomic()

   while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
       cpu_relax();            // drivers/tty/serial/amba-pl011.c:2540

5. With IRQs disabled, this busy-wait blocks the CPU for >11 seconds waiting
for the hardware to clear its busy state.

6. Meanwhile, kfence's toggle_allocation_gate() on another CPU attempts to
perform a synchronous operation across all CPUs, which correctly triggers a CSD
lock timeout because CPU#0 is stuck in the busy loop with IRQs disabled.

NOTES:
======

This is slightly similar to a report I gave a while ago [1] that got
fixed by Petr's a7df4ed0af77 ("printk: Allow to use the printk kthread
immediately even for 1st nbcon")

https://lore.kernel.org/all/aGVn%2FSnOvwWewkOW@gmail.com/

QUESTION
========

1) Should nbcon wait for hardware synchronizations with IRQ disabled?
2) Can the hardware synchronization be moved of the IRQ disabled path?

Thanks
--breno

