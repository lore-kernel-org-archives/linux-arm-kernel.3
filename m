Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=; b=foMS8etFKKYjOxX76/97MmwgNJ
	FPHJWeYUMx8v6qwrmii97lc7Em8kqvc3EqPwZxn/LV5bl0j8t8woskyBBdC6ldKta5p4Zq1IhXJ5U
	KyBUkxJieQZhCn8tSX7M6oem5JYg16NJoUAtGHjjD3rKLeFBYi2wrA2j4Z168ZW0b7bRFYbuKZgTe
	fjAlW0dPqQGfR5ujwe/BZYd9+3Gkkk+/ppn5n+dkV+S+eAyRW0q+ez/S5y+PNlTQopxMTQrnwxCxE
	5ORspn9sYE0DP4rTCgw0v2RlynQewbaxEyAVoMecfIh6qHdToJY6O1McNWQi1w8zTSNPZ089HRhBn
	f1M//lCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgINo-000000099G1-3XET;
	Sun, 05 Jul 2026 08:39:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgINl-000000099Ew-49ih
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:39:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c83474ddso19075565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783240760; x=1783845560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=;
        b=Qd//klfs45itCgGpgS2iERAqvrO14d19G3Zgp6GGXPMbmNQYetA8KMM0iuvTW6L1bu
         y0ERZeWkdZl4frlFQle4JbqybJosepbo3pfhMAANM6JAt0NbpCYnGAFiMtXjWHYAD17A
         D6Ln0AhOVEudE2pUsLT/+9reCHDv8mqZBO+BPxScUYN06K/7Y/e2VOKH9AD+G3h5uz+u
         1zbfmV9TPRSiLGP1/yRW6xOD1VAZHiRTcnCeQBRowi/T8ButlotEgyP0UEXQ5yilh2dA
         f0KbzIeql8vbQZ2qpgeJXOTMQPNk9OJtlUKbi3s0iXNdhZO7v4NFhKQevIbOzy2Pr58l
         FUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240760; x=1783845560;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=;
        b=K6JRiIMbBh0NN+PdD+rUdQfcIep4YCsh4gXaVxnUx2gG0MARqTL6oYOTM8kyIgAXhP
         HWYwwWl5iaKt+XLr9xg/3VLy45G4OKI5MgFK28yXnd40wfuXU//OIoswyzluJBvS1G5+
         NQ6PjEVPTXEq2d4KJAq+9tNOrJAiZu3W78Ymmz+R18Ep8qjMtaHDb6lOUBQPGpsS8W9d
         oRzwhDiZHQAFt3RFDWCqgO7uxViwIs6F7L6GUeIOW0W92extZYQssZJ4/QY7PVztWwK7
         KqcDpEIRmty4NAeDDw+1b8US7tHUXLZxr2FEj8ZLY/tAMWKTdjIrQGVMxydguWEFZ4cr
         3W0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Aglbe2/7YIjcYMMql9ABO/D8oH3rV/ZPJps+dvFkTEiQ18Em0zSKyQ3vXCnVAirAdI0bvQtHpyQqMNOgw+T/5@lists.infradead.org
X-Gm-Message-State: AOJu0YyIKx3evSm8rjBNL3jOytNrYfnxK1hAWEUVO5jsz8O3oQOhAazk
	Xdsc7rTPnZZrnJPzW9/Px+KXg758y+xLkVx6zY9pJN0sbAX8AnBqvr4R+PmGT6B2iXM=
X-Gm-Gg: AfdE7cmjWO5zPrEEeznQhxCDa63hBtFEXETUcSqBsCdzovV63X9ywhal6jEo+vjiLLn
	7riJvppBoLRUuTtIYNJdAjgQSW0gt7G/LwlvESqN5y+ZEiPl28mP1CdH71PCV+y2ksJiL0gHNLK
	SqhA8Zqv4rj2X0T28JkRmI5ojhnPCDBQnhvALuO81K5iDqNjlW2NFdic8YxPP8HjXLA1UZhrDet
	RJf4wT22dNaEBGeaDu1sVscZkpReqOyNdEPzXQdpX9V8oTOlA00SyF/CnJ2wR6PTm85iyLL8yZb
	PGf9kqYR5a5Oqt/RobumQ0/NyBVgKZMLtcUEwwXxS0z0WMY37pDfy2na2hD8mBggjLB9hkH2QVA
	Ch5gtrg+TMRoBfzgQGyBI6yN/QT0l0Tyu3mvkGs5UniFKpnbwDYeYMyTZqQ7B+QHMUnMoooFy45
	V8hqxoLQCSXeJHTaeyfA==
X-Received: by 2002:a05:600c:4e11:b0:493:b549:3be0 with SMTP id 5b1f17b1804b1-493d11dd1d9mr66980765e9.17.1783240759206;
        Sun, 05 Jul 2026 01:39:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm258611905e9.1.2026.07.05.01.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:39:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lubomir Rintel <lkundrak@v3.sk>,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
Date: Sun,  5 Jul 2026 10:39:08 +0200
Message-ID: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xcO7pe3BTmwOdzui6/X6iJz8mN0Rp2hw3KbCd40pQDo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqShguPRcS1zwcItJ0B2kpRagpct3lTujC6gVxy YGvluRc5buJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakoYLgAKCRCPgPtYfRL+ ThdWB/9BzmNcPE8phy3T4E0fYQBt4FVzBOGD42JLah32QnkergVTmb+90x4tK7Ok6JGqgkImXxL Ib9yagywAKum0x1E4zsfA2wWhgU4UARE2m0caZDTD6IkiGLHRbk+mBTS/NOf4lybTWQGqkJqezO BUs563Y26XZb/fclva2hGk6i2cSdjvg8bXpWKoHV37tLMO5D5q18oWFq+Jxbwyj6LTntS2ENNOm Wy21tdilDqvLzrCWOFHT2VasjSEiI0GRcj/rMqYemLSf/f1IakmrGaPsi19B5KWM8euV9qn8P/N buKhv+7derzV/lsUKBsM/iXUXqYqXfYjm2eR+bPx5IPkk5Xd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_013922_338036_0B2C6765 
X-CRM114-Status: GOOD (  16.55  )
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

The SoCs that this driver actually works on all imply OF already. (ARM
selects USE_OF unless some archs are enabled that cannot be selected
together with ARCH_PXA or ARCH_MMP, ARM64 and RISCV select OF.)

With OF known to be enabled a few conditionals in the driver can be
simplified.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

while doing a treewide cleanup I wondered if these conditionals are
relevant at all. A bit of research found they are not. We will get over
losing compile coverage for COMPILE_TEST && !OF.

Best regards
Uwe

 drivers/pwm/Kconfig   |  2 +-
 drivers/pwm/pwm-pxa.c | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e8886a9b64d9..729776086879 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -569,7 +569,7 @@ config PWM_PCA9685
 config PWM_PXA
 	tristate "PXA PWM support"
 	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && OF
 	help
 	  Generic PWM framework driver for PXA.
 
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 156c0c74cd80..c4d73acfac49 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -136,7 +136,6 @@ static const struct pwm_ops pxa_pwm_ops = {
 	.apply = pxa_pwm_apply,
 };
 
-#ifdef CONFIG_OF
 /*
  * Device tree users must create one device instance for each PWM channel.
  * Hence we dispense with the HAS_SECONDARY_PWM and "tell" the original driver
@@ -151,9 +150,6 @@ static const struct of_device_id pwm_of_match[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pwm_of_match);
-#else
-#define pwm_of_match NULL
-#endif
 
 static int pwm_probe(struct platform_device *pdev)
 {
@@ -165,7 +161,7 @@ static int pwm_probe(struct platform_device *pdev)
 	struct reset_control *rst;
 	int ret = 0;
 
-	if (IS_ENABLED(CONFIG_OF) && id == NULL)
+	if (id == NULL)
 		id = of_device_get_match_data(dev);
 
 	if (id == NULL)
@@ -191,9 +187,7 @@ static int pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(rst);
 
 	chip->ops = &pxa_pwm_ops;
-
-	if (IS_ENABLED(CONFIG_OF))
-		chip->of_xlate = of_pwm_single_xlate;
+	chip->of_xlate = of_pwm_single_xlate;
 
 	pc->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->mmio_base))

base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
-- 
2.55.0.11.g153666a7d9bb


