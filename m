Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38DBCCF2C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv/fzgEaLHwSOTuuR0+7ucwKNcEXz6nX6gNKEqp1/5w=; b=Cn23KoZO0q0UmtXo5lfrIETj9X
	hp+0BrJfhDSe4ENIAJpf3CEtFJLEy+M28B7Ffzi+WIYVFbATH7Esizkj2tFg+jqw06gfy4TBmCSA0
	W8wTnO19Bn0NidNtM5aW80SQTalvFGfaXoROHNDsQa7u6ioCJnU2xSGM7ALmVHRbiR5dJtxXAxmf6
	XjwiqaAixAlPuYT2R1fnCNDE9aAr8HKLqGGj/B8OzZ1ODFKnhWFyUNqdCaBP+iO0/ss2yhhNyTHKG
	podJQHNPR/xmsMHk53hukiq89rrJOBw/Sn4TwkDTkuFIDnzqBFmeUWUqIkv1ROHlqnLKJtaaazZlC
	IB9H8IuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkc-00000002OXi-0d5U;
	Fri, 16 Oct 2026 08:57:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkX-00000002OR0-3txR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xv/fzgEaLHwSOTuuR0+7ucwKNcEXz6nX6gNKEqp1/5w=; b=VkOvjFw/y7JABw3GKtrzzmt9/V
	s/z+ahfIrvhh9lCL1vED/OApdaP+6S9yssRjzm9UycPsvyQJxN2bBUMsMsw5/kGCH1juX4KEMBeae
	KJMzJm+1RUXGqbiCHNmC9GmPtNQi+dbp72d673OVISZfwkpVYtYFfBzrZvQGaVLlOBZl+p+snVLYi
	IfMJVpluzwLfns7gw9tjE/l/Hq5nM1yuqBuTf1BsySTuPyw0SW5gE8vXEdsZu1orCGYXmpeTP5Hly
	D859NoLpdsqMFYzr4pDWcuHKuXUnCPRqrtmp79AIFlIo9H3xz7c1R3MJkdxgyClHZPAEdQIurp885
	RjTWoFug==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdkU-00000001HuY-2bT5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:57:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2df8e3c664cso5256005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141028; x=1792745828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv/fzgEaLHwSOTuuR0+7ucwKNcEXz6nX6gNKEqp1/5w=;
        b=nR3BpdEwqMVvOBCHttY+LT0M6zmiNrmPle0AvrVha2L6szM03B9ZUMReNyhUv8FAzA
         di2SeKzwRzXILJQ1Lhe0ppuKtPomHAuUod5QZa0SocshzXOLAofpamgonr3P/ADMgv+/
         yUlYG+sur/PLGNwJCxXfjNuJDY2FYbso2unjgS0HeHM7sKtfHU0pIZ3aCckkFpsL1EPt
         3z0neRUl/+1ssxnH6s4RomsBZSbSCBHcZyP2GezDFpGGP9GeokUruSz3tdaPTEVmfofZ
         idLOZhxYow+S+s3gOFlX0w67HuVEl+sA4ygeioSlUu3ZNIcz9cQu5VpQMaAs7RCdCqU6
         SIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141028; x=1792745828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xv/fzgEaLHwSOTuuR0+7ucwKNcEXz6nX6gNKEqp1/5w=;
        b=qhVC90GcqyiR1wiHemtDRe+UC6tqIvm92D5F1GS1+ydfIFJN5dwm2esLSTeE+0/ixO
         qRGGeJDZeQWyODtbzwirJ3HlXMuhkEaJaYxDVR88mSw/juwjVfabtPNstJ9S6F7pEIgo
         GPwatSo0y6u61N4y3wpD7a0rctSDGJTt+bY8duvvW4j6CGerVrWdkx1LG+qE1zXdtIrI
         AJS0Om7lkyBBiwTYGSbsK/skLrHceMi/h/izpJ9C7pciOUuopxID0plA5Ud39ZUc93Fk
         s2Qj4Zx+knFaoOujDaIaVDcJneSRZGk0hWGLW4G4h+CNRQ5Hyjbbw6SeOYWaTSwtfSbB
         RkPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzniJ3yWuFyIpzMEueihazXQ1X/tMxHEu1QKa7/1KgT9ypwCQRuLQ/CHccPUIFV4jEuyegL/sgUwGn23xr0wvPu@lists.infradead.org
X-Gm-Message-State: AFq9FYIgz0ixOs4IL9G4S4MJSLI04zMOIQp4y8fxuQXCCdsx7sMiDazk
	vvkG1RVUr4xzfATmxoPTG+8oAGaIAh6163CS113htMY5+auxVTXMLFAX
X-Gm-Gg: AYBFou15yhd0SDCIRIRyvtqwrATKHOovApew6KHNhTXscxsdwKCapuXHPFFqVXu5iyV
	88Kk/57MY+ImhgWOl9iqDZAZYHTCLZs8Ptd57D0Hauky8rqF6tBDdcvjZzvGjliYRYaSFviRA3g
	JNdq/nGxEm04CIaBuWHU+IdkHgFDTabX3sFDqpcgP2GlIH/NVZnktLVJUo1LQ9Sofk9ExV0bdtE
	TgHwUC+MXPJ0If5b+akdE7RRmFeuolbwscTQWygaBmGTSDzNCrN0kboAFUnIGLQRnYohYNPadGJ
	IIHRYPs8vwhPTTMhy/+wfF4EFvLVTMj+vT9HZXNc6qx4F5Ehv6KFBYyPLeYG8lP1VvllpqJ9XQy
	UhwaEx7m4d6+eGl0vFtb/OfGjhAFGBbWeYFh+WTXQgQqCj/W6DKsvPHjK/QCCxCDPW5bo4kFO6P
	0UKGoi1xQ3RqgRLqtnieY303ageJhau26qaNLO01d8gj6zjzjz2KSiT7YROe7/320Nfm4I1gxla
	0edaeGsjUmJGp1djdLfnmSjHKUVMA==
X-Received: by 2002:a17:903:1251:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2e992644a1cmr12846855ad.1.1792141027903;
        Fri, 16 Oct 2026 01:57:07 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:07 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:39 +0800
Subject: [PATCH v5 5/8] phy: rockchip-samsung-dcphy: Add a second PHY for
 the receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=4721;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=lmQQQHnNl4r4tGiXOJbghuVbF8/OCluaIwoRthxoOuk=;
 b=o82DbajtlVgj9pfMdMky1HoLutaNEmktGT4Z3sgMNNpl0U5mLIk7MSo2mxqacAFMg1/7Dl30+
 eBrXn2uM4oFB7ck+YG5jMlU87B42qioRn0lkyuEEZnrShidfaV6uW3A
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095711_008820_CDED7E83 
X-CRM114-Status: GOOD (  19.28  )
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

Give the receiver a struct phy of its own, with its own phy_ops and its
own samsung_mipi_phy for the state the two do not share.

of_xlate() takes the direction from the second cell and falls back to
the transmitter for a single-cell provider, so existing device trees
keep working. It now rejects an unknown value in either cell, and a mix
of D-PHY and C-PHY consumers, which the TRM does not support [1].

The receiver's callbacks return -EOPNOTSUPP until its bring-up is added
in the next change.

[1] RK3588 TRM: section 22.1 (overview)

Assisted-by: LLM
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 69 +++++++++++++++++++++--
 1 file changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index e4293c8d2b29..316d4c4d49c1 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -296,6 +296,8 @@ struct samsung_mipi_dcphy {
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
+	struct samsung_mipi_phy rx;
+	/* PHY mode, PHY_TYPE_DPHY or PHY_TYPE_CPHY. */
 	u8 type;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
@@ -1511,6 +1513,22 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
+{
+	return -EOPNOTSUPP;
+}
+
+static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
+{
+	return -EOPNOTSUPP;
+}
+
+static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.configure = samsung_mipi_dcphy_tx_configure,
 	.power_on  = samsung_mipi_dcphy_tx_power_on,
@@ -1520,6 +1538,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.owner	   = THIS_MODULE,
 };
 
+static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
+	.configure = samsung_mipi_dcphy_rx_configure,
+	.power_on  = samsung_mipi_dcphy_rx_power_on,
+	.power_off = samsung_mipi_dcphy_rx_power_off,
+	.init = samsung_mipi_dcphy_init,
+	.exit = samsung_mipi_dcphy_exit,
+	.owner	   = THIS_MODULE,
+};
+
 static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
 	.name = "dcphy",
 	.reg_bits = 32,
@@ -1532,19 +1559,42 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 					    const struct of_phandle_args *args)
 {
 	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
+	/* Device trees without the second cell describe the transmitter. */
+	u32 direction = PHY_DIRECTION_TX;
+	u32 type;
 
-	if (args->args_count != 1) {
+	if (args->args_count < 1 || args->args_count > 2) {
 		dev_err(dev, "invalid number of arguments\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
+	type = args->args[0];
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY) {
+		dev_err(dev, "invalid phy type %u\n", type);
+		return ERR_PTR(-EINVAL);
+	}
 
-	samsung->type = args->args[0];
+	if (args->args_count == 2)
+		direction = args->args[1];
 
-	return samsung->tx.phy;
+	if (direction != PHY_DIRECTION_TX && direction != PHY_DIRECTION_RX) {
+		dev_err(dev, "invalid direction %u\n", direction);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * The TRM (section 22.1) does not support the transmitter and the
+	 * receiver running in different modes, so the mode belongs to the
+	 * block.
+	 */
+	if (samsung->type != PHY_NONE && samsung->type != type) {
+		dev_err(dev, "phy type %u conflicts with type %u already selected\n",
+			type, samsung->type);
+		return ERR_PTR(-EINVAL);
+	}
+	samsung->type = type;
+
+	return direction == PHY_DIRECTION_RX ? samsung->rx.phy : samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1620,6 +1670,13 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(samsung->tx.phy, samsung);
 
+	samsung->rx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_rx_ops);
+	if (IS_ERR(samsung->rx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy),
+				     "Failed to create MIPI DC-PHY receiver\n");
+
+	phy_set_drvdata(samsung->rx.phy, samsung);
+
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))
 		return dev_err_probe(dev, PTR_ERR(phy_provider),

-- 
2.43.0


