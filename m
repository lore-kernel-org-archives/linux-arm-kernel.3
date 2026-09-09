Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7ECC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQ3ATaI2YxqRI0p16u8NNlyCH2fphaDSpOTesBL5qj4=; b=4eSVmKU1IMC5gztCdElMDDCwHc
	VYn5Y99IWFIVxL3Na0/fAPx+TOzE94r0jYy0PoVRZ7jVpm3uGwX1r9id024rJEsOwch1Jf6GJfWrz
	uPHb/LFOygFfshzYXZXsgXRS0WMVsoYu9tBRQ7wcHJ1C9fr0LEFDGNeR/Mubch6WHp+2l3FXg/GRo
	ohQRXwnt3tYxRzmx9lAPEYKbFIXcW8Lx8XAynTNCQfYwcFn2JDra00czY+NqZOyYSzrgMdrSZRneJ
	tG+M7crlETMs6NSh8HmEaGyBpGFvzLaiaGCUNg0M3csslvbJIt02Vl6SrCUSsTLyW3FuUG5+eHX/j
	dfL+7ZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46P9-0000000AWlY-3ba7;
	Wed, 09 Sep 2026 00:43:11 +0000
Received: from mail-m49227.qiye.163.com ([45.254.49.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46P6-0000000AWkm-0ucc;
	Wed, 09 Sep 2026 00:43:10 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d089fcf7;
	Wed, 9 Sep 2026 08:37:53 +0800 (GMT+08:00)
Message-ID: <d2f5d998-5d1d-4246-8b01-01382f3cffd2@rock-chips.com>
Date: Wed, 9 Sep 2026 08:37:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 01/10] PCI: dw-rockchip: Fix LTSSM set functions
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
 <20260908-rockchip-pcie-system-suspend-v6-1-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-1-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083998c7203a4kunm31a3c89943d92d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0wZQlZIHUwaTxhDSx
	lIGRpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FGKdjvlACFPFgsNMYwEWJ6Y0jyF+FQ1TkoCbAKv3eLPEGrvVpZi4emplWQEmmUl4oVm0DEYa7F1Ptp4wfYpeE1As8d3px66nQfcCioYZ60nHwL1YzhCRzCyUwvRJPcB1fLuUMjKckLwFRZt4El6BGu7ZvmUnpVxjQy3tgZ7FMa4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jQ3ATaI2YxqRI0p16u8NNlyCH2fphaDSpOTesBL5qj4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_174308_808895_C46E2325 
X-CRM114-Status: GOOD (  16.15  )
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
> Before the Rockchip PCIe driver has been switched over to the
> FIELD_PREP_WM16 macro, PCIE_CLIENT_ENABLE_LTSSM and
> PCIE_CLIENT_DISABLE_LTSSM were setting bits with a mask of 0xc = 0b1100,
> which means BIT 2 and BIT 3. After the conversion it only sets bit 2,
> with bit 3 being handled by a separate define named
> PCIE_CLIENT_LD_RQ_RST_GRT. Apparently the conversion missed to make use
> of this new macros resulting in the third bit not being set.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Fixes: 30e919570581 ("PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index af26a07c0c9e..dc85564e5001 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -321,14 +321,16 @@ static void rockchip_pcie_ltssm_trace(struct rockchip_pcie *rockchip,
>   
>   static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
>   {
> -	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CON);
> +	u32 val = PCIE_CLIENT_ENABLE_LTSSM | PCIE_CLIENT_LD_RQ_RST_GRT;
> +
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_GENERAL_CON);
>   }
>   
>   static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
>   {
> -	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_DISABLE_LTSSM,
> -				 PCIE_CLIENT_GENERAL_CON);
> +	u32 val = PCIE_CLIENT_DISABLE_LTSSM | PCIE_CLIENT_LD_RQ_RST_GRT;
> +
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_GENERAL_CON);
>   }
>   
>   static bool rockchip_pcie_link_up(struct dw_pcie *pci)
> 


