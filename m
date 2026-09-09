Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB77C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsT5whRXIWPhoZ883AZa0XgzOkBvLWYJ556g8quXo00=; b=BNYpLdSIvj8QRslu/5OAOkLBTF
	ZEEuk9qzkZ5s4EKulDh5x1mLiDwTKfOqSjU0CohdNigFa+NdPYFsU95dg4OYEXyJGCoQjIi0ydt5L
	OJXHmnVLakUl1cLHWdFmfhX4UfNOHzqD5dGC9/KA2edCWJykeJLV/Tphm9ZNuco2unClG8j4qZIMv
	BK9NU3coP1URFngHHf3kg12WUoeE20IR30wIYVUgQrShSpCgc1QRpED2v0RomBQxnSE1VfZxTI0xe
	A6jLjpwmBGczMAPz2MAV/uWos+XCsPMEOcaM3GARUqQMzp1E6FgQ1b2RxSMv5vBSJxxeZV+2zYEKK
	EDhARg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46dc-0000000AZFE-3ngB;
	Wed, 09 Sep 2026 00:58:08 +0000
Received: from mail-m17223.xmail.ntesmail.com ([45.195.17.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46da-0000000AZEf-0jfo;
	Wed, 09 Sep 2026 00:58:07 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d0923065;
	Wed, 9 Sep 2026 08:58:02 +0800 (GMT+08:00)
Message-ID: <d3a665e6-e9f6-41c7-9684-9db1cb811039@rock-chips.com>
Date: Wed, 9 Sep 2026 08:58:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 05/10] PCI: dw-rockchip: Add helper function for
 controller mode
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
 <20260908-rockchip-pcie-system-suspend-v6-5-fbabcca9921b@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-5-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083abfd6103a4kunm2a53221b44044d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUsaQ1ZOHkkaHRpKTx
	lDTUpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XP6iTy/dSQmg7/bZJLR97rvOuhsfxw6x8i0uhjmb2gdTTOdgfWlxIeApYFv0KpIJqWYYHez9/FNcaTS292GFeo4cwZc6yAYNx07JiqMAmK/Yat8cqoPIhoBX7W+sDWd7FW/mrLb31KcbQoQJJiWxyLlSQl/jTlGJoGRG/PQJK8g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bsT5whRXIWPhoZ883AZa0XgzOkBvLWYJ556g8quXo00=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_175806_433935_6008980A 
X-CRM114-Status: GOOD (  15.01  )
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
> function to setup the controller mode.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 6f84b07406d4..211776bbcb99 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -708,6 +708,11 @@ static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pci
>   	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>   }
>   
> +static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u32 mode)
> +{
> +	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
> +}
> +
>   static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   				      struct rockchip_pcie *rockchip)
>   {
> @@ -732,10 +737,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>   	}
>   
>   	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
> -
> -	rockchip_pcie_writel_apb(rockchip,
> -				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
> -				 PCIE_CLIENT_GENERAL_CON);
> +	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
>   
>   	pp = &rockchip->pci.pp;
>   	pp->ops = &rockchip_pcie_host_ops;
> @@ -776,10 +778,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>   	}
>   
>   	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
> -
> -	rockchip_pcie_writel_apb(rockchip,
> -				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
> -				 PCIE_CLIENT_GENERAL_CON);
> +	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_EP);
>   
>   	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
>   	rockchip->pci.ep.page_size = SZ_64K;
> 


