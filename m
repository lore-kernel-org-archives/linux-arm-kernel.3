Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D633CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+divwCc3JoWMWryqKk8axKNDVDn+7iFJkPu4kJ/87Nk=; b=1C6JHWeYEtPADZ868rXI60wHfw
	kIv/AeX8M4gIVSRl034+1NnZWc+dq0aEX0Yr3Zhu3YnDMMVeNHk2CBBqeMC1GTbofdkyIQlPh/zSM
	JD1N+WF4WSp6THoVGSrU7Yjo3W3B/rjifxNoR6mGMe8f815zpeYTf2PBatmPNcNSqmsAyOm2phbfm
	KRGVjzoVGVnImLdBNZPrB2CdtQH+5743l+d2D2YI2t3v8Dl65whqcYcMKGSBPSS756XVBfcr/444e
	6r9wQZJ9kdQHzIjBl0WjMF9CGqaynGsEadGlTzVvUhcNwcpBKNmaV3bB9vx43XqJ2it+ctT22txWZ
	JUnnJdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVOF-000000022kR-0XfI;
	Fri, 19 Sep 2025 07:18:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVOE-000000022jt-0MjJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DFE460097;
	Fri, 19 Sep 2025 07:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E51C4CEF0;
	Fri, 19 Sep 2025 07:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758266321;
	bh=5tSIdJQP1tIdIsNeNk84JqAQX+HeQ6XQr+kbFkQIixM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvjzJifUjhpsXlzjcIDJ8ccaxl9apNLSSwyzS+ME+E9fZdtmTbYdwCjKqP8zlQRzV
	 ukXRsLK+wEfHxVw2IXXHtGgbrKlfiwfDsncuDK2d2IELOSFHBECuMvGg85ZPK3kX7o
	 FpM5wkqNhdVFSFqNrCMHWOSmItQkxZvZCmNghzGr4yJMpkk/kYwl38Iug++0EUj92d
	 lv5Sv2VvwIqTeZaaKvAZQkIHVTPVW3VBARkuKn3tlgtd3ZKInnk+jfJ1SMdWeW+Gwy
	 5ds9wmY8lCbVHAhCqmw23sbhNHl/WuFQMJgrScPk+E4VfV/gEpDpgREuAsWrnMDOVG
	 vD+ZcQhooPZzw==
Date: Fri, 19 Sep 2025 09:18:36 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <aM0DzMe8qW4eKQBX@lpieralisi>
References: <20250916091858.257868-1-lpieralisi@kernel.org>
 <20250918135555.GA1540012-robh@kernel.org>
 <aMwjcIS/rvxkSZdr@lpieralisi>
 <CAL_Jsq+XKT+HkE0W0BLKbQ76RtgBrKToLAVaWOy80mLkD=x0+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+XKT+HkE0W0BLKbQ76RtgBrKToLAVaWOy80mLkD=x0+A@mail.gmail.com>
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

On Thu, Sep 18, 2025 at 02:44:23PM -0500, Rob Herring wrote:
> On Thu, Sep 18, 2025 at 10:21 AM Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> >
> > On Thu, Sep 18, 2025 at 08:55:55AM -0500, Rob Herring wrote:
> > > On Tue, Sep 16, 2025 at 11:18:58AM +0200, Lorenzo Pieralisi wrote:
> > > > In some legacy platforms the MSI controller for a PCI host
> > > > bridge is identified by an msi-parent property whose phandle
> > > > points at an MSI controller node with no #msi-cells property,
> > > > that implicitly means #msi-cells == 0.
> > > >
> > > > For such platforms, mapping a device ID and retrieving the
> > > > MSI controller node becomes simply a matter of checking
> > > > whether in the device hierarchy there is an msi-parent property
> > > > pointing at an MSI controller node with such characteristics.
> > > >
> > > > Add a helper function to of_msi_xlate() to check the msi-parent
> > > > property in addition to msi-map and retrieve the MSI controller
> > > > node (with a 1:1 ID deviceID-IN<->deviceID-OUT mapping) to
> > > > provide support for deviceID mapping and MSI controller node
> > > > retrieval for such platforms.
> > >
> > > Your line wrapping is a bit short.
> > >
> > > I had a look at who is parsing "msi-parent" themselves as that's
> > > typically a recipe for doing it incorrectly ('interrupt-map' anyone).
> > > Can we make iproc_pcie_msi_enable() use this? It's quite ugly reaching
> > > into the GICv3 node...
> >
> > I am not sure I get what you mean here. Possibly iproc_pcie_msi_enable()
> > can reuse this patch's code if I extend it and make it a global function,
> > yes and somehow use that function to carry out the check for an
> > msi-parent property with no #msi-cells property or an #msi-cells == 0.
> 
> I meant using of_msi_xlate() (or even of_msi_get_domain()).

https://lore.kernel.org/all/20240818161816.GA173148-robh@kernel.org/

Isn't of_msi_get_domain() leaking a reference when it finds an IRQ domain and
return ?

Possibly I can generalize it and use it in this patch too.

Thanks,
Lorenzo

> > Don't get what GICv3 node has to do with that though, sorry.
> 
> Just trace what the code there does after it gets the MSI parent. I
> didn't study it too closely, but why is a iProc PCIe parsing GICv3 MSI
> stuff itself? There's either some missing feature in the
> irqchip/domain APIs or it's being dumb.
> 
> Rob

