Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79900EFCE47
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DTTlw8h70Vigb9DLz8tlQfJtxuusnOm8ulwcZ/zLeYQ=; b=RUnVH/vrsm2iVfaEBA84Ea84PT
	kWLUFIWYdaHYDKqnvhZl/LlVjHDk7kmgcKlcjgEM2jiUkITQLxCE5fuuSV7I3MOcbO5GKgOD6D6sW
	zxTpwvw8WKWFnr9trxqPzM559VZoIC9BMTwyUzX6ixq3SpUf7LswXuGSYLi2yDjP2R5G4gw1jljXK
	6wCxK3wJYvakSsPYcVGUY2o331vPq7aU6GL0pmCh6pZf2qO3J2cokhwieLpXBpoCKAcMARLKAlzJ4
	rhXYR5SPPEyUmRnvqDmRweebSrw/Fo+ONSX2xbBjg3wa8dxC/INn/A3eHKGNeoUdOBjYk3aXNpIOQ
	8AXJ7pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxudZ-00000000ZlG-3rnh;
	Wed, 04 Mar 2026 22:24:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxudX-00000000ZkS-1bcX;
	Wed, 04 Mar 2026 22:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C537542B72;
	Wed,  4 Mar 2026 22:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78788C4CEF7;
	Wed,  4 Mar 2026 22:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772663049;
	bh=LZ6aRV4NLElGe+XvDNm2H6HYU4en15K91g1Y0+5t5ls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JT8h8wa9YGAM78bb/3oWwxOczIdTWP1RLevWv9SASlMV3F23HjV3aS0cAufk5oNIv
	 Zbq+dj2V5Q1lrbLpdEf4tkfURlQheh0zpocuRg02jBYOuKwCUWiLX08zynlr3zyeeI
	 6w6Tf3erGb8F5L7qg0ORfQYnKFUxrQFLM83fJWOTVoAGPovAII829usbx5s2g7ZftI
	 8F0q5T73eVmTAvQiaF4BLlcaiBz/Wo2J+jlfrwYZ9ZRmUbse8mrHowz62l44VtX+79
	 VS3gNkNik1DtEJIOtsvBEoQRsmWSal1XE2ICQqhs17+ZVBYOWkmudGUSL2q9myTyT4
	 S8ZfZ2xwzNClw==
Date: Wed, 4 Mar 2026 16:24:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawn.guo@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH phy-next 02/22] PCI: add missing headers transitively
 included by <linux/phy/phy.h>
Message-ID: <20260304222408.GA40990@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304175735.2660419-3-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_142411_487115_FE16D983 
X-CRM114-Status: GOOD (  14.42  )
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

Update subject line to match history:

  PCI: Add missing headers transitively included by <linux/phy/phy.h>

On Wed, Mar 04, 2026 at 07:57:15PM +0200, Vladimir Oltean wrote:
> The tegra as well as a few dwc PCI controller drivers uses PM runtime
> operations without including the required <linux/pm_runtime.h> header.
> 
> Similarly, pcie-rockchip-host, pcie-starfive as well as a few dwc PCI
> controllers use the regulator consumer API without including
> <linux/regulator/consumer.h>.
> 
> It seems these function prototypes were indirectly provided by
> <linux/phy/phy.h>, mostly by mistake (none of the functions it exports
> need it).
> 
> Before the PHY header can drop the unnecessary includes, make sure the
> PCI controller drivers include what they use.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

With the subject line update:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Yixun Lan <dlan@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Cc: Kevin Xie <kevin.xie@starfivetech.com>
> ---
>  drivers/pci/controller/dwc/pci-keystone.c     | 1 +
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>  drivers/pci/controller/dwc/pcie-histb.c       | 1 +
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 1 +
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 2 ++
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 1 +
>  drivers/pci/controller/pci-tegra.c            | 1 +
>  drivers/pci/controller/pcie-rockchip-host.c   | 1 +
>  drivers/pci/controller/plda/pcie-starfive.c   | 1 +
>  9 files changed, 10 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 20fa4dadb82a..642e4c45eefc 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -24,6 +24,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/resource.h>
>  #include <linux/signal.h>
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 5b17da63151d..e0079ec108ab 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -21,6 +21,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
>  #include "../../pci.h"
> diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
> index a52071589377..432a54c5bfce 100644
> --- a/drivers/pci/controller/dwc/pcie-histb.c
> +++ b/drivers/pci/controller/dwc/pcie-histb.c
> @@ -18,6 +18,7 @@
>  #include <linux/pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/resource.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 18460f01b2c6..e417122da51d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -19,6 +19,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/module.h>
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index be20a520255b..dbec159fd458 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -15,7 +15,9 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 06571d806ab3..3378a89580ab 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -27,6 +27,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/random.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/resource.h>
>  #include <linux/types.h>
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 512309763d1f..a2c1662b6e81 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -36,6 +36,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index ee1822ca01db..46adb4582fcc 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -24,6 +24,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "../pci.h"
>  #include "pcie-rockchip.h"
> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
> index 298036c3e7f9..22344cca167b 100644
> --- a/drivers/pci/controller/plda/pcie-starfive.c
> +++ b/drivers/pci/controller/plda/pcie-starfive.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include "../../pci.h"
>  
> -- 
> 2.43.0
> 

