Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6678AC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5jqhd1rWZQThiHSiojLdrflTkcEKeuuTWIqNZEYP0k=; b=AJqfqLwZ8KK0bsJESc533sZwH9
	4y1AJ6uzdTXNBt6PhjscHUnVPUeL9P+KnxXI24dZzaOMRnRRcVL4OqoMPDfjaUvgEscq+SdT3yomm
	LBFDszxeq0YgUwrz7TZMXYVamlw0sSfxnofr8i5GZJxEbR9Oe/8U60gUwHWlNkJF9nW1ql5Hc1EG+
	M8CGoaxqPL7OnSYPn7/eCjRENrsSLc05+JnKXwlIh76CUwysZV6BhvdRgn5+9e7K5ZKkhbNG4GtiD
	cUSlPRhdxl8jFAa1PLH7hP7coHJVggCPuXkCgsBMAqzkUM7UeLao6UoJPMXguMSfHLcSwCmarY5rd
	K7e5Qk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LY9-00000005ESx-3Fd0;
	Tue, 15 Sep 2026 05:17:45 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LY6-00000005ESW-1jow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:17:44 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAB3Su7z1KhqhJMJCA--.51114S2;
	Tue, 15 Sep 2026 13:17:40 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank.Li@nxp.com
Cc: daniel.lezcano@kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	shawn.guo@linaro.org,
	tglx@kernel.org,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 2/6] clocksource/drivers/mxs_timer: Fix clock reference leak in mxs_timer_init
Date: Tue, 15 Sep 2026 05:17:11 +0000
Message-Id: <20260915051711.1727701-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3Su7z1KhqhJMJCA--.51114S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyUGFyUJw43ur17GFWkXrb_yoW5JF43pw
	s7W3y5tr1UXr4Sg3Wftr1qqF9xKayIkF9rGr1fG3Z7Ar43A34jyFyUJFyqq3WakrWkAw43
	Za1rJrs5CFyUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUr6wZDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAILA2qowzNBSAAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_221742_829806_FF17A5FE 
X-CRM114-Status: GOOD (  14.99  )
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

mxs_timer_init() looks up the timer clock with of_clk_get(), which takes
a reference on the clock, but no clk_put() exists anywhere in the
driver. The reference is leaked on every return path after the clock
has been obtained:

- clk_prepare_enable() failure,
- mxs_clocksource_init() failure,
- mxs_clockevent_init() failure,
- irq_of_parse_and_map() failure,
- request_irq() failure,
- and on success, where the clock is intentionally left enabled for the
  timer but the local timer_clk pointer is lost.

Add proper error unwinding: on failure of clk_prepare_enable() only the
reference is dropped, on the later error paths the clock is disabled and
unprepared before the reference is dropped, and on success the reference
is dropped while keeping the clock enabled.

Fixes: 2efb950465e9 ("ARM: mxs: look up timrot clock from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/mxs_timer.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/mxs_timer.c b/drivers/clocksource/mxs_timer.c
index e52e12d27d2a..dd58d7505797 100644
--- a/drivers/clocksource/mxs_timer.c
+++ b/drivers/clocksource/mxs_timer.c
@@ -215,8 +215,10 @@ static int __init mxs_timer_init(struct device_node *np)
 	}
 
 	ret = clk_prepare_enable(timer_clk);
-	if (ret)
+	if (ret) {
+		clk_put(timer_clk);
 		return ret;
+	}
 
 	/*
 	 * Initialize timers to a known state
@@ -256,18 +258,32 @@ static int __init mxs_timer_init(struct device_node *np)
 	/* init and register the timer to the framework */
 	ret = mxs_clocksource_init(timer_clk);
 	if (ret)
-		return ret;
+		goto err_clk_disable;
 
 	ret = mxs_clockevent_init(timer_clk);
 	if (ret)
-		return ret;
+		goto err_clk_disable;
 
 	/* Make irqs happen */
 	irq = irq_of_parse_and_map(np, 0);
-	if (irq <= 0)
-		return -EINVAL;
+	if (irq <= 0) {
+		ret = -EINVAL;
+		goto err_clk_disable;
+	}
+
+	ret = request_irq(irq, mxs_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
+			  "MXS Timer Tick", &mxs_clockevent_device);
+	if (ret)
+		goto err_clk_disable;
+
+	clk_put(timer_clk);
+
+	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(timer_clk);
+	clk_put(timer_clk);
 
-	return request_irq(irq, mxs_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
-			   "MXS Timer Tick", &mxs_clockevent_device);
+	return ret;
 }
 TIMER_OF_DECLARE(mxs, "fsl,timrot", mxs_timer_init);
-- 
2.34.1


