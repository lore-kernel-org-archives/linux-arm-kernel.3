Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7307BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=; b=YM6F3vi4sarFJXgMh2MVHLmgyd
	uaVkh3SZKPnnXonUQivD84bL4iNLam2qAM3uhsQjpseKh7lOkVQLAfJVRjwJimKluWfMQY3mrosYM
	4VcfDItgr13DXa0G/NCiuXViHj4oKxjxgSeCiVu7Nx3Jb/rOn0FLcklzxJDzgpEHdqamGuCKdT/O/
	yhp2Yk32ceUYUJosAp5d5g3KV73RJhwGPqNCrnP5b+DxMI/BJywHEqGI1CeUSjFoOXM6S03ascG/5
	gDkIxdHhy1JRHIMyJuADXXZP0OLt8eZ/uAhnO/hK2WO5CsoeH55g5q2BnP+eIOhyfMz/K1dCGvjVQ
	keV/tv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GdX-00000008Mjl-1rpv;
	Thu, 03 Apr 2025 09:13:23 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPh-00000008Jha-26si
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:06 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac41514a734so109025366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670744; x=1744275544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=HQptpIWkRCJJQLS+SJuqAB9+6PswcNgUn3o9RSuu7qzN/e5EqqW+tKN8QLGBsOwFlC
         acsVPUkcmnzSXy2hQnwegfawYzFjYsV54ADeFsOn3PYLBQkzbEoOHeTxX947cdNUA1Dj
         4EOfqIpzbPOZn8Q23+S+vMBww5MW7nrks52sWrBXiGZ91fu6O5COn1Wqs90ED+95nJ0O
         mzzrphJjBioWgGdhGyvGzDBQs4/bnWq406qLkPl2kPsDhT5zlSv0smqmAtYWRy3ecT6L
         a791iUX7cE18/sIiYM9jeDMZDIrfAujswAM66TzaVTCycNikMK7hr8+bAnxROvqWUINt
         plHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670744; x=1744275544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nQmrd18TxOApmP9ZbnJeIx1ckVKc9UGQ9P+sqT3y24=;
        b=ZtDZm3hqUeiytUizf7Q2kM+/FNDxlRtmz1SpawD8VhNVbELlDfc01HUuScDFr2fMod
         GHDtn1FGDisb9kpu5lneI9veGSW7aztOpIvVQu2lswltebulLgrmQSr3GsMk1ffpGOXY
         YqkW6qAFU/NmCVjrkSBDFBkHIACpRuTd2QwPVHvJEGSIKzVNu4UT98cDY8J6jO/zWsma
         3QlVSbC1wD79OmgJKsSfzZBRvxrJ+Qky2IxNK6Wi/uDF96Pc/EAKh7XRwWojKdOx9IQW
         YDcgQ16QSSTvyKnX7fhOums8pGhUIKhsUdr4Lo4dL2dZc4xUltDzKYkjH65BqupIi1K/
         QD3A==
X-Forwarded-Encrypted: i=1; AJvYcCWFOWyxAjGJo+gNmcKYdsWZSMFywkEkFUrgwgIh/XzjGQ1k1fI5S+X/gH/KUhSNb06gf4hxpDComQLpXKUfLg5t@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzwprpeb3D0nOoXgcBnnhUUMzd7BSqQiHbLGK1I9xlsfBf3WSk
	5aHXMQiQJynC5jhEEyVVfC5oPlL8Khtqm4soEf3lBXmMaZuxF2Dh+ABCD5hUMQY=
X-Gm-Gg: ASbGncsZYZzNoDOWnuisBQw4LkKVeUlk5/4SogoVnGEeYzJ9oZuZIIFSRV72JjOD84x
	HiSLNhmfMtuvKnRZhrAF0jrs+aVk3BA5Ukb9h66T0ef13/cVTzXkIZrV6IP4BN3zHS8qlCbnLkt
	sRmd2VxYbMDjU5Dp2QDiCaDxJWg69BdZGvEjAQNpQ4z4lG5mxAMU2bdmvHUnoUMhLV1bJksrsz0
	KFcni2cTwrY5LDcaUS7XnVgZBtUsIsaxI1ceaf2gT7d1kkEpoT8eOQPQrCop4G7d/zYEECUu51L
	iqEx8o7mvZ9veYvQgR1INqNJk9QmFPJfvMEy9zCk9bXZwM8KDZfOwvM+wAZ3m2MKPv63aPzEqmA
	Rjm1wmVNG6fATf1S0SLd7o3Efey8h
X-Google-Smtp-Source: AGHT+IGIWTCEvGgQQzD/67aqQ+onG4uBURQ37h1HwUWRbYYu+VD7A44v+HEWQ+TW3vqt1mLDE4QMoQ==
X-Received: by 2002:a17:906:c153:b0:ac6:fcdd:5a97 with SMTP id a640c23a62f3a-ac7a1972b9emr446196566b.48.1743670743773;
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:59 +0100
Subject: [PATCH v3 07/32] mfd: sec: move private internal API to internal
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-7-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015905_549167_9ACBE9BF 
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
2.49.0.472.ge94155a9ec-goog


