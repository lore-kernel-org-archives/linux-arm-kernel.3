Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBD5C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TAdRXpfGSSDOCMMR40gtXs0hLQWel8KTicVOiSo+8g8=; b=OTGYYLsQoALqOG
	daRjS//tKVFdJmFpxyQNYbFVr+NRuqMWPb7VJiQ5HEyiejQLM4/0uL6doUlbSmOZpicow3bp7g6CM
	2IK3lBrBCJyZ95ay2pKgDi+tsQWDZzu9pNVenA+yJgW3QY7e0YoKK0omtbEKeD7p2zdh87i/eoqg4
	CQ7eYSz/aVb67zBOpQRhfCW72fFSDd5cYoR3HKrTCme4F4yK+OwrsLAe5DpafYobrzQXS9lfPPocP
	rTAabA8tlo3c7Ctko0LTn31+cJG2s80OUXL5lzBWYriJfaL6MkCPalPWmVg4Ceph55pEtkvJfCReB
	+MwWlQpMTWrU/K4ZzAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrC-0000000DPM3-1ape;
	Thu, 12 Jun 2025 13:20:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgvg-0000000DElc-2AQn;
	Thu, 12 Jun 2025 12:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D204EA5106A;
	Thu, 12 Jun 2025 12:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D670C4CEEA;
	Thu, 12 Jun 2025 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749730871;
	bh=D3EDhHkJNow/VmK8m96vIDUE8UN6sG5L/6g1o10X+JI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EZYd79dXpn+rewjaoeCT6WVWmMUeWHAfPEgwrs0weSKOwymAkyOOZkP9nObwIVXjf
	 JWsNj3tcCWvNNpHuivmR841FN+4nGpV/sgoMN7nrW/vxH3tlZB11GLISU1A+KU00u+
	 mIDxMcDikVKp1EGWBNNHFOTGbEHFZghNYR12M+EAM2TGLfIun+FqtKyY/3BiAz/9oX
	 JfABq1y9IiijojH4qHtL5SQuz5OooIvteGg93ijYA9DSL5TmjlUFa1Pq4QiigBKbrW
	 pJb8h79uxLdzoH1QTJJrzedSJo8zZfaSoHUz4q0cjmJCjeR9KYP385fOpLAvOtRJG7
	 eT35UGvi6pQVg==
Date: Thu, 12 Jun 2025 07:21:08 -0500
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
Message-ID: <20250612122108.GA901642@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEq8pxE45PmeXN_W@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_052112_619695_DA505D7C 
X-CRM114-Status: GOOD (  23.66  )
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

On Thu, Jun 12, 2025 at 01:40:23PM +0200, Niklas Cassel wrote:
> On Thu, Jun 12, 2025 at 06:38:27AM -0500, Bjorn Helgaas wrote:
> > On Thu, Jun 12, 2025 at 01:19:45PM +0200, Niklas Cassel wrote:
> > > On Wed, Jun 11, 2025 at 04:14:56PM -0500, Bjorn Helgaas wrote:
> > > > On Wed, Jun 11, 2025 at 12:51:42PM +0200, Niklas Cassel wrote:
> > > > > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > > > > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > > > > and instead enumerate the bus directly after receiving the Link Up IRQ.
> > > > > 
> > > > > This means that there is no longer any delay between link up and the bus
> > > > > getting enumerated.
> > 
> > > > I think the comment at the PCIE_T_RRS_READY_MS definition should be
> > > > enough (although it might need to be updated to mention link-up).
> > > > This delay is going to be a standard piece of every driver, so it
> > > > won't require special notice.
> > > 
> > > Looking at pci.h, we already have a comment mentioning exactly this
> > > (link-up):
> > > https://github.com/torvalds/linux/blob/v6.16-rc1/drivers/pci/pci.h#L51-L63
> > > 
> > > I will change the patches to use PCIE_RESET_CONFIG_DEVICE_WAIT_MS instead.
> > 
> > I'll more closely later, but I think PCIE_T_RRS_READY_MS and
> > PCIE_RESET_CONFIG_DEVICE_WAIT_MS are duplicates and only one should
> > exist.  It looks like they got merged at about the same time by
> > different people, so we didn't notice.
> 
> I came to the same conclusion, I will send a patch to remove
> PCIE_T_RRS_READY_MS and convert the only existing user to use
> PCIE_RESET_CONFIG_DEVICE_WAIT_MS.

I think PCIE_T_RRS_READY_MS expresses the purpose of the wait more
specifically.  It's not that the device is completely ready after
100ms; just that it should be able to respond with RRS if it needs
more time.

