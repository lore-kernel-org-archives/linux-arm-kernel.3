Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19088E69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4GQahu87vhd88hFE8JRJ4HYD1rmTxDILIyZYp/HAr0=; b=nFRS9t989rSCQlqNcGnr2JIW5S
	PW5aJbApAhUrMJ/gyMJPVZC/U0OPU+7e5MVr1zl88ataNv9jfwZmvRA2DKJ4bFEkMGMzKt2fjetZh
	+IlVO53DePJHpBkp5kIkYYU8CbNZWwFGpyUXJDGlqhOTNztQHDt6Htb9m4/j+No1+wmZdPY53oDTf
	w+lQTrfYTa75ymt/SQZeCefbaI8VtGkCkzksq8WzO2Jbk98E7pO0CcvgtHBhOTRLruu9JunfHHLIC
	3Kphz75y3+D3ewFBndJ+ynNNZO2sGfEieoV/zsitxKyjglTdGv/zXtYyaY3WE978Adz3BwiOE4vfG
	JxOj75dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQi5-00000009BtA-0Gaj;
	Tue, 03 Dec 2024 11:04:53 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPu-000000097rf-1B8W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=f4GQahu87vhd88hFE8JRJ4HYD1rmTxDILIyZYp/HAr0=; b=tqaVNbPcmZNh+77T/UilL7CrLP
	hH97DpmQufsim5ee71fVIWWOPVc9PDHG+XRTv40HynXgbp34guCl4PRSYIEm41jsO9mlGc2CUexM+
	caJFCKBIfL8am3OCGuYPMnyB9iyBp33SJrc2UvuT+gZHBMzPxltUdA91XVEsE0hsBOEe79BTBp/1P
	5lJn2qKzt/+QXaQQ5RBMnffyYEzw34UbijAuQAzD1W2JW8vh5LzHsMXbDIurMsBdTBqvxkHOOvB1Z
	SKWv4W31aByqTB+Heuw2UxesLhuYKfy5mJPCDYNbQw7nZVPuzMTTweXyDqoz7dBjYYAkTQEB+w1XF
	EZKMvqGw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-0001On-FH; Tue, 03 Dec 2024 11:45:53 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPg-000L8G-2g;
	Tue, 03 Dec 2024 11:45:53 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:31 +0100
Subject: [PATCH 1/6] rtc: interface: Fix long-standing race when setting
 alarm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-1-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=2485;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=UAN7dJJYBHqrrdv1gqBUohBZJi21Jc3c9XZjYqmVsUA=;
 b=Gioy18FoeQopz/OaoQ+E5tbVP+NcprFBYM1Wuwd8vtThzFcyh6O4hvETtrPhXzR2z1l7vN4hh
 eN702yy0ltZAyvpluSKY5QQatXoRSASaJdKAcEkpnxBOS59ucOImBnP
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024606_351154_13DF074E 
X-CRM114-Status: GOOD (  18.73  )
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

As described in the old comment dating back to
commit 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events")
from 2010, we have been living with a race window when setting alarm
with an expiry in the near future (i.e. next second).
With 1 second resolution, it can happen that the second ticks after the
check for the timer having expired, but before the alarm is actually set.
When this happen, no alarm IRQ is generated, at least not with some RTC
chips (isl12022 is an example of this).

With UIE RTC timer being implemented on top of alarm irq, being re-armed
every second, UIE will occasionally fail to work, as an alarm irq lost
due to this race will stop the re-arming loop.

For now, I have limited the additional expiry check to only be done for
alarms set to next seconds. I expect it should be good enough, although I
don't know if we can now for sure that systems with loads could end up
causing the same problems for alarms set 2 seconds or even longer in the
future.

I haven't been able to reproduce the problem with this check in place.

Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/interface.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d7d2cfd5479fc1fc892fcb5efbb6b..e365e8fd166db31f8b44fac9fb923d36881b1394 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -443,6 +443,29 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	else
 		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
 
+	/*
+	 * Check for potential race described above. If the waiting for next
+	 * second, and the second just ticked since the check above, either
+	 *
+	 * 1) It ticked after the alarm was set, and an alarm irq should be
+	 *    generated.
+	 *
+	 * 2) It ticked before the alarm was set, and alarm irq most likely will
+	 * not be generated.
+	 *
+	 * While we cannot easily check for which of these two scenarios we
+	 * are in, we can return -ETIME to signal that the timer has already
+	 * expired, which is true in both cases.
+	 */
+	if ((scheduled - now) <= 1) {
+		err = __rtc_read_time(rtc, &tm);
+		if (err)
+			return err;
+		now = rtc_tm_to_time64(&tm);
+		if (scheduled <= now)
+			return -ETIME;
+	}
+
 	trace_rtc_set_alarm(rtc_tm_to_time64(&alarm->time), err);
 	return err;
 }

-- 
2.47.1


