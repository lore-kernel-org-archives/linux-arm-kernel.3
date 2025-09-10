Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2178CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=; b=WGgYeG1rnru8dqEOrh2KzTBg/C
	urbwgmOdCd+XJMIlxlVFYHX/LocpQQoj6WtHSS38eSNlU7DrpPeM/M8FNFhXNZzpVf9n3WunTcgVV
	K+SVZkSMUZXR94MRts5HmkKsAiF7Iy4zy9qk0VcL/K2hlC5L7ZqRvvz2VngElFyrVyfKOn514puPl
	NFWZKf2bMiDQ2NDywREnSnxCThNon1OgG6mMC6BeHczKUCmMJ3DkAhZixWc79IybrvQVXfB+mHwlN
	VdbM1UABtKWkVu/VHfJs/22ngBlV/UAkmynqd1Y6A0L6boTdZU2bPqqlpGTFUoCHmhzFVxqF8yTO6
	ztrZZ1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLMA-0000000EWy3-2ZLh;
	Wed, 10 Sep 2025 13:59:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLM4-0000000EWr7-31KM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:59:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0418f6fc27so1134523966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512763; x=1758117563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=mo6QLNGxcNPVVZEPUkymY9XOTX0o6Jl+HiXboEJDM/HPwxSd5NRs+w5Y9u844IG9Pq
         XpV0wXE/1q/Zlg+e8mSZ4Tn0tCvbqBHdDtYNqFzeHA+sm1WRNFJK7OwGalRyp3ys6ETQ
         mf43HiRRjDiWelTj4mFlNW7Iaze7EBdk9K3A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512763; x=1758117563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=vSQBoZ1/DjSMl9zIioIySBSVFa60mhtZZPMwOEuFkMyFd4YeToJWJacJramAIMTAHM
         GuWq3J+8MTALDeHUgYBLhT4zHiLmAXziGvDnA1FIVWPyhEuVJi8D9wxd+oVU/JXtwMau
         a2wHCFFqDowS3RqiuOf+4ZsUrKgNLypX1hA2lldrCHvDeAWJhwVibK0iyezTMhN3Keq/
         SZgRCrtBqLMARDg33JxqsRDlS89cBIM65ykVfF6BIUiD9XdXLb+eboVHhzB//s0fJthK
         iNlzpNSImXXedMO/04JBi4f0+XxcWj4FDjTwlcX6nQwjwAoiTJEhDC3+j4fBmXfRSUkl
         ePLA==
X-Forwarded-Encrypted: i=1; AJvYcCUIymM0JAM4hQHGRXQbEISaJV7Xd42gc+2ErCqlwDio747039XyrLHYciC9DLGUsUx1u9rBbQ9PyNi0n1Gic8xV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw62P4U5DdppGgMbG/HfZipr7if/C0xcVMrLM1MAb5V3pIselpw
	d+EitWkAUn0INKctS+1toKTpHhL92m2NgLHH3aA54Lq37Qz65kizWTDgijF+HUbu41E=
X-Gm-Gg: ASbGncsiDdKEmuRQbXToO+DnHR6FLS6pMWWKNmY53bWVlLEpT3f+RhdQjkyiF4WAzdy
	9sqp9a13IyiADfZu9NcGYXMArYrhPXuYMtqosIqGs3ADm3rUdPYxQ9SE7urQDVEaZhNf99LYAuf
	F/cgfK6qN/AGS9m5cC7EJz7RypfyhjpbEqMQxF5UwEUA0t8deLIBDl6YME6UiMf/OA1dJVtzuYR
	nRDAUZ3JUrNMotirO0ycYbv1Z3AQ9cGdi+nDyO3LqUvAXXYiQZsrrnqehkisMO7pbh4wqnlxh5l
	DR9IxnguEQUGQdnLcFVdQpeEXsNCmxcpYg9Zs4ymbxQ9oqcxBLz9FbiSJQE36xcigJTBu26LZts
	aHkxG5QmMNWII24eR9xrtSm+/P5VLUOo2nYEIpD7V1Xp2pq9aCSeorpZ8asFEQOQ45aqGKKMl0q
	Re1UDVpQp+GGk1Xy96rAFLF/bIE59Md9GAA9pSAQetBM58emW8Elif1AXU5Z7Yy3I8
X-Google-Smtp-Source: AGHT+IHdweJVzi0li6Hab/FnHQdGRXCIG6Nx0PPgMqfpJ3S+dtaqUO7p5/p1o4bXf82vFHRmV8q+6Q==
X-Received: by 2002:a17:907:1c25:b0:b04:5c90:8013 with SMTP id a640c23a62f3a-b04b173763amr1525363866b.45.1757512762970;
        Wed, 10 Sep 2025 06:59:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH 3/4] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Wed, 10 Sep 2025 15:58:37 +0200
Message-ID: <20250910135916.3939502-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065924_788004_ECD3EFE9 
X-CRM114-Status: GOOD (  15.95  )
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

Set the glitch threshold previously hardcoded in the driver. The change
is backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/imx6ul_tsc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index c2c6e50efc54..a6066643bd48 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -7,6 +7,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/slab.h>
@@ -74,7 +75,8 @@
 #define MEASURE_INT_EN		0x1
 #define MEASURE_SIG_EN		0x1
 #define VALID_SIG_EN		(0x1 << 8)
-#define DE_GLITCH_2		(0x2 << 29)
+#define DE_GLITCH_MASK		GENMASK(30, 29)
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		(0x1 << 12)
 #define TSC_DISABLE		(0x1 << 16)
 #define DETECT_MODE		0x2
@@ -92,6 +94,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -188,13 +191,15 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 {
 	u32 basic_setting = 0;
+	u32 debug_mode2;
 	u32 start;
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
+	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
 	writel(MEASURE_INT_EN, tsc->tsc_regs + REG_TSC_INT_EN);
@@ -501,6 +506,17 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "fsl,glitch-threshold", &tsc->de_glitch);
+	if (err)
+		tsc->de_glitch = DE_GLITCH_DEF;
+
+	if (tsc->de_glitch > FIELD_MAX(DE_GLITCH_MASK)) {
+		dev_err(&pdev->dev,
+			"fsl,glitch-threshold (%u) must be less or equal to %lu\n",
+			tsc->de_glitch, FIELD_MAX(DE_GLITCH_MASK));
+		return -EINVAL;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


