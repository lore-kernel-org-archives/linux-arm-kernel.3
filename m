Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A877CEB2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=; b=NRYobFYg19b+E9dwLA7snqkt2I
	Vn8GxgYBHWllgdBC3WNSa+Lxhh4Lki33JLw/VgLvx7D1udlbZJ2A70aAxFm2lpi4FN44V2iEkLwGV
	W8uNGbL2W259Icld4qFHOE3HlEgNFgZWbPyIdf0+tFjN/2utSIIO7fXUS0cih6RCd5I+bNPpT386V
	zTgvxBGuF9FQ1WB1Bcclp0GQ+ZK74dLnIdSYvfb+1v52HI31A59golehvoPF9nfAvqFpEj4hrCayK
	j6Q/kXjVEfW2UuDQkppoCKclrnSfEcepw2kQnPkpQptUdfgSQ91/OnP6CahPXKLkUHJkYESW0wuNs
	nn8snHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2m-0000000Dpkk-3k1q;
	Sat, 15 Nov 2025 14:14:24 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2h-0000000DphS-0Pzz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:20 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so5085143a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216057; x=1763820857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
        b=L9nCt5A4ArlEnWryde3dHWXIl0RGs0GomHT/cuYkHJX6gdUAqjblfe+nn2JYsXzAy9
         Ty8dr3MH01sqezjDv3r0uCwExHGQPLHYwGkHwRlBZBX+KuBm1xB5QgPSmrURk+mVCcog
         vpSOREhbNU2Bs7ylsLXT/bH4t2YEbcIeIA7f7TLiCYlEXZ1B62pDzG7oopER1GyrBxkW
         7f6kcxlKKzd6BnAbUYsmQS6DlFp7OYG/rd2XA9qirDnmqvH+4jYvrlTM9b1QMptGw09g
         FIQJVfvVMWI6JO/KkkZpZWhje/vkp6LIpIX2T3//vCEXqFDnwzBM5LhmKlpcCXQLK1E0
         FBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216057; x=1763820857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
        b=joBcNd+4Yz9qpBbFP4K7pXSP8WYvKxp3Jw+nJQv3SBhsorBzfa1CIYZlW5fR9mKG45
         gQUsJAS3S5cW/XI1gkQHLz9sMv8qb0F1qyQtNGNhjZDaN7hEfmuEM9aMgSSyZiQ531Tp
         NcqF5TQhpKtc+P5dlr28BZvkAEC9S+EKjjXgfgvvEiD9Qf24+wumxxAKHATCYhb9zy5g
         wyLB5FEOsNulS9jGI9tq/PF0lTMyvofqldlqrPoz+A9vYgzSubLZ1LCqLjBV0FfEZhkM
         Wage3pfLNKoXhXK/YVcVVAwJ4DZtxpX4xyoxmbIwhRmJAqp6yuGTP3KxNDdNV+ifabb/
         r8yA==
X-Forwarded-Encrypted: i=1; AJvYcCXPzwkOe1hO6R7i52G90OA5ctq7MUumu7mHPadLj6BMxl8Kn+tTeOfcSc7/Q0kOFQjTQAs+cqH2NfdlJ6e5ePA/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5vAIAHOfjolKQ/dVmezUremiA/RSY8dtVr7Wc+GZ1ma9f8v8h
	yx2gpt1EyBs8/4ZH2lJTU/YGwf1uPhGDvNQBFM7yCneUtZKULQ6sflX9
X-Gm-Gg: ASbGncu2yYBBXS5C7Tq3WQokvBbv/tPeZFjCoxSD8xf1xBKuW6RzKoLT8d9kgZXvfjl
	WKkyixJaHExrgF223hl3Q3gOAViycKV8X0nOIJ/eyICk9ynd5NRu+Kpd8HYypRLFemcuoaTl4nr
	Yw3yPh1Gr5dPUgprrrZnPrny+vdN4TzlVFQfSFyVIVii6lu0Inn5em/mgF4VWKMFtWsl2wlxU7f
	dSpcPT/4Uhz0tDg3JzesRKo5Zb8oLcCnreJgU++CMn2jSgEEhJDkFm8GOfznDjYiL52WAnG/FAS
	csD5uzbATkep3Rpv2SJe6ejiFRjCvDA5gagjCCaLhkdRyWIxp+vQQhtw9qTLyWs5UR1Tiw1rozo
	4c16GJOgG6kzAmolsfXa0BEtLlbbMt5pEYoIsbWiSA9DY8WZyz51in+1D9wap/ML5xR2LqvVyfj
	L1ZLfwCVtPHSlTojotOG0/kTSwqRJd/pdPSZ/y3esmMcQ7h/+ttLqhc1mX
X-Google-Smtp-Source: AGHT+IHK6phfJOgzf+aqpzFKPTHMjqJZ4C/vVBwN+Y+khMKq+c5K63YPI1+yGx5o9/adAsErm3Oq3Q==
X-Received: by 2002:a17:906:490c:b0:b73:6ca8:b81f with SMTP id a640c23a62f3a-b736ca8bbf7mr534553666b.51.1763216057167;
        Sat, 15 Nov 2025 06:14:17 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat, 15 Nov 2025 15:13:43 +0100
Message-ID: <20251115141347.13087-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061419_196027_EAEC22CD 
X-CRM114-Status: GOOD (  16.60  )
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

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..2841ec922025 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -6,9 +6,11 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT02CHN_REG 0x28
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
+						unsigned int reg)
+{
+	switch (reg) {
+	case SUN50I_DE33_CHN2CORE_REG:
+	case SUN50I_DE33_PORT02CHN_REG:
+	case SUN50I_DE33_PORT12CHN_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0xe0,
+
+	/* other devices have no business accessing other registers */
+	.readable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+	.writeable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
+
+		ret = of_syscon_register_regmap(pdev->dev.of_node, regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.51.2


