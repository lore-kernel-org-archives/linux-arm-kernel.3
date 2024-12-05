Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF52E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XNAcjeI+JTLnHLWMS6wwOPHgI07zL+P1HvYAjUN+l9o=; b=wa9/Ly/M35iXN5
	SWpxG3ImpU7HzwS3Do8zS3kA2vLcl7wL+pxeFW+fPe47B6YK0KCmOXUtRM74SDX5g2I30fJuQceE6
	+yFUcRx+uUoC0g74MjENpncn1qNLuJeFaE/+Dkgeh5abb4vDSrXLRCLoQ9HJcYEZYk5U1P7M/Boxp
	28NyerCHLzYyVWTnIFTyh2NCyu0QoDswahH7af27geRUGIQ5FJ0Aq6HCSo0SUdqxpmf2Ck8b/9hIT
	KdXFywDSTfTzpInPjIHiCHQ48Fsg2DVVULPR8fSdn1uZ8mRtrmwNAp6g6fIDrNH86fIrpFG5fURhG
	9vVGl0uM41eTZ0RqcZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFi4-0000000GxqS-20d1;
	Thu, 05 Dec 2024 17:32:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFdd-0000000Gwy2-3cTV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AEB7A43E7A;
	Thu,  5 Dec 2024 17:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88212C4CED1;
	Thu,  5 Dec 2024 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733419660;
	bh=Ri91blaEJu7Ua+jUwYZXPSeBwql1Lk/K8YeLB3/SMrc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ecgAG1XAX0KLrXM6fWo9pl2oJJO6VYSY69RsMhWwXPBtDG+NAvyFaFri8BJEEnvJ/
	 ASsWy0ZWIpKjN9kJUkZdW9/sv+KdeWeToBjYbiiwzBGTUlerd1t9XqzBdq5RWVJKV2
	 g+yYV/Mwpkr8pUzeCmfkDUakzUxFNr+h0d+fg2YBvDgxh7auNQoif/C42tItTndx/f
	 PoS/aOSeWdlVhNEgucreK+/PAvsv7A0N1GXCpzH4y0EtPiYRB2K6PQ4KjWCGgD7z+E
	 iMJiUfUKBgLWtUhB9rCo9BzHrEloST1HnlsiibqwpZYzCt/GcYJAhNZASZH55UGlVv
	 3SUby2bfsHzOA==
Date: Thu, 5 Dec 2024 11:27:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint support for
 STM32MP25
Message-ID: <20241205172738.GA3054352@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-5-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_092742_027704_B4DB29A2 
X-CRM114-Status: GOOD (  18.57  )
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

On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> Add driver to configure the STM32MP25 SoC PCIe Gen2 controller based on the
> DesignWare PCIe core in endpoint mode.

> +config PCIE_STM32_EP
> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	depends on PCI_ENDPOINT
> +	select PCIE_DW_EP
> +	help
> +	  Enables endpoint support for DesignWare core based PCIe controller in found
> +	  in STM32MP25 SoC.

s/in found in/in/ (or "found in" if you prefer)

Wrap so help text fits in 80 columns when for "make menuconfig".

> +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	enum pci_barno bar;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> +		dw_pcie_ep_reset_bar(pci, bar);
> +
> +	/* Defer Completion Requests until link started */

I asked about this before [1] but didn't finish the conversation.  My
main point is that I think "Completion Request" is a misnomer.
There's a "Configuration Request" and a "Completion," but no such
thing as a "Completion Request."

Based on your previous response, I think this should say something
like "respond to config requests with Request Retry Status (RRS) until
we're prepared to handle them."

> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
> +			   STM32MP25_PCIECR_REQ_RETRY_EN);
> +}
> +
> +static int stm32_pcie_enable_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	int ret;
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_LTSSM_EN,
> +			   STM32MP25_PCIECR_LTSSM_EN);
> +
> +	ret = dw_pcie_wait_for_link(pci);
> +	if (ret)
> +		return ret;
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
> +			   0);

And I assume this means the endpoint will accept config requests and
handle them normally instead of responding with RRS.

Strictly speaking this is a different condition than "the link is up"
because the link must be up in order to even receive a config request.
The purpose of RRS is for devices that need more initialization time
after the link is up before they can respond to config requests.

The fact that the hardware provides this bit makes me think the
designer anticipated that the link might come up before the rest of
the device is fully initialized.

Bjorn

[1] https://lore.kernel.org/r/20241112203846.GA1856246@bhelgaas


