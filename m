Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ACAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+VK2/N9Hp2NpNZwxVcSGmiiLdCTbvNGV1jGkws5xoc=; b=LesSYzNQW07luwDsQVM6FOHSqy
	bB7rRHiVml45cH25hLSfDbzB2cS7Y5rn+plQ36/xEDCwK1zhXXeYXow8/WcX2BZBwbaPCRuOq/v4n
	7+qk/VD8k+PRpvCW223Lzu9zF/Ab6odnghtXkyaOD+kKFxhQP0uLF0a3PvXoKumZ6WejKuCU9DBpn
	JZIYYM1wP21xcSZ0Tpf6Y/P9QLLule5vorX4lTVTwlBIh0zxMyJJ57F2c+z4Ch+QJ4NCP4jlyHBF4
	w13CxsRHF+fXuDxDCO3gl1bT3EePVfrMVJaQTRAYEDtDPkUM4X8fWRFQhrTyoZdxvspKsBhrsdMbN
	f2SUhn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSnq-0000000BBEm-08DY;
	Tue, 03 Jun 2025 14:39:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSle-0000000BAsi-1ekc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF9E5A503E6;
	Tue,  3 Jun 2025 14:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4B2C4CEED;
	Tue,  3 Jun 2025 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748961449;
	bh=m27aq/uff5R7/6shxNmKRc5alXNmEne/PxgWTW+/ut0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mwi166Am/NgJs/eDzkpMeigJrf7vlPoBKzdgoDOlCcDDh0tF8R6ld3PatFpTDFa1N
	 VQ0x+F5XS4xRl4NUr4Qt3dgehgKfNHVIoIl6eurRca1Vabhnkfuc9tsLg2fFqL4xK5
	 bqa1/qBp+CzGRHL//qEhtyvKdZCEl7TtNqm++mEYlh0ld/wC2goFHPX5A5WYMfsGvi
	 DzYChK/dm6yo+fk5MKZkkdLTf/dz0rO4wkfofIUfRpR0/q73CufT0Gm12rjo15Sice
	 XlF4bg7EwwxsPJsOj12viv1Bbu/zKKnCUiVAsJN0m9t8wG4HqPcswEG/Mx+0EEtC0S
	 XNXpNmoYfwfOw==
Date: Tue, 3 Jun 2025 16:37:23 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
Message-ID: <aD8Ioy+v8k/i0e8B@lpieralisi>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <aD7B96BiSb6mK9Bj@lpieralisi>
 <87jz5tdl9d.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz5tdl9d.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_073730_569201_F9A1B717 
X-CRM114-Status: GOOD (  30.86  )
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

On Tue, Jun 03, 2025 at 02:09:50PM +0100, Marc Zyngier wrote:
> On Tue, 03 Jun 2025 10:35:51 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Tue, Jun 03, 2025 at 04:22:47PM +0800, Zenghui Yu wrote:
> > > > +	domain->dev = dev;
> > > > +	dev->msi.data->__domains[domid].domain = domain;
> > > > +
> > > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> > > 
> > > Does it work for MSI?
> > 
> > This means that it does not work for MSI for you as it stands, right ?
> > 
> > If you spotted an issue, thanks for that, report it fully please.
> 
> Honestly, you're barking up the wrong tree. Zenghui points us to a
> glaring bug in the core code, with detailed information on what could
> go wrong, as well as what is wrong in the code. It doesn't get better
> than that.
> 
> The usual level of bug reports is "its b0rken", sometimes followed by
> a trace with lots of hex and no information. Spot the difference?

Agreed, thanks again Zenghui for reporting it and forgive me if the
message sounded a bit patronizing, I did not mean it.

Lorenzo

> > > hwsize is 1 in the MSI case, without taking pci_msi_vec_count() into account.
> > > 
> > > bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> > > {
> > > 	[...]
> > > 
> > > 	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> > 
> > I had a stab at it with GICv5 models and an MSI capable device and this indeed
> > calls the ITS msi_prepare() callback with 1 as vector count, so we size
> > the device tables wrongly.
> 
> Not wrongly. Exactly as instructed.
> 
> > 
> > The question is why pci_create_device_domain() is called here with
> > hwsize == 1. Probably, before this series, the ITS MSI parent code was
> > fixing the size up so we did not notice, I need to check.
> 
> The GICv3 ITS code would upgrade the vector count to the next power of
> two (one bit of EID space -> 2 MSIs), but with the device domain
> squarely set to 1, the endpoint driver would never get more. It is
> prepared to fail gracefully though, hence nothing really breaks.
> 
> I don't think this patch makes anything regress though. Commit
> 15c72f824b327 seems to be the offending one. If Zenghui confirms that
> the hack I posted separately works for him, I'll follow up with a
> "real" patch.
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

