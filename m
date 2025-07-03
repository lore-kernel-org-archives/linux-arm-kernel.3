Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D0C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejA/pYxSn8JyDefFvhCTRlfa3hX4bPlUpHNztKu6inY=; b=vXv8bPEGMCdiQgC/+nGGGEA6Gb
	RuzOvSLZLIy0XPixTA9kHfj2VCm+gmGqHKk1g78LZbU5LVCCfKXCP+kUFaSSQl+1cff8Gr80FR84o
	q+nbT9PEqaquGW+wetBn/I9cnPv+auRXQuF1qaPVoVvjFZtCf+oP9+o621GSGOQv5phXDth1S/iyE
	Tokp6PILYxGNVKNcDji+K21LXvmmKwFksa/LnQzqA9CiBIngpxBxp/+GZLb+4oIWBj2KK9MZxsFCB
	f/PXpu2RW8W/CbhJoFLdGjvNfMSO+j6tuORM1Ow5Nievs50l+YeZ5CvKAsgVS2FrTbEoC15MKfSPY
	HM9zJ9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1z-0000000CWzQ-1mGF;
	Thu, 03 Jul 2025 20:59:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMdA-0000000By5O-0nn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:17:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F9331596;
	Thu,  3 Jul 2025 09:17:30 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 627B93F6A8;
	Thu,  3 Jul 2025 09:17:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 17:17:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, mark.rutland@arm.com,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <20250703161742.GF1039028@e132581.arm.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <20250702172036.GC1039028@e132581.arm.com>
 <aGZVP8A2a3VVQwzt@gmail.com>
 <20250703114557.GD1039028@e132581.arm.com>
 <aGabYkQixrVeYlLD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGabYkQixrVeYlLD@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_091748_276444_B700D8F2 
X-CRM114-Status: GOOD (  14.68  )
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

On Thu, Jul 03, 2025 at 04:01:54PM +0100, Breno Leitao wrote:

[...]

> That is an interesting experiment, thanks for the heads-up.
> 
> I got `earlycon=pl011,mmio32,0xc280000` working, the machine boots fine,
> and I see different behaviours.
> 
> Booting up the system the following lines (as examples):
> 
> 	[    0.000000] earlycon: pl11 at MMIO32 0x000000000c280000 (options '115200')
> 	[    0.000000] printk: legacy bootconsole [pl11] enabled
> 	[    0.493205] smp: Brought up 1 node, 72 CPUs
> 	[    4.232864] SMP: Total of 72 processors activated.
> 	[    4.242788] CPU: All CPU(s) started at EL2
> 	[    6.318137] ARMH0011:00: ttyAMA0 at MMIO 0xc280000 (irq = 66, base_baud = 0) is a SBSA
> 	[    6.978245] netpoll: netconsole: local port 6666
> 	[    7.234429] Run /init as init process
> 
> Also, I have a trace_printk() in pl011_console_write_atomic, and it only
> start later in the code. More precisely at:
> 
>        swapper/0-1       [000] dN.1.     6.334581: pl011_console_write_atomic: Printing 49 [    6.334573] printk: console [ttyAMA0] enabled
> 
> I understand that the early boot messages got sent by some other
> function? (Or maybe the tracing framework was not initialized?)
> 
> Anyway, pl011_console_write_atomic() continues to call ~20K times cpu_relax()
> waiting for the BUSY bit to disappear, as before.

If earlycon works correctly, it means the UART clock has been prepared
before the kernel boots.

I noticed that pl011_console_write_atomic() enables and disables the
uap->clk clock dynamically. The clock is a SoC implementation. If the
UART clock is already properly enabled for earlycon, we can assume it
doesn't need to be managed again in the UART driver.

So, perhaps it's worth an experiment by commenting out the clock
operations in the UART driver?

Thanks,
Leo

