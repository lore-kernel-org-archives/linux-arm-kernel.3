Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A551FCCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViPzMqMMtYsXD2twtgRR0dhAxzp9lQPh6+izbO2fRX0=; b=F4iYc4I+9XBv9JMH5w7jKjvdcy
	Mz1ql73Xr6hfdljsvNmSqa6YKhnunC2+GACY0H4+S4+HukeTHpLh8Mpo0NsiD6eu0nkHZqqtOqllE
	CloQryjrUBFEOYf9W7sFXNETTWXNIH/kIHNf2cM9nTqC/yRGz5hlv9k+/K5yxuGylkUVyXoAtDsIc
	hgNjp2fJ7tXZTV7fq2rHVlg98Et4chyS5pEWQCbQ3SgCnisGeipfP3sDNRVFlYTFk7a4BxrQWj5c+
	maSg4FyUhDKaq60TsjjuS34RQDDexdLE6b4pON7LTUIRXIEn0YYY924BcD2WyBVICPChJNjoMvg0x
	/NYOnQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7r-00000007T6U-1WWF;
	Mon, 19 Oct 2026 13:10:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7q-00000007T5K-0luH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E68360238;
	Mon, 19 Oct 2026 13:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C471F000C5;
	Mon, 19 Oct 2026 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415401;
	bh=ViPzMqMMtYsXD2twtgRR0dhAxzp9lQPh6+izbO2fRX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VmqdzGiCKgvstUEqVR2BglPOe5LKWWO9W9V/oXmhCRIV5E0DJnZJloDgfjzQWeNTy
	 ChOBZ4eOFyPHTgN0pgLEBHSaSIwxiCQwtN0OOzHuUCbf+B82vPlbeof1hXjI3Ub+fz
	 /Ej1WvwxSNpggi/xEQ8ehQyqE9OG1ZnPDhy/PrNPowdGY0Rt8X5BLWXX6MaOGdVZ3Z
	 clXvyx47u2RFDip8O21nOI2lnpyYjO7Pu+E2mZJ+lz9/tKu2ksklUKrOPTvQgmJy+8
	 HNGUTfOR5kxWQ8kASR5kF2b0LwjfIwc3HorGrfIYtMxOV2ctgl5KV+h+0r/Ml7phZx
	 eItNbsi+dSV+g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [RFC PATCH 19/49] perf/arm_pmu: Move CPUHP_AP_PERF_ARM_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:26 +0200
Message-ID: <20261019130856.49711-20-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here just disables the IRQs for each PMUs, which
shouldn't expose any specific race while other CPUs are running.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 7d7e2d1eda9b..95cc6655cf7b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_ACPI_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_ARM_ACPI_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_ARM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


