Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F67C71148
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1WNAXXSOxT4DLp1YMQMWXGbDAEfwxLyPcvFozLrc3Ck=; b=LezzOVG9msHTb4
	grkxJhUSWU6EdIjdwrm6OZ17IXnEEqQq+TkzY9ZD3qV14dV3/PDzFBiMqtSmF0dL/L8H8ONYCwla5
	KIWORA2MGMQATqHsV4RNh2nL1fh/Mp/Gb9sS0CiSr9bKAp9ysbrg1ZZ/d49baSNFlIOxXcMGUsYnk
	hQlFUPQ/QKOvadxlTGmuwSyRT2gU9LXrXcEAnvNTdbBr3ha/CZELkbWzwsLZ7kuhma2JKWJCaKwvP
	ABAO4gnG0oQd6/CoOXAIQ4exUz+JCa9snkfMyVeAzo/LtKaeDk/xNFelkT0xZU8kepA+Y1QOzIdF1
	G3TaN3d1k/IKQjJzsSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhqB-0000000DNeO-1hNq;
	Thu, 12 Jun 2025 13:19:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgGL-0000000DA0g-25T4;
	Thu, 12 Jun 2025 11:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 535425C5FC6;
	Thu, 12 Jun 2025 11:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847A9C4CEEA;
	Thu, 12 Jun 2025 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749728308;
	bh=dvltVZQeoJH8CB+yRsJHbwu0+yuikY9e90OT10169d0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GrH18u1GPneQW7cOB0tVsoOuu1hgWVJxGhLrjZbuYvHScNf5YSmVvlriPaUHQ90Zd
	 HWZQt0e3K1zO6F785Ejp9okiBIFHvw2yknOeeF68PnN7BN2ymVXjbPwHHo2BIB50X2
	 0goe6kd+q+kuiFZT+WMjVRsCX/krBul9Z6Zp+yDz69fH+aAwNXQBz3eGuTXt+l0Wb8
	 bAiFz0TOsEAFlSqL1h8+M+zH6IFC8lJCUJz4cuClf1hTJVPjclFLg9Li4FtvNq3g/1
	 04xDN99xb2kcnW+QLV6y4YaN21OZtLGukX/Gr6A77ocX7daz8VKRaJA3tjcb5J+PE0
	 MqmItp9DXUg7w==
Date: Thu, 12 Jun 2025 06:38:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
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
Message-ID: <20250612113827.GA894522@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEq30a7vJmKyYWYT@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_043829_575388_CC648EBD 
X-CRM114-Status: GOOD (  17.68  )
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

On Thu, Jun 12, 2025 at 01:19:45PM +0200, Niklas Cassel wrote:
> On Wed, Jun 11, 2025 at 04:14:56PM -0500, Bjorn Helgaas wrote:
> > On Wed, Jun 11, 2025 at 12:51:42PM +0200, Niklas Cassel wrote:
> > > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > > and instead enumerate the bus directly after receiving the Link Up IRQ.
> > > 
> > > This means that there is no longer any delay between link up and the bus
> > > getting enumerated.

> > I think the comment at the PCIE_T_RRS_READY_MS definition should be
> > enough (although it might need to be updated to mention link-up).
> > This delay is going to be a standard piece of every driver, so it
> > won't require special notice.
> 
> Looking at pci.h, we already have a comment mentioning exactly this
> (link-up):
> https://github.com/torvalds/linux/blob/v6.16-rc1/drivers/pci/pci.h#L51-L63
> 
> I will change the patches to use PCIE_RESET_CONFIG_DEVICE_WAIT_MS instead.

I'll more closely later, but I think PCIE_T_RRS_READY_MS and
PCIE_RESET_CONFIG_DEVICE_WAIT_MS are duplicates and only one should
exist.  It looks like they got merged at about the same time by
different people, so we didn't notice.

Bjorn

