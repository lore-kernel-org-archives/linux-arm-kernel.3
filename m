Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2CEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSELEHI//YEAphEyKZ5VJ4gtHaeIaGb6UIVWXzz2yZI=; b=D/W8K8lzVSN4cc4oUT4DxpL/nG
	zZHgUQvM0Sku2PNShRX/p+jRXa2MAlVfaUEj07j1ccrP0HshIVsHm909DP6gDGCG8jxCSOz5D0hMd
	46mRxMurvu0vmhrDlMro05IJ7DsAwtwV2r/jnzgWXkuUf21FKuxzym1+KGv6grkDrXR+u0QsWS5wg
	/i5kg9XEpCq6ID6loGO5rah3hui71K4Z10RiOMGGLipUvkRF82i80U6LsoFzbxzo+IH7Sgala1KaC
	92zAxbI9ZGQUI6rhId+4P3Syxnd7Dh6fKZNdO6+EIxphDvIIyWmra8gimqSiebPGfpHhS/wg6b/SA
	squ32kNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0Hm-0000000CnwB-2GMp;
	Fri, 25 Sep 2026 07:23:58 +0000
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0Hj-0000000Cnvp-2Y4l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:23:56 +0000
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-1450541ab18so663089c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 00:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790321033; x=1790925833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSELEHI//YEAphEyKZ5VJ4gtHaeIaGb6UIVWXzz2yZI=;
        b=XC6oFl+vQcrkk31D/KvkC+eL2C0D9nVB9fLBfdhR69FUkgyGMlOLp/xC6089RM9wm/
         41zQNhAF+7YqxDSeaDO06DUm8JW7TGkcJYiqNuQALEU+O6qiIxZWSYbYX/nBOUVfuVg0
         MCKyXAK3w0VEidw7qesRnJZJ2C/NqxzjRvzwyP71s+ml7yflJk9YA5KSE+X3Gmg7qGlL
         IDH52NODwqcCxdrVAQU7QS13tAl7Ildx/pYcfS2CuM97axMHiPGCILOsnweaJwRCg3U3
         uVvDY392uChl0cfAC2EjTrzipKgXYbEix+1ODSsMui0uSgnbeF60MR3jIVlR3s83Rkdk
         VY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321033; x=1790925833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSELEHI//YEAphEyKZ5VJ4gtHaeIaGb6UIVWXzz2yZI=;
        b=Deyg5pUFuCYpN5dYiG73yuloByDHOj/vzicTSZ7eE5BxktStHTJHf4j3u22soRDyqX
         8VxOy88hYK9fhojoGwKtEi7bN1TCxriA1BokPV4bScjFe/PN6J1UNeTs7dp1vLT/zCPl
         zYDOhdsLPw3X+vSCDbX24wXjCxE1fx4EXKOU2fBh1YZrEqZ8E8fQ+7JAKPQ9mdqgSRpP
         MD3ZUU5vSn453c318QHSAH7BszgGN/F25Qp3BWdAR3tfI4VeLfrFQjGz7l4FF4eSWzEc
         qEk3ErltKIKdaGc/5IUbnD35uVryItQWOXF+jPZy7w/XXpYbrKAUkBQFhq5aBaUJS+/p
         HcVg==
X-Forwarded-Encrypted: i=1; AKwUvBztZncjSiVWOJz+IPsV2jXaOngNfA7DBLRsI+14Aj2TsaLnw1znxnNOsMkhhmnZXOzW6JSrBX8CQWymqamWtOrk@lists.infradead.org
X-Gm-Message-State: AFuF++lC6sHj0kmUecyrFoBRBJ2I+5Df+Px1Y+MDUC8hJb26b9IuZXMw
	FWdXlGLbehfJXL4+p2uKHAr7gfR7RkADHh8GKwhv1WO+vK5SrkOtuNsN
X-Gm-Gg: AYBFou30EvySwPErYwBPHf+5nQB8cFCR5J4aIIvX8KscCEWxR+MLzDom443bEgbqhhz
	fYH0bmvluPL2OrvCZb01Vy1gRin81WM7fIfgSkXWsBTm23ORCAMgw6xog4Tct3OC1VSjgaoANy9
	cwgG9SK+ThTAot5S8b/FpDx0dJaPYTCOMhrCK1mB8Z4gacD9mwnPm+q3D3NY5zUYs85hC8I6f5n
	PXFlns7cQJPHDMy5jQMYZAk2mpYbQztMA43Wq7iTo9gZEejlN6m9HRjRjq8a3VsU+JB20LFBLfR
	Ubdal/BYFenVzt28vorVronJvpqJnQmWdy3Tx9ncUUW5AEp1Y1nfEJZ91QFa69jfR9SBg959zIb
	WsfnIvmqTL9MmyD6RzEUSKKvI3FzqeynQw5xngD6lK9njSc1Pxt7HA/WscP0koh8zPAlE4D1dy/
	KOdzZqnQFCTaCI0Q5hSORMf7KJhXVKBq0AR0pTng+rOkhQZ7WdoS8vvkjxsLVSMxLG8uGvVyhXd
	k/XEV7wYIcdMiJE
X-Received: by 2002:a05:701b:4243:20b0:13f:c85d:17bb with SMTP id a92af1059eb24-14503f8500dmr4207164c88.1.1790321032704;
        Fri, 25 Sep 2026 00:23:52 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm3656437c88.1.2026.09.25.00.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:23:52 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: ma35d1: fix unchecked IRQ error and IRQ-before-rtcdev ordering
Date: Fri, 25 Sep 2026 14:23:45 +0700
Message-Id: <20260925072345.2632042-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_002355_649790_849020D3 
X-CRM114-Status: GOOD (  15.23  )
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

platform_get_irq()'s return goes straight into devm_request_irq()'s
unsigned int param unchecked -- a negative -EPROBE_DEFER becomes a
huge positive number, so probe fails outright instead of deferring.

The IRQ is also requested before rtc->rtcdev is allocated. devm
teardown is LIFO, so unbind or a later probe failure frees rtcdev
before the IRQ, and an alarm firing in that window has
ma35d1_rtc_interrupt() touch freed memory.

Check irq_num for a negative return, and move the IRQ request to
right after devm_rtc_allocate_device() (its irqwork is already
initialized there) and before devm_rtc_register_device(), so unbind
unregisters the device before the IRQ is freed, not after.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260918161925.2639130-1-congnt264@gmail.com
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Sashiko found 2 issues on v1: dev_err_probe() on the irq_num check
  duplicated platform_get_irq()'s own internal error log, dropped;
  and requesting the IRQ right before devm_rtc_register_device() still
  left a window on unbind where the device is unregistered from
  userspace after the IRQ is already freed. Moved the request earlier,
  right after devm_rtc_allocate_device() (its irqwork is already
  initialized there), so unbind unregisters the device before freeing
  the IRQ, not after.

 drivers/rtc/rtc-ma35d1.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..ae68e5c89e15 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -236,11 +236,8 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc->irq_num = platform_get_irq(pdev, 0);
-
-	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
-			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+	if (rtc->irq_num < 0)
+		return rtc->irq_num;
 
 	platform_set_drvdata(pdev, rtc);
 
@@ -254,6 +251,11 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 
+	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
+			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc device\n");
-- 
2.25.1


