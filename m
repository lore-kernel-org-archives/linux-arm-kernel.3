Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21560C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJEGgvgnN1hym5yIpfDS0W2oDSWIdSPnh+cxxfZttlQ=; b=XaEv3oWRwuUkqC+E9lVDeWv5dx
	UdLqVgRHT3wg/OqjUtZF+64bs0WXCDs04O4gTWVpde2I5EcjmTz2rKy2kjUcfd5zZO2K/m6CrmVtQ
	DvOh2qT9sMsBAAg/Nbz/7TOaQitCEqlJR259vnD25V5TPE2yesgi2gZXaUY12QPpu1pVZWA/viPrl
	SJXGyNPdONhGQjUkxNoKB1qd9siFMyQMCSE1dES4vmm+8ygJO6Y6k47yvz9E+5Lql4gTuSmqgq7S0
	MmOUB/aXHN2frGarA7EEPczmthKo2xqvIwd7hoBk2f9f2RLuxhbgHclWhkstA27srmJdWUCP6Kfyg
	FKor7DYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cP6-00000007LV6-3tie;
	Mon, 07 Sep 2026 16:41:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOz-00000007LQQ-1rrH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37B334387D;
	Mon,  7 Sep 2026 16:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26031F00A3D;
	Mon,  7 Sep 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799261;
	bh=LJEGgvgnN1hym5yIpfDS0W2oDSWIdSPnh+cxxfZttlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mHJZGIiO+b4ld5TXPrhQUYQg1gt+4WRfvj7fDMWLG6LBnRMyU+izkaFl/m/yW1kuR
	 H253JRi5LDDFu++KHhvMqmblxkZ/SjnpQCLFvuLHHDLavXF9/XwiyHZIcMumGWD2Ck
	 OOZdrPq/8OLdXF1PnfUAYZKoISCSg8krsb2P0sgqhtU766Icv8tXH+swRwPYZxr0Zr
	 Q1TGAXkcmCWH6KEAkLIPL67waOSbKCnLA5vnudzF3RJtHcpWMAK9S/AzJhe+8RfBdP
	 roYUzxNulv+rNbZ6+JcPxSAuTwdSCQ5d0kiKbnpwzRu1FPIS9IWmWSMdVUlfpxkBba
	 eaD9GO7sfkusA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 09/19] arm64: smp: Defer RCU registration during secondary CPU bringup
Date: Mon,  7 Sep 2026 17:40:12 +0100
Message-ID: <20260907164024.17164-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
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

Calling rcutree_report_cpu_starting() early during boot can lead to
livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
on an RCU grace period while the CPU being onlined is spinning in
cpuhp_ap_sync_alive().

In preparation for enabling the generic CPU hotplug code on arm64, split
up the trace_hardirqs_off() call during secondary CPU bringup so that we
update lockdep early but defer the tracing updates until after
notify_cpu_starting() has registered the new CPU with RCU, allowing us
to drop the explicit call to rcutree_report_cpu_starting() entirely.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 5 ++---
 include/linux/rcutree.h | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index f4cabf9e19e6..ff68640d0c0b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -217,8 +217,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
-	rcutree_report_cpu_starting(cpu);
-	trace_hardirqs_off();
+	lockdep_hardirqs_off(CALLER_ADDR0);
 
 	/*
 	 * If the system has established the capabilities, make sure
@@ -242,6 +241,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Enable GIC and timers.
 	 */
 	notify_cpu_starting(cpu);
+	trace_hardirqs_off_finish();
 
 	ipi_setup(cpu);
 
@@ -411,7 +411,6 @@ void __noreturn cpu_die_early(void)
 
 	/* Mark this CPU absent */
 	set_cpu_present(cpu, 0);
-	rcutree_report_cpu_dead();
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
 		update_cpu_boot_status(CPU_KILL_ME);
diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
index 16a04202888b..e6ad4f2a475c 100644
--- a/include/linux/rcutree.h
+++ b/include/linux/rcutree.h
@@ -116,7 +116,7 @@ int rcutree_offline_cpu(unsigned int cpu);
 
 void rcutree_migrate_callbacks(int cpu);
 
-/* Called from hotplug and also arm64 early secondary boot failure */
+/* Called from hotplug */
 void rcutree_report_cpu_dead(void);
 
 #endif /* __LINUX_RCUTREE_H */
-- 
2.55.0.979.g7e5102b832-goog


