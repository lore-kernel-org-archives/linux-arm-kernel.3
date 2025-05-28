Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E85C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 22:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Yw1RJGzlDE2w07brM+upPyskcDJaRABg4F6jib8c+Y4=; b=RRft4DBrRm2fvM
	56FiJANGOamvrfzibQ0TlvL1v4ovPA779xwerrhDPThK+ur2QDNqLBURGdv9V+1nxVGPNCuvMxn8k
	CMy3Qgq3wQu4Uv94Do5dqqGcsPtYrH5XndcH4p/PtRBTx8xPtVvL9Mnr1kVAT31jaUMUozDfS7U0i
	0uz0ddUUX36kVDGuVHZJKZ8Q8hWpIXD/t8Dtr5oSYH6hB8PNDxn4UmC6eIKFmUSE9/jByOQvbrr8p
	vOX3l04Y29+JrCe/mu4m2kAtghOPjYKMusv8uFJ9DpQVSkW3gRWOij/4b6H2vAcZZoC977arhxHWV
	C0cI8wYyMqC4J+tP36dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKPWG-0000000EIBE-47Yb;
	Wed, 28 May 2025 22:45:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKPU6-0000000EHlR-0aHH;
	Wed, 28 May 2025 22:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A74565C5B0D;
	Wed, 28 May 2025 22:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2025EC4CEE3;
	Wed, 28 May 2025 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748472173;
	bh=BgtgZ94JV4lty9f7aKpjE/K76PxuE3tb9eltRydrPzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F9b51zZJVSXTny6ilejAjYKo46E47eW7SnLAWMckqe5uEYoa2mF7gWDVsfBDqMcfh
	 5g2tP+c+9uNyElC+EKifehRog4JsBXOK0Tjv28wpC++aNp8ysTRfuNuXMbORUHy2dJ
	 4+P85wzqo4Sts4xHJxsmUGli/Pf+kHQzjT70XWVMp55RfKejRQFtbI/ZppJltUsE+r
	 QoKIozXi1dmYs9lW/gMjlnfj3wzWczOY4ub3VJFI2Rj5RN21okGs0gYbbSpZdgo/iW
	 6Trt+TYWzyteYUDuOTToFJOnv7n6Kl6QbjSYMapxn8CFBKuvfb9s8yzmdQBj5iBnoq
	 eTHGuRTL5hjDQ==
Date: Wed, 28 May 2025 17:42:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <20250528224251.GA58400@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506073934.433176-7-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_154254_258038_4FC65B0B 
X-CRM114-Status: GOOD (  26.78  )
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

On Tue, May 06, 2025 at 09:39:36AM +0200, Niklas Cassel wrote:
> Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> and instead enumerate the bus when receiving a Link Up IRQ.
> 
> Laszlo Fiat reported (off-list) that his PLEXTOR PX-256M8PeGN NVMe SSD is
> no longer functional, and simply reverting commit ec9fd499b9c6 ("PCI:
> dw-rockchip: Don't wait for link since we can detect Link Up") makes his
> SSD functional again.
> 
> It seems that we are enumerating the bus before the endpoint is ready.
> Adding a msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
> threaded IRQ handler makes the SSD functional once again.

This sounds like a problem that could happen with any controller, not
just dw-rockchip?  Are we missing some required delay that should be
in generic code?  Or is this a PLEXTOR defect that everybody has to
pay the price for?

Delays like this are really hard to get rid of once we add them, so
I'm a little bit cautious.

> What appears to happen is that before ec9fd499b9c6, we called
> dw_pcie_wait_for_link(), and in the first iteration of the loop, the link
> will never be up (because the link was just started),
> dw_pcie_wait_for_link() will then sleep for LINK_WAIT_SLEEP_MS (90 ms),
> before trying again.
> 
> This means that even if a driver was missing a msleep(PCIE_T_RRS_READY_MS)
> (100 ms), because of the call to dw_pcie_wait_for_link(), enumerating the
> bus would essentially be delayed by that time anyway (because of the sleep
> LINK_WAIT_SLEEP_MS (90 ms)).
> 
> While we could add the msleep(PCIE_T_RRS_READY_MS) after deasserting PERST,
> that would essentially bring back an unconditional delay during synchronous
> probe (the whole reason to use a Link Up IRQ was to avoid an unconditional
> delay during probe).
> 
> Thus, add the msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
> IRQ handler. This way, we will not have an unconditional delay during boot
> for unpopulated PCIe slots.
> 
> Cc: Laszlo Fiat <laszlo.fiat@proton.me>
> Fixes: ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3c6ab71c996e..6a7ec3545a7f 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -23,6 +23,7 @@
>  #include <linux/reset.h>
>  
>  #include "pcie-designware.h"
> +#include "../../pci.h"
>  
>  /*
>   * The upper 16 bits of PCIE_CLIENT_CONFIG are a write
> @@ -458,6 +459,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
>  		if (rockchip_pcie_link_up(pci)) {
>  			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> +			msleep(PCIE_T_RRS_READY_MS);
>  			/* Rescan the bus to enumerate endpoint devices */
>  			pci_lock_rescan_remove();
>  			pci_rescan_bus(pp->bridge->bus);
> -- 
> 2.49.0
> 

