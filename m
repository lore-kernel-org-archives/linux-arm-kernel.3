Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 22:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kKt1yNKI45It3RzkKpmJjmhy9mwZrX1BAF4wPaUrSyo=; b=PH8qflTAiQiYMK
	kCi2EHGWJhbcNvZThY4I8OKA5LetQxDEenfvjq2bzaszyP7sK/cEvHH/bUhgIwuL7a7LG+5dbg6wK
	bA1ooA8iWHrK1EllkNSofokcsUgBO80dAYdIqcchHAZAo25YF4oBkOwFR5P9C2pmH63pwATu35WLd
	dg8ecMw1C/qtI+ZlIsav9zosZ1fwc+3aXYlMvMpwfn9s1yTdrsiSS7A5zoM/JEuiCsXv5IWmzBE07
	qmwW7i+xr6wAfBo1oYvPEGjdC3gx0HOKaLheuxnXPnFR7DxOFMjmTxkB9x0IamAAIA1XF1MwS3+MG
	lEic8BnLnuwxYqGIf8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJYp-0000000GlYl-1pR2;
	Thu, 05 Jun 2025 22:59:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJWf-0000000GlSP-43dL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 22:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E63455C4BBA;
	Thu,  5 Jun 2025 22:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30293C4CEE7;
	Thu,  5 Jun 2025 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749164252;
	bh=ttq74J8zgl/CqPTmFPHRqNeX1HBQ5yWBTsGcAVjdt5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F7J4N7AROXpSNCIcWVGENA6Qg3/33Ich5ukiqOms+VM42I5Zq1EHSHryln5/6ji+/
	 bvlS2Ffc/4RS8aVyTKpO7Wc83areCxJzQ3L/Evs3CG9vuC+Tk6fYcvJT8O+90wjHnb
	 F8cJlAE+J6PzkZjQzSCI+jPvUWCJGbPf1MiGlZNDgD3mxKIxzmFCLvpT3kFBcvpgyI
	 RXvFQPh6UYp7n7DG0YI6U1PdH7I1oTrkbfVLZYKi9Ajk6rLWDdKavUoB2rf05X4Hwk
	 hYmDWxDGxGWYve2Iy+Tm6lzEYHj8Y/ZNW7StUx+lCwF4wRcJV1tPYGObRoxY8PiQOD
	 wW3m6rV4OlNMw==
Date: Thu, 5 Jun 2025 17:57:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <20250605225730.GA625963@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-5-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_155734_089821_CC0A2F6E 
X-CRM114-Status: GOOD (  17.69  )
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

On Fri, May 30, 2025 at 02:19:13PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> only as a root complex, with a single-lane (x1) configuration. The
> controller includes Type 1 configuration registers, as well as IP
> specific registers (called AXI registers) required for various adjustments.

> +/* Timeouts */
> +#define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
> +#define RZG3S_LTSSM_STATE_TIMEOUT_US		1000
> +#define RZG3S_LS_CHANGE_TIMEOUT_US		1000
> +#define RZG3S_LINK_UP_TIMEOUT_US		500000

Are any of these timeouts related to values in the PCIe spec?  If so,
use #defines from drivers/pci/pci.h, or add a new one if needed.

If they come from the RZ/G3S spec, can you include citations?

> +static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host, bool probe)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Initialize the PCIe related registers */
> +	ret = rzg3s_pcie_config_init(host);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize the interrupts */
> +	rzg3s_pcie_irq_init(host);
> +
> +	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
> +					  host->cfg_resets);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for link up */
> +	ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
> +				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS), 5000,
> +				 RZG3S_LINK_UP_TIMEOUT_US);

Where do we wait for PCIE_T_RRS_READY_MS before pci_host_probe()
starts issuing config requests to enumerate devices?

> +	if (ret) {
> +		reset_control_bulk_assert(host->data->num_cfg_resets,
> +					  host->cfg_resets);
> +		return ret;
> +	}
> +
> +	val = readl(host->axi + RZG3S_PCI_PCSTAT2);
> +	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
> +
> +	val = FIELD_GET(RZG3S_PCI_PCSTAT2_STATE_RX_DETECT, val);
> +	dev_info(host->dev, "PCIe x%d: link up\n", hweight32(val));
> +
> +	if (probe) {
> +		ret = devm_add_action_or_reset(host->dev,
> +					       rzg3s_pcie_cfg_resets_action,
> +					       host);
> +	}
> +
> +	return ret;
> +}

> +		 * According to the RZ/G3S HW manual (Rev.1.10, section
> +		 * 34.3.1.71 AXI Window Mask (Lower) Registers) HW expects first
> +		 * 12 LSB bits to be 0xfff. Extract 1 from size for this.

s/Extract/Subtract/

> +		 */
> +		size = roundup_pow_of_two(size) - 1;

