Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E929BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=; b=TSg+ilaxPmNwKWqxS5AMVC4U4z
	Jsr0mdUy4vGOGhEoScSR89OkHvvjNqUtI6hOe69oWbU/AQ5McF9Q6GYAhzM0QpqQbVMeNGPYp9o6u
	dzzHGeVuFfnyDnsHQlfd0v//Rm3V0nXwjSFYi4kNQXoBG/eimlpRAdb03ghYoikRZM2Si0KEtVs74
	J8+VyrXlsKA93B4rY5ZKwmKNmaDHh0izdoexf3gTtykanogMfmHiteEAOCycmvvXyGMtcEMgJ7Noa
	Ax1wJ8ZDNA0fUxLmdIqFFW/J5TxJOXmaVEw45s1XX/RuSnodbDDMnXQKpB+ebjWWLDPq0JMlgz256
	DhgEfMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxSB-00000006zDs-2fgk;
	Wed, 29 Jul 2026 06:07:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxS7-00000006zBK-2Mql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:07:41 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-845c92bc464so534429b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 23:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305259; x=1785910059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=;
        b=eIGwkbuszwmN4JFR+OWzBB95hyzG7omxwDIUSmNtCUZ6K6aabcoWV+w1sIYydgKSgv
         Y9hczIJZyj/DPS3U/FUKHkC0DJz/8xgX9wrtXF6f94wcGBKYBeeIQdieolxIjFMQn7O4
         uMCMBt7rBO4PUV33KPJ0w3oLp9xXJOcQgzy9SpRlcMkoxS+J2PisnJXFOOUgnYQ6zOYc
         KsK3OwvN6yluLhlcVfwYzUJ1MJCwfM64QrYNVwYbBbKh1Cb687+rc7PGFqK/1VVgpNDU
         FW5NGilzelqHC5ysD0Jak4JY4nj7Jy2OM9M5UOXPgsRgR0sGMOzWBeMmIByW28UxMEIR
         lvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305259; x=1785910059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=;
        b=hN5zLj/0WoG79j4Ut9IpB4nBKlbx+1xKwx66pr/T96in5rYsnMqKXkOSAOhtMrbZzR
         VZde7RNlYXx/RKtmuEFt+jFrtVYpS5P27K2EmgsgPAXpUnfnyRs2JASVrTGrGzJnSDaI
         cNCwUe4ZiVYdxD/a3hX7dMK1VwHftVA0M/OyvarX5y2D73rlMG7mmWRoos0cTWucl5gO
         x/6LeiSKxmG0R3ySqTEDylXPbcH0DYGj/fg/i2KrP9z/XsuaFroVW3SJ5x1DDo5xLXdn
         rMdAkrdgKwfjIBp2vU7L0cZ0KwrEGXMjndjXaD0zukHokB6CzrFKXu15Y0z6N2KD/6ZN
         gJlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/iUWG+SevF57zBB3EVUVnuv3hFK7GUguBl+Sba0pA7jIHjCKnnjyeh+PpgBmIYu4ZuLbe9uq22noSa1lcD59L@lists.infradead.org
X-Gm-Message-State: AOJu0YzDR8L/4RisD6aFtTgMpMUt+seqIebd0IjCMbXt8wfOoTHGCtMn
	iyle5VM1PQC+4zN+kQjOAuFSL3j9+evPVk34RAIELbthfUyw4v6J/kzE
X-Gm-Gg: AR+sD12/62IyZnBMs4zVSqT2dwp14vJVBvhXnFOCB8qRw0ruPDRitON97cYnWt8eDkN
	nrZZQcVnQX8Nj+/iGGn61KWuAULguSmXKclctR5q2xVjsyqdPGFHjLi8cQwOP5K+ZW8ELnl/ZmN
	kLjfyl1waLbfyFUgH/wX5IDbIn3wFmgpYJvAkqUslvcVn+BHs0FbgvLLaA6atFlGj0IDsqvRmm6
	zQJ32ADvSGFRbZO5hdcsNkfyqBs9f41G0uyG42pRoV2S5Za0JDPEqRr97V9DYPTfZqKrIB/S9Fd
	Yni34wHhEHEaQkPLGp+r3BPeXB3KAhiKMSaKWF87ohR9lOJwuQdtAz6NSN6vnIzkU8UMAgiE83j
	AGt3qdoukfEO/3OiTjXHO73of1q6Lx9Kfg2Gpc151G06qrNrAkz0Kv5rDngnXDVrj6dEV4Th85s
	xwerL3Yp6BdRRgLp90MSx22GV7oaVD7efDpkSxKGg4HzJMVCoFhgt5/q2uPvi7196L9f4qBYu8f
	yLXp0sjzqBfuaqY43nCMQ4opyOaLFJumREiikZBKx2gWtFEw5g=
X-Received: by 2002:a05:6a00:399a:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e932ca215mr5555635b3a.65.1785305258751;
        Tue, 28 Jul 2026 23:07:38 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:07:38 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 2/2] media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS
Date: Wed, 29 Jul 2026 06:04:40 +0000
Message-ID: <20260729060440.2092-3-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729060440.2092-1-tharitt97@gmail.com>
References: <20260729060440.2092-1-tharitt97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_230740_418820_567DC100 
X-CRM114-Status: GOOD (  15.31  )
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

The runtime suspend and resume callbacks are currently guarded by
CONFIG_PM. Removing the guard directly would leave the callbacks unused
when CONFIG_PM is disabled.

Define the PM operations with DEFINE_RUNTIME_DEV_PM_OPS() and use
pm_ptr() when assigning them to the platform driver. This keeps the PM
callbacks available when needed while avoiding unused-function warnings
for CONFIG_PM=n builds.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index d6fcd4f7f9da..35302cf9f233 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1284,7 +1284,6 @@ static void hantro_remove(struct platform_device *pdev)
 	pm_runtime_disable(vpu->dev);
 }
 
-#ifdef CONFIG_PM
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
@@ -1314,13 +1313,9 @@ static int hantro_runtime_suspend(struct device *dev)
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops hantro_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(hantro_pm_ops, hantro_runtime_suspend,
+				hantro_runtime_resume, NULL);
 
 static struct platform_driver hantro_driver = {
 	.probe = hantro_probe,
@@ -1328,7 +1323,7 @@ static struct platform_driver hantro_driver = {
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = of_hantro_match,
-		   .pm = &hantro_pm_ops,
+		   .pm = pm_ptr(&hantro_pm_ops),
 	},
 };
 module_platform_driver(hantro_driver);
-- 
2.47.3


