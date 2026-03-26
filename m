Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFDA10A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWouWXnDGtNRg1OssjuVEKm4sQO0E0DczrT+nNv9akM=; b=Pe4Vl9nCValGlYT+qKGfofQsd4
	5M98S1Fc8RCyuoAKw+Ym5K5n7S4qEoibZkkNfiM87iUBiGYWbNC+y1kqbVCOsvWWU9aU5dUKs+nK2
	iaaDh59miQQDdK0hZBixdb1mWFwZTK2TJTNEvUuF70GpxOT1nmqiefUQ07urp3J0Q6R6Q0mFLqsWa
	2SExP+Ek2wPNLcU1NyTDmotWtaPGCtIFn17JCDkTeh15EAEn2PZypMsnjkTDobNse7Jc9qK0cPHuQ
	L+yN/m+MoG9ouMt7ER2gw4Wjqgun3SOHhxOYxcVgtAik9nWi8ohyy8B+5s/N9zn3k8xOjB8e8RO1e
	KLpInmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o13-00000005trZ-1hc8;
	Thu, 26 Mar 2026 16:57:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o12-00000005trD-0ZXD;
	Thu, 26 Mar 2026 16:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 043036011F;
	Thu, 26 Mar 2026 16:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC2C116C6;
	Thu, 26 Mar 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774544222;
	bh=tr+9fNAQNqGsuZCPn0EwTdspBeuzqbTTR89MFy19qdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stOtUva7Sd7FQSWNmcGkhGLZugI5j7Fu2CtWbWqq0feqBH45KJVj1SwSgjEtshfuA
	 u3XZes7NQeWH3mSRD0/1aqabnAxICLFxr028HePUwdbgtDlohLqz83XgB24EIwd+qj
	 iddlTgjMFbQfNG3wepAs+pEMfZbkgg0qKGvcrzkPcUtVZwC4QD9tWWFqzoHk1si/Bz
	 +GdPkwh4nzND9/SezB+7Zf5LDO9RAnXAqPmaPLhzUTamcxe/+8pIVwc288cmxAMrAu
	 W/yFu9VJhOcGYgL+3t2hCwnspKUbtsy6CetHnzGSHNpFoF4i4woC/hpijnDmE97JpU
	 DPDCLIctgg4IQ==
Date: Thu, 26 Mar 2026 22:26:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Message-ID: <nokpoxfotjlirqs735sse3f5copimqwmd7fblegrcozkmpkgae@6bw6u3qazbme>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
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

On Thu, Mar 05, 2026 at 11:50:35AM +0530, Sumit Kumar wrote:
> This series adds support for multi-port PCIe controllers in the DesignWare
> driver. Currently, the driver only supports a single Root Port with
> controller-level properties, which doesn't work for multi-port controllers
> where each port may have different configurations.
> 
> This series introduces a per-port structure and parsing API that allows 
> each Root Port to be configured independently via pcie@N child nodes in
> device tree, while maintaining backward compatibility with existing 
> single-port bindings.
> 

This patch touches multiple host controller drivers. I'd appreciate if the
platform maintainers could test this series and give their tested-by tag to make
sure we don't regress.

- Mani

> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix error code preservation in dw_pcie_resume_noirq() to return actual
>   error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
> - Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
> - dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
>   failures fatal for now, add TODO comment about making properties
>   optional later (Mani).
> - Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com
> 
> ---
> Sumit Kumar (2):
>       PCI: API changes for multi-port controller support
>       PCI: dwc: Add multi-port controller support
> 
>  drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
>  drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
>  drivers/pci/controller/dwc/pci-meson.c            |   1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
>  drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
>  drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
>  drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
>  drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
>  drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
>  drivers/pci/of.c                                  |   6 +-
>  drivers/pci/pci.h                                 |   2 +
>  16 files changed, 232 insertions(+), 74 deletions(-)
> ---
> base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
> change-id: 20251010-dt-parser-98b50ce18fc1
> 
> Best regards,
> -- 
> Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

