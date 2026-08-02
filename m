Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8875C55180
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEzw2i7HRKSDGO8dkn+XkGr8/pmxZoR0KreFTkdRu2g=; b=FRQ25rigX9t0W0NPynG/JpysNy
	KVfTFREHrqb7UXfjsac0rkb+Va1jQQdKcMHkQoo54oqKn6hJDLvqEwaOt0jX/fGMa+DHVNKlIxWK4
	omOUEX7qkgxUOs3nHbysM0XDtjIIr9jVe4vP/kTg4iivta1WzMy2OJkphylMUJgG2ik77uslkGKuD
	+cxQDqcxQqzMp3l8YzluKW+5DtiZk+YzdFkqplykhrGREyARFv0lc57sUeyyVbr/qyvcDT0oWkalm
	BbXjtUoFmLCyAS8HFy31SpbxzO4LKhd666mziaSEOkO0EMKldy9ZCJW3QUp52YjfdhfwLV7TOgTUX
	mFQddbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRY-0000000Fqmv-0NQk;
	Sun, 02 Aug 2026 16:53:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRW-0000000FqlM-2zDC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 784BF43F86;
	Sun,  2 Aug 2026 16:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7F11F00ACF;
	Sun,  2 Aug 2026 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689622;
	bh=dEzw2i7HRKSDGO8dkn+XkGr8/pmxZoR0KreFTkdRu2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hZPwECgLePdW81OBR1YR4NyrGRDDIKetg8utx56Gs5HhhCA9+DOL7gMeRG4i2U4mm
	 ZNGmprY/crJiz0WWdjdjn78Mruk/vcbbGqyHJLo0JU8rf/jbWK07omNTXGI27b88mL
	 KhZ/ASyNRc2DboxnoDIukeYNZMEOH/fxoxO0tNS4p+ZxXnARs4XOIuX/dxkOMh5ID+
	 62b1KL9sh0Khy9z9Kh0PcG9v4WwvntCWcfGSVvZJdUcFP90+D1H/pjACczB4iGfohJ
	 +l0FxFMYx5knd5ZIli4kKnqnqmC5D1TZzhoF2Bj/E60SgLd1BE9cwdnMQagP2sn8Xs
	 FScbAHyg+UDoA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRU-0000000BVIZ-1kBi;
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
Subject: [PATCH v3 4/8] clocksource/drivers/arm_arch_timer: Drop the arch_counter_get_cnt{p,v}ct_stable() accessors
Date: Sun,  2 Aug 2026 17:53:23 +0100
Message-ID: <20260802165327.385217-5-maz@kernel.org>
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

Further simplify the counter accessors by eliminating the *_stable()
ones, which serve little purpose at this stage.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 38 +++++++++-------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index f645aa562895b..5085e87706f99 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -100,19 +100,12 @@ static noinstr u64 raw_counter_get_cntpct(void)
 	return __arch_counter_get_cntpct();
 }
 
-static notrace u64 arch_counter_get_cntpct_stable(void)
+static notrace u64 arch_counter_get_cntpct(void)
 {
-	u64 val;
-	preempt_disable_notrace();
-	val = __arch_counter_get_cntpct_stable();
-	preempt_enable_notrace();
-	return val;
-}
-
-static noinstr u64 arch_counter_get_cntpct(void)
-{
-	if (arch_counter_broken_accessors())
-		return arch_counter_get_cntpct_stable();
+	if (arch_counter_broken_accessors()) {
+		guard(preempt_notrace)();
+		return __arch_counter_get_cntpct_stable();
+	}
 
 	return __arch_counter_get_cntpct();
 }
@@ -125,19 +118,12 @@ static noinstr u64 raw_counter_get_cntvct(void)
 	return __arch_counter_get_cntvct();
 }
 
-static notrace u64 arch_counter_get_cntvct_stable(void)
+static notrace u64 arch_counter_get_cntvct(void)
 {
-	u64 val;
-	preempt_disable_notrace();
-	val = __arch_counter_get_cntvct_stable();
-	preempt_enable_notrace();
-	return val;
-}
-
-static noinstr u64 arch_counter_get_cntvct(void)
-{
-	if (arch_counter_broken_accessors())
-		return arch_counter_get_cntvct_stable();
+	if (arch_counter_broken_accessors()) {
+		guard(preempt_notrace)();
+		return __arch_counter_get_cntvct_stable();
+	}
 
 	return __arch_counter_get_cntvct();
 }
@@ -342,10 +328,10 @@ void erratum_set_next_event_generic(const int access, unsigned long evt,
 	ctrl &= ~ARCH_TIMER_CTRL_IT_MASK;
 
 	if (access == ARCH_TIMER_PHYS_ACCESS) {
-		cval = evt + arch_counter_get_cntpct_stable();
+		cval = evt + arch_counter_get_cntpct();
 		write_sysreg(cval, cntp_cval_el0);
 	} else {
-		cval = evt + arch_counter_get_cntvct_stable();
+		cval = evt + arch_counter_get_cntvct();
 		write_sysreg(cval, cntv_cval_el0);
 	}
 
-- 
2.47.3


