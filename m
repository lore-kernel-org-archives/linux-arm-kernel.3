Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9C3C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1zXqcqiOd+WDsiWIHrrLB/tx/lUneiLp7b9e9me1g+g=; b=rZJeQhPaEGX83uCWmcZi0M1hGw
	lzQi4GpMVsPhtwW+ALAOmrg0K1GW/rMloolrKtVk0W5S9m3DJX6NI2j1EKnilF7SJLzhdkb1AFbQ5
	ntxC0+YWh1bDgo/9p2iecHAg7NRoszlFZi2CoeBo/KNGjLgfnd+shwmL2vyFvtSUjhb8Y2Zc63sWz
	Nt4WOqioiGWfwNnMrDm3sej7EL4opqG8ABKrpycyfLdvour93e5JNPST/iEi8Z949BS7eJWcbJtce
	5+f3jZ1aJeKht0VdglZMClU9hsDQZP3yDPhlOsIadYZ//iRsUlTufU+5uZ34lSJMriyG98Si1Dlf8
	J16zhT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LHc-00000005DzZ-1sFT;
	Tue, 15 Sep 2026 05:00:40 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LHZ-00000005Dz9-0dY5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:00:38 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXqOzy0Khqp0cJCA--.668S2;
	Tue, 15 Sep 2026 13:00:34 +0800 (CST)
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
Subject: [PATCH] clocksource/drivers/timer-atmel-pit: Fix mck reference leak in error paths
Date: Tue, 15 Sep 2026 05:00:05 +0000
Message-Id: <20260915050005.1727060-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXqOzy0Khqp0cJCA--.668S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyDtw4kXw1xJF1DuFWDXFb_yoW5JFWkpr
	Wjqw45tr1kWay29rs2yFWDZr1kt3yIkFy7urW5C34fZwsxuryrXFW8Aa4UZFWDCF4kuanI
	q3Z7tFy8uFyDAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUJWrAUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwULA2qowpAzMQAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_220037_564277_6A6860A9 
X-CRM114-Status: GOOD (  12.12  )
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

at91sam926x_pit_dt_init() obtains the mck clock with of_clk_get() but the
exit label only frees the pit_data, leaking the clock reference on every
error path that reaches it. Once the clock has been prepared and enabled,
later failures leave it enabled as well, and the clk_prepare_enable()
failure path leaks the reference even though the clock was never enabled.

Add disable_clk and put_clk labels so the mck reference is always
released on error: clk_put() when prepare+enable fails, and
clk_disable_unprepare() followed by clk_put() when aborting after the
clock has been enabled. Error paths before the clock is obtained keep
jumping to exit, and the success path keeps the clock enabled for the
lifetime of the timer.

Fixes: a17686c46244 ("clocksource/drivers/timer-atmel-pit: Drop at91sam926x_pit_common_init")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-atmel-pit.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-atmel-pit.c b/drivers/clocksource/timer-atmel-pit.c
index 888b06731e54..794b4ce4d700 100644
--- a/drivers/clocksource/timer-atmel-pit.c
+++ b/drivers/clocksource/timer-atmel-pit.c
@@ -191,7 +191,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	ret = clk_prepare_enable(data->mck);
 	if (ret) {
 		pr_err("Unable to enable mck\n");
-		goto exit;
+		goto put_clk;
 	}
 
 	/* Get the interrupts property */
@@ -199,7 +199,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	if (!data->irq) {
 		pr_err("Unable to get IRQ from DT\n");
 		ret = -EINVAL;
-		goto exit;
+		goto disable_clk;
 	}
 
 	/*
@@ -227,7 +227,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	ret = clocksource_register_hz(&data->clksrc, pit_rate);
 	if (ret) {
 		pr_err("Failed to register clocksource\n");
-		goto exit;
+		goto disable_clk;
 	}
 
 	/* Set up irq handler */
@@ -237,7 +237,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	if (ret) {
 		pr_err("Unable to setup IRQ\n");
 		clocksource_unregister(&data->clksrc);
-		goto exit;
+		goto disable_clk;
 	}
 
 	/* Set up and register clockevents */
@@ -256,6 +256,10 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 
 	return 0;
 
+disable_clk:
+	clk_disable_unprepare(data->mck);
+put_clk:
+	clk_put(data->mck);
 exit:
 	kfree(data);
 	return ret;
-- 
2.34.1


