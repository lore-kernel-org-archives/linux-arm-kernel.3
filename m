Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1FAC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WLq+7wmGJnDVqRzy/9WiaGXniOfQxglk1F1iJbCO8zQ=; b=kmfdCSKpOQo9gZbB88I2NSNAqK
	OPcooX5Add/bIMBQY8oxwn7UFLj0zRtDOWqmt19GJXSmffqoqMRCqqvDl2oN5NFStl8Sal8usllIC
	4Rwpuvn0hN3TG4mFIvppYFmvAyHV17KYessHIf+k2zxsf1ybbdOKb91h/nMhS0AIwbHJzhnzRZcRb
	xv7K+9RIw4GYD77x94GdHMB/2burplmMLpW+isaEZiZ0d0mHg8c9C/N6mEp4hcX95hkZMHdFLHYqy
	/8hzI39p4ANS1gLju70CKmySVwRgvK3ItdY/8ugszKT5yufYjbY01OKyvluxH0raf87QGpCm3A9hi
	LiX+Blmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpD8A-0000000955w-33Yg;
	Wed, 29 Jul 2026 22:52:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpD88-0000000955X-1XuM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:52:05 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38101f85591so149602a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785365523; x=1785970323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLq+7wmGJnDVqRzy/9WiaGXniOfQxglk1F1iJbCO8zQ=;
        b=M+yW8ClqKjdlZcEi4wFyFw/YUsvraf/OtWv7AJlivA53QNTWOQ+fPW/u5X/GEmwHrg
         M8zrYzoj3nE/bQWuqshZonVtEX4l6FWUr805vbTm69hXzYqenrf1gMuhw42FX7NY43tE
         985MkW9rfMZSBNjxxaNcDlfnvByYrJAfkbLmhy+2TeegMfAl/iCqEHYiuBCgMnnXHr39
         Xm7ighnpdpNjwzkF8FRQo9DjaOuTmcm0R8y9cN3F/qVK6AhCtJVwJ35UJccdyhLxRKyk
         yL6Cjfzw9x0LpchoWN9F3arwlIsW8Cm+qvTODoL3n4/uD2oZSc6c/LUgPVooOqJr+ZBr
         4Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785365523; x=1785970323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLq+7wmGJnDVqRzy/9WiaGXniOfQxglk1F1iJbCO8zQ=;
        b=JKI/oUfLP5CTe4p5e4akirbDdX0xtgOkb/j9XAy34MDyM50RSLyt7TE7wMF/SPUS4B
         HKIy/dektaLnuWqfnClAqCK8saRkWmmY20tJ880AmOsPphFB/k/TbVSsO0YgHL2hkvM3
         2nu57KktG0o8q+RQ+EOwAkFoVFGiGxNI177O47PHElPKerT0WmZxDJiY1hRHoBNwD5Is
         56mw2fJ4yXpurmVHuy2KTGq7TqeferXi5RD2s3MPYPBggNK6YIrbzV9BrgleNQig0PPy
         mqq+MIoQoQ96JqFXKNeLr19bdto6M+ZTQCyDWmjUICxhhC6chWiGfasWUdx6/nIDHDbM
         4f5A==
X-Forwarded-Encrypted: i=1; AHgh+RqQ4R0ENlunGMpFQdK93nFQ+0va3RgmBn8wy0LnqFTGP3J8qPG3K9kQJtRNPn3AxSpIB8Tv5ow8fVUbu+t3HRCf@lists.infradead.org
X-Gm-Message-State: AOJu0YyGCYIvxl2xXi2DX40mrhh7B4t9rLSLBU7tet83DLK7QuQNWdxP
	lKbJXCtv7i1/TPVUlD3JNvKs6lR+XyR02D1f36GbMs8xa+S6MCdiH/IHkxWXi3DI
X-Gm-Gg: AR+sD11S9E59RGcUcEdRxjFdLnPhhUbDX4TQ/We1p54oMwT429Xo9A9O/0D6JzzClz3
	ZumCySZz2H0OH/TvvnXOa5Z2ncpAv07nMvIcnWWuKpvKAEsbJFLVSsk+WHTm7q+RUZoWycfg3Zj
	zNCSWJ0mCHryUhCa+J/ZTj7+wNTW5oh3gyo8O9xzR4CmuDtx/RzQTNDkIv/mCLzfYItk5l5kLds
	l+w/BYBlTURHcjtJNkH6A2F6HD5UfCVXhKLfw8qUnYAPNxKzRD/+T6ZahDJKw70s3VIo7J60yxF
	/Q6QhQZTuYZPW+NIjkj/u7Em6Z3Mrwz2cG3PYJstwklZRJaFnnNNp6/G20U+k5ikTG1Ng8zSKf9
	y27FZPk/uq7KyL+qjMe4wG+xD70EJOFLUVkCcYE9L4w7PqIsky/gl4gsaXPnmxEUge799wCA0sZ
	HgGIIO0SBFyItugB+3aOLb+5ua8NaNveg55hdXyZRt711JLVIymIElyndGiiamgsT5u2DUzvnVQ
	raVWw4Ooh9siBlcerNZjd4r2oIQ8sXzHaOU1ySU223ko2Ah/4tfECG8X6VsV14d9D+nfC5adtfK
	l8fYyzzyT/qCwk+kX6pyGL7dTumYoF0FWFXk7A==
X-Received: by 2002:a17:90b:39a6:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38f9bb8b861mr157860a91.19.1785365523272;
        Wed, 29 Jul 2026 15:52:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b770e3esm58567a91.0.2026.07.29.15.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:52:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Wed, 29 Jul 2026 15:51:59 -0700
Message-ID: <20260729225159.775183-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_155204_436626_17353EB5 
X-CRM114-Status: GOOD (  15.62  )
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

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with a single devm_platform_ioremap_resource() call, which folds
the resource lookup and mapping into one step and returns an ERR_PTR on
failure, checked with IS_ERR() and propagated via PTR_ERR().

Move the mapping ahead of the devm_kzalloc() so that an error or deferred
probe is handled before the rtc_data allocation, avoiding needless work.

The fsl,stmp3xxx-rtc nodes in imx23.dtsi (reg = <0x8005c000 0x2000>) and
imx28.dtsi (reg = <0x80056000 0x2000>) each provide a single
non-overlapping IORESOURCE_MEM window, so the region reservation now
performed by devm_platform_ioremap_resource() introduces no conflict.

Remove irq_alarm from private struct. It's only used in _probe. Also add
check for platform_get_irq() errors.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add missing variable in probe
 v2: add platform_get_irq error check
 drivers/rtc/rtc-stmp3xxx.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..a8ca681b574f 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -56,7 +56,6 @@
 struct stmp3xxx_rtc_data {
 	struct rtc_device *rtc;
 	void __iomem *io;
-	int irq_alarm;
 };
 
 #if IS_ENABLED(CONFIG_STMP3XXX_RTC_WATCHDOG)
@@ -245,29 +244,26 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
+	int irq_alarm;
 	int err;
 
+	irq_alarm = platform_get_irq(pdev, 0);
+	if (irq_alarm < 0)
+		return irq_alarm;
+
+	io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io))
+		return PTR_ERR(io);
+
 	rtc_data = devm_kzalloc(&pdev->dev, sizeof(*rtc_data), GFP_KERNEL);
 	if (!rtc_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resource\n");
-		return -ENXIO;
-	}
-
-	rtc_data->io = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!rtc_data->io) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		return -EIO;
-	}
-
-	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
+	rtc_data->io = io;
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
 	if (!(rtc_stat & STMP3XXX_RTC_STAT_RTC_PRESENT)) {
@@ -354,13 +350,10 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc_data->rtc))
 		return PTR_ERR(rtc_data->rtc);
 
-	err = devm_request_irq(&pdev->dev, rtc_data->irq_alarm,
+	err = devm_request_irq(&pdev->dev, irq_alarm,
 			stmp3xxx_rtc_interrupt, 0, "RTC alarm", &pdev->dev);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot claim IRQ%d\n",
-			rtc_data->irq_alarm);
+	if (err)
 		return err;
-	}
 
 	rtc_data->rtc->ops = &stmp3xxx_rtc_ops;
 	rtc_data->rtc->range_max = U32_MAX;
-- 
2.55.0


