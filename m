Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D5C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oy6H8lueAeqMs8djnjAqPYI7ZqjdcUMC2b/zRPRWG8k=; b=3NEpZ7WE/67NgiYeUT7C54OXAL
	t+l/o74sNT1iZLY49Wp0f23zsP9A+q/2mMghKtH/4csKuF1KdHduLVlRujOTrA57LRwvk6QdkCB8P
	lNIQPKFhNtOFnknDOg5mCj1DAWjzwk4ewvCFeb7Q8732lWdO/eOkr2Fknmczq5DJQN+O65MK2VC51
	NwMIbUvGowra7ITlELZgdJSbWuZifK2VLQjYYwhiOTyN/DtWdUE2Rz7jvLLzU7vctBlom7gear344
	PpLhFOCmAxyP/6ATlu5xASI5CXj2aHpPbsVzykFoC7zn0fdvu95UByUPhw66Z+wrq057a9lBt3ECe
	j82B3Kqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46eQ-0000000AZQX-0uV2;
	Wed, 09 Sep 2026 00:58:58 +0000
Received: from mail-m9391.xmail.ntesmail.com ([103.126.93.91])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46eO-0000000AZPf-0Apu;
	Wed, 09 Sep 2026 00:58:57 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d0923156;
	Wed, 9 Sep 2026 08:58:50 +0800 (GMT+08:00)
Message-ID: <30d56a27-febb-48e8-909e-b87cad782514@rock-chips.com>
Date: Wed, 9 Sep 2026 08:58:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 06/10] PCI: dw-rockchip: Add helper function for DDL
 indicator
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
 <20260908-rockchip-pcie-system-suspend-v6-6-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-6-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083acbac003a4kunmccc4e748440649
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGU1ITFYeGU8YGUkYSR
	0YTEtWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=D5qtsHD+yE9+RhcFUcRNxx9x9OPX0uCGrqLL6K0SPt3qcRxRp/MwneUjdBzakPLQiOqngJQCdQpKLR6zjnHM3bhTLjOHvN8HBQ6ccJ9liFJHTcN3yHA0GeMi2+T5/dKzs0qx3ubQTfQaRd2braoFZ5BnxWJ3vGXHWxkSuHnMBMU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=oy6H8lueAeqMs8djnjAqPYI7ZqjdcUMC2b/zRPRWG8k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_175856_302682_2B90F3EF 
X-CRM114-Status: GOOD (  17.66  )
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
> Remove code duplication and improve readability by introducing a new
> function to setup the DLL indicator.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 211776bbcb99..1e48099e36e4 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -713,6 +713,16 @@ static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u3
>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
>   }
>   
> +static void rockchip_pcie_unmask_dll_indicator(struct rockchip_pcie *rockchip)
> +{
> +	u32 val;
> +
> +	/* unmask DLL up/down indicator and hot reset/link-down reset */
> +	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
> +	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> +}
> +
>   static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   				      struct rockchip_pcie *rockchip)
>   {
> @@ -760,7 +770,6 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>   {
>   	struct device *dev = &pdev->dev;
>   	int irq, ret;
> -	u32 val;
>   
>   	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_EP))
>   		return -ENODEV;
> @@ -800,10 +809,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>   
>   	pci_epc_init_notify(rockchip->pci.ep.epc);
>   
> -	/* unmask DLL up/down indicator and hot reset/link-down reset */
> -	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
> -	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
> -	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
> +	rockchip_pcie_unmask_dll_indicator(rockchip);
>   
>   	return ret;
>   }
> 


