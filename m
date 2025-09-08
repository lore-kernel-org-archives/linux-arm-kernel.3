Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372F3CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=; b=FM7mPNhCNhl8engMKDbADlGuBx
	CWwVhEwrd7qfcK5gdlGoxqh/rfB2NEH3dH1pD2v3l+EAUxOczeknibFqKZFLQ41yXOGlrr/XTarAS
	nzPTOAVPOg9yVfgE/NjLEmUDpAxgyttXG0//rq114JrAbpb3e7UlJILN6U5fIz0RVsPSvby5O0M+S
	Fn42GaZTyISQfqywwwkzGIf6LC3I1QEzr3NUDg9WgVnG3HwYfbLGVFbuWUgxxAHYb0aU+XpKzUvPN
	OPSu3wNTIKiXWiEH1/wjPANvxMD/D14mmrcXTc5YGce0yF6jDChQMU/ILvVibUUGf24TvhNOwYo7A
	Uk+RhPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaj6-0000000GvXY-3AoT;
	Mon, 08 Sep 2025 12:12:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZae-0000000GVu8-1OBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:59:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45cb659e858so29246205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329155; x=1757933955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=;
        b=REXRMzdTMa4y3N0cpjUhIc137JQx3+LfNnu6viWlGbFTBW+x8c3NGnEvVyyCeNkF/Y
         MJdYYsR4z7QErbul1jVBtfFIxuoEe5UU3ycsy9BPvPDsla6NBMcMjyBWlOPOusYD4+8l
         V9XcOGkqu4wAjl6A8d1+jzFPmujAhM4MGPMbgVlzxH8VGRCIW9OtNP/GhbLzIKlfQttb
         B/0f8JUkTfyr7mIk+n+RtJ9AvXiopEkRtXGgjf5j4/1LTU82Oue2AhX072j3b9PfpXxd
         PcU7UMh9A8oQ9vQgCoS02kczYW0eY1utfwP8QLqgy/YxgatQt4hQN4uIYoBkMCPVemMI
         UyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329155; x=1757933955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=;
        b=cN7JSLUprUR5ibpyooftgccyjYbJSReUXLOB7kPqoh7WV8uHIOxMeQiMqiSaRz7Rau
         GYalX77G8p79DSoC+kCu+aJDfZAPD0kTlcIHYNGuJyGsqHco38Q6U23sZvHyMeYdnpsS
         hL6OMMHclTAE5vevf2b1Wnlmzqd6SR0MCdLKGBnOd7CJhunoG455gL9fwxrtG5cf24XN
         WAB+pF1k9p/KbSQfTxHk+LlVb6Ll351lPDN/qCDelszJDmduTifCeKRL9E3uoQbNNW57
         KdpJiZfORdBP2K9/Pz1q4FadCHeHRC03Ay/1ZMJ8sQdZE6n3ggc9jpgEVqpgNAvX9sTa
         nw/g==
X-Forwarded-Encrypted: i=1; AJvYcCV4ebvjelkKHI+E2MH1QbjKelv2fYF34FA+nQi9kIKQysXlElxGaelPyf3G1pJ78P0fne1/LEazm6AfDDYGGiiC@lists.infradead.org
X-Gm-Message-State: AOJu0YyKAfKGvGGQLvvGx0Hkd2SeVQlMGGK0gntvSRU4eFcSK6URgnFk
	7Z3H03bhGLmEs4bhGEHEpQ+Q7sBk3TY/1Hyn3ilZt7UgLvkL2AT4i1+j
X-Gm-Gg: ASbGnctk5AIWWVLowmact0hv6OkR4paXw8iN5moSzCRsWyvRgDJdJFk+Hw3frLalsX2
	X76TU5kvotSwF2lb2f5o24nYL/m/ZsBLourn2NjtqlT3K+fC3zTJy8h53OFwOjKHW0LWMn+32An
	5CTfcaapuGYNcq0kkff5wjCFEByxsnBgSriitdIj/HI2uzu9une9PCmsjEOV2+vrnRb3VAEtvzP
	+uAsIqUv/A4B2wXQBoX6dvNSJI5pwIrxFz3Ol3gszFHdOCZyyjpK5OnstkFeb6nHCSKp48ag5OJ
	pH1OFQlLw9brDWdw/ly+s1gQ0M9WpU9MZEJS8b/iW5R510ViKzaYJFT902EK/+SRYqxHbE5Suy0
	kvbvoEYvA0kg1RmbF7s9qgpYgDwEQv7FwRdpKqQsSTlJeRZ7wvEL14P32C+QmhDsTAFZp
X-Google-Smtp-Source: AGHT+IHblMi4stag0oLrxcrHSFQ7OdUQZDLXbmXDrAdQ2fS9UVrhh42Zym0Zb20SR1y+8nRSsXcmEg==
X-Received: by 2002:a05:600c:1d24:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-45dea83f76bmr8307965e9.19.1757329154791;
        Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
Date: Mon,  8 Sep 2025 11:59:01 +0100
Message-ID: <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035916_395520_F4129517 
X-CRM114-Status: GOOD (  26.61  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
where the GMAC is connected through a MIIC PCS. Introduce a new
`has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
handling is required.

When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
instance with `miic_create()`, and wires it into phylink. Proper cleanup
is done with `miic_destroy()`. New init/exit/select hooks are added to
`plat_stmmacenet_data` for PCS integration.

Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
driver so the PCS support is always available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
  as it is always set for all the SoCs.
- Updated Kconfig to include RZ/T2H and RZ/N2H.

v1->v2:
- No changes.
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   | 12 +++--
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 51 +++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..91d9a14362bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -133,15 +133,17 @@ config DWMAC_QCOM_ETHQOS
 	  stmmac device driver.
 
 config DWMAC_RENESAS_GBETH
-	tristate "Renesas RZ/V2H(P) GBETH support"
+	tristate "Renesas RZ/V2H(P) GBETH and RZ/T2H, RZ/N2H GMAC support"
 	default ARCH_RENESAS
 	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	select PCS_RZN1_MIIC
 	help
-	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
-	  RZ/V2H(P) SoCs.
+	  Support for Gigabit Ethernet Interface (GBETH)/ Ethernet MAC (GMAC)
+	  on Renesas SoCs.
 
-	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
-	  for the stmmac device driver.
+	  This selects Renesas SoC glue layer support for the stmmac device
+	  driver. This driver is used for the RZ/V2H(P) family, RZ/T2H and
+	  RZ/N2H SoCs.
 
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 50be944ee37b..bc7bb975803c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pcs-rzn1-miic.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/types.h>
@@ -33,6 +34,7 @@
  *                handled by the glue driver or core driver.
  * @set_clk_tx_rate: Flag to indicate if Tx clock is fixed or
  *                   set_clk_tx_rate is needed.
+ * @has_pcs: Flag to indicate if the MAC has a PCS
  */
 struct renesas_gbeth_of_data {
 	const char * const *clks;
@@ -40,6 +42,7 @@ struct renesas_gbeth_of_data {
 	u32 stmmac_flags;
 	bool handle_reset;
 	bool set_clk_tx_rate;
+	bool has_pcs;
 };
 
 struct renesas_gbeth {
@@ -53,6 +56,41 @@ static const char *const renesas_gbeth_clks[] = {
 	"tx", "tx-180", "rx", "rx-180",
 };
 
+static const char *const renesas_gmac_clks[] = {
+	"tx",
+};
+
+static int renesas_gmac_pcs_init(struct stmmac_priv *priv)
+{
+	struct device_node *np = priv->device->of_node;
+	struct device_node *pcs_node;
+	struct phylink_pcs *pcs;
+
+	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
+	if (pcs_node) {
+		pcs = miic_create(priv->device, pcs_node);
+		of_node_put(pcs_node);
+		if (IS_ERR(pcs))
+			return PTR_ERR(pcs);
+
+		priv->hw->phylink_pcs = pcs;
+	}
+
+	return 0;
+}
+
+static void renesas_gmac_pcs_exit(struct stmmac_priv *priv)
+{
+	if (priv->hw->phylink_pcs)
+		miic_destroy(priv->hw->phylink_pcs);
+}
+
+static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
+						   phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
 static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -150,6 +188,11 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	plat_dat->exit = renesas_gbeth_exit;
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
 			   gbeth->of_data->stmmac_flags;
+	if (of_data->has_pcs) {
+		plat_dat->pcs_init = renesas_gmac_pcs_init;
+		plat_dat->pcs_exit = renesas_gmac_pcs_exit;
+		plat_dat->select_pcs = renesas_gmac_select_pcs;
+	}
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
@@ -163,7 +206,15 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
 			STMMAC_FLAG_SPH_DISABLE,
 };
 
+static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
+	.clks = renesas_gmac_clks,
+	.num_clks = ARRAY_SIZE(renesas_gmac_clks),
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
+	.has_pcs = true,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
-- 
2.51.0


