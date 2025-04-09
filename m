Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4CBC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=; b=u7IKCZSuWY1CaDSHLcWHy7tnGd
	6aqINn/KixclS5hAxFbp/kzMK4u2/HFC/rgrBfzsynAA2ETCOT2vZ2OO1I7BUQMGdLpeta8yqfViy
	qtPwUWx2P80NAeu9ey/vr/VtV4LuzR3VD4ww/c07xgDsG/gHFkaSa5rrAi8mvuhkKdn6Dwzak0rj+
	+OkF3wxzgn+cU+Cm6TCZls6kluUdn9JL8lKxPXhK0Y4nhBajO2zUKmuY7XrFdD8Q2kwoGC7gPLf2v
	zwqBNNUqs1ba8uceRY8UI8w5YUQ+Xiqk4A39hc1zVAtVbB9bL7otkrYDFop7ahva02TKUBO3cY2Z/
	nusHbw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cMQ-00000008UpC-0HXj;
	Wed, 09 Apr 2025 20:49:26 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAw-00000008Sas-1xWN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:35 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso17926366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231052; x=1744835852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=;
        b=ajBrBuUX3tbSUmgAGutU/BYwu3KND9DDVo74+JHAS2qPrPhTNMv9Y+0v9JUZib59gg
         CijbhPLB9wn92i2Jf0rL/WvWy/U8D51B+YPMpxFuLhDMyNxDe67pB7Ivks4w8E/+rcrP
         gxOpiuFb27UHVwya+JYY03767PY5QtHahP0ikgGAUbbNTy5EaUIhD2JhMypPUYo+j/DI
         Z9eVScnvFQIB64xilEOJfopvpyODBeuwTj/VEzdNUetkJnBj6+9TxKNic4DE9NnzT1Nf
         2C/N3WazD6LIs4tk+tEqdMPKnAr/4NJG03UOkIMyvYhEdsHj3EGKoHaZg+XFD0xQor03
         IFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231052; x=1744835852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4jcXi1XTosiHhMqSSsNm0hu0JnYFeJKR1d2RSvQQcw=;
        b=cErsZk6f9wV/BNCY5nhHafbAQ9pannyTLCEoo1v6HBg/Bv8UJ12OM+oVrKN2pQ8FmS
         KU7y76TMqcJI3E7679a/LksJL6t9DPIVro7Vd/5Y41Awot6jQFUTcF+Ryiys67b/ERL+
         nJAFioewGW/QKNb7yFDX2S6YDUgtaiFKInxOCjsK/cg0j5lLoH2pxp89KD9cqOprBQJb
         cZtOKxJLkWnDRcYoCnP7zIh6weTom893q+wYqenqBG+/D/N2xPoA5KqAvi4pTHnZur62
         S6LprSPTqk9YNyi27LXJmG9AlsftGUvbwat1/nsnvnBvczYnaOEggbbZkLvhjJjh+NPu
         897A==
X-Forwarded-Encrypted: i=1; AJvYcCWlbzBxfZD1LdC/SxmhfV6SE6x3EsxJ+CRq5rnpsvE3+rJulFOGwNlJ9OOJduHkLGrGY0Dvsoa/nON2nv6IDOB4@lists.infradead.org
X-Gm-Message-State: AOJu0YwLXAY8gADzsnX1Us7EdGGQfe7tEtdhabpPtX0LlYuthxE0Lhnt
	/RWPRUdAJDbNPqy9ZJb2Tm+ii6abgT7eb/XjXk1DN1q/VbpKJ4ObVfWu9IWb8nc=
X-Gm-Gg: ASbGnct92g3Br6mHkUcniriKZlNs3SBsR3xsRHyJZ8j/6ioKd6fbqUmLNS6EpJvJNkR
	00tgd7jpMbzpQS3n1eBj46Vioe22WMUF8OJHIehCPtIBAfkquJiIXSEHy1IVh1QIDgaGlq9ZFsD
	PmlGxBD+ftbK/IbpY7nMf3pgrOelPzV8Lg3e+zoJz03CBnEKKX/FK9/kx5B6tyLHfeIRCOkMuAd
	LIQSWgsLpLwW7xRX+hmNMnHD8hEmSSPUHw6b1nfBbi63RhDj9HhMVVSL+NfrjUBvwQL4GTRkLbV
	CDbUI1N7CC6UyTRzEzWPjxyQRA9vMpTzdnclscup1HfrDY0LRYEx59uG5D5m0sOPf5hlmheVSKF
	ogixBPeYrAfmLknxeI0wwE7uf5naWhCvyLk/k8g==
X-Google-Smtp-Source: AGHT+IGwqRhQoC3fOMayfmVAcj7UA23NDr6Q3DFxxTe6qZCKM345xZ2mndUpMT12OV06uBa0ucpMZQ==
X-Received: by 2002:a17:907:3e1b:b0:ac7:cdaa:8946 with SMTP id a640c23a62f3a-acabd181303mr9820366b.11.1744231052442;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:27 +0100
Subject: [PATCH v4 06/32] mfd: sec: Update includes to add missing and
 remove superfluous ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-6-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133734_527940_4B1D172A 
X-CRM114-Status: GOOD (  12.97  )
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

This driver misses to include some of the respective headers of some of
the APIs used. It also includes headers that aren't needed (e.g. due to
previous driver rework where includes weren't updated).

It is good practice to directly include all headers used, which avoids
implicit dependencies and spurious build breakage if someone rearranged
headers, as this could cause the implicit includes to be dropped.

Include the relevant headers explicitly and drop superfluous ones.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 7 +++----
 drivers/mfd/sec-irq.c  | 5 ++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37..b12020c416aa8bf552f3d3b7829f6a38a773f674 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,9 +3,9 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,13 +17,12 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c..3ed2902c3a2634a6ea656d890ecea934053bd192 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -3,7 +3,10 @@
 // Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/device.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/dev_printk.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>

-- 
2.49.0.604.gff1f9ca942-goog


