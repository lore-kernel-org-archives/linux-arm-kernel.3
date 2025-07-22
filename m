Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403EC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=; b=oMB9UQNFYS6PrvgtmHq284Qc7M
	bonGuUaxZY6uzafroZb+VVdyVMveJt+bZkH+vtOntnXHzajTx7gLlROqIm93sNA4v48mB55jZAmq/
	19TUOa256/LWsi3ja+rEm4P+wQb2CqA1/FZlKmt414VUtOLpFT4WW6+5AOhmuObhi2Izsuy+xsZlc
	RKj0roS9wk9nSnBNu4DaBhnyox3IYPg/dYHgx78jXY6LiklrnoFqXRypfYrOk7oZx4pANfxlzaCzU
	abeMONWclwWlIMMJayNhqxmMDaZnRb2pFJcBuhs/cbIr2wiHGHhb8FzHwUGAADq5nSECJFdu7aLtC
	WYofjteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAen-00000002Cp8-3y5y;
	Tue, 22 Jul 2025 10:55:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAN5-00000002Aoz-3AZC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:37:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so9121300a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180638; x=1753785438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=iI6sPy4pkChylAEdS4fpSmZNHXUVbjbpfhiXuyyQEhfjbYCW5lY6LlFwJ+qjzV0SO3
         ZxTEDIZ1vKqmIjvmA91lZ2DGIY+WFNFs7sELsl1qe4adDIzXxZ8vMeJeK+gHKdxdEdwL
         CuLoHU+YxEcKqngzf2mYXUkE0RWShGLtzKOBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180638; x=1753785438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=GT1P/2Jv5+NAQk2DNfkw2cFnqLxm2uGa0ZdDjLWu3QzpTRBlrUmJe8C7Z9/TxptGAE
         AMY+Jrv4Xws+iiQpyN2+wB8K1RncpuJjl2nYCZAmjwpk+VMdezPV+ZTY3y9lO/Pggd5B
         6g7+cx/NQg8LDUiXJNARDTv81RwqjFougpKEQoFxKp6/zp29GpyX4O2UarLsGvP+cmLy
         OCqXrEWNYY7EeXRCOeCPeuJBlcrslpi2O1dM/dHSiZ9pvw1iVSrs3tMUhpzJA98sXrw5
         FNQohdDbqMKLZBeh7B4xV2HNjZ94DaWhN8KbzP+ko1RCrUrlPClUJsw/264KHMS0FOoi
         XuJw==
X-Forwarded-Encrypted: i=1; AJvYcCXQGcEbiLF3E9tOkhRVnEHfFjjKpZoM1ZProXD6psTMxd7a/vRV/mUkS19b/ZEqQMoUMHA1f+DD7yQtPetr+hEo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkd6Ftboy2mc6kI7aS80kONAaYBZC2E9XukIkVHYC2SldCCvT9
	4traNm85XKLBVEtpk01IKZzPt28m6hr95O4tlgAJPx24X4D8MNg1+QZWoaNNC+39xsI=
X-Gm-Gg: ASbGncukggqggMDGuBLxtCoLK4N8Ccbj5APQcqKTqdXVaHHmzeAOA8QRaU+WRFLOgGr
	/Q20dDCZ/9trSIHIytYb9Gb6ET6aHJNES+1Pk6RfH1mlPWLo5b8RrMWtIxQP1f665ohd3lRNK1K
	/ySBqrjRjXxFeby+1FEf0Vs+1GOKTkAhp7JIlIR4EZtATsP3XCHeMgQqEV9wivcyPc24l93kNk8
	iq05jnGGlhPeY+MCT7uDJAcg5aVzdHqU3z/d3y2AGjtY59vh047AiM7rVxgzaYnwcEJQ3qiI8eq
	ilJr9e4UYF0gB8uYF7ik1igo44XpuxCtii5Aau7CME8uH5TwZ9JuOCmdgb6r0hbfUobrFTQrH6i
	R2uSTD/P/jLDDDWFF1pehSOdpgjHI3WomDUCEnpbNQm9BRTtScnaaLEXEz0Q=
X-Google-Smtp-Source: AGHT+IF5XH+ULXAJm2Yd7fdwy7Og8oahMPwKCKBYQfiU9IiXyUwIgGfm5dtLgUZCNSYYUrIZy4YonA==
X-Received: by 2002:a17:907:cb81:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-ae9ce199db0mr2520430366b.53.1753180638060;
        Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:17 -0700 (PDT)
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
Subject: [PATCH 3/4] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Tue, 22 Jul 2025 12:36:17 +0200
Message-ID: <20250722103706.3440777-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_033719_794848_92FFA93B 
X-CRM114-Status: GOOD (  16.51  )
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


