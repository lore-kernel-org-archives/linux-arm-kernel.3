Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B15C624CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSoH0uowbh2rhbgIfmVYDmAuDzNohrLyvgtanOutFl4=; b=KjiNf/App7DpZU43uKMDxHiZ6B
	68KMJuQ2/6nkITzkPkf/9rjRhKEc4Z3rWJ8MHOmpGBOpedXlEtWzXPNIJbUhNmU0hGFuWLXUr7pxX
	Ndj90M9ZIeTqjpADjlFjedkLWGkmVKyAjf6S4/F6tr02LQXjc60iZwq9eg0/S5ZnQ5DwZpd/b1e/S
	DfYXqxlSMUuesgR1O22Hytajj4GjC+XBXBvNMXkD7t3RuZqHOSh62hOCXCVZCAe+tldpqzxdqJH1P
	V/Jwa1wTdBgoqCwgausjrBPlHskusD/fQSDSCxmvxmvUqEym8QXaTeKC1nZ74+9NCV5fFz6p+Rj8t
	oKAfJELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12A8-00000009Qn4-0H4A;
	Mon, 31 Aug 2026 13:35:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12A6-00000009Qlj-3ofY;
	Mon, 31 Aug 2026 13:34:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C2686024D;
	Mon, 31 Aug 2026 13:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EAF1F000E9;
	Mon, 31 Aug 2026 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183298;
	bh=GSoH0uowbh2rhbgIfmVYDmAuDzNohrLyvgtanOutFl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F0FtzWbcV77MlcspZC5c1FkpSiPUeqsZ8YyKqjK4WppAwItwC25R8/TyXMu2trloX
	 UY3pcZp5L673Ly95s1wsxqMc+fqWDWSVCCDzwF5muFI1gZ/NriYmjbKTHlGIGiY7t0
	 JxegY2QEBtdF5bKpIy8l3adUaQ03LlPz8RoQZLxi4uRwWm0o3qyzs+ifWmppzIjcqk
	 cQBjHVipNbk92kvQFHS2IagygDEXmCvtDnLEuVGEpV6X64ke2wqrfrdSq0lMCD9GnJ
	 pQIxkeMbErWP/Y9/9v/g2cdYhuZC8CI4z5jeDTSPYJ+wYADURwng04oLk5gWMks5rS
	 M2GcQZhcbYS/g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Levin <sashal@kernel.org>,
	florian.fainelli@broadcom.com,
	linux-hwmon@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.12] hwmon: (raspberrypi) Fix delayed-work teardown race
Date: Mon, 31 Aug 2026 09:21:33 -0400
Message-ID: <20260831133314.4125787-65-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

[ Upstream commit eb0d491e2787aa359f0d930151ff6e5e5df70fb9 ]

The delayed polling work rearms itself from the work function, so use
explicit delayed-work setup and cleanup instead of
devm_delayed_work_autocancel().

Initialize the delayed work with INIT_DELAYED_WORK() and register a
devres cleanup action that calls disable_delayed_work_sync() during
teardown.

This addresses the concern raised during review about the polling work
being able to requeue itself while the driver is being removed.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Link: https://lore.kernel.org/r/20260517080445.103962-4-chakrabortyshubham66@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Those background searches finished and match the earlier analysis:

- On **6.18.44 (HEAD)**, `git log --grep` does not find this fix — only
  unrelated teardown commits show up.
- On **master**, the fix is **`eb0d491e2787a`** (`hwmon: (raspberrypi)
  Fix delayed-work teardown race`), merged via the `hwmon-for-v7.2` tag.
- It is present on **next** branches (`all-next`, `arch-next`, etc.) but
  **not** on the checked-out **6.18.y** stable tree.

That confirms the patch still needs to be backported to 6.18.44, and the
**YES** recommendation stands.

 drivers/hwmon/raspberrypi-hwmon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2f..b0f0f50986b9a 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -7,7 +7,6 @@
  * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
  */
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
@@ -72,6 +71,13 @@ static void get_values_poll(struct work_struct *work)
 	schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
 }
 
+static void rpi_hwmon_cancel_poll_work(void *res)
+{
+	struct rpi_hwmon_data *data = res;
+
+	disable_delayed_work_sync(&data->get_values_poll_work);
+}
+
 static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 		    u32 attr, int channel, long *val)
 {
@@ -117,8 +123,8 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	if (IS_ERR(data->hwmon_dev))
 		return PTR_ERR(data->hwmon_dev);
 
-	ret = devm_delayed_work_autocancel(dev, &data->get_values_poll_work,
-					   get_values_poll);
+	INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
+	ret = devm_add_action_or_reset(dev, rpi_hwmon_cancel_poll_work, data);
 	if (ret)
 		return ret;
 	platform_set_drvdata(pdev, data);
-- 
2.53.0


