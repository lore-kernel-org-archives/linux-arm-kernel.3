Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075FEC55179
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbS6tAMDWYU94iLSiqDXxb03HkeRPSt0gzD9443d824=; b=RvVY0OHX4osJFdbkrzwu7GWe/D
	ICcJ0+ObiTH66V1N7a3Aenh3h69GSEH6iGWc51EoCZNC8Hf6AT5TvnHEk5sIOeHgouh6XUCaeN8Rw
	1jfakOk32pO7hEQ7jNiyJBbHMimAl1R6Nc33II+4A8mSHWHYgkFo+MxxKRXAp+7v+VVXdP7lRWhJc
	wX70cPzRA3rrEuJdWbB8w5EKkw6UtxMV3AEoq8oktjFuKzcYnt4m/4KHnasgWSH4x2VKMIuihv0x4
	4/bEtayCAAhGcc9fDT576U5N5yRNgIwuICFbR5wZ61rVc0RwkUaMb9X/VlbippF/ptAZReM/zckJk
	btY6etlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRa-0000000Fqr6-3Vtq;
	Sun, 02 Aug 2026 16:53:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRY-0000000Fqm8-0dJS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 608384506E;
	Sun,  2 Aug 2026 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402DC1F00ADE;
	Sun,  2 Aug 2026 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689623;
	bh=KbS6tAMDWYU94iLSiqDXxb03HkeRPSt0gzD9443d824=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jd1MSEcN/ND/t2vB7gQSkN/B2k2z8ChAMwJrvoVaABc/BZrrWZBMNRnYJ7SW1Gi7O
	 DizMAR3jJqLHVyKn1rc16gE08VuEWeBMuTq3a2Jb+i89BC5rjvzJSAl9ugKUuxE3Uc
	 WelHoACDYW8QFPLMuq4LF1sGpY3pbun0AtFtkJlUl8UIQ7jmEWatEdKMtc6zZcgfrn
	 GgDIkrSemPXw2h993BMcKdRnEwbjxtsERjfL3dYRvpJGvZ24EBdwA4btAxtejsMuDc
	 vUqRp4tQIBOwrS9MUhW1BSwib2bLPZEJ91o7ldyxEWFPOYLyMD6yPShwdmlXEB8ubF
	 fTJ+Jm+gZZEjQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRV-0000000BVIZ-16iI;
	Sun, 02 Aug 2026 16:53:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 6/8] clocksource/drivers/arm_arch_timer: Add command-line control over the counter errata management
Date: Sun,  2 Aug 2026 17:53:25 +0100
Message-ID: <20260802165327.385217-7-maz@kernel.org>
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

While we now have a safe way to use "fast" accessors once all CPUs
have booted, this leaves people booting with maxcpus= on non-broken
hardware stuck with the "slow" counter accessors.

Give these people a way out by adding a new command-line parameter
aptly named clocksource.arm_arch_timer.cnt_errata, which allows
the user to promise that no erratum handling is required for the
counters by setting this value to 0.

Warnings will be emitted if the user has over-promised.

Suggested-by; Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 +++++++++++++
 drivers/clocksource/arm_arch_timer.c            | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f228..f0e6534269c2b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -830,6 +830,19 @@ Kernel parameters
 			loops can be debugged more effectively on production
 			systems.
 
+	clocksource.arm_arch_timer.cnt_errata=
+			[ARM64,EARLY]
+			Format: <bool>
+			Enable/disable the counter errata management.
+			Enabling it switches over to fast accessors once it is
+			known that no CPU requires any workaround while reading
+			the counters.
+			Disabling it will bypass workarounds when reading the
+			counters, even if not all the CPUs have been probed.
+			Warnings will be produced if the need for a workaround
+			is detected.
+			Default is enabled.
+
 	clocksource.verify_n_cpus= [KNL]
 			Limit the number of CPUs checked for clocksources
 			marked with CLOCK_SOURCE_VERIFY_PERCPU that
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 747f51d9225c2..b3b31d4f4815f 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -500,8 +500,10 @@ void arch_timer_enable_workaround(const struct arch_timer_erratum_workaround *wa
 			per_cpu(timer_unstable_counter_workaround, i) = wa;
 	}
 
-	if (wa->read_cntvct_el0 || wa->read_cntpct_el0)
+	if (wa->read_cntvct_el0 || wa->read_cntpct_el0) {
+		WARN_ON_ONCE(!arch_counter_broken_accessors());
 		atomic_set(&timer_unstable_counter_workaround_in_use, 1);
+	}
 
 	/*
 	 * Don't use the vdso fastpath if errata require using the
@@ -597,12 +599,22 @@ static void arch_timer_set_direct_accessors(void)
 	if (!arch_timer_counter_has_wa())
 		schedule_work(&enable_accessors_wk);
 }
+
+static bool cnt_errata_config __initdata = true;
+
+static int __init early_cnt_errata(char *buf)
+{
+	return kstrtobool(buf, &cnt_errata_config);
+}
+early_param("clocksource.arm_arch_timer.cnt_errata", early_cnt_errata);
 #else
 #define arch_timer_check_ool_workaround(t,a)		do { } while(0)
 #define arch_timer_this_cpu_has_cntvct_wa()		({false;})
 #define arch_timer_counter_has_wa()			({false;})
 static inline bool arch_counter_broken_accessors(void)	{ return false ; }
 #define arch_timer_set_direct_accessors()		do { } while(0)
+#define enable_direct_accessors(w)			do { } while(0)
+#define cnt_errata_config				false
 #endif /* CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND */
 
 static __always_inline irqreturn_t timer_handler(const int access,
@@ -955,6 +967,9 @@ static void __init arch_counter_register(void)
 	u64 start_count;
 	int width;
 
+	if (!cnt_errata_config)
+		enable_direct_accessors(NULL);
+
 	switch (arch_timer_uses_ppi) {
 	case ARCH_TIMER_PHYS_SECURE_PPI:
 	case ARCH_TIMER_PHYS_NONSECURE_PPI:
-- 
2.47.3


