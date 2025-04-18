Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B312CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qDFrSAF6YSEJAVtxHNB6hoXiW3GZBDKsUgobKo37Dc=; b=GA5PGiq5NtBhAMy+3yBcHqxUkp
	JQIhIsBBccbLoMzjDvmRIhv25kvDWk5Rr9EoaJ9yWa+lqIEsrf0yo7Gk7XjTX5XHarNkHIdIxki13
	x68AOxFnBVx3i+oaAPa8r/BooyKRKF1N+2SVvsbYhEy7Ba4x18oZVtb44OCV2zMcgxRUvtyVStSJO
	+wA6P+vdPYur6TNDp0nEgBbahMhb3sf4WzMPAqQ6TUjW0dTKgVlqniK+UDIa7p9rv2qewX4qoICOh
	/VPPdXOEOBR9JZTIsE24OOeXu+nKeR/QhmKvLG9qkNMQwMeg+/QmHYAWR9KIXChFzVZQyyX53KyAL
	EcyqSmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jxz-0000000Fz2j-31lR;
	Fri, 18 Apr 2025 11:33:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jvE-0000000FygZ-1gkd;
	Fri, 18 Apr 2025 11:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39B5CA4B402;
	Fri, 18 Apr 2025 11:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B3DC4CEE2;
	Fri, 18 Apr 2025 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744975815;
	bh=yNO/Vv11a/JNX5B7+Pdq/at6wgGWnlT9+n3hN8pOBzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiByg55Xfnr4eelEkmxAH7NdKKRQ+cA8HY7+HclMeCvg7c7jkhguGTwVHzS+y++mN
	 Ash4JUtwAqWDVUlc5IDef0bax1HCRFiHdeqsORE0LUnWFtNdD80VwqGBuoUm85o6G9
	 MRsJ8QpXNlACPP1U0xaJ2bmCt9zzkxBJnLkArVgjcNdspWw3BPr4EKu2mwnBmQP+A0
	 yVv4OcBb97VgmQptxtouEwwP24vjwNsP5MFAUd6IXzURc/YDTRJQtniSTuQemduv1A
	 oGYJpzDJGH2BsXFF8m1h3Gd7ISbC/4UsF6BIbDzLyrTyQkjKqBpUwJ1epVKd1yc91T
	 RPJx3aEzYhetQ==
Date: Fri, 18 Apr 2025 17:00:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bincai Liu <bincai.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 5/5] drm/mediatek: Add eDP phy driver for mt8196
Message-ID: <aAI3wkJmNH6ZcdfO@vaman>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
 <20250418065313.8972-6-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418065313.8972-6-bincai.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_043016_573172_889D2431 
X-CRM114-Status: GOOD (  19.46  )
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

On 18-04-25, 14:52, Bincai Liu wrote:
> Add code to support eDP phy for mt8196.

Why is the patch title not "phy: add eDP phy...." why is this tagged
drm? 

> 
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> ---
>  drivers/phy/mediatek/Makefile      |   1 +
>  drivers/phy/mediatek/phy-mtk-edp.c | 262 +++++++++++++++++++++++++++++
>  2 files changed, 263 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-edp.c
> 
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 1b8088df71e8..49d9ea42497a 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -4,6 +4,7 @@
>  #
>  
>  obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
> +obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-edp.o
>  obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
> diff --git a/drivers/phy/mediatek/phy-mtk-edp.c b/drivers/phy/mediatek/phy-mtk-edp.c
> new file mode 100644
> index 000000000000..fadcbda55b70
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-edp.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2022 MediaTek Inc.
> + * Copyright (c) 2022 BayLibre
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define PHYD_OFFSET			0x0000
> +#define PHYD_DIG_LAN0_OFFSET		0x1000
> +#define PHYD_DIG_LAN1_OFFSET		0x1100
> +#define PHYD_DIG_LAN2_OFFSET		0x1200
> +#define PHYD_DIG_LAN3_OFFSET		0x1300
> +#define PHYD_DIG_GLB_OFFSET		0x1400
> +
> +#define DP_PHY_DIG_PLL_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x10)
> +#define FORCE_PWORE_STATE_FLDMASK		GENMASK(2, 0)
> +#define FORCE_PWORE_STATE_VALUE			0x7
> +
> +#define IPMUX_CONTROL			(PHYD_DIG_GLB_OFFSET + 0x98)
> +#define EDPTX_DSI_PHYD_SEL_FLDMASK		0x1
> +#define EDPTX_DSI_PHYD_SEL_FLDMASK_POS		0
> +
> +#define DP_PHY_DIG_TX_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x74)
> +#define TX_LN_EN_FLDMASK			0xf
> +
> +#define mtk_edp_PHY_DIG_PLL_CTL_1	(PHYD_DIG_GLB_OFFSET + 0x14)
> +#define TPLL_SSC_EN				BIT(8)
> +
> +#define mtk_edp_PHY_DIG_BIT_RATE		(PHYD_DIG_GLB_OFFSET + 0x3C)
> +#define BIT_RATE_RBR				0x1
> +#define BIT_RATE_HBR				0x4
> +#define BIT_RATE_HBR2				0x7
> +#define BIT_RATE_HBR3				0x9
> +
> +#define mtk_edp_PHY_DIG_SW_RST		(PHYD_DIG_GLB_OFFSET + 0x38)
> +#define DP_GLB_SW_RST_PHYD			BIT(0)
> +#define DP_GLB_SW_RST_PHYD_MASK			BIT(0)
> +
> +#define DRIVING_FORCE			0x30
> +#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK	0x6
> +#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK_POS	1
> +#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK		0x18
> +#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK_POS	3
> +
> +struct mtk_edp_phy {
> +	struct regmap *regs;
> +};
> +
> +enum DPTX_LANE_NUM {
> +	DPTX_LANE0 = 0x0,
> +	DPTX_LANE1 = 0x1,
> +	DPTX_LANE2 = 0x2,
> +	DPTX_LANE3 = 0x3,
> +	DPTX_LANE_MAX,
> +};
> +
> +enum DPTX_LANE_COUNT {
> +	DPTX_LANE_COUNT1 = 0x1,
> +	DPTX_LANE_COUNT2 = 0x2,
> +	DPTX_LANE_COUNT4 = 0x4,
> +};
> +
> +static void mtk_edptx_phyd_reset_swing_pre(struct mtk_edp_phy *edp_phy)
> +{
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN2_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN3_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +}
> +
> +static int mtk_edp_phy_init(struct phy *phy)
> +{
> +	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(edp_phy->regs, IPMUX_CONTROL, 0,
> +			   EDPTX_DSI_PHYD_SEL_FLDMASK);
> +
> +	regmap_update_bits(edp_phy->regs, DP_PHY_DIG_PLL_CTL_0,
> +			   FORCE_PWORE_STATE_VALUE,
> +			   FORCE_PWORE_STATE_FLDMASK);
> +
> +	return 0;

consider making this void return type

-- 
~Vinod

