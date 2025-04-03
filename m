Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=; b=eEf2NWjKxqzjD1qJ8fMzlWNvEN
	czZYbVkuzBbCmCQGp/OI4I7GKobq+B5iyzOf0EPd5lLGp5LpPsofiIcVm1NRLMkiQhp13zMW1gg3Q
	OxfS5K8cOBPy7ZP2WrsEuWYnrPbXIKB1G1LB9YRbLbRQlESbmucOkvLijSFYq92saAtzkBNhFqbsf
	Tgk0p6qqROAdn5PNwo/YY9o3RsYnb3eN87nLb5dkgMz1O2pQFCLaw4VqsoeIVyvERWxZTTA+dDE4t
	B4HFMtNtS2NGTVsx3JzkzsvLC0JZSx64WtXtn1iI7vkeF/taDuVVhdq4xpDGi25fuE2aCooDX8KD3
	ejyWk0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ga4-00000008M4j-2sjQ;
	Thu, 03 Apr 2025 09:09:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPf-00000008Jg0-2KVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:05 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso1295759a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670742; x=1744275542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=PuLbiypGZH0LpEoNc8KOZkSP6SRExNwFHedQPEYrhvObprWgQBut3Q64HmRELIlDPd
         OBfl5pZYJsZg6WvhIqeS+Ljelrg9dTsiNjx4uNGimkKPPOZVm5koPtifXA59xl2b0B8C
         x6Wrf1bOaTmYpduzzk5H+jpuxsC4PunG88jkdsrZErFBQPITYFPw+kFUwg6dHymJ9Zww
         3DKNKfXKnq3tSTUdEPmT8eUZ8FTUyR59IgAMK0BTUAQ7LwugaAFPiYbdG5I7/OcDahd9
         wFlj4YDXk74nIZyIg2Q6v5nXpw7Gk8jSMe+Aw7gEsoM6b0wPPUg79J2N7i9UVj13yuS8
         8rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670742; x=1744275542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=YAGCYHtSj6wOvnN3KwHRNLrKqYhjwoX8Yg0FkRH9t7gdxrB1VK9OvgRB//xwEfKs0A
         4Nr9tY0HUVJLbKeA1QTSUEIcSCWnpzB4Syo0bPokd/Qh8WNAd+nWOS5DJNBZR0CSgh/z
         7rTHMD8tM2+J0Xi8k58MmoNIxTQiOJK+bzpBB5NqDoXflJ4TVD9/rkOWWmt49sdr0r3Y
         RonoZ0jdiXfGf65FXbvBvzFaNa+HflL2eIn3G5xjBFtRZmXXoONDSsggqMVP5qGnxw07
         ZYJ7ZetzUimeqe7SzBk78ERVKdSeVB/dJo5j1yy/K8lQm4ocbOypxlUDCkBu/K52cITU
         ufhA==
X-Forwarded-Encrypted: i=1; AJvYcCVSfFtI6/vTV4/WAW/6p8i08I8uWteU8j3heZHddl91KbhvRsUdOwrsOCcO8NNu9IltFMf/sO2dmSGwFMqSU/Nz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+o2ceCLYKDgpn8WDBZldvr5vF1YsHnuzgJZceDPfJi70Etudj
	AgEc2NnTcoJbjB+Jf7xMSJI+N1xih6JDAeWI7lYbhlK5vMpuH38xuBDcDrqu4X4=
X-Gm-Gg: ASbGncuqwqvRcEAkzkWDOgW8uHTM9mbRXBoVQ+0uezEL/K11CFtxN49kj8ZR7szebw6
	slrelTsv1J0c2lElf0SLTELThfY42Wy3VVZORxhBdOCQ8A1vRuy04iJ+gM9ygtKOk2/31lJp6lz
	1tYwJI3PV+IuFcawCEXYxN9cSGEJtx3Ip+m6k7Ys4xkhUtweL41DBvSeKQs7h8JmPra8a+DGh0B
	W1NS+lI5Pnjg+0tmT6D7L23N2pUr4ac5q56cuV13EWxxRBaH08/Lm48lFP/vrrxrOU7zsilWvNe
	WJh7pAjM7dFKtDATIt5GMYpx4ck8625wPuYb1WH/MJmYfewZAPnwKuGpQc6Nv9P9NeH04jGodxD
	OSqC+bnPmWVwzYYz6vlbbObQnKYfK
X-Google-Smtp-Source: AGHT+IHLPvSEymTsQ03JgORzrfz3sWcW5LSP8Sp0KzcMY46wC//GzsWqGdq35W45MXKHrK74iEdBWA==
X-Received: by 2002:a05:6402:51ce:b0:5ec:f769:cfa1 with SMTP id 4fb4d7f45d1cf-5edfdd155cfmr14720447a12.29.1743670742249;
        Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:57 +0100
Subject: [PATCH v3 05/32] mfd: sec: sort includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-5-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015903_598260_BB066252 
X-CRM114-Status: GOOD (  12.14  )
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


