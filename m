Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69503D0EE04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kch+74Yeq8EILFIjEN7X09q/J2+Myv5D2a42yAnmqc=; b=VzoUtfQKmR61E5bcZlxN1P3KkZ
	sNsreS7oGGMSGatk4fODymP5dE8FP0xuFeyD5iFglU1Q84bbgPe0HMsdu7PgZ/vFqtNFldypoMMHm
	qBiEZ128aOGfY0TvDd0M9kRLxiLJ6n+oKRjqoRW1RK6zGIuD6PZo+rfOsyFbns6BxK8MnG4J/GmGp
	8knoin5cHMNkVwbeOTPsb6Eubh2AF5FLALyg8iMxfRhQUTH23SfIUy68NS7K0cn+Ptc5tUgFgVxtf
	ovs3DUDhlsbHvLNIGFRGIVJjlFvg9HoniNx4Dv5q1fU8gev2wtWntillAq+HFjwZKHi/UftKEiFld
	jFBuCaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvbS-0000000DYjI-2HvC;
	Tue, 25 Nov 2025 16:09:18 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvbQ-0000000DYis-0Dav;
	Tue, 25 Nov 2025 16:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=/kch+74Yeq8EILFIjEN7X09q/J2+Myv5D2a42yAnmqc=;
	b=hldxVIUE8RJV5Cd4vd8+1Bar4p4oQVmUhVYxZ1HlPkBAXQmWuGya8SUlf+oXFV
	gxi+lYBrYtTIeW0LArfQzDwb1sXXyMfnbb8nvQiPXDErvd+W1O//YD0K9KOL7F+B
	9eJCQlIFlOP7J7aYf31SwihzsPrWScaUiu2Jld76az1H4=
Received: from nilq-virtual-machine.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgDnr6FD1CVpPd6NCA--.15077S2;
	Wed, 26 Nov 2025 00:07:33 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: maz@kernel.org
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	conor+dt@kernel.org,
	dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn,
	devicetree@vger.kernel.org,
	frowand.list@gmail.com,
	guo.chang2@zte.com.cn,
	hu.yuye@zte.com.cn,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.qingtao2@zte.com.cn,
	liu.wenhong35@zte.com.cn,
	ni.liqiang@zte.com.cn,
	ni_liqiang@126.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	saravanak@google.com,
	sunilvl@ventanamicro.com,
	tglx@linutronix.de,
	wu.jiabao@zte.com.cn
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for direct-mode
Date: Wed, 26 Nov 2025 00:07:31 +0800
Message-Id: <20251125160731.4902-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87ms4eflvt.wl-maz@kernel.org>
References: <87ms4eflvt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCkvCgDnr6FD1CVpPd6NCA--.15077S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjeHqDUUUU
X-Originating-IP: [111.162.113.123]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiYB4R5WklSmqxGAABsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_080916_444187_5F0744D1 
X-CRM114-Status: GOOD (  37.38  )
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

Dear Marc and all concerned,

> > > > diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
> > > > +static const struct of_device_id aplic_match[] = {
> > > > + { .compatible = "riscv,aplic" },
> > > > + {}
> > > > +};
> > > > +
> > > > +static struct platform_driver aplic_driver = {
> > > > + .driver = {
> > > > +  .name  = "riscv-aplic",
> > > > +  .of_match_table = aplic_match,
> > > > + },
> > > > + .probe = aplic_probe,
> > > > +};
> > > > +builtin_platform_driver(aplic_driver);
> > > 
> > > Dear Anup Patel and all concerned,
> > > 
> > > I am writing to inquire about the historical rationale behind defining the APLIC driver's
> > > initialization priority using builtin_platform_driver in the current implementation.
> > > 
> > > In our environment, we are encountering an issue where this priority level causes ACPI-based PCIe
> > > enumeration to be executed in the system_unbound_wq work queue. This parallel execution model
> > > results in PCIe devices being enumerated in an arbitrary order rather than strictly following the
> > > sequence defined in the ACPI DSDT table.
> > > 
> > > The random enumeration order is adversely affecting customer experience, particularly in scenarios
> > > where device ordering is critical for proper system operation or application compatibility.
> > > 
> > > We are considering modifying the APLIC driver's initialization priority to ensure PCIe enumeration
> > > occurs sequentially according to the DSDT specification. However, before proceeding with such
> > > changes, we wanted to consult with you regarding:
> > > 
> > > 1. Were there specific technical considerations that led to the current priority selection?
> > > 2. Are there any potential side effects or broader impacts that we might have overlooked?
> > > 3. Would you support such a priority adjustment, or do you have alternative suggestions to 
> > > address the enumeration order issue?
> > > 
> > > We greatly appreciate your insights and expertise on this matter, as it will help us make an
> > > informed decision while maintaining system stability and compatibility.
> > > 
> > > Thank you for your time and consideration.
> > > 
> > 
> > IRQ subsystem maintainers rejected the idea of relying on initcalls to
> > enforce probe order because initcalls do not guarantee ordering. The
> > Linux driver model instead ensures probe order through device
> > dependencies. Since PCI INTx depends on the APLIC being probed first,
> > the PCI host bridge probe cannot occur until after the APLIC probe
> > completes. This requirement and behavior are the same for both DT and
> > ACPI. In DT, the driver model uses fw_devlink to establish probe
> > ordering, while in ACPI this is handled through either an explicit _DEP
> > or, on RISC-V, the GSI mapping.
> > Typically, this dependency appears in the DSDT only for the PCI host
> > bridge. Individual PCIe devices are enumerated through the standard PCI
> > scan once the host bridge has been probed. Therefore, I’m not sure what
> > you meant by a probe sequence defined in the DSDT for PCIe devices.
> > Regards,
> > Sunil
> 
> I understand the scenario you described with a single PCI host bridge, where devices are enumerated
> through standard PCIe scanning after the host bridge completes probing. However, in ARM and RISC-V
> architectures, systems often have multiple PCI host bridges. We're currently facing an issue in a
> 6-host-bridge system where all bridges depend on the APLIC driver. They must wait until the APLIC
> driver completes and callsacpi_dev_clear_dependenciesto resolve dependencies, after which they're
> sequentially added to the system_unbound_wq work queue. However, during execution in the work queue,
> these 6 host bridges undergo parallel enumeration, preventing them from following the order defined
> in the firmware's ACPI DSDT table. Specifically:
> 1. The ACPI DSDT table declares the 6 host bridges in a fixed sequence
> Device(PC06) {
>     Name(_HID, "PNP0A08")
>     Name(_CID, "PNP0A03")
>     Name(_UID, 0x6)
>    ......
> }
> Device(PC07) {
>     Name(_HID, "PNP0A08")
>     Name(_CID, "PNP0A03")
>     Name(_UID, 0x7)
>     ......
> }
> Device(PC08) {
>     Name(_HID, "PNP0A08")
>     Name(_CID, "PNP0A03")
>     Name(_UID, 0x8)
>     .....
> }
> ...
> Device(PC11) {
>     Name(_HID, "PNP0A08")
>     Name(_CID, "PNP0A03")
>     Name(_UID, 0xB)
> ......
> }
> 
> 2. But the OS enumerates them in random order upon each boot (first boot sequence ≠ second boot sequence)
> first boot sequence ~ # dmesg |grep -i "PCI Root"
> [ 8794.588531] ACPI: PCI Root Bridge [PC08] (domain 0006 [bus 80-ff])
> [ 8794.624478] ACPI: PCI Root Bridge [PC06] (domain 0005 [bus 00-ff])
> [ 8794.672741] ACPI: PCI Root Bridge [PC10] (domain 0008 [bus 00-ff])
> [ 8794.696680] ACPI: PCI Root Bridge [PC07] (domain 0006 [bus 00-7f])
> [ 8794.728234] ACPI: PCI Root Bridge [PC11] (domain 0009 [bus 00-ff])
> [ 8794.755098] ACPI: PCI Root Bridge [PC09] (domain 0007 [bus 00-ff])
> second boot sequence ~ # dmesg |grep -i "PCI Root"
> [ 8794.588531] ACPI: PCI Root Bridge [PC09] (domain 0007 [bus 00-ff])
> [ 8794.624478] ACPI: PCI Root Bridge [PC06] (domain 0005 [bus 00-ff])
> [ 8794.672741] ACPI: PCI Root Bridge [PC08] (domain 0006 [bus 80-ff])
> [ 8794.696680] ACPI: PCI Root Bridge [PC11] (domain 0009 [bus 00-ff])
> [ 8794.728234] ACPI: PCI Root Bridge [PC07] (domain 0006 [bus 00-7f])
> [ 8794.755098] ACPI: PCI Root Bridge [PC10] (domain 0008 [bus 00-ff])
> 
> This creates a critical issue: when NVMe devices are connected to these host bridges, the
> unpredictable kernel scanning sequence causes device identifiers (e.g., /dev/nvme0n1, /dev/nvme1n1)
> to change across reboots. In server environments, such device naming instability is unacceptable as
> it breaks storage configuration reliability and consistency.
> 
> So far, we've only observed this disorderly enumeration in RISC-V multi-host-bridge scenarios, where
> APLIC dependency leads to enumeration via system_unbound_wq. We'd like to consult kernel experts:
> 1. Has the impact of enumeration disorder in multi-host-bridge scenarios been considered?
> 2. Are there viable solutions to address the random enumeration caused by system_unbound_wq?

Thank you for your previous suggestion regarding the use of udev. We have carefully implemented this
approach, but found that while udev can create symbolic links, it doesn't resolve the underlying
issue of device ordering in lsblk output, which remains important for our use case.

In our large-scale server deployment comprising hundreds of machines, the udev approach presents
several operational challenges:
1. Management Complexity: Maintaining per-machine udev rules across our entire infrastructure is not scalable.
2. Customer Workflow Dependencies: Our customers rely on consistent lsblk output and direct device
names for their operational workflows and automated scripts.
3. Scalability Limitations: We use standardized hardware configurations where consistent behavior
should be the default, rather than requiring per-machine customization.

We've noticed that PCIe enumeration order tends to vary across system reboots (for example: first
boot showed PC08->PC06->PC10->PC07->PC11->PC09, while second boot showed
PC09->PC06->PC08->PC11->PC07->PC10), even though the ACPI firmware consistently reports the root
bridge sequence as PC06->PC07->PC08->PC09->PC10->PC11.

In our testing, we found that adjusting the registration priority of the aplic driver seems to help
ensure the interrupt controller initializes before PCI enumeration, leading to more consistent
device ordering.

We'd be grateful for your expert advice on a few questions:
1. Are there any dependencies or implications we might have missed with this priority adjustment?
2. Would you happen to know of any other kernel-level approaches that could help with enumeration ordering?
3. We're curious if there might be any ongoing discussions about making enumeration more
deterministic for standardized server environments?

We fully understand there are good reasons behind the current design, but the variable ordering has
been somewhat challenging for our users. We'd appreciate any guidance you might offer on the best
way forward.

Thank you for your time and valuable insights.

Best regards,
Liqiang


