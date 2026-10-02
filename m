Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D0CA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=; b=e6Mn9ZVpyjZKmNjnKGb8RBFwk5
	hqWR/hJqJaS5dmMKkNx1mVyxUhqp78gVfFXIB00aH7EQLoyc274ndZEvR14Cu7Z737tHkg3zE1hvP
	hWvFKHeoUUnnPC8Xhu0q8zUwbgBFfKwO6I5ab+h9YOJKEXULUrdhHWy7E0YbPW2rSsCzIa5i+/CIh
	xu2Ja1HCXrC3jLsBMstOcHnIrzXU8tcSJPWKjfm7DSaDP+Hz1q7hyEqgOak5s+Mr2USHCcJcZ79LW
	O3cYbFfFS3yiblM9UrAAPNdpwzk42LQaosJ2mk1UNmD+Dm5lycVSFaWqFc230w/gFCxg6j9dqfRm9
	acvmJTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaS-0000000AoLp-0JPU;
	Fri, 02 Oct 2026 07:21:44 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaO-0000000AoIR-1zB2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:42 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f635552aso5653563f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925699; x=1791530499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=;
        b=gHGR88UuPYY2/nb7RnoeA+JbMXWp+cqQdcSzAJ2qepknQjNbii5hMMpN9WWwRWrjqi
         eIEdVqTAMDVhzH+Q1qYl74JHuL/PSdSDQ1kRpsSeSbMzPUyYFA/TVbZTKh3FVN9qF02v
         0LKagiSm31kCch4M444ActwqZuhL788LCcWmCkcKSgvIrnlU/SyDoY6PKdL34Yj9BOlD
         VqZ++X3u6PsoUaIrfyvKrdfMMBZqVvhz2KwXeKO+A5yc49ud4DQMdDrXQ+g9I/izGyLE
         hR6meZLNsxLe/a2fPxbVZ8VKqubypNHLeKt97L9Y2h8GEz9Spm55f1mUaRUle5cCT0Uq
         dPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925699; x=1791530499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=;
        b=TBo/n0SNzOjOheqPXzTA3D6SCnyB6rszJFXiO0/oDkjVI8w//CFD0xDmxAzpv7+CKu
         IBNfRjLJLq7Vn32laZ0wBAhIm8LatjtjAjUvcPGQUNtzNLWvRn2NiB0JfU572kMhNdnT
         ZpPR6Xmpnk2Bmt4WlmtxlRki1udh9rLYhImRImMEjw6ZgFD8pXXp3BeiaPPpzyg3Lq75
         fV58uPJayv36/+axXEGelOnAKFS85SZ5f5plHNlDI+TpjybJXgoz6PfDzfUvnIjUqFAi
         DKtdrQkzs72uhqPk4V17aPIujdKG3wSw6V2bSVrXB94RcSB9bo7XyaUZlb8Tp4kjQhlU
         uIjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBnv8438bZdj2LZlkIjqv/ZKm6Nbegp0H1UQgO5RHiC3PH7a0kaBh0MyK48GMAApzrWu8VyLI+BCLXLxyRIX+E@lists.infradead.org
X-Gm-Message-State: AFq9FYLJYABBEg3FL92g0+4YJGUyEKq40JaeDOTlv5cFbOUfqKEpfaca
	pdomH7lnfLLzwBncwO2b8PWygAdGt/q7FuLz/W73pwUSsBkukk35WZQx
X-Gm-Gg: AYBFou0g2H690csHAdCxiXKCwTNATplwHs4lP8JVvCc7qaDGpR3BgWv0PYGvP5qW/Yl
	30XoHGSR782XN49g4Fjm7vaxj1meiiSTES89tj+lRnoRWO3w4d07SQRw+y80eEqYlCeKxWGHhrj
	1qJOXqMfZ5ghrDwb4bC09HmeNPrZyKnmGwPoQGrIRlliBgGn0BFrbS/vrq+sqqqzSmWw+bsaSFh
	vKmEhduT0JsqWZMxQFFyH0Et0ot9ugwdQgt5kaBP9nxi+rPmFRdZOyLQqtd3ksOHefSutFFt+EW
	clZGZoJCchwG/9wsgOzTVmSx503zEY+diTdtwMWe2n1IFyskTEKRP/If7NNherv7/xgjoDCLaHU
	NK0G3ljFo0jF5jz7JI+AKO7R0LsWl1Rlp3RL1oE7I42cPF6OURHZFsFwe9N3611PJHNiHCKl7CH
	j6O8iLOq6c4Mhw5WYZRTl/nlaAEfWrTV+ZPuQJ9EZyQ+13XLo18KAn4I+zZem3Lo1AHMo=
X-Received: by 2002:a05:6000:4717:b0:487:7fd:730 with SMTP id ffacd0b85a97d-48b1271cda5mr3160214f8f.13.1790925698787;
        Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
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
Subject: [PATCH 3/3] clocksource/drivers/timer-mediatek: Request and enable the bus clock
Date: Fri,  2 Oct 2026 09:19:28 +0200
Message-ID: <20261002072115.169250-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002140_529514_B456C166 
X-CRM114-Status: GOOD (  16.65  )
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

MediaTek APXGPT general purpose timers may optionally depend on a bus
clock. If this clock is not enabled the timers don't actually run. Boot
loaders usually turn it on, but later the kernel turns it off since it's
never requested by any driver.

Some platforms (like mt6735) declare it as a critical clock in their
clock definitions to keep it running, but at least on mt8167 it's not
actually required for a successful boot.

If a bus clock is declared in the device tree, make sure it is enabled
by driver probe and associated to the device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index a9e7ff6908a3..842d6ee4259e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
@@ -283,8 +284,9 @@ static struct timer_of to = {
 	},
 };
 
-static int mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
 	int ret;
 
 	to.clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
@@ -305,10 +307,14 @@ static int mtk_syst_init(struct device_node *node)
 	return 0;
 }
 
-static int __init mtk_gpt_init(struct device_node *node)
+static int mtk_gpt_init(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
+	struct clk *clk_bus;
 	int ret;
 
+	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
+
 	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
@@ -344,11 +350,10 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 static int mtk_timer_probe(struct platform_device *pdev)
 {
-	int (*timer_init)(struct device_node *node);
-	struct device_node *np = pdev->dev.of_node;
+	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
-	return timer_init(np);
+	return timer_init(pdev);
 }
 
 static const struct of_device_id mtk_timer_match_table[] = {
-- 
2.43.0


