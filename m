Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A026C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QFtpcA1C7daGYSzXxaBDrbm1JDwXiWkpNq9hbdnx+aw=; b=U9N9lS6BbzcmBa
	O5gCacJU3fe5pG265Fau0d27ruTKe3zI5gbciz8sg5nEV6PFhtguP63j0Oa1wjdyVUEZMGtoUs8xz
	HPtkGpH8IkxvfrdN9FE5KUrZqxAaNjEtLfvFpcEZ2kvq5xLaG+50IaCZSruh8GH7lGSC8B0K08wDA
	IUmMX+I4gVbjpQugm4L89+tVBwF7mNy1sLj1ifLxEX7e6+hNwH7XdSrCyQYcxj6xqvm8j5V3+uhOt
	Nrm1ykivVOx0QwC20ba4T9HbFyiHuAD2Xe0rYG6WWM+9FzKUK7k1dZN3lePIYT10SbV8EMN7muiJx
	/145URB1j2z/dpcgPU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowY-0000000EXWA-2KPz;
	Thu, 12 Jun 2025 20:54:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjAg-0000000Df7t-1jQw;
	Thu, 12 Jun 2025 14:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73D53A4F85E;
	Thu, 12 Jun 2025 14:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0464AC4CEEA;
	Thu, 12 Jun 2025 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739489;
	bh=/4XAl/Uym603PEnwuhOtlVJIOWql+o3h2l1QrsNj3KQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hM3LZUyqdFmUQDcojGiU7qlxGb7eJMZYGxrQ0r6PyBGGVQFKLR3Wc0VYzGZlk1BrL
	 a8xnYgg0vrFigcsWghZSOOgaxhhuEiGiqx+cFiHLUWn7f2T1o7BgLyK1iHgsNLhwWm
	 jXXa8hBJDs7T7KZsyqnYzzeU41lTdsQxzZdGIDR80vkGOSX+Cyr3d8WrPK3Z9prAeT
	 wiOTS/M/cPKN5d6Xf0oiiaCpZGD6MyQg+PEkKPwi/TaTy9dKqCMtBxX2ehWdBjFSNT
	 ocM23lbDvW+AM3EKrIRJJvyECpHwPyyueW2bUjjFyBTJcnaU6etL4a1Z6qYlMuDKkh
	 XHdw6xrCyPF7A==
Date: Thu, 12 Jun 2025 09:44:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <20250612144447.GA903908@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apkamrd6ty2km7mjwz4mpe2xhewxgd3crmeqdmnj7wn6jl4emv@3nwrt43u2ons>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_074450_575637_BF814F19 
X-CRM114-Status: GOOD (  31.15  )
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

On Thu, Jun 12, 2025 at 06:30:37PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jun 12, 2025 at 07:21:08AM -0500, Bjorn Helgaas wrote:
> > On Thu, Jun 12, 2025 at 01:40:23PM +0200, Niklas Cassel wrote:
> > > On Thu, Jun 12, 2025 at 06:38:27AM -0500, Bjorn Helgaas wrote:
> > > > On Thu, Jun 12, 2025 at 01:19:45PM +0200, Niklas Cassel wrote:
> > > > > On Wed, Jun 11, 2025 at 04:14:56PM -0500, Bjorn Helgaas wrote:
> > > > > > On Wed, Jun 11, 2025 at 12:51:42PM +0200, Niklas Cassel wrote:
> > > > > > > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > > > > > > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > > > > > > and instead enumerate the bus directly after receiving the Link Up IRQ.
> > > > > > > 
> > > > > > > This means that there is no longer any delay between link up and the bus
> > > > > > > getting enumerated.
> > > > 
> > > > > > I think the comment at the PCIE_T_RRS_READY_MS definition should be
> > > > > > enough (although it might need to be updated to mention link-up).
> > > > > > This delay is going to be a standard piece of every driver, so it
> > > > > > won't require special notice.
> > > > > 
> > > > > Looking at pci.h, we already have a comment mentioning exactly this
> > > > > (link-up):
> > > > > https://github.com/torvalds/linux/blob/v6.16-rc1/drivers/pci/pci.h#L51-L63
> > > > > 
> > > > > I will change the patches to use PCIE_RESET_CONFIG_DEVICE_WAIT_MS instead.
> > > > 
> > > > I'll more closely later, but I think PCIE_T_RRS_READY_MS and
> > > > PCIE_RESET_CONFIG_DEVICE_WAIT_MS are duplicates and only one should
> > > > exist.  It looks like they got merged at about the same time by
> > > > different people, so we didn't notice.
> > > 
> > > I came to the same conclusion, I will send a patch to remove
> > > PCIE_T_RRS_READY_MS and convert the only existing user to use
> > > PCIE_RESET_CONFIG_DEVICE_WAIT_MS.
> > 
> > I think PCIE_T_RRS_READY_MS expresses the purpose of the wait more
> > specifically.  It's not that the device is completely ready after
> > 100ms; just that it should be able to respond with RRS if it needs
> > more time.
> 
> Yes, but none of the drivers are checking for the RRS status
> currently. So using PCIE_T_RRS_READY_MS gives a wrong impression
> that the driver is waiting for the RRS status from the device.

There's 100ms immediately after reset or link-up when we can't send
config requests because the device may not be able to respond at all.

After 100ms, the device should be able to respond to config requests
with SC, UR, RRS, or CA status (sec 2.2.9.1).  If it responds with
RRS, the access should be retried either by hardware or (if RRS SV is
enabled) by software.  This is the origin of "RRS_READY" -- the device
can at least do RRS.

"CONFIG_READY" would make sense except that it would be confused with
the spec's usage of "Configuration Ready" (unfortunately not formally
defined).  The PCIe r6.0, sec 6.22 implementation note says devices
may take up to 1 second to become Configuration Ready, and that when a
device is Configuration Ready, system software can proceed without
further delay to configure the device.

"PCIE_RESET_CONFIG_DEVICE_WAIT_MS" seems a little long to me (we might
not need "DEVICE"), but it does include "CONFIG" which is definitely
relevant.  "PCIE_RESET_CONFIG_WAIT_MS"?

Bjorn

