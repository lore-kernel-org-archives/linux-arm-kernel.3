Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElO2IZ9G98m5zgbIKm9J2T+DEuKZxhIOZ2O4ti4VZ1Q=; b=nQKRStFXTCHGatgua/gvfTNI8P
	M+xBjdx/RkBRBYpUAzpZnqntuhGyVu3KjmXcqLR51MPcwGhMAyNlmp1r8ThEtY07FYE1q58Sc3o/8
	ezMnGHpzYQmNubC2E+TXXcEHNN2S8WXFS8c7oJi7X3A4g93X3YhxsRqlsT8R92DSQYUyezCbln+qh
	b3jJAAjqNb+PjE0B1Z0yhAGz6J1XLppcWJEXhAGSHwNY2DFtIsMqVyylsBSjfnmbB5xwAcz8SrGCc
	+740vKbbiyWkDdYGHGTwO5zoYUWzpXofjqemxFmn+QBUNtvdOqyNT7+9eQA7WZm8Uc1L+c/6NmV97
	Zjyy9T1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUAB-00000001rQb-3yw4;
	Sun, 23 Mar 2025 22:51:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTya-00000001p4t-3feC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2aeada833so704447266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769567; x=1743374367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElO2IZ9G98m5zgbIKm9J2T+DEuKZxhIOZ2O4ti4VZ1Q=;
        b=SWnnwMPMTZML/LjlA3o52qvkyNiQ/x7VLX9HJhfZsRgCpMredH7Tf15ob2nQ6Bgy0n
         SWNvYG5sHtGyJyVe6UZUTBE828Ycyli8vpeteeZoku/YrSlF3z471uKfuKF0CDAmPoMM
         khd1+iqlxEZQdfwqdakxK8NyNrCatjZwO2qKNPwmSycet0G9fPKRNKMWVKCt4xdNaLPs
         EKHOD88ybqWBv58f+bp62/euEm2jjZu4etfcl1WEWnO5Ma179XydKA58Tj1xUEZlv0Ye
         AtpVOQYBADRyBrqJ2KedSASrKVhtQEaBp1FvrPK1m9fXzGBi2EBtR7iV2gZX+4/xGIYw
         rp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769567; x=1743374367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElO2IZ9G98m5zgbIKm9J2T+DEuKZxhIOZ2O4ti4VZ1Q=;
        b=Kn0dAYJ4WKn6Yz0T9S36TFCYolt8+e1NVltZH9DvGpU8nXMMqZiKjokAW6P/ppF1As
         w39G0JF4Lxo8Dum6dylQ8nrJnebBASKAShii4I7+r8AeQG4xGN44HroIX/99ZFueOVui
         FUDSY8px1PxczWGTO6GGjXBwch11/fsi2aEhWtGliQeAl1o/cLKyzDZXz9XMxC2Ah6A4
         ZifVjdI56M+kRqjHQJPxgk0qmA/q93wkvedfevka4N3nCzjX0s693X/HtIvveLt9TOqW
         28X2gyTbc+ISR18aOkXHmiFd3hxcClbNY+rRFtn+5v2s09LtSwdBkAgU0GN4ySXY+CHO
         1y6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCh1zrOWR8RQA1RVVou8F7Oj0nu1KiNxsoK0lWIBgz6xEjkTKt1BbRCJxgATZvOCfROFpvLhC60uprgmhrIiG2@lists.infradead.org
X-Gm-Message-State: AOJu0YxCRPJsOSX0utXtHnITGnEhUiY3US3PFeoNyzSq5XOswdjzS1Vs
	oYhRCAo38kTzduFsvA8jCeZ052tQJIdTetamAHoaJvng1lFHQVkwuto0R85kk2o=
X-Gm-Gg: ASbGncso3MV6NYiYAe2fcXSurQ2z/DpQ9FMscsMPD6n4xaz25t/nXa5Gw2+yfheA0LO
	EC4oZvf5Wwn9apJnAGj27JjLR8+dcADLM2GQjUQ/tos7+VSZkLV0Drcw//J3zYnvSJruzSTySPD
	BWgCs8IuWKMAGyWEUjUs/PEIikBiPqYwPs/YbQROTZwnByrFx5nMO+cgoPSKSgxTQgFtjSItyNQ
	GIEWyW0+iG32kuujp6h9vDV62vi1KlfWL1mOQJ7bdtHZ0u37+hKitlalYI8+oTmCRITM8SlCxue
	LR505/jeMOoVFtlwRIvnmLzRM4A3NS813h1MTrZmZmfEfWiWziY071BJ5k61sTxrjJL1N3qNq0e
	h1i/J3mrzGcTNQdgR90y7W1eVeMx9
X-Google-Smtp-Source: AGHT+IHK84mhAeYJUO60X9G/6jnyMUTEi3qcuoEP39r4Iheks7w5bAT6r9bNJMH9nKdB0JzRhkSGLA==
X-Received: by 2002:a17:907:d58b:b0:ac3:ef17:f6f0 with SMTP id a640c23a62f3a-ac3f00b5ff7mr1040036766b.5.1742769567137;
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:22 +0000
Subject: [PATCH 06/34] mfd: sec: update includes to add missing and remove
 superfluous ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-6-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153928_939836_CF682103 
X-CRM114-Status: GOOD (  12.65  )
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
2.49.0.395.g12beb8f557-goog


