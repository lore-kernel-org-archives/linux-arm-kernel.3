Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61745C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+7hEmmS6m6/bDdPV7mlKcb6oV8gt+eTtfDb/u506UOc=; b=Y7W8chZGBOAGNzjzfRXT61gdWv
	T9l1jrrsegYg83aCb7E/a2emXh7n1uMz/WGQqjz+cVMAjbu8adqB6Xax4FTBhF5Lt7vQ4hNEaNBTK
	a3wL4M+oVN0e3RzwFTUowAxXy5kA39TJwmVQ0Mq2N42RzIov63ii9F2+k+T0otW/t9rzJFTn0CNSu
	aieKuuq02Qi4YA7NGIY8QwmAnUj9zaM1MgnsvTf11/vtcWTOVcy151Kmj4Gdma7DXHeTvsokIHbei
	9gx+ftSaAkA6lJ/jJWLEiSAolPWwghPGBTxEDqJr9uAqmwbYsj2T/LVJnAOl7ZGPE63fMYshx3AMT
	qYUnJ5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZS9-0000000D2Gm-0aUW;
	Mon, 10 Aug 2026 23:30:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZS7-0000000D2GY-0zWg;
	Mon, 10 Aug 2026 23:30:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9A0843586;
	Mon, 10 Aug 2026 23:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A801F000E9;
	Mon, 10 Aug 2026 23:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786404641;
	bh=+7hEmmS6m6/bDdPV7mlKcb6oV8gt+eTtfDb/u506UOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=VCng2b2iAaxGhTPcjiE8WLaFwvWHEnmcem+pvA/e46P2IQMJqbX1xJkcySP6UlV+B
	 G04Yk0Wv4tIzFB/PwbKipKH/mLJ3HgmvqNIkd4UpzxytzdkOHVNIWF+MdlAgcU0Bu9
	 7KJm9hp4XX//C77docNO8HF2UyeCr/9PDZmybdZVaUX7Tw2cuvGCsf3S4n1a+jIDzW
	 kvpCJyLY3I6QIu7PjU3Ai76Yy2CXWYNCPaRz4zZuqKb4IxJFpy/Jun8X1sYp8B3vRM
	 u3UdFVkgdDTS7BxNVaxzvAxJoPmmOArS1yuzeiJsqXipK6YnPaYIJi2UP/Brene7WW
	 qQwNX7LvkeyRw==
Date: Mon, 10 Aug 2026 18:30:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Han / =?utf-8?B?7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Cc: jim2101024@gmail.com, florian.fainelli@broadcom.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com,
	robh@kernel.org, linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
Message-ID: <20260810233040.GA511779@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804125057.GA1834533@bhelgaas>
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

On Tue, Aug 04, 2026 at 07:50:57AM -0500, Bjorn Helgaas wrote:
> [+cc Marc, author of 4615fbc3788d ("genirq/irqdomain: Don't try to
> free an interrupt that has no mapping"), Thomas; beginning of thread
> about multiple MSI vector alloc/free:
> https://lore.kernel.org/all/20260730072215.2090974-1-sangwoo.han@nearthlab.com]
> 
> On Tue, Aug 04, 2026 at 08:31:23PM +0900, Han / 한상우Sangwoo wrote:
> > > Several other PCI controller drivers have similar code.
> > 
> > I agree - eleven of them look like they can have the same problem.
> > 
> > > I think we should fix them all at once (or explain why they don't need
> > > similar fixes).  Might be worth a little helper so they all work the
> > > same way (e.g., some use order_base_2(), others use get_count_order(),
> > > which seems like a pointless difference).
> > 
> > I am working on a related fix for drivers/irqchip/irq-bcm2712-mip.c,
> 
> Similar pattern there, but it uses ilog2(), which differs from
> order_base_2() and get_count_order() in more cases.
> 
> > which I can test here.  I would rather not send changes to drivers I
> > cannot test, though, so I am leaving the eleven to whoever has the boards.
> > What I looked at is in the appendix, in case it is useful to them.
> > 
> > Two things seem more useful from where I am sitting.
> > 
> >  - The failure is silent.  Appendix A describes the symptom, so that
> >    anyone who hits it later can find this thread.
> > 
> >  - The contract is not written down.  It changed in 4615fbc3788d, where
> >    irq_domain_free_irqs_hierarchy() started freeing one vector at a time.
> > 
> > order_base_2() and get_count_order() give the same answer for any
> > nr_irqs >= 1, so consolidating those two is just cleanup.  Where a shared
> > helper should live I am not sure either.
> 
> I don't know either, but I hate fixing an issue in one place and
> leaving the same issue unfixed nearby.

Just to be clear here, I'm going to defer this until we can fix
everything in drivers/pci at once.  If we can add a fix early in the
cycle, e.g., soon after -rc1, people with other controllers can help
test it.

If we only fix one driver, the pattern will continue as people copy
and paste the bug into new drivers.

So that's why I haven't pulled the pci/controller/brcmstb branch
(which contains this patch) into pci/next.

> > Appendix A - the symptom
> > ========================
> > 
> > A PCIe device whose driver is unbound and rebound a few times, or whose
> > module is reloaded, ends up with fewer MSI vectors than it asked for.  It
> > does not recover until reboot.
> > 
> > Two things have to be true for it to happen: the device uses multi-MSI,
> > and the vector count it asks for is not a power of two.  Devices that ask
> > for a power of two are unaffected, and so is anything on MSI-X.
> > 
> > I have only seen the reduced-vector case.  A driver that insists on the
> > full count would fail to probe instead, but I have not seen that happen.
> > 
> > 
> > Appendix B - how I sorted the drivers
> > =====================================
> > 
> > I went through drivers/pci/controller/ while working out what my own fix
> > had to do, so this is that rather than a full audit.  Twenty of the
> > drivers own an MSI hwirq pool.  I asked three things about each:
> > 
> >  - does .alloc reserve a rounded-up block, or a single slot
> >  - does the core hand .free one vector at a time
> >  - can nr_irqs > 1 reach the driver at all
> > 
> > Eleven answer yes to all three:
> > 
> >   dwc/pcie-designware-host.c   pci-aardvark.c        pcie-apple.c
> >   pcie-aspeed.c                pcie-iproc-msi.c      pcie-mediatek-gen3.c
> >   pcie-rcar-host.c             pcie-rzg3s-host.c     pcie-xilinx-dma-pl.c
> >   pcie-xilinx-nwl.c            pci-hyperv.c
> > 
> > The other nine:
> > 
> >  - five reserve a single slot, so nothing rounds up:
> >    mobiveil/pcie-mobiveil-host.c, pci-xgene-msi.c, pcie-altera-msi.c,
> >    pcie-mediatek.c, plda/pcie-plda-host.c
> > 
> >  - vmd.c keeps a per-vector refcount instead of a bitmap
> > 
> >  - pci-tegra.c and pcie-xilinx.c reserve a rounded-up block, but neither
> >    lists MSI_FLAG_MULTI_PCI_MSI in msi_parent_ops.supported_flags
> > 
> >  - pcie-brcmstb.c is the one you applied

