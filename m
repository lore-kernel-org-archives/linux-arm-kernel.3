Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17451D59F7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CsqE3hMqDxJ+VjjbyTflqcaNxMD4t3/CALPcofdUQOo=; b=BvAX+a/Cqgdgab
	rmyfPxinWrlsBcPvrCovhvuIR3rMsBHueqXYe7GcK3/XSZYLuRes2+6VdNBG0zKGU2SYEPDBsz9jw
	mSMxzEZsIq8k1XZUvyUOnLIVwM0x9xaxEpDw8lgQxZOJPdUXiky1ZLMcxh/OkgPIckpG4FKhfYWH6
	j1XFFUZNInIhwmJZ6I/iuoUERKq5OkcugXBzsAO4ySG3Fu8lZgTsEWjq/hl2NFYAbupWtpiaDvzgx
	FulKEkWlnrqKYkUmyulXHMgNuXUku3KQLQ31EHzKgL097UFDoPKBRvWoR7+/Biwn87OeVzDkul6sQ
	c4BRfU1fGwJeOsDKMGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pWZ-000000053VP-0FtX;
	Wed, 06 Nov 2024 23:33:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pUk-0000000538P-2DSd;
	Wed, 06 Nov 2024 23:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D60BA40116;
	Wed,  6 Nov 2024 23:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1246CC4CEC6;
	Wed,  6 Nov 2024 23:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935885;
	bh=+oR0lbPCxYDktvmqYyECp9ARZ9ditH6+Br5Ol+YacvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LCgtgnXS34KEat08WBk8VotJAgkfFpyDt5i9Kouaaf6tnp9SHAgfDj0KqqL2yJTDh
	 lerVJDtrdpB5Ycw//ZLmMjPqQi+eAcKj7FZlcnBor6fq+3bR87ouHP/72UDCXf3M+l
	 0Ule8IdT/y6HHNlAmx+T0+2MXGOoIPpUMhfmL6jY8g10pQWMo0KgTZOYTOqyVV+nT0
	 CDMgjNkdPuNMctOMPxJSq4ubzD2Mp8jVHLp9qY/5mo+QjL4i5L9Fjt0Ku3fEskl18P
	 2cliTAd14yWndNICp5mNbQcjy5B3MG1l3RRs6/pHZXPz1i9x7TXMomJOvL8sJhuJD1
	 Gp64oydk5Nicg==
Date: Wed, 6 Nov 2024 17:31:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20241106233123.GA1580663@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyvwXHMRz0kI0J5O@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_153126_725076_59A90776 
X-CRM114-Status: GOOD (  34.12  )
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

On Wed, Nov 06, 2024 at 11:40:28PM +0100, Lorenzo Bianconi wrote:
> > On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > PCIe controller driver.
> > > ...
> > 
> > > +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > > +{
> > > +	struct device *dev = pcie->dev;
> > > +	int err;
> > > +	u32 val;
> > > +
> > > +	/*
> > > +	 * Wait for the time needed to complete the bulk assert in
> > > +	 * mtk_pcie_setup for EN7581 SoC.
> > > +	 */
> > > +	mdelay(PCIE_EN7581_RESET_TIME_MS);
> 
> > It looks wrong to me to do the assert and deassert in different
> > places:
> > 
> >   mtk_pcie_setup
> >     reset_control_bulk_assert(pcie->phy_resets)        <--
> >     mtk_pcie_en7581_power_up
> >       mdelay(PCIE_EN7581_RESET_TIME_MS)
> >       reset_control_bulk_deassert(pcie->phy_resets)    <--
> >       mdelay(PCIE_EN7581_RESET_TIME_MS)
> > 
> > That makes the code hard to understand.
> 
> The phy reset line was already asserted running reset_control_assert() in
> mtk_pcie_setup() and de-asserted running reset_control_deassert() in
> mtk_pcie_power_up() before adding EN7581 support. Moreover, EN7581 requires
> to run phy_init()/phy_power_on() before de-asserting the phy reset lines.
> I guess I can add a comment to make it more clear. Agree?

I assume the first deassert(phy_resets) in mtk_pcie_setup() is not
paired with anything in this driver.

I think it would be better to pair the other assert/deasserts in the
same functions like the below.  Then it's easy to see the matching.

While looking at this, I noticed that we assert(mac_reset) in
mtk_pcie_setup(), but it's never deasserted for EN7581.

  mtk_pcie_setup
    reset_control_bulk_deassert(phy_resets)
    mtk_pcie_en7581_power_up
      reset_control_bulk_assert(phy_resets)  # move here
      reset_control_assert(mac_reset)        # move here
      mdelay(PCIE_EN7581_RESET_TIME_MS)
      phy_init
      phy_power_on
      reset_control_deassert(mac_reset)      # add; seems missing?
      reset_control_bulk_deassert(phy_resets)
      mdelay(PCIE_EN7581_RESET_TIME_MS)

  mtk_pcie_setup
    reset_control_bulk_deassert(phy_resets)
    mtk_pcie_power_up
      reset_control_bulk_assert(phy_resets)  # move here
      reset_control_assert(mac_reset)        # move here
      reset_control_bulk_deassert(phy_resets)
      phy_init
      phy_power_on
      reset_control_deassert(mac_reset)

> > > +	err = phy_init(pcie->phy);
> > > +	if (err) {
> > > +		dev_err(dev, "failed to initialize PHY\n");
> > > +		return err;
> > > +	}
> > > +
> > > +	err = phy_power_on(pcie->phy);
> > > +	if (err) {
> > > +		dev_err(dev, "failed to power on PHY\n");
> > > +		goto err_phy_on;
> > > +	}
> > > +
> > > +	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > > +	if (err) {
> > > +		dev_err(dev, "failed to deassert PHYs\n");
> > > +		goto err_phy_deassert;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Wait for the time needed to complete the bulk de-assert above.
> > > +	 * This time is specific for EN7581 SoC.
> > > +	 */
> > > +	mdelay(PCIE_EN7581_RESET_TIME_MS);
> > > +
> > > +	pm_runtime_enable(dev);
> > > +	pm_runtime_get_sync(dev);
> > > +
> > 
> > > +	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
> > > +	if (err) {
> > > +		dev_err(dev, "failed to prepare clock\n");
> > > +		goto err_clk_prepare;
> > > +	}
> > > +
> > > +	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> > > +	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> > > +	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> > > +	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> > > +	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
> > > +
> > > +	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
> > > +	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
> > > +	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
> > > +	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> > > +	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
> > 
> > Why is this equalization stuff in the middle between
> > clk_bulk_prepare() and clk_bulk_enable()?  Is the split an actual
> > requirement, or could we use clk_bulk_prepare_enable() here, like we
> > do in mtk_pcie_power_up()?
> 
> Nope, we can replace clk_bulk_enable() with clk_bulk_prepare_enable() and
> remove clk_bulk_prepare() in mtk_pcie_en7581_power_up() since we actually
> implements just enable callback for EN7581 in clk-en7523.c.
> 
> > If the split is required, a comment about why would be helpful.
> > 
> > > +	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> > > +	if (err) {
> > > +		dev_err(dev, "failed to prepare clock\n");
> > > +		goto err_clk_enable;
> > > +	}
> > 
> > Per https://lore.kernel.org/r/ZypgYOn7dcYIoW4i@lore-desk,
> > REG_PCI_CONTROL is asserted/deasserted here by en7581_pci_enable().
> 
> correct
> 
> > Is this where PERST# is asserted?  If so, a comment to that effect
> > would be helpful.  Where is PERST# deasserted?  Where are the required
> > delays before deassert done?
> 
> I can add a comment in en7581_pci_enable() describing the PERST issue for
> EN7581. Please note we have a 250ms delay in en7581_pci_enable() after
> configuring REG_PCI_CONTROL register.
> 
> https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L396

Does that 250ms delay correspond to a PCIe mandatory delay, e.g.,
something like PCIE_T_PVPERL_MS?  I think it would be nice to have the
required PCI delays in this driver if possible so it's easy to verify
that they are all covered.

Bjorn

