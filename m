Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4067CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlvnQqpHzHpZc5wlSbckg3yNEUVm86sf7Hid9C2DXts=; b=FtU8SWy+HojysoVG38HCyYA9Ok
	7SmVrwcNMkJE9Wh6Z4fiib+mVHEf8UTCguS52Tw68PUFh9eE9cOycNpqji5LGKb/oeWH0/N8X9UaL
	CvuWbBQA2Du5Tia6TvRyXyKZIvmbgKAusOM8+/ahv0WrAObJyC/kDOzJULFNSLHXShJ31JhY5KFja
	sIPC/lLwLRuloGHMvSEvgf+d24oPU22XaYsimFBABtx+vRMtdIwFdr2NWxeshgf0MOCj0FmwSzsmT
	HHXd23HXvVvsucUZSp+nMZey3rV9CRPCPhR3LyOknR6L4AYVn7O5lGrve5jY6XqQ49qcPJi8CipCa
	xcyaVW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP11E-00000000cQ4-3g4S;
	Fri, 28 Nov 2025 16:08:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP11C-00000000cPT-2lIS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:08:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1137730f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 08:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764346100; x=1764950900; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlvnQqpHzHpZc5wlSbckg3yNEUVm86sf7Hid9C2DXts=;
        b=E3qQShu5vw/R7RAEKToljQfgorhZmHcKAejR+gCc+GJqkiYEbjFMl+hqvGD70qzECf
         tMLayQeutxW7C7eH2ZBl1ABCphHMIAqI3YIH9iH2u80dfDIluWgdAs2OQB/MuU8FDDnb
         PtxIhh3YZmTn43xPgFb4dL4PbTGMsBqZjMmU85IfjvcHyEvinwbzeO15mmEbSkdSfVi5
         Rq6G98QDsxvHmtNUX0sDVY2fKZs/X6UnkO2Z5WwQDSc1abvm9DrI0hS5iikSUNacZFp4
         S7AmwBE7uidYtICYcmtbqRYS4a0EMBAkJ2+1AYIvOlbFCtY/VtsizgjMMJVwIhaQcNXK
         I8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346100; x=1764950900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlvnQqpHzHpZc5wlSbckg3yNEUVm86sf7Hid9C2DXts=;
        b=o0BM7g3DhaZFeEkHwxQoEH957ybVHt6ab9HKXWQ8wp2wkl+DJRcvVweQ71wsSvWDq2
         pA/F6LSJKe485mALrdn1uJrXeWR5kNHr5Ra9Tmaojf40z+1K7bZhUVyhk6KLdw7gduwd
         eAifYWIGTfmHervXUTaf/0d70bOlcwZiAIyTsqAcd8rrf7JeLAMHYPH2iWeUBvuSsivu
         emaKwPbFUL00R7tWT24GuRDk5soR1Yz9QJkLwzkAa7+EOwrAwRlnBmIYIDdHgeBXIxRA
         79Y4p+s4OGcgqIyjNmAlVXBAxHRJSvr3Z0eBmWqM9Y7dffJo2niS9lEcQvDkYjXQjnsr
         3NRg==
X-Forwarded-Encrypted: i=1; AJvYcCUn6EP7n9UehOqLH36L0s4vwSY+F1tU4dyPQLM87h4IHr4INe78RqiKhIJY2L+oBtgaAOQ1xFzaPm/zSgTZY4N8@lists.infradead.org
X-Gm-Message-State: AOJu0YxsLATf38c43k64VAx8bSFeWfpG9EE0eZUFS1RdMo0TQ3uDBpY0
	M3v9oXGdKYOc0Iu10mOPazSFJmXPZVG13cDhrHqSTHTEfj5u5noacG0A5zV+Pz2/bJE=
X-Gm-Gg: ASbGncs4bD3xakcE0oSTQ12ctiJA2wj/ib5iDW9lBf5wo6UR2dsLhhXoDemcT2YzKek
	cJ8gqJ1FteOYQ6Q64NvKAEoytRQx1BjFkfrr+T6eOnbVLJMN7dj++ySb0CnbYN2IqvQ68pvaBEy
	L/3OtLY9PLNdL18S3ew+TENDwpniqFy22Bz5hhyIbAzBTzQ5iyG2B+XDXg7SpWCfgWu4WKIqpTb
	MmU2ZhzRv7frmgkNFDZlsx6BHlFZZslD5Eiq9kzdPXXAXTEpIecB4G5HarLh6/WkDPiaGnEEimE
	mdtAUusbfK60OY4wk5OAqtx8hOp76Zdu/EgpHWVVOOkwSQEV0On5m/5yjHcW9EYwBJWL0l2VaQm
	Y2y82artbJeh3GWZwibLl5d54jEyg1owEmSGFdc2rijr32H4uRuVLQqT5Wtdz5GHBRB7tOwalIx
	VfaaJ9L1Ospc/lzRCiNbkuly2R
X-Google-Smtp-Source: AGHT+IEwxf7vrMZ/ARlnEsM0siNe8LP0xiuo2nzKyyqUNgeFHTJlPFn7vzVLvdwjwu5OLvR7DwqN9A==
X-Received: by 2002:adf:eb0c:0:b0:42b:3aa8:ff9f with SMTP id ffacd0b85a97d-42cba7c4d7fmr29459618f8f.28.1764346100209;
        Fri, 28 Nov 2025 08:08:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6133sm11036093f8f.16.2025.11.28.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:08:19 -0800 (PST)
Date: Fri, 28 Nov 2025 17:08:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: john.ogness@linutronix.de, linux@armlinux.org.uk, paulmck@kernel.org,
	usamaarif642@gmail.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rmikey@meta.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <aSnI8UQRNICSKxAb@pathway.suse.cz>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_080822_767556_F1253B14 
X-CRM114-Status: GOOD (  34.61  )
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

On Tue 2025-11-25 08:02:16, Breno Leitao wrote:
> Hello,
> 
> I am reporting a CSD lockup issue that occurs during kexec on ARM64 hosts,
> which I have traced to the amba-pl011 serial driver waiting for hardware with
> IRQs disabled in the nbcon atomic write path.
> 
> 
> PROBLEM SUMMARY:
> ================
> During kexec, a CSD lockup occurs when pl011_console_write_atomic() performs
> an unbounded busy-wait for hardware synchronization while IRQs are disabled.
> This blocks other CPUs for extended periods (>11 seconds observed), triggering
> CSD lock timeouts.

I do _not_ think that the CPU was waiting in pl011_console_write_atomic() in the
the following cycle the entire 11 secs:

	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
		cpu_relax();

A more likely scenario was that pl011_console_write_atomic() was
called several times during this period because there were more
pending messages.

See below.

> KERNEL VERSION:
> ===============
> Observed on kernel 6.13, but the code path appears similar in upstream.
> 
> 
> ERROR MESSAGE:
> ==============
>   mlx5_core 0000:03:00.0: Shutdown was called
>   kvm: exiting hardware virtualization
>   arm-smmu-v3 arm-smmu-v3.10.auto: CMD_SYNC timeout at 0x00000103 [hwprod 0x00000104, hwcons 0x00000102]
>   smp: csd: Detected non-responsive CSD lock (#1) on CPU#4, waiting 5000000032 ns for CPU#00 do_nothing (kernel/smp.c:1057)
>   smp:     csd: CSD lock (#1) unresponsive.
>   Sending NMI from CPU 4 to CPUs 0:
>   NMI backtrace for cpu 0
>   pstate: 03401009 (nzcv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
>   pc : pl011_console_write_atomic (./arch/arm64/include/asm/vdso/processor.h:12 drivers/tty/serial/amba-pl011.c:2540)

This seems to be the cycle:

	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
		cpu_relax();

>   lr : pl011_console_write_atomic (drivers/tty/serial/amba-pl011.c:292 drivers/tty/serial/amba-pl011.c:298 drivers/tty/serial/amba-pl011.c:2539)
>   sp : ffff80010e26fae0
>   pmr: 000000c0
>   x29: ffff80010e26fae0 x28: ffff800082ddb000 x27: 00000000000000e0
>   x26: 0000000000000001 x25: ffff8000826a8de8 x24: 00000000000008eb
>   x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
>   x20: ffff00009c19c880 x19: ffff80010e26fb88 x18: 0000000000000018
>   x17: 696f70646e452065 x16: 4943502032303830 x15: 3130783020737361
>   x14: 6c63203030206570 x13: 746e696f70646e45 x12: 0000000000000000
>   x11: 0000000000000008 x10: 0000000000000000 x9 : ffff800081888d80
>   x8 : 0000000000000018 x7 : 205d313332363336 x6 : 362e31202020205b
>   x5 : ffff000097d4700f x4 : ffff80010e26f99f x3 : ffff800081125220
>   x2 : 0000000000000052 x1 : 000000000000000a x0 : ffff00009c19c880
>   Call trace:
>   pl011_console_write_atomic (./arch/arm64/include/asm/vdso/processor.h:12 drivers/tty/serial/amba-pl011.c:2540) (P)
>   nbcon_emit_next_record (kernel/printk/nbcon.c:1049)
>   __nbcon_atomic_flush_pending_con (kernel/printk/nbcon.c:1517)
>   __nbcon_atomic_flush_pending.llvm.15488114865160659019 (./arch/arm64/include/asm/alternative-macros.h:254 ./arch/arm64/include/asm/cpufeature.h:808 ./arch/arm64/include/asm/irqflags.h:192 kernel/printk/nbcon.c:1562 kernel/printk/nbcon.c:1612)
>   nbcon_atomic_flush_pending (kernel/printk/nbcon.c:1629)

This code looks like:

static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq,
					   bool allow_unsafe_takeover)
{
[...]
	/*
	 * Atomic flushing does not use console driver synchronization (i.e.
	 * it does not hold the port lock for uart consoles). Therefore IRQs
	 * must be disabled to avoid being interrupted and then calling into
	 * a driver that will deadlock trying to acquire console ownership.
	 */
	local_irq_save(flags);

	err = __nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);

	local_irq_restore(flags);
[...]
}

It means that IRQs are disabled until all pending messages are flushed.

>   printk_kthreads_shutdown (kernel/printk/printk.c:?)

But the function seems be called with IRQs enabled. So that it might
help to restore IRQs after each flushed message.

>   syscore_shutdown (drivers/base/syscore.c:120)
>   kernel_kexec (kernel/kexec_core.c:1045)
> 
> NOTES:
> ======
> 
> This is slightly similar to a report I gave a while ago [1] that got
> fixed by Petr's a7df4ed0af77 ("printk: Allow to use the printk kthread
> immediately even for 1st nbcon")
> 
> https://lore.kernel.org/all/aGVn%2FSnOvwWewkOW@gmail.com/
> 
> QUESTION
> ========
> 
> 1) Should nbcon wait for hardware synchronizations with IRQ disabled?
> 2) Can the hardware synchronization be moved of the IRQ disabled path?

This would be complicated because the nbcon console ownership has
to be acquired with IRQs disabled. Otherwise, it might cause a
deadlock because uart_port_lock() has to acquire the nbcon console
as well.

But we could extend the existing commit d5d399efff6577 ("printk/nbcon:
Release nbcon consoles ownership in atomic flush after each emitted
record") and restore IRQs after each emitted record.

I wonder if the following patch would help in this scenario.
It is made on top of "for-next" branch in printk/linux.git.
But the most important pre-requisite is the above mentioned commit
in the branch "rework/atomic-flush-hardlockup".

Note that the patch is only compile tested.

From 6173069ae66fbb3b903cbc3798c16d3b8046da08 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Fri, 28 Nov 2025 16:16:19 +0100
Subject: [RFC] printk/nbcon: Restore IRQ in atomic flush after each emitted
 record

The commit d5d399efff6577 ("printk/nbcon: Release nbcon consoles ownership
in atomic flush after each emitted record") prevented stall of a CPU
which lost nbcon console ownership because another CPU entered
an emergency flush.

But there is still the problem that the CPU doing the emergency flush
might cause a stall on its own.

Let's go even further and restore IRQ in the atomic flush after
each emitted record.

It is not a complete solution. The interrupts and/or scheduling might
still be blocked when the emergency atomic flush was called with
IRQs and/or scheduling disabled. But it should remove the following
lockup:

  mlx5_core 0000:03:00.0: Shutdown was called
  kvm: exiting hardware virtualization
  arm-smmu-v3 arm-smmu-v3.10.auto: CMD_SYNC timeout at 0x00000103 [hwprod 0x00000104, hwcons 0x00000102]
  smp: csd: Detected non-responsive CSD lock (#1) on CPU#4, waiting 5000000032 ns for CPU#00 do_nothing (kernel/smp.c:1057)
  smp:     csd: CSD lock (#1) unresponsive.
  [...]
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

In this case, nbcon_atomic_flush_pending() is called from
printk_kthreads_shutdown() with IRQs and scheduling enabled.

An ultimate solution would be touching the watchdog. But it would hide
all problems. Let's do it later when anyone reports a stall which does
not have a better solution.

Closes: https://lore.kernel.org/r/sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/nbcon.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 3fa403f9831f..6b8becb6ecd9 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1549,6 +1549,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 {
 	struct nbcon_write_context wctxt = { };
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
+	unsigned long flags;
 	int err = 0;
 
 	ctxt->console			= con;
@@ -1557,18 +1558,31 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
 
 	while (nbcon_seq_read(con) < stop_seq) {
-		if (!nbcon_context_try_acquire(ctxt, false))
+		/*
+		 * Atomic flushing does not use console driver synchronization
+		 * (i.e. it does not hold the port lock for uart consoles).
+		 * Therefore IRQs must be disabled to avoid being interrupted
+		 * and then calling into a driver that will deadlock trying
+		 * to acquire console ownership.
+		 */
+		local_irq_save(flags);
+		if (!nbcon_context_try_acquire(ctxt, false)) {
+			local_irq_restore(flags);
 			return -EPERM;
+		}
 
 		/*
 		 * nbcon_emit_next_record() returns false when the console was
 		 * handed over or taken over. In both cases the context is no
 		 * longer valid.
 		 */
-		if (!nbcon_emit_next_record(&wctxt, true))
+		if (!nbcon_emit_next_record(&wctxt, true)) {
+			local_irq_restore(flags);
 			return -EAGAIN;
+		}
 
 		nbcon_context_release(ctxt);
+		local_irq_restore(flags);
 
 		if (!ctxt->backlog) {
 			/* Are there reserved but not yet finalized records? */
@@ -1595,22 +1609,11 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 {
 	struct console_flush_type ft;
-	unsigned long flags;
 	int err;
 
 again:
-	/*
-	 * Atomic flushing does not use console driver synchronization (i.e.
-	 * it does not hold the port lock for uart consoles). Therefore IRQs
-	 * must be disabled to avoid being interrupted and then calling into
-	 * a driver that will deadlock trying to acquire console ownership.
-	 */
-	local_irq_save(flags);
-
 	err = __nbcon_atomic_flush_pending_con(con, stop_seq);
 
-	local_irq_restore(flags);
-
 	/*
 	 * If there was a new owner (-EPERM, -EAGAIN), that context is
 	 * responsible for completing.
-- 
2.52.0


