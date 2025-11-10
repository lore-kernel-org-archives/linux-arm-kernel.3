Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B55CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 22:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIwuzdhiAZkzZPVTm8j4iWbSbDi2mAi24VI6Sy2PShw=; b=oLPsBoq1aYcTJlKSsODVBMlgsh
	E358bgMjbhZX676n/hWXm0XDADnVZyLZTDWjAoxuQfyeHZry5Zv1Or7m4kIHYe9uYNA8sE93D/4QB
	zb6/i4pT0UVl0iAcZ1xVuWMW7O3HpKn8RxLT0lFMv0piSiaS1hzQPZ7kKa38iRrpvG7HV1jZQhPpD
	omovLGLXZROA+Sid2zNSuErycJzkop14t63aWB2wQOaznj/wzLA9sDtqEFmgdZ1tMYcb5JBKUgt0W
	RajwDcfzcPfbSG5zetRt9ruE1sSjPaYVjzTux78O07upRcfSkv1Yq1W6x5uwOe5YHPxOGgE7OOQ0O
	A1g32Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIadK-00000006Dcx-3IK6;
	Mon, 10 Nov 2025 22:45:10 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIadI-00000006DcW-0yHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 22:45:09 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3737d0920e6so42654991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762814706; x=1763419506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIwuzdhiAZkzZPVTm8j4iWbSbDi2mAi24VI6Sy2PShw=;
        b=AgxZdcTKd/atY0sBW7XjUnZqFYnLUdqws9j5J8pU2wKzsfHVFnHPItKWZo9zfnBDhh
         ttz6y58zlmURlC1EoxI9lww+5GqKm6b+5STJJCOFUtCChyKpkseLgGPzyXJLVcSFtnNT
         ZQxzhA+gtgYYzENpujNS1cUofzUXyrCmA3QvKiFMI0Hk2VHXCVNsyPfmD7NDkxbbgA9o
         mTqfFxkPxcTVy0hBN+oievXeXcagKilWpyYDvIhLwydsD7/0rFx88u93OGZIQ8HoXxwq
         T+LxVMhG/dAnIWY1bSR/mbR4+TFDsCT3y58ObG+KzUEbK55QSxNjNMXPoHadLiy23h9Q
         rO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762814706; x=1763419506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIwuzdhiAZkzZPVTm8j4iWbSbDi2mAi24VI6Sy2PShw=;
        b=rK6QwqJyZqIK5/5QWkyvGqQ+nfp2OcFaN7Me8bDm4lZtxWvHGoBLWZ9Wxw3AKpokLD
         /0d6u//JWSdQg4t/BSLcBsS0kBW4ms8nnvlino3qvLe9fFONPKZI5tpicnv0PPyaaIM5
         q0EarZS4S17ix9HQsabnvZKHZ5sPoXJSDIKUeKOzUAqYGxvgcaB4YIdENUV+Kfn5N1LO
         KaSzbzaX01V8veJAp0yxg8uWwM0wcoWQQiMhaogcSAyWJTdxaN+xUOGx/EY3EBB7TK9m
         /hLsMOI0s3NpYwiC9EN2B/KGpsYFqn0gv/9g0CeI6lP77LTrEm7IvUkYOPeMjUfsqgfr
         8Umg==
X-Forwarded-Encrypted: i=1; AJvYcCUO0UGDPE+k0dNG0zUWkWh1abZMmsabi64IIw+prYIwDFQ0wOs7DSozPsk93MosdfD91OdjrNySqg07mwfezE/+@lists.infradead.org
X-Gm-Message-State: AOJu0YxMo8QTnvI/9RtPDFDPTXDOFEZ4GvYHL4/pMU+zlyGeg1vayfCM
	ZC008pK0loEMpN5W0Kd/wvc0gTjUbwOMWpARyRT2VZFb/meq0aHpcbTIxB1OcI2Ji0c=
X-Gm-Gg: ASbGncv1SIBTUZnT7CPmu2hAz3tJVTn7iFBViojP70okB3+LjBQPSf+bnqWd03qK4Hr
	TKthKFf8Le1JnskayXW7JXQG8i3fpHfrUmjrHQWC4rNdtgCkcET1cmdoGDiFKXEEuAVQNS/y6hF
	E81ocQAhmnKISoJC7bk3fOKTWmYxHq52KDtunR6ZdzkFxwHLmg4NWUBkfXc7eUru9uRe8FCmvnK
	X5ij3knpLN9oxp1DmdeUTJnvrH0homcqo2xQQb7kSJEUbMTl1Uau9m2ArKHyTqAD4UpVXbcxRle
	dDqYEN48uNQx5mPfo/EQcBtWYnr0xDY36URnhOWI7lt/vNsvL/REDdCSeFnTXI9sGZpVzWntrGS
	vu8IuhhSqDHVIlxt0z9KpTnsx172XKJOpPtSEOTXW0AOac5BuA5PQDLjRYG626r829Bnat2CS8R
	eoFfpIlFX6v+6RE55XzhSBD9d0ettvYcswK+W0hYOOHrektMWXll4HBg==
X-Google-Smtp-Source: AGHT+IF5fhocAogDz+cJ9tyaU4gnUqnaQYeK5zO9z8Q9VyoS5y1N9k5LFRn6B+l2nBw3ChAsww2BBg==
X-Received: by 2002:a05:6512:689:b0:594:35b7:aa7 with SMTP id 2adb3069b0e04-5945f205966mr2497734e87.48.1762814705883;
        Mon, 10 Nov 2025 14:45:05 -0800 (PST)
Received: from Shofiq.home (88-148-150-44.bb.dnainternet.fi. [88.148.150.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59451bd3b92sm3928726e87.19.2025.11.10.14.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 14:45:05 -0800 (PST)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: nm@ti.com
Cc: ssantosh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v2] soc: ti: knav_qmss_queue: free resources in remove callback (v2)
Date: Tue, 11 Nov 2025 00:44:47 +0200
Message-ID: <20251110224459.49724-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110212751.Jdztdakpcerpqpr28@gmail.com>
References: <20251110212751.Jdztdakpcerpqpr28@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_144508_317223_7F6403E6 
X-CRM114-Status: GOOD (  16.51  )
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


Hi Nishanth,

Thanks for reviewing!

This is version 2 (v2) of the patch, not the same as before.
I have fixed the formatting and indentation issues you pointed out.
The patch now passes checkpatch.pl without any warnings or errors.

Changes in v2:
- Fixed indentation and alignment issues reported by checkpatch
- Wrapped commit message lines to within 75 characters

Thanks again for your feedback!

Regards,
Md Shofiqul Islam

Implement the TODO in knav_queue_remove() by stopping PDSPs and
freeing queue regions and queue ranges before disabling runtime PM,
mirroring the allocations performed in the probe path.

This ensures resources are released on driver unbind and avoids
leaking queue/region state.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 1e5f3e9faa99..7d9f3570ecf3 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
+/**
  * Keystone Queue Manager subsystem driver
  *
  * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com
- * Authors:	Sandeep Nair <sandeep_n@ti.com>
- *		Cyril Chemparathy <cyril@ti.com>
- *		Santosh Shilimkar <santosh.shilimkar@ti.com>
+ * Authors: Sandeep Nair <sandeep_n@ti.com>
+ *          Cyril Chemparathy <cyril@ti.com>
+ *          Santosh Shilimkar <santosh.shilimkar@ti.com>
  */
 
 #include <linux/debugfs.h>
@@ -1884,14 +1884,13 @@ static int knav_queue_probe(struct platform_device *pdev)
 
 static void knav_queue_remove(struct platform_device *pdev)
 {
-    struct knav_device *kdev = platform_get_drvdata(pdev);
-
-    knav_queue_stop_pdsps(kdev);
-    knav_queue_free_regions(kdev);
-    knav_free_queue_ranges(kdev);
+	struct knav_device *kdev = platform_get_drvdata(pdev);
 
-    pm_runtime_put_sync(&pdev->dev);
-    pm_runtime_disable(&pdev->dev);
+	knav_queue_stop_pdsps(kdev);
+	knav_queue_free_regions(kdev);
+	knav_free_queue_ranges(kdev);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static struct platform_driver keystone_qmss_driver = {
-- 
2.51.1


