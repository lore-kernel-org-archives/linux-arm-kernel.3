Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30684C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/Ic2b8esDfm00wQm8WodgOpVR7+0Q8spRsCljIJsje8=; b=BJklKLjwMvtJE+B2V7UVH+Vvtp
	EJ7L1KD9dO5RRAmaY0UhCl33GpODtZa4NVoOGvzcW9btbJa5yMqNgly+uC8two5fEWrgCwaLtQtH9
	8/H2b2bWctEak2Gnp43rShxkkz1uyMPmbEhLnjyTeDZLiCA2CEGKuNQ+5wZSF9MDY5RHmIFa4jrWn
	uRHcKpeRCuPaBNa4hDSLYDktGz40ZJ1W8anrlt50Xc9AWGvK/JCumOyPOfhIhPAtHTX5BorJK3bDq
	WrldcnWVA95SsRXlvqfmxuoWSv2Szd14UhKVilFuNWxOY2CGAxEp3an3/c29YGpFwkDRlMA1oB5G3
	KmkA9LGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEbk-00000001r5d-2YWO;
	Tue, 04 Aug 2026 12:51:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEbj-00000001r5F-3qC5;
	Tue, 04 Aug 2026 12:51:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27F8760A8B;
	Tue,  4 Aug 2026 12:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58871F000E9;
	Tue,  4 Aug 2026 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847858;
	bh=/Ic2b8esDfm00wQm8WodgOpVR7+0Q8spRsCljIJsje8=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=NotD7S8rP6w1nuiTKm5/hfabEr/pEp92em01z9rz6orn+5A2ZPotdYZOdKqQdXa10
	 3OyDLP0EK3RO66S78ON4WB0UyZuzvoJDUUqQ1bLeRAOWxts2HRfj09/0Uc3V6QATVs
	 5DQpBBBzn6OxSUZNBDErjuU50S1YYsi0cY/6uxwHsqSaYGrFcIDhZJTfruAcw5yRvK
	 tKjspKcJjEy/0pu29nKWbdEnuK+ep8klVx2fSFuHPvekA5NameOtF01FqNXfd6/Hfs
	 wyigQePDrD7NU3+A73A2c7qJ1pW3XU+AlaaQLdKfbbvntF4q0vmTZ16J8SlKh5aj81
	 uk+IZz4LEIiUg==
Date: Tue, 4 Aug 2026 07:50:57 -0500
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
Message-ID: <20260804125057.GA1834533@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFg7d9YX3dXYHFvhXX6VBR_Wd5QzAD77Rgugso5sYD-SwANnLQ@mail.gmail.com>
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

[+cc Marc, author of 4615fbc3788d ("genirq/irqdomain: Don't try to
free an interrupt that has no mapping"), Thomas; beginning of thread
about multiple MSI vector alloc/free:
https://lore.kernel.org/all/20260730072215.2090974-1-sangwoo.han@nearthlab.com]

On Tue, Aug 04, 2026 at 08:31:23PM +0900, Han / 한상우Sangwoo wrote:
> > Several other PCI controller drivers have similar code.
> 
> I agree - eleven of them look like they can have the same problem.
> 
> > I think we should fix them all at once (or explain why they don't need
> > similar fixes).  Might be worth a little helper so they all work the
> > same way (e.g., some use order_base_2(), others use get_count_order(),
> > which seems like a pointless difference).
> 
> I am working on a related fix for drivers/irqchip/irq-bcm2712-mip.c,

Similar pattern there, but it uses ilog2(), which differs from
order_base_2() and get_count_order() in more cases.

> which I can test here.  I would rather not send changes to drivers I
> cannot test, though, so I am leaving the eleven to whoever has the boards.
> What I looked at is in the appendix, in case it is useful to them.
> 
> Two things seem more useful from where I am sitting.
> 
>  - The failure is silent.  Appendix A describes the symptom, so that
>    anyone who hits it later can find this thread.
> 
>  - The contract is not written down.  It changed in 4615fbc3788d, where
>    irq_domain_free_irqs_hierarchy() started freeing one vector at a time.
> 
> order_base_2() and get_count_order() give the same answer for any
> nr_irqs >= 1, so consolidating those two is just cleanup.  Where a shared
> helper should live I am not sure either.

I don't know either, but I hate fixing an issue in one place and
leaving the same issue unfixed nearby.

> Appendix A - the symptom
> ========================
> 
> A PCIe device whose driver is unbound and rebound a few times, or whose
> module is reloaded, ends up with fewer MSI vectors than it asked for.  It
> does not recover until reboot.
> 
> Two things have to be true for it to happen: the device uses multi-MSI,
> and the vector count it asks for is not a power of two.  Devices that ask
> for a power of two are unaffected, and so is anything on MSI-X.
> 
> I have only seen the reduced-vector case.  A driver that insists on the
> full count would fail to probe instead, but I have not seen that happen.
> 
> 
> Appendix B - how I sorted the drivers
> =====================================
> 
> I went through drivers/pci/controller/ while working out what my own fix
> had to do, so this is that rather than a full audit.  Twenty of the
> drivers own an MSI hwirq pool.  I asked three things about each:
> 
>  - does .alloc reserve a rounded-up block, or a single slot
>  - does the core hand .free one vector at a time
>  - can nr_irqs > 1 reach the driver at all
> 
> Eleven answer yes to all three:
> 
>   dwc/pcie-designware-host.c   pci-aardvark.c        pcie-apple.c
>   pcie-aspeed.c                pcie-iproc-msi.c      pcie-mediatek-gen3.c
>   pcie-rcar-host.c             pcie-rzg3s-host.c     pcie-xilinx-dma-pl.c
>   pcie-xilinx-nwl.c            pci-hyperv.c
> 
> The other nine:
> 
>  - five reserve a single slot, so nothing rounds up:
>    mobiveil/pcie-mobiveil-host.c, pci-xgene-msi.c, pcie-altera-msi.c,
>    pcie-mediatek.c, plda/pcie-plda-host.c
> 
>  - vmd.c keeps a per-vector refcount instead of a bitmap
> 
>  - pci-tegra.c and pcie-xilinx.c reserve a rounded-up block, but neither
>    lists MSI_FLAG_MULTI_PCI_MSI in msi_parent_ops.supported_flags
> 
>  - pcie-brcmstb.c is the one you applied

