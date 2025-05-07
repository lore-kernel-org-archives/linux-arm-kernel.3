Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0F5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=; b=0x6C14pabJPxjX8o6e2ddPlMYW
	eZ/IJgLnWSdUVJG5s8LDRmCllN4nrvJ20N0UBye7FOzA0vHegPGM1T/bAJbx8wK/PPV6b7gsT+fJo
	qtqSiT5uF2Q57s2LxeQfR455iC59t0mxc25LEeMwvpDPMAgrYICPuPaH5wW6AmCuhAis8WOu7h4zP
	2qRbf/XI5O/4KH5BWK2VLnUXYjjMSxGGlsz2lJNdXUSOC8Q4BBzoc21g2ZzEHcva6PWZ2eLUzbGB3
	KzYWZSGEmHxkALH+DnhrLyD5PecHPTVGa1XfwkrZYIMcYG7VUxS004VGPW1vN5g8toS66ol0j/aeX
	woh1HWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYph-0000000ESTY-2MSq;
	Wed, 07 May 2025 07:04:45 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYk1-0000000ERXf-0kho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:58:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so5784796a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601132; x=1747205932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=misEgaF5jlZIBXjgn8aVNxxBzOamJK7pdqx86KHdtMoBxEbf2u0mCjmDHoCxBBL897
         frw2i59nXM3j+JlqX4chUrkUK50FbyOzuSA/0Oqhse5I2TCjPpMtq9uRo8MgPx27JuCI
         V0EMOCWR+Alem67rgmoxgCU51gsU0grLUUVvOu9KnESKjPr0Mtkm5iAgqjoHNGwc8jsS
         pZ8lV7XUWCMQnPPITs1wxyzRKAKt3XuUb4gCwl+g7LCbGwmDbth6g1cpZr8fu98DMlmw
         wtZE8RhoKztW7q1au7eBjaQRkCLRIf0//Yw9aw3i54OwuwrdS6xgaT4tmcfesxbOc1KW
         ZMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601132; x=1747205932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/YRE9eWWpFH2r4v7/hrx7dmjRCdICuJbKw6jMjRMZw=;
        b=APYqkDhhw8F7J+wz7WQnfUVkRf6Eq12Nk4P2tfzrae5nQrGvqe1CofgUKSuHg+ULH/
         8NpGNeRHYqXXPuNAA0P9o4oAhlbDnZbXXF8P6XQ69DOtVgU+J+5AWcfiPclFQHr6KwSi
         UR7PxKgQI0rXLortlXjQ0iNFOG+ZE8UDsqWBMMP04f6UmBxmOIpEUgbRtdos8Pmjl5kJ
         UAnS9iXZIwFv+iXC4vk+FRwLHyBpkWeOn4Gl10zRRuu/sa+fd3kv1jAKANvXRGzplQF+
         PJYmYmUw9jQ7/AV760JGQihrPKapKWPJ2aPZeYFEeN91BOGUvN19yumsuLtQQu+mA8dl
         Ehrw==
X-Gm-Message-State: AOJu0YyZma27Qh1r2BM+5caidXC90ftyC8LP9MzpMFwl5GFpcwaxU+na
	Hp61bwr1aoaXLbPPmG+3sSu4EnKoMI8Z2/hsYAoB8pjaTBdxHsl+
X-Gm-Gg: ASbGncvObo3PcZgmpcIRjgQKRcMcF5yjFZTGe/ocjtczDWdQqvfwWrcqMibJ/NunQKh
	Yr+NajzU8ggzaud0LLqE8HhB+2+Lrtb7id+kPn6KFwGkbZ5wgd7mq6LDZuiYAf0RXf+CDz2raUC
	UDmP68WaTYdPUmP4ctfr7ORiKaO2MSuXPy1RKjPmNWktJWSswo+6G4w/q/B8D7upES4HBtUbH7h
	oWokaoae4FNEa6DiKAM3bIrbWi4LPfT3CTK3T+Dx10EwoQxUHvpyAV+rNVROXYtAHq+rb/fNpbl
	aahcPZ+unBMofnNU9ZDSbBS1poHer+sRhDH5TwIPbshDX0bB9e7d8kjfDMHssE8=
X-Google-Smtp-Source: AGHT+IE1R0+xD8YFgg8XOD5hEde7Pqr3UAxJ1fPGWosaZ3JgY//JiBJll/02wER6xo3fdxcyyvsHNA==
X-Received: by 2002:a17:90a:e7ce:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30aac26b86cmr3332750a91.27.1746601132185;
        Tue, 06 May 2025 23:58:52 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:51 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:31 +0400
Subject: [PATCH v2 2/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-2-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=4723;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=4CyYsnhnKma2xppJbhsHsOk6fmvNYSaorpOr7AaIMyg=;
 b=2hmYsIIl3JTTzoNlkemuEqYWoJwtX02w1BOyvcRaRz0UXM/UX9q+mlX+UPe6goxwY67GNIrnI
 C5lJS7thZ5yCGiPc1qogRSL1ukycQShkcrEdQjnvsiEyLYVQV/ILE0y
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_235853_211616_793FB340 
X-CRM114-Status: GOOD (  17.55  )
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


