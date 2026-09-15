Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F5C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=; b=AQ2kk/wdqXGBPYWxNQMmO3YHi0
	QwIDgleCaEPHRZIcdwSumvTD2YM3NJPNoblRQ063mGSUQ4MsRpEL+3iIXNMXkxxM5RwUrr3mLPKZY
	m6rQApt9uepqt4MzXqEtduj1mjupma0qI1fDZQXdc6/F8AllY5Qugu9/452DDnyeLAc+6UM5RbyQV
	eyfAcXPiin9LjzwaKCiGqxmMooBoIZ/BqVvBJtVAaoBjnJomHmsw9hkH5LzODTcUq81XCarwx6P3o
	+xKhu1WITbAMvQgIRd5+bYsMtjXQM1d4o3czEA0JO2FYGhwSRyI7KHa0wxbcokiRuOJ43Xiq3DYMh
	KW60VL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRH-00000006XJU-152O;
	Tue, 15 Sep 2026 12:39:07 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SR1-00000006Wsc-0UQ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:52 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a0a87595so4265857a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475930; x=1790080730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=dOStY7P7koO1L2qM8N9dyY5qvR6Usni8ZE1CxiHqRCLQn0KTWBABSyT8eoqlNjM818
         o6tne8uPtMwftZD0fVjZPRsxJWxbAD6WzCnfQlkBDUvCKFk5UIzBQK7cDph+L+FbrsIi
         EsBjpDWxZE1Y7Kz3/wLzzlqnq6Kylp3A1I847s7iF75ZqNy4dk7AHYAYAgQii52ADpoK
         HKY8M5bXBk7mruu4AsZ1qv9ZmPpaHldt4XfiFvnODRc2gRlPrdKu25Q5kkJN67Pwhnoa
         oopvOFIPXreN1q63170bzJPdcBU8JbiDa3EbiMthnNvAgtGcXzDUi5o6Yn/nz1vO+fUO
         b29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475930; x=1790080730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=IiLGy7U3L7wBTtdtkwTfMxmrZbUUHgqoxlqO1RGe8YMh5SwPsiO2rComqLwXpmKnZe
         /AXJdwSkA2uBgxbpHcvxXD8RMwV46CDK9EmvH6ic7ZxQn3T3YlcE6zwIlLzkUmfYFR1l
         k4o9x0giE+y9NfGzIzJ6VkuPoxc28x2g5Doc22dSTYpM7qjDJE0v718FZaYbtQ1PnZL2
         9JaEEGpQemD/a2s0WOArubvQHwakRJFFug52x2IlfvhpDkW0LPfGCRhUK1RS2RB3Q/UF
         td/qFEcQLRSFQt6JuTnHqhrmpKCbeGqTaVbIcoJNpOeU7MaAInfIpaoyhRQUb+JW4ZgQ
         cVfg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ0Z1dgk+nEXAuPSJ+in6Es3xwZDnR2FN1gDgzvF4dfI1tyjkaOZMEOmEO7y79ctW8eeRM0VfHItT0P7QaZyWf@lists.infradead.org
X-Gm-Message-State: AFuF++kkdoAGxExC7SVToBGjMu2Faoz4JXwpF5mkf2sRqAFORRDddJNO
	6dkRx+uni9sJ2HucHgUA4gOUPvI2po6RtLqOUCSuMGopZjt+sGYk3DRB
X-Gm-Gg: AYBFou0ki0jedPZUZVUdQQCXfeJdMsuGmhaNSYX9gCVGpPK8ZCsvVqRV89PCtGVA/hp
	D0ieu46KS0ZYobjRdlS2yLcK7hGD6iZYlZ+DLDPNBfXcYVDGogOiMWnHcBodweeYcFFt+BJsBDB
	MsrjmROlGjpPwdAE9T6sX8NAeuL3sgSob1y68VXofjx0PKIWqaBE6S1ICttxtGVAi9nQ0SRkCKK
	+EMqeLlwfwwuv/fNuaRezY7nXVFvJA8t0bf8/MBTrbfusTJru+L5bkYFrcGccMdXsUclCyvfkvT
	Ph0N8ryIbg7ZDHMlvK6x/rRGrSFkDao4UPA4oMro0/gRF2jmN9uYYT6001IlxJrlteE0fmpSjuj
	gvxR0zujEol8nQ7QufdRZbMTpFNgOzw9sVUa0jUgJo0OZ9M0EDDpahZ0/iGBIlBDQJgUSGXg4EL
	GThLQY16GWed1KlO2GgAjL+5px2kLciwLbBDOzSOIST+3q4ZPzvme1avx9d99MJCEakyWIrw==
X-Received: by 2002:a17:90b:4990:b0:39e:ad:d31b with SMTP id 98e67ed59e1d1-39e10e2d518mr1347485a91.6.1789475930366;
        Tue, 15 Sep 2026 05:38:50 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:49 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v6 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue, 15 Sep 2026 20:37:52 +0800
Message-ID: <20260915123802.1561724-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053851_174756_314400C6 
X-CRM114-Status: GOOD (  17.11  )
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


