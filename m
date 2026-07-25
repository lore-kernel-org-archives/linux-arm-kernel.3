Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E15AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3003BYCZArT/0UP9QRyDsR1LnO7OFmFporFtwv650UM=; b=frijgpDZBmCJ9586KJguT44iTz
	jPG586M9MbIlCmA9n93smekKfz8kiJcsZirfLmcfxxoe4krDvTW9quoMTRxDGzevNqstLm23IGZF6
	bz/v2kByor7UKzoEF/7ieLb0SYMKB6dnkOjlQZNEmGiDU9SFHZOgUvyI703vZAPLgKhDyubG2YJTb
	7aa7d+jh6Sb4jo0QBTlEIsq2hpJX3x0voWjqNfUJ6/PC536oY0lztdvgLITvlT0lV4kjZhA0MjFLE
	t7tvgyzsKm0IPe+VgYpNjdl2fL9Jsc2vslQqQG12daQtBmtfUOAVWZG4LSHa9CeoVMyFODA/H1NaY
	GbYHMhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnadb-00000000I33-33Km;
	Sat, 25 Jul 2026 11:33:51 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnadZ-00000000I2h-0uT6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784979227; bh=+cmBvCWySQzLhKfWmPtp9rjSjfEJGBKKXbEo16iheG8=;
	h=From:To:Cc:Subject:Date:From;
	b=U2Y1AvV7YbCbbUt+dVubN2FyLQA95eRZFQ2bdWiY0KNB5ATJVio+r/M5w75IWAmSJ
	 ISnLZ/6ld0vqzaKoEuGX5j8Qn+oFToq4mqsBKXrZzt8M3rM5i83C8NbWslZ/aZ0Elv
	 ziO13yN44xDomfyUuLiPFzAb0iFNmjT2VgnoEuZ8=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before CTRL write
Date: Sat, 25 Jul 2026 13:33:38 +0200
Message-ID: <20260725113341.2250687-1-megi@xff.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043349_412990_564C4399 
X-CRM114-Status: GOOD (  16.46  )
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

From: Ondrej Jirman <megi@xff.cz>

The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
written again before it's cleared automatically."  Both time_stop() and
time_start() read-modify-write the control register, so a reload still in
flight gets rewritten and the write can be dropped, leaving the timer
unarmed.  In oneshot mode this happens on every tick, and the tick
eventually stops for good.

Wait for the reload to clear first.  All control register updates go
through sun4i_clkevt_time_stop().

Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
scheduling processes during boot or within a few seconds of executing
userspace. Only sysrq+t over serial port works at this stage, which is
how I discovered the root cause.

Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
device that would exercise it. And it's possible that this triggers more easily
with CONFIG_HZ=1000 which I use.

 drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 7bdcc60ad43c..2e7457f671c4 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -39,6 +39,9 @@
 
 #define TIMER_SYNC_TICKS	3
 
+/* The reload bit clears a couple of source clock cycles after it is set. */
+#define TIMER_RELOAD_MAX_POLL	100
+
 /*
  * When we disable a timer, we need to wait at least for 2 cycles of
  * the timer source clock. We will use for that the clocksource timer
@@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
 		cpu_relax();
 }
 
+/*
+ * The control register must not be written while a reload is still in
+ * flight, or the write can be dropped.
+ */
+static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
+{
+	int i;
+
+	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
+		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
+			return 0;
+		cpu_relax();
+	}
+
+	return -ETIME;
+}
+
 static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
 {
-	u32 val = readl(base + TIMER_CTL_REG(timer));
+	u32 val;
+
+	sun4i_clkevt_wait_reload(base, timer);
+
+	val = readl(base + TIMER_CTL_REG(timer));
 	writel(val & ~TIMER_CTL_ENABLE, base + TIMER_CTL_REG(timer));
 	sun4i_clkevt_sync(base);
 }
-- 
2.54.0


