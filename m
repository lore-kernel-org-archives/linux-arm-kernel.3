Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45985CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFqNUHgtr9PkP2WwJaLdLlpg5aOtccHbVLJTUz5f3OQ=; b=DTc4kjfQSZRIsbsKEFQaUwcRBU
	qAtXDqovar1926+fpNlka8p7QaKLAEVLaZYBagPXDB9XpjosH6WiUBz5A1+AGeoXrPGL2GF9kT6Pc
	e8BR5f+RH1b33Zgk+3sjY+TTJZ+GwSiUL2qO1sx25R1ldeTwp5KVoZxEJeCnTgXJD5eczBxOKWqMC
	sXSEEjMIr0MnJRW54OU2yqCDUeHnmd/SfaAH5nssIXZmuBO+Dy40XXM3Fh/dHKw9BD7CyzzOHP02i
	/nWF4Tldl13TV+UlRUHhX6JE3uKrCcTyQPIDlDAoMSZTWKdHZJ7ikePjy5iyjIcOMLbzWwxVUTxWi
	7+ZVSzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHim-000000068ql-3Yu4;
	Fri, 08 May 2026 09:42:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHil-000000068q8-3SM3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E49C6024D;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4936C2BCB0;
	Fri,  8 May 2026 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233330;
	bh=PlhXgFp9jn4wn5ui/B/bv4QBDAuir3YiMvnBhoH2GEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfOqay7m0XDF7hpxiOAOaXgcZP2bx1c3vwOs9hV3L8d0IcINm40zmcHNhRXFI8+ZJ
	 Wjv018pVQ/TwsYU5jwjGjLB3fPLMMIYDYaLT2dEzq/BXZDWCFnLpScYcETeRW9ILkP
	 vOCpAezcL62/Hqju/d4HA/+VdkVoFr8rA3g5K1eCurMgsIutf16oFhZsEuO+lFH9rJ
	 sBFvAamqqSb/VKts1qrfjafPAvYbK9+wY+Oh55UC75cBF0QhDB5yBEQPSv4jWDYyOJ
	 MY7C382sylb+bqVNSBtZ7vCycvlxE7Ve/dmcM7/lowFcq46Ys4UrxXljpUx5HKXbi7
	 VVg3IOm/BAy5w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wLHii-00000000HJz-3yMe;
	Fri, 08 May 2026 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v2 2/5] clocksource/drivers/arm_arch_timer: Convert counter accessors to a static key alternative
Date: Fri,  8 May 2026 10:42:00 +0100
Message-ID: <20260508094203.2913880-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508094203.2913880-1-maz@kernel.org>
References: <20260508094203.2913880-1-maz@kernel.org>
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


