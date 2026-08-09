Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA31AC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ti0lq77YCohFOsswk+8chbqQ3hHI0aVo1aBVQ+5rD4g=; b=On/wckKLz5Hq3oCp6fU6dFhVJq
	B4qa8sVCsIfwO+huRzKPfR+5rqQ8VFGivgBASSu3vDPoybDPBGL/NHZ8+S3PHKts9fQz9nFKDitTa
	/rNXNgY7wWjyq5slMccSfp5pZ/spMNBKJ3pigOYOMO24J/Jm7uz+hGvhscc6Ijd3DY/aItxVpPPo8
	fMQJWzZKFu7pfVRMrWwTVINzNawOhGIDBvNGA8jxgk1a/sOsCwDO3vA5N258HuHZZkvwAztYyKqHT
	Pmikz/JVdTfREkL6ugVCwz1/Au3KZWnGgGXyXesediNb3OuoMwLFrOjvRw0lX87zGcZubvAlp8h2j
	Q64F6VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4RM-0000000ANki-07om;
	Sun, 09 Aug 2026 14:23:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4RL-0000000ANkY-1Rv3
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 09 Aug 2026 14:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ti0lq77YCohFOsswk+8chbqQ3hHI0aVo1aBVQ+5rD4g=; b=boOdieTaDYtXVVMN+7P8DRoa8T
	ypz4WMK+FuqMIPOi+fRqt8g27n1+Lmy94dY7QPuMipS+eiKn+PCD1bhOPezXZIZWYt8t9xYSikKml
	lLmLwdebt5AfMCT1jdgySxwRJSRla1LClJRFLAgxBjHzMY7d5IpFwdv5yT+jL6+NG+rf133rXcnWS
	ab5qQ/u91PqjJGZ2ccFN2sJ7CK7rABhyANi4QdMuVJmNBFOL/I+bnmkh//on9xcK7HmCSiDe02r1v
	7YJ2VkhpYA5DE18LSe4tCQoLhk5S2aGeehK8mZwgv3C0y0PtDr5GF00TeUtrJ9aBJn45BEwd1msA9
	Y8Hkjjnw==;
Received: from smtp-70.smtpout.orange.fr ([80.12.242.70] helo=smtp.smtpout.orange.fr)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4RH-0000000972D-1Q0a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 14:23:49 +0000
Received: from device-101.home ([10.65.86.57])
	by smtp.orange.fr with ESMTP
	id t3ttwTSatstT5t3ttwQhwa; Sun, 09 Aug 2026 15:49:17 +0200
Received: from device-101.home ([IPv6:2a01:cb10:785:b00:6128:9b8c:c203:905])
	by smtp.orange.fr with ESMTPSA
	id t3tnw3cg2k6xLt3towWMXk; Sun, 09 Aug 2026 15:49:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1786283356;
	bh=Ti0lq77YCohFOsswk+8chbqQ3hHI0aVo1aBVQ+5rD4g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YC2cf7QGJq+3QVFiUplisQRBrKIdQqwENIlZon9xvxdAtupuci/Eo++/UnyNgETMk
	 WtnSRImatXz1TyNjUFVkmVZmGPAhZK5mZe/6BfX4iXWsj/q3Lbqo7GnjLKGGOGP6/l
	 DQBdWOiV8N+UVNzIDgvpiTMzj/Qau1lWDrauMlkq9iMw0oQYp12JetM9J3Mcw0Z9TE
	 UaZMQrK1Yd258CBFJB7QfhuWmcQAdIeUFUN0AIr0mO25116LNUZv3DvJpCArkMX6y+
	 61rAaYFD0FdssPss2AOBeK48AH20F5JTWBRq/RlEIoy5VZTukU0Mi5z+rKyW4YPR0y
	 R63hEvOJ2iLbg==
X-ME-Helo: device-101.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2026 15:49:16 +0200
X-ME-IP: 2a01:cb10:785:b00:6128:9b8c:c203:905
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: apple: Constify some structures
Date: Sun,  9 Aug 2026 15:49:10 +0200
Message-ID: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_152347_552875_D7FC104D 
X-CRM114-Status: GOOD (  15.57  )
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

'struct watchdog_ops' and 'struct watchdog_info' are not modified in this
driver.

Constifying these structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   7319	   1768	      0	   9087	   237f	drivers/watchdog/apple_wdt.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   7543	   1544	      0	   9087	   237f	drivers/watchdog/apple_wdt.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/watchdog/apple_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 6b9b0f9b05ce..f533953294f6 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -139,7 +139,7 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	return 0;
 }
 
-static struct watchdog_ops apple_wdt_ops = {
+static const struct watchdog_ops apple_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = apple_wdt_start,
 	.stop = apple_wdt_stop,
@@ -149,7 +149,7 @@ static struct watchdog_ops apple_wdt_ops = {
 	.restart = apple_wdt_restart,
 };
 
-static struct watchdog_info apple_wdt_info = {
+static const struct watchdog_info apple_wdt_info = {
 	.identity = "Apple SoC Watchdog",
 	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
 };
-- 
2.55.0


