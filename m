Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31E4C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ktlsXiTJhVtBSggz7bxl/DGCv7GATcsYZYs5ILJUTc0=; b=LKb/1+EOuH7idA2iNdMJCzXB90
	4QfdH7dXhoBjqlUwHyKNVK/kViF3XHRzq8KWzV4wpXIGDMR27W5uzt5BC0PLX5M1qW4Q/QtnFS86f
	u9/Ct4FsUwfaqOeTmuShEb8VDorznlrvva8eMvhmTKnMT1qEQJqcG5O1k9GJ0ZWWRNecU8iazM7v2
	MI37cXFzPCvKHV4f8QFwHVgayq7KVPB/fNJ95I+PZl/MW+6Y2vSHq+ac7JNhtWNZT20URwyZUwgrN
	peBS6OnoyPXKMimtMhG+Tp+SPb2f5x6V7SVkw6A4nQd5XDusKzjWphOgQdZm4rBzOeFwKUEqfSXof
	Kx+chz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCN0l-0000000D6El-0pJ2;
	Tue, 06 May 2025 18:27:23 +0000
Received: from mail.flokli.de ([2a01:4f8:1c1e:e12f::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJFx-0000000CJkN-0lkw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:26:50 +0000
From: Florian Klink <flokli@flokli.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flokli.de; s=mail;
	t=1746541606; bh=ktlsXiTJhVtBSggz7bxl/DGCv7GATcsYZYs5ILJUTc0=;
	h=From:To:Cc:Subject:Date;
	b=SgZW+BsaRRR0lW9vW0eib8Qfo1CzRTqEMsXkb9hIHYZpIiRzwVA9A31lN7Cp7/XYX
	 iTrKt92aryMr/R7bfUQsHx085T3mIddCpXOKnkwRs76fWwBfhgibFdM7mcvGFS+TeH
	 8x7vLV6JGywUhUYvako7kddNhikY2WkAZTZ63clM=
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
Subject: [PATCH v2] watchdog: apple: set max_hw_heartbeat_ms instead of max_timeout
Date: Tue,  6 May 2025 17:26:22 +0300
Message-ID: <20250506142621.11428-2-flokli@flokli.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072649_549998_B6F31322 
X-CRM114-Status: GOOD (  11.17  )
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

Switching to max_hw_heartbeat_ms also means our set_timeout function now
needs to configure the hardware to the minimum of either the requested
timeout (in seconds) or the maximum supported by the user (in seconds).

Signed-off-by: Florian Klink <flokli@flokli.de>
---
Changes in v2:
- Use the minimum of wdd->max_hw_heartbeat_ms / 1000 and
  userspace-requested timeout as documented in watchdog-kernel-api.rst
- Link to v1: https://lore.kernel.org/asahi/20250506120111.5041-1-flokli@flokli.de/
---
 drivers/watchdog/apple_wdt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 95d9e37df41c..66a158f67a71 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -95,9 +95,12 @@ static int apple_wdt_ping(struct watchdog_device *wdd)
 static int apple_wdt_set_timeout(struct watchdog_device *wdd, unsigned int s)
 {
 	struct apple_wdt *wdt = to_apple_wdt(wdd);
+	u32 actual;
 
 	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	writel_relaxed(wdt->clk_rate * s, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
+
+	actual = min(s, wdd->max_hw_heartbeat_ms / 1000);
+	writel_relaxed(wdt->clk_rate * actual, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
 
 	wdd->timeout = s;
 
@@ -177,7 +180,7 @@ static int apple_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.ops = &apple_wdt_ops;
 	wdt->wdd.info = &apple_wdt_info;
-	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
+	wdt->wdd.max_hw_heartbeat_ms = U32_MAX / wdt->clk_rate * 1000;
 	wdt->wdd.timeout = APPLE_WDT_TIMEOUT_DEFAULT;
 
 	wdt_ctrl = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CTRL);
-- 
2.49.0


