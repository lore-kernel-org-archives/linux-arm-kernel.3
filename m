Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D89CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=osOkASH2uy5+Xht2uGsc3FDUJvnEGVsKz69nZDUqpfY=; b=qJ83kC0PkMSaoH1KYhkYEQRmfe
	c7waVz/r1mnZaaNiW8NzxEmvMnNVUOlXqRBSkfEyB83vGvF/PeEublnZPztNxcMmcasEGA1fsEU8k
	Sc54fIXlHbzRE+4f5Kp8b+Q89PpV23Ruvwnk84X17LnkJIH6ZzeUsXryolqmb2qHK6PX/AZ+5Yp1Y
	KjCQlffb7uwkJ6p8yzkcH/29RAo2iiEHsJ9+w6NZyWYa+KFUbbcNMQpzFOayDSVIHQzUyqXj4fZxG
	P5MiyC7zSfDuz8jPcWz15y9jok6Z+TA1k8mlpVgiBwNPyV7YQNhtW2D7Lpn9EiNMQAb9EANz4t8Vb
	OW6hHF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYMV-0000000H6hW-2lSF;
	Thu, 14 Aug 2025 13:51:23 +0000
Received: from mailgw-out1.grenoble.cnrs.fr ([2001:660:530d:201::44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXZR-0000000Gucj-1vNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
	s=202106-grenoble.cnrs.fr; t=1755176428;
	bh=osOkASH2uy5+Xht2uGsc3FDUJvnEGVsKz69nZDUqpfY=;
	h=Date:To:Cc:From:Subject:From;
	b=OHSAOBbVbqQRlcBWxr1OswaOeQK4GS4DgZ9otuRjpHJ7woULJKH8bZpIjhR2BgmeH
	 J+mUUJkQZv7/eNbuBYZlepvzbXgUs6bJ1/0FV8M2qYSFRucoQLghejhbKc7XDSeEk8
	 BZ5Wru6d7nhQCgBBAU9pVg+N5Sqf7bo651Db62KjekScj7tNYQw65a4T4l/FymRlsQ
	 XiaNzhQJJeNe4GoG5hKmsc86SmcR9Mg5HvYOmglwaNeindJnb5ZEGdoCrYKNSqV6PC
	 /6p/0qdhQBWLVwL1Aru7PbKXDyN+PLdFfJ5NJpTYvRU06Vdb/3q/IxEe8ha41n6VgI
	 F5PSGJU88ahYQ==
Received: from [147.173.65.159] (unknown [147.173.65.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D2EB3C0A2A;
	Thu, 14 Aug 2025 15:00:25 +0200 (CEST)
Message-ID: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
Date: Thu, 14 Aug 2025 14:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Thomas Gleixner <tglx@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Subject: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_060042_342230_8BF32EBD 
X-CRM114-Status: GOOD (  27.43  )
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

Hello everybody!

I am facing an "Interrupts were enabled early" kernel warning which, as
far as I can tell, is caused by a spinlock guard in an ARM/Microchip
IRQCHIP driver. I think I solved the issue, and I am proposing a patch
below, after the scissor. But I must first disclose that:

  * I am completely new to Linux internals and its development process.
    This is why I chose to err on the side of providing too much
    information on my issue. It is not unlikely that I am doing
    something very wrong.

  * I am not subscribed to either of the linux-{,arm-}kernel mailing
    lists

  * I will be far from the Internet in the few days to come. I should be
    connected an responsive starting from 2025-08-24.


## Context

I am playing with an Acmesystems Acqua[1] system on module, which is
based on a SAMA5D31 SoC (single core Cortex-A5). I maintain the
Buildroot defconfig for this board,[2] which is currently based on a
vanilla Linux kernel v6.12.41.

As I wanted to check that the board runs fine on newer kernels, I built
a v6.16 for it using gcc 14, binutils 2.43, the in-tree sama5_defconfig
merged with this fragment:

    # CONFIG_BRIDGE is not set
    # CONFIG_MODULES is not set
    # CONFIG_NET_DSA is not set
    # CONFIG_WIRELESS is not set
    # CONFIG_USB_NET_DRIVERS is not set
    # CONFIG_WLAN is not set
    # CONFIG_MEDIA_SUPPORT is not set
    # CONFIG_SOUND is not set
    # CONFIG_AUTOFS_FS is not set

and the Buildroot-provided device tree, patched for compatibility with
Linux commit 510a6190cf5e ("ARM: dts: microchip: fix faulty ohci/ehci
node names").

The defconfig fragment above is meant to remove module support (with
some unused drivers along the way), which makes testing easier for me.


## Issue

While booting, Linux v6.16 printed this message on the serial console:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at init/main.c:1024 start_kernel+0x4d0/0x5dc
    Interrupts were enabled early
    CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.16.0 #1 NONE 
    Hardware name: Atmel SAMA5
    Call trace: 
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x38/0x48
     dump_stack_lvl from __warn+0x78/0xd4
     __warn from warn_slowpath_fmt+0x98/0xc8
     warn_slowpath_fmt from start_kernel+0x4d0/0x5dc
     start_kernel from 0x0
    ---[ end trace 0000000000000000 ]---

The board seemed to work fine, so maybe this warning is completely
harmless. It looked, however, scary enough to deserve some
investigation.


## Bug hunting

I could not reproduce the issue on a qemu virtual machine. All tests
were then done on the real hardware.

I looked for the Linux commit that introduced the issue. ‘git bisect’
told me this was 195298c3b116 ("genirq/generic-chip: Convert core code
to lock guards"). I then checked out a recent mainline kernel, namely
v6.17-rc1, and tried to revert that commit. For this, I first had to
revert two follow-up commits, namely 7ae844a6650c ("genirq/generic-chip:
Remove unused lock wrappers") and 771487050f83 ("genirq/generic-chip:
Fix incorrect lock guard conversions"). This was unsuccessful: I still
had the warning.

I went back to a clean v6.17-rc1 and tried to find the thing that was
enabling interrupts early. After lots of printk() debugging, I
discovered it was a guard(raw_spinlock_irq) destructor. The call chain
is this (line numbers are for v6.17-rc1):

    start_kernel (init/main.c:1011)
    -> time_init (arch/arm/kernel/time.c:96)
    -> timer_probe (drivers/clocksource/timer-probe.c:30)
    => tcb_clksrc_init (drivers/clocksource/timer-atmel-tcb.c:413)
    -> of_irq_get (drivers/of/irq.c:474)
    -> irq_create_of_mapping (kernel/irq/irqdomain.c:980)
    -> irq_create_fwspec_mapping (kernel/irq/irqdomain.c:848)
    => aic5_irq_domain_xlate (drivers/irqchip/irq-atmel-aic5.c:287)
    -> guard destructor (raw_spin_unlock_irq?)

where (=>) is an indirect call through a function pointer.


## Tentative fix

Commit 771487050f83 gave me the inspiration. The guard in question was
introduced by b00bee8afaca ("irqchip: Convert generic irqchip locking to
guards"), which replaced calls to irq_gc_lock_irq{save,restore}() by
guard(raw_spinlock_irq) (with no “save” in the name). The commit log
states that this is “intended and correct”, but I could not make sense
of the explanation. My (possibly faulty) understanding is that the guard
constructor disables interrupts, and the destructor either
unconditionally enables them (raw_spinlock_irq), or restores the
previous interrupt state (raw_spinlock_irqsave).

I then replaced guard(raw_spinlock_irq) with guard(raw_spinlock_irqsave)
and that seemed to do the job: the warning is gone. See the patch below
the scissors.

Best regards, and thank-you for reading so far.

Edgar Bonet.

[1] https://www.acmesystems.it/acqua
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc1/configs/acmesystems_acqua_a5_512mb_defconfig

------------------------------------------------------------------ >8 --
Subject: [PATCH] irqchip/atmel-aic5: Fix incorrect lock guard conversion

Commit b00bee8afaca ("irqchip: Convert generic irqchip locking to guards")
replaced calls to irq_gc_lock_irq{save,restore}() with
guard(raw_spinlock_irq). However, in irq-atmel-aic5.c, one such guard is
created early in the boot process, before interrupts are initially enabled.
As its destructor enables interrupts, this results in the following warning
on a SAMA5D31-based system:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at init/main.c:1024 start_kernel+0x4d0/0x5dc
    Interrupts were enabled early
    CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.16.0 #1 NONE
    Hardware name: Atmel SAMA5
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x38/0x48
     dump_stack_lvl from __warn+0x78/0xd4
     __warn from warn_slowpath_fmt+0x98/0xc8
     warn_slowpath_fmt from start_kernel+0x4d0/0x5dc
     start_kernel from 0x0
    ---[ end trace 0000000000000000 ]---

Fix this by using guard(raw_spinlock_irqsave) instead.

Fixes: b00bee8afaca ("irqchip: Convert generic irqchip locking to guards")
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 drivers/irqchip/irq-atmel-aic5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index 60b00d2c3d7a..1f14b401f71d 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -279,7 +279,7 @@ static int aic5_irq_domain_xlate(struct irq_domain *d,
 	if (ret)
 		return ret;
 
-	guard(raw_spinlock_irq)(&bgc->lock);
+	guard(raw_spinlock_irqsave)(&bgc->lock);
 	irq_reg_writel(bgc, *out_hwirq, AT91_AIC5_SSR);
 	smr = irq_reg_readl(bgc, AT91_AIC5_SMR);
 	aic_common_set_priority(intspec[2], &smr);
-- 
2.43.0

