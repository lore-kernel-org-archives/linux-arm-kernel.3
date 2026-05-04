Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52931CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uiiVseT2qkhFwzL7iHG6lxFCIgHI+i9LhCSR+WQs4k=; b=Pd1SUzlM6yXsvjcofVIX2mP4ww
	8x9We3zFUEGav85WIjEU4uPZl1P4rLECSLXf7iBKdqn88CTv1X5HEmiqif1sDyhoREvuEavCm80U3
	gKY3icssFYf5H0yr3m1vh64ON8CeVfIABbjgF6nqLKrRvcrgg/F4JHmztYcIuQq7bqM2Hxo29JPyJ
	7mmcxNz+949q9e4nW8XcgkeDI0EaJ6fharEPQoKYGplS7bJbleUZCjAJelf+regDi49GQ8UM6Gt5z
	SBIYYAULO4vrKzDVR5tpdHslIA1o7puxqSdO3VXNNw0IDqVcA5bvL0jOTwYeaPSc6eBcsYQxbcTMB
	tNJtMkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gT-0000000ELGt-3sQL;
	Mon, 04 May 2026 21:18:33 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gR-0000000ELFS-0Cqe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:32 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6948d83a548so13316500eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929509; x=1778534309; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uiiVseT2qkhFwzL7iHG6lxFCIgHI+i9LhCSR+WQs4k=;
        b=BoxHSjOCfSr5q3rXevWJbbVaHdWJLGXafQ+VL4k5NZv41nJU56ORKlBd/Mr2m6Tfbc
         uXWt765hPL+DiATUQO3TjeVrmkAZ6CDaJ2pVM6hwkQWhKmnxaoUoMuepv5nQ38+1BS4m
         40fFtAxnZwjgk0ZPBwjKe8l3lKPyeH21G4Azl6RDXTfC32ILD7hKcfJcaVRwyEGRZ93Y
         Zuix8pdvAFSeiC9mLesS31SYC30G+GiIharsF5G3EuYVznvY+LdFOkrf4qqzm8Ehj11b
         vbtErvDJHHPBbbVYH9ZjMsFqPgbtx8+efI7JIJXJYsiGmoLvDQK1CS3zisbdlDL9zdDZ
         6fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929509; x=1778534309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uiiVseT2qkhFwzL7iHG6lxFCIgHI+i9LhCSR+WQs4k=;
        b=j8jmM+jercghBUFp2EsI7YeGLbxh5+KqrfnaI+3F00a7rxA0b7ThJ6YC+6lKbghtaX
         qaXxABxleckAVmvlj6eYDBeyOec0Oz1jrJW/h/GeIB3uu/NerfzZBWhhYRoxgorxNz+R
         15HP2iT+6g2LiQwHzNGznDNx3LXCbDgQfT427wJz0VO7BuFZFL0TLWwK7H96Mrid79S8
         7n6JbiOUIfMTfttQcoxlw75+6lGYtjI07tbPYrL29M0pe04DBt6yOkbsBQIIxDyEcccX
         hBd0LrVLwLKuMHf9sEZr4jiF2hJgP/Zf63divlqOzx8yx8/3Q83NMG5Jp8caRauvXQa/
         eHJA==
X-Forwarded-Encrypted: i=1; AFNElJ8vHPH0suEGRr0N3c2ekSnzSJx2ZsRUDgE4cmh+Bh+46dZAiwR2J2SAXvvencKD3KDMNy8CEI/Z6Wt0PTT29/Cl@lists.infradead.org
X-Gm-Message-State: AOJu0YzFuAucUycSUn2nz37od8QZ3XTQN4jW8PhHDtU3s9f5oyeJ9XWX
	M2F8aKzcFgtavZ0jQrAr5KEBvu9LOOLuCvyXKpMuoK4t+aXB00ELDQfPAwwFEyLaSFMUafK0LNU
	61Rs4wyF5UAQTxj2vgmOLVrAHDg==
X-Received: from oalw10.prod.google.com ([2002:a05:6870:948a:b0:41c:55f7:96a3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2223:b0:694:8d83:a344 with SMTP id 006d021491bc7-696979f0660mr6109852eaf.16.1777929509296;
 Mon, 04 May 2026 14:18:29 -0700 (PDT)
Date: Mon,  4 May 2026 21:17:54 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-2-coltonlewis@google.com>
Subject: [PATCH v7 01/20] arm64: cpufeature: Add cpucap for HPMN0
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141831_091577_7B3C2981 
X-CRM114-Status: GOOD (  12.98  )
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
 arch/arm64/kernel/cpufeature.c | 8 ++++++++
 arch/arm64/kvm/sys_regs.c      | 3 ++-
 arch/arm64/tools/cpucaps       | 1 +
 arch/arm64/tools/sysreg        | 6 +++---
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32c2dbcc0c641..5c6c76a9696cc 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -556,6 +556,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2964,6 +2965,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index 1b4cacb6e918a..0a8e8ee69cd00 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3232,7 +3232,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 7261553b644b2..654b165781854 100644
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
index 9d1c211080571..92135f8834be0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1666,9 +1666,9 @@ EndEnum
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
2.54.0.545.g6539524ca2-goog


