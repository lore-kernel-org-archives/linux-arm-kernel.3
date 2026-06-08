Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EA7CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pIqTdl36Y/WI7M7gGI5vXO46nocZuRjABb/SuQlLEJU=; b=CTwsLTXLULfadvkNKExNqWhqTh
	BE3/8N7u61FwHK9BfKAYJOOt8bgn/4t7lv1uFKa/jSO4KipCqnJi09XadNdTPhpXW7lNPMEyrXzT1
	jzDgeeFnHvmOqPAX9n5wfyEVhjM1TkUpJw94Dc1o4HuWUUhTTsjjcGbKKNX728Crpaerpi/C6UxBo
	Egi9pKwGaTV8MK5TPgi+/l4YsAMmNzx8P3bZgnBkOa5B0zemJDGZ2PbAiFlXtXEMgWkN8hHR7Ki/6
	NChz5TIGA67hSuvTzHfXME0ERO84zWsNpyeVbjXyLS7pwnkzKAOEcfElg7CLSvRBTK0/0tWQmNZGr
	KkZjxWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeaI-00000004Gc3-2lxb;
	Mon, 08 Jun 2026 18:20:26 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeaG-00000004Gbg-28j8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 18:20:25 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-91563382bcfso539518085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942823; x=1781547623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pIqTdl36Y/WI7M7gGI5vXO46nocZuRjABb/SuQlLEJU=;
        b=gzibzittGSPSOEBYHgu906MysnErbvl+p8HBKqLvp/f4jGbjRL/hZylnusOd2RD/TO
         iwvtZ7hn4VH15cIgnbzgGI+vv6p6rTk+Hc+nOKi28SDpm9r7O0jp3u9NgmUrlWb31oo+
         XVEzr663gkzi3H6ql02NYHAsRsp7JPmJbEZsZlmRxHD/b9RLw7USGeTWtTlNIX/jEj8q
         +joQ7gM81llej9m+f8UlMVPQG98MpQ/haZym83am6GZP8tjJ/2CbNcauljVVp5GCh+03
         ry9IDrqxaX5rWDrOgZVdyRpyxa8xq3dljVtbetHb1SPACvrtc/B1HzDh6TlWtz3NTVR+
         Ho7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942823; x=1781547623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIqTdl36Y/WI7M7gGI5vXO46nocZuRjABb/SuQlLEJU=;
        b=VIJWQ9jWRr4vRtrkMGIbM3RULMATwme30HvmwOV/b2IYPPHtJ9uJ6frw50pFWRMF6X
         Fsv86KafUsDWtjzATO5cF/5AoahaQjeOOFC3rVtiZTztbrNU6GuHIUP/valR3kuPpDq8
         1aymdbtuvEt63ZV23RbfV5M6CzBMPXj01LXRlAHP19M4dmAb3DMdYuupuctuC24eBf01
         qeG53bQlW60OBAdMFN4h+/dqmOePCLRHkOvf8p4hpmIqOzYsVwX7B5BCYGQCQ1SWnXAU
         S8xm561JwewhinMwbXbUPSS4fift97YT0viCDTPjGJdp4u4IoB+9hPGXQ6sP7fDdsLxc
         Hkbg==
X-Forwarded-Encrypted: i=1; AFNElJ96oLRZotpSn6YB/GvRzM5paEyvoZv/Epwf3qeW5T3ipSGVR93wbpf23KXXlYdbkziszWDc54TISePnmS5Eqhjo@lists.infradead.org
X-Gm-Message-State: AOJu0Yycc1qYriSDTCIheW4JsOJJRvagd5Bo9GL6QystRUVhDIrFIo84
	FgnBwCOlsy6I+iQwaSrRikAGCgRGXXeYeFmiPPDl5l9kvySwwcLpYftDMr1pH1ubc/8=
X-Gm-Gg: Acq92OHbJ1m2iKFgA+k7xokC0rgXhAmAKvoliBUre03FQ2J3kxYb17c+2pAHWEUqyWl
	lV6ktmw0Xem11tG/yFCGWhaeueLCVv3NXweRlhc5a6R1kZ124CC0blqSqFnIfVyf21bE8aisDe3
	gsyqfttwlmfekJ5y3ESDrh9dD92TRbNMS0Klu3Wjr+AeQYL4ZXsWENM8tTYesPyctnD1WcIBVHp
	O/daCe3f1ZQvFKKDbq0rx+uxz9P7MYQTmvAp2frv+xFZCyMZbRYk0aXrEpdjbDss8701h1raJbR
	nntbv5WQuZZudLF42IpNuZcKaE6mR/V+G1o3Te0uvb1OV5FlnE83hYhW+HgTh50fRr0UTBFlYQa
	xIaI+rLj7eAGIXhEdsnSrCwXHfOx3GFdx7RL2eiVa09T4Covui2sbxQX2RoFs5oj8ZomUEYj8sL
	H0fa559hQeVlwL9MD0nbMr5NRHxSRFkXXJ7uB0nXR9qqY5eOISlvo=
X-Received: by 2002:a05:620a:bcb:b0:915:9125:e649 with SMTP id af79cd13be357-915a9df2c0dmr2633482185a.44.1780942822814;
        Mon, 08 Jun 2026 11:20:22 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3c764asm1846350885a.37.2026.06.08.11.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:20:22 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] clocksource/drivers/timer-atmel-pit: Fix init failure cleanup
Date: Mon,  8 Jun 2026 14:20:15 -0400
Message-ID: <20260608182016.99715-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_112024_558817_C8BB043D 
X-CRM114-Status: GOOD (  13.70  )
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

After clk_prepare_enable(data->mck) succeeds, at91sam926x_pit_dt_init()
can still fail while parsing the IRQ, registering the clocksource, or
requesting the IRQ. These paths only free the driver data, leaving the
master clock enabled.

Unwind each initialized state on failure. Stop the PIT after it has been
started, dispose the IRQ mapping after it has been created, disable and
put the master clock, and unmap the registers before freeing the driver
data.

Fixes: 699e36e5b8e9 ("clocksource/drivers/timer-atmel-pit: Enable mck clock")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/clocksource/timer-atmel-pit.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-atmel-pit.c b/drivers/clocksource/timer-atmel-pit.c
index 888b06731e54..edd427ab93e6 100644
--- a/drivers/clocksource/timer-atmel-pit.c
+++ b/drivers/clocksource/timer-atmel-pit.c
@@ -12,7 +12,9 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -185,13 +187,13 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	if (IS_ERR(data->mck)) {
 		pr_err("Unable to get mck clk\n");
 		ret = PTR_ERR(data->mck);
-		goto exit;
+		goto exit_iounmap;
 	}
 
 	ret = clk_prepare_enable(data->mck);
 	if (ret) {
 		pr_err("Unable to enable mck\n");
-		goto exit;
+		goto exit_clk_put;
 	}
 
 	/* Get the interrupts property */
@@ -199,7 +201,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	if (!data->irq) {
 		pr_err("Unable to get IRQ from DT\n");
 		ret = -EINVAL;
-		goto exit;
+		goto exit_clk_disable;
 	}
 
 	/*
@@ -227,7 +229,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	ret = clocksource_register_hz(&data->clksrc, pit_rate);
 	if (ret) {
 		pr_err("Failed to register clocksource\n");
-		goto exit;
+		goto exit_pit_disable;
 	}
 
 	/* Set up irq handler */
@@ -237,7 +239,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	if (ret) {
 		pr_err("Unable to setup IRQ\n");
 		clocksource_unregister(&data->clksrc);
-		goto exit;
+		goto exit_pit_disable;
 	}
 
 	/* Set up and register clockevents */
@@ -256,6 +258,15 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 
 	return 0;
 
+exit_pit_disable:
+	pit_write(data->base, AT91_PIT_MR, 0);
+	irq_dispose_mapping(data->irq);
+exit_clk_disable:
+	clk_disable_unprepare(data->mck);
+exit_clk_put:
+	clk_put(data->mck);
+exit_iounmap:
+	iounmap(data->base);
 exit:
 	kfree(data);
 	return ret;
-- 
2.43.0


