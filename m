Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C435BEF99E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 00:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcsnYHnaR+mbYSPKQbdhDU9Bq2aFrrJLZtDn7VH/fJc=; b=kxPxOBFnxHvjUY2fLPi1/5FgT4
	0/sOn9Y92+BUjjrLa9oICr4KyVoHIWvT7TKTPoGiD3pAHLEKgWPtGTSCVE3evYWdWdtYXAhwTXzOw
	2xPZDbNBcIzih/2DuTpg8X0RWNbH2IGEN1WAvcw4hCSvZ8U//QQWHLRy9DtdK6AlR+9pq9rcdWZGq
	elf2bt+D6lXhhzvYnJI14QZF5h2gZBDvvP6AdViruFkoD0JP6bvUv2all6NVeEiSGh2HIUqOtanpH
	Ak7nc8Zsfs7upynncPyc3Gjj5y5EpYfHcTmuuaGTbc2+Pf6jqp4rhbLtk9ywnvl39DhtquLSO/BaR
	0wiaFWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr3dj-000000044mn-0mbv;
	Sat, 14 Feb 2026 00:36:03 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr3dg-000000044mN-3xLB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 00:36:02 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1270ac5d3efso1530440c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 16:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771029359; x=1771634159; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcsnYHnaR+mbYSPKQbdhDU9Bq2aFrrJLZtDn7VH/fJc=;
        b=l3J8SOqfK0pqymYLV96erbD01YfanlgaKGNY2VTfBb2j7h7c7oYgXgET+xp/inoVcf
         rYixcBoXCP0wbgW5AN3jh22JEA6zKbkfBjybyZnMJSau2sfzkeUgtsh2kdwdcWaUi4Le
         S/IOGMsT+K545ljLiPxNFkew/VkJUT1iN94qfIIIiAtTcTx0+/oSn9t+xk2PIjhRDtVg
         SWsfE5U/yOwPUb1T5tlp91BHJ0g/Q2zEI8WBl7qySdK1xPwRgWpAO3J7IQK919S6rKQU
         1imF6EeT/SfcDDGzjlvIvNFEA0NBFkNH44F6u4RD5egMkpUaRPUViJly0Zp61rIutq1V
         9Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771029359; x=1771634159;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcsnYHnaR+mbYSPKQbdhDU9Bq2aFrrJLZtDn7VH/fJc=;
        b=RJZ0Ju3BPxJWYwjUlyghmH83Lak/HPzTc/doMfpDMQ5JAbrKrOjjqFeIhAVo8HTK0P
         KUz4FOvi/yF40IxvewNPBPFbHYR+ODuTHZ0mJfbUvkhmr3FvC0o3Mwbvy2CcBnxuhRCn
         YW/72ViGHRmgisblhvcWC5HeZAvcLb8uroeoeInW8JuSArChFhEUTcUWVIvLLaKdtUE6
         1+8En1n7WBWmo9V7Bkx3+FKbveO61fo09Mn+T7iPddsRjZ7xLye8f6kCr7cvizvGU3xn
         lJEZ15HibWSUmerVjjO3Wou/rkM9pqLHxkYtr+BausoVJrjDhXGK4sFGnN46pUtdyzU5
         SJlg==
X-Forwarded-Encrypted: i=1; AJvYcCVn2rQ1+uVHxUawAVZqnAJbe9LrjEayvgNoik+FhaVzJmtOrMIPulBd7jiLz5k7nBeITI3VrTYqeSzrLBNpkcl5@lists.infradead.org
X-Gm-Message-State: AOJu0YzaUvfJ8EzMfw/g9/EUY4aAIe/qK5kn9jLcj/0jAZe34wTrpEJO
	kF9SHP6P6snC2tblCMUvsRO+qJW1dVnCfTVVoJ31HavagewcL7BoUXXZ
X-Gm-Gg: AZuq6aJre3vu4+gLuBcraNzVxmU2RqZszka8Oq16Ebr+kzGLH30o4lrJHg2PY7iLGUK
	8s6OWlz0dLbDKKIezEVsMX+J6j3hfCVmgrcY5NzuGCnx7gqb0AVc+xVX8zSrEpwtpzL3lj3zOad
	H0wcpf7ugQCayMFJPHyJeQ41wKmtvCTCJSkhtV78D17kqaVs9MHepEPkKD7nVGrCLLWlSlj7Q8v
	vh//cRZuhp+UGY9HuaHGg57tTwGhrgIVJuSBT95UdRC04moYX4+FTg0HXptiKOdWfqcTidDN7+o
	j3CWdECvNTvb7Gb7Qba8DQ9bxsRh/vGZzPtpQy7+UmqjYkWMH9jw3scOyK0Iz5ZBL1OB4PL92yi
	ya8MEZZcLB/HOy9RTA+zkJuGWrn+EjWMEgzIT79Cckr/GaiUhalZyulpUWHPTuIbyEf9vfEsjV0
	3D5bPRxdG33xBVx8UIPhNDOWHxDWR6+8PWce5ZVBK8Ugrdor8drGMB9WerQrWzS5mz
X-Received: by 2002:a05:7022:b81:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-12741bc706cmr630038c88.34.1771029359310;
        Fri, 13 Feb 2026 16:35:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:b713:5e7b:5963:d2ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6ce01sm371859c88.7.2026.02.13.16.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 16:35:58 -0800 (PST)
Date: Fri, 13 Feb 2026 16:35:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <aY_BpRQmLdqOOW2K@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_163600_991814_8C1E0842 
X-CRM114-Status: GOOD (  17.60  )
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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is not tested on real hardware, compile tested only...

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
2.53.0.310.g728cabbaf7-goog


-- 
Dmitry

