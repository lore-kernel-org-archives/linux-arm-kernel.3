Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85858D36129
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEE4utDsOqi2G7dEGJL+m5LimCexWxXDNSevLQss62c=; b=FFpnhU3rk22ZcleMObVOO4GnF5
	Bxy20HjN0VSQ/eDIt2HonmBGKkNVEqb+CpWsHk6FGddi+NeCNVLQqroeZW6mS5TnT1r8BjF0Md5Bv
	oQEnOj28dUKM7dMAVUeS+47DXJ8wHbXVilNVc8wCf9UHIEhqwWDdnCLwe2i6zXaucEet+KQN6qUY2
	Phs2QQ9Yw1fhMe6OCnLWqpMOyvBVT2rXc6tunNJegZ6HFAZ0R7ZSiye9pPRGm6ISEtIAxE6WPhPFV
	UdycpXy5l4HnrbuHyQKd6yx31z+5JX1k3hP/7SnAdAYZYB2SmZ/8KVatqkdiLOblR7cGi9l0J68hE
	DYnogvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VaR-00000001QkC-0aCJ;
	Wed, 06 Nov 2024 02:15:59 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VYh-00000001QJc-2ILh;
	Wed, 06 Nov 2024 02:14:13 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ede26dc527so1046301a12.3;
        Tue, 05 Nov 2024 18:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730859250; x=1731464050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEE4utDsOqi2G7dEGJL+m5LimCexWxXDNSevLQss62c=;
        b=B0wXtfik+UZ8e9p0HU1YwkXUjN7mxLZfo8NgM0P5V7babCaCA6mHQHdwy/no7Sr+zt
         lNch1STCQlcnZL8KCmLSgLW5L+owvRE2LMTR3OPwdqsmwL6SWzRVZX9YBF/acawOmMFF
         CGi1mhSEbHbG7GEsRat5YGKElnntnPOEhQu61Jv/sY+khFJ5L1ZQXJWlYC2LkcR0JuCx
         8VLnvwGFfoI25nSp8EDJrBJqM2VcWcTcVrYOstFwMcPF0plvYa9nKkx12ZXOzSDvXagd
         OBuC8onJQr5/mX18iuaTSMO0pyr9IYK6jSgPxopF8O4SvyVI/MPv1pOGvxCyZeMIDaAY
         Q2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730859250; x=1731464050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEE4utDsOqi2G7dEGJL+m5LimCexWxXDNSevLQss62c=;
        b=nrIIpRV/8UYQylrlQFDqM8OPtDR0r+rMwPT2FPQs/E5GLOYirz4+lJ6QGS8btxaHSj
         H3zldpxCTYupSxNsCh2MXSGWMGIfRGmjkJkpibjzmP4wZ7ByEwZJ1W/FvNWksRnSP3JI
         okfB7Biz5Yif3CMOdMmJsLERtrWEYsn7ST7FWDdC2Gh804+BT/3TlOVPqGRzezpfOkVl
         m3Iql080pofJFY3ziUZmcZG381cUVXQ7LTdNnKVNydXhO8nPElsYUyuoZGFsdig7fh93
         MdNjZJyYhIcFL/Gjfy0cbCe8NGUQCMYEZnFnWntNBBTnj6ygAVeN0ZxC6SNH8rCMezZM
         mtIw==
X-Forwarded-Encrypted: i=1; AJvYcCWKd42eMCHRlGk0Dujez5NH1iNwocItG+P7HwFz3uOqh/mEckZmTEbQSgfwV2gVQqZG794j70u0ABijOaSvvVU=@lists.infradead.org, AJvYcCXcopKzashbno6Cl4gOLQf2+L5JC8vma8zAuWvHtPJ2QpwOx5SL0wYnyG7FyO9sprv7APcN02vHYAuryJykfoP9@lists.infradead.org
X-Gm-Message-State: AOJu0YzQeSOi5Kh/83vmrLv/MGQK5yNg4VjuSv+hfq4SikA3gLyAonS9
	K/EJsL7MDMinqVo9kSPMuGDD3PheRKkb3RyB3bF6TD+JLP2cIl5X
X-Google-Smtp-Source: AGHT+IEDW0Y+n6Vr8S2iIAQkJrD0UybVTBSm4DPykjYetCDyXQJTW6/5b6STRrgh5zctQS6nQYJGWA==
X-Received: by 2002:a05:6a20:1590:b0:1cf:37d4:c50b with SMTP id adf61e73a8af0-1d9a83da986mr27983058637.4.1730859250308;
        Tue, 05 Nov 2024 18:14:10 -0800 (PST)
Received: from localhost.localdomain ([103.29.142.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a8b3fsm10021131a12.28.2024.11.05.18.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 18:14:10 -0800 (PST)
From: Frank Wang <frawang.cn@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	william.wu@rock-chips.com,
	tim.chen@rock-chips.com,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>
Subject: [RESEND PATCH v3 2/2] phy: rockchip-naneng-combo: add rk3576 support
Date: Wed,  6 Nov 2024 10:13:57 +0800
Message-Id: <20241106021357.19782-2-frawang.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106021357.19782-1-frawang.cn@gmail.com>
References: <20241106021357.19782-1-frawang.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_181411_653337_5A811EC4 
X-CRM114-Status: GOOD (  17.21  )
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

From: Kever Yang <kever.yang@rock-chips.com>

Rockchip RK3576 integrates two naneng-combo PHY, PHY0 is used for
PCIE and SATA, PHY1 is used for PCIE, SATA and USB3.

This adds device specific data support.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Signed-off-by: William Wu <william.wu@rock-chips.com>
Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
Changelog:
v3:
 - add detail commit contents.
 - using FIELD_PREP() instead of bit shift.
 - leave a blank line after each switch break case.

v2:
 - using constants macro instead of magic values.
 - add more comments for PHY tuning operations.

v1:
 - https://patchwork.kernel.org/project/linux-phy/patch/20241015013351.4884-2-frawang.cn@gmail.com/

 .../rockchip/phy-rockchip-naneng-combphy.c    | 279 ++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 0a9989e41237f..eceb798567859 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -37,6 +37,10 @@
 #define PHYREG8				0x1C
 #define PHYREG8_SSC_EN			BIT(4)
 
+#define PHYREG10			0x24
+#define PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
+#define PHYREG10_SSC_PCM_3500PPM	7
+
 #define PHYREG11			0x28
 #define PHYREG11_SU_TRIM_0_7		0xF0
 
@@ -61,17 +65,26 @@
 #define PHYREG16			0x3C
 #define PHYREG16_SSC_CNT_VALUE		0x5f
 
+#define PHYREG17			0x40
+
 #define PHYREG18			0x44
 #define PHYREG18_PLL_LOOP		0x32
 
+#define PHYREG21			0x50
+#define PHYREG21_RX_SQUELCH_VAL		0x0D
+
 #define PHYREG27			0x6C
 #define PHYREG27_RX_TRIM_RK3588		0x4C
 
+#define PHYREG30			0x74
+
 #define PHYREG32			0x7C
 #define PHYREG32_SSC_MASK		GENMASK(7, 4)
+#define PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
 #define PHYREG32_SSC_DIR_SHIFT		4
 #define PHYREG32_SSC_UPWARD		0
 #define PHYREG32_SSC_DOWNWARD		1
+#define PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
 #define PHYREG32_SSC_OFFSET_SHIFT	6
 #define PHYREG32_SSC_OFFSET_500PPM	1
 
@@ -79,6 +92,7 @@
 #define PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
 #define PHYREG33_PLL_KVCO_SHIFT		2
 #define PHYREG33_PLL_KVCO_VALUE		2
+#define PHYREG33_PLL_KVCO_VALUE_RK3576	4
 
 struct rockchip_combphy_priv;
 
@@ -98,6 +112,7 @@ struct rockchip_combphy_grfcfg {
 	struct combphy_reg pipe_rxterm_set;
 	struct combphy_reg pipe_txelec_set;
 	struct combphy_reg pipe_txcomp_set;
+	struct combphy_reg pipe_clk_24m;
 	struct combphy_reg pipe_clk_25m;
 	struct combphy_reg pipe_clk_100m;
 	struct combphy_reg pipe_phymode_sel;
@@ -584,6 +599,266 @@ static const struct rockchip_combphy_cfg rk3568_combphy_cfgs = {
 	.combphy_cfg	= rk3568_combphy_cfg,
 };
 
+static int rk3576_combphy_cfg(struct rockchip_combphy_priv *priv)
+{
+	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
+	unsigned long rate;
+	u32 val;
+
+	switch (priv->type) {
+	case PHY_TYPE_PCIE:
+		/* Set SSC downward spread spectrum */
+		val = FIELD_PREP(PHYREG32_SSC_MASK, PHYREG32_SSC_DOWNWARD);
+		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
+
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
+		break;
+
+	case PHY_TYPE_USB3:
+		/* Set SSC downward spread spectrum */
+		val = FIELD_PREP(PHYREG32_SSC_MASK, PHYREG32_SSC_DOWNWARD);
+		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
+
+		/* Enable adaptive CTLE for USB3.0 Rx */
+		val = readl(priv->mmio + PHYREG15);
+		val |= PHYREG15_CTLE_EN;
+		writel(val, priv->mmio + PHYREG15);
+
+		/* Set PLL KVCO fine tuning signals */
+		rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK, BIT(3), PHYREG33);
+
+		/* Set PLL LPF R1 to su_trim[10:7]=1001 */
+		writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
+
+		/* Set PLL input clock divider 1/2 */
+		val = FIELD_PREP(PHYREG6_PLL_DIV_MASK, PHYREG6_PLL_DIV_2);
+		rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK, val, PHYREG6);
+
+		/* Set PLL loop divider */
+		writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
+
+		/* Set PLL KVCO to min and set PLL charge pump current to max */
+		writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
+
+		/* Set Rx squelch input filler bandwidth */
+		writel(PHYREG21_RX_SQUELCH_VAL, priv->mmio + PHYREG21);
+
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
+		break;
+
+	case PHY_TYPE_SATA:
+		/* Enable adaptive CTLE for SATA Rx */
+		val = readl(priv->mmio + PHYREG15);
+		val |= PHYREG15_CTLE_EN;
+		writel(val, priv->mmio + PHYREG15);
+
+		/* Set tx_rterm = 50 ohm and rx_rterm = 43.5 ohm */
+		val = PHYREG7_TX_RTERM_50OHM << PHYREG7_TX_RTERM_SHIFT;
+		val |= PHYREG7_RX_RTERM_44OHM << PHYREG7_RX_RTERM_SHIFT;
+		writel(val, priv->mmio + PHYREG7);
+
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_sata, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_sata, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_sata, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_sata, true);
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_con0_for_sata, true);
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_con1_for_sata, true);
+		break;
+
+	default:
+		dev_err(priv->dev, "incompatible PHY type\n");
+		return -EINVAL;
+	}
+
+	rate = clk_get_rate(priv->refclk);
+
+	switch (rate) {
+	case REF_CLOCK_24MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
+		if (priv->type == PHY_TYPE_USB3 || priv->type == PHY_TYPE_SATA) {
+			/* Set ssc_cnt[9:0]=0101111101 & 31.5KHz */
+			val = FIELD_PREP(PHYREG15_SSC_CNT_MASK, PHYREG15_SSC_CNT_VALUE);
+			rockchip_combphy_updatel(priv, PHYREG15_SSC_CNT_MASK,
+						 val, PHYREG15);
+
+			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
+		} else if (priv->type == PHY_TYPE_PCIE) {
+			/* PLL KVCO tuning fine */
+			val = FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK3576);
+			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
+						 val, PHYREG33);
+
+			/* Set up rx_pck invert and rx msb to disable */
+			writel(0x00, priv->mmio + PHYREG27);
+
+			/*
+			 * Set up SU adjust signal:
+			 * su_trim[7:0],   PLL KVCO adjust bits[2:0] to min
+			 * su_trim[15:8],  PLL LPF R1 adujst bits[9:7]=3'b011
+			 * su_trim[31:24], CKDRV adjust
+			 */
+			writel(0x90, priv->mmio + PHYREG11);
+			writel(0x02, priv->mmio + PHYREG12);
+			writel(0x57, priv->mmio + PHYREG14);
+
+			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
+		}
+		break;
+
+	case REF_CLOCK_25MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_25m, true);
+		break;
+
+	case REF_CLOCK_100MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
+		if (priv->type == PHY_TYPE_PCIE) {
+			/* gate_tx_pck_sel length select work for L1SS */
+			writel(0xc0, priv->mmio + PHYREG30);
+
+			/* PLL KVCO tuning fine */
+			val = FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK3576);
+			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
+						 val, PHYREG33);
+
+			/* Set up rx_trim: PLL LPF C1 85pf R1 1.25kohm */
+			writel(0x4c, priv->mmio + PHYREG27);
+
+			/*
+			 * Set up SU adjust signal:
+			 * su_trim[7:0],   PLL KVCO adjust bits[2:0] to min
+			 * su_trim[15:8],  bypass PLL loop divider code, and
+			 *                 PLL LPF R1 adujst bits[9:7]=3'b101
+			 * su_trim[23:16], CKRCV adjust
+			 * su_trim[31:24], CKDRV adjust
+			 */
+			writel(0x90, priv->mmio + PHYREG11);
+			writel(0x43, priv->mmio + PHYREG12);
+			writel(0x88, priv->mmio + PHYREG13);
+			writel(0x56, priv->mmio + PHYREG14);
+		} else if (priv->type == PHY_TYPE_SATA) {
+			/* downward spread spectrum +500ppm */
+			val = FIELD_PREP(PHYREG32_SSC_DIR_MASK, PHYREG32_SSC_DOWNWARD);
+			val |= FIELD_PREP(PHYREG32_SSC_OFFSET_MASK, PHYREG32_SSC_OFFSET_500PPM);
+			rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
+
+			/* ssc ppm adjust to 3500ppm */
+			rockchip_combphy_updatel(priv, PHYREG10_SSC_PCM_MASK,
+						 PHYREG10_SSC_PCM_3500PPM,
+						 PHYREG10);
+		}
+		break;
+
+	default:
+		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
+		return -EINVAL;
+	}
+
+	if (priv->ext_refclk) {
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
+		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
+			val = FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK3576);
+			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
+						 val, PHYREG33);
+
+			/* Set up rx_trim: PLL LPF C1 85pf R1 2.5kohm */
+			writel(0x0c, priv->mmio + PHYREG27);
+
+			/*
+			 * Set up SU adjust signal:
+			 * su_trim[7:0],   PLL KVCO adjust bits[2:0] to min
+			 * su_trim[15:8],  bypass PLL loop divider code, and
+			 *                 PLL LPF R1 adujst bits[9:7]=3'b101.
+			 * su_trim[23:16], CKRCV adjust
+			 * su_trim[31:24], CKDRV adjust
+			 */
+			writel(0x90, priv->mmio + PHYREG11);
+			writel(0x43, priv->mmio + PHYREG12);
+			writel(0x88, priv->mmio + PHYREG13);
+			writel(0x56, priv->mmio + PHYREG14);
+		}
+	}
+
+	if (priv->enable_ssc) {
+		val = readl(priv->mmio + PHYREG8);
+		val |= PHYREG8_SSC_EN;
+		writel(val, priv->mmio + PHYREG8);
+
+		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_24MHz) {
+			/* Set PLL loop divider */
+			writel(0x00, priv->mmio + PHYREG17);
+			writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
+
+			/* Set up rx_pck invert and rx msb to disable */
+			writel(0x00, priv->mmio + PHYREG27);
+
+			/*
+			 * Set up SU adjust signal:
+			 * su_trim[7:0],   PLL KVCO adjust bits[2:0] to min
+			 * su_trim[15:8],  PLL LPF R1 adujst bits[9:7]=3'b101
+			 * su_trim[23:16], CKRCV adjust
+			 * su_trim[31:24], CKDRV adjust
+			 */
+			writel(0x90, priv->mmio + PHYREG11);
+			writel(0x02, priv->mmio + PHYREG12);
+			writel(0x08, priv->mmio + PHYREG13);
+			writel(0x57, priv->mmio + PHYREG14);
+			writel(0x40, priv->mmio + PHYREG15);
+
+			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
+
+			val = FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK3576);
+			writel(val, priv->mmio + PHYREG33);
+		}
+	}
+
+	return 0;
+}
+
+static const struct rockchip_combphy_grfcfg rk3576_combphy_grfcfgs = {
+	/* pipe-phy-grf */
+	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
+	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
+	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
+	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
+	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
+	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
+	.pipe_clk_25m		= { 0x0004, 14, 13, 0x00, 0x01 },
+	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
+	.pipe_phymode_sel	= { 0x0008, 1, 1, 0x00, 0x01 },
+	.pipe_rate_sel		= { 0x0008, 2, 2, 0x00, 0x01 },
+	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
+	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
+	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
+	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
+	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
+	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x1000 },
+	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x0000 },
+	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x0101 },
+	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
+	.con0_for_sata		= { 0x0000, 15, 0, 0x00, 0x0129 },
+	.con1_for_sata		= { 0x0004, 15, 0, 0x00, 0x0000 },
+	.con2_for_sata		= { 0x0008, 15, 0, 0x00, 0x80c1 },
+	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x0407 },
+	/* php-grf */
+	.pipe_con0_for_sata	= { 0x001C, 2, 0, 0x00, 0x2 },
+	.pipe_con1_for_sata	= { 0x0020, 2, 0, 0x00, 0x2 },
+};
+
+static const struct rockchip_combphy_cfg rk3576_combphy_cfgs = {
+	.num_phys = 2,
+	.phy_ids = {
+		0x2b050000,
+		0x2b060000
+	},
+	.grfcfg		= &rk3576_combphy_grfcfgs,
+	.combphy_cfg	= rk3576_combphy_cfg,
+};
+
 static int rk3588_combphy_cfg(struct rockchip_combphy_priv *priv)
 {
 	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
@@ -775,6 +1050,10 @@ static const struct of_device_id rockchip_combphy_of_match[] = {
 		.compatible = "rockchip,rk3568-naneng-combphy",
 		.data = &rk3568_combphy_cfgs,
 	},
+	{
+		.compatible = "rockchip,rk3576-naneng-combphy",
+		.data = &rk3576_combphy_cfgs,
+	},
 	{
 		.compatible = "rockchip,rk3588-naneng-combphy",
 		.data = &rk3588_combphy_cfgs,
-- 
2.25.1


