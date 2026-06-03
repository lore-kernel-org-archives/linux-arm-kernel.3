Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACDCCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 00:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wuWxtoLkojb3/QNJMxn6zgx0PCcWwdg04dV9N02CDM4=; b=KQa7oyclcO71LgY24fRsLmTVze
	e6NkkynhZSHuKjIyMV8/sYGLg4I7UFVGuqDnKV3cXAx3ZdE1C7H32n7uuxa/wq4E19LOBeI/24WgZ
	RNjm2UqA9IWdUXnarfOztAa3nXapEQlUetGalAxvSInIoGOSZOvnSOcM5RPMKqpNtQPULXVi7u4E2
	fVKOTiMD+P9/U2QiBgvWFiGQMvqb4AYsC/OgZ3e4YGp073xkZllAfeb3xaHWMfBgc6iT2HnzmQjuZ
	9azB/yJ1Led0dhoU7MsjT7jwkAp1dYXoA3WyS5cVC2FGT7HgI4mXh3X5kS8DlTgkx7VB3X+sIFXkY
	Mtf12rnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZsN-0000000E0Yu-3cds;
	Wed, 03 Jun 2026 00:54:31 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZsL-0000000E0YZ-21K5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 00:54:30 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8cce87d7995so58965416d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 17:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780448068; x=1781052868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuWxtoLkojb3/QNJMxn6zgx0PCcWwdg04dV9N02CDM4=;
        b=H891AM/mqnct/CBbzQXfJbsg2Oeqc5CwKsSHTbxMBSThB7jLf4cyhuvYQZk3977+7g
         HOKNwiopIO2cVn8cCeBLp82Nj3OJtqL1Nkutf2dJ6dU4PK6kwhsQh13tLSIYomOwv2Lh
         IpAzsjT+Wrvt189oLMM4G7quOVFQm1M+aVMQumQQYmOVWClKuwndPhWtiGszg2Fh+i5t
         kOMWul+Wkj4tVjrcIb7MxFQRSsd4rMeed+gpIihnc5RHiqlnDi/TLEy+pVmhJxZuJNbF
         E6St21A7+qIahf05lLMIE6bQU61jfuzbAMZd95+Jl36bx0LEUX23INwzxy0XDoLN0bXY
         un1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448068; x=1781052868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuWxtoLkojb3/QNJMxn6zgx0PCcWwdg04dV9N02CDM4=;
        b=jJlmKnQRJNCqM7wuviqnpBdvIlPceyMbVY/qlR9GR+hh4chMuKJJFQeCJooeCUkAcX
         reoMMA8WQFvLhIeRofkMKBosGRbL/DxLvpZRlyy6dP2gUQDaMeSfsgTm3yxnjz8x6pYu
         +tkK9pSEAzNPhd3hZJCI14pPgjIBiLG9LT+pqT1nBhj+VoB/PchMY6BMy2GB+SnnQv5+
         cAe9/vGpd4p8Et7nr1SIg0BTdKiDiqK+9bLkwpDXO066uaQi3NtHByqq1kDDjShWmO+B
         dKxCfaIuS7Kqba8PFD8rvijkMxk3OYA5zscGrgDZMQ0rPFm0rcYmmKqpcHiKhl83+E7O
         0y+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/YrFvSZ11n6oMYRSQXFY5ACC9fsL0en0+RrmQKM379WLigcdsz1Tx+DvRWO1BWuaONeGgg81AnUFQCUyg0LCaT@lists.infradead.org
X-Gm-Message-State: AOJu0YzsZEYaPJdWxMjUsdaUik5gRNlCWLEaw7vZ/AflVNLb/rD/sORs
	5oossO9fmxVjFeS5OT1vyJoHo7eujzPfn/ak1K4Oqgv3l7LHbue4Y/LCM5zDaq1X
X-Gm-Gg: Acq92OHjgFO7va/1D95qeEjo/TFY6BjOQuzFAWwHNYb0A8QLh8A+AtBynLbQTXQP3to
	WOZ2coEFrvqFEAdr9aBy4uFHppNzoXb93MLl8dIHWE4ZMapc6ki7JkdtLbB/yRjDEA61PlxlO2j
	u3IWfrrxDI+y/VHbPhMtEaBd/65efAEhTKcPR/ScIJeA/C1wma+auZMccJM1PpWxU/xiyFOWmOE
	3nEDT+cKmwXFYfy1cT6QQGiCIxX3LHOQPEqnzLSardlGug6MbQ3nHVxMMS5SCUvxjvXR/PlAcvi
	UTuLsA6/NVG3b9yDZSIZEWvFLDMoxuQkPS/Ys1YarDh2Cr5QGPntSzPwDHBNJaV3gY5c4OyeQjQ
	QauKd+CHJ+Vt6jIVVRBt9I098SlqjMPZ3TjmxNy+f6Iej7QDBA4rIEkwaITw0YhWXW6sbUeyANB
	MFT8tKmCtPjL1Rho6/yC31XzeEIIGz5EWKLUU3+UYEvUyi57AvbRPwzAN9IBWuFV+OKeEuxH6lp
	emseWpo55piHosVcuz9jmAHtU0fJ+oxM5WFwRvLp4ISLQ==
X-Received: by 2002:a05:622a:313:b0:516:df62:bde3 with SMTP id d75a77b69052e-51778793493mr21392041cf.54.1780448068201;
        Tue, 02 Jun 2026 17:54:28 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775e25c5dsm11828721cf.30.2026.06.02.17.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:54:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] watchdog: sama5d4_wdt: use platform_get_irq()
Date: Tue,  2 Jun 2026 17:54:09 -0700
Message-ID: <20260603005409.226774-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_175429_525820_AFA067BC 
X-CRM114-Status: GOOD (  12.67  )
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

irq_of_parse_and_map() requires irq_dispose_mapping() on failure. Don't
bother with it as platform_get_irq doesn't need it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/sama5d4_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 704b786cc2ec..d62031b02348 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -280,8 +280,8 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->need_irq) {
-		irq = irq_of_parse_and_map(dev->of_node, 0);
-		if (!irq) {
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0) {
 			dev_warn(dev, "failed to get IRQ from DT\n");
 			wdt->need_irq = false;
 		}
-- 
2.54.0


