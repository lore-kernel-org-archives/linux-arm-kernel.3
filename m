Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ECEC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=; b=d93iPMWEmF/0qCvDw0+ocAP5/B
	Ig4Ki8KLfTOPMsty+oOHXUTaIh8F/d/2sh8nNsGnKu61YGeXj1KZOYuVpeN2/HQaVCpJyDDGM4EE3
	NZcQnLcyU6eKDdn4UeNxu45VxMJrErtMlNnPIt7boRR7dVptxhM4QjcKh7o4W3Z5Ib7f2c1lfZNBC
	ubRP0iApL4kyVXXvJmiwiRMVZoxM+DcudtQJkIbu3dryUoVRFWOt9mtKG8W7T+eHzftQhV6l+YchT
	jtqWf3XtyrRsTUVSR012d+mtZT+0s+xq/M15EJBg2MTk9VYh+WAkm1eG+W3IUJx2ysjon/IiCP+aC
	415SyHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cOA-00000008V6t-31m9;
	Wed, 09 Apr 2025 20:51:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAw-00000008Sb1-38Vn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:36 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac297cbe017so220769966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231053; x=1744835853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=S6gMHKcDI1iiCz62PxzrZq2/UwjdXRvdeDM1kVwtGxdoLEFo5AnTfDy13gHhVc0sga
         GeNbpskYIH64yNJche2ZicJASpmeMI2n9rMjTjHKXIuGfzECk6GboT/vo5/oRP+/E7bk
         uFCkzHUVmuJ+kHlxBqPT5jw9LKMMVybEP8PYB8a6WrMSba1h/0JDOC6zjIWqDkhyXJzn
         2EX11dC9moczrIWVylWo8ZDDNsiVhZ6Lw1UrOT2oT/fBchR+oxMcAJh6gEUh8vVW6kBC
         qeFXfIpZMawQnJr2X+26ZBN6Auh9iTspBvOuxka/we5H4Q/PhoLdhNPK3HpG4mGBJP5O
         245w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231053; x=1744835853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=Hg1mMh/QvANYAh7s55Yzmoh7Z6M+fYKDwpdh8IkE7ymeCNRMr1aKSg+j8b/k78xyds
         C3R/dOgiAOsh7ghDJzoOqZRIUbGimUK11RVljryw/FCyZds11gSe2lAdTLd6NsNE8lKy
         wa+o+VNpGvI0jDK3G5e388uOxlMW6Amii3l9sX2rQc2i7XkuMqa2T4HD7g0wHijzfZ1q
         GOCu9zhg1QYkmOMf/Ro4ZAUYQa3dn4fQPrO0QQliGeTwu1jS/UmEOmNnEX/1ZN+bW6o4
         eRJTm2CiRaB1aTFDTanEUv25ZfVoUmzdnA7BfmLgBFboa9QlMYcU15OWiixcCbHctk1g
         O7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm0V+S39eBviEy6k7+hBBt92WwgDgKdDI9ReeJpUydxowGEEvY7tWZWE6iYrAN1uFmK9KRfPGJJrPTmc7mYSDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzAUCOD77/0L+1nmEPbzWgPB2JvsinP1TWKxbRmlxUiq3deXLGs
	eg3q0ha/lIhsdjvFH6QpwtiKnODimJd5Ti523HLr6JVgZB5A3JieNUfAcG6Dfcw=
X-Gm-Gg: ASbGnctbkgmw5dzP33bmU9cqKQw33uCt3YWigUO0vJLZttyOxYoMwkJ+RiirnjKnaYx
	2LTvGEd//mGwh2W1ZHeg+i2hP67uUAuijZqe8mIvlsCL5TM3G+bnVkBJhtMNQt4652jBiKQs3QG
	HDp6UEGKakgkUJe1YHARTlayjX241vdgIy0FWX+WwVgoWB/Y17es5apNGPiXFZXmhuP5Z4l2o2k
	r4AfkPhprGPycmCRQEu6ZA2vaboglAEh7E03+r2r/iKghR+jKdHmTPBC7fr38pqf7110OMV7m/X
	V0nmoValGB+ZMq0+CvkckWRts9odQEuoAfo/35pZbrOqUESKxZ6r4nBsQW2yQbS04s8JvOvDxwF
	Uf9IPm69wa+EXWhPd0DUt+LiZjCM=
X-Google-Smtp-Source: AGHT+IHKPyqKkOQl1VeMSZiViKNNp2YZh/sxu3Ut5v80bTjVlkCkL3GxyPP6wMwuQ/pmeL4UatLsMg==
X-Received: by 2002:a17:906:6a13:b0:ac8:1bb3:894 with SMTP id a640c23a62f3a-acabd25168fmr6274466b.7.1744231052992;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:28 +0100
Subject: [PATCH v4 07/32] mfd: sec: Move private internal API to internal
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-7-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133734_789170_0549318D 
X-CRM114-Status: GOOD (  18.24  )
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
2.49.0.604.gff1f9ca942-goog


