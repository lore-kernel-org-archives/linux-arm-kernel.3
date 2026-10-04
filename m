Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82737CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qol00xKd0T0+apHbVQX4zHawmYMyVklpl08y4ubxCGE=; b=E9f7cv2cr+IwwFP5UsVKz7Z2XG
	Yh8RnQubr2Wsk+CXCcTjdd8TyjLzrPhXEOA2BvM8Pi/DMi/t6Ujy1QO/lwo4mF3R9lE45d/yZpgAi
	N0PhcdPtrLqUF2qKaUxsJewbgD3zusVDMHrZZFmcZGbXIxITohM5oHVzdxe1Ow4BUqeVpckdyIKSq
	lTec5VGpGQN1HqF62PnNEIXrIbC/stzpbrlre8N2Kl6jIvmnWlOW/06rVqxrFoPnhbMSNyYfLfqIp
	3n9QVwK7dY+xEVgerIaRL8DP6zLnIKOKYyx7vOwqdrV5MKhQuqnc/I/it+NlYjP1nyaKZsa8GRX0L
	w9Y2YQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUSa-0000000FPw9-1qnv;
	Sun, 04 Oct 2026 22:13:32 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUSY-0000000FPvm-1Sm6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:13:31 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-35118a5991dso608257eec.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791152009; x=1791756809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qol00xKd0T0+apHbVQX4zHawmYMyVklpl08y4ubxCGE=;
        b=jH42Z6jP27Zg8oQd7DabZ4ezoeOTdeaTJqwropWEU2/KkRndIp4DC8A28WsGPMGUsb
         Y+8r1FBy/4D2Xozpmv3D3PeuYVd04zTOB7MHjYrvHvwgX0jRrcm7h6EfDYV2NQgcbzTi
         +1Yjtp54xonazZTS8vapXP7ZF7CD2YNxaCpDqdDcRteYRpQiGi6nW8yjVgzQ6zFcnLLv
         NeNMkBTVMrPr8M2388gYpl9Vnq6Ei9s3N20nWujPFL/4ACINO66JgVwcZnJLUy+5W14d
         fFS43mhVFdH5hJN/jpCsKLCYcc1YaeqpwU5shGFLF75xMt50+WN21IqWQ6/FhlLDRjVz
         WmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791152009; x=1791756809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qol00xKd0T0+apHbVQX4zHawmYMyVklpl08y4ubxCGE=;
        b=TCzYD3OGBHqVq/Y4dE07/P44wPA5NhbioyOQtdEafJoTIooTXWwl7Et8uvmAVkh533
         y+ZGNa5Th2YCXDpf4LDxs7wQKjCifSFniWQYjGi8rvt/omdAHsSXbPf6p9dbHOhTMsgA
         nlisVhl9EznGNDzLLqzXyffoNBbhQzc6HnPXmHIXGspUyK/Xwxqqh9IxJXGFJsuC/6Mb
         akJjnJTCuAtfuGKGLV3iAUkamco5rrtYqSwnFGZvkQzNcQbvIPGRAEqm4ufDv9OofF/9
         qZoRDqYPA6sqH9XwTmVvmvuvidwUUImKUvBwc5lTZWsF9G6v/9Q7yx92SWRVnwIhxcnO
         /3Cg==
X-Forwarded-Encrypted: i=1; AKwUvBx3eS6YVktHlCLArsqPw9iXLQlwbe4z3R2+h/Tl8wf7thB+vk/J8vNWKe+0hAkCjIXeSXEo0isZixUSW14OO7ns@lists.infradead.org
X-Gm-Message-State: AFq9FYL2jcsf9noQ2AzcrnOfSn2qWXTiQDeuPdm0W+0PKrc/qfqwRkU/
	Zi0GYggfX0MQ2hi+skhicdd7pnwrEFtbiWR5YZYZtDfGB9wwK+UuZEZZ1YdlG+GP
X-Gm-Gg: AYBFou3rF4GKJdvzmzbpxnO3RgjJAuoQXa4ZE+cIHvldJW8iLqOsP2NTwlNAL2VpCtc
	MDchwXjCRxPWSyArJAKduFMwlWCtCxeDS29M/Fjf7JarNikq2W7IXpy4WlJBWZZS/BWLZcqkTj3
	hBeW9wLwt8qAxknMD4dE+nT/j5TJRHmK4vlWLX62MZArj3cvx1G6o/ejJZ0lsfyDw8GmR28tR0s
	3K9tRlOh/FRLKj6tIDCrkDL2Nde5K8v/vyymkI73lOoVaPACo2eXJxexpuFZgzUmVjEbwXkApps
	DatMlaj3zIL0Bf8EE6P23HEBnY4qqBKg+FuTIT6bkGwoMWDOr1AVtMbPwxuN9Tl658XgwrT6pA4
	Ul9R+c/qAkek42BfGjXcXlzyZANVKxh/l8TiVAD1+cWI7u8eRTpuYLl1m0u7rMhbnSbniB1VuBx
	Vq4MPUnq0FhEdXC8+24eqrriLyuJDH4a5zV3R8Ibx/lci65jNIfo1rXYdpRrMJFC5GuL4VHP2jZ
	24AoaM3dyulicFnJueEoSlBf0XV9lA8QC7v/O/YIONxtegJlhbt5Ax5KRf48/9+4f0noV5g07Xw
	y1glw7CkwQMDvtZMDU7QvOOJWyzG7n3q3ynaNXy0zmvxV/CO
X-Received: by 2002:a05:7301:782:b0:351:1e72:735d with SMTP id 5a478bee46e88-3511e7277b6mr5112361eec.19.1791152009426;
        Sun, 04 Oct 2026 15:13:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718a18esm8976988eec.17.2026.10.04.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:13:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Sun,  4 Oct 2026 15:13:27 -0700
Message-ID: <20261004221327.416323-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_151330_394951_F0D2FE0D 
X-CRM114-Status: GOOD (  16.36  )
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

Keep the alarm IRQ in a local, as it is only used in probe, and fail
probe on a platform_get_irq() error instead of passing it to
devm_request_irq(). Drop the open-coded error messages, as
devm_platform_ioremap_resource() and devm_request_irq() already
report failures.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix compilation.
 v2: add platform_get_irq error check
 drivers/rtc/rtc-stmp3xxx.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..9ddb4c0e39c5 100644
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
-			stmp3xxx_rtc_interrupt, 0, "RTC alarm", &pdev->dev);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot claim IRQ%d\n",
-			rtc_data->irq_alarm);
+	err = devm_request_irq(&pdev->dev, irq_alarm, stmp3xxx_rtc_interrupt,
+			       0, "RTC alarm", &pdev->dev);
+	if (err)
 		return err;
-	}
 
 	rtc_data->rtc->ops = &stmp3xxx_rtc_ops;
 	rtc_data->rtc->range_max = U32_MAX;
-- 
2.56.0


