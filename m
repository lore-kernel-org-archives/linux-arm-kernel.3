Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBC3CD1288
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72U297d2NX6RO9yoD7XU9KTbdxctb0+CTvTsi0z9044=; b=pImOy4mP9862Kh1VHHGJtcknfR
	l8eHq/oRrvVx35sIFybRfaiLVu7eLUqqDg7AyAqCcxWoB0Jtis8mlsbSsU1o9fcBVipeZV8qjuXRy
	ya3kgf4/CUEVcFY5aeZ41xzwE54NeEP6vibeGI1PmS6h6EkeKtyYcYFj/cY9CN8RIX7myrooxLW7t
	jXtlEfs+IF5WIWuyH96PAQiwCnXQpeWYbK9HrjOr4WhCQVip/G1xY4RKZhN9aHMMONQQPkcFqY8Ek
	56aTCaod4anBT10+PTEKCUuxpQavCsOgIebpQjNLVbmjMf8JUf4740RFPlNEVS/Og9oiW8VAOB7YB
	BZ3foBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7b-00000003YXS-2j3Y;
	Sat, 08 Nov 2025 23:13:27 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7Z-00000003YTW-28v8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so1253030a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643604; x=1763248404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72U297d2NX6RO9yoD7XU9KTbdxctb0+CTvTsi0z9044=;
        b=FoQ0MZa6cgQEcICwt1GipqCB6ET+mjdMgz6oZVFT91J8IYuMBk+1XcOusdYFGADmRX
         H0vfyDZoMCcoeDOVXmE417vOUHLkWbmCukffSqhNwKqd89EUMMqOxhf1K45/MUC1Ied5
         NJ/CbCsE0KrIyDz72YbvKA6CgrOlS971KVNFR3MGf5+95SM+7LT2ZmU0vr0XiNz2QiRk
         P47J6vvRCTl6KcFWrny5vTitvjrXpRPkx4ujWDttjYSVcHoQtNF/W9tO0vZjebRey2AK
         Jp/K7miH0F8G6xxrz9sIOjoN+qxHlDZShwKmQv7loGRkmBmTHM23DaYMxs5BhiL7CV5e
         R24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643604; x=1763248404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=72U297d2NX6RO9yoD7XU9KTbdxctb0+CTvTsi0z9044=;
        b=s4Nov8M0KNhgPdW4NMeWM1CkGaoMt9nIBajmupCb0b8WpdVUWbMeX+xPI9d8Zp04ZZ
         kp6z7qfMJS9qAjbwi92uFFFBgmquv2gwMY9PibIEpqTbidU2v7Qik2eZqm0TuyuB53cf
         komYcmcPIKOKr7cjlfgPo108cUBeRy8OX/75EkhDW9KeU/ZL5/uBQe8/5HeYsCu5MdpN
         x88RtfFCJmT+LWLJwUE0gOT2VcddhSWVgBRhPMRAf6eo3C+5f3iu9V5kWfQgv5+mb4uA
         eEY1TCPRPG7TkscGcBjYvOVE+CBQ2vOj7eenCpf5vb/ixeLwS7xzLi6J8pR7Ad+PmZXk
         Jrlg==
X-Gm-Message-State: AOJu0YxEaJXD1prYMPk4oHQuIESGtVlqJhjDKWUSF2HHUjwH/qJBrTN+
	+eukOXryQkr99CEpYK8FC+2fs07kHYopg+UcKFVbum69J/QzqtRthesE
X-Gm-Gg: ASbGncs9OdmJR/Ea/I0TGdDmmQJ0FXWD30hYYYMf5izLCNS3z77DaOWJmzAKNvIh7tL
	LyaF5peumjLdHjQ2st2UkdQUKUMpZSGGaBk8yxjqF2pewwOtTSiFUQXh92jq8BBK2NIZExvIfm9
	7FpyfyAfmTGVSmL5vfwkLjZjBTyt3Wyifez0E+2yeuEIj/VZnQ/fpQb46Qk2l+7SnO5HUAiqL3h
	EuuF/xfaZKBQp7GOznkVHoA1H08+rrTp4r2gO9I5NI+/MntHocWBImEvuz/JJopFde/oJ5fYL+R
	aE/jwKXNWP34JumMTtQbCX3RNnOJ0EM249wOidPcO6yhaIsablDESjAqwHcLNM0kDeGcbCK6Q2Y
	XGvCzkQM9OqnFo6Q580Gl7WNosKmN1TtBHX6iWH9TSh3N9BQPJrCque6U34hWjwWGPF8zzNJME0
	5jA+aKv8w8VJ6nxHmiGR4E0uf0Rk+Q8DyRWwI1tqNCX4icHVfoNRtZdY2ESODh5eRLx3exaDmJ2
	csnJIFeZBledxGehZBkevTNSGjSgBl0EQgUMKS1beQ=
X-Google-Smtp-Source: AGHT+IHbNQTEVG2cKof3S4FeUIgLFrT/DVsyswwXVAtJnkg7b3F2iGq4VQNvhnBsPlTOOJ7clsnvPQ==
X-Received: by 2002:a05:6402:270c:b0:640:d0d9:71d3 with SMTP id 4fb4d7f45d1cf-6415dc2ea5fmr2873707a12.6.1762643603577;
        Sat, 08 Nov 2025 15:13:23 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:22 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/7] mmc: meson-mx-sdio: Refactor internal clock initialization
Date: Sun,  9 Nov 2025 00:12:49 +0100
Message-ID: <20251108231253.1641927-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151325_614675_36337FC1 
X-CRM114-Status: GOOD (  19.96  )
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

Use modern common clock framework helpers for simplifying the clock
controller management:
- switch to struct clk_hw for internal clocks and only get the
  "cfg_div_clk" (which has to be managed at runtime) as struct clk
  using devm_clk_hw_get_clk() which is then the only clock used by
  struct meson_mx_mmc_host.
- use CLK_HW_INIT_FW_NAME and CLK_HW_INIT_HW helper macros for simpler
  init data initialization
- keep the clock controller memory allocation separate to prevent a
  potential use-after-free because struct meson_mx_mmc_host_clkc is
  free'd before controller_dev

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 119 ++++++++++++++++---------------
 1 file changed, 61 insertions(+), 58 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 1159cc911359..ce1828d915da 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -99,15 +99,15 @@
 #define MESON_MX_SDIO_RESPONSE_CRC16_BITS			(16 - 1)
 #define MESON_MX_SDIO_MAX_SLOTS					3
 
+struct meson_mx_mmc_host_clkc {
+	struct clk_divider		cfg_div;
+	struct clk_fixed_factor		fixed_div2;
+};
+
 struct meson_mx_mmc_host {
 	struct device			*controller_dev;
 
-	struct clk			*parent_clk;
-	struct clk_divider		cfg_div;
 	struct clk			*cfg_div_clk;
-	struct clk_fixed_factor		fixed_factor;
-	struct clk			*fixed_factor_clk;
-
 	struct regmap			*regmap;
 	int				irq;
 	spinlock_t			irq_lock;
@@ -548,8 +548,7 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 
 	/* Get the min and max supported clock rates */
 	mmc->f_min = clk_round_rate(host->cfg_div_clk, 1);
-	mmc->f_max = clk_round_rate(host->cfg_div_clk,
-				    clk_get_rate(host->parent_clk));
+	mmc->f_max = clk_round_rate(host->cfg_div_clk, ULONG_MAX);
 
 	mmc->caps |= MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY;
 	mmc->ops = &meson_mx_mmc_ops;
@@ -565,54 +564,62 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 	return 0;
 }
 
-static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host,
-				      void __iomem *base)
+static struct clk *meson_mx_mmc_register_clk(struct device *dev,
+					     void __iomem *base)
 {
-	struct clk_init_data init;
-	const char *clk_div_parent, *clk_fixed_factor_parent;
-
-	clk_fixed_factor_parent = __clk_get_name(host->parent_clk);
-	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
-				   "%s#fixed_factor",
-				   dev_name(host->controller_dev));
-	if (!init.name)
-		return -ENOMEM;
+	const char *fixed_div2_name, *cfg_div_name;
+	struct meson_mx_mmc_host_clkc *host_clkc;
+	struct clk *clk;
+	int ret;
 
-	init.ops = &clk_fixed_factor_ops;
-	init.flags = 0;
-	init.parent_names = &clk_fixed_factor_parent;
-	init.num_parents = 1;
-	host->fixed_factor.div = 2;
-	host->fixed_factor.mult = 1;
-	host->fixed_factor.hw.init = &init;
-
-	host->fixed_factor_clk = devm_clk_register(host->controller_dev,
-						 &host->fixed_factor.hw);
-	if (WARN_ON(IS_ERR(host->fixed_factor_clk)))
-		return PTR_ERR(host->fixed_factor_clk);
-
-	clk_div_parent = __clk_get_name(host->fixed_factor_clk);
-	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
-				   "%s#div", dev_name(host->controller_dev));
-	if (!init.name)
-		return -ENOMEM;
+	/* use a dedicated memory allocation for the clock controller to
+	 * prevent use-after-free as meson_mx_mmc_host is free'd before
+	 * dev (controller dev, not mmc_host->dev) is free'd.
+	 */
+	host_clkc = devm_kzalloc(dev, sizeof(*host_clkc), GFP_KERNEL);
+	if (!host_clkc)
+		return ERR_PTR(-ENOMEM);
+
+	fixed_div2_name = devm_kasprintf(dev, GFP_KERNEL, "%s#fixed_div2",
+					 dev_name(dev));
+	if (!fixed_div2_name)
+		return ERR_PTR(-ENOMEM);
+
+	host_clkc->fixed_div2.div = 2;
+	host_clkc->fixed_div2.mult = 1;
+	host_clkc->fixed_div2.hw.init = CLK_HW_INIT_FW_NAME(fixed_div2_name,
+							    "clkin",
+							    &clk_fixed_factor_ops,
+							    0);
+	ret = devm_clk_hw_register(dev, &host_clkc->fixed_div2.hw);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret,
+					 "Failed to register %s clock\n",
+					 fixed_div2_name);
+
+	cfg_div_name = devm_kasprintf(dev, GFP_KERNEL, "%s#div", dev_name(dev));
+	if (!cfg_div_name)
+		return ERR_PTR(-ENOMEM);
+
+	host_clkc->cfg_div.reg = base + MESON_MX_SDIO_CONF;
+	host_clkc->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
+	host_clkc->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
+	host_clkc->cfg_div.hw.init = CLK_HW_INIT_HW(cfg_div_name,
+						    &host_clkc->fixed_div2.hw,
+						    &clk_divider_ops,
+						    CLK_DIVIDER_ALLOW_ZERO);
+	ret = devm_clk_hw_register(dev, &host_clkc->cfg_div.hw);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret,
+					 "Failed to register %s clock\n",
+					 cfg_div_name);
 
-	init.ops = &clk_divider_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = &clk_div_parent;
-	init.num_parents = 1;
-	host->cfg_div.reg = base + MESON_MX_SDIO_CONF;
-	host->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
-	host->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
-	host->cfg_div.hw.init = &init;
-	host->cfg_div.flags = CLK_DIVIDER_ALLOW_ZERO;
-
-	host->cfg_div_clk = devm_clk_register(host->controller_dev,
-					      &host->cfg_div.hw);
-	if (WARN_ON(IS_ERR(host->cfg_div_clk)))
-		return PTR_ERR(host->cfg_div_clk);
+	clk = devm_clk_hw_get_clk(dev, &host_clkc->cfg_div.hw, "cfg_div_clk");
+	if (IS_ERR(clk))
+		return dev_err_ptr_probe(dev, PTR_ERR(clk),
+					 "Failed to get the cfg_div clock\n");
 
-	return 0;
+	return clk;
 }
 
 static int meson_mx_mmc_probe(struct platform_device *pdev)
@@ -682,16 +689,12 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 		goto error_free_mmc;
 	}
 
-	host->parent_clk = devm_clk_get(host->controller_dev, "clkin");
-	if (IS_ERR(host->parent_clk)) {
-		ret = PTR_ERR(host->parent_clk);
+	host->cfg_div_clk = meson_mx_mmc_register_clk(&pdev->dev, base);
+	if (IS_ERR(host->cfg_div_clk)) {
+		ret = PTR_ERR(host->cfg_div_clk);
 		goto error_free_mmc;
 	}
 
-	ret = meson_mx_mmc_register_clks(host, base);
-	if (ret)
-		goto error_free_mmc;
-
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
 		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
-- 
2.51.2


