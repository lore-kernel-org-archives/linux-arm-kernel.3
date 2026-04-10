Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04153F36B9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 00:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mqjz6IXi2Nh7CDAEaokpRybVDDSN/VvLWMpvHJGfmOg=; b=oSFpg2sMRzXEEj4OC7MVk4KeeI
	y0XFtYm6kaKofGzcJZJH1aWbXf00/kIjiJxQW5FpBwdzvyjPci0sOzuRbDlGnfXIdm4pBrxpsQCy5
	jAti2dVAmLd/I6QYXHOnnO9kJOWbJ5SkoSEkjRY4w0ciozwkglOC2IJAB/XoeR886uGWt6FaFdKwy
	iq1uxhb3tBo8vVLCkcYpwJPD7AqwbtmFhCHLOrqg8+hlmhkpqwRY8vRQwjJ3JqsOPfofubzK7Na3g
	fivXLu8e1OzWZyyM2tdOoLBdyNHsl3B+ZfHEqU+Mdy9JmHHmztOoQfiGf2VTTje+CHRogBVujeR1v
	DVF1PQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB01P-0000000BNfj-27kZ;
	Fri, 10 Apr 2026 00:46:55 +0000
Received: from mail-m15573.qiye.163.com ([101.71.155.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB01K-0000000BNe0-0xAT;
	Fri, 10 Apr 2026 00:46:53 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a2aff74f;
	Fri, 10 Apr 2026 08:46:33 +0800 (GMT+08:00)
Message-ID: <0ee54525-928e-a1ce-ec2d-1f85cf15abbc@rock-chips.com>
Date: Fri, 10 Apr 2026 08:46:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v1] phy: rockchip-snps-pcie3:phy: Configure clkreq_n and
 PowerDown for all lanes
To: Anand Moon <linux.amoon@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260409044939.7647-1-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260409044939.7647-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d74dadb4909cckunmd6738a1c517e0a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUhISlYeT09DSh9IHUlMSRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KevY7tvxQt/iVUsWMn2Prf/um0QObBwPIG7Q9aew+klGem7Dz27DWVmhx+CBl/EylsycsAXfC4rFvkTqD+/55YcuWrDVdPkiLqt6/J4AM4vh8vie2nMl48wf+EAATzVK8etESyy8qY5Ri3Fe3hz3yPAfTKjaNi7KDfWYyGB1ZE0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Mqjz6IXi2Nh7CDAEaokpRybVDDSN/VvLWMpvHJGfmOg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_174650_836773_D1482B91 
X-CRM114-Status: GOOD (  22.51  )
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

Hi Anand

在 2026/04/09 星期四 12:49, Anand Moon 写道:
> During the rk3588_p3phy_init sequence, the driver now explicitly
> configures each lane's CON0 register to ensure
> - PIPE 4.3 Compliance: clkreq_n (bit 6) is forced low (asserted) to meet
>    sideband signal requirements.

clkreq_n is now force asserted via controller driver if supports_clkreq
is not set.

> - Active Power State: PowerDown[3:0] (bits 11:8) is set to P0
>    (Normal Operational State) to ensure the PHY is fully powered and ready
>    for link training.
> 

P0 is the nature state when linking up. I don't know why it should be P0
before we even don't know whether the device is present.

> These changes ensure that all lanes are consistently transitioned from
> reset into a known-good operational state, preventing undefined behavior
> and ensuring the PHY is ready for high-speed data transmission.
> 
> Cc: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 28 +++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> index 4e8ffd173096..f46e13e79a0e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> +++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/hw_bitfield.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
>   #include <linux/kernel.h>
> @@ -35,10 +36,14 @@
>   #define RK3588_PCIE3PHY_GRF_CMN_CON0		0x0
>   #define RK3588_PCIE3PHY_GRF_PHY0_STATUS1	0x904
>   #define RK3588_PCIE3PHY_GRF_PHY1_STATUS1	0xa04
> +#define RK3588_PCIE3PHY_GRF_PHY0_LN0_CON0	0x1000
>   #define RK3588_PCIE3PHY_GRF_PHY0_LN0_CON1	0x1004
>   #define RK3588_PCIE3PHY_GRF_PHY0_LN1_CON1	0x1104
> +#define RK3588_PCIE3PHY_GRF_PHY0_LN1_CON0	0x1100
> +#define RK3588_PCIE3PHY_GRF_PHY1_LN0_CON0	0x2000
>   #define RK3588_PCIE3PHY_GRF_PHY1_LN0_CON1	0x2004
>   #define RK3588_PCIE3PHY_GRF_PHY1_LN1_CON1	0x2104
> +#define RK3588_PCIE3PHY_GRF_PHY1_LN1_CON0	0x2100
>   #define RK3588_SRAM_INIT_DONE(reg)		(reg & BIT(0))
>   
>   #define RK3588_BIFURCATION_LANE_0_1		BIT(0)
> @@ -49,6 +54,13 @@
>   #define RK3588_PCIE1LN_SEL_EN			(GENMASK(1, 0) << 16)
>   #define RK3588_PCIE30_PHY_MODE_EN		(GENMASK(2, 0) << 16)
>   
> +static const u32 rk3588_lane_con0[] = {
> +	RK3588_PCIE3PHY_GRF_PHY0_LN0_CON0,
> +	RK3588_PCIE3PHY_GRF_PHY0_LN1_CON0,
> +	RK3588_PCIE3PHY_GRF_PHY1_LN0_CON0,
> +	RK3588_PCIE3PHY_GRF_PHY1_LN1_CON0,
> +};
> +
>   struct rockchip_p3phy_ops;
>   
>   struct rockchip_p3phy_priv {
> @@ -142,7 +154,7 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
>   {
>   	u32 reg = 0;
>   	u8 mode = RK3588_LANE_AGGREGATION; /* default */
> -	int ret;
> +	int ret, i;
>   
>   	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_PHY0_LN0_CON1,
>   		     priv->rx_cmn_refclk_mode[0] ? RK3588_RX_CMN_REFCLK_MODE_EN :
> @@ -161,7 +173,7 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
>   	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_CMN_CON0, BIT(8) | BIT(24));
>   
>   	/* Set bifurcation if needed */
> -	for (int i = 0; i < priv->num_lanes; i++) {
> +	for (i = 0; i < priv->num_lanes; i++) {
>   		if (priv->lanes[i] > 1)
>   			mode &= ~RK3588_LANE_AGGREGATION;
>   		if (priv->lanes[i] == 3)
> @@ -174,6 +186,18 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
>   	regmap_write(priv->phy_grf, RK3588_PCIE3PHY_GRF_CMN_CON0,
>   		     RK3588_PCIE30_PHY_MODE_EN | reg);
>   
> +	for (i = 0; i < priv->num_lanes && i < ARRAY_SIZE(rk3588_lane_con0); i++) {
> +		u32 base = rk3588_lane_con0[i];
> +
> +		/* clkreq_n = 0 (asserted low for PIPE 4.3) */
> +		regmap_write(priv->phy_grf, base,
> +			     FIELD_PREP_WM16(BIT(6), 0));
> +
> +		/* PowerDown = P0 (0x0, fully active) */
> +		regmap_write(priv->phy_grf, base,
> +			     FIELD_PREP_WM16(GENMASK(11, 8), 0x0));
> +	}
> +
>   	/* Set pcie1ln_sel in PHP_GRF_PCIESEL_CON */
>   	if (!IS_ERR(priv->pipe_grf)) {
>   		reg = mode & (RK3588_BIFURCATION_LANE_0_1 | RK3588_BIFURCATION_LANE_2_3);
> 
> base-commit: 7f87a5ea75f011d2c9bc8ac0167e5e2d1adb1594

