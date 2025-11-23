Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A21CFC26D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PwG2NvtqtgTxx/LedM7ZSRwupcpxNiROYVeju+b13Js=; b=XrNbnGiOreiuqCT2wjrEqg3asu
	r6HgyyX9s0DbKiue55BxOhoEAMwhY+I6QseLdzi3HZre81h3Gf9hy9ciI0wAXnhcFwShD4s8TSeNC
	TAt/FKDJ83Qbck+Fcj6OVrHZDjRE1VMFLN0EKVQjl0OhW6Jag2Ppnha766tjBnSlvND9+91ll6TIS
	mZZfhLs8HSpScwjmVytCYv/IfeilW6OVDmAJIv2Rdke8DATyHj1B2h7M64mwqvMgmHcYbjSvm0OP2
	8IshA3mJvyhcgqFAfhVledRhUNvIUBOLtdYAkKbCuPygRpn9qLuSLFoxKarIgITGXHc2TakEiIYjm
	a9e/U2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN4Ev-0000000ACj2-0hF8;
	Sun, 23 Nov 2025 07:10:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN4Es-0000000ACih-3uAd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 07:10:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2957850c63bso23586105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763881825; x=1764486625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PwG2NvtqtgTxx/LedM7ZSRwupcpxNiROYVeju+b13Js=;
        b=mIrau4qCH7h07ToFF8dX3W5Lu7L8UMzB9Z5s+TlfiLdSI31zPLHegEJiryifFIPmHu
         z7oWhhOzoFqdDQdduZvqAwaOR7vCMllHwplmQ7QA2LnY+FVyLW5CwWYBfLfDSjvb3bpl
         2ly5kq3gRKEpinHTCnY3my6iWEnc/gGo1kkKZ8HfXcq0GurdgHJqBxiL6kAkEmPhvfSl
         9KgiUiQCYPgmSUezjoim0T6sqCQtVahNMQkyfHQXNd8GhVo5JLZujg7m+wADUkPNJSse
         /8ouE77KfzK9wYuIBkJksIr/YOc7lzwdlsSh/DNmOZocyQ/pzi7nPZ4IH3AWcwvEcCf8
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763881825; x=1764486625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwG2NvtqtgTxx/LedM7ZSRwupcpxNiROYVeju+b13Js=;
        b=Y50EkgtMREK/WnO+e4vv66dWyqTgbj2RK0R07rcfQhW8LXRyKZkxM/nHx8/GO+JvEi
         St0PjgHI5N/00KJTeBxbH1HYvAAymnk/gp+kMXHD9mdsIYWTjsdu6prGZkvSm+0Y/P9m
         C+UAXew4tPeDY4RkqCC0FgJIopwlaMv2XqP7hVFLXHLe19133llCoao2G1COILmfGucf
         KnMiF26HcOUdlT0AHgvvQzEROTec+FKmI94Wx+8J9YVPeAK1pa0P4Ofk0e0lxMVZE6pq
         owo2ipAzqs1hrFPxmKtMnBPFhi1Ywt6ClLQi3psGQnWXaMdazc05SurRRW1oipZojLo1
         54fA==
X-Forwarded-Encrypted: i=1; AJvYcCUZFqiapxAorcX64+1rNFV+z1C8Y4C3s2P5hRhS0P4Ew5yyvHeYvEFmdn2Bj9E0TYSfmzruawIsozmMORwS4DeF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr6A8JH88DvYBHcLZFKg+f5oiV+qAmVcR8c/xCtZ3XT9ooOkVX
	9r9HOMs7lhi+kgwC9zBqeO6r5hGQivFkO03lIFX9Kt5yDsuINrHayNMa
X-Gm-Gg: ASbGncu2kHteIfLfiA6KZfV33r+ONFDwdxIPbJTl6SOFGIFzm61HQkpvjXL3cSSjlza
	kftNPGpne+3KKCRsAiMS9cqQ9kOxs8xb1ZZSjGetsNEkpearQWEbTbd8cvEM5BI3bGDo5lemLLE
	VerSoTfUxREOwd+5EwTihuaURE4ktYKyiA771F2Wb8/8e7IR8fH84QupyL7ysM9QiXCMRwTR633
	Juq35OUJJAdJhL7Tkbo5Jj4Tg0X3yq1dJ2/CYjZdAlzRzYCrmwCRlX7lyCVCqHBTkvq9LCd3ScX
	tPTMY6bbwiqMY60Dst7hvp5V4Nkg4Zd+TgqL1TshhtwsxPaHmjuBZ3gu4hJ5L/fb8Agd5ZuxnoZ
	G0jZM1SYZ7EIASESqJkatfRMZ1siXewg5nJmAGO4IDMvc7fnqGNPSTJo++cX0t/JnOQgVACDhzq
	VvJGvfT3LB
X-Google-Smtp-Source: AGHT+IGOb2SPkDuexkN6TZJ/1imTC0LGqAJENCoa3Npb4oSStvaDCmaZVboHY52QWjAi7Q8yBVralQ==
X-Received: by 2002:a17:903:2f0f:b0:283:f19a:bffe with SMTP id d9443c01a7336-29b6bf0db2amr88567395ad.7.1763881825449;
        Sat, 22 Nov 2025 23:10:25 -0800 (PST)
Received: from t14.. ([103.170.245.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2ae1c3sm102091315ad.92.2025.11.22.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 23:10:25 -0800 (PST)
From: Sidharth Seela <sidharthseela@gmail.com>
To: claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com,
	nicolas.ferre@microchip.com,
	sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [RFT PATCH v2] Use kmalloc_array() instead of kmalloc()
Date: Sun, 23 Nov 2025 12:39:06 +0530
Message-ID: <20251123070905.93652-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_231026_973360_713ABCCD 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Refactor to new API, for cases with dynamic size calculations
inside kmalloc(). Such calculations were found using grep in the
sources. The patch compiles properly with multi_v7_defconfig
and multi_v5_defconfig and generates object files for the following
driver files.

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---
Changelog:
v1:https://lore.kernel.org/all/20250924145552.55058-1-sidharthseela@gmail.com/
-refactor code and run checkpatch.
-use sizeof(*ptr) not sizeof(void*).
-add RFT and the how the issue was found.

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..01bf557034e0 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -754,9 +754,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!sam9x7_pmc)
 		return;
 
-	clk_mux_buffer = kmalloc(sizeof(void *) *
-				 (ARRAY_SIZE(sam9x7_gck)),
-				 GFP_KERNEL);
+	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
+				       sizeof(*clk_mux_buffer),
+				       GFP_KERNEL);
 	if (!clk_mux_buffer)
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..91a5615f724a 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1127,9 +1127,9 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (!sama7d65_pmc)
 		return;
 
-	alloc_mem = kmalloc(sizeof(void *) *
-			    (ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck)),
-			    GFP_KERNEL);
+	alloc_mem = kmalloc_array(ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck),
+				  sizeof(*alloc_mem),
+				  GFP_KERNEL);
 	if (!alloc_mem)
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 1340c2b00619..a12381f6c068 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1004,9 +1004,9 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (!sama7g5_pmc)
 		return;
 
-	alloc_mem = kmalloc(sizeof(void *) *
-			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
-			    GFP_KERNEL);
+	alloc_mem = kmalloc_array(ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck),
+				  sizeof(*alloc_mem),
+				  GFP_KERNEL);
 	if (!alloc_mem)
 		goto err_free;
 
-- 
2.43.0


