Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14101CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5kHLteZtDYYZ0uPDSlKWBJ8+KtD0htFyv3V8YBKOEqE=; b=DvpWQqXzkXDTqOX55S8W5WcimN
	+n6TSXOsxaluB36rApCP5z84HiRAqj0yA5I3ALU7Ljs1BbboZB6369hDImLziMMrIjFPKhQjtzM0P
	fVSSKrSavmAH/QwTZWVX2CiqIjUnQHXX1sSOMq8Kx2tNN82FHA9SiTw66iBXg/rf7JfHEGkygLXyG
	DsNB3/ECS2Mz9EYaaydDeBzPXB+J0pweVXqvdh/HLB+6/Hct+mcxi/6sMXXD0chF4a5kUQLFo6vRB
	P/je6U4BHpr/if23ziRKh3cSNo3WNarv6KqPye8j1NJlX53z4e3QjoyPSndNPv/Qpu4dz9LpCZHtx
	kcRP1s4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5HA-0000000Gxql-2PKA;
	Mon, 18 May 2026 21:13:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5H8-0000000GxqH-27Bb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:13:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8383fb7143aso1214615b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779138802; x=1779743602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kHLteZtDYYZ0uPDSlKWBJ8+KtD0htFyv3V8YBKOEqE=;
        b=f7/gThXWOCxRanmZ4vxnT5lLxCeGuG31rqkRotRzFNL66cue80OAmk9jo749ozd1wE
         UsB+xXXQ1vWm4GzUYI7VWDwAtY5PqBSv+jM64fdeTbImNRNXc2IEpfue2Rb0S5vCTwBR
         BSHdUNB0DSqHs/uGq8Yj22bvT6LOHcepbmAWF5wzxo5VIgEAR3TCgIJp5sjkOLI5/7uN
         K8A1SiuwEPhhsVd/I6MPlgyzTUFUEGx1wmaMle6PPBAvvob/uct1P240rCfe/ACfJJQe
         XjWLTpQzKPD2ns2h+qUs7HKAusqFzYGqXjarTh3m8SjVVmSb5+CJfSbIZpBUO4RbMFw3
         Gyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779138802; x=1779743602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kHLteZtDYYZ0uPDSlKWBJ8+KtD0htFyv3V8YBKOEqE=;
        b=lyPj3EiEDSSN680zVmAWfJg7FSPGjV3J/nEI5FMGAYD5Ru7+W3qVKGVF6aXWbvejXt
         u5w/tSgMpdaFE3DCW4txRz9LXCHQTK6CvMKapkTMWjmF0mnD24k7pj5Y8E/JjU7HSMhv
         +EQ6+I11W/Me0wSh+0RZ4iw3YUl6GqcouH5ii/10Y/LYs75ItzBDEtmjNEfhvD7rQDoo
         8SGKQx7KIEYO+iJW2vjb5kp+vKVIqrIRGWtbwSVEDAxdI2vrs5/LboiXKlqSEhQtiKZV
         r9IR6Rxp/DontPihKB9E8UUp3bLovLyqPy0eChFs8ckcuA0rl0DOr4rYWuVzudmGf05m
         VNxw==
X-Forwarded-Encrypted: i=1; AFNElJ8cTt6XjbOAfG54PRFOCE7AZPPMXlBPJKIBtECiJCLscTZZNBYKWkxNAR1kzi10CarrDOcST2Yl3QMeBEUqJdrj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5WJRSprn3mEXeYWSaLt/2UjrBvwY5ayuMarGB48MPqFnwqpcj
	TGtaekrMKCpgSDKbS+Pa+c0n59a1uLSSMP8Uma7CUuCFBjUhAZ9HhJz1RTkKJ22T
X-Gm-Gg: Acq92OFyQkXQWYhBsL0Qq+h+sLwawPqmYK9TP0Kvk4yHq2yQJ0xqVOnprvBK6D8/RgW
	LXNX4DlZdoQ79fbwsC1mZrQGT/cnOvem3+l1Ng3tSm0e0dJhFtbW0UrawzDZZTQ+742OZihM9VB
	34TZf7h2dGIIH3kYFRwVP1H+zVznBqp5VyZBipthhxPQhSFmpOTACYybmBCXz4ZCf8U267kQi/g
	TybWJbFWM7qTfkftS+vnNkkKVjD1u+pX1+SLUw3Jn6YGWB9uiAp6h4fMWmnGD2v4E4VyorrHhqk
	7DDVNIVDoEWZXb8zj8aRjoAEh5Zs2nRlxFkTeUXCK6An3CY52Pp2yKkZJERdSGXoIinljDlFbbR
	ohvuY/LY9YXNNo2agag7lbwfzC5QJAQwpXQGRja5aWfBL3S++ZsYsEvqtCPK9Nmwp6YRToGQDU6
	ZDBnVUz+48ehAlu4hV5oTXVVnGVILAM+JfakUAUg07SEBwd/yYNjjNX0dah2be6XoTDUJk3bZcN
	KqKWOSBzqkGNGDR+TGHpx+9vbtEoipTmEWHZimg0cpVAQ==
X-Received: by 2002:a05:6a00:88e:b0:829:7e6d:cf22 with SMTP id d2e1a72fcca58-83f33dbe4famr15918075b3a.43.1779138801540;
        Mon, 18 May 2026 14:13:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196638d0sm18775306b3a.7.2026.05.18.14.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:13:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Helge Deller <deller@gmx.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE IMX / MXC FRAMEBUFFER DRIVER),
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] fbdev: imxfb: Use of_device_get_match_data()
Date: Mon, 18 May 2026 14:13:03 -0700
Message-ID: <20260518211303.10777-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_141322_547647_B6B7AAA2 
X-CRM114-Status: GOOD (  12.79  )
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

Use of_device_get_match_data() to fetch the platform ID entry directly
instead of open-coding an of_match_device() lookup. No NULL check is
needed as every compatible string has a corresponding data section.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/video/fbdev/imxfb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index a077bf346bdf..7a021da0a32a 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -30,7 +30,6 @@
 #include <linux/lcd.h>
 #include <linux/math64.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/bitfield.h>

 #include <linux/regulator/consumer.h>
@@ -880,7 +879,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	struct lcd_device *lcd;
 	struct fb_info *info;
 	struct imx_fb_videomode *m;
-	const struct of_device_id *of_id;
 	struct device_node *display_np;
 	int ret, i;
 	int bytes_per_pixel;
@@ -891,9 +889,7 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;

-	of_id = of_match_device(imxfb_of_dev_id, &pdev->dev);
-	if (of_id)
-		pdev->id_entry = of_id->data;
+	pdev->id_entry = of_device_get_match_data(&pdev->dev);

 	info = framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
 	if (!info)
--
2.54.0


