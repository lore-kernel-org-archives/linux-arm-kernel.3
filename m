Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78739CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7kltxc9AxkHU+Y8mgVevfgEZLiChPaiG8eQ8e+4t/g=; b=JzQf5o0zJ8s3J6DO3LBWHlH4m5
	z823OFpxxdrZlwpdHKU9ZSuaWNFPTIjV6+4awxJgaS2i16zYqQ/0XPg/6LWQrPmKup9z7QQpk6Agn
	qkx09RwUCJs7Erpka/8+BmPuC31FYbGSlC4BBnn2ApCpc/1fm+XPosc5Xg+4U79YoZpoeRSCLOozZ
	zZ/STLIdCCM9AeG+m7GyP7urYSYPAufrK8jPPJG8T4uYwVmtU9XPy3WLU6faI5w2N0dkag9b/HuMl
	k9XNMkdsKW/1ZQtT5W6Ypb5SQzajp/gRnOjJPQgclipswGLYcROP3U5ZQ/hHvwFw2zeZooE1iW6uE
	OhZ8t7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBCi-0000000DiYd-1XKo;
	Wed, 13 Aug 2025 13:07:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAAp-0000000DaY1-11zC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 12:01:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5758312FC;
	Wed, 13 Aug 2025 05:01:34 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 204DA3F5A1;
	Wed, 13 Aug 2025 05:01:39 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 5/5] arm64: make the per-task SCTLR2_EL1
Date: Wed, 13 Aug 2025 13:01:18 +0100
Message-Id: <20250813120118.3953541-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813120118.3953541-1-yeoreum.yun@arm.com>
References: <20250813120118.3953541-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_050143_325601_7DEBE931 
X-CRM114-Status: GOOD (  11.09  )
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

SCTLR2_EL1 register is optional starting from ARMv8.8/ARMv9.3,
and becomes mandatory from ARMv8.9/ARMv9.4
and serveral architectural feature are controled by bits in
these registers and some of bits could be configurable per task
not globally -- i.e) FEAT_CPA2 related field and etc.

For future usage of these fields, make the per-task SCTLR2_EL1.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/processor.h | 5 +++++
 arch/arm64/kernel/process.c        | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 61d62bfd5a7b..2c962816de70 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -184,6 +184,7 @@ struct thread_struct {
 	u64			mte_ctrl;
 #endif
 	u64			sctlr_user;
+	u64			sctlr2_user;
 	u64			svcr;
 	u64			tpidr2_el0;
 	u64			por_el0;
@@ -258,6 +259,9 @@ static inline void task_set_sve_vl_onexec(struct task_struct *task,
 	(SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
 	 SCTLR_EL1_TCF0_MASK)
 
+#define SCTLR2_USER_MASK	\
+	(SCTLR2_EL1_EnPACM0 | SCTLR2_EL1_CPTA0 | SCTLR2_EL1_CPTM0)
+
 static inline void arch_thread_struct_whitelist(unsigned long *offset,
 						unsigned long *size)
 {
@@ -370,6 +374,7 @@ struct task_struct;
 unsigned long __get_wchan(struct task_struct *p);
 
 void update_sctlr_el1(u64 sctlr);
+void update_sctlr2_el1(u64 sctlr2);
 
 /* Thread switching */
 extern struct task_struct *cpu_switch_to(struct task_struct *prev,
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 96482a1412c6..9191180c4875 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -698,6 +698,11 @@ void update_sctlr_el1(u64 sctlr)
 	isb();
 }
 
+void update_sctlr2_el1(u64 sctlr2)
+{
+	sysreg_clear_set_s(SYS_SCTLR2_EL1, SCTLR2_USER_MASK, sctlr2);
+}
+
 /*
  * Thread switching.
  */
@@ -737,6 +742,10 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	if (prev->thread.sctlr_user != next->thread.sctlr_user)
 		update_sctlr_el1(next->thread.sctlr_user);
 
+	if (alternative_has_cap_unlikely(ARM64_HAS_SCTLR2) &&
+	    prev->thread.sctlr2_user != next->thread.sctlr2_user)
+		update_sctlr2_el1(next->thread.sctlr2_user);
+
 	/* the actual thread switch */
 	last = cpu_switch_to(prev, next);
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


