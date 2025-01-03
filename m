Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98203E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gHoifUrbB/ka64VaA0X1OggfLE/RxYrnIK7fpRKrH8M=; b=kolKoM0XCdkg5X
	CLbEJy/zPca/qoPPzmjRufNGoYDHlimUu5u6PHGfCS+WFw7ND5VOVM7AJk0RTjz/tTimtq0EQVdwd
	+p58kERdvROlyzo6BsJTs1D2AQ7R8ebbd+MHYzhd8nz5lzKzXzbo0pUIfg0ipEA116lpBBa1vG6KF
	ZPz1CAa9+bEqqPDI58BZgqF611RngSAx05xQTJlrrIY4tM2zagkhial9eNMSsPLa4OPeSeccD8Sb6
	RsluKg6lLX17K6xnsyY2lfVXjfGGCvlcb++NeF2d9eW/xSjF/MZ7fbz64Q9yy7Xji10i5QerhFEYz
	Zn5SidENR10xtDqEPITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmXO-0000000DidR-11qX;
	Fri, 03 Jan 2025 18:36:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmWB-0000000DiZS-3Vy9;
	Fri, 03 Jan 2025 18:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C59F45C077A;
	Fri,  3 Jan 2025 18:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91611C4CECE;
	Fri,  3 Jan 2025 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735929330;
	bh=ibvW79eXJj9bVQweOC7IEhp7Vlli+LtSmdXNdcq9QEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Xx0pQfwXe3nUi4AxSJKfgoGsj5s6dtkSTxO4cKrT/aqGtOb4X5McUGs04OaP1J7jU
	 2Xzu+QBsX6tTThEl7PjqQJRaWR+7pK5SPuYLSD6KzojpMq6cEm2sAtoq3A3cMSDV5Z
	 mIDzYbT5B66q2E8FftvyNQ+4Q7KxYjxE1nK56uoiR1WyvKcpG7Up2IPTHERS31ACx2
	 23wT8S3lC8frjB3fEExs5/7S8OurliP6NnsoUsCyNp0KdWuMF0mu6knHOl7EUGNK6/
	 R6i6wMJYJfRLgfuWXZlcDkp8Pmv0O3P5bCqdCEyWlkovWtWDfNfizggj+C0x/4I/x7
	 o8iNiXs6XXmQQ==
Date: Fri, 3 Jan 2025 12:35:27 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
Message-ID: <20250103183527.GA3959656@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-pcie-en7581-fixes-v5-5-dbffe41566b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_103531_960700_B48794AE 
X-CRM114-Status: GOOD (  21.12  )
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


If you repost this series, here are a few comments/typos.  Otherwise
we can do the trivial updates on the branch.

In subject: this patch doesn't *add* a delay; it *moves* it.

On Sat, Nov 30, 2024 at 12:20:14AM +0100, Lorenzo Bianconi wrote:
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> REG_RESET_CONTROL (0x834) registers available in the clock module
> running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().

Add parens after clk_bulk_prepare_enable.

> In order to make the code more readable, move the wait for the time
> needed to complete the PCIe reset from en7581_pci_enable() to
> mtk_pcie_en7581_power_up().
> Reduce reset timeout from 250ms to the standard PCIE_T_PVPERL_MS value
> (100ms) since it has no impact on the driver behavior.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/clk/clk-en7523.c                    | 1 -
>  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e56a1642ecb0562377a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	       REG_PCI_CONTROL_PERSTOUT;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
> -	msleep(250);
>  
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 01e8fde96080fa55f6c23c7d1baab6e22c49fcff..da01e741ff290464d28e172879520dbe0670cc41 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -977,6 +977,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  		goto err_clk_prepare_enable;
>  	}
>  
> +	/*
> +	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
> +	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> +	 * complete the PCIe reset.

s/callabacks/callbacks/

> +	 */
> +	msleep(PCIE_T_PVPERL_MS);
> +
>  	return 0;
>  
>  err_clk_prepare_enable:
> 
> -- 
> 2.47.0
> 

