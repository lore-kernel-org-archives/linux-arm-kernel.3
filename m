Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA57C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgCtpqqgn38oeYCLmnm2mb3AWR3Tqp2NnheWLsUnJas=; b=M/dQPZDdLryHGy1scCQMq41E5Q
	bWo1SxeiS5E9KrBbFupZ1nUvdQuBeU2xlXR9GYY12JUskC4nzbQz0pT9UbMhC7gazTqwyLNH2IW2/
	t4phILjC2X9fTqa0HxiwPdsM6vvA2nQRz2261RUOsKwg61o3hr1OaiY3ksDIYy4++WTKGhcQ3NrBd
	D8tunQ8eMDkuZtODPVfnhOfXBsJrzXZz5MsghVjNsCIMmJcCRIVHQbKpUOAroM1DyafbZG8lMfqNp
	0EycAx4bKcD42pfG2AjLrurrQ7XKQQHKH4NBRlUhL4mCQ8vVkj5lcGKLEhokJ42o/L8uii1RuYnLr
	wVPfzpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjK1-0000000Ey4E-3oMI;
	Fri, 04 Jul 2025 16:31:33 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3e-0000000EvCh-3SPp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so1652103a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645677; x=1752250477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgCtpqqgn38oeYCLmnm2mb3AWR3Tqp2NnheWLsUnJas=;
        b=V9bf/KNuyzEhYkRfGlnIAgalHIqJns7MQcYBlpTdZqDLopEsTWdUs6u0vvTm8+IQei
         vqjFtd3zucbI61sNR6X3f4dttTgEXOjC0aR3JcO8MvoJluQFdDDi+uWyG6peaZ9PIfhD
         gt+CVWGsUCUs5Y+miY2OKyQlb2oKMVGvJx/i2JU7wQ6N10ygxxZQzaR3cmhDhUBalkVM
         E8bvj4zNec82OaVbcsXWP6UCe38aS7yUbNON6a2JFnBFYcFF3GFK4VIWYWF9wQNHijjV
         HdPhch9q2IDSwwvKXU5yvETbMt2/N5M2zBdf8rtl4bv+wnLWpFnzd500A+C+7ke9bhCz
         B3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645677; x=1752250477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgCtpqqgn38oeYCLmnm2mb3AWR3Tqp2NnheWLsUnJas=;
        b=RhnE4Qdk1Uqcd2Yw9rOG8Sq1SlFPVJZYjZuC0w8F6/7S/7aAsTRJfFfkq8SToHidUl
         mHbTIv+QgsHe19GR2cbrIrZstPE69d+Ix43KSXg9oxJ63isdzQnGVjW/O1P91InNeM5U
         e0i1sIkRas23kze20l1lr0I5hNUmNVw8bguOZJ0uIMOYMHV9MmkRTZz045zfXqc7Yqzu
         /Lb0c8oKbsUeWcWc1XI6wSsxcNWUCEhQ7R6dnPwYOefziCmrNzygDNyF10cRnnCsimGa
         9t5dDCPQ1as25ISRgx6EGX8d+G60F1ngfEfOdZ4gKPQhJCx70A2vkp3mqCSK/3So3uxP
         lmUg==
X-Forwarded-Encrypted: i=1; AJvYcCXLm2tffsbQIs4ZKjoqXtKaAc8pLUpLlFvyfTXwbLOpcq7IEoX82ek9hp0+ciXNChJXVWEnEW4Le8aKtqnDn32j@lists.infradead.org
X-Gm-Message-State: AOJu0Yya0mLGA8ebB/vxhUL83gtJFT3qW770d6Zj1HxN0iJ04iR7JfxH
	icuEV4VYwr5uy9pX8u7b9nu/gxhXl6+rXm6Be2j2lr7ciwKdd4HgM2Ub1Rs231qpSDM=
X-Gm-Gg: ASbGncsiB4cupiM6lT6q49MI5A1OyENR15b3bWDDHDwMDppo2PlBh7WFoc1Iii/jTLu
	xt0tgSYM7TSMuVT0K2ejAZFndFUKuhv9WPUDRDwpdYLnxG4jSE1QYQH3bQvAxOJTMUPsG/HhMmC
	kACMyqpkCH7HT3vJ3jjFiAM8/HAwXrwsLCOA1xkoZujXfs4ZLFWd3MxjEdpsPf8kUMS3xwGqAvW
	bH7Jta965SLLdncV5uQV+C7/Fa8gkH7zWGAw/Bb+NbSvb5ATO6DjlkOdjfsrqHOPfr9jlCQklOE
	HluynCLVODqysj+lIpRE1U+s53+aOJnewGK+Yg3N3dVDjIK0hCXJX1ljAX83NqdkZmBQNLNqaSn
	A4xN3k+bgjGjpXyM=
X-Google-Smtp-Source: AGHT+IEwTpH1PdXGNkun2+FZQKwc/iZhEarO6PtA/vdMrWXwR9cFeo/knhPNouC+KTYZgUm2rnSe8A==
X-Received: by 2002:a17:907:971a:b0:ae0:9363:4d5d with SMTP id a640c23a62f3a-ae3fbc405c7mr307577466b.2.1751645677173;
        Fri, 04 Jul 2025 09:14:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/9] soc: renesas: rz-sysc: Add syscon/regmap support
Date: Fri,  4 Jul 2025 19:14:01 +0300
Message-ID: <20250704161410.3931884-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091438_865031_E68C9716 
X-CRM114-Status: GOOD (  22.82  )
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

From: John Madieu <john.madieu.xa@bp.renesas.com>

The RZ/G3E system controller has various registers that control or report
some properties specific to individual IPs. The regmap is registered as a
syscon device to allow these IP drivers to access the registers through the
regmap API.

As other RZ SoCs might have custom read/write callbacks or max-offsets,
add register a custom regmap configuration.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[claudiu.beznea:
 - s/rzg3e_sysc_regmap/rzv2h_sysc_regmap in RZ/V2H sysc
   file
 - do not check the match->data validity in rz_sysc_probe() as it is
   always valid
 - register the regmap if data->regmap_cfg is valid]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- picked the latest version from John after he addressed the review
  comments received at [1];
- I adjusted as specified in the SoB area

[1] https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/

 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c | 10 ++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  | 10 ++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 10 ++++++++++
 drivers/soc/renesas/rz-sysc.c        | 17 ++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  3 +++
 6 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 1930a12b8fa7..58a4ab2643d6 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -452,6 +452,7 @@ config RST_RCAR
 
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
+	select MFD_SYSCON
 
 config SYSC_R9A08G045
 	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..0ef6df77e25f 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -18,6 +18,16 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 	.specific_id_mask = GENMASK(27, 0),
 };
 
+static const struct regmap_config rzg3s_sysc_regmap __initconst = {
+	.name = "rzg3s_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0xe20,
+};
+
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.regmap_cfg = &rzg3s_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index cd2eb7782cfe..a3acf6dd2867 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -62,6 +62,16 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 	.print_id = rzg3e_sys_print_id,
 };
 
+static const struct regmap_config rzg3e_sysc_regmap __initconst = {
+	.name = "rzg3e_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x170c,
+};
+
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.regmap_cfg = &rzg3e_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 4c21cc29edbc..c26821636dce 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -62,6 +62,16 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.print_id = rzv2h_sys_print_id,
 };
 
+static const struct regmap_config rzv2h_sysc_regmap __initconst = {
+	.name = "rzv2h_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x170c,
+};
+
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+	.regmap_cfg = &rzv2h_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index ffa65fb4dade..70556a2f55e6 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -6,8 +6,10 @@
  */
 
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 
 #include "rz-sysc.h"
@@ -100,14 +102,19 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
 
 static int rz_sysc_probe(struct platform_device *pdev)
 {
+	const struct rz_sysc_init_data *data;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
 	struct rz_sysc *sysc;
+	int ret;
 
 	match = of_match_node(rz_sysc_match, dev->of_node);
 	if (!match)
 		return -ENODEV;
 
+	data = match->data;
+
 	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
 	if (!sysc)
 		return -ENOMEM;
@@ -117,7 +124,15 @@ static int rz_sysc_probe(struct platform_device *pdev)
 		return PTR_ERR(sysc->base);
 
 	sysc->dev = dev;
-	return rz_sysc_soc_init(sysc, match);
+	ret = rz_sysc_soc_init(sysc, match);
+	if (ret || !data->regmap_cfg)
+		return ret;
+
+	regmap = devm_regmap_init_mmio(dev, sysc->base, data->regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return of_syscon_register_regmap(dev->of_node, regmap);
 }
 
 static struct platform_driver rz_sysc_driver = {
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 56bc047a1bff..447008140634 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -9,6 +9,7 @@
 #define __SOC_RENESAS_RZ_SYSC_H__
 
 #include <linux/device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
@@ -34,9 +35,11 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @regmap_cfg: SoC-specific regmap config
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	const struct regmap_config *regmap_cfg;
 };
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
-- 
2.43.0


