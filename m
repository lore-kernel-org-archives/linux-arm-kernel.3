Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD82C71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4M5RaYJulUbWoXifSgx3bTPj3YUj8pSZBzgPM+jUK4=; b=DIzUeTm7lz2Gl1ezEF2hoxCLtV
	SHyBeVUnFpDGSxU63L1yvzEVqmZ204b4Ee5ZaK1+TB2DmdeX5ArtzJUpVrbWvhRiP2evVDYs91E+C
	yXZh9oR7VL30WgFN0QZhm6licAH83w3GCbRmux3Ge/BxpxGiPzE2XygZKp6m9EshaeL3/jQHi7WEF
	kl2VH9sfKhERMBMucJ/OIQzxgAQu/o3rv1LaFs+LJqZXxbIaAxIIwTc9gLOY1jW6vfh5MDc8R1ZEB
	GShtVvlc9MyJjXXUxVVdgbQ4bdQ9M2Dx5x1XV/a9PsKBmIytgQfJMUUdd1AqUyQsKFA0lz9cIDKsC
	uVJsQXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpy-0000000DNGR-398e;
	Thu, 12 Jun 2025 13:19:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfyK-0000000D7rJ-0B5a;
	Thu, 12 Jun 2025 11:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A1AA5C5E68;
	Thu, 12 Jun 2025 11:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05D9C4CEEA;
	Thu, 12 Jun 2025 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749727190;
	bh=cVFIRmuMf6og7Otn6VJlaRqnyuBkLItWoFn62vUOnjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTGQ+cJhe9eZSn5HmAjgjMOPj+acY3/oeNpoK8fL1gqghvZKVnzxOakX7r+haXSBN
	 EL+jVv9tfs1O8+sZRjzU/5akH1X7kfPsUaVG/m7+4diX4raIdu1nTn1V5uY88eDmIJ
	 ZSBKP/3zmgEbntuMMAdFJ5mE3wK2dGCtgX8VTwXM5y3rGoLeWMOKotnPLAzmTg9cDk
	 KlnALPQd3PXlcdquOVqHkun20NWb5kWerPFVydU52CDPIHseFhz3V4cUYuYo5QFt8t
	 Fc/D0fPHbSfPcAFVGLX8/1QpitP5eZ4jwbsDgJ4rnP5+HU3TcMX5soZtUbMRICprBB
	 IEYp1lSkuM7pQ==
Date: Thu, 12 Jun 2025 13:19:45 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <aEq30a7vJmKyYWYT@ryzen>
References: <20250611105140.1639031-7-cassel@kernel.org>
 <20250611211456.GA869983@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611211456.GA869983@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_041952_165560_D27DB7A9 
X-CRM114-Status: GOOD (  20.60  )
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

On Wed, Jun 11, 2025 at 04:14:56PM -0500, Bjorn Helgaas wrote:
> On Wed, Jun 11, 2025 at 12:51:42PM +0200, Niklas Cassel wrote:
> > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > and instead enumerate the bus directly after receiving the Link Up IRQ.
> > 
> > This means that there is no longer any delay between link up and the bus
> > getting enumerated.
> 
> Minor quibble about "no longer any delay": dw_pcie_wait_for_link()
> doesn't contain any explicit delay *after* we notice the link is up,
> so we didn't guarantee sufficient delay even before ec9fd499b9c6.
> 
> If the link came up before the first check, dw_pcie_wait_for_link()
> didn't delay at all.  Otherwise, it delayed 90ms * N, and we have no
> idea when in the 90ms period the link came up, so the post link-up
> delay was effectively some random amount between 0 and 90ms.
> 
> I would propose something like:
> 
>   PCI: dw-rockchip: Wait PCIE_T_RRS_READY_MS after link-up IRQ
> 
>   Per PCIe r6.0, sec 6.6.1, software must generally wait a minimum of
>   100ms (PCIE_T_RRS_READY_MS) after Link training completes before
>   sending a Configuration Request.
> 
>   Prior to ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since
>   we can detect Link Up"), dw-rockchip used dw_pcie_wait_for_link(),
>   which waited between 0 and 90ms after the link came up before we
>   enumerate the bus, and this was apparently enough for most devices.
> 
>   After ec9fd499b9c6, rockchip_pcie_rc_sys_irq_thread() started
>   enumeration immediately when handling the link-up IRQ, and devices
>   (e.g., Laszlo Fiat's PLEXTOR PX-256M8PeGN NVMe SSD) may not be ready
>   to handle config requests yet.
> 
>   Delay PCIE_T_RRS_READY_MS after the link-up IRQ before starting
>   enumeration.

Ok, I will shamelessly use this text verbatim.



> I think the comment at the PCIE_T_RRS_READY_MS definition should be
> enough (although it might need to be updated to mention link-up).
> This delay is going to be a standard piece of every driver, so it
> won't require special notice.

Looking at pci.h, we already have a comment mentioning exactly this
(link-up):
https://github.com/torvalds/linux/blob/v6.16-rc1/drivers/pci/pci.h#L51-L63

I will change the patches to use PCIE_RESET_CONFIG_DEVICE_WAIT_MS instead.


Kind regards,
Niklas

