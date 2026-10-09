Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A8CA601C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fh/ibUG4ROn92eBl4vXntF4MbFtHYKZc485nR/O2as=; b=H7W3Tq0YRb06PKFe2hdA13Ctm+
	IdZBYA8mzsPicYdiu0IJalRpP7kKPfJDrv6HxzfOeMUEKPldloU2sZ+qTPa+bTge+Ml3xOZLOPaxT
	QKztVaLs2nAVRdSKgGOvIBCw5D8PM+PWVXFpfBogE8SP8QwFv5BPD8VuKPnRyd9B4QJXEUOnFsjhh
	XT+Gsqel/mYd6/Yi/k633NqZv3CvvknUnKneRtFfJ6Ebm3R+VGgCw44ravangPBUSgn9RcAhFRLUg
	Y3/AIeqygGNEyVfgugGocaggkzAjQYLOKDPTznPixbiVxhlAL8CnjO91rpao7+LQRreCKbPKSI8/P
	YasCVQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wn-00000005zRi-40aV;
	Fri, 09 Oct 2026 10:08:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wn-00000005zR2-0Uhw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5E5440477;
	Fri,  9 Oct 2026 10:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865291F00893;
	Fri,  9 Oct 2026 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540516;
	bh=9fh/ibUG4ROn92eBl4vXntF4MbFtHYKZc485nR/O2as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=omKRlAYWMaL3WnjSO+85WikBdzEJWYVeCvfv0TMkkxoMYV7+NVDy2vN+7j0/FiT6T
	 NJPWQ3PI52bZNfBAlyZPLUlQ/xHT+vfmv+wqzlepuFOVLN2vK+CsqxV640HVX9PeAx
	 sSufkGIAMqtoAkkIUWJbGm4CH2SMcYraTUz2afXKbAE3FoiXOBLZXKPU6zVlUq2EmQ
	 vXwjn0w5mX1kj8XpM8yJ2gaYipRKwzR1Adf6r1aljDWHVvz+qsZ70dZLVDHvWI8Cwt
	 bUCcuIgh/ajNNDhWg7aYthp8eeeXz3KKhpEBAaN6CfTKz+F32z3a6VdzpjBkQcT7U+
	 TBhhWdF1lcyPQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 13/23] arm64: smp: Defer RCU registration during secondary CPU bringup
Date: Fri,  9 Oct 2026 11:07:24 +0100
Message-ID: <20261009100738.31288-14-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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
update lockdep early but defer the tracing updates until after the new
CPU has been registered with RCU, which itself is deferred until after
the early CPU compatability checks, allowing us to drop the explicit
call to rcutree_report_cpu_dead() entirely.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 6 +++---
 include/linux/rcutree.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index e1b15cab9ed6..014b163ce658 100644
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
@@ -235,6 +234,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+	rcutree_report_cpu_starting(cpu);
 	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
 
@@ -242,6 +242,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Enable GIC and timers.
 	 */
 	notify_cpu_starting(cpu);
+	trace_hardirqs_off_finish();
 
 	ipi_setup(cpu);
 
@@ -411,7 +412,6 @@ void __noreturn cpu_die_early(void)
 
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
2.56.0.385.gd3acb90ef8-goog


