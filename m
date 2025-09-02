Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CD4CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW7wLUGlmaYQP6Tz0Pa2N3CEqKrBMcmhwzaDX5OOnZ8=; b=lJVYFYC6dE9gtUM3Lm21NqZWXN
	oPtqk068owX8LwEMvShzPThtw4ewAFxonPEgEnYHg6x4bMNZgFhLE0nGzQxIn+bAB1pKzz4/E5iHB
	3N33fFZAFCdHU77uWuO35kJX5IDuVpOHKyvpNWqfWgq8freBmssm/RuYPtTfMfwrP+CyA1Ynz1CPX
	6HwMHmbholiv2fWkJkoXyjTfgeyZB4dvtRWKmR3v31gpn5lRryXubi1T3hsfnPNL1yEzrIRD0T5Co
	ioYoQul2lf1NAIrovpScSGe3R1DOzGHu4o+rNltN/J6u3qDRkfm7PqoMlXLvmFp9Ahmg3z5ONvRks
	CAPfJdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFI5-0000000EbcG-2FaO;
	Tue, 02 Sep 2025 00:54:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utEe7-0000000ES92-0LMy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 00:13:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so33048335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771989; x=1757376789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW7wLUGlmaYQP6Tz0Pa2N3CEqKrBMcmhwzaDX5OOnZ8=;
        b=JBJAf2GLhr9kf91GRlRRYidtDmNydhonA0mfDf46C83JS8Q8YB/nf0gCLa9Ow2BrAW
         Bb7zafJ2VVwpV4ZZqAVR0VLVTOg5chKSMP5YqmqRP0zNGQBJuJ5Bt9f/wkuWZjKmaJYU
         LX5hv8YjH0hCYSLrnQBq38KCZgguTtHw4te3OMGoc6EObrcyD5Oipu1HPmvEIQkei3TG
         nAzvby/aLy/Njby4XFSOO/xgPTOE+3lgWhg0UZOA0PkNmk7m2jqh68hHFuEl1cKPGsga
         jfQCmm4MIsnHr12Fr+FURmuA23fSipStqI266BPOc5hYtbgibDU0TP3IzSfOQ9ioTBw2
         VK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771989; x=1757376789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW7wLUGlmaYQP6Tz0Pa2N3CEqKrBMcmhwzaDX5OOnZ8=;
        b=dCdjZS9WaAI++EZGUrvSJrPiQHjKsCcDXPAXZQwqzz2a+GIPONEB/niJQTHXoIYRal
         nM1jQztBgVrAsHh3IueolUCRFG+Bbc7dXrVqJAZp7jX1iFZZvCMbJ2IYV0HgMSvks2Nv
         YvnJHHqqNclmfIdKcoYK+z+W+DB/FOj2BNkGepnFQySui/LTrHNiA1KzF7+IFCVvTJAQ
         Xp6EhYEX22ls2/CuhHggcxcteOYkfCBaFqQm2S4hWR31UsvQtRoLHM8BQUMGO4d4zDyy
         2YTygf9ZQkViRB05n5pduarCzDGlD7T2NKfy7sp2+YOvDl2Sm0maodbgcsHQ2oxaWq6j
         ty3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcmpqnO87Cp5khNiT/HNSrhjiVzR/TQE0cWTb2QL9FaQVOn/imYXrzby+shZ103zsUT/p6a0NhNmH2rGBLwLHC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4idIe2pNXI9z2FoTGSe+a4tvFCxsecQCKLKQ3b9G0QsO22/H6
	I4jZuxZzTwv5tRNHcAq07+F22gaptaeLgwLmCJek7KxQyIq6mcu0mGZS
X-Gm-Gg: ASbGncsozGDO5hhBIs6h/FfcKJS+ncpoY7//skij9QD6bfOnqUfaE/CIHGl17eRZqub
	wH3TFdseYmHq+jysQ44Geycs/mFc7/OTS6E1IHHah26Lx5kXwdn6kOqIWGrqISBHTv1nsdx5LR3
	4XePT11zZzQ88YLd0Kw6EKd3uXmD/aNWNsskOYYMHV818/gqg9N5/atW0Lj9Mw2XrvKEc64Zase
	5A53YG5uWvQ4o5zRz9SgJ66oX3iNbiYCMOjilATge1am7ah57duBV2YcuD+VZeuLllORyQAysDH
	bFWcivZEudfQ3jm/qvorVEaJY8SX7C+EOrTPc8FmKQ8KazQAUku/hV5igTCu1//hefjXbvFWfzY
	Iv8L2sg2qQL6HpJu0C3ERqotRYiTasIQw+/dTkez20b23AaYKWh5VixPY
X-Google-Smtp-Source: AGHT+IHuS7QRUr21Kdtxu2CuDcnTrvddR0z5zY3NevQTs8JFkmoZuliR3bAbwjIkq43ebLCLnjTS7Q==
X-Received: by 2002:a05:600c:a0a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b855aeb67mr71158435e9.32.1756771989248;
        Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:08 -0700 (PDT)
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
Subject: [PATCH net-next 3/4] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
Date: Tue,  2 Sep 2025 01:13:01 +0100
Message-ID: <20250902001302.3823418-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_171311_122738_753D4062 
X-CRM114-Status: GOOD (  23.35  )
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

Prepare for adding RZ/T2H SoC support by making the driver configuration
selectable via OF match data. While the RZ/V2H(P) and RZ/T2H use the same
version of the Synopsys DesignWare MAC (version 5.20), the hardware is
synthesized with different options. To accommodate these differences,
introduce a struct holding per-SoC configuration such as clock list,
number of clocks, TX clock rate control, and STMMAC flags, and retrieve
it from the device tree match entry during probe.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..022e595a9e1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -16,12 +16,34 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/types.h>
 
 #include "stmmac_platform.h"
 
+/**
+ * struct renesas_gbeth_of_data - OF data for Renesas GBETH
+ *
+ * @clks: Array of clock names
+ * @num_clks: Number of clocks
+ * @stmmac_flags: Flags for the stmmac driver
+ * @handle_reset: Flag to indicate if reset control is
+ *                handled by the glue driver or core driver.
+ * @set_clk_tx_rate: Flag to indicate if Tx clock is fixed or
+ *                   set_clk_tx_rate is needed.
+ */
+struct renesas_gbeth_of_data {
+	const char * const *clks;
+	u8 num_clks;
+	u32 stmmac_flags;
+	bool handle_reset;
+	bool set_clk_tx_rate;
+};
+
 struct renesas_gbeth {
+	const struct renesas_gbeth_of_data *of_data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct reset_control *rstc;
 	struct device *dev;
@@ -70,6 +92,7 @@ static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
 
 static int renesas_gbeth_probe(struct platform_device *pdev)
 {
+	const struct renesas_gbeth_of_data *of_data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -91,14 +114,17 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	if (!gbeth)
 		return -ENOMEM;
 
-	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	of_data = of_device_get_match_data(&pdev->dev);
+	gbeth->of_data = of_data;
+
+	plat_dat->num_clks = of_data->num_clks;
 	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
 				      sizeof(*plat_dat->clks), GFP_KERNEL);
 	if (!plat_dat->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < plat_dat->num_clks; i++)
-		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+		plat_dat->clks[i].id = of_data->clks[i];
 
 	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
 	if (err < 0)
@@ -109,25 +135,36 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "error finding tx clock\n");
 
-	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(gbeth->rstc))
-		return PTR_ERR(gbeth->rstc);
+	if (of_data->handle_reset) {
+		gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(gbeth->rstc))
+			return PTR_ERR(gbeth->rstc);
+	}
 
 	gbeth->dev = dev;
 	gbeth->plat_dat = plat_dat;
 	plat_dat->bsp_priv = gbeth;
-	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	if (of_data->set_clk_tx_rate)
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	plat_dat->init = renesas_gbeth_init;
 	plat_dat->exit = renesas_gbeth_exit;
-	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
-			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
-			   STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->flags |= gbeth->of_data->stmmac_flags;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
+	.clks = renesas_gbeth_clks,
+	.num_clks = ARRAY_SIZE(renesas_gbeth_clks),
+	.handle_reset = true,
+	.set_clk_tx_rate = true,
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			STMMAC_FLAG_SPH_DISABLE,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
-	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
-- 
2.51.0


