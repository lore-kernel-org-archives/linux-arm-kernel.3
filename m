Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D83ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=al3w5X6U+e99ll0PdhawCfl9NZHFFEc6Q+l2PiLxMYQ=; b=HXnjREkezcOU/8uQXVamMaWj1I
	7n9eqlLmBNa3jYhyUp5pKe2YqlRBDeeKzPQl50N88Z0Po2hrUDFESDYIHa2/dZ9QdSlpIWlreBp+Q
	q0ohe58mdBZgf6EX8ZJ7xn2azOj+B9dwkO1pFjY6CmnRPv/FcRYxL19margS1PNjGbypyhDglKSb9
	fz7ANeuZ3i6UFiTjRIDZSgTUC+gswVo3z85pfbfW6UE532vhiWbLODwGBjuYUDdY+nQVlOTz365fA
	D5M+6aJVa7GyGqgRADg4/eKhLI9LBoH3h8TZld3QKcgJo5VLKLJPu3LcM0EyeL0w0Du1b/JEnR4Cv
	gw/LeTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzV5r-00000001zNI-1Xcv;
	Fri, 19 Sep 2025 06:59:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzV5p-00000001zN6-2mFL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 06:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7E7060097;
	Fri, 19 Sep 2025 06:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC84C4CEF0;
	Fri, 19 Sep 2025 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758265180;
	bh=mKFe7ErjMyDbh3IfVTq6XcrQTTvr6P3elo0MM+YunJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQVVZekgpbpP6dmzemqDlDMj+Dk5LqsUBR2UD3mh5vrujVolh6Sm/iGEM6JqH8Dph
	 DiIUDS+vzB6pjzR0csiWINGtk6cinsJ+DybBeSYGcs7lLyO06ym1kwBFdW9C8fJhat
	 jbamDAnmseSFAqwaYQVIP5S0A14qqPlhm8CQTTmgOyLiDHK/acoVb2mvQ86I/jrrCj
	 0By+Ct+pS6D/oAtLd/JsmveZaXl03/PEfYnBwiZ22a9Yni0dFJNWYPNX3HNGHC/yy0
	 CNaiuNvQswoqTJ4LxscqYEmuY35a6qZNnihnzTwgKz9TeeeN6QEnm9E7xZ1c+4eEOj
	 VHdao5sloh6lA==
Date: Fri, 19 Sep 2025 08:59:36 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <aMz/WBO5r+6dh6Qi@lpieralisi>
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
> 
> > Don't get what GICv3 node has to do with that though, sorry.
> 
> Just trace what the code there does after it gets the MSI parent. I
> didn't study it too closely, but why is a iProc PCIe parsing GICv3 MSI
> stuff itself? There's either some missing feature in the
> irqchip/domain APIs or it's being dumb.

I think it is setting up the host bridge to steer MSIs to the GIC ITS.

Platform specific stuff - nothing to do with irqchip/domain.

Lorenzo

