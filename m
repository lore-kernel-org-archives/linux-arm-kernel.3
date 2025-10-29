Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF5CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXeB1XRi1t4+hav00/PO85fUCGM4DHZek+mbIiPUEtA=; b=GjwRBb2C6O+MhpPLp0f+M7hJSk
	Ay1GRlh7vTh/TYK/XmZhGr4QQ7BObVZqvorbkGkGABx0APh5BfxqKnmaNLCtOMvm1x2lL+TiT+q/v
	r5AeVNK/wssgCxBy7k8IBIFna0izyvvkLBqtgllccmOJAAnQaNz5/dhmT1Z9PCw9VCU3MbRcwjobH
	/+98XBnLgdorXRMSXr56lN528wSf8NWueTUT60LS3MQGaD4+a/Wadu8l6FsQESXk+i+B7r/KI07g4
	21j+dc6wbpjnetrqfbvN6zKv0jT8r9DCc1ozvEgpiqM9AX1DbSEZYGPIG64IYLRCEixLb0mSDwOgR
	nQNOT4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDu37-0000000Grbj-0SlF;
	Wed, 29 Oct 2025 00:28:25 +0000
Received: from mail-m1973177.qiye.163.com ([220.197.31.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDu33-0000000GrbC-3tL5;
	Wed, 29 Oct 2025 00:28:23 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 278abcfb1;
	Wed, 29 Oct 2025 08:28:13 +0800 (GMT+08:00)
Message-ID: <3fcd5562-a367-41e9-8bff-51e5990145e2@rock-chips.com>
Date: Wed, 29 Oct 2025 08:28:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource
 cleanup
To: Anand Moon <linux.amoon@gmail.com>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com>
 <4fe0ccf9-8866-443a-8083-4a2af7035ee6@rock-chips.com>
 <CANAwSgRXcg4tO00SNu77EKdp6Ay6X7+_f-ZoHxgkv1himxdi0Q@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <CANAwSgRXcg4tO00SNu77EKdp6Ay6X7+_f-ZoHxgkv1himxdi0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a2d5d7fa609cckunm42001d6025423a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJKGlYdHRlOTRlIQ0MYQkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=EnhdmNK7UPDdSC1XgqbfxEnNOjTCjGjaaUnxh2iZtaj5IhIedJTIvIhcCv8kSzJCibxayqMndZwLbtjWAa0MSChiyaL9qn1PrpBiqijpLzyLMPj9MTV4tpwSc+SzHZbhlLbls67xsUtwKxdbSWyM9FPC6TLvQ0aYkJ2sb7BHuXI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=VXeB1XRi1t4+hav00/PO85fUCGM4DHZek+mbIiPUEtA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_172822_149320_32685223 
X-CRM114-Status: GOOD (  27.38  )
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


在 2025/10/28 星期二 17:34, Anand Moon 写道:
> Hi Shawn,
> 
> Thanks for your review comments.
> 
> On Tue, 28 Oct 2025 at 05:56, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>
>> 在 2025/10/27 星期一 22:55, Anand Moon 写道:
>>> Introduce a .remove() callback to the Rockchip DesignWare PCIe
>>> controller driver to ensure proper resource deinitialization during
>>> device removal. This includes disabling clocks and deinitializing the
>>> PCIe PHY.
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>>    drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> index 87dd2dd188b4..b878ae8e2b3e 100644
>>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>>> @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>>>        return ret;
>>>    }
>>>
>>> +static void rockchip_pcie_remove(struct platform_device *pdev)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
>>> +
>>> +     /* Perform other cleanups as necessary */
>>> +     clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>>> +     rockchip_pcie_phy_deinit(rockchip);
>>> +}
>>
>> Thanks for the patch.
>>
>> Dou you need to call dw_pcie_host_deinit()?
> I feel the rockchip_pcie_phy_deinit will power off the phy
>> And I think you should also try to mask PCIE_CLIENT_INTR_MASK_MISC and
>> remove the irq domain as well.
>>
>> if (rockchip->irq_domain) {
>>          int virq, j;
>>          for (j = 0; j < PCI_NUM_INTX; j++) {
>>                  virq = irq_find_mapping(rockchip->irq_domain, j);
>>                  if (virq > 0)
>>                          irq_dispose_mapping(virq);
>>           }
>>          irq_set_chained_handler_and_data(rockchip->irq, NULL, NULL);
>>          irq_domain_remove(rockchip->irq_domain);
>> }
>>
> I have implemented resource cleanup in rockchip_pcie_remove,
> which is invoked when the system is shutting down.
> Your feedback on the updated code is welcome.
> 
> static void rockchip_pcie_remove(struct platform_device *pdev)
> {
>          struct device *dev = &pdev->dev;
>          struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
>          int irq;
> 
>          irq = of_irq_get_byname(dev->of_node, "legacy");
>          if (irq < 0)
>                  return;
> 
>          /* Perform other cleanups as necessary */
>          /* clear up INTR staatus register */
>          rockchip_pcie_writel_apb(rockchip, 0xffffffff,
>                                   PCIE_CLIENT_INTR_STATUS_MISC);
>          if (rockchip->irq_domain) {
>                  int virq, j;
>                  for (j = 0; j < PCI_NUM_INTX; j++) {
>                          virq = irq_find_mapping(rockchip->irq_domain, j);
>                          if (virq > 0)
>                                  irq_dispose_mapping(virq);
>                  }
>                  irq_set_chained_handler_and_data(irq, NULL, NULL);
>                  irq_domain_remove(rockchip->irq_domain);
>          }
> 
>          clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>          /* poweroff the phy */
>          rockchip_pcie_phy_deinit(rockchip);
>          /* release the reset */

release? Or "reset the controller"?

>          reset_control_assert(rockchip->rst);
>          pm_runtime_put_sync(dev);
>          pm_runtime_disable(dev);
>          pm_runtime_no_callbacks(dev);
> }
> 
>> Another thin I noticed is should we call pm_runtime_* here for hope that
>> genpd could be powered donw once removed?
>>
> I could not find 'genpd' (power domain) used in the PCIe driver
> If we have an example to use genpd I will update this.
 > > I am also looking into adding NOIRQ_SYSTEM_SLEEP_PM_OPS

That sounds good, you can pick up my patch[1] if you'd like to continue
addressing the comments that I haven't had time to think more.

[1] https://www.spinics.net/lists/linux-pci/msg171846.html

> 
> Thanks
> -Anand
> 


