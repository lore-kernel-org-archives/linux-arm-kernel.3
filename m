Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC08D59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mbhU5u76CLOOGN/GOKDUc7hnrmQiVYMKws8rURDatl4=; b=UY+BeLjnkoWw6Z
	VuUzPf4g/LfA5Qg3pn6Po+WS4ZenLe0LIiXIuLzIU6Pm7KhU+hzYf6qpPo0HdB8SHPXURNSIQJxdK
	Um7P+ttTU2bag95lsadGfjHeZLEro64AJKNAbVySI4tGFuXLDwJHvMx4vA/sOkS94HzcblGTYAXDv
	zmyV8ojSiv62/NwDLFyDUdZ84Q1B94KayIgUozsBwjWO0/YWC9KqzSrTtl39FotrhDPZGlnPyLWk/
	mU+GhK4sSPrvuHtV32h6uZrGIa+WZ3S9SMKwGuzSFmHqyGywaYcqLKQFvllKtiv9YppCl4xXrPQQF
	aPpGhzVDMFSSp+CmhAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mk2-00000004h7U-2Xnq;
	Wed, 06 Nov 2024 20:35:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mhS-00000004gjK-3WJ1;
	Wed, 06 Nov 2024 20:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9D4EA443C8;
	Wed,  6 Nov 2024 20:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15120C4CEC6;
	Wed,  6 Nov 2024 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730925141;
	bh=1Ei0xMRvJVGpNZKZ8Xu5z8oPwa6biKFwhQZaFWCaniQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tZg0J0eWyw29z9TlF5Dh4E6EQ5oPdCcO4Zz1/6he+K+beNXrwI5BYmOKhVX2TOsrL
	 mAyajLN3o73Gvjnr3Ma+elCxVC6Ow693XoGe6S09/upNh68DhL/lmhJqnTnr1eaG2P
	 vB982vUHSfGzwhi6hvbBmebGg7uoHTS6frYohB/PiF7IdB2PrwT1NTwcKUypN5ZWST
	 +bDlMwFqgxqC0QYaudNUVdGHgRqi8jjbiJge483v+BpQXxLaXN5QcNCgttY6SgPyc+
	 Q2BqAfBJ/xs1a9unoAlhKJDasaC2HI3NH5YOpLHp2NM7XuhVOU6VscBy9lyURxzNsn
	 f8j4/RaEtgLGA==
Date: Wed, 6 Nov 2024 14:32:19 -0600
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
Message-ID: <20241106203219.GA1530199@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca00bd672ee576ad96d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_123223_031125_6AD4C51E 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> PCIe controller driver.
> ...

> +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> +{
> +	struct device *dev = pcie->dev;
> +	int err;
> +	u32 val;
> +
> +	/*
> +	 * Wait for the time needed to complete the bulk assert in
> +	 * mtk_pcie_setup for EN7581 SoC.
> +	 */
> +	mdelay(PCIE_EN7581_RESET_TIME_MS);

It looks wrong to me to do the assert and deassert in different
places:

  mtk_pcie_setup
    reset_control_bulk_assert(pcie->phy_resets)        <--
    mtk_pcie_en7581_power_up
      mdelay(PCIE_EN7581_RESET_TIME_MS)
      reset_control_bulk_deassert(pcie->phy_resets)    <--
      mdelay(PCIE_EN7581_RESET_TIME_MS)

That makes the code hard to understand.

> +	err = phy_init(pcie->phy);
> +	if (err) {
> +		dev_err(dev, "failed to initialize PHY\n");
> +		return err;
> +	}
> +
> +	err = phy_power_on(pcie->phy);
> +	if (err) {
> +		dev_err(dev, "failed to power on PHY\n");
> +		goto err_phy_on;
> +	}
> +
> +	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> +	if (err) {
> +		dev_err(dev, "failed to deassert PHYs\n");
> +		goto err_phy_deassert;
> +	}
> +
> +	/*
> +	 * Wait for the time needed to complete the bulk de-assert above.
> +	 * This time is specific for EN7581 SoC.
> +	 */
> +	mdelay(PCIE_EN7581_RESET_TIME_MS);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +

> +	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
> +	if (err) {
> +		dev_err(dev, "failed to prepare clock\n");
> +		goto err_clk_prepare;
> +	}
> +
> +	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> +	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> +	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> +	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> +	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
> +
> +	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
> +	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
> +	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
> +	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
> +	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);

Why is this equalization stuff in the middle between
clk_bulk_prepare() and clk_bulk_enable()?  Is the split an actual
requirement, or could we use clk_bulk_prepare_enable() here, like we
do in mtk_pcie_power_up()?

If the split is required, a comment about why would be helpful.

> +	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> +	if (err) {
> +		dev_err(dev, "failed to prepare clock\n");
> +		goto err_clk_enable;
> +	}

Per https://lore.kernel.org/r/ZypgYOn7dcYIoW4i@lore-desk,
REG_PCI_CONTROL is asserted/deasserted here by en7581_pci_enable().

Is this where PERST# is asserted?  If so, a comment to that effect
would be helpful.  Where is PERST# deasserted?  Where are the required
delays before deassert done?

Bjorn

