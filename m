Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DC4CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5z82KRw7kGCL+JcSr/9I68QG3ZSmlgUeGDgaSLDqohc=; b=DGJB999GbwQz95W1KzYE3L3xow
	RVes98gkvD/W0er5hmc7aV2zWlkaQjBcCsgzTeLvbg6FnV7/zRb3PzecfOLHnuIiBaaiFdZV17sJ4
	FXRHO1CCkqaW5kLrWq5eMIPgb+y/14RL9SZPtu2xAIKcoIfka8kPXUYmSMpzRppjYL2r3d/abzR/l
	2xjS3HEB+LycL8s3CxdW8qJcXIzb0eABo7Fjxzw6dqZ3HS89ils4LH4Th59Tx1aZwrIJvrJAxVjoB
	CMEw9BXd4wZozTd8r5BukHZ2Mio6VQ5sJWre+2PgY4xgFRrJrUUbLD24jYWMndVCle9Znz7rol/gj
	HIz0b2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usytI-0000000BQi8-2C2s;
	Mon, 01 Sep 2025 07:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyHi-0000000BMLj-49Pu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A70A74059C;
	Mon,  1 Sep 2025 06:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90986C4CEF0;
	Mon,  1 Sep 2025 06:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756709098;
	bh=v2eZIqPOo2OudPRqDX5kzJtAjfTXJAadp0/fdfmvLZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pUWXj12y/46qUHn/Ji4NDqSOkiEAFPhAk/HA28xDSFlq608cUDldqgm0BqowQfybX
	 TdqhHMeZjfv+8OP5DfS56YA6zEZDbBuGlWE9fpfDUaC6fJN2PvoRfUNaGy3QxE6zg/
	 eS7exKNlmjIsKz0Qsox+fhdqhY49+ajcxrR1ZlQv6Z2orPxTxXcV5Yw/te2U0A6jLU
	 TuZ/b1Q6UOb1fSOaD+72HuuRx2rAQElzhl2R2UW95EpMPrrP3ddKpl8F7ricUw3Psm
	 52tNVEHJJrzmXIilswkxejmhP8NJJ7P3wHAmjAoqNChN2SKtlE4KKFU/QJO3YZ2V+H
	 dMbsTxAQLAnhg==
Date: Mon, 1 Sep 2025 12:14:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, helgaas@kernel.org, kishon@kernel.org, vigneshr@ti.com, 
	stable@vger.kernel.org, linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v3] PCI: j721e: Fix programming sequence of "strap"
 settings
Message-ID: <3wc3t6y5gzzspgfeklsqo3bupfp6gsfy6mls6t66hflcqlqsfk@cu26wv3sow4y>
References: <20250829091707.2990211-1-s-vadapalli@ti.com>
 <oztilfun77apxtjxumx4tydkcd2gsalsak4m2rvsry2oooqjna@2yvcx6cnuemm>
 <b2fb9252-6bfc-45da-973a-31cdfcc86b3d@ti.com>
 <z3ubracmtlq23yicbrhqjgnzrfoqheffm6cvhfnawlvbu4cmmp@ddu2o7xhw5tz>
 <48e9d897-2cd3-48ef-b46a-635ae75f5ac6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48e9d897-2cd3-48ef-b46a-635ae75f5ac6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_234459_077984_9C03AD75 
X-CRM114-Status: GOOD (  32.65  )
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

On Mon, Sep 01, 2025 at 11:51:33AM GMT, Siddharth Vadapalli wrote:
> On Mon, Sep 01, 2025 at 11:18:23AM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Sep 01, 2025 at 10:27:51AM GMT, Siddharth Vadapalli wrote:
> > > On Sun, Aug 31, 2025 at 06:15:13PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > Hello Mani,
> > > 
> > > > On Fri, Aug 29, 2025 at 02:46:28PM GMT, Siddharth Vadapalli wrote:
> 
> [...]
> 
> > > > > +	/*
> > > > > +	 * The PCIe Controller's registers have different "reset-values"
> > > > > +	 * depending on the "strap" settings programmed into the PCIEn_CTRL
> > > > > +	 * register within the CTRL_MMR memory-mapped register space.
> > > > > +	 * The registers latch onto a "reset-value" based on the "strap"
> > > > > +	 * settings sampled after the PCIe Controller is powered on.
> > > > > +	 * To ensure that the "reset-values" are sampled accurately, power
> > > > > +	 * off the PCIe Controller before programming the "strap" settings
> > > > > +	 * and power it on after that.
> > > > > +	 */
> > > > > +	ret = pm_runtime_put_sync(dev);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Failed to power off PCIe Controller\n");
> > > > > +		return ret;
> > > > > +	}
> > > > 
> > > > How does the controller gets powered off after pm_runtime_put_sync() since you
> > > > do not have runtime PM callbacks? I believe the parent is turning off the power
> > > > domain?
> > > 
> > > By invoking 'pm_runtime_put_sync(dev)', the ref-count is being
> > > decremented and it results in the device being powered off. I have
> > > verified it by printing the power domain index within the functions for
> > > powering off and powering on devices on the J7200 SoC. Logs:
> > > 
> > > 	root@j7200-evm:~# modprobe pci_j721e
> > > 	[   25.231675] [Powering On]: 240
> > > 	[   25.234848] j721e-pcie 2910000.pcie: host bridge /bus@100000/pcie@2910000 ranges:
> > > 	[   25.242378] j721e-pcie 2910000.pcie:       IO 0x4100001000..0x4100100fff -> 0x0000001000
> > > 	[   25.250496] j721e-pcie 2910000.pcie:      MEM 0x4100101000..0x41ffffffff -> 0x0000101000
> > > 	[   25.258588] j721e-pcie 2910000.pcie:   IB MEM 0x0000000000..0xffffffffffff -> 0x0000000000
> > > 	[   25.267098] [Powering Off]: 240
> > > 	[   25.270318] [Powering On]: 240
> > > 	[   25.273511] [Powering On]: 187
> > > 	[   26.372361] j721e-pcie 2910000.pcie: PCI host bridge to bus 0000:00
> > > 	[   26.378666] pci_bus 0000:00: root bus resource [bus 00-ff]
> > > 	[   26.384156] pci_bus 0000:00: root bus resource [io  0x0000-0xfffff] (bus address [0x1000-0x100fff])
> > > 	[   26.393197] pci_bus 0000:00: root bus resource [mem 0x4100101000-0x41ffffffff] (bus address [0x00101000-0xffffffff])
> > > 	[   26.403728] pci 0000:00:00.0: [104c:b00f] type 01 class 0x060400 PCIe Root Port
> > > 	[   26.411044] pci 0000:00:00.0: PCI bridge to [bus 00]
> > > 	[   26.416009] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
> > > 	[   26.422091] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> > > 	[   26.428874] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
> > > 	[   26.436676] pci 0000:00:00.0: supports D1
> > > 	[   26.440699] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
> > > 	[   26.448064] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> > > 	[   26.456274] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> > > 	[   26.462923] pci 0000:00:00.0: PCI bridge to [bus 01]
> > > 	[   26.467933] pci_bus 0000:00: resource 4 [io  0x0000-0xfffff]
> > > 	[   26.473595] pci_bus 0000:00: resource 5 [mem 0x4100101000-0x41ffffffff]
> > > 	[   26.480337] pcieport 0000:00:00.0: of_irq_parse_pci: failed with rc=-22
> > > 	[   26.487479] pcieport 0000:00:00.0: PME: Signaling with IRQ 701
> > > 	[   26.493909] pcieport 0000:00:00.0: AER: enabled with IRQ 701
> > > 
> > > In the above logs, '240' is the Power Domain Index for the PCIe
> > > Controller on J7200 SoC. It is powered on initially before the driver is
> > > probed.
> > 
> > In that case, the driver should not call pm_runtime_get_sync() in its probe.
> > What it should do is:
> > 
> > 	pm_runtime_set_active()
> > 	pm_runtime_enable()
> 
> If I understand correctly, are you suggesting the following?
> 
> j721e_pcie_probe()
> 	pm_runtime_set_active()
> 	pm_runtime_enable()
> 	ret = j721e_pcie_ctrl_init(pcie);
> 		/*
> 		 * PCIe Controller should be powered off here, but is there
> 		 * a way to ensure that it has been powered off?
> 		 */
> 		=> Program the strap settings and return to
> 		j721e_pcie_probe()
> 	/* Power on the PCIe Controller now */
> 	ret = pm_runtime_get_sync(dev);

This pm_runtime_get_sync() should be part of j721e_pcie_ctrl_init() where you
do power off, program strap and power on.

This should not be part of probe() as by that time, controller is already
powered on. So pm_runtime_set_active() and pm_runtime_enable() should be enough
to convey the state of the device to PM core.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

