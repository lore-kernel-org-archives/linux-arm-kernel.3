Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251B8C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MYZRtAVw85vCznj5/QFIWvq8+/sZ52tn4n6V859Sc4=; b=0KFS+IScUxnysAKqGbKWlUD561
	QJWtMcEqgzPjNiLM0O4chHKJLbg3CJ50VjbkeP544ad/DrJ7L4DwAcvJlln105ckHLuBVXLUDr8YW
	ULDfLAOb0brWEmiTJfeYHWSYirXXc0Txt2K6sDZjSWruFXiCuhkK3jbjQlQCbBUPL8ctCBdq/dRkT
	ZPj05X8x/5RCgEH4jpUZFeqaq0YNjeeaucNhQNVIlj1xSNUtrYvEGe3eXaWjn7Q6xILSjrRhJpspZ
	Oub+n6Y/fr+pXjfDd2Jja9klKht6KaryIYWMTXLzb5ml6gXl6RLbED+8vArLqkQHHlA489o+O/k3i
	+uV3/grg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46cS-0000000AZ1F-2Xnp;
	Wed, 09 Sep 2026 00:56:56 +0000
Received: from mail-m81153.xmail.ntesmail.com ([156.224.81.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46cM-0000000AZ05-0EUg;
	Wed, 09 Sep 2026 00:56:54 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d0922f42;
	Wed, 9 Sep 2026 08:56:45 +0800 (GMT+08:00)
Message-ID: <f26552c9-0950-4206-8d39-b615e3737651@rock-chips.com>
Date: Wed, 9 Sep 2026 08:56:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 04/10] PCI: dw-rockchip: Add helper function for
 enhanced LTSSM control mode
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
 <20260908-rockchip-pcie-system-suspend-v6-4-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-4-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083aad1c203a4kunm88587246440179
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGkhJGlYfHh4aTk9KHR
	pJQk1WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=M85xuT2JXX3DURsJ++iD9e9zee9YmU6/UQ/FVBMxz6V/w1u5rksNrh9mykBTETEjSIMOoPHrMaRbvXqsDmjzKzaYQeIXyCT9Nv/6OvTBPVkWib9HHNbW/eRMhpG//5nsZt2obyb/gGPfRX8AFyEG4JdqlOqZIV+QCTDB/TdGEBc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7MYZRtAVw85vCznj5/QFIWvq8+/sZ52tn4n6V859Sc4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_175650_378621_8C3B8A7F 
X-CRM114-Status: GOOD (  17.39  )
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
> function to setup the enhanced LTSSM mode.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 7472ec78b473..6f84b07406d4 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -696,6 +696,18 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>   	return IRQ_HANDLED;
>   }
>   
> +static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pcie *rockchip,
> +							     u32 flags)
> +{
> +	u32 val;
> +
> +	/* Enable the enhanced control mode of signal app_ltssm_enable */
> +	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
> +	if (flags)
> +		val |= FIELD_PREP_WM16(flags, 1);
> +	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
> +}
> +
>   static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   				      struct rockchip_pcie *rockchip)
>   {
> @@ -719,9 +731,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   		return ret;
>   	}
>   
> -	/* LTSSM enable control mode */
> -	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
> -	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
> +	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
>   
>   	rockchip_pcie_writel_apb(rockchip,
>   				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
> @@ -765,13 +775,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>   		return ret;
>   	}
>   
> -	/*
> -	 * LTSSM enable control mode, and automatically delay link training on
> -	 * hot reset/link-down reset.
> -	 */
> -	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1) |
> -	      FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
> -	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
> +	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
>   
>   	rockchip_pcie_writel_apb(rockchip,
>   				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
> 


