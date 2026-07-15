Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3336C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 02:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=; b=i7LFBAYmErxwcCspiQUMBPZQZF
	r92iwq/LWcbMVp7rdfTyd8Co9tWSNMwBIhbhPxZanpw7lg+ILNEG49Pu7zNku6/CnosmWiX1jcfdo
	BIHh9deZPieQo474f4vihwaUDa/T0fT5Tr8HWHUE/rkYufFK/K+j5+KTfl69cpNUEhS7yfu3vLl0u
	ySqBodsLn8klnrpqgkifuOY/ixEGnymBFmav3PswTEOcf7mLHTtHM7j0f5H69pG183+lPBAbjnVZo
	3E22+fu2j4CEuTfY6NcF/17IhtzuE3VruOGrzgehllFtfhPj0TlqrPCEsH7j8EqHSHng2XViojuDW
	Ft2fzEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpDn-0000000DcIA-2fTK;
	Wed, 15 Jul 2026 02:19:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpDl-0000000DcHd-0XhK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 02:19:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cae1a3a744so36312255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784081976; x=1784686776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
        b=kCXW6D0Hpo2OxtDpGc2sDaI9SwBtMGcR8geJaza4esSdXRYaDOS+LnYuw+vqYQbxFz
         FXG3NQdEXRzdD32QZfxwYkR6XlOl/2LDT3rVKxBk7haraPcjiKdEaHVntwr1BvfIQ821
         EOHWc9t2qUAJ4sCqaj/+Z0txvPvf0hIHBglWinR52PT+gnnIjO5eO2uXEUZGN7CDYYxH
         DY6N0hXeR2W6/BUbGFkgTgpCeKiynnB9FSJgar0PQ1tonqlbzxZnMeDQ1le+J3XTOxro
         DwLAOyA+KH2sV7bjZe0mJ6zE1JatuSGLSL6770kRnDqsiizwCDMUt38slTGmsNpALiWI
         l6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784081976; x=1784686776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
        b=mL3P9R9dXgQ23bQO8h5ODoZtBlb/iQBPNl6a44LRpukNGW+WNsRoCqeScGzU1srjCT
         D8tRsz+/WPYtiyS8gQdS5cDGdQjrKooc4WmTqwHaHYv2NK9y3qsegD7uP4PlnRpLrcEV
         x/wBeBFpQNiwgNuRihO6vrCtMF8M0zS5z20Zhw/6LFKb5cPHh3s2pE6pQyINW+G6L5GX
         W2RtIwph2db6CJXe2Bkgiu2SYF0rxTs6XmogbVFkcm+trflHNjfkUmF5VncUVLTRpP8l
         gyzjOCN9ZoAzdWQhrr5qorDKcDydfRBbiPmBOaGqwB24KOjlzvqTF/VAJdhM2b7ec7kQ
         I7SQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIUzZtldwTXRmioOWAZ4JuDBLNAHEUyYZ7YSkBnER6j4zx3g9RGIvWcy0ovgRZwcrbKJw9Csh5WxcPw5F413F8@lists.infradead.org
X-Gm-Message-State: AOJu0YzmMvwk+WmYiFDJcW2OPQtZewYK55PFj6f3FQTO4QUyG/zje8GQ
	HyJO9UexoysQzzjNCaeElz4Xcs9He9m0Jn88UxIrXRSPHkGUHMYLLMo5
X-Gm-Gg: AfdE7cmhPpmFXaDPATq8hF/7fCIFrOgmeHC2Mld2/Zsf64fP14qi14DKeQ7T2hoIpNJ
	Ur2NQ+cP1ZVPLoie46TQIx+AkGzvw0qjRNKKZlOWz2lHUuAnfjwkVwbRwzIz4/A3dUXQHaeMHN3
	2c0vD5kVHaMSSOaXrVkvtEOZrIX4dAgc50INQUqLPnzUdv+7tA4KhXIIx42o5kSjp9LwLCci/Ql
	Ti8WrnyVmJl9wqvkJD6JpH3uEgYFLtXivTEmfi3rTVOeD+MjSbf9qmqx4YU5tgv8d02gZYvrawt
	Uutg/ss4d182CZLa9AKzdG8X88gj5JMHMwXzLLGJbtpCPuM6srrdPA3Tkq0bKIC2PPZ9Uzy9ry0
	SzXeA5GxkwiI0ohh6F38CDVmcZ0WQzEgWrC1N05rmfCxVy+KL78Aq45FVa9zODTXRgbZnIJgsdZ
	RjbPVEkP1v1Nj3y1ecJ4MTyupgDLGooAYxQO4fPNlz4h7l/XZGaskdmaAXy+kmvUFXgNQ2wgqrN
	/VoDVWv4lnOFlyxJjKXuQKNJVhBj5lYL27bu0ukvDRbwymugtweCGGXWmkuikIvbQ==
X-Received: by 2002:a05:6a20:3d92:b0:3c0:9c1a:893e with SMTP id adf61e73a8af0-3c34d8c599fmr6957139637.70.1784081976192;
        Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca7f626fb78sm8653754a12.13.2026.07.14.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:19:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Tue, 14 Jul 2026 19:19:33 -0700
Message-ID: <20260715021933.1551663-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_191937_284400_69D65383 
X-CRM114-Status: GOOD (  12.92  )
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

Built for ARM (mxs_defconfig + CONFIG_RTC_DRV_STMP) with LLVM=1;
drivers/rtc/rtc-stmp3xxx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-stmp3xxx.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..05f128ccf827 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -245,28 +245,21 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
 	int err;
 
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
+	rtc_data->io = io;
 	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
-- 
2.55.0


