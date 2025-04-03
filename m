Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAEEC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=; b=HPuYw9fzfhJASkq6WeJuIZSRbu
	ecz28qSAOYYZzC8UeLLXSbWPYn/hYs1NSfs3RrnV1oRoIkTt1m1w5ikdKW07xNCcfvDrNRfRDfHj7
	PdqQ8FiqVdnIxAZUnKOu91vWIMQcJPbUhI0jZ75vbz3pWLfeNe7Xj9uEC7Ecdd5sethDbTuQ2dKAd
	fz5jz5U4YwmoxmVJj72N6ehLsOk+z9QH//l+ZLJvyOFi2Yo2gcijTsoHro8VN24a8cMDLxIcFYute
	QdbX41BXzzt98IcpxkilNeJdtaghpS2l8E30HOlBuuGVX660lzevdetrkbRyjUjivc9ux/iTXjuj5
	bTuWLOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gbo-00000008MPn-2EHr;
	Thu, 03 Apr 2025 09:11:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPg-00000008Jh9-2CwF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:06 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso1252454a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670743; x=1744275543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=hJXbgDwpq9VK0z3q2ttJj0iRWwER/1a/gNJw8h83HWrWLO3SdFJnHvXUdHZiLmrsgh
         5RaM5mwrhPSH3DoDO+C3iAbzhGIzskkIi4pOOnEymEOEo3OdkZyS6wZeDtgdoBkSQK/0
         4GsaidWEV6gq+hgcPeAGscMMVzDYlcBEQ2hE5t490AbecmY7TdPEAroE9HvOyFgi1iO+
         2eNFLYeIJAskD0JbkQRjJOK3FWhYwufBxdcaTiCMhWcQugw+qdoPuScdRejoL2+o5Nd3
         4AwLQ0bH3bsnPep74d2lJwKnF8uj0mrBeWgdI6KNs0C8yFOQYM0htb10fTXDPzomvZ43
         /EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670743; x=1744275543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=TXbMP3lz63NaJtrU9QvGEe78Jzy2jGqLMqxTukF3ft3y6muNBwHHjgQPGqJV8RT7JG
         7OKZHCyTr22lyoeRcZI+t6SM+sN6xbSMV8y0JNMVTLhUE79h3Oeb10mgdodeKniwVMgp
         13gX2HM8fj2ISWUr1094HbrehbNwQtWOtWb25oSV6REg6yMSbPccvJQO1xBORXDPMdFN
         /b8KpyuchbZAsrnLfefdC3dqs07RM65STUpUTpNEuUpTB1/TENDUuiDvDmvtfh67bfr4
         fwwifVHn9Khaa1pwmPdIac218WcadbKCgpo5cdV/OHzPbq0bamGsEzrgiFs22TarA0z3
         1lcA==
X-Forwarded-Encrypted: i=1; AJvYcCVPmbnjMCnIj4F+MTZANARI2NVkLWQ/v8kgoIVR8+oJ7RdxzAzp6jPBo1Z82pB3EXED7jnDUJYgIiISN35RPgFH@lists.infradead.org
X-Gm-Message-State: AOJu0YzSsv4rLlu8kZANLNhMsJNllyilVkuCmDdBxgPO0DaLIw6cPbYL
	jwuqD/BoeqgaD+tq8s9nWeaDweF134Uy0AxAt8b21Mv1st1FJ+2DJ94zT2CoH04=
X-Gm-Gg: ASbGnctYVJP5D+JRbGhaiCsy45OysjrzlFwPPOzNehLR9acEvZa+JC1N1VhhETOkMtS
	OfIJYcfCHEXqmXjzTIFxQiENKMf45GZOXDY3MMgS5/rFpMPPnwFEj4aQznMcb2Q2poQAy87fkQv
	xoK4EE9xE792E8bEQHaac8jXaW4FjhpFX65Trth/ABhwbOTJzq9Gc7B1bhlBPZRpS6/V828dgBW
	kI6Sdr7YTfe/D120J7QAj68rD30FJlR7Y4Bq7RusTs0RyhjA++SVGsKc/XDCySCksv3obxMD5/a
	u8FUQKA8zFVn2V3EKd5XwPbtSJEuUki/34aEqja8ucGje5k1hhf1UZ6IGN/yYjRdOxBzhQGzI+Y
	Q+FE2jct/VBveXG4HRkxaqJthl9Df
X-Google-Smtp-Source: AGHT+IGkZPSWp4lu5rUJK3n+QeS/CEFX/u4+R1iSLBAES5mqBRreTDwkWOuPbVChNdfUaTLO5xi3fg==
X-Received: by 2002:a05:6402:278b:b0:5eb:4e69:2578 with SMTP id 4fb4d7f45d1cf-5f04eaceb11mr4573614a12.13.1743670743004;
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:58 +0100
Subject: [PATCH v3 06/32] mfd: sec: update includes to add missing and
 remove superfluous ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-6-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015904_564245_181AB16A 
X-CRM114-Status: GOOD (  13.18  )
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
2.49.0.472.ge94155a9ec-goog


