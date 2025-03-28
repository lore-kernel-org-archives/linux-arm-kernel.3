Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0C2C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=; b=SLZOlLDFI5cqzmODdv1YTuELZF
	mZfrJR2IHv0+GUSNZl0Q+BesVMoWqeU4mOBvYUIFxobzT2XgWKuzA+TisigfsCXLyYyW2EreOMNUW
	RFI3N1Vrtn+1jmRAQdRopNINKgdYRbzIu9zf/jWix+jtr/YlurJKUY8JiDCG/yGkAlzcBe/NDNZf2
	t9uhWxs7+vUBmfvJmeQTympIkuCFs56l3fxpBIpA5lj6kzUkqLkoiahbGe9DFGIv7qcLbIY2BQveO
	Rs/oFxTGeIbMdLEcFdvqA7LGIl8JfLuc4jxCQ4LAlCo+V1ZPu2kS5NZsINBOMSSPhybolZEZTFM+L
	F6yTYs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyA4g-0000000DUSl-2dgw;
	Fri, 28 Mar 2025 13:48:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nY-0000000DQfp-30Ld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3544465a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=erVWX7KyJHh39lpPtGo/hG65yfeLAY3zMhQVagBnbhtR0RxVHLLSTOqcWer6fPrMWm
         FZPy3xhcYKeVscD3oi8LjbF4U7PvgrrVnsTitM5tgVuB3EL/Z5rW19rCB/WmxkytZE5e
         PcQxz1w816lbnwORv8SiD5TQa3JX8JruEKIRyA2Wp6Hn6oM0OzzPBWoj8H5nUuGd/rk+
         ZfWDW84xtmp/0zsS34yZ7Dr8CtM81CK+jrbv4GyaBggrb4LbkhGKAUMuwq45hUAr4ZiI
         8vcNgLNvvB8UA++3lSJ6n1kenK2+ynxVp3M25AC9I2XK6Yk2FHHudMYFqAWM1wWaMwaH
         tdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=iwViwyMN1lmxwmU7QhQFyXU8Weoc0RjdUX8eDpPcW2EI4jJL4/TH2qkkQnnJo70CH1
         PRuISX/5AqVAftQXfyuJO2np/8OIisvRLJC24dTfYBdN2pHSKwnpC4d25CaVK6TyBvMG
         9PzYf1Ivzz6K0PzEHIU7q1iTCXTwDARcCiAHeyKdFrEEUE0vBW2tcprbEPH9tv8fYSiB
         lEjLYKsofbPgLmXQuORXxoXh8BFJvuxhztURRWSgtzq7d85Mr3v3GMStBCKHzMBpz5CO
         +cdcY15JUrz5cCrxAuw82nmR/l3EXsE9+tDoSdgrMrogapMN8zWwq9IdmXEEIQjG1F4s
         grsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXjHjunuCDmHKpjQ1JnEEkoA4Yft8DCY2hmt706PfcDo4mZuHLtdLwr7gVf/5qftGqp/uKNcPEhVEXVeH+GGc8@lists.infradead.org
X-Gm-Message-State: AOJu0YxyGbsW0cL0O1X/+ewMbgi6UEoqC7WpzzeXftcYaqmKXv2GzMxw
	//qQx8PzFeVHof7jHi5aGwEW+UtwaTH/UKPJNEKM7gf+2AS5FmaMR1qk2ONS05I=
X-Gm-Gg: ASbGncuMaR7GNnPdlLGM/wxt5M+7cFAiLnzV2s73cTIp2E6yvBq1+YGOh67P0+J8MbA
	SlFmvifDoILRuZXJcKUKmS2s/eWM1zIM/DFNhX6uC1prwe7zWWVRbFonTo3xwgyLKDJpgOoGCYd
	7c8rA1dkXewU60xLOCTGeQQXxTdXbB3X60TqrkkuoMAg1t/Q8aIpdb2EInoUJwy0A3jrcg/h0sG
	MKKMW4geXMhTbMUolIqfTFOfjUoA9hgMAY4n+aEgFliO1iRJGOHGCtGEdTK9p6pxYBER8wkmaD4
	rcYmVfKPCy7tykgtqeCLNry/6NAd7m2BeCiTh2Aq9Bor7xV2gXvXJolRPQ2zeysXE///1dFRYW0
	tMIRXq2PFsNBP70R0f345JlEq+Es9
X-Google-Smtp-Source: AGHT+IHxP2Uv5JCL7mBzhNxmy1vBuez9/wb1XD7Bn0E0BvHAW9NPQJMgxLbLOCUMtAwVk4l4WbA2Aw==
X-Received: by 2002:a05:6402:2744:b0:5e5:c847:1a56 with SMTP id 4fb4d7f45d1cf-5ed8e28cdbcmr6969582a12.10.1743168658859;
        Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:56 +0000
Subject: [PATCH v2 10/32] mfd: sec: merge separate core and irq modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-10-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063100_758761_0913DFD5 
X-CRM114-Status: GOOD (  13.34  )
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

There is no reason to have these two kernel modules separate. Having
them merged into one kernel module also slightly reduces memory
consumption and module load times a little.

mapped size (lsmod):
         before:             after:
    sec_core   20480    sec_core   24576
    sec_irq    16384
    ----------------
    total      36864

Section sizes (size -A):
         before:             after:
    sec_core    6780    sec_core   13239
    sec_irq     8046
    ----------------
    Total      14826

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Checkpatch suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Makefile                     | 3 ++-
 drivers/mfd/{sec-core.c => sec-common.c} | 2 ++
 drivers/mfd/sec-irq.c                    | 9 ---------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5e49e760bd8f930aee 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
-obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+sec-core-objs			:= sec-common.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
 obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
 obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
similarity index 98%
rename from drivers/mfd/sec-core.c
rename to drivers/mfd/sec-common.c
index c4b7abe511090d8f5ff2eb501f325cc8173b9bf5..782dec1956a5fd7bf0dbb2159f9d222ad3fea942 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-common.c
@@ -307,6 +307,8 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index bf86281401ac6ff05c90c2d71c84744709ed79cb..aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,7 +6,6 @@
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/dev_printk.h>
-#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,7 +16,6 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
@@ -510,10 +508,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sec_irq_init);
-
-MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
-MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
-MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


