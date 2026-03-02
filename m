Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DBAE9B358
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFqNUHgtr9PkP2WwJaLdLlpg5aOtccHbVLJTUz5f3OQ=; b=fxsUCnHw3CEoCKKqOzOLYXSIjD
	5pHWMtyT70OBQr4aCqwOHCSFvLCASWC6DaNsd2lwrgjnttR2HVKOuCVCTWrxFvjVKwEzy1mtHkP/a
	vxhQLbGez8hPmB8lgclOckowr5y2tTxq8cQkCAXKzAiaRlyQxLNkUQHZ6puSbkL5Lem33y3P8K63B
	nyrW04hFDxfSLXY8Y501TXjG9vdTDhYJjZwzQvOJ3FrQEetw86oAzFeTb+fuBMkJEqVofUYHCZJCh
	o/ijik6f0cxRCIPuMrQFby0poxPgmJe+U9FRt/QsXgl+zUWmMfi0peuf7Nh/DUTeKZEzkktmxYInj
	eVUuFHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X5-0000000Chs4-3lTC;
	Mon, 02 Mar 2026 10:29:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X1-0000000Cho4-2o6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABF794445A;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EF9C2BCB0;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447382;
	bh=PlhXgFp9jn4wn5ui/B/bv4QBDAuir3YiMvnBhoH2GEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRSoUG62ioBFBeu7ATvGvmF+Cdu1gkDxyoo6VhjeackIcMX4q97YqQjy7MnSiJB+h
	 q84xkQM3/4xyhGH1fHAglPqmoU+0TXUt8LXzCSZQ2M8Qt69XMoxwf7XBLQTN3JBN+4
	 BRdBpAplrQ/+XEqkEtBZ22Oiivh9xl0+ZMW/HdW1glBWCtWQcoPItFLcysNYdo+OFF
	 nqH3Uk2sblMa0Y0hiGEd5Q8XvIvyndB0xEHq01POIyCDW+joPzqFKas+chJw7ERsZ5
	 iOU/PnrqjObytd1BeZfupXJ+aUeNTKqTJYMPK+w0yNW7CZg7A+fbIe0oG3SOdY2kwR
	 L0msueHO0HMPQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx0Wy-0000000FBCc-1Ywd;
	Mon, 02 Mar 2026 10:29:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 2/5] clocksource/drivers/arm_arch_timer: Convert counter accessors to a static key alternative
Date: Mon,  2 Mar 2026 10:29:34 +0000
Message-ID: <20260302102937.1516059-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302102937.1516059-1-maz@kernel.org>
References: <20260302102937.1516059-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022943_771044_720DB1EF 
X-CRM114-Status: GOOD (  13.60  )
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
 drivers/clocksource/arm_arch_timer.c | 38 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index c5b42001c9282..723ba698b8c46 100644
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
 
@@ -946,21 +958,11 @@ static void __init arch_counter_register(void)
 
 	if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
 	    arch_timer_uses_ppi == ARCH_TIMER_VIRT_PPI) {
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
-- 
2.47.3


