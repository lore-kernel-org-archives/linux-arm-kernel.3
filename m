Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63FBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 22:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cvG5ebpKTZEmM8Z9VnrAL8jj9cDueMGGayXKA5dUonw=; b=3HrQA4WLj0bH14
	PL5CBZHwZiselYcsljj9tsyQkleGb2yPuekDeCi2S9NslJbLjgfKO3IddNrqPpdcS26tDx56PvV9u
	sli1LBXZdqBfXnIwDyL6cMGzdbkJlt9hkjGMozwWKcWZXEYSrF/PQv1qduIiRrivTUbaGq6saLvFt
	HdMPyb1fHfeZMLwmPGLfQrLPy3sMaNFy1fSjtf5Y7JG8e2NpLZRocrgVIy0G7AIutXaH6WY3eyNhE
	+0NT+AZJ0DVA+TgCxve/jw6xk4qE/mgvKbJYs+HiuVDfQ9mpyLg/z6iUAgYhWKPoisO+lY4Dhl2Qc
	p1hVmVoVc9xhcDR+iPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDdo-00000009DAK-19wg;
	Mon, 02 Jun 2025 22:28:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCZP-00000008y1S-0vLP;
	Mon, 02 Jun 2025 21:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88DF243C9D;
	Mon,  2 Jun 2025 21:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3319DC4CEEB;
	Mon,  2 Jun 2025 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748899186;
	bh=6mj/BlYXhWA2zqQmobSnww4HV6I3qNHM38OyJ0T6thY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IfLj37KIEU0Jy+o62Y0/R/gpmCidEqsAZWzdxwnL5HG85g62rUbIrFSLo1ASjyW0E
	 y087JbYvyqH6P0sxoL5Qky0xSKuJSHtn/j8nE76kFXO/pv8Yvty3tt8qc7yiB5Xyfw
	 oR7816Es3kjDy+NpaxUuATsG/9yz3l6s0Mcf5TX3TWFDvUxPJHfYJve1DpFDrl5/TD
	 aTidwE3xAY+YwOXO+C4kxAEjuR3zzU0LFIplBOpp/6XKnqvxU1wpzdPOrFATsTLkVs
	 9KPt/oUZvn0rRo5D+EdjpdLuaozVtiIt7kB8psup46KAwCEAani/+R9Zz46DS9un6V
	 bN+Em+YzTa7Vg==
Date: Mon, 2 Jun 2025 16:19:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250602211944.GA150795@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_141947_300635_78DDB566 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> The PCI link, when down, needs to be recovered to bring it back. But that
> cannot be done in a generic way as link recovery procedure is specific to
> host bridges. So add a new API pci_host_handle_link_down() that could be
> called by the host bridge drivers when the link goes down.

IIUC you plumbed this into the reset path so the standard entries
(pci_reset_function() and the sysfs "reset" files) work can now work
for Root Ports on DT systems just like they do for ACPI systems
(assuming the ACPI systems supply an _RST method for the ports).  That
all sounds good.

> The API will iterate through all the slots and calls the pcie_do_recovery()
> function with 'pci_channel_io_frozen' as the state. This will result in the
> execution of the AER Fatal error handling code. Since the link down
> recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First the AER error_detected
> callback will be triggered for the bridge and the downstream devices. Then,
> pci_host_reset_slot() will be called for the slot, which will reset the
> slot using 'reset_slot' callback to recover the link. Once that's done,
> resume message will be broadcasted to the bridge and the downstream devices
> indicating successful link recovery.

We have standard PCIe mechanisms to learn about "link down" events,
e.g., AER Surprise Down error reporting and the Data Link Layer State
Changed events for hot-plug capable ports.

How does this controller-specific "link down" notification relate to
those?  Is this for controllers that don't support those AER or
hotplug mechanisms?  Or is this a different scenario that wouldn't be
covered by them?

If AER is enabled, do we get both the AER interrupt and the controller
"link down" interrupt?

> In case if the AER support is not enabled in the kernel, only
> pci_bus_error_reset() will be called for each slots as there is no way we
> could inform the drivers about link recovery.

