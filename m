Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE925C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BHp18JK7JZ2Mrw0ZrUESo0RJu+yED+tqkK5PcwM6KM=; b=N4AeLy2y9ZfMe6RLQR0nbP4T5U
	zUR3uIk4XetG/uj5epr14qWzY6XBnzmw22wappAPIrK/mOjlODCWJMp9aDjGPw4fVszf5jQJRAeDO
	Z/x0Rbd/3RYd5M8UR2+IBNkgSrAt17VrsseEr3kHv6yKy1gCbeS+CPRk7Iq0K+l4yzt6hi+8ge1G/
	OBqqVXSBJ90BIlosM5GST0vhZ22NVE6OxAt16HDnaAp01B7CaUc7REAZRzCDXcKtgLyUNGkSyCbg6
	KOzKUv2+OIQrVHC3/QaaXzp4YR0CTg0RwkgLEjJnxgB2m/SiIq/4eY/yH1jq7HDLX+henLz+a+AtX
	m4LfRizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Qp-0000000AWvO-0eDa;
	Wed, 09 Sep 2026 00:44:55 +0000
Received: from mail-m160236524.xmail.ntesmail.com ([160.236.52.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Qm-0000000AWuV-1hFs;
	Wed, 09 Sep 2026 00:44:54 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d08c1d9d;
	Wed, 9 Sep 2026 08:44:48 +0800 (GMT+08:00)
Message-ID: <4d441232-6ab5-4865-a70c-f868e8128f7e@rock-chips.com>
Date: Wed, 9 Sep 2026 08:44:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 02/10] PCI: dw-rockchip: Restore vpcie3v3 regulator
 handle
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
 <20260908-rockchip-pcie-system-suspend-v6-2-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-2-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0839fe00403a4kunm50f3116743e785
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0IdVk9MGkseSUJOQ01JTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=e9NTEEIWqkh7Z68AwWcaKw2n1Tx+hNYucPDaLw/joe2dmc0eusuvJC9uTUS6/osiyrEz/1iXmbi+GcbCQzY84/xyRH5OnH7Tt91mMMAwTo4iuryxRApYrm6MvmZOQZqAOV2qJg2ROIsA16acFLY3yXJ/KzvONULKiDLcOGWCgEw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=8BHp18JK7JZ2Mrw0ZrUESo0RJu+yED+tqkK5PcwM6KM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_174452_715723_70787559 
X-CRM114-Status: GOOD (  19.95  )
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

在 2026/09/08 星期二 22:51, Sebastian Reichel 写道:
> This reverts commit c930b10f17c0 ("PCI: dw-rockchip: Simplify regulator
> setup with devm_regulator_get_enable_optional()"), which nicely cleaned
> up the code.
> 
> The vpcie3v3 regulator handle is needed to disable the regulator during
> system suspend (to be added in its own patch).
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index dc85564e5001..f67ad3c31c35 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -112,6 +112,7 @@ struct rockchip_pcie {
>   	unsigned int clk_cnt;
>   	struct reset_control *rst;
>   	struct gpio_desc *rst_gpio;
> +	struct regulator *vpcie3v3;
>   	struct irq_domain *irq_domain;
>   	const struct rockchip_pcie_of_data *data;
>   	bool supports_clkreq;
> @@ -844,15 +845,22 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	/* DON'T MOVE ME: must be enable before PHY init */
> -	ret = devm_regulator_get_enable_optional(dev, "vpcie3v3");
> -	if (ret < 0 && ret != -ENODEV)
> -		return dev_err_probe(dev, ret,
> -				     "failed to enable vpcie3v3 regulator\n");
> +	rockchip->vpcie3v3 = devm_regulator_get_optional(dev, "vpcie3v3");
> +	if (IS_ERR(rockchip->vpcie3v3)) {
> +		if (PTR_ERR(rockchip->vpcie3v3) != -ENODEV)
> +			return dev_err_probe(dev, PTR_ERR(rockchip->vpcie3v3),
> +					"failed to get vpcie3v3 regulator\n");
> +		rockchip->vpcie3v3 = NULL;
> +	} else {
> +		ret = regulator_enable(rockchip->vpcie3v3);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable vpcie3v3 regulator\n");
> +	}
>   
>   	ret = rockchip_pcie_phy_init(rockchip);
>   	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to initialize the phy\n");
> +		goto disable_regulator;
>   
>   	ret = reset_control_deassert(rockchip->rst);
>   	if (ret)
> @@ -885,6 +893,9 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>   deinit_phy:
>   	rockchip_pcie_phy_deinit(rockchip);
> +disable_regulator:
> +	if (rockchip->vpcie3v3)
> +		regulator_disable(rockchip->vpcie3v3);
>   
>   	return ret;
>   }
> 


