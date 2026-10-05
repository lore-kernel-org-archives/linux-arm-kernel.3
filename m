Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D20CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=; b=16/g6MsC85QHzjNxxk2DupbLAH
	eF3BKqiXZHsAlZBqaoMLqcqcoStT8Kbng41t7HJeQ0bMpPILMGWVHHFrpPWLlIw5NGM1X0AaSxD6T
	KldDQwhrWeTfPvOQXmNk1nLElU2k/A47fzzZQbRFQ3bB0wiKCvFmPffwm96K+jh35wXHcuYOE+upw
	YAcO9MES/edj4jkWDVYdZvUTpae1AuKvDz5mK3wOkGv/aXBhWJrWEvO7hWw6XNgSIQEK1Oh3uvIDE
	gRSu6txt3pVox+W923XsFw9cAp+HiFbLLJxxui0F4im3D+rFopPxq+Y7sWasZ5O+Uwg9/Nbc+Sme+
	/2GldHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIK-0000000H7zg-0SHN;
	Mon, 05 Oct 2026 20:28:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIE-0000000H7ve-2GyG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6aa850436d3so2639459a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232092; x=1791836892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=RjaqWODNJcOgsTKXOm1mJV3byv1uAWpPVk8BHlylZcBxaZDbdUC2gEUTN5+QUjIEFr
         h4rkwGMYuPIRoBSMk636J1N2nnrFVy3uCW3narjezMaFih+XHwmKFHG0WOcfLlQv59r/
         mJsUvyfaaJUgDTTQ7f8iyDY7y+ji5YVacASSMMA+qKCNka+U6KpaV3yijKc47MiFcwwJ
         5ILmRtnBbYyzRcHeTHfQsdCOi5dsij24GVI0+juPeQ699sWbGQlw1RjnrtqUpkiRrs/w
         wYTAyrKJHNQpjGhMB807pqCJadgNwviD0GEtr8iZ+mMedxK3/9BSW9HDbVNDF3DpRDHY
         ngiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232092; x=1791836892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=dOMAHeECOnrKu18s6y6makF2b7sdIId2SW+ix/GlZkA4PFNG7C/KY6DOK5mLpoUJDe
         zLvV2tBumxCkdALQu5KTA9cuX3edaGSDaxqXwSs4qQY1uY0s8+ThrwtAPaprybQyWx8t
         9B5MzJFm1xVImmsbFQWvTlCPmj+cyTrqtvFMbYhONBDZA1s1xwQ4/Wre/kqiYdD6U2OX
         HEx4aDHQQGQV+fsuFsX8d7WiutNyqkLGZOqHbveQ+jTCPIv5Dhn522rpgp2lN6zrZ0yi
         rxxKnwHXvkWjElu4YCFth/2HVJS9Xgb9hO/CzYdKy9bnR8QkW0EAXXVmtEVpxFYITFMe
         9uTg==
X-Forwarded-Encrypted: i=1; AKwUvBxm4X+qOSrNZn2xBKBm+z2YtY16eqYbi/amGqN7tDT6AeYcmLgZiXBlHOGZmj+UELs/w/p2QqlFN5Zo6jLiVQv5@lists.infradead.org
X-Gm-Message-State: AFq9FYLmj6ZMdKQQmzpARZKA6Mi5EzzDiGbN9fCgnZ+pNZhZqxPUIbAy
	WRvP9TbxsoFy3QVnAfIMsfKMXWAPSbUBaop4ToW6I3Eza2F0CGKH/CXu
X-Gm-Gg: AYBFou2/m9jU/FYX4vPyNukimSqkfZPNyZ/sNbv64oXsMHTdfCsOjzHwt4H2BLy1opz
	BBvk4eL8QrsI0cmyNn2K5Gd3d0BmrhN0izf5Uc/sqJn2oG51hDTA5dG6yGeYRKpXgn97NcFXcNt
	EnB0NnXYj5KONm5C0Ig6XMFNjy7TQIJ5weisGWHhCuHkqiwSUGu7vQEVN1F7Y5rjQfTfjJwS2eE
	xEo6XM090pasMRyBlPoaZLPy+STSgwotLdoXNdRXViNJOMWeQNnpEA1j+5HFSMiiZz8nDirpPqB
	sdN5S6m+imB13iD2mGn6JTABC99xX9D7e+Bl+e+GOytlwb/WfkPIJcFhQBuSvxGWjgHbI5K71E5
	F9sirDwHUK6xhboCqg3/ENDfuX31d1W/gHeIXvkl2u8aD16FDk7I1hU08ppclEtZIRQLscQAs8Q
	zTbnarx+x0koX8zpqK+QnWIj1vLAXi5Y4YIMau0rBKloi6HQufqN4hKsVnt1exsWWfZ/GSwSgP4
	2hrOE4XFoWxbFhUwpQZr0lMVRgkJZkz
X-Received: by 2002:a05:6402:274c:b0:6ab:8067:6a8a with SMTP id 4fb4d7f45d1cf-6afada12e14mr7642825a12.32.1791232092260;
        Mon, 05 Oct 2026 13:28:12 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:10 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon,  5 Oct 2026 21:27:24 +0100
Message-ID: <20261005202731.153971-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132814_617024_B83945CE 
X-CRM114-Status: GOOD (  19.62  )
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

80 pins across ports B, C, D, F and G; the mux values come from the DT.
Port C has no external interrupts. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              | 10 +++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 49 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348..a08186133090 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+	help
+	  Say Y here to enable pin controller and GPIO support for the
+	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
+	  as the PocketBook Verse. This covers ports B, C, D, F and G,
+	  including the four banks of external interrupt capable pins.
+
 config PINCTRL_SUN8I_H3
 	bool "Support for the Allwinner H3 PIO"
 	default MACH_SUN8I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f..5129c0f19f3e 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
 obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
+obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
new file mode 100644
index 000000000000..f973c2b3f2eb
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Bank sizes and the interrupt mux derived from Allwinner's BSP driver
+ * pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+/* PH0 exists only on the BSP's FPGA platform and is omitted. */
+static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0, 17, 15, 29,  0,  7, 12 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= 4,
+};
+
+static int b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
+					   b288_irq_bank_muxes,
+					   &b288_pinctrl_data, 0);
+}
+
+static const struct of_device_id b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver b288_pinctrl_driver = {
+	.probe	= b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(b288_pinctrl_driver);
-- 
2.52.0


