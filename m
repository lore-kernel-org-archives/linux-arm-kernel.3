Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F29E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkN0Zbqriw5PzthPVlNgEaF6B8Bg927+i+ccWjtK+W4=; b=IRZb343+R+QngrNdHKoQlicZHu
	t/26q4Fxz0bWhPk2O3TZDtKa/hcXAm/L6PuIxbpM6PKuYSWphBx0cOIyUxq9MJgcOdy4stD3j3ASn
	fmmx16h5rfmV0WaawLkIGb4Y58x/YVBMoPuKDCRwJllR8lJ4EtpiVRtrt7ZCamUnNdqQ1XgGJCkUl
	a83vgeT656k4ANkHw3KRpSe6z42fgexQRl9OMu5lUai8A4E5pXtIW4ShxSw8/rD/PCY6J3NLsEomr
	R41nnARNIL6rryCbN9oLG5D1ci+Y9DacCEqaQ3s/M+YhyfZMFZKAnf6+hteGUuMbFjUg1N2uPVm+h
	+Vwk3goA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tURdP-0000000GvCy-0whq;
	Sun, 05 Jan 2025 14:29:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tURb6-0000000Guum-0WXp;
	Sun, 05 Jan 2025 14:27:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385de9f789cso10220927f8f.2;
        Sun, 05 Jan 2025 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736087238; x=1736692038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkN0Zbqriw5PzthPVlNgEaF6B8Bg927+i+ccWjtK+W4=;
        b=BLwlNp0Epjw+AhMXVL1p+1DTJzNn6QPkXdxgfreyW5E0O4dUyHyGUiFRli32/1zgdp
         7IJ3uFWiELhAU67/aSV2NCfu897IZ+5D8+m/RhTm/IAp0AweW0pZdDs0COoBz0lZOYiE
         Pu+SZTvNFTtGFSa0xFG3RYMixjv7RY0jo2tit4VaUVKD/OrhB7MjUkEJ6cYl3kwQ+ni+
         QSpwL6JffP1hkMTARAVLUmj1Cws1toIyFmA+epsvvAs3OXb/zKFa+NdOssNdAuEYESra
         aqycCnm+IwgQ5rjodRGv+5gNLHV2jA1w7yNIcPaWAheSKnpo3a1fRpa7ZeqsCp+JY/Ul
         n0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736087238; x=1736692038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkN0Zbqriw5PzthPVlNgEaF6B8Bg927+i+ccWjtK+W4=;
        b=A9QugmNUTbVGqnxg+RdMvxpIFHavkmQWRp45yqBifNqEiJICVFq1f7E+e3j0qzNS+e
         U+r/kxNAx/oSXhVLMvpROXOXDmMzclB8aO1R520x3zIWBPTvJ5rf0sFN/TDZqd0mOXoY
         dHO5PVZH2pItLrhXM+NZpwDuF88+EELGfTjqeXDiRKt2Nu9mgwyWS3LSH/FP7ggTJuA6
         hNJTX8NbwEfKukjtIk2oe45LIyfjYEdr5lBxQyQJp3dc+jyVAIQbgZ9XN62wERRZrnia
         614UXsGUKY09L/0fRRpmMcSKrKw+C+KbuqwvqXX5Q9JZPh2JtN9i4mWSCo1f+KhEJ/dR
         tUcw==
X-Forwarded-Encrypted: i=1; AJvYcCWOj6HjUCSUy5QD0G0iAOndf/7ZWGfv91+BU7/l56VWsA/8Lr0kfm/AoCf8DgLAca/j5qqTxsfGjbB98y636cOZ@lists.infradead.org, AJvYcCWh8364fGWGNPsyZX2uEHaLz+89WLRVs/IFPu5yOAq3i2ZVrUZem2bTlyDhmphVGjD4Nox8w2WC5uzNUufhAgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvsM8hc8ziUtZZnceOq2bKiIwk/xT9yo6CNI9QO/96u1BIDX6s
	rvrkdlplKV4g2YRBDWvs8hrttADAq2vKMG9rjm1oGncJbbrrH3Wp
X-Gm-Gg: ASbGncu+gAewGL7yHa044JrC9HEfubS3zEYBR4JDAaqOhmc7YxnCxo1lfT5tsZVyVQz
	G80HhP8zK2gQ3sGz20oHYdgUn8Ug20S3vwH/zlCkrAt1deMHQwDsGo42TwNjvYufNlsipmDJyHf
	8plKolAw3nJmIegnEb9GHZseRuatk9HDS82c7hD1Zf+f+ZSWEqt3vQBVGEEFIaCtfWsq55+qOiJ
	OyE1b2SI/W5b5zC+teidAwIm3tPOmyQByjHCEDPgMPewGW7hln2EH+K+XAnTbNze0DWvcT2SbWP
	zO5iZ5S5HYpbizr+zPXi7VJwxzceaNKIUTRUagcwTA==
X-Google-Smtp-Source: AGHT+IFShItsvFWM5KB6b81/btYIKb32afHfsWtgb62Yz8u894GM3GnZ84FQgHqBtY7lSMZXb9jyug==
X-Received: by 2002:a05:6000:154f:b0:385:eeb9:a5bb with SMTP id ffacd0b85a97d-38a221f698amr44870461f8f.17.1736087238032;
        Sun, 05 Jan 2025 06:27:18 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c846ca4sm46438420f8f.43.2025.01.05.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:27:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v9 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
Date: Sun,  5 Jan 2025 15:26:04 +0100
Message-ID: <20250105142645.20128-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105142645.20128-1-ansuelsmth@gmail.com>
References: <20250105142645.20128-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_062720_167098_794DC1B1 
X-CRM114-Status: GOOD (  26.87  )
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

Add simple CPU Freq driver for Airoha EN7581 SoC that control CPU
frequency scaling with SMC APIs and register a generic "cpufreq-dt"
device.

All CPU share the same frequency and can't be controlled independently.
CPU frequency is controlled by the attached PM domain.

Add SoC compatible to cpufreq-dt-plat block list as a dedicated cpufreq
driver is needed with OPP v2 nodes declared in DTS.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v9:
- Fix compile error targetting wrong branch (remove_new change and new PM OPs)
Changes v8:
- Split in dedicated PM domain driver
Changes v7:
- No changes
Changes v6:
- Improve Kconfig depends logic
- Select PM (PM_GENERIC_DOMAINS depends on it)
- Drop (int) cast for 
Changes v5:
- Rename cpu_pd to perf for power domain name
- Use remove instead of remove_new
Changes v4:
- Rework to clk-only + PM set_performance_state implementation
Changes v3:
- Adapt to new cpufreq-dt APIs
- Register cpufreq-dt instead of custom freq driver
Changes v2:
- Fix kernel bot error with missing slab.h and bitfield.h header
- Limit COMPILE_TEST to ARM64 due to smcc 1.2

 drivers/cpufreq/Kconfig.arm          |   8 ++
 drivers/cpufreq/Makefile             |   1 +
 drivers/cpufreq/airoha-cpufreq.c     | 152 +++++++++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/cpufreq/airoha-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 5f7e13e60c80..704e84d00639 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -15,6 +15,14 @@ config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
 	  To compile this driver as a module, choose M here: the
 	  module will be called sun50i-cpufreq-nvmem.
 
+config ARM_AIROHA_SOC_CPUFREQ
+	tristate "Airoha EN7581 SoC CPUFreq support"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select PM_OPP
+	default ARCH_AIROHA
+	help
+	  This adds the CPUFreq driver for Airoha EN7581 SoCs.
+
 config ARM_APPLE_SOC_CPUFREQ
 	tristate "Apple Silicon SoC CPUFreq support"
 	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index d35a28dd9463..890fff99f37d 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_X86_AMD_FREQ_SENSITIVITY)	+= amd_freq_sensitivity.o
 
 ##################################################################################
 # ARM SoC drivers
+obj-$(CONFIG_ARM_AIROHA_SOC_CPUFREQ)	+= airoha-cpufreq.o
 obj-$(CONFIG_ARM_APPLE_SOC_CPUFREQ)	+= apple-soc-cpufreq.o
 obj-$(CONFIG_ARM_ARMADA_37XX_CPUFREQ)	+= armada-37xx-cpufreq.o
 obj-$(CONFIG_ARM_ARMADA_8K_CPUFREQ)	+= armada-8k-cpufreq.o
diff --git a/drivers/cpufreq/airoha-cpufreq.c b/drivers/cpufreq/airoha-cpufreq.c
new file mode 100644
index 000000000000..4fe39eadd163
--- /dev/null
+++ b/drivers/cpufreq/airoha-cpufreq.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/cpufreq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "cpufreq-dt.h"
+
+struct airoha_cpufreq_priv {
+	int opp_token;
+	struct dev_pm_domain_list *pd_list;
+	struct platform_device *cpufreq_dt;
+};
+
+static struct platform_device *cpufreq_pdev;
+
+/* NOP function to disable OPP from setting clock */
+static int airoha_cpufreq_config_clks_nop(struct device *dev,
+					  struct opp_table *opp_table,
+					  struct dev_pm_opp *opp,
+					  void *data, bool scaling_down)
+{
+	return 0;
+}
+
+static const char * const airoha_cpufreq_clk_names[] = { "cpu", NULL };
+static const char * const airoha_cpufreq_pd_names[] = { "perf" };
+
+static int airoha_cpufreq_probe(struct platform_device *pdev)
+{
+	const struct dev_pm_domain_attach_data attach_data = {
+		.pd_names = airoha_cpufreq_pd_names,
+		.num_pd_names = ARRAY_SIZE(airoha_cpufreq_pd_names),
+		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
+	};
+	struct dev_pm_opp_config config = {
+		.clk_names = airoha_cpufreq_clk_names,
+		.config_clks = airoha_cpufreq_config_clks_nop,
+	};
+	struct platform_device *cpufreq_dt;
+	struct airoha_cpufreq_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct device *cpu_dev;
+	int ret;
+
+	/* CPUs refer to the same OPP table */
+	cpu_dev = get_cpu_device(0);
+	if (!cpu_dev)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Set OPP table conf with NOP config_clks */
+	priv->opp_token = dev_pm_opp_set_config(cpu_dev, &config);
+	if (priv->opp_token < 0)
+		return dev_err_probe(dev, priv->opp_token, "Failed to set OPP config\n");
+
+	/* Attach PM for OPP */
+	ret = dev_pm_domain_attach_list(cpu_dev, &attach_data,
+					&priv->pd_list);
+	if (ret)
+		goto clear_opp_config;
+
+	cpufreq_dt = platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
+	ret = PTR_ERR_OR_ZERO(cpufreq_dt);
+	if (ret) {
+		dev_err(dev, "failed to create cpufreq-dt device: %d\n", ret);
+		goto detach_pm;
+	}
+
+	priv->cpufreq_dt = cpufreq_dt;
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+detach_pm:
+	dev_pm_domain_detach_list(priv->pd_list);
+clear_opp_config:
+	dev_pm_opp_clear_config(priv->opp_token);
+
+	return ret;
+}
+
+static void airoha_cpufreq_remove(struct platform_device *pdev)
+{
+	struct airoha_cpufreq_priv *priv = platform_get_drvdata(pdev);
+
+	platform_device_unregister(priv->cpufreq_dt);
+
+	dev_pm_domain_detach_list(priv->pd_list);
+
+	dev_pm_opp_clear_config(priv->opp_token);
+}
+
+static struct platform_driver airoha_cpufreq_driver = {
+	.probe = airoha_cpufreq_probe,
+	.remove = airoha_cpufreq_remove,
+	.driver = {
+		.name = "airoha-cpufreq",
+	},
+};
+
+static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
+	{ .compatible = "airoha,en7581" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, airoha_cpufreq_match_list);
+
+static int __init airoha_cpufreq_init(void)
+{
+	struct device_node *np = of_find_node_by_path("/");
+	const struct of_device_id *match;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	match = of_match_node(airoha_cpufreq_match_list, np);
+	of_node_put(np);
+	if (!match)
+		return -ENODEV;
+
+	ret = platform_driver_register(&airoha_cpufreq_driver);
+	if (unlikely(ret < 0))
+		return ret;
+
+	cpufreq_pdev = platform_device_register_data(NULL, "airoha-cpufreq",
+						     -1, match, sizeof(*match));
+	ret = PTR_ERR_OR_ZERO(cpufreq_pdev);
+	if (ret)
+		platform_driver_unregister(&airoha_cpufreq_driver);
+
+	return ret;
+}
+module_init(airoha_cpufreq_init);
+
+static void __exit airoha_cpufreq_exit(void)
+{
+	platform_device_unregister(cpufreq_pdev);
+	platform_driver_unregister(&airoha_cpufreq_driver);
+}
+module_exit(airoha_cpufreq_exit);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("CPUfreq driver for Airoha SoCs");
+MODULE_LICENSE("GPL");
diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 9c198bd4f7e9..2aa00769cf09 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -103,6 +103,8 @@ static const struct of_device_id allowlist[] __initconst = {
  * platforms using "operating-points-v2" property.
  */
 static const struct of_device_id blocklist[] __initconst = {
+	{ .compatible = "airoha,en7581", },
+
 	{ .compatible = "allwinner,sun50i-a100" },
 	{ .compatible = "allwinner,sun50i-h6", },
 	{ .compatible = "allwinner,sun50i-h616", },
-- 
2.45.2


