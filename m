Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD11CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6awVeAnCPFYv1YMLUff/01V2rcXe57qwmUCtyQKLpkU=; b=yEmd5HozcXNxCP
	6cjEs6AewBD96MSNMJrshkbyu0Z8eXc9mCB9soKOBELDqIBtwxKekTp160cc8qGarpboJVXkGZiew
	+LgohxyfsoK0m2QwC1/0e1Xn2dHTMpzXYLGJdqxdELUqKRc6VPpGtWus7nEY+7npHVEGHle823HTC
	q3nSHh8yrXLR/Wce6SpLP4c0N56kQSBg518zkq6IQlKdRujN5FO1j0r+iYFPLWw+5ZqLDs4VsYnua
	38tB/ByXef3XUfklFJlcwq+AFMQhdjnz/MBBW+qk1H9ZSUG1KtIAoLsqhl2rnjUJ5rqebbOj/e9PQ
	sroYj6MPoEn7ms8P0cZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Oj-0000000GnbG-04sa;
	Mon, 17 Nov 2025 20:00:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Oh-0000000GnaW-1WZd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2C9F601B6;
	Mon, 17 Nov 2025 20:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CBAC2BCB0;
	Mon, 17 Nov 2025 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763409622;
	bh=KL4ddw+mqA9q22Tcaw70/uKb4mnlKlO94DBUCy7tcEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=O6++nN2su5fvC7YOL15YxY2wHD1NrJgke+r+C0Y1ErXQ84kSI31a9ghucWfinpUml
	 5tBYLffCZUK9GNG4Hc9NhVpPOT9duH29630dMPSTA21GCcnYuv6R93gslma2ULiIXr
	 V21ywJO8p+odEWY/cyVZ3q6TCqQmIudAEeLgFZTSIIvK3RN6CSz41NthOmAQQ7o7q4
	 qU1os6pqo6wIvwbA7L0jg8CryqTD5Clxu4gauREAzFpXePpcVuylWNvkeegLEireYL
	 SDhlb+j6NR/j1aRSJPDMMwPW6iMXgYa2zbx7blo9t0hpAcYiTXAwxiQwoZLGfstfeA
	 dN9UqjE2383ug==
Date: Mon, 17 Nov 2025 14:00:20 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: stm32: Fix LTSSM EP race with start link.
Message-ID: <20251117200020.GA2518034@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367c8b88-79e7-4e8d-bf70-9d283696aba2@foss.st.com>
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

On Mon, Nov 17, 2025 at 01:04:47PM +0100, Christian Bruel wrote:
> On 11/14/25 19:59, Bjorn Helgaas wrote:
> > On Fri, Nov 14, 2025 at 08:45:52AM +0100, Christian Bruel wrote:
> > > If the host has deasserted PERST# and started link training before the link
> > > is started on EP side, enabling LTSSM before the endpoint registers are
> > > initialized in the perst_irq handler results in probing incorrect values.
> > > 
> > > Thus, wait for the PERST# level-triggered interrupt to start link training
> > > at the end of initialization and cleanup the stm32_pcie_[start stop]_link
> > > functions.
> > 
> > I've seen this kind of thing in other drivers, and I wondered whether
> > it was safe because the host asserts and deasserts PERST#
> > asynchronously, independent of anything the endpoint is doing.
> > 
> > I assume it's possible that the host deasserts PERST# before this
> > driver has the stm32_pcie_ep_perst_irq_thread() thread set up.  If
> > that happens and the driver doesn't see the PERST# interrupt, does
> > everything still work correctly?
> 
> yes it does. the PERST# interrupt is level-triggered and, if already
> de-asserted, fires only when enabled (it is NOAUTOEN) with start_link.
> 
> At that point, the host can enumerate by performing a manual rescan or
> rebind the PCIe driver, restarting the entire probe sequence.
> 
> Tested the pcie_epf_test driver with various power-up sequences: full
> power-up the host or device first, and stop or standby PM suspend/resume.

Help me think through this.  I guess the interesting case is when the
host boots first and enumerates devices before the stm32 endpoint is
ready, right?

I suppose the endpoint LTSSM is initially disabled, so the link is
down, and the host enumeration didn't find anything?

Where does the link come up?  I see the pci_epc_start_store() that
eventually leads to stm32_pcie_start_link(), which enables perst_irq.
Since you requested perst_irq with IRQF_TRIGGER_HIGH, and PERST# is
deasserted, does that trigger stm32_pcie_ep_perst_irq_thread() and
call stm32_pcie_perst_deassert() to enable the LTSSM?

When the link comes up, if the Downstream Port supports hotplug and
pciehp is enabled, it might notice the link-up event and treat this as
a hot-add?

Otherwise the user would have to manually rescan to notice the
endpoint?

> > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-stm32-ep.c | 38 ++++++------------------------
> > >   1 file changed, 7 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > index 3400c7cd2d88a279c49ef36a99fc7537c381c384..d0654bb43759bb8d0f0d7badbf7bdae839241fcf 100644
> > > --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > @@ -37,36 +37,9 @@ static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> > >   		dw_pcie_ep_reset_bar(pci, bar);
> > >   }
> > > -static int stm32_pcie_enable_link(struct dw_pcie *pci)
> > > -{
> > > -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > -
> > > -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > -			   STM32MP25_PCIECR_LTSSM_EN,
> > > -			   STM32MP25_PCIECR_LTSSM_EN);
> > > -
> > > -	return dw_pcie_wait_for_link(pci);
> > > -}
> > > -
> > > -static void stm32_pcie_disable_link(struct dw_pcie *pci)
> > > -{
> > > -	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > -
> > > -	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> > > -}
> > > -
> > >   static int stm32_pcie_start_link(struct dw_pcie *pci)
> > >   {
> > >   	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > -	int ret;
> > > -
> > > -	dev_dbg(pci->dev, "Enable link\n");
> > > -
> > > -	ret = stm32_pcie_enable_link(pci);
> > > -	if (ret) {
> > > -		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> > > -		return ret;
> > > -	}
> > >   	enable_irq(stm32_pcie->perst_irq);
> > > @@ -77,11 +50,7 @@ static void stm32_pcie_stop_link(struct dw_pcie *pci)
> > >   {
> > >   	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > -	dev_dbg(pci->dev, "Disable link\n");
> > > -
> > >   	disable_irq(stm32_pcie->perst_irq);
> > > -
> > > -	stm32_pcie_disable_link(pci);
> > >   }
> > >   static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > @@ -152,6 +121,8 @@ static void stm32_pcie_perst_assert(struct dw_pcie *pci)
> > >   	dev_dbg(dev, "PERST asserted by host\n");
> > > +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
> > > +
> > >   	pci_epc_deinit_notify(ep->epc);
> > >   	stm32_pcie_disable_resources(stm32_pcie);
> > > @@ -192,6 +163,11 @@ static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
> > >   	pci_epc_init_notify(ep->epc);
> > > +	/* Enable link training */
> > > +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > +			   STM32MP25_PCIECR_LTSSM_EN,
> > > +			   STM32MP25_PCIECR_LTSSM_EN);
> > > +
> > >   	return;
> > >   err_disable_resources:
> > > 
> > > ---
> > > base-commit: 31115ecec74fe5c679a149d7037009f26b3aa8a9
> > > change-id: 20251113-perst_ep-0b57b9679cf9
> > > 
> > > Best regards,
> > > -- 
> > > Christian Bruel <christian.bruel@foss.st.com>
> > > 
> 

