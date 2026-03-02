Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D2EE9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N285Zr47KM3W59OSFBIWUWlbBHdfVUgOzq2vLCImGUc=; b=r0SzB95PcFPDylusBsJTDA719K
	mcz3g1ahzF1eI7dE8i6B8K14tdR9zVRK49KXOY8bECHksmVJTo1iI0OpQdZllrbomcgmIcw8mMw7z
	4+osFuNBoCKUdCx6V6NYH1OU6ARydqLfZhvdZJSRw01PIJl3jg6pEQs3tvu4kgU6X8LmC4oFi4Hww
	T5NOtkO9UigB2t5SyyVnZ1l7jEcNMF9B79vXDazHet1eiB8KlYdM5HjwpA9PbLJiFdAHhjw56wy2f
	VCStnefwMhY8ig+Zh6R3gUD6Sxdp0p3C+CNhFR5FgBj7JDMbWnn3I/CyuZEEQoDvSSqEsOAfhWkNE
	Celz82PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X5-0000000ChrN-2FJ4;
	Mon, 02 Mar 2026 10:29:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X1-0000000Cho3-2oHc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 797D4443BA;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54995C19425;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447382;
	bh=GPhoEjDGFx9BVoj9SRTvn0iSRPYFTMcD7bFsJRUCGDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l3F6z/jW+A8z82YaP3zHsuVBHvexBrIhfRhZQReaN3Ddt5SN5vWEXVJ/2GUjL048o
	 1uflU0jYNMkDevvjmG5NyWmq4mIiWZJoHuExXQTX4vsSXyy9vHtiuL348I7bi7Ofio
	 h67goqcaNFInfjTXFqPncylnCJ2DSN1emIouJLLG5HILQgyIRt6olz7PldklOTFsAI
	 61n9Y/NQIIpkAhLqHZ6HdHLmKBO0ADaTZeEhgF1AeDId7jKCTKTNOF8cS8xl47uMx1
	 E9wkcyUVh+NaorWUDioYMF+nUqFQv3WjroJYCWCJ2l2BxEZ3UiJ4AjLp3j1OFrnSUo
	 E/2idZuqoBPAA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx0Wy-0000000FBCc-0jt2;
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
Subject: [PATCH 1/5] clocksource/drivers/arm_arch_timer: Add a static key indicating the need for a runtime workaround
Date: Mon,  2 Mar 2026 10:29:33 +0000
Message-ID: <20260302102937.1516059-2-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260302_022943_748795_1963734E 
X-CRM114-Status: GOOD (  17.15  )
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

In order to decide whether we can read the architected counter without
disabling preemption to look up a workaround, introduce a static key
that denotes whether a workaround is required at all.

The behaviour of this new static key is a bit unusual:

- it starts as 'true', indicating that workarounds are required

- each time a new CPU boots, it is added to a cpumask

- when all possible CPUs have booted at least once, and that it
  has been established that none of them require a workaround,
  the key flips to 'false'

Of course, as long as not all the CPUs have booted once, you
may end-up with slow accessors, but that's what you get for not
sharing your toys.

Things are made a bit complicated because static keys cannot be
flipped from a CPUHP callback. Instead, schedule a deferred work
from there. Yes, this is fun.

Nothing is making use of this stuff yet, but watch this space.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 90aeff44a2764..c5b42001c9282 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -90,6 +90,8 @@ static int arch_counter_get_width(void)
 /*
  * Architected system timer support.
  */
+static inline bool arch_counter_broken_accessors(void);
+
 static noinstr u64 raw_counter_get_cntpct_stable(void)
 {
 	return __arch_counter_get_cntpct_stable();
@@ -555,10 +557,40 @@ static bool arch_timer_counter_has_wa(void)
 {
 	return atomic_read(&timer_unstable_counter_workaround_in_use);
 }
+
+static DEFINE_STATIC_KEY_TRUE(broken_cnt_accessors);
+
+static inline bool arch_counter_broken_accessors(void)
+{
+	return static_branch_unlikely(&broken_cnt_accessors);
+}
+
+static void enable_direct_accessors(struct work_struct *wk)
+{
+	pr_info("Enabling direct accessors\n");
+	static_branch_disable(&broken_cnt_accessors);
+}
+
+static int arch_timer_set_direct_accessors(unsigned int cpu)
+{
+	static DECLARE_WORK(enable_accessors_wk, enable_direct_accessors);
+	static cpumask_t seen_cpus;
+
+	cpumask_set_cpu(cpu, &seen_cpus);
+
+	if (arch_counter_broken_accessors()	&&
+	    !arch_timer_counter_has_wa()	&&
+	    cpumask_equal(&seen_cpus, cpu_possible_mask))
+		schedule_work(&enable_accessors_wk);
+
+	return 0;
+}
 #else
 #define arch_timer_check_ool_workaround(t,a)		do { } while(0)
 #define arch_timer_this_cpu_has_cntvct_wa()		({false;})
 #define arch_timer_counter_has_wa()			({false;})
+static inline bool arch_counter_broken_accessors(void)	{ return false ; }
+#define arch_timer_set_direct_accessors(c)		do { } while(0)
 #endif /* CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND */
 
 static __always_inline irqreturn_t timer_handler(const int access,
@@ -840,6 +872,7 @@ static int arch_timer_starting_cpu(unsigned int cpu)
 	}
 
 	arch_counter_set_user_access();
+	arch_timer_set_direct_accessors(cpu);
 
 	return 0;
 }
-- 
2.47.3


