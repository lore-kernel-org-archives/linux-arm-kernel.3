Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7154C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZqy2KiailBWbxdwbEZpw+HvFPOjzz7WcrT6wURhw9c=; b=pl0QNxjTdrX52DVVFnG46vG80s
	0Z5ng37DmOC8mCyc6K9vV36Q62XLFf8GC+3NKQq3xtz9OswMzfpz0x0RuM9fdCLIWJuC/Wt/IquK/
	ccMbQ/p3hRSQ6PKMaD0ddiPIyBkFJpH2ya8fCMfXcZY6WPNBy0n7L56LcBk8QvU8P0XhiUQPqnQJU
	FHv5YFa5AQTfV/ZUXbyOThxSMASIPOheAo1ngfg079JHY+j1EG7sVOreXb8p0gNjW5MJkS1YgxUQq
	hISYs3bRFREr5AVPkfRqERKMVyvL0/cZcoXjF8x5b7h4gzpOqGX4iX1QfUwla8mOc7rfOJRpzugpI
	epjCh5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2G-0000000ExRY-3Zkc;
	Thu, 23 Jul 2026 19:24:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2D-0000000ExQi-2661
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:24:47 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5742F8005E;
	Thu, 23 Jul 2026 21:24:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkwcVC02_uHg; Thu, 23 Jul 2026 21:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784834667; bh=Kx/SqQ5YypakUXn6zd5yZDIz4kpBBehlvhVjWn5tQFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lYt8B6Ec8aCKgHoeIAWI5TNzhPf7xhbGeO1SuXw3/brsqt7GjpBKlviQGv4IzTLOv
	 5iB+qRE719Msg0JRxLIFA8Ad7h71dSJnUIB+ucopXoxJBDZfLopkg+/rr8L+LGrf4l
	 h7kpa5AjgAw7jmgUOKGwj02GfXibxIWFx6i/sVhRP/b5XHAnl/NZZORFlRWS/7sUKB
	 4a/Dn1dnhaRcU3TmdHkls9hBjWSV2ORJyk8+CQM8SQ+QkTwXFcZn8nRHI9egBW1yjb
	 0dZlR8J1yX3DJuqQUbZsl6sOGC+wVF8PafN2uFiUMzH24ztlZQ3OJr+39aV057YtUR
	 OZQc6EWW77pjw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Jul 2026 00:54:03 +0530
Subject: [PATCH 1/5] Input: zinitix - check all available fingers for every
 touch event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-zinitix-modes-v1-1-f6df7d86a878@disroot.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_122445_999564_6A5EBA4A 
X-CRM114-Status: GOOD (  19.22  )
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

When this initial driver was first added to tree, that is, in commit
26822652c85e ("Input: add zinitix touchscreen driver"), the touch_event
struct had a field called finger_cnt. It was supposed to report how many
fingers are touching the screen.

But then, in commit e941dc13fd37 ("Input: zinitix - do not report shadow
fingers"), some touchscreens reportedly exposed a bit mask for the
fingers, instead of the count. So the code was changed to bitwise
iteration.

With my testing on the ZT7548 touchscreen of the Galaxy J6, I find the
former to be true. This shows that there's two valid methods depending
on what hardware the driver is made to work on.

One solution is to implement both methods, and use some flag to select
between the two. However, this introduces more implementation overhead,
and a possibility of regression on devices the driver is expected to work.

Instead, unconditionally check all fingers. The finger_mask field is now
left unused, thus serving as padding bytes in the struct. For each
finger, zinitix_report_finger() is called if the status reports the
SUB_BIT_EXIST bit, so phantom fingers are not going to be a thing.

Moreover, the android driver [1] does exactly that, so it's a tried
method of implementation.

Link: https://android.googlesource.com/kernel/bcm/+/23d376ef33aa4c500a5ea24a290f029d5f8e2de3/drivers/input/touchscreen/zinitix_touch.c#1942 [1]
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/zinitix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 0c36765bd79f..3421b8ffb19b 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -445,7 +445,6 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	struct bt541_ts_data *bt541 = bt541_handler;
 	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
-	unsigned long finger_mask;
 	__le16 icon_events;
 	int error;
 	int i;
@@ -470,8 +469,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 		zinitix_report_keys(bt541, le16_to_cpu(icon_events));
 	}
 
-	finger_mask = touch_event.finger_mask;
-	for_each_set_bit(i, &finger_mask, MAX_SUPPORTED_FINGER_NUM) {
+	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
 		const struct point_coord *p = &touch_event.point_coord[i];
 
 		/* Only process contacts that are actually reported */

-- 
2.54.0


