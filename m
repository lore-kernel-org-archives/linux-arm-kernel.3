Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1546CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 00:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3v9OWDc0ErfOc9vfGxo9Ncg/D3IUzgRCuTqRWnpFMnY=; b=LDr4tw0VR75m/k
	IgLR7FeUwSyco3mzxtNSXFHfTLPHkC03OP+cACURJxEBeStJWm0Jk7J065ee0kisLKEb29nR/FNDy
	+LkOJ4LWSKorCfEVi6y+PDUFaxPSNP4eZN1poRArrC6Qt7DSxcaTaUNLr3PkFefU1npHo3E++5wpB
	2vkPGb7KgA1jSJ+FeKj6g8ojPuy9eNPM+gDs/4pmgTm3G/Ub0SV9D/6jTH2ZREAsxMZHILaHJNOC+
	aGDPE1CIzm3EYqHzDblwwrKsQinvkMZciP+dBsWIjej/Co5DlFfBwouTDw4hLYmh2TiZ93iswcrLe
	HszLMAdu6AMLg82x0yBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnVQ-0000000EdeN-31n5;
	Thu, 06 Nov 2025 00:05:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnVO-0000000Ede2-35va
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 00:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AD53439ED;
	Thu,  6 Nov 2025 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF74BC4CEF5;
	Thu,  6 Nov 2025 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762387533;
	bh=y/ZAYxCD+K0ben97/l/TcgYvp1v3jhspO1xwcEPug+I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=e2Tj1pIej2SBYovVy9liByuimeqmIgSHUlUPqS3qaqe4q1iQ9iUL0nhZsrG4m3usd
	 TLFBN360oIQrAifta/POgM8nU9YvTGyaHgCVDft5m4cy43QE1vYw/YdF+dZo+bIjl0
	 CUXOZDan9dkcWVK3bS/p+7bK1hZr0ZQTseFeYxpmD31C4aLVggm/7YTH/BiywhkoC0
	 9U6yPAVKUEutUFhQ+wtekf21eqJo8Td4ohrhml9TPiMC7JhLiKqcv/KyPJlgsJeRer
	 FIWkYxgQHYt7a+iYBVzuSklb8MjOvQCVrEiJzZU+hOSiEt/puGzZcLaiO6lSxo1Kg7
	 wfCItHHp/YtYA==
Date: Wed, 5 Nov 2025 18:05:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <20251106000531.GA1930429@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_160534_843040_24826F40 
X-CRM114-Status: GOOD (  33.79  )
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

[+cc imx6, layerscape, stm32 maintainers for possible suspend bug]

On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > Add initial support of the PCIe controller for S32G Soc family. Only
> > > host mode is supported.

> > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > +{
> > > ...
> > > +     /*
> > > +      * Make sure we use the coherency defaults (just in case the settings
> > > +      * have been changed from their reset values)
> > > +      */
> > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> >
> > This seems sketchy and no other driver uses memblock_start_of_DRAM().
> > Shouldn't a physical memory address like this come from devicetree
> > somehow?
> 
> I was using DT but has been asked to not use it and was proposed to
> use memblock_start_of_DRAM() instead

Can you point me to that conversation?

> > > +     s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > +             return PTR_ERR(s32g_pp->ctrl_base);
> >
> > This looks like the first DWC driver that uses a "ctrl" resource.  Is
> > this something unique to s32g, or do other drivers have something
> > similar but use a different name?
> 
> AFAICT this seems to be s32g specific in the RM

It does look like there's very little consistency in reg-names across
drivers, so I guess it's fine.

> > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > +{
> > > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > > +     struct dw_pcie *pci = &s32g_pp->pci;
> > > +
> > > +     if (!dw_pcie_link_up(pci))
> > > +             return 0;
> >
> > Does something bad happen if you omit the link up check and the link
> > is not up when we get here?  The check is racy (the link could go down
> > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > completely reliable.
> >
> > If you have to check, please add a comment about why this driver needs
> > it when no other driver does.
> 
> dw_pcie_suspend_noirq returns an error and the suspend fails

The implication is that *every* user of dw_pcie_suspend_noirq() would
have to check for the link being up.  There are only three existing
callers:

  imx_pcie_suspend_noirq()
  ls_pcie_suspend_noirq()
  stm32_pcie_suspend_noirq()

but none of them checks for the link being up.

> I will add a comment
> /*
>  * If the link is not up, there is nothing to suspend and resume

Sometimes true, but still racy as I mentioned, and doesn't explain why
s32g is different from imx, ls, and stm32.

> > > +     return dw_pcie_suspend_noirq(pci);
> > > +}

