Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F1FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=; b=QQoLMjQXUoDDoMRBd530PFjJqU
	CDyuxsIadn4CDWBdXCs2Ako+sGW1YPVjzl5Gdz5SZsVd/Pw/f0hshi0NihM8IAXA4pTQQjgtBBgVp
	kQ4vjTng/EuqZA5NnvjpHi3niHKrmnVVPmoOvrNNtejDo3Rr8AB7uN6aSWFt6vNbGIMstzSPhcaFP
	LYEVe/EPMb1dSQAwTYKVZS1mlbi3HNEVW3xYlIUXhtIoFo1svZ27PCRIS0X7YEuCbL+YT9swJJ1o8
	vDwJiG2k8mRo42AMDV+rTRp6vshNxlIRulxVbjMtLaFnMLkkM+ESijBYUZLxVn0unmDPhZynfr5ZP
	5U8sUlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUad-0000000DubV-1nOF;
	Wed, 07 May 2025 02:32:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOZ6-0000000DK6w-2T6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:06:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so65463475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562016; x=1747166816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=I3v3T4VmAVJfLqt8rG1f5oWm3ApAeewlgZCOj/+AZDS2fRl12Q9XRBMNPioVIP8CqE
         InD3PRAE5k6QBS7Yt2gdvMad5P8IFcbVITRJfyyuBUYeh7JmNIP9vU0L0j8nlw5uKegB
         fmYtzZvFBkPzNGwvyMUI5fbcjsd91Mnhhna+hLVpXLi8hy8zcEF8fZZ639dO4HTe5arT
         RYfoCpD4nJ8ZMryEFCeRvsQTCEe6sTM2wyOfmu/m1+e5ioIx8v1YAnk1AzB8Pn8UDCmZ
         WYfGxuQ0OmyfJMy0ty39clMb6sip5fFO01UlA2cMI77glW0SkKI3v2mou4QOez7bblC3
         xhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562016; x=1747166816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=sHe1fNf3SVNovRiKHkPPo0XB0h51YMMylSt4yUv7oy2tgux0QlR32CPyz6CZOQRXAG
         lFeGJqjwEOQkfCSzwvr/SZ6ZgDGhCXY8PSmWAntm1I7bicLD1/blhvm8SGMNK9fSQ0Z8
         IZP5uFD0o/5aXvHt/UyQUCnKunPpTKf40uBa5rVo7bID5noPEhAi+nDsgIxjNyfz0UVE
         IVA8oynbPWWJ2Urrx9b1BepJb8TiRruxxABvRByf+7+imADc4QWibS23UT5TVDvAWJ9l
         CYyd5TA3hgqzZNthJQmcXwBep9xHsbMH81NrW2bHkBFxHCAqi5eYe/uyTg1k+HVSMm5+
         AIvw==
X-Gm-Message-State: AOJu0YwDQ95R3/KQtER/0LfuJAcP4vub2vqslrmOHtvim4QV1wBxKuC4
	PNnvRUXeRrQAeJUq1hbhE5WseV/TzDkQ7K0D/FMaCMyb3/wF9uD8
X-Gm-Gg: ASbGnctAFZ8vLOspeZ0XbhUtIlZjjyXzpuWmhWR75uw74oonnYyBK0TTDra47+U/6ku
	B8ubKcuUwuLi5/no/tdrbPM+2083/X6RPZX/xW24nh/4cNT+3gJxuRPrcgQdDSLkNRUuDH/SKsj
	6hNd9LIFO2mjpYfz4xUKbKQ9rR9VzMS+0pLuQFyRpykQiq2ln87fPczSl4WF9QLxV4N7a+X2kdD
	F8D1sLdxwKROIFQhNUg1CHOtwmRg+3spMuEmCbxmoZ2K8xaNrZl3qrOLw0+RDl1AnOVHRI4Nur3
	QHt3uKV2uO4FobJnQbxN2makQjEatn/H5ymgRILYLZ/VH7npJ+LL
X-Google-Smtp-Source: AGHT+IGlkQfSG4fbE10O+Rqi2AvcS+LbdMEMjae1CsuF7p66CVoyjD6FzSnG3zpc6h+DEromeglE2Q==
X-Received: by 2002:a17:902:f605:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22e5eaa83f7mr8227175ad.28.1746562015546;
        Tue, 06 May 2025 13:06:55 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:06:55 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 00:06:12 +0400
Subject: [PATCH 1/3] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v1-1-6b76f7f340a6@gmail.com>
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=wKzS1x8oJwHG3nz/X+LTVYpDOsWN5aGxHnJtcbMajdohXhyV0gDehxHOEjQVI5EVgZynHb27S
 I5HGX0aKbS8CHX8tYGsRUt6UWhQSW3AVE32ICZgfLUfkD0f7+h1F/1o
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130656_631844_67068FB3 
X-CRM114-Status: GOOD (  17.62  )
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


