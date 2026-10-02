Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C08CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=; b=ely/R1fPRRG/OcOeYh0zu1pG+v
	wmyoMnlGOxo7h0PxwdsRAzMFqmCgxb2mq2UI6Xofi6Y42FsglBWcX4Xzn92MeVtwm+Im9vjN6uX/1
	TC8fiQIrZNAiBiIt8//N3LefGxYdELFlZuQevaNKSDSbQWz7yBePOq2kBgBUoQqsgue1+MnlGoYts
	Nasp2rXcbK3aLzETJDf8HsHgcnbrQOYx9KMt3/5ihzLCtRaarAIdgQnjGqAjv11a3i7YtJONyVNUR
	VVy/hkE+xj1vMpZ7rHWejD2AZBqT9bW4hf7yDjRYdR7/Rup4N2dawCgkE72iyrRzxopSewQ1/X8rM
	BNYW81XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaR-0000000AoLP-3wCD;
	Fri, 02 Oct 2026 07:21:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaN-0000000AoH5-2aTY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:40 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so4537008f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925697; x=1791530497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=;
        b=liRCU3/0P0uB5tx2rNYSAPHukgbrDUbwqgPz6j+Bp3wqCl+bWsGHn8JGUGd+eYNUqd
         +BHL+/skw3iuC/2sFJO2Qt0vylV04hL4UlQw/IxGd59NmtM8gYfXW3XZUSBI+XkrRpzX
         EKZ7DzVGkGssQmEkHKUrBYxr8Q8bUEemJuhaiLj1/CxhpTW9jm+F6KZsLHM9nUAg6lCe
         tVKwGeJwpeag4xLbert9xtJauRsj5Bl0ivOV+SjFzyk7iuME8zva79bmY7//NJ1pTw86
         Gz/5uSfYsReatZY36/LoXM0KeYxxMQUHwgNX3uhEn1/8SLPoOVpN8rxKN4H/YUmxHyJz
         0csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925697; x=1791530497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=;
        b=Fq8SGJl6Z6GuIhURBHXNzU0yaIsBOPpZ+RiSjAm6tIHT6KkPhx5FLfLsP+/ac6k1/Y
         aYTvCKX3iojlTvR9Bw34kgmrAiTVkKcmlsedZGuMgzRW0ZDdb0VEtnyB6gSn4ZIfOl/z
         ERLD4TlezWZY1P5NGOFqqtF8qTNVALJfcsk6h9B0c5bMPpCBjqYNbZ2T5N060kV4toZ2
         YSyb6iecSi36SoU66+TiqXMwckZMHpVqE89Zvts7Kt1+AcrD3vSH2jt2vUMHc0YI8BSN
         msEwx3Shg7NumgGvcdmZv7bFE/xgLFroeRcPlVEfT7rQMQATnriF05wmsVEasXQikycv
         Doig==
X-Forwarded-Encrypted: i=1; AKwUvBxjvq09w+5fXR1vtBTZVPFORoIN7bhwGPAh5jJiOVUSSWDq1+vmyKV4iaHF7JYmXFf+3bvmfwxDBxCgDXSE6ngs@lists.infradead.org
X-Gm-Message-State: AFq9FYIrdL3vkRWGuvQ5a6f8RaPJXxSR76vQRgrqDR7Gz8YnTVxoSjxq
	a6naY6voUc5SGNUruc/HavceDElGkMtInXb54Oo1qTitqOtF/LnoDjSp
X-Gm-Gg: AYBFou03b2sS1ccHA+IG2jIdqdQcI7pYeP5u1qCogflQ8NNL7uGlqVUF+Jutnul7ObH
	AQ67G2fzx2s3ckCb71W+ABq7irv0v5Fat2kAorfpbMmTilkYqvJAIfHlZLGY1MO9s6UOlkJu+Gj
	Fb8eO9z3troWvaOnaSP6/Hf6yedwagtu5U1HFiLG31TfdeZ+hscFrKkF9e5riZsiSGoaQx/8UQX
	I3eS7cOXxKTVxBHKeZktSRF5+dWHGsGNCz0OKHKBtCq4fjNgGxzunxkPZu5gveFxvjGWHTsHJTJ
	9mFu5C3Sf+RK2jjgJH91sEnOG/h3fAL26f5suD3IhuT3LuMjwG9qigw6pYnvtifYhNG6T6WQvus
	2nw6nT+T2uCpEd9PKvIeI9Iwi2yO8Y7UU/fABqBGUq1eq3ezln6qKCMW4puUQRVtyYuEtBLnoxq
	F+e8rSwxlx19wuonKyu8X72rHJBoCPmpWfmi6303FBjrH964Ob1+2XNuv3JUj6XJ0DbA==
X-Received: by 2002:a05:6000:981:b0:48b:9f7:9359 with SMTP id ffacd0b85a97d-48b12739796mr3125446f8f.16.1790925697499;
        Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] clocksource/drivers/timer-mediatek: Convert to OF probing
Date: Fri,  2 Oct 2026 09:19:27 +0200
Message-ID: <20261002072115.169250-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002139_688831_749D7956 
X-CRM114-Status: GOOD (  19.40  )
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

MediaTek APXGPT general purpose timer driver is registered via
TIMER_OF_DECLARE to be loaded early in the boot process. It depends on
a reference 13 MHz clock that is assigned via the clocks property of
its DT node.
On platforms like mt8516/mt8167 this clock is provided by a driver that
is loaded using OF probing and becomes available only later during boot.
This leads to a silent EDEFER error during timer init, which is not
recovered by TIMER_OF_DECLARE and GPT clocks are not registered at all.

Since those clocks are not critical for boot, convert the timer-mediatek
to OF probing and drop the TIMER_OF_DECLARE instructions.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 36 ++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index e20075b09fab..a9e7ff6908a3 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,9 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -215,8 +218,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void
-__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
+static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 {
 	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
@@ -281,7 +283,7 @@ static struct timer_of to = {
 	},
 };
 
-static int __init mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct device_node *node)
 {
 	int ret;
 
@@ -339,5 +341,29 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np = pdev->dev.of_node;
+
+	timer_init = of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
-- 
2.43.0


