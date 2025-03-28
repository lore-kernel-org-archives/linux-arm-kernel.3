Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEAEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=; b=SPWClcUMfO1iOoy8M2Vcb2l8QR
	UrvHe+nJaxxVqvaQTGCrUeeY/yBGIBaBKl49WdV/xj5dr2oYMytVjV3zh8ar2dsWyGM8i6zLy6TVK
	ZAoigVvhp9ivGTeQ3sctSriLiKeKcILMLHFa/5mfWKnmxbgC6+OBfnJkrj0R1n4yiq7z4S5HMBFHC
	vxZjeZYC98PigCvVLj9wUdn16+AcnfaUvsXBphlt+P+8oCHX6i/cnzSd+CaUyz4V7n/ObChUyoE85
	TJ89s/GZ2Xbq289QdYptdoc9zRjOGHtVYYYBxrz9JPG/yTDmg2aEoNIqej+rRviXbx8gNGPPnowbq
	xOOHbBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9zX-0000000DTKz-1uag;
	Fri, 28 Mar 2025 13:43:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nW-0000000DQe4-1pvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3366026a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168657; x=1743773457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=nnEK3yuVa+TMz5LDld0dzwEIREHASekzIFNxrYh3HjJ/i9yFi4HYg5yFZc9g/lGjOW
         UMky6YH5qr97y0mCCSYF2U4fzdoh2Bekd1TMD+6XkyzChB73axo1JpUMtSGg7Xk66jp9
         xQeHXcUTy3XOBUn2XRGtyPz+NQ3kwPJQN7hWVXPtvChf3ZuuiM4BbjIeReaHVAZBOAfm
         yG+i8Wq/nV9TvqxaTuWAhQM2bvNPgqxSDjeOup3znIzJNCTuhiZOZhcg7RCH2Yxx3jzX
         w4xK9ParCFGwrto9ws2cRokvzXcL9RbhGt+4YIz3eZNfTNiIaPPo/AiE1EAH0Eb9bU6j
         DvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168657; x=1743773457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=DrLKD3OjW4c3XCg6/80tIYafLsdFBoub6eNWsgdcPkiaega1zLVPHvvjr9OVpQtA/+
         rtOEng12lt8lvRkcDn682NRmxGYNQGUzBuW8NJUWS/MOabHcIRxwCQotKSOClh5h/044
         NlAXiuH/net4szaBZDNq7AxOZ/BLYZS1psrLPMrouc0pLpzWs/fLKF7sKI9soRFaseBO
         McNPelZJB4GoU7WyPCoBM3eFze4EnINqblIrgRDAZzbwgQWligU8bAjncvphTFepzK6U
         zR1nsmejBiCqLoZktLAgTnPXBe8TFCVtuL8IjCPWa4PxcxJ+5wavZxhOhTSmYAdHuBVO
         8fNg==
X-Forwarded-Encrypted: i=1; AJvYcCUh9t8Nj5VcxodDhyND31NQ1tvbOqhZqIZcRNgY5DWNsl3ICIwBj9C8HUnzncgHW0HrBeB06X5Kf4Qt6Sec3dj2@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ8Y5p4yaSSCzjvv4M+g9Wp42+H/Sm9/maXVdjt/cK5asIsDuS
	b5f0eB8Mp+FRFWEs9V7jkn35J4o6KbbHI60LYsvbs13g+CC/OqrwP88gSn/mfsY=
X-Gm-Gg: ASbGncsXZ1T6GUPr8Jz4fSFTmeZk62dD3NA0UadxsDdqHyH0iLosgbXcKJW6THT0r39
	tolOtfl7kT2+14/DSHZq4eDqm2lHxdjDQPRLIPGdEMFOJhrmfpej7rosXhBrRn2ZdXfp5k/qqiq
	liMm0z7wQjTinAFxmigqmF3Ou5s5qubDxbHnOcL7LEu34BfAHELEGqzuPKZrddYq8zap66a+Mog
	EHjJAAwoRAlgmwBamJKKulraVuKn07fTduAQSUbNrEqVE9VHlI35ZuahNASrz25Fqn1I78AWT2n
	PGLRrMt8A/Mm7jssGXBD+UC1OfcSVgDKsNXVdlK9dLcf0JZMqIx0+l0diZRw/YExIGycFhamMib
	GDMHMQ5c5GZS7MlpJ0S0khydtSK2B
X-Google-Smtp-Source: AGHT+IErgpXJQXu0yTyDAgPw0TRfi7/5SsCs6OHgbYuTJRvfG8I41tDr8heCTVeJZ5ksC6WY2RfqLQ==
X-Received: by 2002:a05:6402:278d:b0:5ed:18dc:c0fb with SMTP id 4fb4d7f45d1cf-5ed8be0dec5mr7564036a12.0.1743168656590;
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:52 +0000
Subject: [PATCH v2 06/32] mfd: sec: update includes to add missing and
 remove superfluous ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-6-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063058_479813_182CE1F6 
X-CRM114-Status: GOOD (  13.06  )
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


