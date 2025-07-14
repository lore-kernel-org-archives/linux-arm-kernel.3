Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A952C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJXmYeKTGnjqKEud4aRiMq2ofHrNWARe73nlzic5/G8=; b=yVOu0fs7SjAG3XvWspcjr/Btz1
	CGJf2LfUUGKWBzgs17RXzIqPdlvXJFhU1W76tBfXKlVvfVMJAyi3W0Rg58DqZG77fMletJfawY0gZ
	KGmnNKkVqHslbW3mAfYo98LQ35pg1gRGCRyeMo7G683SRzeIZYk7Cl2U3mgJgNVA/NqjQ4LWATSWt
	MfmqTncuDNZUmKVLBzPyGbulAHKU/5Tr38hBVT3Y+EhqsJiVtLDVVNrIHLQUlmmtlfUNt3GGnOThX
	F4W03QrpHPyIakK42sv501EoPro03Aqx8pRNGKc5IUvPJKuf0+xJHl6HxAoGhejPnF/H5U92mELhz
	2o9osPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSEm-00000003UIe-42e7;
	Mon, 14 Jul 2025 23:05:32 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS8y-00000003SPE-1eY5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:33 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-40b99df0c1dso1195795b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533971; x=1753138771; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJXmYeKTGnjqKEud4aRiMq2ofHrNWARe73nlzic5/G8=;
        b=i0r+hOhzE/ScrNJGbQ8EGjAV8wGHeghn6vziKu9J9LuxvkAladbDQSYCphaUBjdmHs
         gKLmSJOm45RAsPnphsKVZimLYHpVf4Bs2+pv2hPa8GxESsELjbN6T9Rx2xMClyPWuzh1
         PSviIViojypIvlV8fp4svHIzjQVYcLwj02mu5IXhmiVCx2vJp3p3iarlRGX52rTWgm6c
         EGXHQnFBwRSc+rjJwWAGD+c6m4/6WNuslpCxijnpY3mcJ/zmSdrNO4ZIEju9IUB2jK9W
         o2OczTqMyDL0LJlG2b1g5U01XyfZRusdWaqSjDdP4eMP8nLASVfIsTWPSs+kKIudA1VY
         DsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533971; x=1753138771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJXmYeKTGnjqKEud4aRiMq2ofHrNWARe73nlzic5/G8=;
        b=LwHVzNa7B0oeDUWKwYvpAeQuIOIyMLgxv8Q4kpP90Nw707lXwF+lpO3X62rhIbxMGT
         uhp0HkKznVG4uBWNh2xwnSbloL8p4hwZ8+fkoHKdbHX+UJrwBoxNxaaXZKra94xEGojN
         KZiPC2eZ93sBgyiV3MAhJj1wm3OYSfsLLMng6jboMVPyv/PuqbMw+7tw7v+0REKcS7u8
         aniNPpTyk2sttFGwp+/SqN38Q/VRQitAqz7xOB7UU54oISYJXS6Ovr3ogIHUeVrFpUFi
         Weh1two4untsVsPoNROgOgpiQKiS4MMT8tokzGNxRHQc5Pei7JnldvaEWgqzt5/t3THa
         jz7w==
X-Forwarded-Encrypted: i=1; AJvYcCV/QTyP664VFn519qiufJDw+zpl0AXwBU5xUOXFQM/K/07PUlohd0HGcHnTCELrGJruj1hTl4BXpkCVpoNtuM/d@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp/KjomcQZ/l1MqiDYkn6G55Yb4ia6JdPO+NaWcC2WjqWn/RCe
	NzSd6+06+uhd1hNIqmLkYuYYwus7MebId9B9HQ5q/8OeFk8eM65T6GUMbMT5VTniwBV/J4zdPUl
	S9svOm6To5EphxwdJCA0zRDji5g==
X-Google-Smtp-Source: AGHT+IFJZaaG0NKL8tBBBDgd5PVrD7hPJMlHTf5CXiCJq4KOEoeUsMaOm4Ndc7OfFJp7bHopehW6o7GpIil6kUfASA==
X-Received: from oibir14.prod.google.com ([2002:a05:6808:6f8e:b0:40c:a463:99a7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:8859:10b0:415:9306:2e3b with SMTP id 5614622812f47-41593063055mr7134275b6e.23.1752533971422;
 Mon, 14 Jul 2025 15:59:31 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:58:55 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-2-coltonlewis@google.com>
Subject: [PATCH v4 01/23] arm64: cpufeature: Add cpucap for HPMN0
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
X-CRM114-CacheID: sfid-20250714_155932_434050_753DF971 
X-CRM114-Status: GOOD (  12.46  )
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
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 8 ++++++++
 arch/arm64/tools/cpucaps       | 1 +
 arch/arm64/tools/sysreg        | 6 +++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..f38d7b5294ec 100644
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
+		.desc = "HPMN0",
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


