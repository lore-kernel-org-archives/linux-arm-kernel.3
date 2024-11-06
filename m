Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD47D59F7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z1G4jOFY4WZSl/RnI/u+wdBwGUR9bubBqZ4r/tCbtOo=; b=TuidP7sb7zg7nCT/CUoABUerCA
	NwpNs6CApu0BcW4buyoU+Tj3vaC8NAd+sMRhbh5h/ifKYknpZ++UnZxkCLAdmy8CMxQjERmuzdjoI
	2sUctGZVwv2l+V+iWysO0lgCyxNiF5U7AuA1lpuYnM/OS69nEGj4uGHSdLL4Rq1BtnO6Dt549BMse
	EvwpbmYRL1RXUubFk1S5XMdADpTss4aAs64gHu4l5DCulMtK2UFNln8b3G47wTqRZ5dkFy2dlK4Gb
	AaMV2gMrDgBukU9naVImEwP31tftYvjKymDoA34TU/Uum92AFUQFixM4mWtdt6t37Gsb5WFMWtLDU
	c/Uksn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oYe-00000004wGP-3HHd;
	Wed, 06 Nov 2024 22:31:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oWu-00000004vya-2yoG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 818535C4CD5;
	Wed,  6 Nov 2024 22:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B420EC4CEC6;
	Wed,  6 Nov 2024 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730932175;
	bh=FHEZ8Db5PTgMmVRyesXrgUdXjQUoWglkt/etn3U6PNE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VwBqoK488rj4i5ZAs5nN/uCeP7h7zth66K1wgO39pGpLfXIiXeWtenBjfJhyvMNe7
	 mv07rsD6goSN/i0a8VR0F/IyfTPfMRI2Dv8i/Pvw8CLQaASyp4rwG1bScAnkMmqQ61
	 v60vLFFo0q2VvD6AucpE0Tj5ln7xxE813lpwCzQGU0oJO0flmfj5X8mLi9v7BMW9Sz
	 xSDL7J8lSfqV8JVK+mJBUZOmu2Je/8o5LQXTVqoEjnqjbMahPp4xtaqDCdfSInx1lT
	 QPZVvbKUkgWbaDLDo2fR+Yic0+RMp1Gh3L2ncFFu7w90J4AGSqJZPCfpdZ5jMow2Ra
	 S2rstTiEMhKzw==
Date: Wed, 6 Nov 2024 16:29:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	Frank Li <frank.li@nxp.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241106222933.GA1543549@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_142936_859818_495DE7E1 
X-CRM114-Status: GOOD (  25.69  )
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

On Wed, Nov 06, 2024 at 01:59:41AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2024年11月6日 7:27
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: kwilczynski@kernel.org; bhelgaas@google.com;
> > lorenzo.pieralisi@arm.com; Frank Li <frank.li@nxp.com>; mani@kernel.org;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; kernel@pengutronix.de; imx@lists.linux.dev
> > Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
> > some platforms
> > 
> > On Mon, Jul 22, 2024 at 02:15:13PM +0800, Richard Zhu wrote:
> > > The dw_pcie_suspend_noirq() function currently returns success
> > > directly if no endpoint (EP) device is connected. However, on some
> > > platforms, power loss occurs during suspend, causing dw_resume() to do
> > > nothing in this case.
> > > This results in a system halt because the DWC controller is not
> > > initialized after power-on during resume.

> > > @@ -933,23 +933,23 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) &
> > PCI_EXP_LNKCTL_ASPM_L1)
> > >  		return 0;
> > >
> > > -	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_ACT)
> > > -		return 0;
> > > -
> > > -	if (pci->pp.ops->pme_turn_off)
> > > -		pci->pp.ops->pme_turn_off(&pci->pp);
> > > -	else
> > > -		ret = dw_pcie_pme_turn_off(pci);
> > > +	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> > > +		/* Only send out PME_TURN_OFF when PCIE link is up */
> > > +		if (pci->pp.ops->pme_turn_off)
> > > +			pci->pp.ops->pme_turn_off(&pci->pp);
> > > +		else
> > > +			ret = dw_pcie_pme_turn_off(pci);
> > 
> > This looks possibly racy since the link can go down at any point.
>
> When link is down and without this commit changes,
> dw_pcie_suspend_noirq() return directly, and the PME_TURN_OFF
> wouldn't be kicked off.

Right, that's the code change.

> I change the behavior to issue the PME_TURN_OFF when link is up
> here.

But I don't think you responded to the race question.  What happens
here?

  if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
    --> link goes down here <--
    pci->pp.ops->pme_turn_off(&pci->pp);

You decide the LTSSM is active and the link is up.  Then the link goes
down.  Then you send PME_Turn_off.  Now what?

If it's safe to try to send PME_Turn_off regardless of whether the
link is up or down, there would be no need to test the LTSSM state.

Bjorn

