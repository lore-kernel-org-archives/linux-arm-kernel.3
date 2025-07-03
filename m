Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E84C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPKrKT5uxyeXAMxgVK0JE1SStj/+obPZ0SZGDe7qYpE=; b=eppQBEHvLDXcnmxgOrF8vUl3vQ
	h8H5BBzecENE2SzaMpxtYYcUSHyHKSjV8hoodMp9+36Ido1fHJOyrODf9CAaaj/3sZDEOasUCX2t8
	7Vn6qblagFD7Jybv2lpCed1yhz2ozhWLzE4Qlrg+aQ5eibDBzTqaxuOwBvtTKAy/ciEoxhKd/f+ZF
	DiT8oE9PPp8EHEX18/EyXfnDzCNrEdZ9XdUZWn9UokhTqm27+5SWZSjCprbdp/xMdyQ9DXqOVPCnw
	whONDnpvAp+SzAikH19OCpQ5vEaF9j0iq2ZxF8tkiePGmG/0+9uM3BCwrdozH53rN9v2hUtosIarW
	olFC604w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2G-0000000CXR2-2TT3;
	Thu, 03 Jul 2025 21:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMqC-0000000C0BL-3Gy6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:31:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 714C41596;
	Thu,  3 Jul 2025 09:30:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6E33F6A8;
	Thu,  3 Jul 2025 09:31:12 -0700 (PDT)
Date: Thu, 3 Jul 2025 17:31:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, catalin.marinas@arm.com,
	linux-serial@vger.kernel.org, rmikey@meta.com,
	linux-arm-kernel@lists.infradead.org, usamaarif642@gmail.com,
	leo.yan@arm.com, linux-kernel@vger.kernel.org, paulmck@kernel.org,
	Ankit Agrawal <ankita@nvidia.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <aGawTd8N2i8MDCmL@J2N7QTR9R3>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <aGZbYmV26kUKJwu_@J2N7QTR9R3>
 <aGaQBghdAl8VGWmV@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGaQBghdAl8VGWmV@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_093116_907292_A71337C4 
X-CRM114-Status: GOOD (  30.18  )
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

On Thu, Jul 03, 2025 at 03:13:26PM +0100, Breno Leitao wrote:
> On Thu, Jul 03, 2025 at 11:28:50AM +0100, Mark Rutland wrote:
> > On Wed, Jul 02, 2025 at 10:10:21AM -0700, Breno Leitao wrote:
> > > I'm observing two unusual behaviors during the boot process on my SBSA
> > > ARM machine, with upstream kernel (6.16-rc4):
> > 
> > Can you say which SoC in particular that is? Knowing that would help to
> > identify whether there's some known erratum, clocking issue, etc.
> 
> This is custom made rack mounted machine based on Grace CPU. Here are
> some info about the hardware:
> 
> 	# lscpu:
> 		Vendor ID:                   ARM
> 		  Model name:                Neoverse-V2
> 		    Model:                   0
> 		    Thread(s) per core:      1
> 		    Core(s) per socket:      72
> 		    Socket(s):               1
> 		    Stepping:                r0p0
> 
> 	# /proc/cpuinfo
> 		processor	: 71
> 		BogoMIPS	: 2000.00
> 		Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 sve asimdfhm dit uscat ilrcpc flagm sb paca pacg dcpodp sve2 sveaes svepmull svebitperm svesha3 svesm4 flagm2 frint svei8mm svebf16 i8mm bf16 dgh bti
> 		CPU implementer	: 0x41
> 		CPU architecture: 8
> 		CPU variant	: 0x0
> 		CPU part	: 0xd4f
> 		CPU revision	: 0
> 
> 	# lshw
> 	    description: Rack Mount Chassis
> 	    product: <Internal name>
> 	    vendor: Quanta
> 	    version: <Internal name>
> 	    width: 64 bits
> 	    capabilities: smbios-3.6.0 dmi-3.6.0 smp sve_default_vector_length tagged_addr_disabled
> 	    configuration: boot=normal chassis=rackmount family=Default string sku=Default string uuid=...
> 
> How do I find the SoC exactly?

From what you've told me above, the SoC is Nvidia Grace; what they call
the CPU is the whole SoC.

> > Likewise that might imply more folk to add to Cc.

I've added Ankit and Besar, since they've both worked on some system
level bits on Grace, and might have an idea.

Ankit, Besar, are you aware of any UART issues on Grace (as described in
Breno's messages below), or do you know of anyone who might have an
idea?

Thanks,
Mark.

> > [...]
> > 
> > > At timestamp 9.69 seconds, the serial console is still flushing messages from
> > > 0.92 seconds, indicating that the initial 9-second gap is spent looping in
> > > cpu_relax()-about 20,000 times per message, which is clearly suboptimal.
> > > 
> > > Further debugging revealed the following sequence with the pl011 registers:
> > > 
> > > 	1) uart_console_write()
> > > 	2) REG_FR has BUSY | RXFE | TXFF for a while (~1k cpu_relax())
> > > 	3) RXFE and TXFF are cleaned, and BUSY stay on for another 17k-19k cpu_relax()
> > > 
> > > Michael has reported a hardware issue where the BUSY bit could get
> > > stuck (see commit d8a4995bcea1: "tty: pl011: Work around QDF2400 E44 stuck BUSY
> > > bit"), which is very similar. TXFE goes down, but BUSY is(?) still stuck for long.
> > 
> > Looking at the commit message, that was an issue with the a "custom
> > (non-PrimeCell) implementation of the SBSA UART" present on QDF400. I
> > assume that was soemthing that Qualcomm Datacenter Technologies designed
> > themselves.
> > 
> > It's possible that your SoC has a similar issue with whatever IP block
> > is being used as the UART, but the issue in that commit certainly
> > doesn't apply to most PL011 / SBSA-UART implementations.
> 
> That makes total sense. Decoding SPCR I see the following:
> 
> 	# iasl -d spcr.dat
> 	Intel ACPI Component Architecture
> 	ASL+ Optimizing Compiler/Disassembler version 20210604
> 	Copyright (c) 2000 - 2021 Intel Corporation
> 
> 	File appears to be binary: found 56 non-ASCII characters, disassembling
> 	Binary file appears to be a valid ACPI table, disassembling
> 	Input file spcr.dat, Length 0x50 (80) bytes
> 	ACPI: SPCR 0x0000000000000000 000050 (v02 NVIDIA A M I    00000001 ARMH 00010000)
> 	Acpi Data Table [SPCR] decoded
> 	Formatted output:  spcr.dsl - 2624 bytes
> 
> Thanks,
> --breno

