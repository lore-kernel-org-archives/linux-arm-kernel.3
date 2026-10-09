Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE76CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pciEKS25dpug/ced4mPNEBtrY+PumTiiJQEVLgyrixs=; b=eU/hUQZw/oJL/D9GtbFEY+Q5Pm
	TY2aks1Akmoj1SOs0yExAHXenXjrIzAd37RuRH5xhk7kHWEIzuJI0WKqfX3P9z/ZTTPWSB7bLFvFa
	Y8pGY3D8Si8OIDMPeWNvj7E/ToXSjFRXwrqG9nTR6fE/ayLE7PlZTp31n9ta3MKLzQtuyo5RCD5Fr
	76MFigxc2EdjmU+tByKPigmHleyJQvJTzDR7008H55sDJpEeJigREcqU38aLROHjz7KEMVJi6txVF
	sJsvaO0iWAmh7Jcrd6kqgwa74u0vukNgSRSacvNm6uGx6Wbx0d/rinHTCEm7Vb7j93af/Y05XB5Q1
	1Gt+8Pwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WJ-00000005yys-45DS;
	Fri, 09 Oct 2026 10:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WI-00000005yxx-21vd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D8EB444FB;
	Fri,  9 Oct 2026 10:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BBA1F00899;
	Fri,  9 Oct 2026 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540486;
	bh=pciEKS25dpug/ced4mPNEBtrY+PumTiiJQEVLgyrixs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jxtK2YNOYNF4/hdw/e5V1EzKrOZXefqN+Po/UfvZEj9/Bj42YX8PqHYhPAv2n2SAq
	 RK2i77Os0W058P6t5x40DOVbgbRhM4extfOxyZD5Uoe+xYyW2MUZho7YUthi82eciE
	 EfGUOHE6Pa5MTm0iCNoZNbIIi6o/MyPxtzckL7g8dj+Vt0kuA8RF2yOItAr5H92qNU
	 PAHeMh9WaOoVj1hKNLs4epu/S/V1QpsLjupr3GFNGK6az5vHMFK4HjIKB7dbiShkOh
	 4xsn7a3ZJnj/3GBsy9mf+qoTqiB3FLRS/l3Q6lLUIkCCBWZC+EpQCQ9yYOY8lrb7kF
	 wXNB/Lyspnr7Q==
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
Subject: [PATCH v2 05/23] arm64: cpufeature: Check arm64_ftr_regs[] before the first store
Date: Fri,  9 Oct 2026 11:07:16 +0100
Message-ID: <20261009100738.31288-6-will@kernel.org>
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

From: Fuad Tabba <fuad.tabba@linux.dev>

sort_ftr_regs() sorts nothing. It checks that arm64_ftr_regs[] is in
sys_id order, which the binary search in get_arm64_ftr_reg() relies on,
and that no register's fields overlap. It runs at the top of
init_cpu_features(), after the boot CPU's __cpuinfo_store_cpu(). A
subsequent patch makes __cpuinfo_store_cpu() look registers up in the
table.

Rename it validate_ftr_regs() and call it from smp_prepare_boot_cpu(),
ahead of cpuinfo_store_boot_cpu().

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu.h   | 1 +
 arch/arm64/kernel/cpufeature.c | 5 +----
 arch/arm64/kernel/smp.c        | 2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 3c008821219c..f332fbd8e46d 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -75,6 +75,7 @@ DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
 void cpuinfo_store_cpu(void);
 void __init cpuinfo_store_boot_cpu(void);
 
+void __init validate_ftr_regs(void);
 void __init init_cpu_features(struct cpuinfo_arm64 *info);
 void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
 				 struct cpuinfo_arm64 *boot);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32102c3912fa..727e1665c987 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -962,7 +962,7 @@ s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
 	return ret;
 }
 
-static void __init sort_ftr_regs(void)
+void __init validate_ftr_regs(void)
 {
 	unsigned int i;
 
@@ -1207,9 +1207,6 @@ bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
 
 void __init init_cpu_features(struct cpuinfo_arm64 *info)
 {
-	/* Before we start using the tables, make sure it is sorted */
-	sort_ftr_regs();
-
 	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
 	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
 	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..eac217b9ebf1 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -455,6 +455,8 @@ void __init smp_prepare_boot_cpu(void)
 	 */
 	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 
+	/* Check arm64_ftr_regs[] before anything looks registers up in it. */
+	validate_ftr_regs();
 	cpuinfo_store_boot_cpu();
 	setup_boot_cpu_features();
 
-- 
2.56.0.385.gd3acb90ef8-goog


