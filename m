Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2600C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw30Y6WkVEyr8WWdYrluQA7lvl9tRE1oABhggmxjS0g=; b=QGctQBYzpTM05KVr29fc39Z8Mx
	EfHMyXwCuiHkhrxz0a15rK66suhl9eBZzysrl0C5mowk6x2Gghtvt26ykXdqL6x1BJk7TbAt8dJoR
	PeuUccrBA876j7Lu94i533fKjzV8CZVRsigr21luiZtrp5dGc5LRLVR/BxQwAhWAoMOxPksE4q1T+
	+q0ngS5IXxSGZ60nRoyq833m8m08S2V6Qi0xU/vHDoNtBElxD/N4fLM1ax20vsybxRRwEipGreMkZ
	lVqdBggwmlMmHyfQuvX2vRSnFf2F5ef/Qg/pZ1XNgM2gnkrrVaAMvOvjsOCIS6un2QOSpcKEnfvhz
	DB9ao98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu6D-0000000COG4-0w3O;
	Thu, 10 Jul 2025 16:26:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrRT-0000000Bx6M-3TFn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 13:36:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13EDB1EA6;
	Thu, 10 Jul 2025 06:35:49 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7AE63F6A8;
	Thu, 10 Jul 2025 06:35:59 -0700 (PDT)
Date: Thu, 10 Jul 2025 14:35:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>, ankita@nvidia.com,
	bwicaksono@nvidia.com, rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <20250710133557.GA1093654@e132581.arm.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <aGZbYmV26kUKJwu_@J2N7QTR9R3>
 <aGaQBghdAl8VGWmV@gmail.com>
 <aGawTd8N2i8MDCmL@J2N7QTR9R3>
 <aG0kYjl/sphGqd4r@gmail.com>
 <juiog3337iozva23zpf4apdydegj4z7jibqykfvcgnkabemw4w@z5g5hhwrqr2w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <juiog3337iozva23zpf4apdydegj4z7jibqykfvcgnkabemw4w@z5g5hhwrqr2w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063603_958175_70ABFA2C 
X-CRM114-Status: GOOD (  36.67  )
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

Hi Breno,

On Wed, Jul 09, 2025 at 07:23:44AM -0700, Breno Leitao wrote:
> On Tue, Jul 08, 2025 at 07:00:45AM -0700, Breno Leitao wrote:
> > On Thu, Jul 03, 2025 at 05:31:09PM +0100, Mark Rutland wrote:
> > 
> > Here is more information I got about this problem. TL;DR: While the
> > machine is booting, it is throttled by the UART speed, while having IRQ
> > disabled.
> 
> quick update: I've identified a solution that significantly improves the
> situation. I've found that the serial issue was heavily affecting boot
> time, which is unleashed now.
> 
> After applying the following fix, the boot speed has improved
> dramatically. It's the fastest I've seen, and the CSD lockups are gone.

Thanks for trying to fix the issue.

> If no concerns raise in the next days, I will send it officially to the
> serial maintainers.

I am not an expert on the PL011 driver, however, I do have concerns
after review the change. Please see my comments below.

> Author: Breno Leitao <leitao@debian.org>
> Date:   Wed Jul 9 05:57:06 2025 -0700
> 
>     serial: amba-pl011: Fix boot performance by switching to console_initcall()
> 
>     Replace arch_initcall() with console_initcall() for PL011 driver initialization
>     to resolve severe boot performance issues.

pl011_init() registers as an AMBA device, so the PL011 driver depends
on the AMBA bus initialization. The AMBA bus is initialized with:

    postcore_initcall(amba_init);

Therefore, the PL011 driver is initialized with arch_initcall(), which
occurs later than the postcore init.

My understanding is that console_initcall() is invoked much earlier
than other initcalls triggered by do_initcalls(). With your change, I
saw the PL011 driver fails to register on Juno-r2 board, due to AMBA bus
driver is not ready for a console init.

  Driver 'uart-pl011' was unable to register with bus_type 'amba'
  because the bus was not initialized.

>     The current arch_initcall() registration causes the console to initialize
>     before the printk subsystem is ready, forcing the driver into atomic mode
>     during early boot. This results in:
> 
>     - 5-8 second boot delay while ~700 boot messages are processed
>     - System freeze with IRQs disabled during message output
>     - Each character transmitted synchronously with cpu_relax() polling
> 
>     This is what is driving the driver to atomic mode in the early boot:
> 
>       static inline void printk_get_console_flush_type(struct console_flush_type *ft)
>       {
>             ....
>             if (printk_kthreads_running)
>                     ft->nbcon_offload = true;
> 
>     The atomic path processes each character individually through
>     pl011_console_putchar(), waiting for UART transmission completion
>     before proceeding. With only one CPU online during early boot,
>     this creates a bottleneck where the system spends excessive time
>     in interrupt-disabled state.

The atomic path is introduced recently by the commit:

  2eb2608618ce ("serial: amba-pl011: Implement nbcon console")

My conclusion is that changing the initcall will not disable the atomic
path, changing to console_initcall() will cause AMBA device init
failure, and as a result, the clock operations will not be invoked.
Thus, I am curious if you have ruled out the issue is caused by the UART
clock (as I mentioned in another reply).

BTW, since the atomic path is enabled in the commit 2eb2608618ce, what
is the result after reverting the commit?

Thanks,
Leo

>     Here is how the code looks like:
> 
>       1) disable interrupt
>       2) for each of these 700 messages, call pl011_console_write_atomic()
>       3) for each character in the message, calls pl011_console_putchar(),
>          which waits for the character to be transmitted
>       4) once all the line is transmitted, wait for the UART to be idle
>       5) re-enable interrupt
> 
>     Here is the code representation of the above:
> 
>             pl011_console_write_atomic() {
>                     ...
>                     // For each char in the message
>                     pl011_console_putchar() {
>                             while (pl011_read(uap, REG_FR) & UART01x_FR_TXFF)
>                                     cpu_relax();
>                     }
>                     while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
>                             cpu_relax();
> 
>     Using console_initcall() ensures proper initialization order,
>     allowing the printk subsystem to use threaded output instead
>     of atomic mode, eliminating the performance bottleneck.
> 
>     Performance improvement: 16x faster kernel boot time at my GRACE SoC
>     machine.
> 
>       - Before: 10.08s to reach init process
>       - After: 0.62s to reach init process
> 
>     Here are more timing details, collected from Linus' upstream, where the
>     only different is this patch:
> 
>     Linus upstream:
>       [    0.616203] printk: legacy console [netcon_ext0] enabled
>       [    0.627469] Run /init as init process
>       [    0.837477] loop: module loaded
>       [    8.354803] Adding 134199360k swap on /swapvol/swapfile.
> 
>     With this patch:
>       [    0.305109] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
>       [   10.081742] Run /init as init process
>       [   13.288717] loop: module loaded
>       [   22.919934] Adding 134199168k swap on /swapvol/swapfile.
> 
>     Link: https://lore.kernel.org/all/aGVn%2FSnOvwWewkOW@gmail.com/ [1]
> 
>     Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 22939841b1de..0cf251365825 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -3116,7 +3116,7 @@ static void __exit pl011_exit(void)
>   * While this can be a module, if builtin it's most likely the console
>   * So let's leave module_exit but move module_init to an earlier place
>   */
> -arch_initcall(pl011_init);
> +console_initcall(pl011_init);
>  module_exit(pl011_exit);
> 
>  MODULE_AUTHOR("ARM Ltd/Deep Blue Solutions Ltd");
> 
> 
> 
> 
> 

