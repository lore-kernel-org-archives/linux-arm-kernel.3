Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8514ECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1dUf5Nc6vc4f4P7/aobXuszncjlaJXSyBYXfdKwIsE=; b=s2pNzZtiM4UZzPvV/B0996jvxG
	l7iScxcPJ93u9ltWLSV8NveFU+S5j0UfSagcdCNTj6jm68ambjeyhqkHnClq1j7NRpwZsccbVgzC6
	EuuC/u2dYTcOxX24n693hOmkWguSmDCkx6F7xcR+6ilQDvnED/fqLOgCOxs9PA5hw9RrgzYfJs6sC
	J+SRcsScxLDAtcRYA0Wz8ffqYRc4jE+BnGbKf5u7yeNGWrDMn7TeQHWwvwMnwqlgnvFvL1o2UrUU/
	piM0Jg9EZCXfjiS47Vyhn/6IeoSyDmxF/pO6by0TksuS3k8VUjJ2Gw8YQ9tflRz/mtOE5/5b74hGv
	e4RuqBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoVa-00000007FQa-3Bza;
	Tue, 11 Nov 2025 13:34:06 +0000
Received: from mail-m15598.qiye.163.com ([101.71.155.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoVX-00000007FQ2-1DTF;
	Tue, 11 Nov 2025 13:34:04 +0000
Received: from [192.168.61.151] (unknown [110.83.51.2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 293418357;
	Tue, 11 Nov 2025 21:33:59 +0800 (GMT+08:00)
Message-ID: <6b847014-ea46-4e16-8eab-c1a57e7a236e@rock-chips.com>
Date: Tue, 11 Nov 2025 21:33:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, FUKAUMI Naoki <naoki@radxa.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
To: Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
References: <20251111105100.869997-8-cassel@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251111105100.869997-8-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a731f8d6709cckunm858b49041d64c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkwYVkNJHUwfHRkeSBlKHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSktVQ0hVTkpVSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
DKIM-Signature: a=rsa-sha256;
	b=JE3rvUeSo9xsGVjhoyWvCxwk+7LA/vw96b1LQfbIdMM20F2HkHfOVj6TQVzvEHpOQSauiG8jBjOI02owbOAiP2MOgjToiR2HyQLpOBi/C9OuGL/3jd/LmckwiEazBOkIc0XWl/GxisXYiQNP1D7Q4jZz1j+PSlsQtUFH1nZSJNE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=T1dUf5Nc6vc4f4P7/aobXuszncjlaJXSyBYXfdKwIsE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_053403_567041_4FA126D1 
X-CRM114-Status: GOOD (  17.71  )
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


在 2025/11/11 星期二 18:51, Niklas Cassel 写道:
> Revert all patches related to pcie-designware Root Complex Link Up IRQ
> support.
> 
> While this fake hotplugging was a nice idea, it has shown that this feature
> does not handle PCIe switches correctly:
> pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> During the initial scan, PCI core doesn't see the switch and since the Root
> Port is not hot plug capable, the secondary bus number gets assigned as the
> subordinate bus number. This means, the PCI core assumes that only one bus
> will appear behind the Root Port since the Root Port is not hot plug
> capable.
> 
> This works perfectly fine for PCIe endpoints connected to the Root Port,
> since they don't extend the bus. However, if a PCIe switch is connected,
> then there is a problem when the downstream busses starts showing up and
> the PCI core doesn't extend the subordinate bus number after initial scan
> during boot.
> 
> The long term plan is to migrate this driver to the pwrctrl framework,
> once it adds proper support for powering up and enumerating PCIe switches.

For pcie-dw-rockchip

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Niklas Cassel (6):
>    Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link
>      Up"
>    Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up
>      IRQ"
>    Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
>    Revert "PCI: qcom: Enable MSI interrupts together with Link up if
>      'Global IRQ' is supported"
>    Revert "PCI: qcom: Enumerate endpoints based on Link up event in
>      'global_irq' interrupt"
>    Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up
>      event"
> 
>   .../pci/controller/dwc/pcie-designware-host.c | 10 +--
>   drivers/pci/controller/dwc/pcie-designware.h  |  1 -
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 60 +-----------------
>   drivers/pci/controller/dwc/pcie-qcom.c        | 63 +------------------
>   4 files changed, 6 insertions(+), 128 deletions(-)
> 


