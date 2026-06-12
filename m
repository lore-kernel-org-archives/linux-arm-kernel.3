Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C812ECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlOJEoz94FuxFi6Nw0eWYLZk82W0XKPPEF+zFyUMrwY=; b=BaB3toibCq1srBeO/Lxye4Vh8P
	Cbu02pjDfe1bLmufDhh+jLrKz9hLhLXIKa1YXqw+p++7C5nLm3zHOejWkcK1Km+lZYV9xSUX/57xG
	b7wrpAKRTXMQfbM4C3N8cu3QDn6IkCTSxdeJcqF9JPrQXLGpm1sE7RaC+2cuMwn0Bd90P5RsQfkhe
	0vynYXZeUOMTDtfONFDSbvYBPt4ImmcREBLxiMSxxHhnBxIWqk06lbMBr9o7QgBt7yUaFVfWAd9Rg
	fTwf5Tc3aNaJTttlZia1yyVchMgOD3NZxu3Qi+l5xkbWC+vxu5vdl2qOhZdEn4Z5+7WqWMsny7rB5
	IRLzCi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z8-0000000BSMX-30lA;
	Fri, 12 Jun 2026 19:29:18 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z4-0000000BSJC-0S8P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:15 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-4863c8d459eso1285462b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292552; x=1781897352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlOJEoz94FuxFi6Nw0eWYLZk82W0XKPPEF+zFyUMrwY=;
        b=bJPrrDSeOUb7DywXsPr4XHQGG0UIpDUlHFdZJ7LZ2PvUPNTylgryHwMUXCpE+MIKU/
         c8kjeHHO8WiQKEbZTZnmGO+MmbsCUAtJl6WCZ+YRpQ8a5M1I7ycj2/he8MOyFgLoBxSE
         jS2BUzKEBzTZYfPA+3B8eWnar1lyetNyvIjsYC6jecDeMUEqBFJNDWOv5ek9rkjygcqG
         fj36+AoU9HoR5LpbkLjIdqPnIo7pFS1z6Ntd5zJgvm7nwtlJGl3R71V/22WJEw/2cvGZ
         c1/sSJLzC/62Fv4/I8jSW3Vla5jyhL4/DeG6/tPZNqx8P1CRmLZoDpUbt6YhIIkU4MaT
         K0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292552; x=1781897352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlOJEoz94FuxFi6Nw0eWYLZk82W0XKPPEF+zFyUMrwY=;
        b=fWzxy6nFViZp99b8EJcRJMkzarlDMnTNJ2KDTmmzvbVnSk+7bAsrhsRqdc4jvynxCX
         KsxKW/omUSgtJM4hmnxiwqmLOxiGwq95TI/49VPzIVgh3wt33hMdaSBAhrRdqC1OAq8q
         l2/TIvDMsvD5QLY5FuP6ivBIyBMa+VgMYspvl22AoFriCwGhugCcCc8A+guhFd+3+Dj8
         G94mDFppcrZP2aoVLm0ey+EAlJioV4KvDqSMup7TDgueTBydKh2AZZ0kEYFo7HgILlW9
         LoXTEX1E/KjNweGIVcuS0rY1/Rl1W8Ua3V6Zy0ySy4Boa24kIHhFdF0F9IwuhACQ9AqZ
         ShnA==
X-Forwarded-Encrypted: i=1; AFNElJ/PrHIJZkJLL4M5hAc5C3dAFPI5sgUPsU4mbx5tMbc48YhRWgj67iKK7WqZ+7+M1DtoLWLvxD98bhIdESgjEfn3@lists.infradead.org
X-Gm-Message-State: AOJu0YyFgxGVUym6Ffq+Q5YXSr/eWSLqi2tdbA3M69KeNZvE3I0ZT8pQ
	MOqNJ3NVH+kSxkWdkXvBWxzkTxMZr/RuW/S3/1Lr0YXmU+YhA05yd293UrRqkD+Bj1ndwJiUM1/
	myjsy4du1TqdGBQF0eNtSJkCEsQ==
X-Received: from ilb5-n2.prod.google.com ([2002:a05:6e02:5305:20b0:500:2417:f074])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1913:b0:486:45c7:34c5 with SMTP id 5614622812f47-487419e6d1emr682785b6e.17.1781292551319;
 Fri, 12 Jun 2026 12:29:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:49 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-2-coltonlewis@google.com>
Subject: [PATCH 01/21] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122914_150045_80E26A8C 
X-CRM114-Status: GOOD (  13.62  )
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

Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
counters reserved for the guest.

This required changing HPMN0 to an UnsignedEnum in tools/sysreg
because otherwise not all the appropriate macros are generated to add
it to arm64_cpu_capabilities_arm64_features.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 10 +++++++++-
 arch/arm64/kvm/sys_regs.c      |  3 ++-
 arch/arm64/tools/cpucaps       |  1 +
 arch/arm64/tools/sysreg        |  6 +++---
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7bb..096545a6e4043 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -77,7 +77,7 @@
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
 
-#include <asm/arm_pmuv3.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
@@ -560,6 +560,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2965,6 +2966,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
 	},
+	{
+		.desc = "HPMN0",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HPMN0,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index fa5c93c7a1352..c52873a6f91ed 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3326,7 +3326,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    ID_AA64DFR0_EL1_DoubleLock_MASK |
 		    ID_AA64DFR0_EL1_WRPs_MASK |
 		    ID_AA64DFR0_EL1_PMUVer_MASK |
-		    ID_AA64DFR0_EL1_DebugVer_MASK),
+		    ID_AA64DFR0_EL1_DebugVer_MASK |
+		    ID_AA64DFR0_EL1_HPMN0_MASK),
 	ID_SANITISED(ID_AA64DFR1_EL1),
 	ID_UNALLOCATED(5,2),
 	ID_UNALLOCATED(5,3),
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d6..f8fb4a6395428 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -42,6 +42,7 @@ HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_ICH_HCR_EL2_TDIR
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 6c3ff14e561e6..2d5cbc8ced114 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1679,9 +1679,9 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
-Enum	63:60	HPMN0
-	0b0000	UNPREDICTABLE
-	0b0001	DEF
+UnsignedEnum	63:60	HPMN0
+	0b0000	NI
+	0b0001	IMP
 EndEnum
 UnsignedEnum	59:56	ExtTrcBuff
 	0b0000	NI
-- 
2.54.0.1136.gdb2ca164c4-goog


