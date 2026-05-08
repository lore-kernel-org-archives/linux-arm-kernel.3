Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5E3CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77NzOXsFscUEYSIPzpW63RovUXgHgTBaAIY3/pEj/Z0=; b=A7ngya3qbwJT1Nb/CjVPvEfuKo
	pJQStz7EItPvliXzMTv0YU5fCqSTb0ZT/xzixsGovpeSZqpg/Y/e/uv0avKSPS0Ij94vU/AYi7pln
	GBwMEwSbIH6p4FF6zMW/YEhmHPVPDYr1MA7lp9C0KmrnbeAoHzH9IofyUCEyWK7+VN63AT53zEDVU
	QSw6cv0Iu2QLIde29Bd9x2kxHuMeiIIU7VyX0tZ/1upQLgJ/xi5D8ub6jmBCCS7TTPekdCkgjWuIn
	nOI6J3Fwx8fDlLh6t7rWLLzWEB2Z4mOVXgy8oRajrjzHWJfW9YRzFGy560lmNm4urSDzwJvTfBAUd
	sBy76jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHiz-000000068z4-2nHX;
	Fri, 08 May 2026 09:42:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHiw-000000068v4-0pBD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 09:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=77NzOXsFscUEYSIPzpW63RovUXgHgTBaAIY3/pEj/Z0=; b=XakLRnHQ8uoiy9xDtF4CL5DMHC
	n/qGCWsYXNuzU5EIVGkvGred0Vd0ZPPY5v2qDB0AKdAx6L1qTJhWv0Ekcc2aVFHEazcZGzSl2nye0
	GfDxqBbQzX8ujNpniNKw+OLDnyk6VtDZ7wV9VIUW+QAWMsdQXyhhlQ04i/CWYeZlskWPqxtcOJDYX
	2C4mj0EY1vWldp/fHqbo23Y50gn2vTGN9By+Tx8ah0/LF67cHxmQNuWM2YLu/sI6Fd2SSsYt46MxL
	oZhzG8bztzdZmbYsBsFPxgcStnKn+/pWJEg/JUXifDWa4VZ+uBu1ZQtnG4+4OH13ZruNkD3DeECdZ
	lxTSCV9A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHim-00000005qTB-2vuo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BFBE443AE;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF666C2BCF7;
	Fri,  8 May 2026 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233330;
	bh=RWsHN5U+WMS2JsLtHvvjkJBwH8qQN/pVdfbYmms77H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eqmf2fbsQbA2BWPyWIMWJfUkvGnX1XSkcqElAl/39PV8yUZVZKrsjcu6eyfzZ29PN
	 PGSC1+cWZv0zzifpt79p8yA7mknws+KJmbQiEgjMIUOrhxh9BCVaA/ynvGEcjvHJ0r
	 xhq9bt5O8a+v81ITtamh17GXTQkoYWZwvkC9Aghrzm6lEULDxqJFYOnCEXmbxbxoad
	 Y9xJSM6JzwoLyW8uIvBNkpgbhQJ+IldsKxLWI4VSiEp1f+T02Vr5KgVVTTFCqxIbuP
	 aUuy1r3N24ArnE31hwc0JtMdbdV+Em5G4+z83FRcXkHFYL4r8oDq259fNwijm2AwfN
	 QxVGzH3i5hGiA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wLHij-00000000HJz-0Yy7;
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
Subject: [PATCH v2 3/5] clocksource/drivers/arm_arch_timer: Drop the arch_counter_get_cnt{p,v}ct_stable() accessors
Date: Fri,  8 May 2026 10:42:01 +0100
Message-ID: <20260508094203.2913880-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508094203.2913880-1-maz@kernel.org>
References: <20260508094203.2913880-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_104217_050486_F291362B 
X-CRM114-Status: GOOD (  12.36  )
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
index 723ba698b8c46..ee21804d6613c 100644
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


