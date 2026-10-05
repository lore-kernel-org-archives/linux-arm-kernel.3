Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A140CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=; b=loR99snMQ7OaW545cg4+4Bye9D
	AfBa1spX5KyM3a2621ZsvUyLGWARiw55KF8T2O2NW9T/ggP4wTQHKE5pptAAzYGR35QMlzDo79SF8
	2pcBkAjMQVNtyJhGX0BJXGFDqNM7inIM+Lt15jIW3KXSlNGXWBH1TXBu3RPNPgMU61gBwTGcgfndX
	VPxGkx7ZxEDcjlKSA8EQ5eSB3sgoo2fP/nIwNc2oPbo8rT3icwdLWalRB+4GpbGa1S5BiLYSfhoY6
	u6N8Ms7HILQgXEUqS+6w1JFaftVOXNpS7QVeKXsjsZGF2gwfaAahB73QyglxXJrVfTr3TY/G02bbZ
	enFLwm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqvk-0000000HEr2-3D1D;
	Mon, 05 Oct 2026 22:13:08 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqvh-0000000HEo5-0tXG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:13:07 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-3a51696a650so1320869a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238384; x=1791843184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=W7+ZIBCc8Dcw5kTrlrei5v50K3ESzZiX4ei0H6AF6O9wErOJ9Xo71sIhmLtba+i6V2
         3sDHEsNGkyxrjGUUXvvpeFmW1gfiXHDcRMLyIV6pgdc9ldL2KBX48Y5QiJyBj62KlraO
         LCzQ9ozsaJcK2SnZuXdtE9rgbrInTmASlvJfe0LR8tH0MoG3FQN4GMS6VnVjWMn8v5lg
         evHGbU4BSGC2kiUBGO9xzU7Nf6b9qC+wASA6chU7MrZT3AXRR7P5zaiWy8AFEF9HCU4r
         DnaiSD6l9k2NgkU9FPZM6/vZdcgOwaQtQCD+hJTSXMKQzAQ3e6rq3Yx7jWA61Z+6+AXD
         FA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238384; x=1791843184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=ysu2B0O7SxbWWvuIsd7Y9AGCfmX3PqrNyzX+47y9Cjr/8ZIN7+c48AIoiiRBOOoHon
         V3lvzbylFNlT+dXmfU31l7wjtmkPpwj30X5cfPTlXtcIvLvaw0jiNDjO1BJBFxL1Joiy
         Onjy8/stX6a+WYWepxaJP69QvC14Od7ifwhmtPNy3dpXoQpefHh2MhStdMSShDl6B5jU
         MrNhlw7zPORydZImUqc1H8cO8LlwnwZF3z5HsuTT9RKAt/vkZyUGEqpo8oiGDLVdhc0D
         eMRptAB9k+9SaBvgbD5o7b9hwPUoX/xXR2EbB+IxpHdlySUvMVVa8+M2CuXL4658u9z8
         jFKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaC36ntZJgwgBBAMT5p+U02W+ishwgTi3pve0H74rat2Mg8lYXDhzYDfcn3oZdbIgp/5rwXR9RT/lFF6BVJBGz@lists.infradead.org
X-Gm-Message-State: AFq9FYKqHPqkg4/i5vbgsR35xsk6nXza7aTxv1ltxlTfHzja9TFDzELj
	p6u6TxcTqzkJvB+tV/iYkHLJP42UT4icRB0dkwdyB4xuBkyxwQqw0Cb5
X-Gm-Gg: AYBFou2Ah1qFN4MdyPct5xpagTV/FzakigIyQQC/u71rv36LE1SDfbY42pEUvVmjZSl
	ZffBXJlnJQ4aYJJgQKEZY31/QC/qXa9cmQfRIVcXyy92hpErh/XcRYcZ5Hh+yfk4Zc2t+AFdlAq
	TLfO7ZL1Fpwn74VhyL5ZqCh4TbXlQY5KkKaHtCDky/zwcDzYzP4KdA3HpJGu9Xz7caM6py15dHR
	GHOr+kt30Vfx574vd9Ga2gQ1GA3gkL0pyeOgT9DyQJBnOCG9AGTE/V/CbxnhJEQz+XYTjCfVCNm
	/t8HyZz3M8Q02rn94wdqKSIxV5R1VsE85Qf7fxtivDZkyjhpZf+mcboRQAdevnMWYQMnMDVWuOo
	N159TGLjDg0tM8ygkzQo6cLgSci90x2J6EC2ZKD/M0oe+9zZfYmk2Rlu5Nu+gFLPUtotBDvGi3R
	My+w1WgPojfkF4Lpmi3eK+Ti7160lnSOrtlc14hlLKScBE6D39uxbgochGfPHskbwN153e
X-Received: by 2002:a17:90b:4ac3:b0:3a0:a781:2c39 with SMTP id 98e67ed59e1d1-3a6ce3a978dmr10937659a91.7.1791238384372;
        Mon, 05 Oct 2026 15:13:04 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm1719425a91.2.2026.10.05.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:13:03 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:12:29 +0800
Message-ID: <20261005221229.1095843-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005221229.1095843-1-coiaprant@gmail.com>
References: <20261005221229.1095843-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_151305_268607_EDD59323 
X-CRM114-Status: GOOD (  16.59  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the GRF register pipe_sgmii_mac_sel.

Add support for this selection by introducing
the "rockchip,sgmii-mac-sel" DT property.

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
remains at GMAC1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Out-of-range values are rejected by dtschema, so the driver does not
duplicate the range check.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..7b867e7520064 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
 	struct combphy_reg pipe_xpcs_phy_ready;
 	struct combphy_reg pipe_pcie1l0_sel;
 	struct combphy_reg pipe_pcie1l1_sel;
+	struct combphy_reg pipe_sgmii_mac_sel;
 	struct combphy_reg u3otg0_port_en;
 	struct combphy_reg u3otg1_port_en;
 };
@@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	priv->sgmii_mac_sel = 1;
+	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
+					     priv->sgmii_mac_sel > 0);
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3


