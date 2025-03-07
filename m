Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF79C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/N4JFlusujbcoj0jCEsI/xwSAFfnYWQZ2QHzQLeD/A=; b=MkelKvVz8mw0XtM9XI9GtzzuVB
	E8UIVC9xdeSMTORm7NUbrAP7fwQ9smzwGVxScpOvHw331QSEt/k8lhL/fTg0NhIOeemQ021rsuUNb
	nRG30ZTpZc4rSwlhxiRKdwmRz9o0PnildtW/CuauHyyQObUijAKSReGrvLkwgX937TKzXdFGDB0QB
	Th+yxVNpiKVxhnfnWEmhgXm5LhcU0N5pCL7ZsLYsNoK19dS8mtb+c8zijIcmR4pdfhM32RCvbg/qG
	q/GJ3ozga+t3s61kuj26hPPw2Dfw858yHl2H3ac4dmMsiBld51JvJGm34KDUSpFZOxYsVGN3XJL3l
	SJiZG/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcBr-0000000FBKt-0mta;
	Fri, 07 Mar 2025 18:12:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqboW-0000000F6rO-22qc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C15EFA42DAA;
	Fri,  7 Mar 2025 17:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DACC4CEE2;
	Fri,  7 Mar 2025 17:48:43 +0000 (UTC)
Date: Fri, 7 Mar 2025 23:18:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Kexin.Hao@windriver.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH] PCI: controller: Restore PCI_REASSIGN_ALL_BUS when
 PCI_PROBE_ONLY is enabled
Message-ID: <20250307174839.7nd7mhc5ebmokumu@thinkpad>
References: <20250117082428.129353-1-Bo.Sun.CN@windriver.com>
 <20250210103707.c5ubeaowk7xwt6p5@thinkpad>
 <df5d3c54-d436-43bb-8b40-665c020d6bb5@windriver.com>
 <20250214170057.o3ffoiuxn4hxqqqe@thinkpad>
 <55a33534-bff0-488c-a2a2-2898d54bd62f@windriver.com>
 <20250305060607.ygsafql53h2ujwjp@thinkpad>
 <416a2d7d-eeb6-4163-8805-3178476f5a8d@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <416a2d7d-eeb6-4163-8805-3178476f5a8d@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_094848_609411_73C1F64C 
X-CRM114-Status: GOOD (  11.61  )
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

On Fri, Mar 07, 2025 at 06:14:26PM +0800, Bo Sun wrote:

[...]

> > > So, I propose the following solution as a workaround to handle these edge
> > > cases.
> > > 
> > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > index 82b21e34c545..af8efebc7e7d 100644
> > > --- a/drivers/pci/quirks.c
> > > +++ b/drivers/pci/quirks.c
> > > @@ -6181,6 +6181,13 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1536,
> > > rom_bar_overlap_defect);
> > >   DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1537,
> > > rom_bar_overlap_defect);
> > >   DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1538,
> > > rom_bar_overlap_defect);
> > > 
> > > +static void quirk_marvell_cn96xx_cn10xxx_reassign_all_busnr(struct pci_dev
> > > *dev)
> > > +{
> > > +       if (!pci_has_flag(PCI_PROBE_ONLY))
> > > +               pci_add_flags(PCI_REASSIGN_ALL_BUS);
> > > +}
> > > +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_CAVIUM, 0xa002,
> > > quirk_marvell_cn96xx_cn10xxx_reassign_all_busnr);
> > > +
> > 
> > LGTM. Please add a comment about this quirk too.
> 
> OK, I'll add the comment. Should I send the v2 patch?
> 

Yes, ofc. You should send v2 with the quirk change.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

