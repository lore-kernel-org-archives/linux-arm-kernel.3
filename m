Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2ABCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxZAPUKdi9AxX63zPi/NWqNTntX+DYqp6OrCNhCWvus=; b=wMzvxVaK58RKPVoZRDYEFo7piP
	7GkeimStivxY/D9b+gQjAp1uJe5dHFDMBLToDFMR0GPdYmK1AQT1PGGuVkMO1i8D8F3JQK+PspyKz
	kITtDfNhchBgx1mPd1ExaNKQZtxaA78sEEKiLq1aAfyvAd2dJKSx58qzoJb0e+isrDLW8/N2Ij9n/
	/RNCwmDg65/D0HngkNdZC7y+p6Jzo9eSuMH/yIBYTqqJHjoWms7jfdNoP+sh0vpazYpf4FzsP4JyV
	Hg2dH63ueaFYzeK4jb8hT/Yx5qG69lCyyawmA6nyhKoMnD8rdHpVEyhFfm/1FLB2riaJwH7qBXQEb
	5Nbz+iFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSMV-0000000CqXy-1GDA;
	Wed, 05 Nov 2025 01:30:59 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSMT-0000000CqXa-0SuN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:30:58 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5930f751531so5874863e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 17:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762306255; x=1762911055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxZAPUKdi9AxX63zPi/NWqNTntX+DYqp6OrCNhCWvus=;
        b=bNpVKqkSD9ek1SHbO9jqEB2ILxVKdgrwOteX8qTqU32mD5kqPhkuLUJbR9nnax1ldD
         O53fpFok7zvfSwOWQ/bP/crik/VGOyT6kXHUMSGByJD+mic1p6bgNKl0p1li09p+ka2L
         QZPrCNUM2wqh4EWgpnmGeCWyRmffM0DxYBa2kvZ2FUqU3lVHP225B/SnYgaQYH9RoMD0
         XcurtLw1JcsknrXzA2gUb6v7GDulLxo4bVzz+7SyImZZqxAeR+I5tCIjy6B7hz5baOVL
         GkuzcqD9x9FPHt4fKti6ELWb1ixFNfHYjLyMPp5lEn6JOV0HZJZfn/n+rOmxnPRyO1UJ
         aByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762306255; x=1762911055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxZAPUKdi9AxX63zPi/NWqNTntX+DYqp6OrCNhCWvus=;
        b=uti6/ogtncxANy5k8kUs2DsXln0SNe0E81WJDz96+0hPnoHxoo7rtl1qMCoYxAXPfA
         jlyvTdgl5SVIUbI5jFWhfSoOzjJQMz/JW2eA+ftzilTgT69r9YkN8j4MGoT0BGoMNb9D
         GYusTcNGa1cA/oaK6ZRoNCCRIkSiN1rr5MXMuxyC/dED7Is6pIdBoWXND+K9x9ZHh2ZP
         W0V5CKtzWpowU958XusYuweyiByyZzXBMGoO7XUF3oTwJy0xT8sFSEb4gNuSUYv1ED9E
         8F1v+VjP+Y6bu8mCzyqqFcRtRxOw/yKCaRmDBS2jU1IT4R7mCfVXZwvztpaHjjEQfVFW
         eGWw==
X-Forwarded-Encrypted: i=1; AJvYcCXW5Xz2ZmjuLpNu3a0nHJ1HomELudRTSLr9o0VDNNmCzP/6F14i7pxPOLKgtR2w45OeVtLuJd0ZKwRzTnni9oxg@lists.infradead.org
X-Gm-Message-State: AOJu0YxNw/gjNAudSTkmxOs9NeSbWEbT/WU1LLfWfQs/QUiBI0piVHaU
	/sS3J6mAMyMB1vvfeh3c07CT8ZWBfQNGNM3ZBFFw/pzN/Wn9s+ZU2tin
X-Gm-Gg: ASbGncsjDlpcC6DNEwGdL0Jk52cqW/gsJJ+XxzbQcBoHPkHsp1TvHhq6RATCDED1me1
	WJBib0otToJKHVVl3+4vFf7WFuv01pOSoAEawYiFhLcFybWG1RH1FJMn0THXQxsU8sl4Uspg3YF
	DOpyK36Bbp3ivz+luPUq7//8YVkRUVDKVT47ZSz+NyzozYvELha+c1U8AuWHNkygyk8faYFGkCd
	IsSSXFIm56ZIfntUAPmBCLCYWXcZJndP5YS6AQTCHcqgu1FBY69P7DBdgJCzFs9qnl3gLjMYhxl
	inceMLi3RQto4TiwQQ67wtRrMzrzX2w6PM5vn8Qm/h+bT5SWPfoUPPx1z9f5Q90dSilbRHbzFZf
	1fAbKGYQGEilxrPDq+nkIUITCoEzxXQndulpnD1Ug5T8O1k6kPXHTKbVo6AdjxgW0OStgCBYzsm
	drcqwkHh9rtsV34D5Qs5DZ9XOWFf+n76pW6TJY4hRYiK4=
X-Google-Smtp-Source: AGHT+IGYR58g4TD80ka/4TE1av2oXs5XYjdiJSgJzeuI4WSwQMOU+Tz4cXqdNh66K0bcGOxe0TdBBQ==
X-Received: by 2002:a05:6512:3d08:b0:594:27ab:2f7a with SMTP id 2adb3069b0e04-5943d5176bemr317362e87.0.1762306254539;
        Tue, 04 Nov 2025 17:30:54 -0800 (PST)
Received: from Shofiq.home (62-241-229-58.bb.dnainternet.fi. [62.241.229.58])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59435743c50sm1017484e87.32.2025.11.04.17.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 17:30:54 -0800 (PST)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: nm@ti.com
Cc: ssantosh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH] soc: ti: knav_qmss_queue: free resources in remove callback
Date: Wed,  5 Nov 2025 03:30:49 +0200
Message-ID: <20251105013049.45646-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_173057_158277_0B805825 
X-CRM114-Status: GOOD (  11.86  )
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

Implement the TODO in knav_queue_remove() by stopping PDSPs and
freeing queue regions and queue ranges before disabling runtime PM,
mirroring the allocations performed in the probe path.

This ensures resources are released on driver unbind and avoids
leaking queue/region state.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 6e56e7609ccd..1e5f3e9faa99 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1884,9 +1884,14 @@ static int knav_queue_probe(struct platform_device *pdev)
 
 static void knav_queue_remove(struct platform_device *pdev)
 {
-	/* TODO: Free resources */
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+    struct knav_device *kdev = platform_get_drvdata(pdev);
+
+    knav_queue_stop_pdsps(kdev);
+    knav_queue_free_regions(kdev);
+    knav_free_queue_ranges(kdev);
+
+    pm_runtime_put_sync(&pdev->dev);
+    pm_runtime_disable(&pdev->dev);
 }
 
 static struct platform_driver keystone_qmss_driver = {
-- 
2.51.1


