Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A39109E528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 23:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KbyKbyFuHp+6dsr0KIzDsUutYDB3nuzbv/Jgu2ebttc=; b=FfyE9ejtNT6spzAS9NJJgxempi
	JPGJKnPuoRLo0tw4TM3++SWsU25+8vr5FMLoAHEzGwk3+qBSsU1oCfRGJ9g+zbc0W8drFwgkeNSc0
	Q4LnlKGrW+YHEgfbZdfV86Uv4SQ9KKpQY19hYdBIkHbt1RutC2UXnTxAWQvWfgey7yHKc3iPkLuvx
	CccmmIfe/qWX5ERBolkXotPYEYBEhXmfp+iY62xcLJtjF5Ch/5pv+1Vu9nCsD2OAEBJQvu19dWzwS
	TGy/DxV2d2euTNGSG2jyAL3aRrI5JgSHLPxdmpcrT+kpNEX4uErj4i2f+D1/DCmkNKVVbDFLEIxJp
	e6hqY7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xfl-00000004QKj-38q6;
	Wed, 25 Mar 2026 23:30:01 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xfj-00000004QK6-0VS1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 23:30:00 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-12a71ade78cso474578c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774481398; x=1775086198; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbyKbyFuHp+6dsr0KIzDsUutYDB3nuzbv/Jgu2ebttc=;
        b=EDNLEghGYGpm/HdQ9c2Fl7GOAGyUmXSsn+buBqPHqzArc/jN8/sX57RoP0mEMYTpF0
         2Fm6MuzcLPhzs1HeistkAtlVOKZXtTGowWoj5zRHixQtrQQ9DkQKkIN5cyaSYNT8hQDH
         KBwWj4ZZRJENmpkgpINBPKfb/0pT6e7ANOjv7B48YnSZbgah8S7t0QopWRx6fkiOm4wJ
         wdbNWVKsOIAKy0eB1I/SzcT2cSW0rbqRsps/GU1NnIQB5PF6yF/eH2C9bGFCB1ipwtL7
         Q0kCgs/ASe5/GZM0fGqNF0pUvGnPXkbRtqdkmvIIiyeG1lhmEC3V65xdWenLBDyFVK2P
         SJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774481398; x=1775086198;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbyKbyFuHp+6dsr0KIzDsUutYDB3nuzbv/Jgu2ebttc=;
        b=oeRHxb+R0dHLB7HOSiSUhXSdijeVz0zbDVo2wwUsN8TC/Uhkr5cmE0iHUMR96ZFFKO
         rQPBQpy9lNLD3fWwd2AWYkykSeKOaVm1jUxGp3y9+SPabHR1T99Eb70GDCRPBD3emcMS
         UKWLcYfitMwBWToA8ue3ZNhh8cjLMH59EOi6OXSNLwHwFU4vKakn1C40jjIvoMA6iyjL
         gCpgkSsPVkDGM1ll5uNmDcw2Ox7WXNYV9oRbcotRDB+EMdQiTBsRpofGh5gqeaDxfLXR
         Z9Q0xdJ/4d2QN6emAxoFltuh5z4CTdwZUSUrAnh385czdE+b4CW5jY6q0EN1xmMjjPS3
         AcBg==
X-Forwarded-Encrypted: i=1; AJvYcCUW/OkbioK1CvR/rXi5CXnmdtIYoqjo1pTGyXdsFSG7hGJxpKMrKd/IhoZzcSRtQe1cvJQ3cC4vk/k9MSPI7wgi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7bYFi5JjdEhcqu/3B0E15t9IokXWVu1IXg9UgeV8OVI7cBSLC
	F28nuqqCdhFfhe6WW9AJu3S16oe6bCfaJ1pmyV5hrTNqNY/KtehCa6PK
X-Gm-Gg: ATEYQzzo8hnGxUuWomjYrY4f07dD5/WOsBQmi5vGncRa7s+wtSPDkVOyiT3vYgUT7F4
	AiZWWXM8gHgo/vFHJnD1uHhog6k6QKGhtUF4UeW7TQMN80uyUPq4YjPszmQJbbUJUL3KSQgOJGy
	MI6IdPMTsOvjef4aSipPU8feiOfusu0bYsYIfmAf6lXGaUYyuC4E62/AgC4bxKFGzYu7QhYKmNE
	4OJPUd4/w5JLBJ/x2YbBqop9AUxHemmNwgRS0CRvBy/USKm+FpWM8iwUCNTpkZSnBdxxxYvMpuU
	raJZUwerERMJj+iL3UVjFIG/Ieb+nMdpY1XkfXf/mD9zc0LzJTQrOj96ik03sTQIBr6BB4rdE6n
	ZnF3tFQrdHmiNYURClmVUzwXU2Fi8Z5S9usYd1HQVSk8QoTEQclr3AjkB99bSgDbHgzNtviG8ZK
	E99Aa39jnBHpNeiy4CLNAMbh6HC9XPTnHGbHwijb8FJMpiCoGb/xjnATzHJLhpc+P9
X-Received: by 2002:a05:7022:402:b0:122:8d:3688 with SMTP id a92af1059eb24-12a96eceb55mr2801523c88.22.1774481397800;
        Wed, 25 Mar 2026 16:29:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7274231sm1355207c88.8.2026.03.25.16.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:29:57 -0700 (PDT)
Date: Wed, 25 Mar 2026 16:29:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <acRtWZohqfDLbMKE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_162959_169508_CA9135F6 
X-CRM114-Status: GOOD (  17.87  )
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

As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
device can be instantiated via device tree.

Add the declaration there and drop board-paz00.c file and relevant
Makefile fragments.

Tested-by: Marc Dietrich <marvin24@gmx.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

V2:
- added Marc's Tested-by

V1:
- https://lore.kernel.org/r/aY_BpRQmLdqOOW2K@google.com

 arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
 arch/arm/mach-tegra/Makefile               |  2 -
 arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
 arch/arm/mach-tegra/board.h                |  2 -
 arch/arm/mach-tegra/tegra.c                |  4 --
 5 files changed, 8 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
index 1408e1e00759..d1093ad569e6 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
@@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
 		enable-active-high;
 	};
 
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "wifi_rfkill";
+		radio-type = "wlan";
+		reset-gpios = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-alc5632-paz00",
 			"nvidia,tegra-audio-alc5632";
diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index a2bb55bc0081..9e3abb14fbc1 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -15,5 +15,3 @@ obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= pm-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= pm-tegra30.o
-
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-paz00.o
diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
deleted file mode 100644
index 3ec810b6f1a7..000000000000
--- a/arch/arm/mach-tegra/board-paz00.c
+++ /dev/null
@@ -1,56 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-tegra/board-paz00.c
- *
- * Copyright (C) 2011 Marc Dietrich <marvin24@gmx.de>
- *
- * Based on board-harmony.c
- * Copyright (C) 2010 Google, Inc.
- */
-
-#include <linux/err.h>
-#include <linux/gpio/machine.h>
-#include <linux/gpio/property.h>
-#include <linux/platform_device.h>
-#include <linux/printk.h>
-#include <linux/property.h>
-
-#include "board.h"
-
-static const struct software_node tegra_gpiochip_node = {
-	.name	= "tegra-gpio",
-};
-
-static const struct property_entry wifi_rfkill_prop[] __initconst = {
-	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
-	PROPERTY_ENTRY_STRING("type", "wlan"),
-	PROPERTY_ENTRY_GPIO("reset-gpios",
-			    &tegra_gpiochip_node, 25, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("shutdown-gpios",
-			    &tegra_gpiochip_node, 85, GPIO_ACTIVE_HIGH),
-	{ }
-};
-
-static const struct platform_device_info wifi_rfkill_info __initconst = {
-	.name		= "rfkill_gpio",
-	.id		= PLATFORM_DEVID_NONE,
-	.properties	= wifi_rfkill_prop,
-};
-
-void __init tegra_paz00_wifikill_init(void)
-{
-	struct platform_device *pd;
-	int err;
-
-	err = software_node_register(&tegra_gpiochip_node);
-	if (err) {
-		pr_err("failed to register %s node: %d\n",
-		       tegra_gpiochip_node.name, err);
-		return;
-	}
-
-	pd = platform_device_register_full(&wifi_rfkill_info);
-	err = PTR_ERR_OR_ZERO(pd);
-	if (err)
-		pr_err("failed to register WiFi rfkill device: %d\n", err);
-}
diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
index 7b3ef0dc9be1..86c3ea0d6b30 100644
--- a/arch/arm/mach-tegra/board.h
+++ b/arch/arm/mach-tegra/board.h
@@ -19,6 +19,4 @@
 void __init tegra_map_common_io(void);
 void __init tegra_init_irq(void);
 
-void __init tegra_paz00_wifikill_init(void);
-
 #endif
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 9ef1dfa7b926..f324a7e491d8 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -83,10 +83,6 @@ static void __init tegra_dt_init(void)
 
 static void __init tegra_dt_init_late(void)
 {
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_machine_is_compatible("compal,paz00"))
-		tegra_paz00_wifikill_init();
-
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
 	    of_machine_is_compatible("nvidia,tegra20"))
 		platform_device_register_simple("tegra20-cpufreq", -1, NULL, 0);
-- 
2.53.0.1018.g2bb0e51243-goog


-- 
Dmitry

