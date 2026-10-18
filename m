Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77C2CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 03:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=; b=4cN8/GJvRIthL6zHqiiUkJRk8t
	3NlWmGqB8jOVXp15EC/PgpnwSiSJ1onEpyGi5kfANyUnDU4QVbhlf0ydpyuX08jJBRTWhokd3GQDx
	NbFukAaAoDC5+weqJQBisl0psocwAKhfBremofScoxcsHHearhZ89lyWAb3dc6kS7/n8nvwqLJvEd
	MBJcYN+iP5CRXpRLC+RwHGFRIqTPN5R2FUqbzG9Fk1l4Gms7WhfBofLpWDsHkk8xjOFhKNfzPLAVu
	JcRwBGeXIXav/CJAlagDISkOlXAvNQvyNm9U6dEDn1OgGq813BiFkj8npPLuEnsGAwpUQpaV2nBmi
	B13aAUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIHpN-00000005UUk-1pOQ;
	Sun, 18 Oct 2026 03:44:53 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIHpK-00000005UTy-0Ve1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 03:44:52 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-9178d514951so9296546d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295088; x=1792899888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=;
        b=Rtxmi3kZbeQ9+MF3MEMdSHeoJvblJb2U78Sn8N/dImf4TKcMpm4Pvs78mcW77XOUhw
         Y/hRiNyP8m4vXLLnkBSbRW9TJt7RBo9NdyZv5M0Ab/je1HQry0ZXkbaMkiDHIYsSgZBT
         2gVQhZWkgJZMjD7D28qqgx4Il3jwaEwESrF1BtOweLrFV+FjhpfHmcfnRpKsePcsmxAN
         jnZrej24UoRkc1l7UojQ5UIo1B2l6E2u+Ngk770D+5/ZoV0Xm+R96QPfC+LS13tKog3H
         ED/oYZdGBKs+oKpQtUnTHcW7po879r2oeZldrmPn7Un6P1ROqZzKW/rEPPOYEocsbAUc
         uETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295088; x=1792899888;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T5pPwZ/48zpt+uZ5MPec+XhKwRcnWB3U80AGWU6HU3U=;
        b=qJLmBrNSXbbf9x06MZwmRRX4D/lQFOwC0ApzFp7cXb5x1tAMeC9Gul0YHx6HpZBHMO
         fmLwCmOHRNdkyQ6A+Od16KQYGGBP8c07En4u46ZMf0J3t+AF5FDlosVMsgEjyYLVVudx
         //HmestaG3u1FIvWehhNXTSqkBSiMrXRAdPPiqQew0O5fN50sXd0faAdD2BzZJcUWyqp
         1PipYwYndOwHAMDJFCbHIh/i65nS0zjIu02pwExOJVrpHIwcuJj1xJbN94G9Mi+wkGcy
         n82ycYRdxAv3ALVMMRZVl3kSr90kHjcg7S6ZxXJIQMR6+Yk7tu/ETfUwK6aa5g7I6xPN
         p7GA==
X-Gm-Message-State: AFq9FYIhbyWWSM3AMVjrJ2tIIi5xMKEqk3TaP3iaiQnimFEVG4IsAcMI
	dv/r+26BAKKU5yegE8Sdx/3MC+1em90UTgSJnOPN5YVzugcoPQKydRQ=
X-Gm-Gg: AYBFou1ifeFqSqLAGoqGGnWv5byyDPTlN853wN42drVb8gkF9DnjS9mdP9agKztVuh3
	CSU/3qTdewFQgIC/Q19aJ5lQD6wzmdgvHd7YpKX00Gc+iMcSeXpfkL2xGkH14TJ7BJ4zKGNrdii
	JImEa6JhWE0R2yKVbNxJ936OU8yZazGOWkuGj0zmM8rMlPMASphcXCZ2FLVXXuZs4w3gdWT6TZ8
	eLUE4mxFYY5jHuL6M+rAQqbdq5NjpdLPScjVJTrFZQEWwHlcL8eRGDi/qmk8N0AEEZIUhA7GBcK
	fyiUKq/q9bZsCniimgRMWc5D3fom+rLq1tRnQcZ6a2S6sgWlCchstvkSHvNphOdxhtbm+HZRmp6
	dx5pxsshzklkbfLt8ghqAp7aSzZ37PF6AdSiN5Rj2j35RiUyYBjMquhiERS+mUClLnnXQOUXxLN
	mvBKjyz2mq38ruVJ70y2aa8FPdJB8CIGQ6TMgTA/DU/psVdUjKMo72pOLjJE1z9WkL86zMTATxr
	4BWYh2j+Phf2Kw8UfzH5HubyriTHy/m4CtI/EkcXMMa+GmkMiKJp3HPLzxjvn4dZXzdNgl/BdG8
	hc0UyYwHnScaLMxh8Uu+tBm+yXLq
X-Received: by 2002:a05:6214:2f89:b0:912:588d:55e8 with SMTP id 6a1803df08f44-91bdf0aa995mr67665616d6.9.1792295088031;
        Sat, 17 Oct 2026 20:44:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bea60e66esm22559866d6.26.2026.10.17.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:44:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] rtc: mt7622: allocate the RTC before requesting its IRQ
Date: Sat, 17 Oct 2026 23:44:43 -0400
Message-ID: <179229507333.3965554.17726204422948048488.rtc-mt7622-irq-init-order@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_204450_457031_8AF58226 
X-CRM114-Status: GOOD (  13.34  )
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

The alarm handler passes hw->rtc to rtc_update_irq(). Currently, the
managed IRQ is requested before the RTC is allocated. On detach, devres
unregisters the RTC and drops its allocation reference before freeing the
IRQ. If no other references remain, the RTC can be freed while the alarm
handler is still registered or running.

Allocate the RTC before requesting the IRQ, and initialize the hardware
and RTC operations before installing the handler. Register the RTC last,
once these dependencies are ready. Managed cleanup then unregisters the
RTC, frees the IRQ and waits for running handlers, and finally drops the
RTC allocation reference. The final irqwork cancellation therefore runs
after the IRQ producer has stopped.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: ba5d018135ef ("rtc: mediatek: add driver for RTC on MT7622 SoC")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 9e17dd09d567..c86c8cf3f2d7 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -324,11 +324,20 @@
 	if (ret)
 		return ret;
 
+	hw->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(hw->rtc)) {
+		ret = PTR_ERR(hw->rtc);
+		goto err;
+	}
+
 	hw->irq = platform_get_irq(pdev, 0);
 	if (hw->irq < 0) {
 		ret = hw->irq;
 		goto err;
 	}
+
+	mtk_rtc_hw_init(hw);
+	hw->rtc->ops = &mtk_rtc_ops;
 
 	ret = devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), hw);
@@ -337,14 +346,10 @@
 		goto err;
 	}
 
-	mtk_rtc_hw_init(hw);
-
 	device_init_wakeup(&pdev->dev, true);
 
-	hw->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					   &mtk_rtc_ops, THIS_MODULE);
-	if (IS_ERR(hw->rtc)) {
-		ret = PTR_ERR(hw->rtc);
+	ret = devm_rtc_register_device(hw->rtc);
+	if (ret) {
 		dev_err(&pdev->dev, "Unable to register device\n");
 		goto err;
 	}

