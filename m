Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B8AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdjVctuM4goZ/UfUF8oH7Uso3v0VX6CfD8MC5A/7/sw=; b=TTK9rLwClAKSF8pGSbabZpPzp+
	X83YiHsJjLNUKTlmy+lPF7/OBWEypqPbZ74QjD888YAsDzZ5wy0NypO44Q+ft3nYacCrtCbAwphLc
	6dUfltRUe+0oGeRGc+NvlEeopCgZEpr5VRtshsWuQnSwa3RJH5aj0qRcGBc77+ctgT11s8jPeGiI2
	5o5osXKpOVg79ZaDt9A8rvImnpaU0nvTzTPohWdjiIIZVIw76QHDpRKSWSwqMDVXkxruiRfVqSlRS
	G680yXv5h9Z5ROOw62GhKOkKEgreklnkymkJPw8lgQMUICXQSmKIfZ6GmDNjUHlWQ4OszcTjBFyF9
	15KexTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlO7-00000003cRx-1EG6;
	Mon, 23 Jun 2025 17:55:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi7P-000000032cX-04sx;
	Mon, 23 Jun 2025 14:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 219736112C;
	Mon, 23 Jun 2025 14:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B253C4CEF0;
	Mon, 23 Jun 2025 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688753;
	bh=wqtKOrmiL3JpO2Y2SIVr4pcAl7mgmV65FohrGrz9zlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK4NzZybEtxBPVkPicenXBcv26helZQ76BwcbNs7/TiRjIlFqpssg+NUb2+znt/Kp
	 iwEHq03Cx5TzL7a70itCG+apUDPO2NUA7QK3T39d9JPkgDyV8eNflv+nhQWAS38OgV
	 dn+e1gQmjyYHYW/iEysLsWFDUwyNEAC9iY9hrej0TFWrCgKBREVh+nqoIFmntcMV4M
	 0c8Fn2ryDkUjGUdwY7/2Opq9EHIwJ6XYiHLFTWHVgKKtlelLD5wUc71lYUEFgd5aF3
	 ZVBk8uRBaDDSw13bmc7tIwDdqZhupn1E6Jw09qlxq9qJ9L5b2PEqTUGK6o1RTUsMZP
	 B83q9B3VdIuog==
Date: Mon, 23 Jun 2025 08:25:50 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Laszlo Fiat <laszlo.fiat@proton.me>, linux-pci@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/6] PCI: rockchip-host: Use macro
 PCIE_RESET_CONFIG_WAIT_MS
Message-ID: <ofgbvui2kvnegpj37yhiabxdkehls5euarmo5wqcjkvscwyyxd@ulf7lr7njd6m>
References: <20250613124839.2197945-8-cassel@kernel.org>
 <20250613124839.2197945-10-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613124839.2197945-10-cassel@kernel.org>
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

On Fri, Jun 13, 2025 at 02:48:41PM +0200, Niklas Cassel wrote:
> Macro PCIE_RESET_CONFIG_WAIT_MS was added to pci.h in commit d5ceb9496c56

s/PCIE_RESET_CONFIG_WAIT_MS/PCIE_RESET_CONFIG_DEVICE_WAIT_MS

> ("PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time value").
> 
> Later, in commit 70a7bfb1e515 ("PCI: rockchip-host: Wait 100ms after reset
> before starting configuration"), PCIE_T_RRS_READY_MS was added to pci.h.
> 
> These macros are duplicates, and represent the exact same delay in the
> PCIe specification.
> 
> Since the comment above PCIE_RESET_CONFIG_WAIT_MS is strictly more correct
> than the comment above PCIE_T_RRS_READY_MS, change rockchip-host to use
> PCIE_RESET_CONFIG_WAIT_MS, and remove PCIE_T_RRS_READY_MS, as
> rockchip-host is the only user of this macro.
> 
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

LGTM!

- Mani

> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 2 +-
>  drivers/pci/pci.h                           | 7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index b9e7a8710cf0..c11ed45c25f6 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -325,7 +325,7 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  	msleep(PCIE_T_PVPERL_MS);
>  	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
>  
> -	msleep(PCIE_T_RRS_READY_MS);
> +	msleep(PCIE_RESET_CONFIG_WAIT_MS);
>  
>  	/* 500ms timeout value should be enough for Gen1/2 training */
>  	err = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_BASIC_STATUS1,
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 98d6fccb383e..819833e57590 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -35,13 +35,6 @@ struct pcie_tlp_log;
>   */
>  #define PCIE_T_PERST_CLK_US		100
>  
> -/*
> - * End of conventional reset (PERST# de-asserted) to first configuration
> - * request (device able to respond with a "Request Retry Status" completion),
> - * from PCIe r6.0, sec 6.6.1.
> - */
> -#define PCIE_T_RRS_READY_MS	100
> -
>  /*
>   * PCIe r6.0, sec 5.3.3.2.1 <PME Synchronization>
>   * Recommends 1ms to 10ms timeout to check L2 ready.
> -- 
> 2.49.0
> 

-- 
மணிவண்ணன் சதாசிவம்

