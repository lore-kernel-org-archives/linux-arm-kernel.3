Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95E5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=; b=ntGuWcUNZQYDbkicXBMcTMQn5y
	nZ/XC/5RIbnvTX9KIQ0DKOlyKiNAUAJbhDWO9CjRFnGzzGdLWaj4xysVx0cirQFfSpXCcdfGKEWdJ
	be5tEs1MyAHR2/+5rh5jkJ6Cs74APvyyPOj+rdsjz/scCsq7qZIeapggvCZj28soLw/sNd0HIqQ84
	BySpxVPrxHjA7y/shS++wUWa/2zG8GzkMGURt+ubb7m1NyN3+JOp/iXyEyLnQJ1SsFSvaUKnvynZ2
	MkOVnzK/Yx7W/oiz3r/P4U/wiamjqFiWFKrs2lvNFCO7T7ZrjqHVhQfiytEpHTi8QvY9r1t1Azm2n
	OlFe5phA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9xo-0000000DSv4-33bO;
	Fri, 28 Mar 2025 13:41:36 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nW-0000000DQdJ-04ZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:59 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3668081a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=rVDR9LnTYu7PP1DWy1Ehv2Hbon8vkS9oDRX1P615Xa6q6WsDtt5cB4KzHaY0+w/Z+X
         1UzKeW537wu+CJvgTks80lvqCVvP7hp8DfnlnQWwbaCegalE+2lf8hMG22R90EwNnjYJ
         bEiBRjlVHi+UHI/VRSnQegGOhRGqCis1VeLfV0sIGx+Gbv3qcMU5JnEHlzWz/c+9YjM4
         9FXmibpYichgZ4DLnWL0nfxF6ZAbq2YyW24IAgEvjBONByHa+vktJXz5TkalEktrIet2
         KukIKi9vBKcykAEt1dbU4/0DyLtMuGflx33Pn9tpgQ04GpZ7pw/g9+nWhHluZlLC1F3D
         5dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=i/Os39NkoB/1W53yxYrtlLQSn1v/JH0gEa+Djo+FRAtdjvRJXflF3EviYTTSrXGVqi
         C22GwfKEXopzQJJrrxEIS/48piCRmOeWun2I3DXuT4UJfxJo902qlrBD6b/In988UHnP
         NBZF2gbfN54eF3oNJmvxAAbsfBkmIQTHNM00w07K/j4ZS/oD69JOB5PuSVRCCIcqE6Ij
         rv4uj668c5VsD3xAEIksdo4tpfQ7ccK037b8JSNefLyaccLo4KWTB12X77Lxa4bAP/hR
         KinSMa6vZSM7U9WNK4mUlxAXti/GC2xJUorpc90TlijOcl1xP4paHM7QWPXGjeYnzTci
         fu9A==
X-Forwarded-Encrypted: i=1; AJvYcCVlGAvFt2AxWPz0WKXe1tIvV0evxEaBjV0lbNwJisjqHlZoETay8g86NTu+zXRjsUPTmRjd+TlCzDO6MMJ3VhHJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4rT1gXxpE2im18P8d0Xyrjz2wbaFqwIS0Oa+mFhz2aRwjGp5F
	Lgiq/5P8Z8UkFxKOjbErsZ1o/m2yI/BXuJkZ9Cwe0en4bcjWKafWjsmJjxRnW+g=
X-Gm-Gg: ASbGnctMiaFbB01LVkFbSiFsN9B7p1SHyr1NWxnw7Rc/oTcLRWjDfHfIADqWxWRzYY1
	7UW+dam3j4VQbzG4+kHfJELhWb55aEOLa0g4b9hRoBfUKfuGzXWiOfY4WGgbIBf8xFgEolOz/zM
	n4Uk9b2cXXonXylslQVJ6nYmHOrY5nMxl/XlluK2a2nMigl4MUKA3iZNEK6wGZ/V4nlao/fqozn
	r3WulvhPe7oOSG/+TWm1P81Xi2dlQaGrWQlEmMrtjx/a98kUsnxxJFxPiM5l3T0Hlwd/BT5ovdh
	yOcWvE874WY+UNUmn2AUNsfJI50xHylegLV9OpUbZnIT6e4ECf2LWA5MpEXesv8zORRRn5ixv2J
	VJld/AtW2YO7rLaSOZq4jkeak+ZuZ
X-Google-Smtp-Source: AGHT+IFSv1dN8S6YvQdBhrut9H7MyYLkPc2NAR/e3xh+ZGzELkDUwfqEGTXxlFtku9FFJFYLhMO6Ow==
X-Received: by 2002:a05:6402:278d:b0:5ec:9e9e:3c3 with SMTP id 4fb4d7f45d1cf-5ed8e256dd6mr7177184a12.6.1743168656056;
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:51 +0000
Subject: [PATCH v2 05/32] mfd: sec: sort includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-5-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063058_067623_D4BF39F2 
X-CRM114-Status: GOOD (  11.95  )
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 14 +++++++-------
 drivers/mfd/sec-irq.c  |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 3e9b65c988a7f08bf16d3703004a3d60cfcb1c75..e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,16 +3,10 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
@@ -23,7 +17,13 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 047fc065fcf17f5bde84143d77a46749111ea5b8..5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,9 +6,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
@@ -16,6 +13,8 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {

-- 
2.49.0.472.ge94155a9ec-goog


