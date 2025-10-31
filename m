Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D07FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czYnlsbk3dl+okth7b7hSKgoydK34KIEHhCCwjZJulQ=; b=aD9UpO3TYeybhWmxHJgVonNMzZ
	zyqa41qYwTc71VQr3wgfeGBTwTDavHJV19I5cfQEhubck5ov7i9Y7J7nE4fjWdsKUIIwGUylCzWPj
	yH8YdoE3JBvWJmq/zhZ5MxNJPK47zgi318N/WSDopjHIn1bdsNwtZ9xk+c/iJBIZDAf7f6Be8o4xQ
	m1sqPtAMUFzSyEEb39L3ADC6AngXJB+Pe9tSUgfUYXHn5QeNokoJbILfRZYYkuwL9xFf5BAAcuG8A
	+gRSVgik87pIsDw5NZPS7c9P4mSPBUAzkZsNKSjvSJBCpIevh4swFTBuUUZ5ygyqdGDZlXk+7IoiB
	zMuiZnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqkX-00000006Ibl-3WyP;
	Fri, 31 Oct 2025 15:09:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqkW-00000006IbG-2Pd5;
	Fri, 31 Oct 2025 15:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E7A960299;
	Fri, 31 Oct 2025 15:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504C7C4CEE7;
	Fri, 31 Oct 2025 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761923347;
	bh=dsl1X60Vh2ZeNLMhUsaAvRkzH1LwyS7ZETYmT0LfrBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVNzPGI5+ZvQlLxEGKN1nU4jZfNwbhqupe4HdsG4AaDM2QnoiW2eXYPkrOdVAkdG2
	 O7TCLv4x+g45yK9AGgO11rk7RQZ6crAss8HcYt6DMZnKb+VzIn4zRbl03HZ5OOLSZy
	 CwKaFBoDCEypMVjvqlkEwQjI75PfRxkHpMhBQwBP+96sFVmQhIp/P7VBaXroOTYuzk
	 /8hYfSK6sf80lVoVjS7LUljsnKOA6Qg3Lb638AeR4dJlkGppKLkxJLmHXrZnB3HA7I
	 RH5HVpBQxJr1hDpaoXaAJlm8IWjlKkAA6lqqgXk5WKTIpPu3Bed2fVw6KY+AFEOHez
	 DhAnnSH1ufjxA==
Date: Fri, 31 Oct 2025 20:38:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Anand Moon <linux.amoon@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for
 resource cleanup
Message-ID: <ushhqxwggsmji2vfhk2onb7yzme2ajziruvynlkvfbhaxxk3ht@5ov7qn6i3i52>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com>
 <b2micr4atfax2sgolsublmjk4kwvbmdnqjlk2lb7cflzeycm5i@bi62lg75ilo6>
 <15087240.uLZWGnKmhe@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15087240.uLZWGnKmhe@workhorse>
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

On Fri, Oct 31, 2025 at 01:29:25PM +0100, Nicolas Frattaroli wrote:
> On Friday, 31 October 2025 09:36:05 Central European Standard Time Manivannan Sadhasivam wrote:
> > On Mon, Oct 27, 2025 at 08:25:29PM +0530, Anand Moon wrote:
> > > Introduce a .remove() callback to the Rockchip DesignWare PCIe
> > > controller driver to ensure proper resource deinitialization during
> > > device removal. This includes disabling clocks and deinitializing the
> > > PCIe PHY.
> > > 
> > 
> > How can you remove a driver that is only built-in? You are just sending some
> > pointless patches that were not tested and does not make sense at all.
> 
> The better question would be: why does Kconfig make PCIE_ROCKCHIP_DW
> a bool rather than a tristate? I see other PCIE_DW drivers using
> tristate, so this doesn't seem like a technical limitation with the
> IP.
> 

The limitation is due to irqchip maintainers not allowing (or recommending) to
remove a controller driver which implements an irqchip. So if any controller
driver that does so, we make them built-in. Recently, I suggested some
controller drivers to be tristate, but without the remove() callback. This will
allow the controller drivers to be built as a module, but not get removed
during runtime.

The reason why an irqchip controller should not be removed during runtime is
that the concerns around disposing the IRQs consumed by the client drivers.
Current irqchip framework doesn't guarantee that all IRQs would be disposed when
the controller is removed.

But irrespective of the above explanation, my statement was correct that this
patch is pointless.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

