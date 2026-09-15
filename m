Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C14C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gstheXSrbu7Pkh4pgJFIayc6UueUmd8/HWnjtHH1xn0=; b=W2OHAL2BcWZDtfh369hyj0NYoc
	N1DpO9AElmf6CwH0vER42Cunc08cl0IxK3oFy5i6VzwKY//jmCLa5JOXDoHKYS7qtiRIL3+Dfj5Sn
	7BXXsyoy+ZUEbugATGeOsdzEDjCLFj+qYIYIqK50gCqKIZspTRiy97kwpR9fWOTrf9q/OvlvpTT1h
	pLWdnO+8kyBJsqlJWdGzVnYhe2uc4k2gBF3NQ+jSlJmV0lDxRgEiBKhjzEmVFoKuayvznd48VRLUm
	o0t134ahrTCS7TFLElnk1QP7Ef6ikSc14jV9zDv+ESdVk81HQPEfWGsAMhU4LmrhJ4+znvARzK8sN
	hSi5TifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L9L-00000005Dbg-2IaB;
	Tue, 15 Sep 2026 04:52:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L9I-00000005DbI-2SbQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:52:06 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnvPDxzqhqoRoJCA--.51839S2;
	Tue, 15 Sep 2026 12:52:01 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: claudiu.beznea@tuxon.dev,
	daniel.lezcano@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.ferre@microchip.com,
	tglx@kernel.org,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] clocksource/drivers/atmel-st: Fix sclk reference leak in error paths
Date: Tue, 15 Sep 2026 04:51:32 +0000
Message-Id: <20260915045132.1726602-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADnvPDxzqhqoRoJCA--.51839S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWktF1kAFW8Jr43AF1xAFb_yoW8Zw1xp3
	yxK3yayr1kWayIgrsFvFWDJF9Yya9FkFyUGFWrKas7ZrsxJryUtFWfJr9FqFWUAF97Zw47
	try8tFn8uF18ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU19Xo7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAILA2qowzMrUAABsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_215205_084274_4A98B316 
X-CRM114-Status: GOOD (  13.24  )
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

atmel_st_timer_init() obtains the slow clock with of_clk_get() but never
releases the reference on error. If clk_prepare_enable() fails the
reference is leaked directly, and if the clock rate is invalid or
clocksource_register_hz() fails the error paths return without disabling
or putting the already enabled clock.

Add the missing cleanup to the three error paths: clk_put() when
prepare+enable fails, and clk_disable_unprepare() followed by clk_put()
when aborting after the clock has been enabled. The success path keeps
the slow clock enabled for the lifetime of the system timer and is left
untouched.

Fixes: adbaf5254152 ("clocksource/drivers/atmel-st: Convert init function to return error")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-atmel-st.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-atmel-st.c b/drivers/clocksource/timer-atmel-st.c
index 73e8aee445da..e333916f8236 100644
--- a/drivers/clocksource/timer-atmel-st.c
+++ b/drivers/clocksource/timer-atmel-st.c
@@ -222,12 +222,15 @@ static int __init atmel_st_timer_init(struct device_node *node)
 	ret = clk_prepare_enable(sclk);
 	if (ret) {
 		pr_err("Could not enable slow clock\n");
+		clk_put(sclk);
 		return ret;
 	}
 
 	sclk_rate = clk_get_rate(sclk);
 	if (!sclk_rate) {
 		pr_err("Invalid slow clock rate\n");
+		clk_disable_unprepare(sclk);
+		clk_put(sclk);
 		return -EINVAL;
 	}
 	timer_latch = (sclk_rate + HZ / 2) / HZ;
@@ -244,7 +247,14 @@ static int __init atmel_st_timer_init(struct device_node *node)
 					2, AT91_ST_ALMV);
 
 	/* register clocksource */
-	return clocksource_register_hz(&clk32k, sclk_rate);
+	ret = clocksource_register_hz(&clk32k, sclk_rate);
+	if (ret) {
+		clk_disable_unprepare(sclk);
+		clk_put(sclk);
+		return ret;
+	}
+
+	return 0;
 }
 TIMER_OF_DECLARE(atmel_st_timer, "atmel,at91rm9200-st",
 		       atmel_st_timer_init);
-- 
2.34.1


