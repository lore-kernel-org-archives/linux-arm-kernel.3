Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4746AD10384
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/2sleQPERirF84IZmHsEBmQRkNUB7aJZY7w8yQtudvo=; b=kRrXhsa1A1KWhjvEaPPJHrn2M+
	WZLg2Un50v8FiNs7jyflm8kZdF1SezMc8bSqjyzhx+8Oe7bRr8yNEABgUMz8kE6jTYdSbsbv0Tc3N
	aP3HQLqQ1oeq6TDnXMI1aLplKCgRj5K8jx1jxDN+LI8V6hpmlVXK4oIyd0/Oi2jNbig1869AEgj1e
	/mEejfcomObk4WuqBHsIIqZ2TPb4FA9IdOgmSTc18jM7M5/RTot4QfDZc1mdSUYWMOhSI+zm8ElyK
	Wuu/W7d5X4l9PTyR43q4gjelffFR0+VANIqfX3XH0Pu5192E/wsfiNXFH3TqFH+Y7EdZbDzPcmNqA
	cT/6lLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAEP-0000000EYER-0OxC;
	Wed, 26 Nov 2025 07:46:29 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAEM-0000000EYBs-0Xqw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:46:27 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowADneNtDsCZpZR8hAg--.1890S2;
	Wed, 26 Nov 2025 15:46:15 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Michal Simek <michal.simek@amd.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] clocksource: timer-cadence-ttc: Fix resource leaks in error paths
Date: Wed, 26 Nov 2025 15:45:59 +0800
Message-ID: <20251126074559.1709-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADneNtDsCZpZR8hAg--.1890S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw47JrykGF1fuFy3Jr4DCFg_yoW5GrWkp3
	yxu3s8tF4UX3yj9wsFqF1DZFZ7Ka10kFyxur1ak343urs8Wry7KFWUta4UuF1UGryxAw43
	X3WYyw43u34UZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUFdgXUUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsSA2kmkL1x6wAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_234626_539142_D11AA6AA 
X-CRM114-Status: GOOD (  11.70  )
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

The ttc_setup_clocksource() and ttc_setup_clockevent() fail to
unregister the clock notifier in their error paths, potentially
leading to a resource leak. Additionally, ttc_setup_clocksource()
leaks the prepared clock reference upon failure.

Unregister the clock notifier and disable the clock in the
error path of ttc_setup_clocksource(). Also, add the missing
clock notifier unregistration in the error path of
ttc_setup_clockevent() to ensure proper cleanup.

Fixes: e932900a3279 ("arm: zynq: Use standard timer binding")
Fixes: 91dc985c5e51 ("ARM: zynq: add clk binding support to the ttc")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-cadence-ttc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-cadence-ttc.c b/drivers/clocksource/timer-cadence-ttc.c
index b8a1cf59b9d6..70384faad66d 100644
--- a/drivers/clocksource/timer-cadence-ttc.c
+++ b/drivers/clocksource/timer-cadence-ttc.c
@@ -333,6 +333,7 @@ static int __init ttc_setup_clocksource(struct clk *clk, void __iomem *base,
 {
 	struct ttc_timer_clocksource *ttccs;
 	int err;
+	bool notifier_registered = false;
 
 	ttccs = kzalloc(sizeof(*ttccs), GFP_KERNEL);
 	if (!ttccs)
@@ -356,6 +357,8 @@ static int __init ttc_setup_clocksource(struct clk *clk, void __iomem *base,
 				    &ttccs->ttc.clk_rate_change_nb);
 	if (err)
 		pr_warn("Unable to register clock notifier.\n");
+	else
+		notifier_registered = true;
 
 	ttccs->ttc.base_addr = base;
 	ttccs->cs.name = "ttc_clocksource";
@@ -377,6 +380,10 @@ static int __init ttc_setup_clocksource(struct clk *clk, void __iomem *base,
 
 	err = clocksource_register_hz(&ttccs->cs, ttccs->ttc.freq / PRESCALE);
 	if (err) {
+		if (notifier_registered)
+			clk_notifier_unregister(ttccs->ttc.clk,
+					&ttccs->ttc.clk_rate_change_nb);
+		clk_disable_unprepare(ttccs->ttc.clk);
 		kfree(ttccs);
 		return err;
 	}
@@ -465,13 +472,16 @@ static int __init ttc_setup_clockevent(struct clk *clk,
 	err = request_irq(irq, ttc_clock_event_interrupt,
 			  IRQF_TIMER, ttcce->ce.name, ttcce);
 	if (err)
-		goto out_clk_unprepare;
+		goto out_clk_notifier_unregister;
 
 	clockevents_config_and_register(&ttcce->ce,
 			ttcce->ttc.freq / PRESCALE, 1, 0xfffe);
 
 	return 0;
 
+out_clk_notifier_unregister:
+	clk_notifier_unregister(ttcce->ttc.clk,
+			&ttcce->ttc.clk_rate_change_nb);
 out_clk_unprepare:
 	clk_disable_unprepare(ttcce->ttc.clk);
 out_kfree:
-- 
2.50.1.windows.1


