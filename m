Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC30CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4JoXUWI68dUNflYbV98fyocDkdSzyS+4MovMEppf1M=; b=eTLiTwVnQnunpFiFZ3GQIc0xvH
	hiIhyZda3sai897aQqZfcrhm2NR+cP0HargIB7rIgcEL1DCijDqKd0SYNYJjCLy9Wj1vH8uoSLGq8
	rlzgIFTQZWts4SneN6yiTzV+udPxKrS59RLLTWxbXjrzzu0rulWTEf/rj/rc5YjJ2SQ3peDDVC11d
	8iv//lIYo9C7HmrB3E3aymfV7ayRVsNhmreeAuCl6/m7sAm0gFSYSrUOy3bQfONVJ4utL7kQ0yOGV
	f6jB854dhFUXS7aI/BdCUx3YU4B9df9PfGcR53gWpLmFN6DEqWyETKmqJ67iodD/ca1ksx3hVeYTW
	3vHYOwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7om-0000000B6kP-3mXu;
	Thu, 04 Sep 2025 11:07:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6yV-0000000AnpH-0hQp;
	Thu, 04 Sep 2025 10:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9414560210;
	Thu,  4 Sep 2025 10:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A65C4CEF0;
	Thu,  4 Sep 2025 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756980830;
	bh=TaCx2xdJ0PkyIQESevtrNgnqTCDtw2YcyYY/Mn7haVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbaN6Yjznr5n3Gogxrsx99hUcU54nZ3/fhnW5jw8827xmZUpTdL0M+x2zcrkKwdSr
	 trKtFHUXICoR0Xtx3Wbnyr5gw63yTDdUsLaUsHsVCp7HunCjNBGw/MB5D+pb1lpr5G
	 wMBAHcGyWwaUHK1j8FAbAVsfuDRbUjmc16AiEWPvPSb21XPNUNlCPL+h8f9sV6Joqw
	 NDiK8o1f1BuiCRt7RsPXBmzmB6YyWWEquxW3QZAMneehJos4WyLbIVxIAgLfcgW8Zy
	 TSB/mkGN5d2iXf0RkLf7zYyD/C7Z68NpUDPcWEKUrY/jDeyFfWcM59N1y8QeTidVnP
	 JcmXOFrYFRL2w==
Date: Thu, 4 Sep 2025 12:13:43 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com, heiko@sntech.de,
	mani@kernel.org, yue.wang@amlogic.com, pali@kernel.org,
	neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 1/2] PCI: Configure root port MPS during host probing
Message-ID: <aLlmV8Qiaph1PHFY@ryzen>
References: <20250620155507.1022099-2-18255117159@163.com>
 <20250902174828.GA1165373@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902174828.GA1165373@bhelgaas>
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

On Tue, Sep 02, 2025 at 12:48:28PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 20, 2025 at 11:55:06PM +0800, Hans Zhang wrote:
> > Current PCIe initialization logic may leave root ports operating with
> > non-optimal Maximum Payload Size (MPS) settings. While downstream device
> > configuration is handled during bus enumeration, root port MPS values
> > inherited from firmware or hardware defaults ...
> 
> Apparently Root Port MPS configuration is different from that for
> downstream devices?

pci_host_probe() will call pci_scan_root_bus_bridge(), which will call
pci_scan_single_device(), which will call pci_device_add(), which will
call pci_configure_device(), which will call pci_configure_mps().

This will be done for both bridges and endpoints.

The bridge will be scanned/added first, before devices behind the bridge.


While pci_configure_device()/pci_configure_mps() will be called for both
bridges and endpoints, pci_configure_mps() will do an early return for
devices where pci_upstream_bridge() returns NULL, i.e. for devices where
that does not have an upstream bridge, i.e. for the root bridge itself:
https://github.com/torvalds/linux/blob/v6.17-rc4/drivers/pci/probe.c#L2181-L2182

So MPS will not be touched for root bridges.

This patch ensures that MPS for root bridges gets initialized to MPSS
(Max supported MPS).

Later, when pci_configure_device()/pci_configure_mps() is called for a
device behind the bridge, if the MPSS of the device behind the bridge is
smaller than the MPS of the bridge, the code reduces the MPS of the bridge:
https://github.com/torvalds/linux/blob/v6.17-rc4/drivers/pci/probe.c#L2205


My only question with this patch is if there is a bridge behind a bridge,
will the bridge behind the bridge still have pci_pcie_type() ==
PCI_EXP_TYPE_ROOT_PORT ?

If so, perhaps we should modify this patch from:

+       if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+           pcie_bus_config != PCIE_BUS_TUNE_OFF) {
+               pcie_write_mps(dev, 128 << dev->pcie_mpss);
+       }
+
        if (!bridge || !pci_is_pcie(bridge))
                return;


to:

+       if (!bridge && pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+           pcie_bus_config != PCIE_BUS_TUNE_OFF) {
+               pcie_write_mps(dev, 128 << dev->pcie_mpss);
+       }
+
        if (!bridge || !pci_is_pcie(bridge))
                return;



> > During host controller probing phase, when PCIe bus tuning is enabled,
> > the implementation now configures root port MPS settings to their
> > hardware-supported maximum values. Specifically, when configuring the MPS
> > for a PCIe device, if the device is a root port and the bus tuning is not
> > disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
> > match the Root Port's maximum supported payload size. The Max Read Request
> > Size (MRRS) is subsequently adjusted through existing companion logic to
> > maintain compatibility with PCIe specifications.
> > 
> > Note that this initial setting of the root port MPS to the maximum might
> > be reduced later during the enumeration of downstream devices if any of
> > those devices do not support the maximum MPS of the root port.
> > 
> > Explicit initialization at host probing stage ensures consistent PCIe
> > topology configuration before downstream devices perform their own MPS
> > negotiations. This proactive approach addresses platform-specific
> > requirements where controller drivers depend on properly initialized
> > root port settings, while maintaining backward compatibility through
> > PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
> > utilized without altering existing device negotiation behaviors.
> 
> This last paragraph seems kind of like marketing without any real
> content.  Is there something important in there?
> 
> Nits:
> s/root port/Root Port/
> 
> Reword "implementation now configures" to be clear about whether "now"
> refers to before this patch or after.
> 
> Update the MRRS "to maintain compatibility" part.  I'm dubious about
> there being a spec compatibility issue with respect to MRRS.  Cite the
> relevant section if there is an issue.

I'm not sure why the commit message mentions MRRS at all.

Sure, pcie_write_mrrs() might set MRRS to MPS, but that is existing logic
and not really related to the change in this patch IMO.


Kind regards,
Niklas

