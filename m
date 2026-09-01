Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46945C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lzzpNZqToCaD843QzwhwoVfLV+GW90Nv2T3ErEQJV4=; b=uz6ttK3y3d2hXOcUUHYTjG9Dtc
	9JxvX1FGKXdzNy/8zpDUnAw3khrbGQQjldsV1vnT+iL9CGcmCutent5miVHmRntpFaOcB4ekQM2C5
	FD9LuLVXw9J7fPs3jROAaEMFlHgmsz85qFL92PFi0FeRKti25TpvJME5X6BOkz6hBbGAZgB1U6d3L
	aHoyU2FdRjc1cNVOl9mnoaAyULJn6xN+xvGYwOstSRChHYGNqqv+dQ6fKwY3oxFrsY91TXXsQARU9
	dJwCJ5rEankyVnLMgHi7scG8DZZw5kQ4fLFptZtZi1EHErbXMPHfvl2b43YU8wY3thAk265hsmjPS
	Rkvfvgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Juq-0000000BI8g-416O;
	Tue, 01 Sep 2026 08:32:24 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jum-0000000BI7z-3jdH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=6lzzpNZqToCaD843QzwhwoVfLV+GW90Nv
	2T3ErEQJV4=; b=ega7X2ndWZqmRePoGwWoKuPulonhruLLqAvF+9lFOYqm4AgXX
	IrHx2UfSGEvURLlzsFAj1oRFzvz52fORYwbSKCaI42cCgn6O2UxjDpJ8yZG6kqBJ
	pS/yNmjNEk15KwoorNJGfh9v1+iyrMh7LaVumyG2IG8W/OtiBXxVRLzDt4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAeQjZZqkiEAAA--.148S2;
	Tue, 01 Sep 2026 16:32:16 +0800 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
From: Jia Wang <wangjia@ultrarisc.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <49620860-9bd5-48fb-bbaf-55da377e9018@bootlin.com>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
 <49620860-9bd5-48fb-bbaf-55da377e9018@bootlin.com>
Date: Tue, 01 Sep 2026 16:32:04 +0800
Message-Id: <178825152454.3900827.17398212265347300430.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788251524; l=8406;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=oWDwMszXWbe5JxHMjgFsJfNjiR97eBA24tm943KACp4=;
 b=OzFcbGErb+Mtbf2UaujCAqyojXOHR1YtZATlUS3iX8UQwqNqJOtq7HWV7BCtk0wklLxWpEmYH
 NaO5V3X2nsNDvpmnXUSclP771UMViXgsEF17CD8djeNMiNv/p5S7txU
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDHQAeQjZZqkiEAAA--.148S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF48tF4fJry3Zw1fZF47Arb_yoW3JFWrpF
	WkCa43AF1DJr13Ga97Xa1DZF90g3yxKryY9ry3t343XFs0yryFq39rK3y5C3WDWr4DXr12
	yr1UuwnxCan0v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRx-BiUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAAVsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013222_452211_AE0DE636 
X-CRM114-Status: GOOD (  37.33  )
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

On 2026-09-01 09:29 +0200, Maxime Chevallier wrote:
> Hello,
> 
> On 9/1/26 03:27, Jia Wang wrote:
> > The DP1000 GMAC integration provides fixed TX and RX RGMII clock delays
> > that cannot be disabled. For boards without PCB delays, "rgmii-id"
> > describes the link, but passing that mode unchanged to the PHY would enable
> > a second set of delays.
> > 
> > Use phy_fix_phy_mode_for_mac_delays() to translate "rgmii-id" to "rgmii"
> > before attaching the PHY. Reject other RGMII modes because the fixed MAC
> > delays cannot be combined with them without duplicating or omitting a
> > delay.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> 
> Simple enough, this is nice :)
> 
> One thing, I'm going to start requiring this for new glue drivers, can you give
> the output of "ethtool -t eth0" on your device with this new glue driver ?
> 
> You'll have to enable CONFIG_STMMAC_SELFTESTS
> 
> As this is is a 5.20, I'm expecting you'll get something like :
> 
>  1. MAC Loopback                 0
>  2. MMC Counters                 0
>  3. EEE                          -95
>  4. Hash Filter MC               0
>  5. Perfect Filter UC            0
>  6. MC Filter                    0
>  7. UC Filter                    0
>  8. Flow Control                 -95
>  9. RSS                          -95
> 10. VLAN Filtering               -110
> 11. VLAN Filtering (perf)        -110
> 12. Double VLAN Filter           -110
> 13. Double VLAN Filter (perf)    -110
> 14. Flexible RX Parser           -95
> 15. SA Insertion (desc)          0
> 16. SA Replacement (desc)        0
> 17. SA Insertion (reg)           0
> 18. SA Replacement (reg)         0
> 19. VLAN TX Insertion            -110
> 20. SVLAN TX Insertion           -95
> 21. L3 DA Filtering              -95
> 22. L3 SA Filtering              -95
> 23. L4 DA TCP Filtering          -95
> 24. L4 SA TCP Filtering          -95
> 25. L4 DA UDP Filtering          -95
> 26. L4 SA UDP Filtering          -95
> 27. ARP Offload                  -110
> 28. Jumbo Frame                  0
> 29. Multichannel Jumbo           -95
> 30. Split Header                 -95
> 31. TBS (ETF Scheduler)          -95
> 
> -95 (-EOPNOTSUP) and 0 are OK, watch for any other values.
> 
> If ARP Offload and any VLAN selftest (insertion and filtering), this is a known
> issue and you can ignore :)
> 

Thanks. I enabled CONFIG_STMMAC_SELFTESTS and ran the test on the Milk-V
Titan with the new glue driver:

 1. MAC Loopback                 0
 2. MMC Counters                 0
 3. EEE                          -95
 4. Hash Filter MC               0
 5. Perfect Filter UC            -95
 6. MC Filter                    -95
 7. UC Filter                    -95
 8. Flow Control                 0
 9. RSS                          -95
10. VLAN Filtering               -110
11. VLAN Filtering (perf)        -110
12. Double VLAN Filter           -110
13. Double VLAN Filter (perf)    -110
14. Flexible RX Parser           -95
15. SA Insertion (desc)          0
16. SA Replacement (desc)        0
17. SA Insertion (reg)           0
18. SA Replacement (reg)         0
19. VLAN TX Insertion            -110
20. SVLAN TX Insertion           -110
21. L3 DA Filtering              -95
22. L3 SA Filtering              -95
23. L4 DA TCP Filtering          -95
24. L4 SA TCP Filtering          -95
25. L4 DA UDP Filtering          -95
26. L4 SA UDP Filtering          -95
27. ARP Offload                  -110
28. Jumbo Frame                  0
29. Multichannel Jumbo           -95
30. Split Header                 0
31. TBS (ETF Scheduler)          -95

> Maxime
> 
> 

Best regards,
Jia Wang

> > ---
> >  MAINTAINERS                                        |  1 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig        | 11 +++++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile       |  1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c  | 54 ++++++++++++++++++++++
> >  4 files changed, 67 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3b96ff0734e6..aacbab369b51 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28008,6 +28008,7 @@ ULTRARISC DP1000 DWMAC GLUE LAYER
> >  M:	Jia Wang <wangjia@ultrarisc.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
> > +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
> >  
> >  ULTRARISC DP1000 PINCTRL DRIVER
> >  M:	Jia Wang <wangjia@ultrarisc.com>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > index e3dd5adda5ac..ab3c4cf96423 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -319,6 +319,17 @@ config DWMAC_THEAD
> >  	  the stmmac device driver. This driver is used for T-HEAD TH1520
> >  	  ethernet controller.
> >  
> > +config DWMAC_ULTRARISC
> > +	tristate "UltraRISC DWMAC support"
> > +	default ARCH_ULTRARISC
> > +	depends on OF && (ARCH_ULTRARISC || COMPILE_TEST)
> > +	help
> > +	  Support for the Ethernet controller on the UltraRISC DP1000 SoC.
> > +
> > +	  This selects the UltraRISC platform specific glue layer support
> > +	  for the stmmac device driver. This driver is used for the DP1000
> > +	  GMAC Ethernet controller.
> > +
> >  config DWMAC_IMX8
> >  	tristate "NXP IMX8 DWMAC support"
> >  	default ARCH_MXC
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > index a1cea2f57252..b16a456b730e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -36,6 +36,7 @@ obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
> >  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> >  obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
> >  obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
> > +obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
> >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
> >  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
> >  obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
> > new file mode 100644
> > index 000000000000..4bdda2665338
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
> > @@ -0,0 +1,54 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * UltraRISC DWMAC platform driver
> > + *
> > + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/phy.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +static int ultrarisc_dwmac_probe(struct platform_device *pdev)
> > +{
> > +	struct plat_stmmacenet_data *plat_dat;
> > +	struct stmmac_resources stmmac_res;
> > +	struct device *dev = &pdev->dev;
> > +	int ret;
> > +
> > +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get resources\n");
> > +
> > +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +	if (IS_ERR(plat_dat))
> > +		return dev_err_probe(dev, PTR_ERR(plat_dat), "failed to parse DT parameters\n");
> > +
> > +	plat_dat->phy_interface =
> > +		phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface, true, true);
> > +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> > +		return dev_err_probe(dev, -EINVAL, "unsupported phy interface mode\n");
> > +
> > +	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> > +}
> > +
> > +static const struct of_device_id ultrarisc_dwmac_match[] = {
> > +	{ .compatible = "ultrarisc,dp1000-gmac" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ultrarisc_dwmac_match);
> > +
> > +static struct platform_driver ultrarisc_dwmac_driver = {
> > +	.probe = ultrarisc_dwmac_probe,
> > +	.driver = {
> > +		.name = "ultrarisc-dwmac",
> > +		.pm = &stmmac_pltfr_pm_ops,
> > +		.of_match_table = ultrarisc_dwmac_match,
> > +	},
> > +};
> > +module_platform_driver(ultrarisc_dwmac_driver);
> > +
> > +MODULE_DESCRIPTION("UltraRISC DWMAC platform driver");
> > +MODULE_LICENSE("GPL");
> > 
> 
> 



