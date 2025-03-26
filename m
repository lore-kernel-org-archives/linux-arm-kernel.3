Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E669C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfWPxJMZWDbPabK9A0cScyoCsTf6JLaH/ayUOaIY6ps=; b=Aa2HLeTy1NSJjCaA/D6O3fQr5C
	lWcV9tpmQ2XFWJrAHrwhEMX9BzmChnFfT5hf86RkWOAG4/NND/taHtPlCxeDvcD68lNZGC9w+dbVZ
	widqUS/JbJ7w9tDEeNFrzEmFCciecgA0P1xqo24DJ3kURrB/NvN2dwM5HeFT1b8DVhtW4Dw0ZdvVx
	24I9ubXmGTqVTepvnMOiYJ8fIQblG8T7ILJ1RcTA0ByklW4Kd9Up3X1J16v3nAGZ/M/h5JKqW9qa7
	6tp7oWB6gI4GC3wKLRG5ialdu3nz4LBnAMRdtqYDqWYQWKUNavGK/mBcsGzPvM/zK7m4Qe7jvlELu
	rVsznlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS75-00000008kuz-2Z1E;
	Wed, 26 Mar 2025 14:52:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvJ-00000008iSz-1ujE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:07 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so62906525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000004; x=1743604804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfWPxJMZWDbPabK9A0cScyoCsTf6JLaH/ayUOaIY6ps=;
        b=lPiFwPUdlnJba+twDEc7jGTP2utyLTUbm+4UyLO7hXyyJz6OweW+sOJNtG9AFSkeOq
         QOnJXA59aZr/dPFS+gK/htEt/ar43wcdVqflxud3suwUL1KNt/B4CPuFc5Bpr8m3LfM5
         30vYNsgPnzCG5gyFpKjxExEwY/Q0rsGicFB6lnggDYtpoSYArs7R0SGU47FFld/Dn/WM
         zIYApNI71XDh82uxymmWsrZ1q/A5+Cpyq62O4PsQQy2j2zU77lysy6XZ+zxbOPrXXfuQ
         /SxuDMHkEVadVpeQJ3rrcc5GNZXigZZ2TcesE9p2YfkFUQVsv1Hf1qcF9k+Enn/pAFJL
         aEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000004; x=1743604804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfWPxJMZWDbPabK9A0cScyoCsTf6JLaH/ayUOaIY6ps=;
        b=sswnS73wl2J4b3jfku/K5geKBKCJuTgL8MSXyWIePcDmqDi2iVgjJqB/AqQoKyD2lZ
         7rV/uNwrf4FMbD/6bRWubs4ex3WJndwBobdLQiGAiLI4xJZDwHl79yUedJ/v6A15Di7s
         9Xz7uWRuR6r4M/aNUEWiewbCECfDEB9QU/GtjwjDKtme58QG/N/3MMhfSsiKnCYwaG4m
         XDsO3XKpY6atdGuTnJQzIv9tdrXfG+yK6Rs3zk8FSxUwLWDJy/uoGCSk/GtN73Ud/5mi
         chOLqOGAlazzPhJgnGGTVjSs4iepQlDCwEQaw5neZM1hMY/J6OKM5x28lWlCh10uMUhb
         PIaw==
X-Forwarded-Encrypted: i=1; AJvYcCX3E/H5uS5fLxfF6hIKmiamgCkJL0Zm8bXlc5k5Q7MwC7BDs23HV6jZYu6wdOz1YgUpw4L8RD1YTqoBfRZ+ODnq@lists.infradead.org
X-Gm-Message-State: AOJu0YzVzoBECz4bdcUQMd3tlO1GfnCYMDZW740nO+XPaChytcxcTxmD
	g050Ofoy99YZ5Y31x9cK7lCXH6JwfsOTK0izzjSN6ONakNO67aom
X-Gm-Gg: ASbGncvF7wH2bVbzjnIWJzyGcqnTu8dIC8K+91oXN6C9pFDQL7JZAyngp7ksjp5OoXm
	L2bcVcBcGYGhE7Qh1pLuwG8TFzFhcdAyFFO9Ln3JWB/KFTJvhOmRXS1JmecngbOAj3IFJDvN+Oa
	0cTlTyr8YbfUH8lZT64mjBiM9THc0qeoD6/7jdmwX+G/8OxACBFyC1EysPjJsJk1+wBZ8YD7FNw
	7LSCw+tiNgXPTq4GZN940Cy6S/ViNpest2hLC/NmEKfOYKgrpLtgEX6pZ/O4JUjWJRjWNX4c35N
	ijLoMp5Ifm51P6lEckfy/dNfDy6yOZADT26jyxV+woXPsnnrlY8N3kN9ECFnVWj1OLx6
X-Google-Smtp-Source: AGHT+IFxPoFiFFzlZQKUvpyfPvY23wqd/3RQqJbo1Eebx/kOv3kRN9xR6Jg2ZqEFXucT15Ok+zJ/zw==
X-Received: by 2002:a05:600c:3d93:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43d58db553amr140420155e9.12.1743000003516;
        Wed, 26 Mar 2025 07:40:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 05/15] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:35 +0000
Message-ID: <20250326143945.82142-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074005_498455_6E7AA71E 
X-CRM114-Status: GOOD (  23.67  )
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

Add SoC identification for the RZ/V2N SoC using the System Controller
(SYS) block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig         |   5 ++
 drivers/soc/renesas/Makefile        |   1 +
 drivers/soc/renesas/r9a09g056-sys.c | 107 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       |   3 +
 drivers/soc/renesas/rz-sysc.h       |   1 +
 5 files changed, 117 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 764aba6d1ae6..14888db23556 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -354,6 +354,7 @@ config ARCH_R9A09G047
 
 config ARCH_R9A09G056
 	bool "ARM64 Platform support for RZ/V2N"
+	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
 
@@ -402,6 +403,10 @@ config SYS_R9A09G047
 	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYS_R9A09G056
+	bool "Renesas RZ/V2N System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
 config SYS_R9A09G057
 	bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
 	select SYSC_RZ
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 81d4c5726e4c..3bdcc6a395d5 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
 obj-$(CONFIG_SYS_R9A09G047)	+= r9a09g047-sys.o
+obj-$(CONFIG_SYS_R9A09G056)	+= r9a09g056-sys.o
 obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 
 # Family
diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
new file mode 100644
index 000000000000..3bea674c785e
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/V2N System controller (SYS) driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/string.h>
+
+#include "rz-sysc.h"
+
+/* Register Offsets */
+#define SYS_LSI_MODE		0x300
+#define SYS_LSI_MODE_SEC_EN	BIT(16)
+/*
+ * BOOTPLLCA[1:0]
+ *	    [0,0] => 1.1GHZ
+ *	    [0,1] => 1.5GHZ
+ *	    [1,0] => 1.6GHZ
+ *	    [1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
+
+#define SYS_LSI_PRR			0x308
+#define SYS_LSI_PRR_GPU_DIS		BIT(0)
+#define SYS_LSI_PRR_ISP_DIS		BIT(4)
+
+#define SYS_RZV2N_FEATURE_G31		BIT(0)
+#define SYS_RZV2N_FEATURE_C55		BIT(1)
+#define SYS_RZV2N_FEATURE_SEC		BIT(2)
+
+static void rzv2n_sys_print_id(struct device *dev,
+			       void __iomem *sysc_base,
+			       struct soc_device_attribute *soc_dev_attr)
+{
+	unsigned int part_number;
+	char features[75] = "";
+	u32 prr_val, mode_val;
+	u8 feature_flags;
+
+	prr_val = readl(sysc_base + SYS_LSI_PRR);
+	mode_val = readl(sysc_base + SYS_LSI_MODE);
+
+	/* Check GPU, ISP and Cryptographic configuration */
+	feature_flags = !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_FEATURE_G31 : 0;
+	feature_flags |= !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N_FEATURE_C55 : 0;
+	feature_flags |= (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N_FEATURE_SEC : 0;
+
+	part_number = 41;
+	if (feature_flags & SYS_RZV2N_FEATURE_G31)
+		part_number++;
+	if (feature_flags & SYS_RZV2N_FEATURE_C55)
+		part_number += 2;
+	if (feature_flags & SYS_RZV2N_FEATURE_SEC)
+		part_number += 4;
+
+	if (feature_flags) {
+		unsigned int features_len = sizeof(features);
+
+		strscpy(features, "with ");
+		if (feature_flags & SYS_RZV2N_FEATURE_G31)
+			strlcat(features, "GE3D (Mali-G31)", features_len);
+
+		if (feature_flags == (SYS_RZV2N_FEATURE_G31 |
+				      SYS_RZV2N_FEATURE_C55 |
+				      SYS_RZV2N_FEATURE_SEC))
+			strlcat(features, ", ", features_len);
+		else if ((feature_flags & SYS_RZV2N_FEATURE_G31) &&
+			 (feature_flags & (SYS_RZV2N_FEATURE_C55 | SYS_RZV2N_FEATURE_SEC)))
+			strlcat(features, " and ", features_len);
+
+		if (feature_flags & SYS_RZV2N_FEATURE_SEC)
+			strlcat(features, "Cryptographic engine", features_len);
+
+		if ((feature_flags & SYS_RZV2N_FEATURE_SEC) &&
+		    (feature_flags & SYS_RZV2N_FEATURE_C55))
+			strlcat(features, " and ", features_len);
+
+		if (feature_flags & SYS_RZV2N_FEATURE_C55)
+			strlcat(features, "ISP (Mali-C55)", features_len);
+	}
+	dev_info(dev, "Detected Renesas %s %sn%d Rev %s %s\n", soc_dev_attr->family,
+		 soc_dev_attr->soc_id, part_number, soc_dev_attr->revision, features);
+
+	/* Check CA55 PLL configuration */
+	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
+		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
+}
+
+static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initconst = {
+	.family = "RZ/V2N",
+	.id = 0x867d447,
+	.devid_offset = 0x304,
+	.revision_mask = GENMASK(31, 28),
+	.specific_id_mask = GENMASK(27, 0),
+	.print_id = rzv2n_sys_print_id,
+};
+
+const struct rz_sysc_init_data rzv2n_sys_init_data = {
+	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 14db508f669f..ffa65fb4dade 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -88,6 +88,9 @@ static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYS_R9A09G047
 	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sys_init_data },
 #endif
+#ifdef CONFIG_SYS_R9A09G056
+	{ .compatible = "renesas,r9a09g056-sys", .data = &rzv2n_sys_init_data },
+#endif
 #ifdef CONFIG_SYS_R9A09G057
 	{ .compatible = "renesas,r9a09g057-sys", .data = &rzv2h_sys_init_data },
 #endif
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index aa83948c5117..56bc047a1bff 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -42,5 +42,6 @@ struct rz_sysc_init_data {
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 extern const struct rz_sysc_init_data rzv2h_sys_init_data;
+extern const struct rz_sysc_init_data rzv2n_sys_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.49.0


