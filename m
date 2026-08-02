Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0E3C55180
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1E7eRaD45mE8Ul8FpAjG4IxkSoELLrr3ZiMXm4Q0lg=; b=blhSugjhuktWSlmSbfDII6P46R
	HsMOFTvgoBzKN+mEEMzcxl8T2xBG+JPXpWuoemBMZwtJYdma6RZsIyDDAVHsgkncFCAFLF6EV/IXJ
	ShvJu3eV4oNBKbKZhmZ/QbeAYb40mCMAIt4tueRUCV2lJeJP9LAjUuN2MJnmZqjKrYq+djwPjjSB0
	bY5y681rTDf1c0vpWXRTZEoTRaAuINcxW1pyQpGFSKRXG+R4VGCHpNCbYXHuQkRhkI80Cw2+tt9Ds
	puYL7i1rCBkgao89pkirq87YGTMI+BcadujrtZcrfPHes8LmoNJ5+kttCWZEdTbyRFmAqtcNVFbgO
	WwTScMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRY-0000000FqnT-17G8;
	Sun, 02 Aug 2026 16:53:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRW-0000000FqlH-3XuW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 494EA60A89;
	Sun,  2 Aug 2026 16:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FF41F00A3E;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689622;
	bh=l1E7eRaD45mE8Ul8FpAjG4IxkSoELLrr3ZiMXm4Q0lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P/s9zczNz132ZOtuHL3raiD+3ZJ7B879S6nJaCwPAU7opM9PJcnHK4if8lD5WO74d
	 XWEsGOQm/OH3c8Bj61MrvEpm2zvyTw5+Qu0nvy1p+s0wOx1PH/QIb9AJasm1v6E3AW
	 mgFAJJRot2my7SuocvMiy/GEg3E1CztBUKpcyMgmMwxJ+ePhDU9vJpY7u3k9sT4sxZ
	 Plzna+uSCiac3RGHx09ItFAxMIb/enwWuBIr2C9nlKHotGyFj0otOthpMUw2ndJsy4
	 UqB803E91mupNooSXFNs7sxixHRU1fbb1EdsMYe2GP2ZYTQmDKkR9CXjlpm7m6EeHe
	 n8KI1w4i88Udw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRU-0000000BVIZ-0F1R;
	Sun, 02 Aug 2026 16:53:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 3/8] clocksource/drivers/arm_arch_timer: Convert counter accessors to a static key alternative
Date: Sun,  2 Aug 2026 17:53:22 +0100
Message-ID: <20260802165327.385217-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Now that we have a reliable static key to control whether our
counter accessors need to be worked around, use it in these
accessors and simplify the logic that picks which accessor to use.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 44 ++++++++++++++--------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 8ee317e33c864..f645aa562895b 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -92,9 +92,12 @@ static int arch_counter_get_width(void)
  */
 static inline bool arch_counter_broken_accessors(void);
 
-static noinstr u64 raw_counter_get_cntpct_stable(void)
+static noinstr u64 raw_counter_get_cntpct(void)
 {
-	return __arch_counter_get_cntpct_stable();
+	if (arch_counter_broken_accessors())
+		return __arch_counter_get_cntpct_stable();
+
+	return __arch_counter_get_cntpct();
 }
 
 static notrace u64 arch_counter_get_cntpct_stable(void)
@@ -108,12 +111,18 @@ static notrace u64 arch_counter_get_cntpct_stable(void)
 
 static noinstr u64 arch_counter_get_cntpct(void)
 {
+	if (arch_counter_broken_accessors())
+		return arch_counter_get_cntpct_stable();
+
 	return __arch_counter_get_cntpct();
 }
 
-static noinstr u64 raw_counter_get_cntvct_stable(void)
+static noinstr u64 raw_counter_get_cntvct(void)
 {
-	return __arch_counter_get_cntvct_stable();
+	if (arch_counter_broken_accessors())
+		return __arch_counter_get_cntvct_stable();
+
+	return __arch_counter_get_cntvct();
 }
 
 static notrace u64 arch_counter_get_cntvct_stable(void)
@@ -127,6 +136,9 @@ static notrace u64 arch_counter_get_cntvct_stable(void)
 
 static noinstr u64 arch_counter_get_cntvct(void)
 {
+	if (arch_counter_broken_accessors())
+		return arch_counter_get_cntvct_stable();
+
 	return __arch_counter_get_cntvct();
 }
 
@@ -950,21 +962,11 @@ static void __init arch_counter_register(void)
 	if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
 	    arch_timer_uses_ppi == ARCH_TIMER_VIRT_PPI ||
 	    arch_timer_uses_ppi == ARCH_TIMER_HYP_VIRT_PPI) {
-		if (arch_timer_counter_has_wa()) {
-			rd = arch_counter_get_cntvct_stable;
-			scr = raw_counter_get_cntvct_stable;
-		} else {
-			rd = arch_counter_get_cntvct;
-			scr = arch_counter_get_cntvct;
-		}
+		rd = arch_counter_get_cntvct;
+		scr = raw_counter_get_cntvct;
 	} else {
-		if (arch_timer_counter_has_wa()) {
-			rd = arch_counter_get_cntpct_stable;
-			scr = raw_counter_get_cntpct_stable;
-		} else {
-			rd = arch_counter_get_cntpct;
-			scr = arch_counter_get_cntpct;
-		}
+		rd = arch_counter_get_cntpct;
+		scr = raw_counter_get_cntpct;
 	}
 
 	arch_timer_read_counter = rd;
@@ -990,10 +992,8 @@ bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
 {
 	u64 (*rd)(void) = crd->read_sched_clock;
 
-	return (rd == raw_counter_get_cntvct_stable	||
-		rd == raw_counter_get_cntpct_stable	||
-		rd == arch_counter_get_cntvct		||
-		rd == arch_counter_get_cntpct);
+	return (rd == raw_counter_get_cntvct	||
+		rd == raw_counter_get_cntpct);
 }
 
 static void arch_timer_stop(struct clock_event_device *clk)
-- 
2.47.3


