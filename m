Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A654C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnEY2KdUknJWBsQjqh8ETTXj2cz9VJWvKOExBU/gttc=; b=p/ve0o+8sTKktyIkoO/jQQrFn0
	nXUjthZNNef7z56RaIvpmCS8c8/mzjv9Ds68bYzJGkCsxwA0ZxzNrQX9XfiPF5yU/e9Lj8WUgRvi2
	D/YHtwbeSmTIBjja6A52FRP2WuON9TcWrSvLdaE+wl+rBRiNr6o8Jk8tRXdnU9I4zneGON9A8UWJU
	KQDjYiRLnFv41EpQfv65sBN9/9CsrE+moF7FjSGQGrr+hrEZ3ZsEfZql3fWd8ylBKt4G1BexYsAyM
	o0YgGSb7g6QWaS4cpcmgJsxWWnDBVpnt1qK3ZAjJAlM+uYOSWZxvsL85HwWPuGncRRyWMwLvFdGH6
	gAXMRTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpcp-00000002fxX-1WqV;
	Fri, 16 May 2025 07:36:59 +0000
Received: from mail-106112.protonmail.ch ([79.135.106.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpQO-00000002ehg-1rh2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 07:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380245; x=1747639445;
	bh=wnEY2KdUknJWBsQjqh8ETTXj2cz9VJWvKOExBU/gttc=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Mzrrnk3CfWkzkzECgDBXxTZq0Kq03I4a0SUltZAyau3yoa/chOCyofVyO3COMUkvU
	 17Lvyh2T1uzVrzZ55dyDjbK9eHXFST5dhCMcb8/erneuGVoFizGpuNg/VuuAm4oN5r
	 fuPZyySckBn3Ic6V/7Jw1NNdIue135iUtDmA7js97DWUm/DukJxG1rbjGc+pttdtZD
	 J45lpwM4xo15OC5y6HBf6SIfAsLjnnsbhLllM+c36sbv8eYtBmMv7/rcx5+CclhxWf
	 QocciOkWxCs1HNNMA7fB/hX4xoZkJofoR3osKAEUYsNGDld8wiRgSjY9AJ8qFVBIRY
	 C+wQ4whxloZKw==
X-Pm-Submission-Id: 4ZzJVC4zTqzLb
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:39 +0200
Subject: [PATCH v2 5/5] rtc: interface: Ensure alarm irq is enabled when
 UIE is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-5-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=1227;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=IeqH+mmAEu357ujDYHkqkLZyj0ZjtwVZFNzsXZ5Ilns=;
 b=RrTb8qtv5dYP05zMzXkLxU5u27c2yybG4ipBNvmUZXn+c1CVziXdEP6YOWOHBaVduk77HJF5b
 tScJU+FR9GvBU7Q4gyMOGVGlCzJmIJBV+4kwczh2gYN86zycGwLGvF8
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002408_632366_72676E3F 
X-CRM114-Status: GOOD (  10.42  )
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

When setting a normal alarm, user-space is responsible for using
RTC_AIE_ON/RTC_AIE_OFF to control if alarm irq should be enabled.

But when RTC_UIE_ON is used, interrupts must be enabled so that the
requested irq events are generated.
When RTC_UIE_OFF is used, alarm irq is disabled if there are no other
alarms queued, so this commit brings symmetry to that.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Cc: stable@vger.kernel.org
---
 drivers/rtc/interface.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index e365e8fd166db31f8b44fac9fb923d36881b1394..39db12f267cc627febb78e67400aaf8fc3301b0c 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -617,6 +617,10 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		rtc->uie_rtctimer.node.expires = ktime_add(now, onesec);
 		rtc->uie_rtctimer.period = ktime_set(1, 0);
 		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
+		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
+			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
+		if (err)
+			goto out;
 	} else {
 		rtc_timer_remove(rtc, &rtc->uie_rtctimer);
 	}

-- 
2.49.0


