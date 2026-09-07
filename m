Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C2C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3aEYb5uf8Ywd6IPUhePKv9EQrcFVFS6EHQyfufoEjE=; b=y8zAyyS640nPKc/KFbRH2TyUrs
	JviO8NLgQpttYbav/lDmg/t9cs3q3a5NLpVOdoNUpDr5hPm7sd0OsX2mebB/DUxoLD027JdV0bmZS
	SMZqGc8ao8UI8tFYPGUK3aGqp98wwi9vZQuP1+aFkg8+eVdfE0/xx04EcFPsAl6G9m20kJ4rk+mML
	3frJo6m9M6wWZYmVXtzoTA9y7w82B130xoZwxNp4OufLakrilKgnD/lsXrnksB6Xy/TxwM+DzEIjE
	ZG/8Nsh/9vaUi9y6TbVjain/dpFbyivNrtxHJpLU6tzFWV3lmohC9opaJfuWEfWpWKucu/CcTUjSo
	cHTvB0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bR1-00000007C8A-2whb;
	Mon, 07 Sep 2026 15:39:03 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bQx-00000007C3y-1mhl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:39:01 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-39641d0dba5so2300778a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795538; x=1789400338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3aEYb5uf8Ywd6IPUhePKv9EQrcFVFS6EHQyfufoEjE=;
        b=ACEQ/m2Qja4J/+A7oTgsCHEVWTMIf0u8U9slDolK5bXSZUiLc9i5wP0q8/DT/+NJXt
         MZdUeJJZ0QSK9H/Wsl3erPpSfth+0yhutrfF0fAXzwrwjFn3YKIvaYCbDQ6qrBs92U1n
         GOOr5rbFPCtMxFC5J/QcquRKxgRCM0Ogqg/tUnh/foJ7UHn0p6J3twoMDrRJkcMCrBeI
         RynS++HW1iT9mxW1SZMzAeN4rZ4/09VOdHucpwgOFbvvnmJ7nDo5IVAHcB5ajdvJV4J+
         sLFru4K3Y5f70FFCGSxrg5+pqKXvaMfz/WYTEqHMRIVLFp6EDul4D4cNqMkJKnDLJk72
         5WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795538; x=1789400338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3aEYb5uf8Ywd6IPUhePKv9EQrcFVFS6EHQyfufoEjE=;
        b=aivnpnrlVkKyn1i9V+iDVq6QSLPLXpXmcqSdX0g2CrmB0934w27Svv1q7BkMxEAlkk
         UjQxjqD85YrKWWKshPWZiWiQjCJibexSyH0knAHzk00Sae50ieUDy3/f/k8N2hTO0VBc
         kN1LQv/IQ5BZN/Nedb/+qCmpuBTHKzrKMFGDmD8yXfSPuuIBE+D3OQekGzIrvLjn5I5e
         qbA4R0RlYb8FzyZNIvXOtBZC8AgHQF0HoYkV76xuWq5hlSzrIre8ea1asozKRF7+SJlR
         lGU+yjBWVi3OJiXx1PpER1g8Z24uCKr6DaVdZGrav3IlM3qNSPfKs4B4PalZTEebPXJV
         PKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdg7qGgtQ24YZOIpf7FV6GOLjHU0r55j+ecCNR754ujNqqZ475sMwtNEuYX30AISzufETVSGb/HsGh6DNtDw7J@lists.infradead.org
X-Gm-Message-State: AFuF++nBIF34t9ACmq400H4vWqxDWD5QFJaSGmJW7Jh8hiwldeyDScX+
	55KqczD4IWTTAz3PqzoU/mEapDt//U93JVoxLWG22T79bCjFHitbEwwZ
X-Gm-Gg: AYBFou1IId3VyvYeyIpcsXs9s2iKuh2JRh4q6auSzQxq22BBoSba/tbyq8e2unG3a0Y
	V9X82AvFwNZwVsr1ro+4e1iQ9dzq6QkZfA04WRO1THsDGKs1+/61eBk7KqDPJbu1ger2C341gj6
	fmdJqJaToNqGMYdgsU5pPLXZl5I7RkC4o6kANcfp83C8uWCj7HHQFn/t1Y13Niv52oZGky3eva0
	XepGWizDAEo+JUCLYufNSUFOKGSubjVqacYUmm3qYS972DEV3Ay4WQhb9t11HyMoxPH6kb+vmoQ
	gcHAo7D3T98Mg40fYKCafLM+Q57z3hy1KpbuuZsGaTLcr8yEXtn/TZACgI8mQ1XtpILaslDR5RL
	P3tKCdkWC4fag0ZAmIpxDkEi/L6A4/R0xZKWzQY0CfB79c2TUaZ5jBEPfpHT+ldw9EHrzTtkSnX
	4/6+gWEs9ovig8cpdYV1wtp7bn/XuID3ONjl1zXEPIJKhMcy7w1P/cG93EgEIt
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39b260feb03mr34662494a91.4.1788795538351;
        Mon, 07 Sep 2026 08:38:58 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:38:57 -0700 (PDT)
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
Subject: [PATCH net-next v4 03/10] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Mon,  7 Sep 2026 23:37:06 +0800
Message-ID: <20260907153713.2572547-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083859_484215_74EC6D54 
X-CRM114-Status: GOOD (  16.34  )
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

The hardware reset value is GMAC1 (1). If the property is set to 0,
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
index 7843356a4dd47..919bb97a4b182 100644
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
+					priv->sgmii_mac_sel > 0);
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


