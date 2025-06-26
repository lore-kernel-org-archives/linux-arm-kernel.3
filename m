Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B30C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaFai0kpA9G7yidHpU/KUU/hEAHmvPP5GvS91zDpLpc=; b=up7PbphXUpjI8KXJ0mVmm5oHuK
	sIol/7avmnsGO5MfLtp9UFmsXslzYoWk5ijTU+A+/OlzPLIsrQwh5frolrgcumDGOIuX0rlIUdGCw
	O2rf064BAxXnO6xRAHBV6/PjWyoqmgHOAa5KDZ4LH3N9+dRAI3J1AIB33+DvxQI6WPTovILyEu2iz
	bM8EIuzEpbWjwMF+ICxOXIPQle7cYkkqgHxE5jUrLgSMtRYS1e6f9ymuBH/OEt6HENrBzWjTxVyj6
	C2+fO07HHnf9dDk2XNNCB7oeC19GFuhy8sx5jOTT+xtU6j0GmNeCRg7siFShhgQZFxI2oYe8ckLuW
	zcH35SZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuMS-0000000CrLN-1OWg;
	Thu, 26 Jun 2025 21:42:24 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsr3-0000000Cgdp-3VqK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:05:55 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86d07ccc9ecso131899539f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968352; x=1751573152; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaFai0kpA9G7yidHpU/KUU/hEAHmvPP5GvS91zDpLpc=;
        b=xEmrdu61yXtaJfFM4w01T6iSLl5urD4hwU3P4kH2jJm7r/kIpK2nuL12V/eH/eP0vR
         lWn+3CelkeX8BTU6VbEykmqfkvkqfL5ncdlQheAo6CcLii5UmzNUPSAPmaHSNHP88xK6
         /fXSFachp8nq+gayH/10qOcz+1EDp0bLuR6laZbffFYgd7XjTDdXvl6CG7wOTy0UAIQE
         RHgGhrICCUUqzZ9bvQWYPhU8Fo/JiMzlOdtTagG4xsIts87Mxu80iigV3RL4sMwMG6Aa
         TL0K1VPCdXz28Q93V08++ajPdh3VXXpyn0yfAaUm94dxr3yL17htSvzENcMHYdZteDIL
         /zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968352; x=1751573152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaFai0kpA9G7yidHpU/KUU/hEAHmvPP5GvS91zDpLpc=;
        b=SqNqSRbeS4Dj1rNoFqvJkwkSbxktR8aEgbTBaqSoK2JXgCWcD0F57gHTntqLGgOtZS
         DCTnZjmBzfUpqVEr/7wGCe4ZR9uN5smfZ0va1nkRmqoT+qQMpKGexgUN7Q26f5rAxTtt
         qoPMR6Ni/MMvQZQ/5Fe5ztjBoMg4mJaYkGkpVXgivAc54bya7I0kik6/7ribblA7uiQB
         Cd7SHSM6EDKtvhAvLesRTY0Er5rXlRMkbgdPfoVYTb/oqsDFiXZjSfSSQLGQB4fY7aHK
         bvjovlGEUwzUhfTsBZDCS72/5yyanK0byNWHaE+JEAKDx8fd4dhS1IOTiZ4F4I0aBNzC
         PYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeoqArCu6nqF8417E5m2BK982WDubNmW+HFNY2WARVi/dlTKy40Ddd3ucDxwkuH5Z8WxZNHfOxY9O9MZzdrhZ6@lists.infradead.org
X-Gm-Message-State: AOJu0YyVPjuv+Fy5rlk8VyV+AYkiHBUd82XDrcQMMQ7L17e1J1LC3UUz
	tPTvzLeKW6rhWG26xdS6yaBe4FjrPdxVx5dhkBB59AWH5lIrdX0uskIrdpMU3G3lqUxmO5NvfFz
	25BeijdUNXQgLY3RE8/bvQhLryw==
X-Google-Smtp-Source: AGHT+IH29/gNXm3nZ2B2ojHCYilqtMfkqWLjy1qqrKLeh9n7wKnCz/XYXSUrRH/F4j6Tl4Qhzhb+cR95L/p7I4Y1iQ==
X-Received: from ilbdh3.prod.google.com ([2002:a05:6e02:1f03:b0:3dd:b580:4100])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:c245:0:b0:3df:4159:8fe5 with SMTP id e9e14a558f8ab-3df4ab55b4bmr13423615ab.4.1750968352377;
 Thu, 26 Jun 2025 13:05:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:37 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-2-coltonlewis@google.com>
Subject: [PATCH v3 01/22] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130553_873662_3BD34AE6 
X-CRM114-Status: GOOD (  12.49  )
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

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 8 ++++++++
 arch/arm64/tools/cpucaps       | 1 +
 arch/arm64/tools/sysreg        | 6 +++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..73a7dac4b6f6 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -548,6 +548,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
 	},
+	{
+		.desc = "FEAT_HPMN0",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HPMN0,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 10effd4cff6b..5b196ba21629 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -39,6 +39,7 @@ HAS_GIC_CPUIF_SYSREGS
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..d29742481754 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1531,9 +1531,9 @@ EndEnum
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
2.50.0.727.gbf7dc18ff4-goog


