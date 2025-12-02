Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156FED116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJm1FqVFlGcoT5qh+lHwlyZJ5KgMc5wT708GkvNJAjY=; b=e9U1ygtRxZIoNfT3c5ykvrJSj5
	JCdcJmwfHfPtSx/EquVqVejpBtJXuuhkvhvdBWlfc9KBacip7zPL5MngJzyYjcTV3fbWJyjcGl/tg
	KiUOPx3slFuvBBYQejov0RPZ2SWm37qYnSA8RdyttbgxYTyLlAgLmEzLW/QdN4RpTkKyS4eoG1NJP
	o+rSqCIGE/Fpzi2s1jtjoGmIWaCrhUGptMRppheTrnZ1bNuR0PJNRagpi+A31MR//ioY3lEXDeap2
	RU5ubl9KURkquNA+6RNEHrhBJCpMWeXE6yhp5XeI3+vaUt1z+UXBYNDc5t2Z+0M09yc+5hH2GfXwC
	us0mnd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQbC-00000005S3E-3LbB;
	Tue, 02 Dec 2025 13:39:22 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQb9-00000005S2m-2vm9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:39:21 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F35EB92009C; Tue,  2 Dec 2025 14:39:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EC3E792009B;
	Tue,  2 Dec 2025 13:39:14 +0000 (GMT)
Date: Tue, 2 Dec 2025 13:39:14 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, 
    Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
In-Reply-To: <ps5jjiqv5mw2g3exzvfcfsa4bcda7hois2h6riarwb2d2son4u@2onu4bibw2hb>
Message-ID: <alpine.DEB.2.21.2512021246470.49654@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk> <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com> <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk> <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com>
 <alpine.DEB.2.21.2511281714030.36486@angie.orcam.me.uk> <a4c6d47f-28b5-40d3-bc82-10aeb14f8e78@oss.qualcomm.com> <alpine.DEB.2.21.2511290428340.36486@angie.orcam.me.uk> <h7pgm3lqolm53sb4wrcpcurk4ghz4tulqnr7vgd7rzxy4hscue@jcn5tepevlwl>
 <syg7vpbt3w53s24hgl7b6w64odmif5bq557lwlvzlbvgkukwcn@66jtzzc3vtiu> <alpine.DEB.2.21.2512011617250.49654@angie.orcam.me.uk> <ps5jjiqv5mw2g3exzvfcfsa4bcda7hois2h6riarwb2d2son4u@2onu4bibw2hb>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_053919_991345_F6F4588A 
X-CRM114-Status: GOOD (  18.19  )
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

On Tue, 2 Dec 2025, Manivannan Sadhasivam wrote:

> >  No change in behaviour, sorry.  I suppose it's this range of host address 
> > decoding:
> > 
> > fu740-pcie e00000000.pcie:       IO 0x0060080000..0x006008ffff -> 0x0060080000
> > 
> > aka:
> > 
> > pci_bus 0000:00: root bus resource [io  0x0000-0xffff] (bus address [0x60080000-0x6008ffff])
> > 
> > that you're after.  Are you sure your code discovers it correctly?  As I 
> > say I can only see IORESOURCE_MEM references and no IORESOURCE_IO ones as 
> > would be appropriate for the root bus resource quoted.
> 
> The I/O resource is discovered by the driver correctly as seen from the logs:
> 
> pci_bus 0000:00: root bus resource [io  0x0000-0xffff] (bus address [0x60080000-0x6008ffff])
> pci_bus 0000:00: root bus resource [mem 0x60090000-0x7fffffff]
> pci_bus 0000:00: root bus resource [mem 0x2000000000-0x3fffffffff pref]
> 
> But we believe that the iATU is not programmed for the I/O port, resulting in
> the I/O access not going out to the device.
> 
> Krishna found an issue in the previous patch that got shared. So I've attached a
> new one. Could you please try and let us know? If it didn't help, please share
> the dmesg log that will have some more info.

 This does work correctly, thank you; see the log diff below (I checked 
the defxx driver separately too).  Please make a proper submission and 
I'll give it a Tested-by: tag after final verification against 6.18.

--- dmesg-bad.log	2025-11-28 03:47:29.582049781 +0100
+++ dmesg-fixed.log	2025-12-02 13:58:56.627947450 +0100
@@ -1,5 +1,5 @@
-Booting Linux on hartid 1
-Linux version 6.17.0-rc1-00009-g0da48c5b2fa7-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #20 SMP Fri Nov 28 02:43:00 GMT 2025
+Booting Linux on hartid 4
+Linux version 6.17.0-rc1-00009-g0da48c5b2fa7-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #32 SMP Tue Dec  2 12:46:23 GMT 2025
 Machine model: SiFive HiFive Unmatched A00
 SBI specification v0.3 detected
 SBI implementation ID=0x1 Version=0x9
@@ -164,6 +164,9 @@
 fu740-pcie e00000000.pcie: ECAM at [mem 0xdf0000000-0xdffffffff] for [bus 00-ff]
 fu740-pcie e00000000.pcie: Using 256 MSI vectors
 fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4096G
+fu740-pcie e00000000.pcie: dw_pcie_iatu_setup: 921 MEM index: 2
+fu740-pcie e00000000.pcie: dw_pcie_iatu_setup: 941 I/O index: 3
+fu740-pcie e00000000.pcie: dw_pcie_iatu_setup: 949 Final index: 4
 fu740-pcie e00000000.pcie: cap_exp at 70
 fu740-pcie e00000000.pcie: PCIe Gen.1 x8 link up
 fu740-pcie e00000000.pcie: changing speed back to original
@@ -736,6 +739,8 @@
 pcieport 0000:06:01.0: enabling bus mastering
 parport_pc 0000:07:00.0: enabling device (0000 -> 0001)
 PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 35
+parport0: PC-style at 0x1000 (0x1008), irq 35, using FIFO [PCSPP,TRISTATE,EPP,ECP]
+lp0: using parport0 (interrupt-driven).
 parport_pc 0000:07:00.0: vgaarb: pci_notify
 serial 0000:07:00.3: vgaarb: pci_notify
 serial 0000:07:00.3: assign IRQ: got 40

  Maciej

