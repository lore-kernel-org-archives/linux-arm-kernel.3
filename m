Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0435C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySOPFnfb3FFIxoLcClU1zP6T1Atw0Soo5qWM1gROqnI=; b=HFk1HmyCWp/P/r3tUkked0zI5r
	MXMOjnmIiD7mzC4CzuXibqDrdZSpWOEjr3LnQcTFWiFxUHkZunEtZP4ylypomFeeOYr/H2dwLisf+
	tJDm4JZLmaneiJG2GJUl5NFrgqpfvD5GypgxW7mAONRGnoKU5tRy1ax69CnXiu8h3FfeJjuaEcKcT
	rSTKpSL0UZV6r6c75mxfUF8mPSpnlQ4qdAAN6FPHSXj7HNZOLHrCCMLHuIxGy2MPauIOB1JzYcbAl
	YrHKStoePqI4YknJXrDh4n38Ss9/BVzBC5mnPubYakl42B8gULHkB0di7CknzTaW1dwJSRU/Rlt0H
	cQzaqA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGq8-00000001yCu-26m3;
	Mon, 14 Jul 2025 10:55:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGne-00000001xo2-3PPK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 10:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 687071BC0;
	Mon, 14 Jul 2025 03:52:36 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F6DE3F694;
	Mon, 14 Jul 2025 03:52:45 -0700 (PDT)
Date: Mon, 14 Jul 2025 11:52:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>, ankita@nvidia.com,
	bwicaksono@nvidia.com, rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <20250714105243.GD1093654@e132581.arm.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <aGZbYmV26kUKJwu_@J2N7QTR9R3>
 <aGaQBghdAl8VGWmV@gmail.com>
 <aGawTd8N2i8MDCmL@J2N7QTR9R3>
 <aG0kYjl/sphGqd4r@gmail.com>
 <juiog3337iozva23zpf4apdydegj4z7jibqykfvcgnkabemw4w@z5g5hhwrqr2w>
 <20250710133557.GA1093654@e132581.arm.com>
 <jlhgtwkeezoca34wbqipvsgr4muxov5wmgrswleo2k7zqitzfr@4ngriyb2udra>
 <20250711095023.GB1093654@e132581.arm.com>
 <cno3lsprrz36gqu27omvwrw27d2ubqtshac3cahfgkhcm2rla7@bpnulcmsyx2u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cno3lsprrz36gqu27omvwrw27d2ubqtshac3cahfgkhcm2rla7@bpnulcmsyx2u>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_035246_938572_AD2E9478 
X-CRM114-Status: GOOD (  28.06  )
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

On Fri, Jul 11, 2025 at 03:45:03AM -0700, Breno Leitao wrote:
> On Fri, Jul 11, 2025 at 10:50:23AM +0100, Leo Yan wrote:
> > > I've reverted commit 2eb2608618ce ("serial: amba-pl011: Implement nbcon
> > > console"), and I don't see the CSD locks anymoer. The serial speed is
> > > the same and continue to be slow, but, the CSD lock is not there. Here
> > > is the time spent on the serial flush when reverting the commit above
> > > 
> > > 	[    0.309561] printk: legacy console [ttyAMA0] enabled
> > > 	[    8.657938] ACPI: PCI Root Bridge [PCI2] (domain 0002 [bus 00-ff])
> > 
> > From this result, we can know both the atomic path and the thread path
> > take a long time polling.
>
> I am wondering if this slowdown is by design, or, if there is a bug
> somewhere.

Polling for over 5 seconds (5,001,000,000 ns) seems too long; it
should not be by design.

> > Since both paths configure the UART clock, I'm curious about the
> > behaviour if the UART clock is untouched. The relevant code is shown
> > below.
> 
> Is this the clock frequency that is connected to pl011 coming from AMBA?

The programming clock is for programming registers, my understanding is
the clock is not provided by bus.

> > I may seem a bit stubborn in suspecting a clock issue :) But if you
> > have confirmed that a standard pl011 UART IP is being used.
> 
> How do I double check this is a pl011 UART IP or if this is being
> emulated by firmware/ACPI.

The log shows:

  ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA

This should be emulated by firmware by reading Peripheral Identification
Registers (see [1]).

The most reliable way is to confirm with SoC vendor if the IP is
standard or includes any modification.

[1] https://developer.arm.com/documentation/ddi0183/g/programmers-model/register-descriptions/peripheral-identification-registers--uartperiphid0-3

> > diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> > index 71482d639a6d..b04773ba2602 100644
> > --- a/drivers/amba/bus.c
> > +++ b/drivers/amba/bus.c
> >
> I've tested it, but, it seems it didnt' help much. here is the full log

[...]

> [    0.307809] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
> [    0.307816] printk: console [ttyAMA0] enabled

Based on this log and followed OOPS, the issue happens just after
enabling console. It is a bit tricky that it prints logs during
console registration (and configuration).

Seems to me, it is good to check pl011_console_setup() or
sbsa_uart_set_termios() has any impaction on the long waiting. For
example, the flow below will configure pin control and which might
impact the data transaction:

  pl011_console_setup()
   `> pinctrl_pm_select_default_state()

Based on the information shared earlier, the UART FIFO appears to be
stalled, which is causing the long wait times.

Apologies if my suggestion was unreliable or misled anything, and
welcome others to freely correct me.

Thanks,
Leo

> [    5.414515] smp: csd: Detected non-responsive CSD lock (#1) on CPU#0, waiting 5001000000 ns for CPU#01 do_nothing+0x0/0x10(0x0).
> [    5.414532] smp: 	csd: CSD lock (#1) unresponsive.
> [    5.414535] Sending NMI from CPU 0 to CPUs 1:
> [    5.414541] NMI backtrace for cpu 1
> [    5.414545] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc5-00056-gd7753fd13f9e #86 NONE 
> [    5.414548] Hardware name: Quanta JAVA ISLAND PVT 29F0EMAZ049/Java Island, BIOS F0EJ3A13 06/04/2025
> [    5.414550] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    5.414552] pc : pl011_console_write_atomic+0x94/0x170
> [    5.414559] lr : pl011_console_write_atomic+0x84/0x170
> [    5.414562] sp : ffff80008492f1a0
> [    5.414564] pmr: 000000c0
> [    5.414565] x29: ffff80008492f1a0 x28: 0000000000000000 x27: 00000000000000e0
> [    5.414572] x26: 0000000000000190 x25: 0000000000000000 x24: 0000000000000000
> [    5.414578] x23: 0000000000000001 x22: 0000000000000000 x21: ffff800080c38ea8
> [    5.414584] x20: ffff80008492f288 x19: ffff0000b2060080 x18: 00000000ffffffff
> [    5.414590] x17: 6362323230303030 x16: 3030303078303a30 x15: 206e6f6967657220
> [    5.414595] x14: 3030303064322072 x13: 3030303063623232 x12: 3030303030303030
> [    5.414601] x11: 78303a30206e6f69 x10: 6765722030303030 x9 : ffff800080c390e4
> [    5.414607] x8 : 6964657220646e75 x7 : 205d313533383630 x6 : 302e30202020205b
> [    5.414612] x5 : ffff0000ad10200f x4 : 0000000000000000 x3 : 0000000000000008
> [    5.414618] x2 : ffff8000816336c0 x1 : 0000000000000018 x0 : 0000000000000018
> [    5.414624] Call trace:
> [    5.414626]  pl011_console_write_atomic+0x94/0x170 (P)
> [    5.414630]  nbcon_emit_next_record+0x234/0x388
> [    5.414634]  __nbcon_atomic_flush_pending_con+0x88/0x108
> [    5.414637]  __nbcon_atomic_flush_pending+0x108/0x198
> [    5.414640]  nbcon_atomic_flush_pending+0x24/0x38
> [    5.414643]  vprintk_emit+0x200/0x348
> [    5.414645]  vprintk_default+0x3c/0x50
> [    5.414647]  vprintk+0x2c/0x40
> [    5.414650]  _printk+0x50/0x60
> [    5.414652]  register_console+0x424/0x560
> [    5.414654]  serial_core_register_port+0x878/0x898
> [    5.414659]  serial_ctrl_register_port+0x14/0x28
> [    5.414661]  uart_add_one_port+0x14/0x28
> [    5.414664]  pl011_register_port+0x74/0x130
> [    5.414667]  sbsa_uart_probe+0x164/0x1b8
> [    5.414670]  platform_probe+0x8c/0x100
> [    5.414674]  really_probe+0xc4/0x398
> [    5.414676]  __driver_probe_device+0x80/0x1a8
> [    5.414679]  driver_probe_device+0x44/0x120
> [    5.414681]  __device_attach_driver+0xb8/0x158
> [    5.414683]  bus_for_each_drv+0x74/0xc0
> [    5.414685]  __device_attach+0xac/0x1e0
> [    5.414687]  device_initial_probe+0x18/0x28
> [    5.414690]  bus_probe_device+0xa8/0xb8
> [    5.414692]  device_add+0x648/0x830
> [    5.414697]  platform_device_add+0x114/0x280
> [    5.414700]  platform_device_register_full+0x148/0x1b8
> [    5.414702]  acpi_create_platform_device+0x264/0x388
> [    5.414706]  acpi_bus_attach+0x2c8/0x2e8
> [    5.414709]  acpi_dev_for_one_check+0x38/0x48
> [    5.414711]  device_for_each_child+0x54/0xa0
> [    5.414714]  acpi_dev_for_each_child+0x30/0x40
> [    5.414716]  acpi_bus_attach+0x6c/0x2e8
> [    5.414718]  acpi_dev_for_one_check+0x38/0x48
> [    5.414720]  device_for_each_child+0x54/0xa0
> [    5.414723]  acpi_dev_for_each_child+0x30/0x40
> [    5.414725]  acpi_bus_attach+0x6c/0x2e8
> [    5.414727]  acpi_bus_scan+0x5c/0x1b0
> [    5.414730]  acpi_scan_init+0xa0/0x288
> [    5.414737]  acpi_init+0x1e8/0x4b8
> [    5.414740]  do_one_initcall+0x3c/0x2a0
> [    5.414743]  kernel_init_freeable+0x22c/0x460
> [    5.414746]  kernel_init+0x28/0x1f0
> [    5.414750]  ret_from_fork+0x10/0x20

