Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E47ACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN3t/e7sa1Sb2IowRbuDgju83rFZL2AXB/0qfNEujok=; b=cfgvggS0vx4lrDrQod41oJfyDe
	V/B74gacjxCR7fpL6eLXaPYci1cwpyXvzVJ8k9Ich/jRa6aYa5dRJ0C+JCouyB5bloJeDAaJD1sX2
	/jeDcjWUP4sIam9npD6jy9uyx3ElOsbhVg+fEZi7auBEzULz0sPdwHpdgA1kOV0MF4/jYxh6pCzGZ
	LibsnkCQvso9rasvXoFCEet3V2Ok1yYrNNhA4NxrQ2PBaZryBUkTqkkghXx3N6rN+uf2snd2PDbXb
	WyJqsgxaGva7rDknfiobRITnl3sRzIf/qmj9Fawlgj/VtqFcG8zkmaLLUCpXEcDLYt7CkIakFIc6N
	NRFmr7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Krf-00000004K4O-0a06;
	Thu, 16 Oct 2025 10:05:43 +0000
Received: from mail-m49236.qiye.163.com ([45.254.49.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kra-00000004K1w-46i0;
	Thu, 16 Oct 2025 10:05:40 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 262323a9f;
	Thu, 16 Oct 2025 18:00:28 +0800 (GMT+08:00)
Message-ID: <3470351f-88ab-48bb-97af-dde4e6eba938@rock-chips.com>
Date: Thu, 16 Oct 2025 18:00:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Damien Le Moal <dlemoal@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Disable L1 substates
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>
References: <20251016090422.451982-2-cassel@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251016090422.451982-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ec76ba4d09cckunmc3027d237c39a4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNKTlZJT0hPSE4ZHx9IQ0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Dkg1ccWxhcEzQTOcTY7bf6wuAXYywd+hMTvRqDxRE1vMLe89yV6Etd0r4HtjD7Lib8ucQ/xO9ILeS0kR9IRcb4AfFbQ7Zq1l5oLWraylks88KcjFaIB10gPecPxyug1hiVMXiTxry8XoDnCwbI/lCmmSFioxp53oLomGc7999KY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kN3t/e7sa1Sb2IowRbuDgju83rFZL2AXB/0qfNEujok=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_030539_526300_F9BB544D 
X-CRM114-Status: GOOD (  20.73  )
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

在 2025/10/16 星期四 17:04, Niklas Cassel 写道:
> The L1 substates support requires additional steps to work, see e.g.
> section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0.
> 
> These steps are currently missing from the driver.

Yes, we could add them later if concerns about supports-clkreq is fully
discussed.

> 
> While this has always been a problem when using e.g.
> CONFIG_PCIEASPM_POWER_SUPERSAVE=y, the problem became more apparent after
> commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for
> devicetree platforms"), which enabled ASPM also for
> CONFIG_PCIEASPM_DEFAULT=y.
> 
> Disable L1 substates until proper support is added.
> 

Thanks for the patch.

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

> Cc: stable@vger.kernel.org
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v1:
> -Remove superfluous dw_pcie_readl_dbi()
> 
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3e2752c7dd09..84f882abbca5 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -200,6 +200,25 @@ static bool rockchip_pcie_link_up(struct dw_pcie *pci)
>   	return FIELD_GET(PCIE_LINKUP_MASK, val) == PCIE_LINKUP;
>   }
>   
> +/*
> + * See e.g. section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0 for the steps
> + * needed to support L1 substates. Currently, not a single rockchip platform
> + * performs these steps, so disable L1 substates until there is proper support.
> + */
> +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> +{
> +	u32 cap, l1subcap;
> +
> +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (cap) {
> +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> +			      PCI_L1SS_CAP_PCIPM_L1_2);
> +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
> +	}
> +}
> +
>   static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
>   {
>   	u32 cap, lnkcap;
> @@ -264,6 +283,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>   	irq_set_chained_handler_and_data(irq, rockchip_pcie_intx_handler,
>   					 rockchip);
>   
> +	rockchip_pcie_disable_l1sub(pci);
>   	rockchip_pcie_enable_l0s(pci);
>   
>   	return 0;
> @@ -301,6 +321,7 @@ static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>   	enum pci_barno bar;
>   
> +	rockchip_pcie_disable_l1sub(pci);
>   	rockchip_pcie_enable_l0s(pci);
>   	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
>   


