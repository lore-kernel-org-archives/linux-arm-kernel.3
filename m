Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADDBCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/01EZ5lMl59YI++li6XSVu0o5BZOK5sa3DWde3cS9iY=; b=ab0uNBtygzTN78pj+mvi7/wZY1
	f3p5b89k9DpGn58IHLxhN/8riNJZerAESYB43fsZaJfuglAAjOnD3idnQ8ydGL50I8cc7SaCIClMQ
	4kQg+oXavvHRQ7NBYNBHfd4dcIGbnFSf7Com/85iL5zP5eHXXG9qFJeYQ8y/r6MKNef/nGff0r+fg
	tL9n5Z2Q4NEWL2+LYM/7M0HRwwCc1/M0iYlPvnGsYLde+y5dlB+VralfW7lehsrk4dp1j0GOz4YCp
	OEG/zPK6c6E75x05NDX8tZIzEA3jADrG8vGuC3pAmwpgQ/dOZhaeSQ4mctxaJkYqjJZKQa2O+P7PD
	1i5TJGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXXb-0000000Eyt4-3Fsz;
	Tue, 28 Oct 2025 00:26:23 +0000
Received: from mail-m83160.xmail.ntesmail.com ([156.224.83.160])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXXX-0000000EysK-19RZ;
	Tue, 28 Oct 2025 00:26:21 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27641a992;
	Tue, 28 Oct 2025 08:26:08 +0800 (GMT+08:00)
Message-ID: <4fe0ccf9-8866-443a-8083-4a2af7035ee6@rock-chips.com>
Date: Tue, 28 Oct 2025 08:26:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource
 cleanup
To: Anand Moon <linux.amoon@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251027145602.199154-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a28353b1709cckunm5714e79495b73
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtDHlZMT0tJSU9CSEsfGhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MVjyAjJLoKqFruf/2T8UTkdFxaaY1HLRIzik5UoO+bPgLPabD6cwVDYphWLLcTcg1zKklhAqtFdqx48TtcbK1a9MXPQuuoR0mM0N1HHZSJmd+0x7IsDhaokWGwjR3VlWLoquao1g1pe6uM8UlxJDqOxLD2g9W84vG9UdDLDdHic=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/01EZ5lMl59YI++li6XSVu0o5BZOK5sa3DWde3cS9iY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_172619_966067_FC1279C9 
X-CRM114-Status: GOOD (  20.68  )
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

在 2025/10/27 星期一 22:55, Anand Moon 写道:
> Introduce a .remove() callback to the Rockchip DesignWare PCIe
> controller driver to ensure proper resource deinitialization during
> device removal. This includes disabling clocks and deinitializing the
> PCIe PHY.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 87dd2dd188b4..b878ae8e2b3e 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> +static void rockchip_pcie_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> +
> +	/* Perform other cleanups as necessary */
> +	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> +	rockchip_pcie_phy_deinit(rockchip);
> +}

Thanks for the patch.

Dou you need to call dw_pcie_host_deinit()?
And I think you should also try to mask PCIE_CLIENT_INTR_MASK_MISC and
remove the irq domain as well.

if (rockchip->irq_domain) {
	int virq, j;
	for (j = 0; j < PCI_NUM_INTX; j++) {
		virq = irq_find_mapping(rockchip->irq_domain, j);
		if (virq > 0)
			irq_dispose_mapping(virq);
         }
	irq_set_chained_handler_and_data(rockchip->irq, NULL, NULL);
	irq_domain_remove(rockchip->irq_domain);
}

Another thin I noticed is should we call pm_runtime_* here for hope that
genpd could be powered donw once removed?


> +
>   static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
>   	.mode = DW_PCIE_RC_TYPE,
>   };
> @@ -754,5 +764,6 @@ static struct platform_driver rockchip_pcie_driver = {
>   		.suppress_bind_attrs = true,
>   	},
>   	.probe = rockchip_pcie_probe,
> +	.remove = rockchip_pcie_remove,
>   };
>   builtin_platform_driver(rockchip_pcie_driver);


