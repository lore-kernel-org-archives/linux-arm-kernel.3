Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F7C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 01:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXrG2bOu/f4zoy6afuZMtxAka40yrLWjvBxcUj894m8=; b=2Z3ZcMK+o/B9Imcvc8k+XmEujC
	naHxlQkOcF6qFQSwf4B1RZ+On9kCeiac7UFePW1d22jbaqvLt488EqGmNEIGjjgy5UzdPv6VFB2Lh
	uYA5ln6N8a+g/hSDUKCk3fKZw5nl9SH6Dia+dYfDyeX4+LXcupA30V+uM94H08BTvgjLz4mLwUZK5
	lKePdE30FCKnXw+WKFOPx7MnBcAiIt/tjeJeUz03B9vqpirTWesXU4rYMVFz/+6UYHPGXSTIH6abg
	2DcNpx77w/rtkAqkwtKL2h34+azQILviyliqmeVUxFb7mBzVdjNq10prV/3ptSFjVMuLWlk5K+RYo
	3VlD9RQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46tI-0000000AaPC-29Mq;
	Wed, 09 Sep 2026 01:14:20 +0000
Received: from mail-m9366.xmail.ntesmail.com ([103.126.93.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46tF-0000000AaOA-1wsS;
	Wed, 09 Sep 2026 01:14:19 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d09c3d85;
	Wed, 9 Sep 2026 09:14:13 +0800 (GMT+08:00)
Message-ID: <8c2dd6a7-d733-4d78-9b92-c7e4c7e6b7d8@rock-chips.com>
Date: Wed, 9 Sep 2026 09:14:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 10/10] PCI: dw-rockchip: Clear debug buffer before
 entering L2
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
 <20260908-rockchip-pcie-system-suspend-v6-10-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-10-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083bacfc303a4kunm71968669442fc6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUNKH1ZMTx0aGkoZSE
	1OQklWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XLw0Z5PjC40FLlLjEeuPsxjJH3DNpHn6kqQucBi89rQtQ8GMBSnyGCS+lCxIbo2P2qivwbPYZlABvOGQrBf82i3IwcXCABKIgffePviEmryW6oO28rIG3M4VeRzHFsA3wxL/eBxr+z3nGQf3BWcNsbOPpN5p8bCy37YLmRlBboI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nXrG2bOu/f4zoy6afuZMtxAka40yrLWjvBxcUj894m8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_181417_745184_2DFAFDAD 
X-CRM114-Status: GOOD (  16.01  )
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
> Clear the debug buffer before entering the L2 state to ease debugging
> link training issues on resume.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index e675918ba184..a508f4fffd2a 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -77,6 +77,9 @@
>   #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
>   #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
>   
> +/* General Debug Register */
> +#define PCIE_CLIENT_GENERAL_DEBUG	0x104
> +
>   /* RASDES TBA information */
>   #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
>   #define  PCIE_CLIENT_CDM_RASDES_TBA_L1_1	BIT(4)
> @@ -1043,6 +1046,11 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
>   	return ret;
>   }
>   
> +static inline void rockchip_pcie_link_status_clear(struct rockchip_pcie *rockchip)
> +{
> +	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_GENERAL_DEBUG, 0x0);
> +}
> +
>   static int rockchip_pcie_suspend(struct device *dev)
>   {
>   	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> @@ -1056,6 +1064,11 @@ static int rockchip_pcie_suspend(struct device *dev)
>   
>   	rockchip->intx = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_MASK_LEGACY);
>   
> +	/* All sub-devices are in D3hot by PCIe stack */
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	rockchip_pcie_link_status_clear(rockchip);
> +
>   	ret = dw_pcie_suspend_noirq(pci);
>   	if (ret)
>   		return ret;
> 


