Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB66CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5GHjzqrk28FffPt6wY8dDf5xP519k7dLJfQtCczhyU=; b=mB2ynbbMMpslOmw0Jtydrc7+nx
	fEJWvU8esf7R3n5jRMYW9qBVWJRPSLvfDAa+ISVlz0NGaMlNnoMNCvf/uDe4Jj7IU/LW+oSSdv6T7
	YgYWrWN4YN/ZvPOgp9qYM0euq3wQiz2UgY1GAbH7bQ66W+Tw40c3QBkgddRl9TqGnY8cshbyGc8CG
	2kfo1s71YmxdntQcCpPSAsHvCHjGo+AD586c/TkYidOVZT9KO4ASIkKLpKdg/yZkp8lxnV5oJU31W
	dWcrnC6EQSjfmIkQEI/hclASo2nywrcZuiS2kfkk33Mm+Koh/N9gbucBqF22SYXAhGb9J+AtVYvWX
	0xtU8WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE81t-000000018Y8-2b0R;
	Tue, 06 Oct 2026 16:28:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE81s-000000018Wy-45UF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 16:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C5GHjzqrk28FffPt6wY8dDf5xP519k7dLJfQtCczhyU=; b=Q4Gz/RsaXi0BHCvYMMHJNKVeaA
	tg0IXHwLb2Dn+h5RhqasOA7d5yb5Z1QnzzqGc1ujYAG+R5GYFAvFyTxIIhMttWRrWo7tQ7m4XVmAT
	6etlksHIrzFVUOTnmXTTWld9C5yuGp/S+Y6PV47GjoTC+a1LMl0UfkemtSgVLvlw52qN+jFajj8h2
	83M6SF/NaQpNR7WqYgCkLCbLQvwqfnmxqqZTVR8T+RM8t+H7qY767qaH1rsNDtwjneXiLXcutkq03
	bK9LaxkQG27Q8cslIiPtequcDm0dA60PxJ4gdha/Jqikj9QfGVm4QDeDTHRVBMYD54MLf103rcL7D
	9/30wD0g==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE81n-00000008raJ-17L2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:28:36 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so425983a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304109; x=1791908909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5GHjzqrk28FffPt6wY8dDf5xP519k7dLJfQtCczhyU=;
        b=nRP2NeO02CTJR2376uXwO1yuornSuebTw5XNQm3PjxNnM6psdjgQnnr6jvnHgjzDnY
         aUAsVJMZdjvG2XS0Uqqj+Kfxw8rStaWDYkRKLH+fJHUiSCYxHRJ6cQmpM8hyqt8Zu4VZ
         F6xkuE9l22RW9DXDfeIX+rkYEP4C6uj0qjimGdgj3KOmR6aelcl9u1FHMGYgahR+TeWj
         P4QFVh2ZKdWWyCLilLvDnd0Pzq1YcTW41TLwa16ZxQDcaABfPEnHBQc9BPpiQ3VOg358
         ye2BqCSTbS/K6jfjtm1XO/sAZCzL6AS8P+zbgPPABra6Xsn6Rv8vlhpeYNi0+StOjeVy
         EBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304109; x=1791908909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5GHjzqrk28FffPt6wY8dDf5xP519k7dLJfQtCczhyU=;
        b=D8gG52WPVcg81WshJWwgObt5JZniYfIJZuAvdjHhJJGJTOpxAZJPBkjme+5kX+XKZR
         thrkSf6v+vic0CQUAo9FDmMViZ3wrNlvTbZoh4bIh7eFQ6b2EWpeorvVupK5ppn90B6j
         F9QvUqBbmMssnWvevA2X06BrzeZ4wWryl9MfrnLL1pZyF9unrrlZKI1+xS+Y/G/BDL0b
         rNSLUScscQ59UaEtygPN4hLaUmgAM3cs4bhbHladnMFaG9cy6nVz4Cir1SYJxs7UlcSk
         9RN/eDFx0IDyogNIiYjLb1doj/3YV3IvzTuAquuNiELBDN3qr+D61t5uEIh3mS4o8kWX
         dDIA==
X-Forwarded-Encrypted: i=1; AKwUvBx/qx/ukGuSiEvcUeMaqLkq0OrL3iYIejhjyrv9RkH/I8esE3DIpex5h7rv9LBMo95AiADSSan75hHFv2UniTdi@lists.infradead.org
X-Gm-Message-State: AFuF++mBfyv4+ktK77ERNGQSE7J/ygiv143Qz5YuO+HwD1xXU9kU/O9o
	sWKeK+y8sffowZ9xoAnhL8KK0xLdJ5++AK/PqkvXxhATF0uQBAAcSsXO
X-Gm-Gg: AYBFou14emRR3YmgBK1G6eq4678Y7+bX+J1IMsveohcQplbva6tZuufUcLNolbLw2Yu
	7aHPGsvUrDrxWAZPrHpJQwi5czuDDlIuxv4j6mllLhy0DaxkwuCenpSKyJWYBp5uWjmr5lbGj+D
	fQ9LjGU/CRsRG6jZiYrXlvc90ukU4EiZMBoExKun6uNYoOsMOSrDdj41bn+KwbKNGismYN7SAGF
	24S77THAQA+refl+jt+tVWi9WhHewO/BY8XINXV+iPRc/tuQol1q4rojMqRWkbs+OOJDubywXmp
	O5UeLW1H7X82A2SSaMNw5s9oOFxIqsiP6V4ljdLvRD2gsrdaPUntFlXKDPVIh7D4hwtkpGW8iVA
	BYuzxDY4zBlX32zTjIbfoSZkXjDBULHXIgiaptJ+WDEG9JBKaG+vsj8YKWj54FuOJYmEYjCFkLB
	+V1V2g0Zjo9YEkSdWdWOPqf10aaTu+d7eLAkNPRtT0fhJWjuHrL/rEUiTiD/AzIJjx6FEp
X-Received: by 2002:a05:6a00:f87:b0:880:e0f8:2d9d with SMTP id d2e1a72fcca58-890df9992dbmr1806155b3a.55.1791304108962;
        Tue, 06 Oct 2026 09:28:28 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:28 -0700 (PDT)
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
Subject: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed,  7 Oct 2026 00:28:06 +0800
Message-ID: <20261006162807.2843858-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_172832_488333_0FFB1A30 
X-CRM114-Status: GOOD (  23.07  )
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

Add support for this selection by introducing the
"rockchip,sgmii-mac-sel" DT property.

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
If the property is absent, the driver leaves the routing unchanged,
so the effective value is whatever the bootloader or hardware reset
left.

The driver validates the value and rejects anything other than 0 or 1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../rockchip/phy-rockchip-naneng-combphy.c    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..f76b48009673d 100644
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
@@ -212,6 +213,8 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	bool sgmii_mac_sel_present;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -341,6 +344,7 @@ static struct phy *rockchip_combphy_xlate(struct device *dev, const struct of_ph
 static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy_priv *priv)
 {
 	int i;
+	int ret;
 
 	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
 	if (priv->num_clks < 1)
@@ -375,6 +379,16 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
+		ret = device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+		if (ret) {
+			dev_err(dev, "failed to read sgmii-mac-sel property\n");
+			return ret;
+		}
+
+		priv->sgmii_mac_sel_present = true;
+	}
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -803,11 +817,34 @@ static const struct rockchip_combphy_cfg rk3562_combphy_cfgs = {
 	.combphy_cfg	= rk3562_combphy_cfg,
 };
 
+static int rk3568_combphy_select_sgmii_mac(struct rockchip_combphy_priv *priv)
+{
+	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
+
+	if (!priv->sgmii_mac_sel_present)
+		return 0;
+
+	switch (priv->sgmii_mac_sel) {
+	case 0:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel, false);
+		break;
+	case 1:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel, true);
+		break;
+	default:
+		dev_err(priv->dev, "invalid sgmii-mac-sel value %u\n", priv->sgmii_mac_sel);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 {
 	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
 	unsigned long rate;
 	u32 val;
+	int ret;
 
 	switch (priv->type) {
 	case PHY_TYPE_PCIE:
@@ -873,6 +910,10 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		ret = rk3568_combphy_select_sgmii_mac(priv);
+		if (ret)
+			return ret;
+
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +1025,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3


