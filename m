Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47C6C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a/iC5zjIZl1+yxWZkKQgEAnwYE6tHACp2aQjXaciqo=; b=tW7TREcebQWfsNBW+cUfv+mLHW
	BwJ21/gCgDp0/hub9ABTs4NJtCragAtUH996C3SgG+M9qLn8IXAtm7zZZ2l5SOaKy2ltC2FtuYtju
	7d5elqYQ88IlbZ821MpmjVx7koB13lOCQzTP4hNpzqyLjcCov14XPvXGnj1Aok1MqLBBbcHffzqEe
	UdrwF211DSChGsxLEBVEIuz7y6wAS3ZUsapoVUvAH3I0s8yNG4Pk1veCvh8m+7OOmDmKKeTO0LmkH
	ivdTcFmzJeWod6lVHCagyrtf9VTiLNs7B+dq54hYgwoN5Fdnld4R9VIKOJt0VTapJ+omYEWIHsWZ6
	Tox/FsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOq-00000007LKs-0Ox7;
	Mon, 07 Sep 2026 16:40:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOo-00000007LK3-1QMg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:40:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8A0A602C8;
	Mon,  7 Sep 2026 16:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346321F00A3D;
	Mon,  7 Sep 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799249;
	bh=0a/iC5zjIZl1+yxWZkKQgEAnwYE6tHACp2aQjXaciqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jmKzXbtp/XFzVXuQ0ObYir5nG2l4DtxVWqG4ztdZKe/OuMmrnbn+pMu0hbGlXCir2
	 aJKxp3dmesHH8d+bW1Lew1SSOTBNWUMiBzUV7YgbWb4XaheDHyNvMGZzm1qXvDMHME
	 7kyh1pNiujEpMmMlRNY3JdMf1dY1QXypQJNeSwlhnYgiOWQ53kCmiPTq7w7oTQtSQ+
	 brMx+dBmZAbfUOauVcMlVYJtCh+ZSDQrrlf6LFRSGNzMqsSuXj14zgM344yb5EIamd
	 xjv37Y2RsgnlGufseee9IXP27P5Is4MQVTrjtNeADYW7ueUNDZ6CDUZZov8Xf8Hcx3
	 O7Q+808rBEchg==
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
Subject: [PATCH 05/19] arm64: smp: Tidy up smp_prepare_cpus()
Date: Mon,  7 Sep 2026 17:40:08 +0100
Message-ID: <20260907164024.17164-6-will@kernel.org>
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

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..ff045080ca1b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -779,16 +779,14 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
-	int err;
 	unsigned int cpu;
-	unsigned int this_cpu;
+	int err;
 
 	init_cpu_topology();
 
-	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
-	numa_store_cpu_info(this_cpu);
-	numa_add_cpu(this_cpu);
+	store_cpu_topology(0);
+	numa_store_cpu_info(0);
+	numa_add_cpu(0);
 
 	/*
 	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
@@ -803,8 +801,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.55.0.979.g7e5102b832-goog


