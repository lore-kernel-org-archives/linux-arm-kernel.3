Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484FACD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOjBZkHBZjwgFY+2gRIf62N1RuUWDhpPmFlrCLR4zCo=; b=yEXA2mZDKO1y328fu5I7f4ZNeb
	2TrmJL+cIfUV0WGyQ6I4O086k6+aDJehyV3JOWDPnnf4eAvHFBapTUCxz08ZiC0zRXQDCVCAXiWVK
	QEgwQPzzxfp1JapFqhlp2jYTmioMoamP+bISSQEBQmAyezF9xAjAmC1TEFKwzK6BN3AZvqoAaCarV
	33TfWJu5R1kkPogGcwCHQE0AaruygaPIW52Wom3jScJZtV4OG7F6yriq4w+IFh82bvPcwYETxRt/0
	1LkK4n8oDuZGOZz5p0inzat8ZXim1d6eRaSUt70aaXC9ky/fEONh1J5QhVhfsY+imT6PhFLaMtJT6
	A2zCCowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIJ-00000004L3r-2R0u;
	Mon, 08 Jun 2026 20:09:59 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIF-00000004L1z-2Xvm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:09:56 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7e8ec43e5f9so63822427b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949394; x=1781554194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOjBZkHBZjwgFY+2gRIf62N1RuUWDhpPmFlrCLR4zCo=;
        b=begu/l3apfxSXYpr3IgkmuDGubjxS8f97y7f01oU1+fx3ujrcA9GTiiztHPTRQk78I
         x+gi8BTZ1ik3y4DcaufhfkJaQZ3sdd8/uoufWLT39DZVeaA9VOWvROWFAUAt7gRF90GM
         QQ4YZ3YyiANAysvWZ0UglEhl4Y/6WCfSCg30Kfrbme5fqjT8GxqLIugLbjbSnzPCX8vM
         TfYEXhHQCQU/uqADnMucKm2zrBtrzsIv3YXy7MyYk88B7ygOPhp5MGX6tL2X+kdDfUdk
         3CvLDHwPkmV0iHw07ezyDIgcrabGkYlk/2gKV1NQIFCG9VawBG3Y4+KMSoWhnRF33Aou
         1alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949394; x=1781554194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qOjBZkHBZjwgFY+2gRIf62N1RuUWDhpPmFlrCLR4zCo=;
        b=kQ6PyiMqCTaR4uCxZtMH+6ADQV/m/Q+S/WFi5DbQsUOylDEGFBHodQ5TopagA3vaxI
         ijZj4SoElmJzYRTjqXk5sZnfYyngZRfKEWzRgJDXj11Bz4NeKDHv4MTbVfsc83omHhUv
         t6IrxmKyLZEoazR087vaawVosWRo8Y6C6YAe67//TbJcnTwovyXu05v7oj6IudTeJ2Gp
         hea8rLRfaHgYI7PoOURURbjl97gwGdM0gN9Cpd6pf3TQ47MEUS0aDTyPSNI7e1sVIwHS
         r40INr5wxQnolUpL5LSFobmoqXEoaxSKiPDv6nQr9F+Kr8cS2TUNKICOUSamUpE4Zw80
         WUeg==
X-Forwarded-Encrypted: i=1; AFNElJ/BIsebVB/bkLEN5KS6x8BAGuShNcYJhrAPw0xm5ok5EBz2DkKDK1QJSSXQLCckXH+dvT3Pe5R9pvjvAImd0lEk@lists.infradead.org
X-Gm-Message-State: AOJu0YxY2+cak2PC5uyR5JUA87+TdmJgLH1HlCSUkRumoSeTBdFu7Vyg
	ftXAYjfdMXu/stqrgEpyi+79rHuWmyR1sOBIOM1aUUIbExmCrB3EeTqq
X-Gm-Gg: Acq92OF6tRrfVQCjSbgTOcdlyBe90WtoTObtAl2uBrhpm6c6IhqlnEb53cNr53Wkmbn
	+wlwVXNEFjzeBSDyjTDX+4aiPiN8JCtDgXevmeaOKfsOpgvFph9T9ZYP5c6YcmCiXpmslMyu4B5
	R2fhZ9NAM+gxj3z3JpOi2BJOfsRFQiNWctjDqQuntqX3NuhUu7MTXNUw+Jo1d/+Lcq/F0OXz9EF
	syWVaI98IuVT6x034DTZyftOiB3Bd0QoC+HQ8OEOlR1MX8LRkVbf01xr/HTN20idQFdZ+zSaSoA
	uaKDouK2UT9JO1SRB2qAR2xBs15ooX7iYE5Lh10K708MWtEAh3BSpuNs2ZAVXHCgyr0c0NjKarB
	Fo4BS4l4GnTgJeqk6H36rv1JzkOURIyzfpgNc4H0rEk9GgbVFIoifUX5jCc8XYuCQ2bt0PC4D+i
	WyQ+bvslnBdfIdKWWqEC4j3uIBjAZ9Hp/vJPxB5iYMcvFA1yEDC3BJ6u6/XlALlJFT5Akb5i+ue
	2DlQ9wRb17w9pk6erYwO05/X20jJYegWuyl9xvijMY+LA==
X-Received: by 2002:a05:690c:46c3:b0:7bd:93b0:bd25 with SMTP id 00721157ae682-7ed0adbb639mr169428527b3.4.1780949394561;
        Mon, 08 Jun 2026 13:09:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea986bsm88688987b3.9.2026.06.08.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:09:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/3] watchdog: sama5d4: use platform_get_irq_optional()
Date: Mon,  8 Jun 2026 13:09:32 -0700
Message-ID: <20260608200933.18669-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608200933.18669-1-rosenp@gmail.com>
References: <20260608200933.18669-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_130955_648973_C4A6372E 
X-CRM114-Status: GOOD (  13.78  )
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
bother with it as platform_get_irq_optional() doesn't need it.

Also handle EPROBE_DEFER.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/sama5d4_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index f74f1e8956b5..2536e2f2ab32 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/watchdog.h>
@@ -245,7 +244,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	struct watchdog_device *wdd;
 	struct sama5d4_wdt *wdt;
 	void __iomem *regs;
-	u32 irq = 0;
+	int irq = 0;
 	u32 reg;
 	int ret;
 
@@ -281,8 +280,11 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->need_irq) {
-		irq = irq_of_parse_and_map(dev->of_node, 0);
-		if (!irq) {
+		irq = platform_get_irq_optional(pdev, 0);
+		if (irq == -EPROBE_DEFER)
+			return irq;
+
+		if (irq < 0) {
 			dev_warn(dev, "failed to get IRQ from DT\n");
 			wdt->need_irq = false;
 		}
-- 
2.54.0


