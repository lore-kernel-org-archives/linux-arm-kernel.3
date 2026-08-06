Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE6CC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lH746+3EH6GJkB1AUd/CBfAlFUqYof4+aDGbhsiXTss=; b=BG5bS9tfbTbrmGXUoNGJAG9Iu9
	g4sqekYzgJmUcrQhuxIgO9hv3oQhFgLcVcjUbcze/7EHb3vKephsU3UkDd54P2wZ/WKTp7bMe9kNg
	fD5bSl3DLorQ+yw0yj9pJ5ynBoU0vEQxAntNo1w/TyWZoMtdqiYuYeAHEkiwEkj3y+p3yZEnU+MdA
	GyMCDTdH+6ZPZBeeK8Lfhoeps+mEXPiNzxTLOR9jQxuIUXqALr/rNpmBFAVzLBjmM887AoiM9HV8x
	s1qjEBnX7GaRsmGDdQ+GBq5d/4YLixb39cBOpsfQauZnskzkXkD7g6v6v324IBlP3FRmFHrr4rPK/
	6STImK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrFQ-000000050Jk-2E1G;
	Thu, 06 Aug 2026 06:06:32 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrFN-000000050Ie-1jJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:06:30 +0000
Received: from LAPTOP-99KJFSET (unknown [36.153.54.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48fb94a29;
	Thu, 6 Aug 2026 14:06:26 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] watchdog: at91sam9_wdt: prevent timer rearm during teardown
Date: Thu,  6 Aug 2026 14:06:13 +0800
Message-ID: <20260806060613.1830-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fd5ae125b03a1kunm81202c9528934a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh4eVk8YT08aT0wdTkJDSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=D6tKMZ/oRYV2G1NYOwLpvE3T+j2R7Qtzp1nvD5pHnc7HDgxgFuyswcqldRrr+KtHwrxGtTNJ2GrTcofCAXXkuweoql8PjMrsGwMHBS/M900FAL4hIILzetGgg/7h4q2shc+nY5FDs7mtIHC48d2rYWN01rxX/xl2XH6Qj4buy48=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=lH746+3EH6GJkB1AUd/CBfAlFUqYof4+aDGbhsiXTss=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_230629_620880_90686E7C 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

at91_ping() rearms the watchdog timer from its callback. timer_delete()
neither waits for a running callback nor prevents it from rearming the
timer, so probe failure or driver removal can leave the timer accessing the
devm-allocated at91wdt after it has been freed.

Use timer_shutdown_sync() on both teardown paths. It waits for a running
callback and rejects any attempt by the callback to rearm the timer.

Fixes: 5161b31dc39a ("watchdog: at91sam9_wdt: better watchdog support")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/watchdog/at91sam9_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index aba66b8e9d03..80ba04df54ad 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -242,7 +242,7 @@ static int at91_wdt_init(struct platform_device *pdev, struct at91wdt *wdt)
 	return 0;
 
 out_stop_timer:
-	timer_delete(&wdt->timer);
+	timer_shutdown_sync(&wdt->timer);
 	return err;
 }
 
@@ -378,7 +378,7 @@ static void at91wdt_remove(struct platform_device *pdev)
 	watchdog_unregister_device(&wdt->wdd);
 
 	pr_warn("I quit now, hardware will probably reboot!\n");
-	timer_delete(&wdt->timer);
+	timer_shutdown_sync(&wdt->timer);
 }
 
 #if defined(CONFIG_OF)
-- 
2.50.1.windows.1


