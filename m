Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839D3C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=; b=UPSVOZkhvfcZVETlB2vwd6eHSM
	AbD+IyRMiiWga4XHtLEtHcQTW/IF/Rw3GDygKI4SR+IEnnHha+sN2D+r0Fg4lNWrXOkTdvFabRiSX
	j6tvzjRpBBSPdP/KlosgeUJhBJLaKKBF719NL0JefmI/QgLhHjPm8VAj0M49tMIAg2PbLLTkeZLmD
	A6SKnGPJCxrQxlV0Xc+c+BTZ6fqJypt1pYLZqh7O26/NMa2RH7UruY6Sp5EFLi6RNfGGDA7nGwpiN
	2nRV/wLUsfw3DGy/y8KmriF14qqXpirOUGB+Xei1P8f8j3O84nQkSLkQQC5H5dij+GeFkHYbt0Ivo
	7ujug3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96iu-00000006Twj-0lwU;
	Tue, 22 Sep 2026 20:04:16 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96ip-00000006Tss-27Wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:04:12 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d952ac253dso1214645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107451; x=1790712251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=RQ33PaUAFA7Y5jtx+pSj87/vvjNlVDxmriKhcycQ45FXtdPRlx1vMvN4v/7gHZNwaa
         vJ5UgvnN752O8dTDqAxqMpNlAsBDHfdCJyt28hFVCeOD/WGV5dEr7TUzNFe6We8aSysX
         AP7OlojCW/fkpbHrFJextAb3lEA5Rz8xo+a4+fdKBeIv+ShNX4zLoMgfaZ/tMF5zZkfY
         NDPLPuhd/F2y9fcdMZVNaZ158MkxV7r+/4kq0w1kKSHi6MobPt4lekkexfqJH9XpEXX7
         G+0jfIv0jBiNn8iyzAWOtxQTlbuBn9Y971qoCVcPU984h7sp0CntJ/4zmNOLcKNEI51O
         oicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107451; x=1790712251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=ratq1glVK//ugekaS8+gYH5Hxm4mLkNfJRP7PH0FGb5Ugw248nOfGSslxedioRR0hN
         TiHIHtrkRvfgUshEO7i1OLZl7euL9nSuooYCaeD5hG6v7mokv1k240ic4zvNg0uOY6Tn
         hYV4TsfsvFl5f6rEBdz+FD7V6UbAXxIVweoYFMKUX2/RTPRknxlIzwu8OdUPIGMeThF3
         UR/NlvuSpxGsdPNSKR19HuVMCPZGhephwoclHqSKeYNnnm6yrgl76c/9Y20MnePIAcJU
         nwYQL4DzFlXM/9gUWJpZoMpzpp8AZjSYu52TB5Jz/HZ2pDHFkHvTi49foulqA4mng1Fi
         KGuw==
X-Forwarded-Encrypted: i=1; AKwUvBwHa8GlmWYYsvfhxcg/nWyawOdAls0yQdSqX/3F+EWDbGytHgQUvZBqwoe21gw8pIOrGBwspJqn3olVh8CdT2Ql@lists.infradead.org
X-Gm-Message-State: AFuF++kx/K2d7lWEY7SLUCmKN14Op9p+bYJwNAz9iRWAyqC1h9dNI/P+
	dLPkjtT5+c7bjcOtT0uKWii+hBJjmdSvEdrkaLbvqw9VnvbJ5hfk+Tky
X-Gm-Gg: AYBFou03Zd6OP6lRmIu47AEusbfTufIp3UGx812vVyxWVQQIYYYRHOa4ICP0A/CR3Om
	i+JDvcZFM+VNMH8JPM9lM+M4kcG0CoRN7McvUOAVuUWXK/VWf3MpgPKextE9NxLjY0gnzb7A0ok
	CV1dfB/QLOJLUNh2uZ0sghpPIhyhBA1xaH7boBlvtgtOWkcROwEUEw0d+eGupfJ1bBbRVZvGJUV
	qdYP1+r9qAKvFNOWF5XMDR7gdKqdpvujxHYsxJ+HCicJCn0FfIHazjrMrw3JxfwFXkVJE8uG5dn
	uCtefzpKStNpLD6LdXEhlEGab95l0LrHMcS4KQfpjGE2Imsolm4ZbYctQ+2c4oiG/zkWGiQY8tB
	eZVquGN+k6JE/c5PBoicgO9g6MxF83pcm+g/wlx2zbIh+UCI+ylKrIdoRn7X5zWpsPvPBcaqkly
	xAMOp8PjpbgldvqGvRv8J9onbt8kE9bR0Y6eMSxYQDuIL20AsKQYqq00AJ/kEAc1C47iar
X-Received: by 2002:a17:903:2302:b0:2df:6969:7d5d with SMTP id d9443c01a7336-2df69ddf0c0mr4048995ad.40.1790107450787;
        Tue, 22 Sep 2026 13:04:10 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:10 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed, 23 Sep 2026 04:03:27 +0800
Message-ID: <20260922200336.2201212-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130411_594669_474BED46 
X-CRM114-Status: GOOD (  17.56  )
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


