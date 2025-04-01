Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB4BC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSsT7QLwFrGtJXgYzLTDttFLB1HtTy9nHcX9oWhHWK8=; b=uGU+ViyLVMUFjpc3CSsDIBr63W
	/m4ODS6pfgyyStk1WIWI59af1m5BcoOB83LKhL62pGG5fyaToJKQ80E9tVyl9Yk98gLQZXarxjbwd
	xtbKk3cGg8qJiB1Gfhdr4ouiyeddCFCwvGcg5FRvBgVvES6aZbjrlpOe/83rwnIPCK+xnrFSgJ13D
	xbm/2ctDW7XUiEDRu34GPAJuEQ1xqsKwUQYoZX3Ucm4M6+4SxnMJJG5FoBrVIn9otH//DsoDy+LRx
	AekajWDggbhcLuZmtMkFe4xDxTOOHG0qQJpG3LLTUl0tPMaGyPLRvFJeOoAEgDLpUzGhv/ICtOngM
	xLEKC1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYwD-00000002diT-1ApB;
	Tue, 01 Apr 2025 10:33:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYaO-00000002aaF-1fuQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:11:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab771575040so1259592666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743502271; x=1744107071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSsT7QLwFrGtJXgYzLTDttFLB1HtTy9nHcX9oWhHWK8=;
        b=Jv0io/SBRnb/e7JTT5aQTZCXVKgeb0HnCZZ0o0MkJ3KXGzeIA5DeSovb+4YT8idcNt
         6DtjosgaJkJPELmHrJDKewf3/WrZlUxooMH95WdoCM1limqo6/cgIUDtsfBHswDrCAG3
         f7vw1I5R2WuqHmDp1697tzfbPTQgluaGwSiSqvixdw2AUPhU30YPEUcfjlf+YTpa68wk
         b0ScXR10tiTdGhx+Z10c2J1P3Y7ZAxTqwi3ztB+gzOKrSxC7TE/INbKX3ISdt5hLIx+p
         gM3dNfGKUML46elKWg+bzyd9aEr46lqMlx7XVe8b6uvwRILzqepj75eWtXhWNQmXBZYY
         c9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502271; x=1744107071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSsT7QLwFrGtJXgYzLTDttFLB1HtTy9nHcX9oWhHWK8=;
        b=wpAc0kxG2Hy/TaZ7SaXhIovZcbKjsxJevC98GhHyfq8qcoELXNqCuEs7ifvDtSI6KX
         21BM/aPZSjIy0eiHp/BLDzIsZwGon4pzjMIRrpwqDz/Pgy1jCd8if3kHVeSlNPCky9jv
         n60LA1I2s8ONr4lQPKzGLpzofw6vof4fNeGF7ZAhsFG3oGwnH+ZK4GXi8J4GxXGTJebL
         lKW1rj4v2hp7tFDvtji6ooFPR7MlhVuy6WerjCswIXTWFT0nHebPgNwW30PVPeUapMEd
         cakgHsuKmRbBs/yF9BPf43xAtZwqb17/VephNRUO4IGYfSQlnl8TVzHf5wUM/O9gj65r
         xDRw==
X-Forwarded-Encrypted: i=1; AJvYcCV26VBDVvs9ueBpN4QuYZLvwHPKzSDgyj3XKJJzxmct+/7hoZeLNCqzuSPcGWaizb2i7P1YqCtfa/eV0T4avw9m@lists.infradead.org
X-Gm-Message-State: AOJu0Yy01lfG+0wqB8eIJzr/N9yDNpJR5QVmr1lyz5UlF0+iC1GGDE7e
	fiPHiIIs5Td8WYtPUsXk9TqI2F9njyVfiJTJrw9lGuUoRSMz02oGkvsUl2MbGsk=
X-Gm-Gg: ASbGnctbaL8/SL6HEbmgfYGNa3atMEb/uWJ5qy7h9OKB2bXInypHegy2J0+OvpX9vpn
	qJDXtBgkuZ48YR3geJF9voja5mggxjjAXZ/fqt7KbC3uYTeg5Mxd6hJEIPgxj7Cv3YgIhdsiFSZ
	6UJlTU+YytVxFE3/CQuwBbY++W0VAwfSuCOVDKd+8Doh4wYo4dVNrwekuiUfXQyl/6sI/ZNV+QD
	TC2xHExDemOinxeCHfFoRTPJjYlmN0TXgoGmcQpNmOCtN3Vg0DO/T116+RFf8bGbv+fmm9NzF1r
	+9jwIDLOAyQQed7czzCMiPUs1rw+zjdnmwZpFKHSc9LZYVcF73c5e2k7eETQY7Qym/a35sh6Zvg
	oFPJH8w3c9RcryDJ7Qe/Fjzeu+6tJ
X-Google-Smtp-Source: AGHT+IGNz7sYkiZJ5SyCXOSh3R3E7uqsbcgG7MH73jgfKQy0aOMK7a6G6QNeK4q3SoREpDx6w1RXWQ==
X-Received: by 2002:a17:907:9482:b0:ac1:e45f:9c71 with SMTP id a640c23a62f3a-ac73670d581mr1256026066b.1.1743502270478;
        Tue, 01 Apr 2025 03:11:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm757406966b.140.2025.04.01.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:11:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 01 Apr 2025 11:11:03 +0100
Subject: [PATCH v5 2/2] power: reset: syscon-reboot: add gs101-specific
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-syscon-reboot-reset-mode-v5-2-5b9357442363@linaro.org>
References: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
In-Reply-To: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_031112_445179_E61BD3E4 
X-CRM114-Status: GOOD (  21.24  )
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

Linux supports a couple different reset modes, but this driver here
doesn't distinguish between them and issues the same syscon register
write irrespective of the reset mode requested by the kernel.

Since DTs should not encode register writes (see e.g. [1]), update this
driver to support different reset modes based on DT compatible match.

At the same time, add support for Google GS101, which does support
cold, hard, warm, and soft.

As an example why this is useful, other than properly supporting the
Linux reboot= kernel command line option or sysfs entry, this change
allows gs101-platforms to default to a more secure cold-reset, but also
to warm-reset in case RAM contents needs to be retained across the
reset.

Link: https://lore.kernel.org/all/20250227132644.GA1924628-robh@kernel.org/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/reset/syscon-reboot.c | 98 +++++++++++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 21 deletions(-)

diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
index d623d77e657e4c233d8ae88bb099bee13c48a9ef..2e2cf5f62d733c7c07110f3052583607e25afd5d 100644
--- a/drivers/power/reset/syscon-reboot.c
+++ b/drivers/power/reset/syscon-reboot.c
@@ -14,11 +14,24 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 
-struct syscon_reboot_context {
-	struct regmap *map;
+struct reboot_mode_bits {
 	u32 offset;
-	u32 value;
 	u32 mask;
+	u32 value;
+	bool valid;
+};
+
+struct reboot_data {
+	struct reboot_mode_bits mode_bits[REBOOT_SOFT + 1];
+	struct reboot_mode_bits catchall;
+};
+
+struct syscon_reboot_context {
+	struct regmap *map;
+
+	const struct reboot_data *rd; /* from of match data, if any */
+	struct reboot_mode_bits catchall; /* from DT */
+
 	struct notifier_block restart_handler;
 };
 
@@ -28,9 +41,21 @@ static int syscon_restart_handle(struct notifier_block *this,
 	struct syscon_reboot_context *ctx =
 			container_of(this, struct syscon_reboot_context,
 					restart_handler);
+	const struct reboot_mode_bits *mode_bits;
+
+	if (ctx->rd) {
+		if (mode < ARRAY_SIZE(ctx->rd->mode_bits) &&
+		    ctx->rd->mode_bits[mode].valid)
+			mode_bits = &ctx->rd->mode_bits[mode];
+		else
+			mode_bits = &ctx->rd->catchall;
+	} else {
+		mode_bits = &ctx->catchall;
+	}
 
 	/* Issue the reboot */
-	regmap_update_bits(ctx->map, ctx->offset, ctx->mask, ctx->value);
+	regmap_update_bits(ctx->map, mode_bits->offset, mode_bits->mask,
+			   mode_bits->value);
 
 	mdelay(1000);
 
@@ -42,7 +67,6 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 {
 	struct syscon_reboot_context *ctx;
 	struct device *dev = &pdev->dev;
-	int mask_err, value_err;
 	int priority;
 	int err;
 
@@ -60,24 +84,33 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 	if (of_property_read_s32(pdev->dev.of_node, "priority", &priority))
 		priority = 192;
 
-	if (of_property_read_u32(pdev->dev.of_node, "offset", &ctx->offset))
-		if (of_property_read_u32(pdev->dev.of_node, "reg", &ctx->offset))
-			return -EINVAL;
+	ctx->rd = of_device_get_match_data(dev);
+	if (!ctx->rd) {
+		int mask_err, value_err;
 
-	value_err = of_property_read_u32(pdev->dev.of_node, "value", &ctx->value);
-	mask_err = of_property_read_u32(pdev->dev.of_node, "mask", &ctx->mask);
-	if (value_err && mask_err) {
-		dev_err(dev, "unable to read 'value' and 'mask'");
-		return -EINVAL;
-	}
+		if (of_property_read_u32(pdev->dev.of_node, "offset",
+					 &ctx->catchall.offset) &&
+		    of_property_read_u32(pdev->dev.of_node, "reg",
+					 &ctx->catchall.offset))
+			return -EINVAL;
 
-	if (value_err) {
-		/* support old binding */
-		ctx->value = ctx->mask;
-		ctx->mask = 0xFFFFFFFF;
-	} else if (mask_err) {
-		/* support value without mask*/
-		ctx->mask = 0xFFFFFFFF;
+		value_err = of_property_read_u32(pdev->dev.of_node, "value",
+						 &ctx->catchall.value);
+		mask_err = of_property_read_u32(pdev->dev.of_node, "mask",
+						&ctx->catchall.mask);
+		if (value_err && mask_err) {
+			dev_err(dev, "unable to read 'value' and 'mask'");
+			return -EINVAL;
+		}
+
+		if (value_err) {
+			/* support old binding */
+			ctx->catchall.value = ctx->catchall.mask;
+			ctx->catchall.mask = 0xFFFFFFFF;
+		} else if (mask_err) {
+			/* support value without mask */
+			ctx->catchall.mask = 0xFFFFFFFF;
+		}
 	}
 
 	ctx->restart_handler.notifier_call = syscon_restart_handle;
@@ -89,7 +122,30 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 	return err;
 }
 
+static const struct reboot_data gs101_reboot_data = {
+	.mode_bits = {
+		[REBOOT_WARM] = {
+			.offset = 0x3a00, /* SYSTEM_CONFIGURATION */
+			.mask = 0x00000002, /* SWRESET_SYSTEM */
+			.value = 0x00000002,
+			.valid = true,
+		},
+		[REBOOT_SOFT] = {
+			.offset = 0x3a00, /* SYSTEM_CONFIGURATION */
+			.mask = 0x00000002, /* SWRESET_SYSTEM */
+			.value = 0x00000002,
+			.valid = true,
+		},
+	},
+	.catchall = {
+		.offset = 0x3e9c, /* PAD_CTRL_PWR_HOLD */
+		.mask = 0x00000100,
+		.value = 0x00000000,
+	},
+};
+
 static const struct of_device_id syscon_reboot_of_match[] = {
+	{ .compatible = "google,gs101-reboot", .data = &gs101_reboot_data  },
 	{ .compatible = "syscon-reboot" },
 	{}
 };

-- 
2.49.0.472.ge94155a9ec-goog


