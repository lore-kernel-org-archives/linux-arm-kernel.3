Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE25C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZY0DwhnUQCc+RADgcaU7FxCrACWqIbezbHwdQ1JP/bA=; b=eBQmSHP0UD+AMp
	36PZAGPb5Z6y6HBpJf41oeZmtQ2U/fztNckFJT1gdCfRL2HQDEQZhoy/8wjw3RZbgeR8fai7PI1Dg
	zryXqNxj9OIL0HSTWt5bQH3rp7f6fLt64rxyeHYkWH2Vw+g11VaLVSxI7cf2A3QofNNzMr0Aj0oyk
	KG72l9iGeqIukLOv//m19VdNBBlkOTsTgHUQfdErSvSwV1IM3etHgAu4ovPkXmH56IBeP8+HG7C/F
	fibZAvu3ELklScKR76fC/vNYjPVKcJsYGTQNpqbj6wcreAuQuvjNti4jUh2bckTlQ/js5vFFJ7jb4
	Y3V6ZkImR6TT7VpQXvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBQB-000000002bw-1Ord;
	Fri, 13 Jun 2025 20:54:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBM1-000000002Ei-47eC;
	Fri, 13 Jun 2025 20:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 530E349FFC;
	Fri, 13 Jun 2025 20:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB2CC4CEE3;
	Fri, 13 Jun 2025 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749847825;
	bh=rlvKqvqdkEFLQEjr/WDkmwzemWu5/XidctqnjEijYfA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jyRKM3BwZ30ApC0n4zkoy8NvY+mslGvuJUBIM/Es0paRZxNmFP/suFT1ugJPmXlhG
	 b7IXKN/jdezHBpAW0uWMyXd0+q7ok+C948R9jpbSdB+vopmAPJHi62pW/TxJ5Cd27R
	 8L3axnVJsjb00FdpZHbTBeZJNDaq0cqVWzK5Jf5uifF4jA/VcX5ZGG6t3YRq6Kla2b
	 fB7HJywUeFu0MeuCsfP1vZLA79euz53xaJZw0kjcZIidN95dyhoixyYEzDxk6s9fJ1
	 mi0iMJevqEe5wyuwcw67pMCEaMIKA67ZMnMCfpr2zgr+WrlJgbPQbGiJzdQy7b7pfd
	 84wTnMR6MXSpg==
Date: Fri, 13 Jun 2025 15:50:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 1/5] PCI: rockchip: Use standard PCIe
 defines
Message-ID: <20250613205023.GA975137@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEyJhoiPP0Ugm1t6@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_135026_046566_2B75A60B 
X-CRM114-Status: GOOD (  21.20  )
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

On Fri, Jun 13, 2025 at 05:26:46PM -0300, Geraldo Nascimento wrote:
> On Fri, Jun 13, 2025 at 03:14:09PM -0500, Bjorn Helgaas wrote:
> > On Fri, Jun 13, 2025 at 12:05:31PM -0300, Geraldo Nascimento wrote:
> > > -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> > > +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
> > >  	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
> > 
> > It looks funny to write PCI_EXP_LNKCTL with bits from PCI_EXP_LNKSTA.
> > I guess this is because rockchip_pcie_write() does 32-bit writes, but
> > PCI_EXP_LNKCTL and PCI_EXP_LNKSTA are adjacent 16-bit registers.
> > 
> > If the hardware supports it, adding rockchip_pcie_readw() and
> > rockchip_pcie_writew() for 16-bit accesses would make this read
> > better.
> > 
> > Hopefully the hardware *does* support this (it's required per spec at
> > least for config accesses, which would be a different path in the
> > hardware).  Doing the 32-bit write of PCI_EXP_LNKCTL above is
> > problematic because writes PCI_EXP_LNKSTA as well, and PCI_EXP_LNKSTA
> > includes some RW1C bits that may be unintentionally cleared.
> 
> Hi Bjorn and thank you for the review,
> 
> while your rationale is correct per PCIe spec, per RK3399 TRM
> those registers are indeed 32 bits in the Rockchip-IP PCIe, so
> I'm forced to work with that, but without fear that other
> registers get messed-up. (See for example Section 17.6.6.1.30
> of RK3399 TRM, Part 2)

I don't have access to any of these TRMs, so I only know what's in the
driver.

When you say "without fear", are you saying there's a way to do that
32-bit write such that the LNKSTA bits are discarded by the hardware?
Or just that the hardware forces us to accept this potential status
register corruption?

Is this something that could be written using the config access path?
I guess probably not, based on this:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-rockchip-host.c?id=v6.15#n141

Bjorn

