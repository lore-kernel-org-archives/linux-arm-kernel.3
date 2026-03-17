Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4209FB5E8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DY0ZdZOWN3ERO3L5dX403mCw02rI92FKq9Fe2IdNFik=; b=LI3IdfeAQY1AiD4fABAS96PNLH
	GQL/rcWqv2QSx+wJ1gDBHvFgnth5oUCiQdJOl8rgnRSu3014tnCFs8V4eoQBWwmBfA7hBa8OyQh4v
	X4u5Atx6/R7zqMfCtqluVFKeBjIr6RfORxLMTyEfc7KnFOA9kp2Lv9mErKFdcESR8Pjvy6cmePc8i
	3sFO4288NIW3WncrmaBkgkbyUW7cCauG/B/v+qfFGuqM1QJSXVPQ2FO3BBdy7iG+Q2FIevAKlgHpI
	oV1uQ43deWzKwGky+4224TPt5pN9McHJIy6kbvFCxUTMgvQgz/7UamKoSMT//RMLCQfyIS7/KKwD5
	tI3ToK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Iag-000000059Uh-14x4;
	Tue, 17 Mar 2026 00:47:22 +0000
Received: from mail-m8394.xmail.ntesmail.com ([156.224.83.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Iac-000000059UE-2PKs;
	Tue, 17 Mar 2026 00:47:20 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 372d756a9;
	Tue, 17 Mar 2026 08:47:12 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH RFC v5 8/8] PCI: dw-rockchip: port some suspend code from
 vendor kernel
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
 <20260316-rockchip-pcie-system-suspend-v5-8-5bb5ad37d643@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <924c1f61-ec19-0585-f9a4-0cab302b7755@rock-chips.com>
Date: Tue, 17 Mar 2026 08:47:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20260316-rockchip-pcie-system-suspend-v5-8-5bb5ad37d643@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cf942d5d009cckunm6be285ec4098d2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgfH1ZOSB8fTx8fGkhPHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TwGyGPzme76z7TYhyXkptwUBxigW7rLjR+/rKAcwAQjXOkiLW9ws+3aFaSGHPddviEbcuuRkmsNZSF8BaqzVuycuKLENizCISGOMPlUr2bPwB4EcWR0bn6h22Y/9+w+I/3MJddSWpFw9bVa4neQKaHk7QvbtOeyYd8U9gcUnjcQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DY0ZdZOWN3ERO3L5dX403mCw02rI92FKq9Fe2IdNFik=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_174719_196183_8FFBC611 
X-CRM114-Status: GOOD (  21.77  )
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

Hi Sebastian,

在 2026/03/17 星期二 3:10, Sebastian Reichel 写道:
> Rockchip's vendor kernel does these calls before starting the actual
> process of going into L2 state. I'm not sure about the rationale,
> hopefully Shawn can help out with that.
> 
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3be83feccecb..fbdde82c95b6 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -74,6 +74,9 @@
>   #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
>   #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
>   
> +/* General Debug Register */
> +#define PCIE_CLIENT_GENERAL_DEBUG	0x104
> +
>   /* RASDES TBA information */
>   #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
>   #define  PCIE_CLIENT_CDM_RASDES_TBA_L1_1	BIT(4)
> @@ -776,6 +779,11 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> +static inline void rockchip_pcie_link_status_clear(struct rockchip_pcie *rockchip)
> +{
> +	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_GENERAL_DEBUG, 0x0);
> +}
> +


Thanks for the patches.

It is intended to clear the debug buffer before entering the L2 state.
This ensures that when the link re-establishes after resume, the debug
registers contain cleaner information, making it easier to diagnose any
link training issues that may occur during the reconnection process.

That said, this operation is not strictly necessary from a functional
standpoint. The PCIe controller will work correctly without it. This was
primarily a request from downstream folks to have cleaner debug
information during bring-up and troubleshooting phases.

>   static int rockchip_pcie_suspend(struct device *dev)
>   {
>   	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> @@ -789,6 +797,11 @@ static int rockchip_pcie_suspend(struct device *dev)
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

