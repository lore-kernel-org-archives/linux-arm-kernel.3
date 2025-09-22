Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD63CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApMTEldxo9DFgbZqDI/ul+YSiIe3YvqoVohciXpiwpA=; b=p4BeK8/ODv0xUfBVf8lORHCCtg
	P9r8Wv6jJV7EPFVMEWKt2/NDB/2PJaWVYrOhdTxdL5WPndFIi2mTzzMoSS55fWhG9v9uAxcbvvNto
	7a5O0HJCYNkqLkjqC1GpytWIIUZoUc9Jb8jDGgyGIjgexygLPw7bZ2R34X0LpKUtQQ1eLbVG2yH73
	BnncGOUyXmogPcm7NxHKsFG4efLJKny+rDwrBZMlidPKfwxINIInVAej2aBFvog95ozbJZbrvF4vs
	JDWRvz4SMh91Epg5NiYItrNpzYbA57GkqbmCuR4n9zffGQ93xMEuqsdW10ZuHUJd4QxBNyeJfkvuu
	D9Gv9v6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eCY-0000000A8Ak-3FWR;
	Mon, 22 Sep 2025 10:55:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eCV-0000000A8AD-2XZ4;
	Mon, 22 Sep 2025 10:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758538516;
	bh=cq7Y4UZHdRw2ECiLZbveDiF74dbYePvi+a4phlHnPtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbK+hulz3cRofs2gz2imTo35BmAq9oyHgdicO4p3aKWCfae83ng/JF1phynRpMfzb
	 EuVXef5tc+M3MEHd287xeKzfT9mVt+1oAR7fUJfVgx3+3R0NuK5/fiasc4TYWglNvE
	 93XlbxP8cERhUsWnHpPuns5AJ8/QRPVLbopOIrgFwyY6Et63A3RawnM1zn/1JF+fnc
	 KfwXMYeSwHpTu7EX1CFTguGhgeeT/Ub6QMEXC+71X8tNYwhdS7THjVwrCyEtsrgZ6w
	 kjrT1HVp3qoNlFHshhrf4KdjEaeexDd1LhSZPWVvZMcV7eqIhhUj3xxB6GEuCySHiH
	 kS8wrgJKWbdVw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AC9417E10F3;
	Mon, 22 Sep 2025 12:55:15 +0200 (CEST)
Message-ID: <e700cea3-cbe7-4ab5-94d8-a211051e2472@collabora.com>
Date: Mon, 22 Sep 2025 12:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] PCI: Convert devm_pci_alloc_host_bridge() users to
 error-pointer returns
To: Alok Tiwari <alok.a.tiwari@oracle.com>, thomas.petazzoni@bootlin.com,
 pali@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, bhelgaas@google.com, joyce.ooi@intel.com,
 alyssa@rosenzweig.io, maz@kernel.org, jim2101024@gmail.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, sergio.paracuellos@gmail.com,
 matthias.bgg@gmail.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, shawn.lin@rock-chips.com, heiko@sntech.de,
 michal.simek@amd.com, bharat.kumar.gogada@amd.com, will@kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, linus.walleij@linaro.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rric@kernel.org, nirmal.patel@linux.intel.com,
 toan@os.amperecomputing.com, jonathan.derrick@linux.dev,
 linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250921161434.1561770-1-alok.a.tiwari@oracle.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250921161434.1561770-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_035519_815944_CD6D9560 
X-CRM114-Status: GOOD (  13.01  )
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

Il 21/09/25 18:14, Alok Tiwari ha scritto:
> devm_pci_alloc_host_bridge() and pci_alloc_host_bridge() previously
> returned NULL on failure, forcing callers to special-case NULL handling
> and often hardcode -ENOMEM as the error.
> 
> This series updates devm_pci_alloc_host_bridge() to consistently return
> error pointers (ERR_PTR) with the actual error code, instead of NULL.
> All callers across PCI host controller drivers are updated to use
> IS_ERR_OR_NULL()/PTR_ERR() instead of NULL checks and hardcoded -ENOMEM.
> 
> Benefits:
>    - Standardizes error handling with Linux kernel ERR_PTR()/PTR_ERR()
>      conventions.
>    - Ensures that the actual error code from lower-level helpers is
>      propagated back to the caller.
>    - Removes ambiguity between NULL and error pointer returns.
> 
> Touched drivers include:
>   cadence (J721E, cadence-plat)
>   dwc (designware, qcom)
>   mobiveil (layerscape-gen4, mobiveil-plat)
>   aardvark, ftpci100, ixp4xx, loongson, mvebu, rcar, tegra, v3-semi,
>   versatile, xgene, altera, brcmstb, iproc, mediatek, mt7621, xilinx,
>   plda, and others
> 
> This patch updates error handling across these host controller drivers
>   so that callers consistently receive ERR_PTR() instead of NULL.
> 

I think that's a nice improvement - propagating the right error code looks good.

The only thing is - you have to make sure that it never returns NULL, so that
in the controller drivers you always check for `if (IS_ERR(x))` - otherwise with
the current IS_ERR_OR_NULL(x) most of the error paths are wrong.

Cheers,
Angelo

> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>   arch/mips/pci/pci-xtalk-bridge.c                       | 4 ++--
>   drivers/pci/controller/cadence/pci-j721e.c             | 4 ++--
>   drivers/pci/controller/cadence/pcie-cadence-plat.c     | 4 ++--
>   drivers/pci/controller/dwc/pcie-designware-host.c      | 4 ++--
>   drivers/pci/controller/dwc/pcie-qcom.c                 | 4 ++--
>   drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 4 ++--
>   drivers/pci/controller/mobiveil/pcie-mobiveil-plat.c   | 4 ++--
>   drivers/pci/controller/pci-aardvark.c                  | 4 ++--
>   drivers/pci/controller/pci-ftpci100.c                  | 4 ++--
>   drivers/pci/controller/pci-host-common.c               | 4 ++--
>   drivers/pci/controller/pci-hyperv.c                    | 4 ++--
>   drivers/pci/controller/pci-ixp4xx.c                    | 4 ++--
>   drivers/pci/controller/pci-loongson.c                  | 4 ++--
>   drivers/pci/controller/pci-mvebu.c                     | 4 ++--
>   drivers/pci/controller/pci-rcar-gen2.c                 | 4 ++--
>   drivers/pci/controller/pci-tegra.c                     | 4 ++--
>   drivers/pci/controller/pci-v3-semi.c                   | 4 ++--
>   drivers/pci/controller/pci-versatile.c                 | 4 ++--
>   drivers/pci/controller/pci-xgene.c                     | 4 ++--
>   drivers/pci/controller/pcie-altera.c                   | 4 ++--
>   drivers/pci/controller/pcie-brcmstb.c                  | 4 ++--
>   drivers/pci/controller/pcie-iproc-bcma.c               | 4 ++--
>   drivers/pci/controller/pcie-iproc-platform.c           | 4 ++--
>   drivers/pci/controller/pcie-mediatek-gen3.c            | 4 ++--
>   drivers/pci/controller/pcie-mediatek.c                 | 4 ++--
>   drivers/pci/controller/pcie-mt7621.c                   | 4 ++--
>   drivers/pci/controller/pcie-rcar-host.c                | 4 ++--
>   drivers/pci/controller/pcie-rockchip-host.c            | 4 ++--
>   drivers/pci/controller/pcie-xilinx-cpm.c               | 4 ++--
>   drivers/pci/controller/pcie-xilinx-dma-pl.c            | 4 ++--
>   drivers/pci/controller/pcie-xilinx-nwl.c               | 4 ++--
>   drivers/pci/controller/pcie-xilinx.c                   | 4 ++--
>   drivers/pci/controller/plda/pcie-plda-host.c           | 4 ++--
>   drivers/pci/probe.c                                    | 8 ++++----
>   34 files changed, 70 insertions(+), 70 deletions(-)
> 

