Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69508C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=C/18jsU0Ha852v7byYomkDNPz7efB2vaAjH6A8LyE0k=; b=WLoaFkYr+f+gh9
	/Fb7YgmvM6XZCfVg7G9oUzlj245ag6Q/0K40YR8HIBexV5fBVgbuhCtzwJAGp4kHHaXDyZZbsAl2M
	w2oYHHg6zP94vZbJurH6VkAWIwZWxb0APNfgKJDTkE++N6U4xoGmQSTXu2ZMVaLxJ5nG1P7daLWQ2
	2efnz7a9t2fnZp7pNFatNA9aLG3hHVrw7BwSBcXGKyJ55eNGZk92OFM5YNjmyf8BrQ7K7IQp2ZazK
	/595/Gfdr8a8G9MJDVyCqOOAXt/cu7UYWhbVG8o7qTbo3+VEt9JOM8h5GlSqeKvRkyJGpi2lxtbvn
	vBLnHt3hZn9khSbkqI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Uyw-0000000EC9R-2h2h;
	Thu, 17 Apr 2025 19:33:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ux4-0000000EBBN-0fUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 19:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BBF2A4A49B;
	Thu, 17 Apr 2025 19:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2777C4CEE4;
	Thu, 17 Apr 2025 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744918269;
	bh=9AX6tVfbkd+pSYNXJrk75ytubbBqDkCzzjRuH1cCBcI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=C3givaiBZ9ajgF4VdBGY/2PGt6kDEdJY24QBrLscfHSkVIs0JkxrLLvGUy+aPIisL
	 YVNGCEBiKXeq9hfyPYEqqSKRPl0Z3mlXn2i3faLy0ZNTymx8+GLAuBu+n7nE7k3x/Z
	 QgAU+7feL5Z8uN5PuRXAlTm/xeolipSvGwMGfY2HDVDqUiTU2hI5V/yvoOR25vCtGU
	 ymP47NCvBN/B4vrjSmLdtg2CXYzhSa445aOwMOWSm3bjLqTx38HkmE6mMBh8ZSU8ZX
	 EixnmcB4+POaXdUK22IXvJTtR/Ylgd4aIZh29brR0Km7YZBrFgZJjFd3mTrXBQRWxQ
	 8+gNBWETf42RQ==
Date: Thu, 17 Apr 2025 14:31:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	thippeswamy.havalige@amd.com, shradha.t@samsung.com,
	quic_schintav@quicinc.com, cassel@kernel.org,
	johan+linaro@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/9] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20250417193107.GA123243@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417131833.3427126-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_123110_262694_81C7D74F 
X-CRM114-Status: GOOD (  11.37  )
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

On Thu, Apr 17, 2025 at 03:18:26PM +0200, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> controller based on the DesignWare PCIe core.

> +static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
> +{
> +	/* Delay PERST# de-assertion t least 100ms he power to become stable */

s/ t / at /
s/ he / for / ?

Could also remove "100ms".

> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	gpiod_set_value(stm32_pcie->perst_gpio, 0);
> +
> +	/* Wait 100ms for the REFCLK to becode stable  */

s/becode/become/

Could drop "100ms" here, too.

> +	if (stm32_pcie->perst_gpio)
> +		msleep(PCIE_T_RRS_READY_MS);
> +}

> +	if (stm32_pcie->wake_gpio) {
> +		wake_irq = gpiod_to_irq(stm32_pcie->wake_gpio);
> +		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
> +		if (ret) {
> +			dev_info(dev, "Failed to enable wake# %d\n", ret);

I guess this refers to the "WAKE#" signal in the spec?  Could
capitalize to remove the question.

