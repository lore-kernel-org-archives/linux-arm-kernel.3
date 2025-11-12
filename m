Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F65CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaMbRURJhLkvG/AVZ92aTWNCGETrMCxlf9HvH6rX52w=; b=r7dQg5mBo9QpwI7+NtGrkHmr9N
	jpXTgQxgKQ1ORP67uzlD1c53NLMte8WAf1Qc+dd5Ij2cyhCtcm0fUQb0eyMXWcUoeibdyPeHTmUfu
	HSeKwiFw6XoFhytFZPnjA837LzpEBXVInxhZBbxO074qcBGd29VQ9f5/siiborVUuOe1UZI63kTWg
	Kxt8DU+0zzrcvAk+PDoBxq+W+QfbY+ZJLnJ2fH4LOkJ4R0SG/cZDb4DO4xLRzVKQLeV1LfY8EHzUr
	fqj04NONadThTyMNwsx2J9B8NGJ6zLwjykxCv+jQqsW/BZtNI+57zI5pStX9ipNR0nv7WJmyrUnNZ
	T874gCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6GV-00000008MFt-3z13;
	Wed, 12 Nov 2025 08:31:43 +0000
Received: from mail-m1973188.qiye.163.com ([220.197.31.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6GQ-00000008MBk-1kco;
	Wed, 12 Nov 2025 08:31:42 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29503293b;
	Wed, 12 Nov 2025 16:31:32 +0800 (GMT+08:00)
Message-ID: <ef433574-3e81-4636-82c8-9bc3552addca@rock-chips.com>
Date: Wed, 12 Nov 2025 16:31:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, pali@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 1/2] PCI: Configure Root Port MPS during host probing
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, bhelgaas@google.com, helgaas@kernel.org,
 heiko@sntech.de, mani@kernel.org, yue.wang@Amlogic.com
References: <20251104165125.174168-1-18255117159@163.com>
 <20251104165125.174168-2-18255117159@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251104165125.174168-2-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7731027109cckunm3695c205155bc1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklNSVZKGBkfHhlCQklCSRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OQrlNibCvuZayM7wDbAagcEJdfH7X7Q3cM6x97+7LQYx7k4r/CgTIBxxCMJ3Y3fvGNo5K6I52NbBbMcdb5R2ELbdSxTmrl+IoMlKzkcVNDrZPs9R8U4AlvAAIOr+HA4C22Kud5mpViQKRjgDZtrex+JDHEueUhSBWnW/n+bRq3E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qaMbRURJhLkvG/AVZ92aTWNCGETrMCxlf9HvH6rX52w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_003139_730719_49337D5B 
X-CRM114-Status: GOOD (  16.88  )
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

在 2025/11/05 星期三 0:51, Hans Zhang 写道:
> Current PCIe initialization logic may leave Root Ports (root bridges)
> operating with non-optimal Maximum Payload Size (MPS) settings. Existing
> code in pci_configure_mps() returns early for devices without an upstream
> bridge (!bridge) which includes Root Ports, so their MPS values remain
> at firmware/hardware defaults. This fails to utilize the controller's full
> capabilities, leading to suboptimal data transfer efficiency across the
> PCIe hierarchy.
> 
> With this patch, during the host controller probing phase:
> - When PCIe bus tuning is enabled (not PCIE_BUS_TUNE_OFF), and
> - The device is a Root Port without an upstream bridge (!bridge),
> The Root Port's MPS is set to its hardware-supported maximum value
> (128 << dev->pcie_mpss).
> 
> Note that this initial maximum MPS setting may be reduced later, during
> downstream device enumeration, if any downstream device does not suppor
> the Root Port's maximum MPS.
> 
> This change ensures Root Ports are properly initialized before downstream
> devices negotiate MPS, while maintaining backward compatibility via the
> PCIE_BUS_TUNE_OFF check.
> 

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/probe.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 0ce98e18b5a8..2459def3af9b 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2196,6 +2196,18 @@ static void pci_configure_mps(struct pci_dev *dev)
>   		return;
>   	}
>   
> +	/*
> +	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all),
> +	 * start off by setting Root Ports' MPS to MPSS. This only applies to
> +	 * Root Ports without an upstream bridge (root bridges), as other Root
> +	 * Ports will have downstream bridges. Depending on the MPS strategy
> +	 * and MPSS of downstream devices, the Root Port's MPS may be
> +	 * overridden later.
> +	 */
> +	if (!bridge && pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
> +	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
> +		pcie_set_mps(dev, 128 << dev->pcie_mpss);
> +
>   	if (!bridge || !pci_is_pcie(bridge))
>   		return;
>   


