Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA8AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPL25zB+175xW+b9ln85IKNsB2hgoRLnH6maFPW5Ixw=; b=sklwFqM8Ld7I9r7LAN5MDSnbmP
	06P5HG+zO+dyEDGog6bi7E92NSM7XxHRRnrP+WkN4dwx4UrdS7DteOSsMLjeWUXcNVi56wa3vZ+dy
	FV9p6RneepndSnNiouvLW7TO2Ap53LLctibkND7XB0XLBWk44q7NsOcjy9cQrXhAglR5lr/jn8kjH
	wU+eJ05w7uKCXIt4CF0WGorvuI4f2ApIX+wyolboPTCRpIw2/UOIX3a6pkUX6XhVK+XaKkm1uximf
	q+wAAtb0XQnGr4GcS0qSjwQXzVkBX8udsiJp1hyS3dln2aj/tTUaYSMgKu46Pcfo7xopaamvUtei5
	ixNmpxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46aE-0000000AYeB-1djc;
	Wed, 09 Sep 2026 00:54:40 +0000
Received: from mail-m1602365262.xmail.ntesmail.com ([160.236.52.62])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46aA-0000000AYcT-2SK8;
	Wed, 09 Sep 2026 00:54:36 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d0905848;
	Wed, 9 Sep 2026 08:54:29 +0800 (GMT+08:00)
Message-ID: <26006eef-56b3-4a81-8b4c-95ac241412cb@rock-chips.com>
Date: Wed, 9 Sep 2026 08:54:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 03/10] PCI: dw-rockchip: Move devm_phy_get out of
 phy_init
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
 <20260908-rockchip-pcie-system-suspend-v6-3-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-3-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083a8bf7103a4kunm4244ed5d43fc53
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSh1MVkNJQk4dTBhCSE0eS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KmXB2npbkEt7CZvkKJcT5M6qDw2i7cCdkaVp4hQw6JqugrzoiXbkmlVDz1fpqHrq3/Lo0GHHseH/PffkVdv699JZxxH+IB2ye2sZz/Gt7NfojO4bRGNoof0/1zQqTd1okvCihaUf7Kr5vLnWxfyoprykKBpqbKY0Qj67vVCiSd8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=RPL25zB+175xW+b9ln85IKNsB2hgoRLnH6maFPW5Ixw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_175435_210054_45ADDDA1 
X-CRM114-Status: GOOD (  17.73  )
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
> By moving devm_phy_get() to the probe routine, rockchip_pcie_phy_init()
> can be used to re-initialize the PCIe PHY, which is for example needed
> after a system suspend/resume cycle.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index f67ad3c31c35..7472ec78b473 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -612,14 +612,8 @@ static int rockchip_pcie_resource_get(struct platform_device *pdev,
>   
>   static int rockchip_pcie_phy_init(struct rockchip_pcie *rockchip)
>   {
> -	struct device *dev = rockchip->pci.dev;
>   	int ret;
>   
> -	rockchip->phy = devm_phy_get(dev, "pcie-phy");
> -	if (IS_ERR(rockchip->phy))
> -		return dev_err_probe(dev, PTR_ERR(rockchip->phy),
> -				     "missing PHY\n");
> -
>   	ret = phy_init(rockchip->phy);
>   	if (ret < 0)
>   		return ret;
> @@ -858,6 +852,13 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   					     "failed to enable vpcie3v3 regulator\n");
>   	}
>   
> +	rockchip->phy = devm_phy_get(dev, "pcie-phy");
> +	if (IS_ERR(rockchip->phy)) {
> +		ret = PTR_ERR(rockchip->phy);
> +		dev_err_probe(dev, ret, "missing PHY\n");
> +		goto disable_regulator;
> +	}
> +
>   	ret = rockchip_pcie_phy_init(rockchip);
>   	if (ret)
>   		goto disable_regulator;
> 


