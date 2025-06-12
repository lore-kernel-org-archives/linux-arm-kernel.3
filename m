Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E883DC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtQJv0RTrMd+4eARveiNX/r+vLLDHZOFNXZ+EHiCc8Y=; b=it72kPyxi49G/GLlXdM6d/Ctru
	5xoY4vIPjyikD6D+X1Uh7owBAk1i6gFeQn3EtzEznjRIOBcZ+1BHNyat5PP5/Kv9RKUYQRYbZmKi2
	Lvrx0qqscPylah7kaO/Umz9A0gFOqHtJ+PpxCcubatPZVEcsUT1xm1Z1S9wA60p5HJcu0B3W5oqTG
	PZu+oTR2+v9L4/f/VL/VUfHxAWOwdGc7i27pNqgeGq9ttTii2r7Ni74hfNDgLhuFBqIeH8LUdNGQE
	UQ77GhcRwq9FNx/NZv+Vmhf5IDf924qZmvNp+GHRvBfWA4IypYTaf6qrPRUKhJNx4+Me9ZMv+bcup
	me0bvd1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnmm-0000000EDcN-0wU6;
	Thu, 12 Jun 2025 19:40:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhXz-0000000DJpE-1EXp;
	Thu, 12 Jun 2025 13:00:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A137629ED;
	Thu, 12 Jun 2025 13:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97055C4CEEA;
	Thu, 12 Jun 2025 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749733246;
	bh=98J4zwVuQp/nbB05Jiw3q7/W838MgXOQSKEV80NOtco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFwezS59tRXNI07znkqsGmf11eibxUmJ5WAEOCUQNxsdiVh8uUUbkBCWCuyBHBeHa
	 0Y1M4y5lvUb8GEQ4p0gZ8vtrGlzLnhgtGY8k7DlduItEx+B8IpVpBJbHbDB1rL35wS
	 HQoD/H49516e6BP4JggsLnBhRJOly71NSZ/k75QOUjAL2XYdiq/OaRBIDp5QCriqlw
	 yhnibje7Apf1SyXtYkhFl3rbU3aRF79hRHwSOTFYB4aV8ISLzkqZxhoKwmmFPrcRT2
	 S1XF1r0Mo5TPHYgsy1kNALIAAur9YJZFl8fFGTiHyUPOwMAD//EM0yDJDm5qJnPSrm
	 52ggHCrbOx54A==
Date: Thu, 12 Jun 2025 18:30:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Laszlo Fiat <laszlo.fiat@proton.me>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <apkamrd6ty2km7mjwz4mpe2xhewxgd3crmeqdmnj7wn6jl4emv@3nwrt43u2ons>
References: <aEq8pxE45PmeXN_W@ryzen>
 <20250612122108.GA901642@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612122108.GA901642@bhelgaas>
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

On Thu, Jun 12, 2025 at 07:21:08AM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 12, 2025 at 01:40:23PM +0200, Niklas Cassel wrote:
> > On Thu, Jun 12, 2025 at 06:38:27AM -0500, Bjorn Helgaas wrote:
> > > On Thu, Jun 12, 2025 at 01:19:45PM +0200, Niklas Cassel wrote:
> > > > On Wed, Jun 11, 2025 at 04:14:56PM -0500, Bjorn Helgaas wrote:
> > > > > On Wed, Jun 11, 2025 at 12:51:42PM +0200, Niklas Cassel wrote:
> > > > > > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > > > > > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > > > > > and instead enumerate the bus directly after receiving the Link Up IRQ.
> > > > > > 
> > > > > > This means that there is no longer any delay between link up and the bus
> > > > > > getting enumerated.
> > > 
> > > > > I think the comment at the PCIE_T_RRS_READY_MS definition should be
> > > > > enough (although it might need to be updated to mention link-up).
> > > > > This delay is going to be a standard piece of every driver, so it
> > > > > won't require special notice.
> > > > 
> > > > Looking at pci.h, we already have a comment mentioning exactly this
> > > > (link-up):
> > > > https://github.com/torvalds/linux/blob/v6.16-rc1/drivers/pci/pci.h#L51-L63
> > > > 
> > > > I will change the patches to use PCIE_RESET_CONFIG_DEVICE_WAIT_MS instead.
> > > 
> > > I'll more closely later, but I think PCIE_T_RRS_READY_MS and
> > > PCIE_RESET_CONFIG_DEVICE_WAIT_MS are duplicates and only one should
> > > exist.  It looks like they got merged at about the same time by
> > > different people, so we didn't notice.
> > 
> > I came to the same conclusion, I will send a patch to remove
> > PCIE_T_RRS_READY_MS and convert the only existing user to use
> > PCIE_RESET_CONFIG_DEVICE_WAIT_MS.
> 
> I think PCIE_T_RRS_READY_MS expresses the purpose of the wait more
> specifically.  It's not that the device is completely ready after
> 100ms; just that it should be able to respond with RRS if it needs
> more time.

Yes, but none of the drivers are checking for the RRS status currently. So using
PCIE_T_RRS_READY_MS gives a wrong impression that the driver is waiting for the
RRS status from the device.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

