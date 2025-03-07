Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED33FC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gXTk8qUZUrnOwHtwmCMyQivc0+1c+3MiZGe5M0qnaw=; b=OOxwFMaawUdd7PZLfIoAP1rfkU
	neLuo1cE3mMAJp8BfPNVqor0Nlsq+QcCCruNgQFkHD8U1yHfGarzFBSpK4lfsKT7oLGlbo7K8EDfk
	GFoCDXpf6yzccHqORS3o+Syhu3w2JmALaFybucsgZKI0UhkyeNH0pwFU8tPD2Q22/F00IHinLkfR3
	lbFqgqGgdAoTcItdQvGbevEcRPWTcJATBZYf0h5rmJFPkU3O+StPCUA8aa9jw0l7eNK2x1JlM66IE
	o82hf1D/Tda8rOEJvOYGdT3Ei+RS2WXt7HNbZwgGbNxxfhnlIQnmNG9ii6rcJxehTfCexBep44Z/g
	BNzRCcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMnw-0000000Cq8N-2RJ6;
	Fri, 07 Mar 2025 01:47:12 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMKv-0000000CmMQ-3BCS;
	Fri, 07 Mar 2025 01:17:14 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6e900a7ce55so4129566d6.3;
        Thu, 06 Mar 2025 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310233; x=1741915033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gXTk8qUZUrnOwHtwmCMyQivc0+1c+3MiZGe5M0qnaw=;
        b=dDvY1cGWEWI1OOtz27nyj1mLZtJS0gx0nt+4/A+J4YKDz+q8xjP4iJT+Hk68aSSVq9
         MAuqo3Wy0lVxajSmb0qttMb+pEXUNRHGaUfdjGA4MCR4xgAGdLoPmEHi+7t9oivcgFQp
         rl4G0cY+VDOyf01gFC4A/CJpPcPbPtSXi29H/WFHv872KDgZEaindxj1aPbik9gjOp1o
         ypJsCH347jPhtG1N6SwFv8eydrDUleU4W0FzerYwFuEoVxBpMgnkQz3JYuBLkArd08Md
         dYXJHdW7ukpBct5+6J7Pk5tJ2WL0pzJIYvDTN42OV3wAwj0g0HMRVLWWz+HGdDei/+I/
         eODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310233; x=1741915033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gXTk8qUZUrnOwHtwmCMyQivc0+1c+3MiZGe5M0qnaw=;
        b=DXmoOynP01FUF/nlPGaEViONmp9T/7b4j319qQwqT242uL+N3E8YoaODBSKeEWcfMw
         3gyxpsD3L/YrtzqAyLye5Nx+DWojCYzG4VsJh/y3E9JsEGgP6rY7WI+FEyUZsccKx/5G
         P8kytDOgkzV+vMCXKpqx2aFwHTwoUt0k1I2MQRE3CN7l8Mz1BbMV2bY9MBErP0n3u3zJ
         pgPmvkO1SfpVHl3BT7znOqCl0EIj7jnpZOzTGxkPF/bR8yYiqOm6wyKHKkVbwEzCFUTh
         Dd+1ZXNTJWOuTeFjyQzxsxnOA2/wImIncXZoGtzukD73kPXjiNjnqNJlGbYHa5HPfvEp
         VCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/9MJxperk8/tyPEtFsymedmC4Ct+xtf5rYF6b3uW07NLJdX/GPVKFzoT9lPKk3vKEgcMjgXTfbH5+32A=@lists.infradead.org, AJvYcCXUE+0IsFGvXDG0tqfyljv8jKuyM1GqUkzFyH6vd3ipT//+af14MV7bXCb+3bm2GNsuqHm51iVxw13SzAl9F+3H@lists.infradead.org
X-Gm-Message-State: AOJu0YwTk/Bh8ZqFiB234IsohMhHSm3boIxx7BUVtMm1hqDRtJ7NIVIo
	iI2aldDzOrGdkYoTJ4LSSGTFZLcXfloePjOR1kqq7qiV2unwnMvj
X-Gm-Gg: ASbGncsVCEpgv5SkWryVcmTEBw/BQ8SCEEjFTm3k3BwufChVwV7KO9eJAtGk177p+4U
	8t2nffsRN5AZ/KsaMuKKOTSeJA9ThyM8NqEPgU2fZDFRxO5l2Z1s5nsWfXeRIb7PQqrqvzpkCMx
	yZH45LzWcH1tGTfnnBE6cX2Z+RNeNUxQ1nfyt8k2EDVh9WUxWl7/cSzIuSJdPL7FRrMxF3L6uTW
	NyFaEJ/AL2f86RDFnoUEC/H3jUN8aA4ojztguIDETxL37XgMEd2Vz6freOWEjrIHCRhIGq1yb4p
	d5VHynkjbDkNRX3Hn5ta
X-Google-Smtp-Source: AGHT+IHE+8EL46HeTkJY4qWuwltpuYkIIW0VnLRZHZ2+pqBFKA0/3mal8lXCevauY19bM/VgFFuWpQ==
X-Received: by 2002:a05:6214:1c49:b0:6e8:fa72:be47 with SMTP id 6a1803df08f44-6e900604eaamr17255846d6.8.1741310232912;
        Thu, 06 Mar 2025 17:17:12 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8f707cc6csm13409996d6.11.2025.03.06.17.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:17:11 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v7 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Date: Fri,  7 Mar 2025 09:16:17 +0800
Message-ID: <20250307011623.440792-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171713_797430_E49310F3 
X-CRM114-Status: GOOD (  20.71  )
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

Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   | 11 +++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 75 +++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c5f94a67b3f2..3c820ef56775 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -181,6 +181,17 @@ config DWMAC_SOCFPGA
 	  for the stmmac device driver. This driver is used for
 	  arria5 and cyclone5 FPGA SoCs.
 
+config DWMAC_SOPHGO
+	tristate "Sophgo dwmac support"
+	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
+	default m if ARCH_SOPHGO
+	help
+	  Support for ethernet controllers on Sophgo RISC-V SoCs
+
+	  This selects the Sophgo SoC specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  ethernet controllers on various Sophgo SoCs.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b26f0e79c2b3..594883fb4164 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
+obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
new file mode 100644
index 000000000000..3303784cbbf8
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sophgo DWMAC platform driver
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "stmmac_platform.h"
+
+static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat_dat,
+				    struct stmmac_resources *stmmac_res)
+{
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
+				     "failed to get tx clock\n");
+
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 1;
+
+	return 0;
+}
+
+static int sophgo_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	ret = sophgo_sg2044_dwmac_init(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2044-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_dwmac_match);
+
+static struct platform_driver sophgo_dwmac_driver = {
+	.probe  = sophgo_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "sophgo-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = sophgo_dwmac_match,
+	},
+};
+module_platform_driver(sophgo_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1


