Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6739BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 01:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8O3sEMbdttlkjB7YR4EWG8ZoEn7yeFuuCH+g88V++TQ=; b=a/QNrCXiIGqPODB7D2gf/yORdA
	60EuJzAV3ST8oTWohy93iKepMl2NC8EOa5p7BL8YrypcsbK0mv0D6etHPg5MFOFT8QOCdqHa+lJOu
	9DrWmfhXPf5vfhfZTbK528NiPlRUtnB2Bd8HofEzxCS2UtX03J0cpdaaZ9W9HNcsRHeIBzZp37Cfx
	JK07HjXioZPfRY/Uhe1sG8CVBO6MFCNjliCkHRdSDUgCB44uTmYuGl1Jq/i8wDXKjo0b/un1O40DP
	Yq76qS//Ge/UfXBkrT3O+68WOGeD/0cUY5t57/3MHissIZZTPLYIZ/OyMzTOhaYcWaDljiwLWbpjt
	a8140LNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46mW-0000000AZnm-23y5;
	Wed, 09 Sep 2026 01:07:20 +0000
Received: from mail-m16023653212.xmail.ntesmail.com ([160.236.53.212])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46mS-0000000AZnB-0Zj2;
	Wed, 09 Sep 2026 01:07:18 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d098a741;
	Wed, 9 Sep 2026 09:07:11 +0800 (GMT+08:00)
Message-ID: <5e4f9b07-f11b-4d52-b1d4-3b680b457eb3@rock-chips.com>
Date: Wed, 9 Sep 2026 09:07:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 07/10] PCI: dw-rockchip: Add pme_turn_off support
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
 <20260908-rockchip-pcie-system-suspend-v6-7-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-7-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083b45eab03a4kunma4967f8f441eaa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQh9LSVZJTE5LHxgaTk
	5DQkxWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BPSKVn6h6LN29eN2GrvbN/1+zF4JRqE/CggubnWskTRYkjICKOsaiYGhd489E3P5YTXfIGIdIFXhk0ak0Pzfs+tVgHPiVJVCqwo6hIP5KE7e/rA4Cj5arkRjcoz4e+MM0s1H1MwPxVBp9b3zolVMrF7Q/27lgrCu4HTuAS1rFjI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=8O3sEMbdttlkjB7YR4EWG8ZoEn7yeFuuCH+g88V++TQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_180716_754459_FC27BAC4 
X-CRM114-Status: GOOD (  19.83  )
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
> Prepare Rockchip PCIe controller for system suspend support by
> adding the PME turn off operation.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 44 +++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 1e48099e36e4..17530507e41b 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -45,6 +45,7 @@
>   #define  PCIE_CLIENT_LD_RQ_RST_GRT	FIELD_PREP_WM16(BIT(3), 1)
>   #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
>   #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
> +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
>   
>   /* Interrupt Status Register Related to Legacy Interrupt */
>   #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> @@ -64,6 +65,11 @@
>   
>   /* Interrupt Mask Register Related to Miscellaneous Operation */
>   #define PCIE_CLIENT_INTR_MASK_MISC	0x24
> +#define PCIE_CLIENT_POWER		0x2c
> +#define PCIE_CLIENT_MSG_GEN		0x34
> +#define PME_READY_ENTER_L23		BIT(3)
> +#define PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
> +#define PME_TO_ACK			FIELD_PREP_WM16(BIT(9), 1)
>   
>   /* Power Management Control Register */
>   #define PCIE_CLIENT_POWER_CON		0x2c
> @@ -452,8 +458,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>   	return 0;
>   }
>   
> +static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> +	struct device *dev = rockchip->pci.dev;
> +	u32 status;
> +	int ret;
> +
> +	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
> +	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
> +				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(dev, "Failed to send PME_Turn_Off\n");
> +		return;
> +	}
> +
> +	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
> +				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
> +		return;
> +	}
> +
> +	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
> +	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER,
> +				 status, status & PME_READY_ENTER_L23,
> +				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret)
> +		dev_err(dev, "Failed to get ready to enter L23 message\n");
> +}
> +
>   static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
>   	.init = rockchip_pcie_host_init,
> +	.pme_turn_off = rockchip_pcie_pme_turn_off,
>   };
>   
>   /*
> 


