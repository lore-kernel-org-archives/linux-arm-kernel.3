Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31107C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9Z/ul7hXCo/YIyQHv36+JlKXEGkyyfKI7Noi5V9Zw8=; b=e6iyadb3Nc69Fg7QnSYoHC3rKR
	ztYnJPsES2VQDSs3EnBWnt6gmiZpl9toxxwbyJuWTU8W75p4eY0qtSgjSU4lf83QEmQyeUPnRJ2Tb
	ybt8km8l+0+5ORjTJ4v1e42CRplR+q3cFscqA/hg8QQFuksx5vMdjkCSq+xcG9MANbs5eOooV3k26
	Ox9EAWHIDdwVLN99UiAn0exfM9l7cP7uT2H+84LFpEW/6kgNsfvrJQNprlFFmQTM+ePdEpbhBD+G1
	+L9u1rIRGMH8gCsFPwV94lO6z6J0yc2GumKQPSMsrRMUIe6YSDcyGZZ+5WBfahyjsx6cuUGsY5bPv
	hU88J+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpWX-00000002fHc-0q30;
	Fri, 16 May 2025 07:30:29 +0000
Received: from mail-43171.protonmail.ch ([185.70.43.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpQC-00000002eeg-2eAT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 07:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380232; x=1747639432;
	bh=/9Z/ul7hXCo/YIyQHv36+JlKXEGkyyfKI7Noi5V9Zw8=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DKluuhBDUVDhATMSINsGvy9ny1stdMxHBTd7Hjax9eClAsaljoozfynvP2b6tMujM
	 idvaB9gTt4jU1KFrNl1SHzwCCIiNVgzyZyQC+qf/8kJImwFy1isSvaxtI/08vGMW3s
	 Fnf085yZPvQTpwzWVZCJrnWdTg9fZfOH7o+F+9bmdyk+qCM01FlUPk9KB9k+k5CsKg
	 /Xms564OOgx0DoPLvT+xcy3Bo4vzcJn3YF6yUFP2TBduNwArilr8j8kh67nuv3TQnL
	 VC8lDH6hOJwOiDH6Z9tPVVgB8dadWwgAEUDldjFaRLwKIBpgkdJM7GIW4oHS/6v8G8
	 6iSII+BdWsRbQ==
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:35 +0200
Subject: [PATCH v2 1/5] rtc: interface: Fix long-standing race when setting
 alarm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-1-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=2485;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=vqa0dTp9C1MThd8T8OLDOwiyoMFJjfgxJl+5EjhLtc0=;
 b=rETIVHamGkIBOoWlv8KoibC8KOoj5ZsQOY7/o/R7tT9GXokO16Ovg696kdaK+Uk4Z3iH2MGey
 hR07gIETKZiCR3/T8NoYDRzLqz+qoNGM2Uqiy3bgu90ANZ//6Q+5bI3
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002356_822216_237C59D7 
X-CRM114-Status: GOOD (  18.50  )
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
2.49.0


