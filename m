Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE7FC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 06:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cY6Pi0eVXjTj4iYGf3V3W021FfEKM0ai79ohmKI0mfc=; b=KLcFrD2of0UCU9OHLQCxlfvY63
	giDbMg2p7gz/cXnzAJXuwd76ukjWrjbUz1znwxxYMriTRvlWKHCbBn0cr0OIh2aKZLGjO/Fqs4Nhz
	WPkWn/kwBpN0hNZzoDAYhZ+ZnaOoRZ2wA8/vzoXlUmQYb8+DSsX8A4aWGd2obJ9rsqBQvTstuav6i
	xJ6DmE2kUFKGw7JV4Mg8ec8LuC4Oye+vhtKVodUHfMf0AzwCXu6jbIXk2QkcaimjeiTTkSxj8xlhA
	b2H2fxOATGH1f91XR1WU/fjhdPbidq6JcKfQ50iHT2x2Vnb3pD79J+3TGFyqeSUHK3QeK3IQrT7Bf
	ZEQcreeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiX4-00000007AbT-3xEl;
	Wed, 05 Mar 2025 06:47:06 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiQK-000000078iC-1Uk3;
	Wed, 05 Mar 2025 06:40:09 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c089b2e239so48683285a.0;
        Tue, 04 Mar 2025 22:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156807; x=1741761607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY6Pi0eVXjTj4iYGf3V3W021FfEKM0ai79ohmKI0mfc=;
        b=fR29BwN/YpdXvtupwEQxerD34Km0aZMXSHb4zE5Pa8LhSfZt0BecYvbzGFRFslJZW+
         ByzhyXqR8IxqZ35WA5MfIdBVnABe5Iw9v/8K/QeQQHqHNiGpLWf5V+iASDOKF7coEkio
         dv/bZgCkAbX0WBmBJHyUTIuRdHgNJxz9B+TP5Jg08UsACESbcVEQFSvvQSjM1IzHNaEu
         8UQdJsDfN7uLaQiFtOXiZ+gKdDvpV543FS0/n4htqgRh5Tbrr85f7USl3dd1mZglXeVw
         pVMn6yPl36/ZqLY7J6X4tdf4r3aRUVLhmF+ruvLhKmuko+P26ZEHVzLFx42t0Tcumz8Q
         Xx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156807; x=1741761607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cY6Pi0eVXjTj4iYGf3V3W021FfEKM0ai79ohmKI0mfc=;
        b=HcOLvZXs4X7ngrqj0FHuViSpCefFvazjrEhE6Uuoencs2lQtmuIeE0F0Nu8EB7MLmo
         jXoWq2tOJEtCly9gkHbatVYwYCm51m1l8GMe3lXdH52Ma/4mur2n258A5+ZbIIw8jPyo
         RsOgCVYlIeFCMqV0o4+iQcTqy+b/J6O2yu78NTfQfMZCYK4+1Ey5NHCTP8lIKe0z1raz
         dFfMzi06ky8cp6CQj0nfbdz5wksWjzTZ8WYwtJObtl6zlvrPyzxcm2wWouTWv83FJBmS
         Bgos6ZBcUsDFNMJYxteCZguYeQBp0PpMhO0+XPcYc+jeXe7ZMdispgXQ/Hd+yNyY5q9m
         fg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV64qT6r3p97bQG17i0MxLWujOtEZ7SqpX1zfRCTZhkyj/XtdJK6IpKdfEP34EHt5U55acXIQGF8LDjYgne40Yh@lists.infradead.org, AJvYcCWde/nlWJbN3bML0+VCcpquBv+lDGfsM5T+Feu5M9KxOEKOR95O9eWvbBsFgMlSt1SWBjteqCkYNWXXtfw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjIperfKRJI8FgEkvRbQhENgtbL/9LDLFXG3xR9T+bQNE70t35
	rEfk+FC6euISUYiori+GAz8VpAgv1O+4GH0m7G+fIhhV8LurGFs2wTDg5Q==
X-Gm-Gg: ASbGncta4vIA3ZcEDiqB4ZSzLFxGC3N2WGO8BA192RalVWtFm2Hc7aqos+PIoNcJIgT
	Th9PYWQXdk9bdS7yb9sMJX6VeWHhJ5D6xhwTvX7L/9CwhUX6ZwFtuw77K3p0oQKKUC1Gifdxn+X
	adpnVajFzhS9bZGe1wAyK2MP0qLVxczKdNvQ3JBXhmNktwC4hpKCsWvHF2zxowH7Lf/ttNFvPDy
	e34XbzH66PAmcWrVWZA7L1Ayz0C5Y2lehTWtg1f5j3bJDn36tFU8fUfP6NtK0J0qzDcIZdpqpau
	NQcUYpp5bH0rFCH5yIH+
X-Google-Smtp-Source: AGHT+IGwtGEt3KqPtzEArH9EO6uoLdPaUjiF2hOKrwwHaDa+GSJgxxkM/g83OEgs0VgyrS2u3iChTw==
X-Received: by 2002:a05:620a:2626:b0:7c3:c500:ca96 with SMTP id af79cd13be357-7c3d9172203mr291491985a.9.1741156807126;
        Tue, 04 Mar 2025 22:40:07 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3d9bcdcc3sm65443785a.60.2025.03.04.22.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:40:06 -0800 (PST)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Date: Wed,  5 Mar 2025 14:39:16 +0800
Message-ID: <20250305063920.803601-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_224008_394343_62E85473 
X-CRM114-Status: GOOD (  21.22  )
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
index 4cc85a36a1ab..b6ff51e1ebce 100644
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


