Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C5CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 22:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=95/f70UhM4f4k+HsZJ9k6JeJuwfMEoFVuZxACp5T8CM=; b=vYnmtMj9diIqIx
	KM8L53LJ1Qb9jv/Hd/jEy/7cwWvhsU9u5DEbOocKzhqrAjRD7Tqz6Tch1Yil8A0Fu0eoago77VeRx
	FMCjRN+CgsMkCnhXc9xbL72v3I8Grvdw/3+QT4FG7tcMaVXtaBDUTnQ9cB9C4wy05Q7bIFVU8Qram
	s2au7H7KFJIqQWi+htPiUZVFZ2+52C922LXwApaTKLrsixmoLFEXOx8pSulVgF6FEtzkXUp4lLGBg
	11UdBHcPzQx3OwKhSpRjxznR7UKkym1yJCM8rWjaYt/Wzxu6HVLHhNaIJ5yIhYVu6oAbEuzNF4RB5
	PhYMcufzKEorhnWSBpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Xcm-000000048Vh-1Olk;
	Wed, 24 Sep 2025 22:06:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Xcl-000000048VI-29BA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 22:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBB6D602CD;
	Wed, 24 Sep 2025 22:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B3DC4CEE7;
	Wed, 24 Sep 2025 22:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751566;
	bh=WtHYzeoqqVSA7DSNSyTBNjNmYwn+bmve6GHaOnB6vKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=L9+U0TcgZa4VR23ZVWjm1oxhQhn6R8G99Q0sQ6YDxOAIo8iJpWv6XhgvgMSjlsq/x
	 Pt3qRCWx2Y/lDrwVUnOyGQO0x6IeNm6H/Rvog5uKtclpyXTrhe++udIBc6H0uJ+OAa
	 RPzWB476Wk0uCZ32cHKSgyDVyH0bgkTnQLsur4X/obLzAtD1seFcJO1KxfjwauBie6
	 YB9AfUe6NpxBYniC2nRRY0iOFfdbw7e0VVm4yN/PHcZ9Dz1O1jZMbQpV6SiGWP2ZEg
	 nmG0dDexSJfoUC9993DzFmDjSAtmFrOy3GC5ToBXz2c9EjWCMC+AfK7lXyvZscD5pO
	 i1q3F19f0sKdQ==
Date: Wed, 24 Sep 2025 17:06:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, jingoohan1@gmail.com,
	l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/4] PCI: dwc: Remove the L1SS check before putting
 the link into L2
Message-ID: <20250924220605.GA2136377@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNRbn+bZ8MP77sdh@lizhi-Precision-Tower-5810>
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

On Wed, Sep 24, 2025 at 04:59:11PM -0400, Frank Li wrote:
> On Wed, Sep 24, 2025 at 02:44:57PM -0500, Bjorn Helgaas wrote:
> > On Wed, Sep 24, 2025 at 03:23:21PM +0800, Richard Zhu wrote:
> > > The ASPM configuration shouldn't leak out here. Remove the L1SS check
> > > during L2 entry.
> >
> > I'm all in favor of removing this code if possible, but we need to
> > explain why this is safe.  The L1SS check was added for some reason,
> > and we need to explain why that reason doesn't apply.
> 
> That's original discussion
> https://lore.kernel.org/linux-pci/20230720160738.GC48270@thinkpad/
> 
> "To be precise, NVMe driver will shutdown the device if there is no
> ASPM support and keep it in low power mode otherwise (there are
> other cases as well but we do not need to worry).
> 
> But here you are not checking for ASPM state in the suspend path,
> and just forcing the link to be in L2/L3 (thereby D3Cold) even
> though NVMe driver may expect it to be in low power state like
> ASPM/APST.
> 
> So you should only put the link to L2/L3 if there is no ASPM
> support. Otherwise, you'll ending up with bug reports when users
> connect NVMe to it.
> 
> - Mani"

Whatever the reasoning is, it needs to be in the commit log.  The
above might be leading to the reasoning, but it would need a lot more
dots to be connected to be persuasive.

If NVMe is making assumptions about the ASPM configuration, there
needs to be some generic way to keep track of that.  E.g., if NVMe
doesn't work correctly with some ASPM states, maybe it shouldn't
advertise support for those states.  Hacking up every host controller
driver doesn't seem like a viable approach.

> > > Cc: stable@vger.kernel.org
> > > Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> > > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index 952f8594b501..9d46d1f0334b 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -1005,17 +1005,9 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
> > >
> > >  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  {
> > > -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > >  	u32 val;
> > >  	int ret;
> > >
> > > -	/*
> > > -	 * If L1SS is supported, then do not put the link into L2 as some
> > > -	 * devices such as NVMe expect low resume latency.
> > > -	 */
> > > -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> > > -		return 0;
> > > -
> > >  	if (pci->pp.ops->pme_turn_off) {
> > >  		pci->pp.ops->pme_turn_off(&pci->pp);
> > >  	} else {
> > > --
> > > 2.37.1
> > >

