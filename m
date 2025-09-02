Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482EFCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=; b=JT7UWMIzY1vJe9fM/0ECGTV0Vu
	3ibHiJaFS0TFwERIkqrEkPeykLt79ZXhqTFqMbvHcz7DLSAXOv5S9vCLJtNBik2HtLdwOBwvI9Vrv
	S8vcE0S7qYS6JU80N0CGtio+q8ovu92rk6SZs8sklrNpuHW7SBTkL3bxdvYiLUrR8Y72U8/nhddkp
	rnkPjKzrTGvfxad4cAVHULEF8FEddsKSETd35dNEyT/mJ6hzMsf4z0syV4fdBwiA3y/+03NC45rm3
	I85bhrKdRSYvNB91Wt/VB1rHh5VXMrEKAE/I0A4hA+qEmFHCeqIY19JTaIHwPmXyEns/3bNSDWj+e
	+XjoOb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFI8-0000000Ebhc-30YL;
	Tue, 02 Sep 2025 00:54:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utEe8-0000000ES9O-0OuG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 00:13:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso23548905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771990; x=1757376790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=;
        b=h9tUi1/FdDgV6ubOloinFcK1uUFp/G0OBiCk/5GARuJ7/REmZU9qdGcvAfcTIdKRX/
         FiVVMDXrP0gDMFIuJ3Lm/EgyIzcwEBUcgrTyCX3VheM8rBI/dX9rRWxSkzTgsozUUK86
         KYwri9QKYCcjsBN271bkEMIJOqeAiG9l0sqteiuQE1yGQybBtlaeQPy4j/afKPuGqcGU
         qs0RA8qOzYkWVPIKogL4zLZNFFI2VpzAJ9aP7R8ZhpGD6mu07AEZSneSMxLRbj4yZur2
         f6RzRbn45KlNmMMGjIoUBuEEAAp8XHyTCxhRaUTnEOMVaXMd08ZfNgK0zCLjU8beIkRT
         yBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771990; x=1757376790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=;
        b=BzXgDVs6Ca2cqaXKDF4Ebmt2JlmuGwVzzBNcdWYczLagdgZnsm1vJpRFsEGLYM4O3/
         0Twu+XPk7T2ZGH8EwzEDAathJu1S9Ul6duAVgfWNLNsnMZsoSWXMDEK4HpYYEuh3lJZU
         Mnxy+nSHAKIek8r6+fUDkCWXl3NcRlB8IR1kBXVOzES+Q0+Xn6FWzweoXrU0r7g/hSLj
         gOHrjoARykm4Gy//TECLCJ6Fl23vz3U4SmWigpt8cNhFuoRF7Br957EigYN/hgizgp4X
         QPHpppjdL/cjk8wvbAZMTlCrpPpv6k4aN88vxHiU9UNiWr0g5aZQYuY01KBBxaE2Ka8F
         66fg==
X-Forwarded-Encrypted: i=1; AJvYcCWF5myDoPwQuThbHEc4fW247HCWay3xqzsTRZc2T5/0GVvdqKW/UIC4AoRAY/0FvijIDdVQ718e0I44GnF6YL8S@lists.infradead.org
X-Gm-Message-State: AOJu0Yyahh2KN7g5RbKqoSJvKW6K/TqpjAYQuHD5Dtt4ojLJyH/aTr/y
	xYmCk5KvfZ2U9dGvv0fe8i74KzWoWwtb36a7C9NmiZFrLLQCsVODzQ1q
X-Gm-Gg: ASbGncu3MUfxbtKPumWOcR/uzMAJdRtXdiNY/S6RyKJ64u5NdOCIWSjenSq3OD0W4/7
	IY1A0fKmYOokSTLZPEyFvPpuqxHg60wZ0L/IKF27hEWiHdUa2tty9b1opkyZkGiVhxJtUOBJd2P
	wMHYo831e9kMaI29jTFsJcyXYS1TXii55NOmJIHgdgWips2n4iM97PR/l8M8BTFccSShA6hknYP
	bP5fG9BGhD8NgsGTyKUeEAzTKQ2jp/KICTy33uaKGAnVmKrCSXzeECI8KL+WRae5eWkTZePhAGt
	fXlm+Y/+yKiNj/KzLTEu5BO+yJM/v+LSkXZDPL3b4hNG3kLCwFSx6t19ZwWXOBN/FamTXK8kfrW
	DWuAP2Hz2iv0PGq4uaP8AIazWWMrNHNz5x+dCbiyAUma/cQ==
X-Google-Smtp-Source: AGHT+IFGGuLbjih6Gj+w7x0wLgIFZo1ltt4HE5wOWmB54nwG1DjvGnz2BT6uviOKTC8YNommrrKJIQ==
X-Received: by 2002:a05:600c:4fcd:b0:45b:7185:9e5 with SMTP id 5b1f17b1804b1-45b85525cddmr83857055e9.5.1756771990377;
        Mon, 01 Sep 2025 17:13:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 4/4] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
Date: Tue,  2 Sep 2025 01:13:02 +0100
Message-ID: <20250902001302.3823418-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_171312_140455_B8C9FFE8 
X-CRM114-Status: GOOD (  22.53  )
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
index 022e595a9e1b..ad89f7b8f279 100644
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
@@ -163,8 +206,17 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
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
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
+	{ .compatible = "renesas,rzt2h-gbeth", .data = &renesas_gmac_of_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
-- 
2.51.0


