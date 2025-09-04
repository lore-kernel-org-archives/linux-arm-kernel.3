Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4770DCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=; b=xRHvmKw/V3rUp5PgM9xbABrQGd
	sB0fy5udnsbL5psZcutjQWzyRFdpsdpppjV3yeAoyQxwP/wz7ACeLxUQcfYfE2+Iosy+vHHysbJr0
	f30Kp+cjpMbyAV+/Nesu+fDSeE7AiBEdZInBmfwioImJ38HMLcgsZQ1UbVACifIcB/8psy7KoBu44
	T3g2T3PilsEjgUfN7RVVuCWNv7+l5xzooPppUHb+eKRjIrMm9ZY4neY0h8Qb8CdnlcwIBnwa4jNDo
	yS2VpepBWiMKFZnCTxKyjyBwk8AFRQCQgqy3p/hWfNzprRnKfy7+Wrn8BAq46CW29KB/wjQBgKY1L
	Nvo3G7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM31-0000000G1cs-0ZCo;
	Fri, 05 Sep 2025 02:19:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGkR-0000000EKbM-0kBf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:40:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b804ed966so6266305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018397; x=1757623197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=;
        b=U3sClBlw+UOPnSJ2JO5Ny2wj7x66uN2/A2F84ZqQky7Mx0J+R1Oah1p1MM6FDXM5qy
         GVuv0Kl4rX6alXaNM/n5038n0HB8WPPZEF2eLoXuiQech2M36d1qq8kh7kuFtRZ+/i5X
         1EHuSLYfSHjGCXKaQNY0Pp2Hnu787z58AMXITnCWuC1DgaRpW5VRi5CsxJIam8HoeHrS
         3XZiJZ+xREUg6GftF8nVyQc/Df1TJwCWG1/J3OHr5PN2bJOlhYOT1aSiK62ovPjdOwDG
         K2atsPXmqzI9t5ZLxDkvHLrGaym7KM+CAoEl68cVvk3slOVkWj30RAiComhx8hg4kg9x
         ul1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018397; x=1757623197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=;
        b=bjbKbQj5R3bkhbnbgy5wRN4DrXvFhNeiyk+JWkAmTWGUcWAEBQE92vvlqhl8490ED8
         b3wy+1XLctH41yWwBogNLRj+knFlP/vs+mJV/E5b9HBhm2iMN84w6EDNc4zNUPQbhNiE
         BrB2Re9XX9nTD1CwMNkcp6hfTqZyg44hRtpjRgWxjUvtFSGObhpiqmWsnoRUm+0odudC
         3YQJEMp4qTesRSx/b2OjfMDNMGI0881bVDjMJqZHNfkbMQ/JwCOltfeA4+Dlk5LCuFgV
         7To8XOYDgUOVUtV2xGMgvQVBJ/s4P9UFQdJCJtYUtgn/ZD4Uz7e1BS8iGLw+1wtAYa2T
         XSrA==
X-Forwarded-Encrypted: i=1; AJvYcCVNo7FsGPpwKwrU8vKcNtsrppOEQjCCkhCwnieGxLORv87/Kexy7LSWfnNCyYxWtABkqEWy2AfGFZRKMtyeBiMv@lists.infradead.org
X-Gm-Message-State: AOJu0YzMoOkI8T3VomhNnBjGyhel8rEBxn3SzUoMvwK2pA95w6i++QAG
	0CL+l14K2+jBcQFbPdMLXF5LgCR7MBYC1iFC4BVTWc4JPOqSUgI426lU
X-Gm-Gg: ASbGnctCpoMVXH6KdZmXwmzqw7MdRZ1OTA9wRXCnEcAFx903ODf5wOcwdFLnsZaAfvF
	ZPlDSMHPnd8Ou+OQz6VWrqmM2r21t6VMmkLCmb9X0TOYUVVQ0CI2zF85Vrjw8PXjro8jo8SWQjQ
	IbaEjKoC+677+Nz3+VluSKHhIyYFYp5vRihYVND/tRntfv2cwqvbg0mX3Cn1qAq74aqF0RxJcyo
	ZOxrXexIfNPPrlVV/PEGmPtFeUWj7W13KrQUCmfitVHM/hPVy3t86qmtLAZuYVqHv+wuFj2PEB0
	nc0fX80FhP0ZX3AYlmpvY12TnCALb4ts9Azkt2h8R/gSA1x31pbirWayde2tchrvBpmGqjq4AA5
	ROtepPGY5Tav9ObwbXh3++IzxJ/4ONGfwxIHDKrBzZotOdA3CrBVDlmiSvQ==
X-Google-Smtp-Source: AGHT+IHL1oc02XZbGobYDQotXvvBze1vwYgK+kccWNcOGisk96waxJM71NYowbvY/REwkkmrpI/Nag==
X-Received: by 2002:a05:600c:a04:b0:45b:7d24:beac with SMTP id 5b1f17b1804b1-45b8553335amr189504555e9.10.1757018397490;
        Thu, 04 Sep 2025 13:39:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
Date: Thu,  4 Sep 2025 21:39:49 +0100
Message-ID: <20250904203949.292066-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_133959_223938_A589561A 
X-CRM114-Status: GOOD (  21.84  )
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
v1->v2:
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth".
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..a01c83b109f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -136,6 +136,7 @@ config DWMAC_RENESAS_GBETH
 	tristate "Renesas RZ/V2H(P) GBETH support"
 	default ARCH_RENESAS
 	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	select PCS_RZN1_MIIC
 	help
 	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
 	  RZ/V2H(P) SoCs.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 022e595a9e1b..129543c37a5e 100644
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
@@ -149,6 +187,11 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	plat_dat->init = renesas_gbeth_init;
 	plat_dat->exit = renesas_gbeth_exit;
 	plat_dat->flags |= gbeth->of_data->stmmac_flags;
+	if (of_data->has_pcs) {
+		plat_dat->pcs_init = renesas_gmac_pcs_init;
+		plat_dat->pcs_exit = renesas_gmac_pcs_exit;
+		plat_dat->select_pcs = renesas_gmac_select_pcs;
+	}
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
@@ -163,7 +206,16 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
 			STMMAC_FLAG_SPH_DISABLE,
 };
 
+static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
+	.clks = renesas_gmac_clks,
+	.num_clks = ARRAY_SIZE(renesas_gmac_clks),
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP,
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


