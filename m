Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11621CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 03:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV0Toq94Bdd9H5uUKR8LAkhC09OUeffE71uEArrF4J8=; b=QN+6HFgP9hzIAJ3awbtl7gVfyd
	oMkAw415n5C9GICt4cd8WHO9xTK8pfjtyA/v1jGN+0dkO+NTNUfcMG8btRFAq0Xd87rr+2/iJQycJ
	G920nLXdoWEt/l2iIKHEUnJNcunLvUcPPirljXcmCS0wg8/E77+fgUajRo5n/ql+1NSzDX/Eaky4t
	7qx4p5Qx5IDivrCvZE5sKSIENdPiNYwnvZ2xBRFCO57qqplcNYAj4SYpiAj7Ly0Ae77+ueyb11x4v
	J2dRvUNRcNmlc4lGWgdZgP8EiP4k7grMOqPhHs1FjaQWHMOsHAtT4xAyrcq30R8hRvwFweeaYlY9d
	9kapUd1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoyy-0000000HVpE-3QqB;
	Fri, 28 Nov 2025 03:17:16 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoyv-0000000HVoi-2aVJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 03:17:15 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9082B92009C; Fri, 28 Nov 2025 04:17:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8C79F92009B;
	Fri, 28 Nov 2025 03:17:02 +0000 (GMT)
Date: Fri, 28 Nov 2025 03:17:02 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, 
    Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
In-Reply-To: <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
Message-ID: <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org> <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_191713_888333_D2951183 
X-CRM114-Status: GOOD (  14.58  )
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

On Tue, 9 Sep 2025, Manivannan Sadhasivam wrote:

> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Designware databook r5.20a, sec 3.10.10.3 documents the 'CFG Shift Feature'
> of the internal Address Translation Unit (iATU). When this feature is
> enabled, it shifts/maps the BDF contained in the bits [27:12] of the target
> address in MEM TLP to become BDF of the CFG TLP. This essentially
> implements the Enhanced Configuration Address Mapping (ECAM) mechanism as
> defined in PCIe r6.0, sec 7.2.2.

 So this broke a parallel port on my HiFive Unmatched machine (a SiFive 
FU740-C000 based system), the driver no longer registers the device, no 
/dev/parport0 anymore.

 I've had to bisect it with commit a1978b692a39 ("PCI: dwc: Use custom 
pci_ops for root bus DBI vs ECAM config access") and commit fc2bc2623e3a 
("Revert "PCI: qcom: Prepare for the DWC ECAM enablement"") applied on top 
and it's affirmative it's this change, i.e. upstream commit 0da48c5b2fa7 
("PCI: dwc: Support ECAM mechanism by enabling iATU 'CFG Shift Feature'").

 Here's the relevant part of a diff between bootstrap logs:

--- dmesg-good.log	2025-11-28 03:41:18.943097032 +0100
+++ dmesg-bad.log	2025-11-28 03:47:29.582049781 +0100
@@ -1,5 +1,5 @@
-Booting Linux on hartid 3
-Linux version 6.17.0-rc1-00008-g4660e50cf818-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #19 SMP Fri Nov 28 02:37:51 GMT 2025
+Booting Linux on hartid 1
+Linux version 6.17.0-rc1-00009-g0da48c5b2fa7-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #20 SMP Fri Nov 28 02:43:00 GMT 2025
 Machine model: SiFive HiFive Unmatched A00
 SBI specification v0.3 detected
 SBI implementation ID=0x1 Version=0x9
@@ -61,7 +61,7 @@
 EFI services will not be available.
 smp: Bringing up secondary CPUs ...
 smp: Brought up 1 node, 4 CPUs
-Memory: 16383064K/16777216K available (10746K kernel code, 2200K rwdata, 4972K rodata, 537K init, 371K bss, 389448K reserved, 0K cma-reserved)
+Memory: 16383064K/16777216K available (10746K kernel code, 2200K rwdata, 4972K rodata, 536K init, 371K bss, 389448K reserved, 0K cma-reserved)
 devtmpfs: initialized
 clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
 posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
@@ -161,6 +161,7 @@
 fu740-pcie e00000000.pcie:       IO 0x0060080000..0x006008ffff -> 0x0060080000
 fu740-pcie e00000000.pcie:      MEM 0x0060090000..0x007fffffff -> 0x0060090000
 fu740-pcie e00000000.pcie:      MEM 0x2000000000..0x3fffffffff -> 0x2000000000
+fu740-pcie e00000000.pcie: ECAM at [mem 0xdf0000000-0xdffffffff] for [bus 00-ff]
 fu740-pcie e00000000.pcie: Using 256 MSI vectors
 fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4096G
 fu740-pcie e00000000.pcie: cap_exp at 70
@@ -655,7 +656,7 @@
 usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.17
 usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
 usb usb1: Product: xHCI Host Controller
-usb usb1: Manufacturer: Linux 6.17.0-rc1-00008-g4660e50cf818-dirty xhci-hcd
+usb usb1: Manufacturer: Linux 6.17.0-rc1-00009-g0da48c5b2fa7-dirty xhci-hcd
 usb usb1: SerialNumber: 0000:04:00.0
 hub 1-0:1.0: USB hub found
 hub 1-0:1.0: 2 ports detected
@@ -663,7 +664,7 @@
 usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.17
 usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
 usb usb2: Product: xHCI Host Controller
-usb usb2: Manufacturer: Linux 6.17.0-rc1-00008-g4660e50cf818-dirty xhci-hcd
+usb usb2: Manufacturer: Linux 6.17.0-rc1-00009-g0da48c5b2fa7-dirty xhci-hcd
 usb usb2: SerialNumber: 0000:04:00.0
 hub 2-0:1.0: USB hub found
 hub 2-0:1.0: 2 ports detected
@@ -735,8 +736,6 @@
 pcieport 0000:06:01.0: enabling bus mastering
 parport_pc 0000:07:00.0: enabling device (0000 -> 0001)
 PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 35
-parport0: PC-style at 0x1000 (0x1008), irq 35, using FIFO [PCSPP,TRISTATE,EPP,ECP]
-lp0: using parport0 (interrupt-driven).
 parport_pc 0000:07:00.0: vgaarb: pci_notify
 serial 0000:07:00.3: vgaarb: pci_notify
 serial 0000:07:00.3: assign IRQ: got 40

and then it goes on with insignificant changes only owing to differences 
in the order of messages produced, the kernel version ID or date stamps.  
As you can see the PCIe parallel port device continues being accessible, 
it's only the driver that doesn't pick up the device anymore.

 I'm stumped as to where it might be coming from.  Any ideas?

  Maciej

