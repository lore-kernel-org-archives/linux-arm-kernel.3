Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72474C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=; b=iS4C26KIYhazhb78+GM5ce715T
	flz67VR6poL7JyIat4ye4CFVE6sSZyzX8GOS63WIUITsC6Wde76h+S+CMMJczHeMjGHNFHRU4CmrO
	Wcro1cORZisKRgPFIjC7Kt0t6pvIriYTYmiaINkN2SRE9XsUzg+F9KQpSKKwAR7Ub1SpZ1ahRqz2R
	csNk4qg5jb0d12toFVopydxSd3M6C5KD7+UVDGW/VHJNoqgFy/m6rOb1LVV8mV+fg2YxvL40qUxzl
	FQ1fO44zbdgiTLwaGAtTQ+Q3e6MjuxAa8t/+TDjgLsudXaWJfjZrKFIDKxBi/+60BfTKxalqHH79M
	ZZM3+aYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUBq-00000001rd0-2hMT;
	Sun, 23 Mar 2025 22:53:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyb-00000001p56-1eYD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac297cbe017so864495766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769568; x=1743374368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=;
        b=Z+SwC/zGvoCkY8dHgr1IAG9TV7gffR+Sti/e+b0FLc4wFgKogf2V5KpGt+dWNAGs4N
         wHGvFxLWOkxQGb0eMjNvUMbm4CLzDVwnze5yHeNj0oB+KvhaHW8E0c3Tph7szGDLZN3S
         wRPbNNJwyuThlbUmPh3/T3xWhHsS2LRQgvd/ymguzAl+dqqvRnqbtytA6WrgvyC5kGZ/
         TLng2ZLVyXh9Y8MlW/FTQv1csrgfKL52Ul68/F1jfinibp5pB2bDhS1tVnAqPFzImLEj
         mzNMOfibnJiqU1ftpdy8NjwxUjC1ZxJFVf7ezI3SxOq32bXF3sAECNwaNL1ybFWBuNtx
         lsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769568; x=1743374368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=;
        b=GLWJiXGWWuD/g+iVI5w39SSHmfBnnEWoAD0hBlz7DCZHIDK4mwbhQsCpAX1EZmOCaF
         gJcqJk/b9f7SyDWpPWu8W+mSYQg7xy755EO4VGnX5kkfAsGqf3PBEzX8vfVkP7JOsJjR
         Nmf9sexsRSPu/FUVjpPOK5IDliMQkH02051MEvdqritK+4THOW8YHKbHLTxLmHPLgskT
         4GUvxMoo7hTtVCCwfqjQonZxxbOFEfrwnWiGlYbmM3+5Rz1ttvgj3Rcje/J3uvXKJHaV
         rA41ONi9IhsjT2VaZmGzRCNUse8ISdHu1qWzLgHf0CB/ircv4fkirulnFZsHQz7zHuVK
         rUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU24eQat6ZhH6wGWSP+t6z/q2RKgQYO28Azc97pMf0yjBu2SkxTp49OysZJyN25GLsIdbsb+T0Bc0pBNGcXWqma@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/rSI9+9AM2U2DDgSfodhYWR0vTxWv5J6I/nZN0GxkpbtF0X5f
	OtjQGNTX0eimw7B82n+AzQMvxNBCaj8PIykCGZOTmyyfXD9pL7JsEr6HZiHtcf4=
X-Gm-Gg: ASbGncsSIEjK1wBVihLYfKpJJruihn9yGVauJSmunU/Gta+ZewF4Zy42/JMTrgfmg6s
	JmNqH5ksJ9RuHVkyd2ckpUclRzfdljJsgvM03tIGGzLjFUo8+xU2w5NnMYtRJGJGdMYhJqNkLeD
	REaXX/00MnjvwfscxnuHqr6MYJW4xPNnAQV2G7OjKCfZ6TZ/bHc4rFa4RAw4aKLW/IYWz1YX1ee
	Cbvilk+1Sq/SmAPzjZxMfgxIiqxEWpC2Gs3bfLG+NQjyUr6GUP4mfthNbVSSC4fEZ1+sv1FAt0B
	0NIjC3pjv/xEqgc9V8dOETDnvVB+N8794zV3wGg2ZEk/OwElYtcNReNnl92AWSjID6cR4JLSIa1
	7X51XRie3CQEcgN0117AmKBmZYmEO8BRYJLozyXc=
X-Google-Smtp-Source: AGHT+IFvkyM7m55m5DAsodXq5EZ4AXqEDqM6V8YHvLrK06u5ugX5A70IcVFVe8/Urn5Sgh48Nw6Uvw==
X-Received: by 2002:a17:907:2d20:b0:ac2:26a6:febf with SMTP id a640c23a62f3a-ac3cdf8a8bbmr1398647266b.20.1742769567610;
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:23 +0000
Subject: [PATCH 07/34] mfd: sec: move private internal API to internal
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-7-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153929_430880_6D199FBA 
X-CRM114-Status: GOOD (  17.83  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf7fa9a814d2d198fce853f7ff9a01f2bb69f5f..d686e02dc7ccd61e35173df997d2f894ee5ab515 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21351,7 +21351,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
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
2.49.0.395.g12beb8f557-goog


