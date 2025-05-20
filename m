Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A7C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=; b=ytjBNBCbWMOVwOesNcrUbOYlfG
	1xibcW67Jhc2Nz7Q9oYs+4bU2/T/fS19WZO/8+XiwTz0B8m8TkGSztjIwjTXCNNU5x+vWEfpLpBS0
	O34NTW5Me6K8FQSAzlfFY9RepEMdylw0ZLePCWfEXDO89p1F5hQXnFnBADE9Z1Yg7l6bKSaBN7tTX
	oYOJ/Gvlqx0UPUNjdLah0vJ3i50f7X8fnD1fGB1hgOTgn7ZnmLSS6WAnEJrcxl3iwYjCNtjzUrOcf
	DK7BwkgTS30n2DD4WtLQV8PgJhdzSA7bSQFq0p0v0yVdCz1b2GXC9Duvke4kQOyDy8vHwRKFNBAQZ
	uToNLyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTGQ-0000000E36m-1bUI;
	Tue, 20 May 2025 20:08:38 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTAH-0000000E1vx-0TYP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:02:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4764875b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771336; x=1748376136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=Hfhbe1jtlBkN2WfEBLyXmPQwurNdcgOItQwtl+p2CZkbA6k5rxN7CoQ8NOodU0cegn
         khcR1ig1ZfczbRuDvn2WA5ze1pmuAYWNka1OWl+ySA1o7xVVhMsID7/24NoE+XFHAwkR
         VuK6cLxUgn6uU0kXkvntr/6ri8ikV/9h4sN+IMtpBrjtVrE888NVBywQpGDW7xh09H5y
         ++HuYf7NWPyykGMcH1x+/bS++Veh0ggKLD16KwryxG9+c0UwPaKfPoQUDSuvF3FFgvWj
         qV0D8MGQOL/abJq28sbTllSr9EiO7umYpexddR1CjD0Bhj1mh8maAGaO2kserRefsNVT
         Zl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771336; x=1748376136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=mmsYTJdUwW49Fdr5zJjrlEY+E3yRgIT5IXhA3JQPzcyGhhwB/mGJ0+7DvFSh0iPC7m
         yFtMK1tMtcN9bqU0ACeucgeaVJ9Zjr5lp3mQDdDcXTa6Ky8T3XitlgOeqe4Lgs8t/W0K
         r4JXwvJdRuCDIAlP+t2go7CZczwfST3ie3hZ3h1BnRvjw+mAh0/99n8+kg6FNiN6xS7h
         0a7PASH3uMLe8rXHnrAL7mGV/U6NIxZTR+99D9lnyLI07PnTj+WY9sPVg5gzPIVp1xr8
         R+3ItRFSQy9r+oZuzyO6HPavyrjMSxmF5qRXci4Kb7GTARuwmV1r90EHrVXeRI5Xzhuo
         F8IQ==
X-Gm-Message-State: AOJu0YxIJWsLa2Ht3oPQ8rYAb4Q0Qh5Mcx/LUo/ovLw7Om/8yuqfsc6g
	QoHuCiwOpCAZGN1Cx0NxI9xNTrOD9kKsjxsvkWpIIrZGfvVdNMGXOyCN
X-Gm-Gg: ASbGncun3lCb3DXumlpxirKBT57AZGOkSXGpejM2DAVLU+lEMsDc/oydj8PQIYrxn8/
	njsP6Zf0lUnjrhuCnbszCmruMQBEy8bEL2fyzDnmTdwvLRRxEAoA0UNO9LTIPhH8ZZf3rJ0/c2s
	RgoMNz8VRA8VjR4QWVbXj+wc1H07JIhtPufPSZX7g410xU10xT6HieFZ2ZzmYkpJ7mFE7lk62iR
	5oXEA3MYRBf+eqhVSSS10gLViiHFhxtX949jR3xmeqCU4K9tlvCFCSC9MvzO1MJ6r9o101QJ4XC
	rJcqmCh4LRr0tLr3ad6xmMu67aSzlwfQgJiQWs/ZnRPWX/Mu2Go8tmjBT9j6i8Ttz1Z5dOrCpg=
	=
X-Google-Smtp-Source: AGHT+IHbuXHg/W6vSnqxmLG1ArO4kGbvEMiBikDCtc9Lx0vI8sgYtzMvJhfgnt11IeXH89wjamvdZw==
X-Received: by 2002:a05:6a21:1807:b0:203:becd:f9ce with SMTP id adf61e73a8af0-2170ce3a504mr24910455637.39.1747771336150;
        Tue, 20 May 2025 13:02:16 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:15 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:42 +0400
Subject: [PATCH v4 2/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-2-2d4306a16ae4@gmail.com>
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=AUuQnvbMDrfd8awkB3JMwlMLN9vm/FLiD+sdVZUb6xH9xoS1U1VL883Aoif/LNQPN3hW7AWAi
 ydT1S7bhS8CBszZsQt/uWDV5nxhBwd7Gd9dchd8CIXQJdq9qFKnyrHo
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_130217_160647_D504694E 
X-CRM114-Status: GOOD (  17.99  )
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

Add defines for all known registers and their bits to make the code more
self-explanatory. While at that, replace _VAL suffixes with more
intuitive _REG suffixes on register offsets.

No functional changes.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 65 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index a469b1b5f97233202bf01298b9f612e07026c20c..9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -24,15 +24,31 @@
 
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
-#define TIMER_MATCH_VAL		0x0000
-#define TIMER_COUNT_VAL		0x0010
-#define TIMER_STATUS_VAL	0x0014
-#define TIMER_IER_VAL		0x001c		/* interrupt enable */
-#define TIMER_CTRL_VAL		0x0020
-#define TIMER_AS_VAL		0x0024		/* access status */
-#define TIMER_COUNT_R_ACTIVE	(1 << 5)	/* not ready for read */
-#define TIMER_COUNT_W_ACTIVE	(1 << 4)	/* not ready for write */
-#define TIMER_MATCH_W_ACTIVE	(1 << 0)	/* not ready for write */
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_STATUS_REG	0x0014
+#define TIMER_STATUS_MATCH(x)	BIT((x))
+#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
+				 TIMER_STATUS_MATCH(1) | \
+				 TIMER_STATUS_MATCH(2) | \
+				 TIMER_STATUS_MATCH(3))
+
+#define TIMER_WATCHDOG_EN_REG	0x0018
+#define TIMER_WD_EN		BIT(0)
+
+#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
+#define TIMER_INT_EN_MATCH(x)	BIT((x))
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
@@ -43,11 +59,12 @@ static void __iomem *regbase;
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
-	writel(3, regbase + TIMER_CTRL_VAL);
-	while ((readl((regbase + TIMER_AS_VAL)) & TIMER_COUNT_R_ACTIVE)
-						&& --loops)
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER
+	     && --loops)
 		cpu_relax();
-	return readl(regbase + TIMER_COUNT_VAL);
+	return readl(regbase + TIMER_COUNT_REG);
 }
 
 static struct clocksource clocksource = {
@@ -63,23 +80,25 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 {
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
-	while ((readl(regbase + TIMER_AS_VAL) & TIMER_MATCH_W_ACTIVE)
-						&& --loops)
+
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_VAL);
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(1, regbase + TIMER_IER_VAL);
+	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
 
 static int vt8500_shutdown(struct clock_event_device *evt)
 {
-	writel(readl(regbase + TIMER_CTRL_VAL) | 1, regbase + TIMER_CTRL_VAL);
-	writel(0, regbase + TIMER_IER_VAL);
+	writel(readl(regbase + TIMER_CTRL_REG) | TIMER_CTRL_ENABLE,
+	       regbase + TIMER_CTRL_REG);
+	writel(0, regbase + TIMER_INT_EN_REG);
 	return 0;
 }
 
@@ -95,7 +114,7 @@ static struct clock_event_device clockevent = {
 static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
-	writel(0xf, regbase + TIMER_STATUS_VAL);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -119,9 +138,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -EINVAL;
 	}
 
-	writel(1, regbase + TIMER_CTRL_VAL);
-	writel(0xf, regbase + TIMER_STATUS_VAL);
-	writel(~0, regbase + TIMER_MATCH_VAL);
+	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
+	writel(~0, regbase + TIMER_MATCH_REG(0));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {

-- 
2.49.0


