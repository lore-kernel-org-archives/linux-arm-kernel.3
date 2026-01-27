Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12891D2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUUqo5kZZv1zWUwV91QbLiq3DapYQlumHl9ZCBmmuIY=; b=M/8w6yE1z5a+nOdGTD905OjVtX
	Do25uS3031z/1S6agvI6EP7F04x+B/BNGCAPXALPafMR8KNfxtKWEAW/cZMJ8XWQOLFO1p7Jnt7Cl
	3u85Vdq6yERP3SlXSe7KArG34cDqGtfMaSRGl1sy6+576SSiCoxjzMKz0NVxY+wCJegszv3lRpnWu
	esZ+dm5oMA3mLEw0vVOEY/kWhXQnUr79OYe12HdFgo65p3lKYDyY5GZKtFonRMZXBS+CpWQ/yG+cE
	YYnZGSlVgfVuNY0VcFIKO00BG7A0f9BfPJcEezLwE/eZtADCoVFrIElNwXbW1UBQSufVuI3WMvYKx
	RC3KxRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoY8-0000000EtwM-2nGY;
	Tue, 27 Jan 2026 19:16:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoY6-0000000EtvK-2nZ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso61935105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541385; x=1770146185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUUqo5kZZv1zWUwV91QbLiq3DapYQlumHl9ZCBmmuIY=;
        b=mYjeWl4TbHdtu+4ASDfTicMT/yzbcdoxM9oOnUlqik1UHXX+Cwh3rkaQYbiRwHW4nR
         fzTKb+8ydHo4WVVsnzJ3BkWlMIHCMD8hIV6c04gavwMexuk5nzdzwdh9emV+UMyC+yBg
         PdmTE6/5xjR/IxKc0ODmJ2XABi1w2aIlto5A+HvEE92512NombS8iDiTY8q39wg8vFZn
         xkQ7uf6LuWg+pGbZ/iv/LIyMGweWwRdzQaxVaMP1ii8ta+AZtc1n+zwPSBx0gX8ksxw4
         3HAHoGBMHmztescUkY+r/XF54y0H84F1R2HLN6qnXC3Hs0SQpBzwDihHbzhs4jSCSdy2
         s5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541385; x=1770146185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUUqo5kZZv1zWUwV91QbLiq3DapYQlumHl9ZCBmmuIY=;
        b=bcwV0zqB/QSJDayIqaXI4ctcBxuFqFt/7BEQujaeIVcjMbTNvTiKKMlpjmZU6wSi6T
         UYHDDW6PKkzIZ1M7NRttXSR0Yi+rT+L19xvYS8zNUWECgYPyTTvTGltFjyZURhCZOnJ3
         vZDUgOeb3XWcfr0QhQ5R7OcRd38D3VzPQNo1+UqDePHD0RnQoiA4Z8xdfxscvQiura17
         WpRaoWXfWV0rMO2oWJt7WuUqG1AMyteR5TX2nGle/WG0NpKSQGsew9sYSab5jbA+FqDB
         YBGdt+jqDAbVikxhEppcqoeBoeLIu9LfAWmCPsemjxzp8TtET198EQbMd4C5i5rJ2G5N
         JElg==
X-Gm-Message-State: AOJu0Yx4g1YUNuN17PgPoFfz0mg/8oA3uzJlJ22W1AICJElyyde4AT+U
	KCN5dHTSvnoFofiFR4cBXtO7YFT2Cpjgw7oWq308JQ1NWp3dcdpN59RprWLPeg==
X-Gm-Gg: AZuq6aK3saQjXh+mPWJKFS/IY9MH6mJUl/D1rW3JhPVrde4dzylIZdrQ9ygTAqhcPiP
	hurRZBqvCkgxuqil6pdov7LoBMLr3TcycIXA7CcgU3E+sFSppOFo0M5wiZA9dIjXUAPtKIL+9v+
	7O4wbNAKciPNK7DKJJ5HwEnudwrSazNe4YJ2O1qeSzLtEH/EK6u3hPJz4XQJVtm5W0xr2NrjEC2
	4cCckDoaczEbA3GMKnU8Vumwliq3rOiZJJNJsNQ7Rvw/9YjvarsmklUPHf9FcsGjGQD5TlzmpFC
	kze66YjpbJC8gZJbce1oO4h4igYqW0bUwPrvgcLuyC5ks33vkcxwik+QUKO/s4z01qL0/1Gw37p
	AdvPJk9s2KmOjhz5rVXdec1P4/6y0Lom43TezhVBNDYogACagjCZQPDiticHaNDs3X03sooc0IM
	YXvvN+4xBhMa6UaYbbnL+78hlT
X-Received: by 2002:a05:600c:4e15:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-48069c0e620mr39926755e9.10.1769541384608;
        Tue, 27 Jan 2026 11:16:24 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:24 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] ARM: zte: Add zx297520v3 platform support.
Date: Tue, 27 Jan 2026 22:16:12 +0300
Message-ID: <20260127191618.551317-2-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127191618.551317-1-stefandoesinger@gmail.com>
References: <20260127191618.551317-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_111626_717615_67452D95 
X-CRM114-Status: GOOD (  15.47  )
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

---
 arch/arm/Kconfig               |  2 ++
 arch/arm/Makefile              |  1 +
 arch/arm/mach-zte/Kconfig      | 19 +++++++++++++++++++
 arch/arm/mach-zte/Makefile     |  2 ++
 arch/arm/mach-zte/zx297520v3.c | 19 +++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4fb985b76e97..bd2cae242603 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -463,6 +463,8 @@ source "arch/arm/mach-versatile/Kconfig"
 
 source "arch/arm/mach-vt8500/Kconfig"
 
+source "arch/arm/mach-zte/Kconfig"
+
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index b7de4b6b284c..573813ef5e77 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -223,6 +223,7 @@ machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
 machine-$(CONFIG_ARCH_U8500)		+= ux500
 machine-$(CONFIG_ARCH_VT8500)		+= vt8500
+machine-$(CONFIG_ARCH_ZTE)		+= zte
 machine-$(CONFIG_ARCH_ZYNQ)		+= zynq
 machine-$(CONFIG_PLAT_VERSATILE)	+= versatile
 machine-$(CONFIG_PLAT_SPEAR)		+= spear
diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
new file mode 100644
index 000000000000..17497c23eba7
--- /dev/null
+++ b/arch/arm/mach-zte/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig ARCH_ZTE
+	bool "ZTE ZX family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for ZTE ZX-based family of processors.
+
+if ARCH_ZTE
+
+config SOC_ZX297520V3
+	default y if ARCH_ZTE
+	bool "ZX297520v3"
+	select ARM_GIC_V3
+	select HAVE_ARM_ARCH_TIMER
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Support for ZTE ZX297520v3 SoC. It a single core SoC used in cheap LTE to WiFi routers.
+
+endif
diff --git a/arch/arm/mach-zte/Makefile b/arch/arm/mach-zte/Makefile
new file mode 100644
index 000000000000..1bfe4fddd6af
--- /dev/null
+++ b/arch/arm/mach-zte/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_ZX297520V3) += zx297520v3.o
diff --git a/arch/arm/mach-zte/zx297520v3.c b/arch/arm/mach-zte/zx297520v3.c
new file mode 100644
index 000000000000..e8db18c2f665
--- /dev/null
+++ b/arch/arm/mach-zte/zx297520v3.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 Stefan Dösinger
+ */
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+static const char *const zx297520v3_dt_compat[] __initconst = {
+	"zte,zx297520v3",
+	NULL,
+};
+
+DT_MACHINE_START(ZX, "ZTE ZX297520v3 (Device Tree)")
+	.dt_compat	= zx297520v3_dt_compat,
+MACHINE_END
-- 
2.52.0


