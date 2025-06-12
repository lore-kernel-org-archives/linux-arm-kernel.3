Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E5C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bsrwgsuW7MPI/th0YtvulO6UQ9cw9HZ88gBJXIsoBHM=; b=mPkfLVz6prvi2B
	rgzWL1sQ3UidqQ0BG/uN4lzGkInihk5r2L4IOih7MF1A+BR1GktsHDE7jzwup7sMqGRZXkBfBjacF
	Yej3XAlmSczYv9+dLNzJbI3WillP+HDDjjDjpfgBKyQx/aPh3wkRWW+aBPsfj5K5I0UJ9dIw1Eow9
	yOR9WZUdfms4pU6HUGoNyMT0A78uL2LkjjB9g6JIO5GjmBOZJ23tPEwI++nskpwW2VqEaHDv23EQk
	GGOcKrvo0WXRvbPWPcWQlCIoin3TL+8g070TBp1t9dynIgQCfbqnvMFMQMMPDVgcPXb/fWljEYGJB
	qmTNsyHPbJM4VNlZ/qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq79-0000000EjRd-3KYt;
	Thu, 12 Jun 2025 22:09:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjnM-0000000DmNG-2M2T;
	Thu, 12 Jun 2025 15:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4B7F6113B;
	Thu, 12 Jun 2025 15:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9BAC4CEEA;
	Thu, 12 Jun 2025 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741884;
	bh=+qF0IDawijRPYP4Y+6qlnAYE0xTB21o1YrLZ1UK9Vm4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YbhRCPOMaIrBYDkKLUWGFcgftPCCK1QyqR2V9Jhjmm9wJlFLikoGYH92CG/vPAAN7
	 hZccemg6MV6RplqE73kQqlVrggt+9GuDkJvAc7TalwU1w585Cdo3l0UVzsDN95Cmov
	 9+UnPiICzV0t/Voc5T02ihJQl6OmN3Br0SqKUC+s5zNPCDTZxRlfK35hPy2FfCBR8X
	 e5uEuUwNKajB+nL5bfUYIfzVr1kwIp1xNgytEoMwLMH39SPuRLZ7elKXXCOd9aghsC
	 M/OwMcJdObvQPs9m8YeXBaLLDkWnot0W57WPC6qVYd3HcCk9ieXD8AXLbDvl0Aifl4
	 0NZmOyTA90FRw==
Date: Thu, 12 Jun 2025 10:24:42 -0500
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
Message-ID: <20250612152442.GA908790@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e23r5i5kmju476fcakodccyqnwanbhtyul5prqpqdgqivy3t6@ci54hfghhbb7>
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

On Thu, Jun 12, 2025 at 08:33:54PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jun 12, 2025 at 09:44:47AM -0500, Bjorn Helgaas wrote:
> > On Thu, Jun 12, 2025 at 06:30:37PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Jun 12, 2025 at 07:21:08AM -0500, Bjorn Helgaas wrote:
> > > > On Thu, Jun 12, 2025 at 01:40:23PM +0200, Niklas Cassel wrote:
> > > > > On Thu, Jun 12, 2025 at 06:38:27AM -0500, Bjorn Helgaas wrote:
> > > > > > On Thu, Jun 12, 2025 at 01:19:45PM +0200, Niklas Cassel wrote:
> > > > > > > On Wed, Jun 11, 2025 at 04:14:56PM -0500, Bjorn Helgaas wrote:
> > > > > > > > On Wed, Jun 11, 2025 at 12:51:42PM +0200, Niklas Cassel wrote:
> > > > > > > > > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > > > > > > > > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > > > > > > > > and instead enumerate the bus directly after receiving the Link Up IRQ.
> > > > > > > > > 
> > > > > > > > > This means that there is no longer any delay between link up and the bus
> > > > > > > > > getting enumerated.
> > > > > > 
> > > > > > > > I think the comment at the PCIE_T_RRS_READY_MS definition should be
> > > > > > > > enough (although it might need to be updated to mention link-up).
> > > > > > > > This delay is going to be a standard piece of every driver, so it
> > > > > > > > won't require special notice.
> > > > > > > 
> > > > > > > Looking at pci.h, we already have a comment mentioning exactly this
> > > > > > > (link-up):
> > > > > > > https://github.com/torvalds/linux/blob/v6.16-rc1/drivers/pci/pci.h#L51-L63
> > > > > > > 
> > > > > > > I will change the patches to use PCIE_RESET_CONFIG_DEVICE_WAIT_MS instead.
> > > > > > 
> > > > > > I'll more closely later, but I think PCIE_T_RRS_READY_MS and
> > > > > > PCIE_RESET_CONFIG_DEVICE_WAIT_MS are duplicates and only one should
> > > > > > exist.  It looks like they got merged at about the same time by
> > > > > > different people, so we didn't notice.
> > > > > 
> > > > > I came to the same conclusion, I will send a patch to remove
> > > > > PCIE_T_RRS_READY_MS and convert the only existing user to use
> > > > > PCIE_RESET_CONFIG_DEVICE_WAIT_MS.
> > > > 
> > > > I think PCIE_T_RRS_READY_MS expresses the purpose of the wait more
> > > > specifically.  It's not that the device is completely ready after
> > > > 100ms; just that it should be able to respond with RRS if it needs
> > > > more time.
> > > 
> > > Yes, but none of the drivers are checking for the RRS status
> > > currently. So using PCIE_T_RRS_READY_MS gives a wrong impression
> > > that the driver is waiting for the RRS status from the device.
> > 
> > There's 100ms immediately after reset or link-up when we can't send
> > config requests because the device may not be able to respond at all.
> > 
> > After 100ms, the device should be able to respond to config requests
> > with SC, UR, RRS, or CA status (sec 2.2.9.1).  If it responds with
> > RRS, the access should be retried either by hardware or (if RRS SV is
> > enabled) by software.  This is the origin of "RRS_READY" -- the device
> > can at least do RRS.
> 
> Yeah, but the usage of 100ms is only valid if RRS SV is enabled by
> the software as per sec 6.6.1:
> 
> "It is strongly recommended that software use 100 ms wait periods
> only if software enables Configuration RRS Software Visibility".

I see that statement but don't understand it.  Do you think it's meant
as an exception to the first two paragraphs that say "software must
wait a minimum of 100 ms" following either "exit from Conventional
Reset" or "after Link training completes"?

I can't imagine that it means "if the Root Port doesn't support RRS SV
or software doesn't enable RRS SV, software needn't wait at all before
issuing config requests."

This whole thing is about whether the Endpoint is ready to respond.
A Root Port property (RRS SV support or enablement) doesn't tell us
anything about the Endpoint.

