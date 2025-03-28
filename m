Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA0C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=; b=HGfowwqtAJHLx1fqIySNEZve/o
	GwkuOOFQnT7S3AlhvYyfH4CGIXylo5zOD5+kFaZaR7cj/Fyz6kgzd9WJzM8wDGaRK3F0odqGBAPsf
	g8bdcl4Bq/2EllfU97es16j6UWaKlyuocvt3nrBWyI+2al0WjkNUOZxSCzG2Cg/MIvpkWFObDohvX
	9+vv8A04jfVTYGlj/mkN+zu45Fpr2oCtW1KWesYVww7F6FSP6GDDVXcOBqikZwcl/uUDAi8suXw67
	RPG5UbeQDd9rGfzOgXP6qfqRPCqAEODkQh5+V9VFFQl2+wnmzaErZEMk5Y0vxCYLDVgZIYoiHZ0XO
	b6T0C9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyA1G-0000000DTiy-0v2m;
	Fri, 28 Mar 2025 13:45:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nW-0000000DQe7-434y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4053787a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168657; x=1743773457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=nlVz2AKF2UkG/wQLRauX3uwg4IqaLwZN6trZ+tGgBNd4nFJQcRF0VnIIvnIV9soYpv
         xJ5C8n/ip9/zQBUPrmuI8EdtSJ7SpgymIvvq1QtfXpDcznooNQInkz7m3dV0WfWurA7A
         zc4g6kHOPuq89iskS37neeL1doW6Vx5IxzxDMk825KRmffdTU2SVFBb0qwgyRmM1yURc
         dG0kcqkCA5yTbJ5czFyOqeGHbfviq/k6IeB/Bim34xTCJ1fS0IyGtNI4qVF/FhvvQ49y
         2ZvZ7k4IsbIk7PJIVYJZnhTaihtqinj8Wqfnzs8IsGtXJhDHke5aodJyFbGebpVOm3zF
         r8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168657; x=1743773457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=BjJMRuHvnUfBfWr5lWeQ/YSutAiAThMWzlZsjLLoY/HWYjvogcrNbphKTvDJyOP5rI
         NL6RJ281MgH6xEnQ021GDFj2zSXwypYC2Zna6onYETbSnRa8+XFSmuRkaCLneQg9khey
         Av7bXCzAdi08AUXc3kVtKv77nOWmNMOScOjFHzz3NK3CFBvL86R/NK++NgnnfkbHo3MA
         7yaxFduZ71UFab2Qf+KdPpsZqZjwndgHGUbQZS7TQFxNcQ0ZaIe8P9MEb6yg4CMGTAVB
         l5P+gIopU79H7h53ew+iTEO8o8kng0a8zKfEypDz5EvoLmVN1mghCjP3OMkaTM2TBfGH
         3byw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJdWw40A6sAxxN8g7FLEWBPQ2+GrHYdIA3pENUVjG4ET0GO03FAslpqxNlF4TyUqqH0MsNgt2wzYfp90R1PkW@lists.infradead.org
X-Gm-Message-State: AOJu0YwwUju/+WIbqjVctAk6ZcLQ0Dzx/zFcbF0H0Z2o+6+HyFPKcPIq
	Gy1traPLua1XaFoDA19P0Mvx3byFr4qL+EWwyilnFUYeLJhfMLQAhJa/Jda7Mhc=
X-Gm-Gg: ASbGncv/N9c7eTJuHk6o+DSfsfy1oINU2yPls6FcXPkEQeHs7nNLqNSL/l/hijEPQZJ
	EbnnF8tAnYqYEvC9SmGJJb40AakPdl9Kyp4ePWUQ7H0Ue7RjmsXqSaVz/WCPSPzXB6mo60lgOow
	97g2hEwrgB3eGh9A3WhCYLZZDvPL5TOcHbgDwI2xNyPaEbn+kxcF437SrFUj5rz9+sQxzFpKjb8
	g2awnXm6xVsukfWv/L0h8RDQ9bIKw4RYCgboBZrzvxhCyyDB0OzgAH98N6fVZPRLs2/BrT91bs/
	zX0YWF6tOT1LA84T8zT7f5Q/bwOPjnYd4OMjpQgJK1ILEwV3VgsyPJM/4qwubHcUXDQllc5yPQN
	rawVUXioDe5YCVhiKsPnEXsE9crakhwmCRcibYBs=
X-Google-Smtp-Source: AGHT+IEDo86URQ/5J1pNelKGYJ8OGydWpyLMuY32LUGaX685CyFB9P3SWcHpHTAbe46LCEULHTzjdg==
X-Received: by 2002:a05:6402:360f:b0:5e8:bcf2:832a with SMTP id 4fb4d7f45d1cf-5edc46379e5mr2912219a12.10.1743168657106;
        Fri, 28 Mar 2025 06:30:57 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:53 +0000
Subject: [PATCH v2 07/32] mfd: sec: move private internal API to internal
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-7-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063059_013466_CCC34687 
X-CRM114-Status: GOOD (  18.33  )
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

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..d4d577b54d798938b7a8ff0c2bdbd0b61f87650f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21407,7 +21407,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.472.ge94155a9ec-goog


