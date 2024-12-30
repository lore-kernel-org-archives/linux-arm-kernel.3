Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7111AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tE8iOdd95Sazd2novSpiYMQ29R7opUXWyCVznoM6dA0=; b=i+Z3xTQU5GcpaB
	yU6Do1tW+08pbKd9aNMfM9TCy/FbfwemiVSmyrvZlrbqqHJpvziazgkj0pKz0cJsSqPeiXzIX8il5
	uezevwDUytc7IAsfteuFBjLWBoTkjRbc0++Ycn519vLPilbJ7HWxBC7GPkv8nNsDqRid21dnuCH65
	U1DkzQ2eCKO2yVunvkCAs7tbFq7s4FqgsAJ6uYtQJ5mVo4uAARCuWMLhnoMPLgo6ri0CSb/as13XA
	4cGmCCHIVAnu2KpRHWDX5oxfkrSOO2wxKVuTACgG1nP1dpN9u7nd5w1qlTBbE2CfAUyiHt0TqiZz0
	aVVLogtYzHvst76Gbb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSK2o-00000005bgp-3qJ9;
	Mon, 30 Dec 2024 17:59:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSK1d-00000005bYr-2aPg;
	Mon, 30 Dec 2024 17:57:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2FB8A40DDA;
	Mon, 30 Dec 2024 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D7EC4CED2;
	Mon, 30 Dec 2024 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735581476;
	bh=dzPrHdZM0//31eEZr1bEj6ShwlM5NON8mv2BEY16joc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ABrWQIbXDRX/AAW+l2q3veDwIBQYYxj92TiTOPKiZoIzsYEhg0YUfXEjzs3/PLv9i
	 ipVPop8B7ACEYwqM1eGKMMMC8tK5vzS78vuuwS1To5vBvb6rqE307YtsW889IjSJPN
	 4EYuMfL+Um7ZTS2LyB96X9yocftLVufxNCVbEG1zrJNxETd8YbRRC8vCqRjUkAi3IV
	 XbtUwh0dMMQPvcN3rbaNu1prZSyr4BcANtlShv4j85nYPP/NbDen3w7a4O8AWj2yCI
	 LIbSYdCe+8hhMWkVwexRW+6w9qzlPDmbwd9CfRUdjl8pwFpWgTY0jC3Kt+OxVK8GPw
	 1TDPp/ofG+KXA==
Date: Mon, 30 Dec 2024 11:57:54 -0600
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
Subject: Re: [PATCH v5 1/6] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
Message-ID: <20241230175754.GA3958277@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-pcie-en7581-fixes-v5-1-dbffe41566b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_095757_718413_3DE87230 
X-CRM114-Status: GOOD (  16.84  )
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

On Sat, Nov 30, 2024 at 12:20:10AM +0100, Lorenzo Bianconi wrote:
> Even if this is not a real issue since Airoha EN7581 SoC does not require
> the mac reset line, add missing reset_control_deassert() for mac reset
> line in mtk_pcie_en7581_power_up() callback.

s/mac/MAC/ in English text since "mac" is an acronym, not a real word

This doesn't really say why we need this patch.

This adds both assert and deassert, so it doesn't really look like
adding a *missing* deassert.

On EN7581, is mac_reset optional or always absent?

If mac_reset is always absent for EN7581, why add this patch at all?
If it's optional, say so.

> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 64ef8ff71b0357b9bf9ad8484095b7aa60c22271..4d1c797a32c236faf79428eb8a83708e9c4f21d8 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -942,6 +942,9 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 */
>  	mdelay(PCIE_EN7581_RESET_TIME_MS);
>  
> +	/* MAC power on and enable transaction layer clocks */
> +	reset_control_deassert(pcie->mac_reset);
> +
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> @@ -976,6 +979,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  err_clk_prepare:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
> +	reset_control_assert(pcie->mac_reset);
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  err_phy_deassert:
>  	phy_power_off(pcie->phy);
> 
> -- 
> 2.47.0
> 

