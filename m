Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8E2C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vx3gTnF+9ahlm0p7+sai6tkLNM+xCZ1j9YbAf2oUVc=; b=jmCx6UmLey13VduPaccBa4hRqz
	mrYrxJDcZBUOwcCCkpP95AsmNVYtq/bqrw1jIseqPxSEit1bO2QkoMWv5IMw19t/L1ltH3/4yQdH+
	L23MQS3B9RsDMxCj+ery078nmApiUQ0mM7NXBWTUW7Wx5HGnh4ivAE+jFVz2a648L+YnBPoj506oE
	iH9Po+n/wL42wqjuyoKyi7+OBINtE95XuoIba5sbYenlUhCrzVw3z6YlIINBAfQa+OkowkIYX1kGn
	h0Bac29JwdIbSUlztHrCsG83QqmAUuKdOVFg5fnuJ7elnCX+4JNiUDkhJionT2QToMttjihVNtXuE
	445w4xOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJmy-0000000CQGr-0i1V;
	Tue, 06 May 2025 15:00:56 +0000
Received: from mail.flokli.de ([2a01:4f8:1c1e:e12f::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGzG-0000000Bpln-04WX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:01:27 +0000
From: Florian Klink <flokli@flokli.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flokli.de; s=mail;
	t=1746532878; bh=7vx3gTnF+9ahlm0p7+sai6tkLNM+xCZ1j9YbAf2oUVc=;
	h=From:To:Cc:Subject:Date;
	b=EzH712X94uyLi8KHDF4HR75ZtlptuAaX+mEtBNxAHklGWYZ0wL6/rBtFARGqD+4sQ
	 oLbFeAYhfhKmcbjFZlvkHlhGiDtyM5LiZ++TQ+R/bN0pg58TByCwo+2uWzY0w+pVED
	 ph3JdA0vt+7ZiirIxIQ2W50CybkxknmpV5qcnF44=
To: Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Klink <flokli@flokli.de>
Subject: [PATCH] watchdog: apple: set max_hw_heartbeat_ms instead of max_timeout
Date: Tue,  6 May 2025 15:01:11 +0300
Message-ID: <20250506120111.5041-1-flokli@flokli.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_050126_278591_A652686F 
X-CRM114-Status: UNSURE (   9.79  )
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

The hardware only supports timeouts slightly below 3mins, but by using
max_hw_heartbeat_ms we can let the kernel take care of supporting larger
timeouts than that requested from userspace.

Signed-off-by: Florian Klink <flokli@flokli.de>
---
 drivers/watchdog/apple_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 95d9e37df41c..6088a7554312 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -177,7 +177,7 @@ static int apple_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.ops = &apple_wdt_ops;
 	wdt->wdd.info = &apple_wdt_info;
-	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
+	wdt->wdd.max_hw_heartbeat_ms = U32_MAX / wdt->clk_rate * 1000;
 	wdt->wdd.timeout = APPLE_WDT_TIMEOUT_DEFAULT;
 
 	wdt_ctrl = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CTRL);
-- 
2.49.0


