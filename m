Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0191C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 05:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jaKW2U+yMxpMkfu3V+tl4dxFwdr/bp4aDLEXOqceHEc=; b=dQN9b6qW6tghkhqoOxLGt7jv8G
	CG4yxx21Y6pOv7bTjX8BH8OZuRsMlR/SprA/4J4664fzsxJoAsU6mcYwVdQ1Mnug5qjzpfG7Fzc3I
	L8zodtSS4a58NENEtf3mdgih5Whv5KNPzIJNaXZmYWlxML7MUrqWqkJJcTa0Kf+KSODsEB6Y5T5sc
	yyKV62GwsVyvk5nA8XCHK/ey+83UTZAdCJ4EdOIL7Yn4nAd70Gs++yszKFh5tIOkIuyZ+2lcK36ca
	xfHuER7ua8EKE05dsPx2NXxwzGqbv/6x2UXo1yy6rpn9FxybdMwMRlj5e52JHs0VRrZPnu5IAcx5G
	K4T8QGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxdsv-0000000EI9t-3jaH;
	Sat, 22 Aug 2026 05:03:13 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxdst-0000000EI9A-1kho
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 05:03:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84830c774a0so1935884b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787374990; x=1787979790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaKW2U+yMxpMkfu3V+tl4dxFwdr/bp4aDLEXOqceHEc=;
        b=EVpWQhkn5cQisV/eDUEESZfOJ4rz9nmgUMAxC8wZTMZwa7UVlFyJ1XEZUTQvWcz6/D
         FbsJxnV+unPhe5NA5jkbgGLiCG042nNuavKjpb5kcIMveCJuyKn3AvblNSxJz7MmxLd7
         ag5S4IOT84Al9yNheAVmq+etL5H/1/ZKTudAOMWYFqUdzQfznDWULNydMnGWV8TClOUs
         XL1gDZ+LfnyieRseEX9AWm4Z5ilMDDWVmGF/uETgNB2Dyl7taZdEWI+CWArq7wYMTuZ6
         Oyx0VaVn9bgBb+IxGLopqI4D2B04x5kMTHbKvuYmxJIw2onEmPwJYAKprRJ+6v5aTf/A
         oemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787374990; x=1787979790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaKW2U+yMxpMkfu3V+tl4dxFwdr/bp4aDLEXOqceHEc=;
        b=jeEfbS1dzv4HKBIW8BGkeTbY9gf9W1/KzUmXS1k1ACslhGE3fFPhjSIhqcy8RSvwXp
         ltE0xhoC3+Ofm5x2JMEVR9Sa8bH7Rbr4Az7DGhY58EqmDCITF2HH/r0kQsd/nkZ9DXUK
         fx4krMk5I743HWS4DgPFkJ8rsHlZIfEzEjaRVepiw7IDQTHrPb54cw0jloyYxW6PVkcx
         SHdiJmB9kUW+DgOOAwJqceB/s9SBgJca42DQg+z+beoKu8xpNxx+QBL8wwY1y/UtJa9B
         0jER+kf6qTwG7D8XiBPiWORMaPp18msABRuUvmkP230uTMgVupr7dCWPHxpy/GGTDBLH
         402g==
X-Forwarded-Encrypted: i=1; AHgh+RotmKLTYaAjDW2ZiWmvqxth4ipQ/rkYpRLMb1cN/YePLmnb7qs7j/6tPFZuJQ3h63JjQBj7Kqyc2l54Nr1NaB+z@lists.infradead.org
X-Gm-Message-State: AFuF++k8fRMPXmxTInywUMpXsrUd9lFalSbP378wPwL8zTKjUCaVTYUd
	zVrA9czArkR2r0pI5N8uio0vNNOcaLZN5BrgPPPHnwyu9JkjG5Xwj6Q=
X-Gm-Gg: AR+sD13Gha2dJtY5hsB9HNqs4+GCMkJWFfzoSKMC0T8KWOXylVd/tDC6AlIO+NgIEV+
	y+/QB6cQ2GaYiFX7hevOBjlGG5cM99ZV7Gn4HTnFms+dduOWvGYVwawH5KH4BYqBsMqP/HKgsgK
	fnyTuFnBWKjnqBEg86bka6lGFFCwJ7tKVj/9L2LvAQQEUeIBputN1J6Eca8Qj0HilP6oXQKvSBC
	m7DDQi371XT16nJPPFcLzE6g5u5jp9coKoEP8NoQx3daramampNoFOCeoPRLUrRy1UvANedDamB
	sD/ymWblPAabZl9/u5tEM6kUnF6SYIzSuuuUUZak0hCgzXhty1qmwne+oUMErcSfba4TAXl+Gl+
	TdE8oqp1zsjTiI58FyqggdzaLP6ySD5clQAKSRX+5XlzbsOjdu0iseasbJvbNQUvk/DoZwRID7m
	uxIS8+B9fRiFEGf9hZOhUPGyEfJJ7EWZJ/6gCFnb03NQIH2iJkMbQyLHeu+xMJdMc37xhX2mVSE
	SuYzIisnTidQZkshCRB/vnEPR2S3VwJk1dO4SAVlncaj10rCgZAdGCRXw/S/3aBFaIQjw==
X-Received: by 2002:a05:6a21:a49:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cd301370b3mr22342048637.14.1787374990316;
        Fri, 21 Aug 2026 22:03:10 -0700 (PDT)
Received: from codespaces-2db70c.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186183f31sm3060974c88.13.2026.08.21.22.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 22:03:10 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	christophe.kerello@foss.st.com,
	triet.hoang.dev@gmail.com,
	johan@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: stm32_fmc2: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Sat, 22 Aug 2026 04:59:56 +0000
Message-ID: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_220311_464818_1A25421F 
X-CRM114-Status: GOOD (  12.53  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from its suspend 
and resume callbacks, also reduces kernel size in case CONFIG_PM 
or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176372..9f42f8ab3212 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2076,7 +2076,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	stm32_fmc2_nfc_wp_enable(nand);
 }
 
-static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
+static int stm32_fmc2_nfc_suspend(struct device *dev)
 {
 	struct stm32_fmc2_nfc *nfc = dev_get_drvdata(dev);
 	struct stm32_fmc2_nand *nand = &nfc->nand;
@@ -2090,7 +2090,7 @@ static int __maybe_unused stm32_fmc2_nfc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused stm32_fmc2_nfc_resume(struct device *dev)
+static int stm32_fmc2_nfc_resume(struct device *dev)
 {
 	struct stm32_fmc2_nfc *nfc = dev_get_drvdata(dev);
 	struct stm32_fmc2_nand *nand = &nfc->nand;
@@ -2118,7 +2118,7 @@ static int __maybe_unused stm32_fmc2_nfc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stm32_fmc2_nfc_pm_ops, stm32_fmc2_nfc_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_fmc2_nfc_pm_ops, stm32_fmc2_nfc_suspend,
 			 stm32_fmc2_nfc_resume);
 
 static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp1_data = {
@@ -2153,7 +2153,7 @@ static struct platform_driver stm32_fmc2_nfc_driver = {
 	.driver	= {
 		.name = "stm32_fmc2_nfc",
 		.of_match_table = stm32_fmc2_nfc_match,
-		.pm = &stm32_fmc2_nfc_pm_ops,
+		.pm = pm_sleep_ptr(&stm32_fmc2_nfc_pm_ops),
 	},
 };
 module_platform_driver(stm32_fmc2_nfc_driver);
-- 
2.53.0


