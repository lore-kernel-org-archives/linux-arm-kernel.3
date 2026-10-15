Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1FECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JI8cos0DeBZwqgU3xgKQTheXjtcLPhmJEiAcd1ht54c=; b=rIeBKeDunUfLvN
	j5j2ftO5w59PFDQvTWCMJpglRdbI6mJY96f7g6N2/yIyXaj2JEldOTmTBu/z6Vj/FNsW9oU6Sl37d
	7FNmf4E6Izc13IuZ1tMi8gH5u9k/j2hFy8MDjBk1au9z2E4lTrLWxRG9104zP9ar66NjlLmr84nRI
	7ZZppzwSZtFNUaDbdag3FiNbcEAdc2oG8IksN/3EQI7RmaC6rONHDrieNZttcbi6WcYHcrOkvtoSA
	4LN/cndrN94YWIBO7KnB0TaSsgF4J34pAwXYZ/jQzQn05Ml7BgQdCZI9YT+AtwF5WvUPlErfNayR6
	/wX65tq2L1KQ9AliTvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSKm-00000001MuG-2rPn;
	Thu, 15 Oct 2026 20:45:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSKl-00000001Mtz-2OGu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:45:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AF3742DC6;
	Thu, 15 Oct 2026 20:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B655F1F000C4;
	Thu, 15 Oct 2026 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792097150;
	bh=JI8cos0DeBZwqgU3xgKQTheXjtcLPhmJEiAcd1ht54c=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ax2S36DhvUA8wOkFm9CYDx04QXNVvIwoMel2dK5m9srQ0Ek8mVfYd92X8iS+rCPt9
	 Tc7lhO6qisGJd0cSRW2jNB3X2yHspyE4+FLLQ4ZQ2Pfbl4nmC7ru2N81vUqQ/7FKeB
	 KMsyTOFmCbu2jdTAlKAvdzmbCyMvx0aIyMKPv8q4lHGJnBXQtW9vot86pXNrw5iaER
	 3LCEJKhgjMdQX5O6mnwIZNZq0b7nx5Bi9DNgq8BQycHtadTBGsjXXznnBZU6lK475F
	 nf1V+cKuxVobIcf1jZr4ZzL72H5GxQ4x0Hwu/+s3nXi3s9DhBC+MSCUfMAWGSp/N08
	 15rPgAFj5j2FA==
Date: Thu, 15 Oct 2026 15:45:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Semih Baskan <strst.gs@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
	Rani Hod <rani.hod@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
Message-ID: <20261015204549.GA1796999@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7cf09c5-dba1-4501-b93e-ce4ad555edeb@broadcom.com>
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

On Thu, Oct 15, 2026 at 12:10:22PM -0700, Florian Fainelli wrote:
> On 10/15/26 11:51, Semih Baskan wrote:
> > > Humm, this is not materially different for me before/after applying tihs
> > > patch and unfortunately but here is what I am getting with these two
> > > patches applied on top of Linus' master at
> > > 0fcb05b72344f40806cbe810de8872f1698bf053:
> > [...]
> > > Unhandled fault: external abort on non-linefetch (0x1008) at 0xc896df40
> > [...]
> > > r3 : c896df40  r2 : 0000ffff  r1 : 00000f40  r0 : c1ce1a00
> > [...]
> > >    pci_host_probe from iproc_pcie_setup+0x8a0/0xd94
> > >    iproc_pcie_setup from iproc_pltfm_pcie_probe+0x10c/0x1d4
> > 
> > The series only changes the pcie-iproc-bcma path, and this kernel probes
> > the controller with pcie-iproc-platform, so the patches do not run here.
> 
> Yes, clearly not enough coffee, thank you Semih.
> 
> > I think the abort is the read of APB_ERR_EN at offset 0xf40 (r1). I
> > measured the same on an RT-N18U (core revision 0x01) in September: the
> > platform-only kernel does not come up, and with this one line it boots
> > and enumerates the BCM4360 [1]:
> > 
> > --- a/drivers/pci/controller/pcie-iproc.c
> > +++ b/drivers/pci/controller/pcie-iproc.c
> > @@ -1388,7 +1388,7 @@
> >           break;
> >       case IPROC_PCIE_PAXB:
> >           regs = iproc_pcie_reg_paxb;
> > -        pcie->has_apb_err_disable = true;
> > +        pcie->has_apb_err_disable = false;
> >           if (pcie->need_ob_cfg) {
> >               pcie->ob_map = paxb_ob_map;
> >               pcie->ob.nr_windows = ARRAY_SIZE(paxb_ob_map);
> 
> Yes that works for me, and I was able to establish the last working baseline
> was v7.0 which did not include 76701239797698b620f2b7ec713fe08ef50ee664
> ("ARM: dts: BCM5301X: Describe PCIe controllers fully"), whereas v7.1 and
> onwards crashes unless your patch is applied.

I assume this means
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/iproc-bcma&id=9850907ee1dd4376c09c4129e0adbe3b39d191b7
is ok after all?

I do think it's unexpected that the kernel would panic even if the
correct driver hasn't been loaded.

If we don't have the right driver for the PCI controller, ideally the
wrong driver's .probe() method wouldn't be called at all, and if it
*is* called, its .probe() should fail gracefully.

The kernel shouldn't panic until it fails to find a root filesystem.

> Also, the good thing is that my local test bed has been resurrected and will
> be more regularly testing now.
> 
> > 
> > [1] https://lore.kernel.org/all/CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com/
> > 
> > Best regards,
> > Semih
> 
> 
> -- 
> Florian

