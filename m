Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E8ECA600A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQePSOktcZsNwbFN9JzDoxNSE7kDsX9flymDNSHZKFQ=; b=uiR6DhNlvAPeL/cNVhNihvY7EX
	VxDTHeXDVF8LkLIFCHXWoJARfnq/ok/BonvX9NA08fzd13UJ+Hx9L4kzfsv6ujg613cb7hrpOzm79
	X2oqtVUmivp5Q1hknDdPqMh3Xc4vqntf+wvfHDfozIeydujHn2iYf3evWn5dZQhTW6r4IKepjxjp4
	1kZ9+EfF6pdUNsmwJbZNNhG1WH8kipTqgGDu6YhTVjiExRh4y5eEciiP6LBRafQ9srMS8CCjRnqYx
	TrNzcqax4J4EcoSVgPhBbU/393U/jmRwbPNPBzGumr+j8utMCCFXpzhIXfuebcqAjariizuQ5TL3h
	YcTEOHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyy-00000001wSe-2cm5;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyu-00000001wOo-0Cu6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:34 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso977000f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361590; x=1791966390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQePSOktcZsNwbFN9JzDoxNSE7kDsX9flymDNSHZKFQ=;
        b=CaANrLCahjnMsF0MdhtcYuHCqzRVgiL/qm1wRra7zxjzgWQ6HK8rK6xRIeydjNgFNi
         FWyHKzgCG+xBFVpVQj8PJMYyL00dF1rWgBiYKx74j5y+JPMDY6+CymBtM7PHXfG75q7A
         qCdRRCyEOfuQw6ZFh5OlUIsSfl9QDJ016mzLPWznA3kiUUrxCxJXpyB0kGM/DXWRi1Rs
         HJFCyv/2uTzLu0ZaWdRhNwfEMxOvJxvJyVi7upu2B6EbKUsMW8PLsXN65NWD3lY/vDNh
         PXun7Cg9aRNMq+714AwSMyfxzypjlq2FRtJSdQ26RwCKfCTr2+W7wsm6t9hLANWgRLdz
         6Hkg==
X-Forwarded-Encrypted: i=1; AKwUvByf4AzLyLtoyYA9H/I9qxC0AAY6hc2XIeAtKUjENZQzLI/a2iu3jzlxtqgNWF53Df2Y2l6FISHg3EOKB/XqmpSN@lists.infradead.org
X-Gm-Message-State: AFq9FYIKhFoiowRhNI0yC70y9By5ZP+s/uPeux7Q2BZ8GMn5lM7Kbl6y
	0YHAprwFe0pa/a6Qf/SzJ2TRRsaVf+e0nbyj1vlhgrFzYBN0NL/uyZpe
X-Gm-Gg: AYBFou2+S2l+rW3fOzDlMDIKH6vxY90fvWjh47grKMQ1Z+JqmX3sXGsocTOFbWAU01R
	h5YSLQg8VwhZp0pgAtT8sRaSWC0bRZWLvUTRsQnj5IADWeFqNb/+olIHaHj6dJYmQyKxPeXNeB+
	3TA5UtNdLG83yYmGlB0VCaqNq34X4gVPUB54BMha8drv/QkpzMVSSJdjZVvzIqujmftwhpoc9UK
	kLAk7xlNzmg+RwCfGUaZnXPqEKiQoJslsjgVjCEJgWUOjVFx7xIenPtE0NBq47xNq4Ximz55UNH
	82c+LxcSeaZdZxiAGADkB0l9CJ+m2r2pz+O2q3SCBqRJIkK7dafcMWDw29xNLHtjrUW8mtPE3Aq
	s9TaFPSoWK9+YI+QfUg4qijISq7GTjv+Y+xO+zGXCQfyNh5OnMX1qHUdSyO2LJVKy4Ygl4c0kZm
	eV0rmWxN/81Av2CAeqixmBgMtA+FV2Ncd1nP+rDwFfvw1EG4clqOKTtn/I9cKIf8m7GH9RZVvx1
	o6pDeCE80ZJq5zgm9PsCHpiQn9IvazSetjG
X-Received: by 2002:a5d:5f92:0:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48c7289c820mr3137268f8f.47.1791361589960;
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/7] net: stmmac: dwmac-meson8b: let the controller apply the RGMII delays
Date: Wed,  7 Oct 2026 09:26:21 +0100
Message-ID: <20261007082627.63807-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012632_281467_3A533D8A 
X-CRM114-Status: GOOD (  23.31  )
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

RGMII needs a delay on each of its two clocks. A board can get it from
the length of its tracks, from the PHY, or from the controller.
"rgmii-id" in the device tree says the delay is added inside the chips
but not which chip adds it, and the generic tx-internal-delay-ps and
rx-internal-delay-ps properties name the controller.

This driver ignored those properties. In the "-id" modes it switched
its own delays off and left the whole job to the PHY, so a board that
asks the controller for one of them does not get it, and a board whose
PHY cannot supply that delay has no usable link at all.

Boards not using those properties behave as before.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..d73dfd0ac167 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -92,6 +92,8 @@ struct meson8b_dwmac {
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
 	u32				rx_delay_ps;
+	bool				mac_tx_delay;
+	bool				mac_rx_delay;
 	struct clk			*timing_adj_clk;
 };
 
@@ -299,6 +301,22 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 		delay_config = rx_adj_config;
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
+		/*
+		 * "rgmii-id" only says the delays are internal, not which
+		 * side applies them. The *-internal-delay-ps properties say
+		 * it is this controller, so leave ours switched on.
+		 */
+		if (dwmac->mac_tx_delay || dwmac->mac_rx_delay) {
+			delay_config = 0;
+			if (dwmac->mac_tx_delay)
+				delay_config |= tx_dly_config;
+			if (dwmac->mac_rx_delay)
+				delay_config |= rx_adj_config;
+			else
+				cfg_rxclk_dly = 0;
+			break;
+		}
+		fallthrough;
 	case PHY_INTERFACE_MODE_RMII:
 		delay_config = 0;
 		cfg_rxclk_dly = 0;
@@ -384,6 +402,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	u32 tx_delay_ps;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -409,9 +428,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = plat_dat->phy_interface;
 
+	/* the generic property is preferred over the vendor one */
+	if (!of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
+				  &tx_delay_ps))
+		dwmac->tx_delay_ns = tx_delay_ps / 1000;
 	/* use 2ns as fallback since this value was previously hardcoded */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-				 &dwmac->tx_delay_ns))
+	else if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
+				      &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
 	/* RX delay defaults to 0ps since this is what many boards use */
@@ -424,6 +447,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 			dwmac->rx_delay_ps *= 1000;
 	}
 
+	/*
+	 * Each property names one clock this controller delays itself. The
+	 * PHY must be asked for whatever is left, or the two would delay the
+	 * same clock and push it past the window.
+	 */
+	dwmac->mac_tx_delay = of_property_present(pdev->dev.of_node,
+						  "tx-internal-delay-ps");
+	dwmac->mac_rx_delay = of_property_present(pdev->dev.of_node,
+						  "rx-internal-delay-ps");
+
+	if (dwmac->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		if (dwmac->mac_tx_delay && dwmac->mac_rx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+		else if (dwmac->mac_tx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_RXID;
+		else if (dwmac->mac_rx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
+	}
+
 	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
 		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
 			dev_err(dwmac->dev,
-- 
2.56.0


