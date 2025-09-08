Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1989BCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=; b=cW94z9BiU8LU1pTm2zi4Scln+e
	CGxByO1Zwb18nL7dDaMO0oYtkNytpGRtCgTfJykFX1fimrxufM30JfVUtdHNBUZYX0gv5H2KyUO8J
	DcIZ7qGmusOwPH3mv5LBvDtHBJgrYBuUn0YLmd1Lg/R61iXkmddVeeBJUcz2IhdcPGpb0keVaGd5k
	lv7zlRR3mcC2ZNYYceKYytq1XOVJotVaJkH+l/LrPMbLgxa1bURYtsZM5f0mrM54hGEdINz1YXGN+
	jG0A02VEUcJPdBEZjbqViS0a6WJx6IB+WmvdPwiz6OFnye3HMsEpi7HJ/JZvWpMiKxj2ZKr2Vd2Db
	LQSaSNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaci-0000000Gs31-2446;
	Mon, 08 Sep 2025 12:05:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZad-0000000GVta-249N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:59:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso3789510f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329154; x=1757933954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=;
        b=TNDYTGWuv73lhVUpmvSqBuuJ4Bb++fxOjBt7fgt0jE/qbr6AdGj/VcHTbS3JEtAycT
         JjE5WzOm/8JGy2c6uokkpzUHTRCch8cOFAeDZRByHaNVcymIca7rJMYH4JJikJj/AdXB
         T/urlBwH95jMNUuDOdMAQFRHAL+qKb/PqaPvMgsnEi3ltEWmrcUGlyP9r+bgWZ2Kd1lb
         A820AeKH/gF+BxkMOuQUtXccOSCAe+1VXmiakaLL4NvUEHCDB5RrKVVhk8MCBAcgcgDi
         ohrzl61sjmY1BXk5X/jAISPfv5XKpCvpY/DkDBdiPfyrBgtPx1+JowyYOjz76QgTogd3
         FpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329154; x=1757933954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=;
        b=LZWAB1TZTUsKTH7qM1RQL6g5djwdjDEF/4smPhYJ60wvTx0TlVKbEYeT0QZ7zcGbjC
         rSLQBaPylI2nVovZWk5C3R7I6wGCvhvixRUf/BouUb00OglRqUR6BAp3GoredTF9dNfV
         zm1nj4wZQDEbzjsET8HOt6euiJzBPFhtJoyi9f2daOgshWDDYTf4K+5saWf7b9/HCNVq
         LThC9Z3mwWEG2yEAIxtM957uLtZaCr8Jy7gPhWxJdQuP+FzY+fHN02yDdOFaE4QrBcod
         rSZ6sS+em4d8mlcGi0ZNeNgVSBb8CT6/5fMYGNgjM31XBOX8VyOXcOMae3Eqy23yvEh7
         BgXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuDUGxbh9SQxa+ZBLwPA97NoRUo7XaPGvhSmDR3wbQRtDhxxvc/zwUieRVpjQ+2crRzzx70ZSkeDRGZzZoSRIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIxKwbydj6WZhswPTVZBqfeygkLsKOXRaC3Jrqn+OpIK83KAgz
	T7nYuS/WofkTpNhSulORMECQWNhlOjuCfnzs6yJ1Ue60s+Uk4T1IfyZM
X-Gm-Gg: ASbGncvFIRjSnUxSxMLAFBFD3GvVGpv18NyqxGS5VyjvNslPreCaCikJbVXeLaq5b82
	YSDz7dGxr5UG+584apvD07Bk6NCs7C1g7YRyOiDinhH1hZmwgY/jkBddKZsXEzjPhLKHc1k+2Se
	OBW8EKuXo7b3hCuLt/OmIx+nrz7tmezYbuqdSwQ9q0/GFPYFvCP/RCOfsNbdXHPV/My0HYD8faO
	DeKEDSb0NNRWnMUX5TacItyxSM9mgTVC9UrNGIZmGYc1haY+WqFoTqEbZwCdZqn3LiJiq9H74FL
	TZ1iSsQr/t8bVcyAawTgeTy82H3ncpaLRz/Lwztu6AQH2E42ymJlvPYrQ5Yj5aBoQCquJZHXZq7
	HBrEmvLRO7Zw0uP8iJI96enEVz9dWwbmuFYPofLt6WOqbTfTntIk/luGSOA==
X-Google-Smtp-Source: AGHT+IELTgxCxxMFlkSEsgovlmb0CJQVYUnnXHGxbgqoK5YwfTIppZeS9BA8X3YNorpanLJ1ufvAzA==
X-Received: by 2002:a05:6000:2c0e:b0:3d7:94bb:cb9d with SMTP id ffacd0b85a97d-3e636d8f2ecmr5327019f8f.3.1757329153628;
        Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
Date: Mon,  8 Sep 2025 11:59:00 +0100
Message-ID: <20250908105901.3198975-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035915_538390_1E199AC8 
X-CRM114-Status: GOOD (  23.39  )
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
v2->v3:
- Made sure STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is
  always set for all the SoCs.

v1->v2:
- No changes.
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..50be944ee37b 100644
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
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   gbeth->of_data->stmmac_flags;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
+	.clks = renesas_gbeth_clks,
+	.num_clks = ARRAY_SIZE(renesas_gbeth_clks),
+	.handle_reset = true,
+	.set_clk_tx_rate = true,
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
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


