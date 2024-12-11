Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B5CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYv/Z59AB6Gv4K2v7SFuvKNnIt2l46rfAdCdwev4tPQ=; b=25S34SY4Y67ncd1OC+9aUfnR04
	lE81FcaQUl78igiPGHqVrgiRlxcuYMfq8iJQewnSeSFlB0QmY00Xsb26s2QiE/5GuPU7PdDYQWHs2
	NMugT4WJ0yJ9HVpNxLrfuQDqx5zNGtixiSSIrrzP39g1o/KmadRiYIGqljsEpNi3StZD7N+vAFUeY
	CKupRpEzHqGOtwMiagXcD3nOgFNo2dFZauLgUbsioTHFrnXzfFlK6UggzmuJjZBfWLaWS2V25XMv6
	TV8yMua6Snai4odsYg6lB1QWo824CGowXJmpJJJMhdR86wzT3eprxNOEJXorEE2+BxgJjuMduo75k
	U3iVvNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPEs-0000000FOK0-2CXG;
	Wed, 11 Dec 2024 16:07:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPB0-0000000FNKo-381G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:03:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B01E169E;
	Wed, 11 Dec 2024 08:03:30 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 583E83F5A1;
	Wed, 11 Dec 2024 08:03:00 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Date: Wed, 11 Dec 2024 16:01:38 +0000
Message-ID: <20241211160218.41404-3-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211160218.41404-1-miko.lenczewski@arm.com>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_080302_868103_F0DD718D 
X-CRM114-Status: GOOD (  18.91  )
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

The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
and this commit adds a dedicated BBML2 cpufeature to test against
support for.

In supporting BBM level 2, we open ourselves up to potential TLB
Conflict Abort Exceptions during expected execution, instead of only
in exceptional circumstances. In the case of an abort, it is
implementation defined at what stage the abort is generated, and
the minimal set of required invalidations is also implementation
defined. The maximal set of invalidations is to do a `tlbi vmalle1`
or `tlbi vmalls12e1`, depending on the stage.

Such aborts should not occur on Arm hardware, and were not seen in
benchmarked systems, so unless performance concerns arise, implementing
the abort handlers with the worst-case invalidations seems like an
alright hack.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
---
 arch/arm64/include/asm/cpufeature.h | 14 ++++++++++++++
 arch/arm64/kernel/cpufeature.c      |  7 +++++++
 arch/arm64/mm/fault.c               | 27 ++++++++++++++++++++++++++-
 arch/arm64/tools/cpucaps            |  1 +
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 8b4e5a3cd24c..a9f2ac335392 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -866,6 +866,20 @@ static __always_inline bool system_supports_mpam_hcr(void)
 	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
 }
 
+static inline bool system_supports_bbml2(void)
+{
+	/* currently, BBM is only relied on by code touching the userspace page
+	 * tables, and as such we are guaranteed that caps have been finalised.
+	 *
+	 * if later we want to use BBM for kernel mappings, particularly early
+	 * in the kernel, this may return 0 even if BBML2 is actually supported,
+	 * which means unnecessary break-before-make sequences, but is still
+	 * correct
+	 */
+
+	return alternative_has_cap_unlikely(ARM64_HAS_BBML2);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed8..7cc94bd5da24 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2917,6 +2917,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
 	},
+	{
+		.desc = "BBM Level 2 Support",
+		.capability = ARM64_HAS_BBML2,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
+	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ef63651099a9..dc119358cbc1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -844,6 +844,31 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	return 0;
 }
 
+static int do_conflict_abort(unsigned long far, unsigned long esr,
+			     struct pt_regs *regs)
+{
+	if (!system_supports_bbml2())
+		return do_bad(far, esr, regs);
+
+	/* if we receive a TLB conflict abort, we know that there are multiple
+	 * TLB entries that translate the same address range. the minimum set
+	 * of invalidations to clear these entries is implementation defined.
+	 * the maximum set is defined as either tlbi(vmalls12e1) or tlbi(alle1).
+	 *
+	 * if el2 is enabled and stage 2 translation enabled, this may be
+	 * raised as a stage 2 abort. if el2 is enabled but stage 2 translation
+	 * disabled, or if el2 is disabled, it will be raised as a stage 1
+	 * abort.
+	 *
+	 * local_flush_tlb_all() does a tlbi(vmalle1), which is enough to
+	 * handle a stage 1 abort.
+	 */
+
+	local_flush_tlb_all();
+
+	return 0;
+}
+
 static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
@@ -893,7 +918,7 @@ static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 45"			},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 46"			},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 47"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"TLB conflict abort"		},
+	{ do_conflict_abort,	SIGKILL, SI_KERNEL,	"TLB conflict abort"		},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"Unsupported atomic hardware update fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 50"			},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 51"			},
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eb17f59e543c..4ee0fbb7765b 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -26,6 +26,7 @@ HAS_ECV
 HAS_ECV_CNTPOFF
 HAS_EPAN
 HAS_EVT
+HAS_BBML2
 HAS_FPMR
 HAS_FGT
 HAS_FPSIMD
-- 
2.45.2


