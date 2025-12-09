Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B573D3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU4SZZiqzmEBDGaqnOKa3zbJ+UV1JK/WP+4z3ISxHr0=; b=MH5ahIBiWE8peYEKXlR7zjW7TT
	LgS3Puz9zkzml2BOKL4NEsX1+yXgs3PpGwIVzHWT1WJf+L1nJDCF9i71uYlCLu4Lr3i7fIDKJryuk
	Wqfp9J0xnVAwBaWKRcfXuQfGdCFpKrLTnpal5BDNyTBwtRqHckZGzotCpDNrQst0nFHcw3ML33EI0
	4VBca16qKnh4VnZTVwfGNy+bEd7G4JO7xYKiuqN0LDJn90NqfDlmpTDeblWlBPqGUowh7HT5GgMMd
	+LL16ibVvX+bMXHHiprkcPUlRJ96819yUWhrmiE8UxEk7qnetnVg+DH3mg+BaXpUITL/JJ8AIebbx
	UsR0ZbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hC-0000000EkZ5-2Wzx;
	Tue, 09 Dec 2025 20:52:30 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hA-0000000EkXT-2c8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:29 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3ed1781e961so2985682fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313546; x=1765918346; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nU4SZZiqzmEBDGaqnOKa3zbJ+UV1JK/WP+4z3ISxHr0=;
        b=Ey59PXMOrVvaVc5QEGNXliPiCJYiHOVGUlC1sB8N3ahYyBjM4vOzr4V29EiA1fKF+9
         1Fy8rLt18eC3yiI1KZgVFZxlS9TOWlbN0veOwH0q1UrvpTrqAiTSDwJpvxZQoJcmXTV6
         zPqdvLaydqg9KU3y+PnmRE8skR9X2ErnPuSNbe6MQ/OQsLpOPgMat/FfcGQlYvyUO8/J
         XYOyvEcX7bhm3xi1uE2QgDZGl/426zqgDjw5/3CPKQD9sl1ZeQiQGja82HbQSkDMVXtN
         CS0XyOtSgdLswoY2wELd55dlvuviFWuIdgSfapiLgdqFqdSZs4XROIkVU1lGU2l/gKfs
         zBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313546; x=1765918346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nU4SZZiqzmEBDGaqnOKa3zbJ+UV1JK/WP+4z3ISxHr0=;
        b=GWk2DtpYhpSQDcZHW34CAYWvUiA4mwOzpJk44I8GqM9y0xyFrjT45V2knQZeC92J+h
         6CTAxHNRTWjEaoW210Q+24VnpxrKik7T41GXguBu70OA64EvTTrDwTBsSGwsLKfKwrPM
         mYENExy/LiQiRvwYbKNsYKpA94bz4Nm/UIHZIXVBYykE9vBnYCQ9m6j6eNi8qluB24gI
         DCtmq2nuHeADrpkOR91+yyG2uTrf+mcC80q8lzzZ55ORkrHNcxt8I7BqsfPK0c+w1liY
         d2tvICm+aJ5Yq2jPiwEv8dGePpg/K3iU3ZGe4V72Gi/ci+HJlBX2OHVqcNr8skHAxPdb
         6hsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV//fXB6FMV1WoldI5HViuXv8xeBa0FPgrMT9NucOF/365eCBRNFWq0DjECcblUON3z6rwnK1H1kTr6F0Q6ubQM@lists.infradead.org
X-Gm-Message-State: AOJu0YwQnIYcFZIwoK0yxNUHTdPMq4i8pVNtJkOd06D3RelsDObe05Ng
	JpDZJUyrTPqIwMuCUhyqHAq0/vTlGk0L4LwylKfk79aESuiliLhDVribhXVF2/oyTNymgusf0yB
	Ui11Q3lfaN4DoFj4gxdgxXo5d9Q==
X-Google-Smtp-Source: AGHT+IFTAojYGX7mwXtTP/8YDMBz+eRxv1aZJcv87i7iIEe8Y4VXsg/VmkpZtN9aG2jKXs0+7TmzxHPwou8ROcGDdw==
X-Received: from oaqy6-n2.prod.google.com ([2002:a05:6871:2c6:20b0:3f5:4f00:dfbf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:568e:b0:3e8:3176:a342 with SMTP id 586e51a60fabf-3f5bd88ead1mr170402fac.22.1765313546407;
 Tue, 09 Dec 2025 12:52:26 -0800 (PST)
Date: Tue,  9 Dec 2025 20:50:58 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-2-coltonlewis@google.com>
Subject: [PATCH v5 01/24] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125228_664472_834136C3 
X-CRM114-Status: GOOD (  12.63  )
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
 arch/arm64/kvm/sys_regs.c      | 3 ++-
 arch/arm64/tools/cpucaps       | 1 +
 arch/arm64/tools/sysreg        | 6 +++---
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e25b0f84a22da..ceddc55eb30a0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -555,6 +555,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2898,6 +2899,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index ec3fbe0b8d525..c636840b1f6f9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3214,7 +3214,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 1b32c1232d28d..8efa6a437515d 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -41,6 +41,7 @@ HAS_GICV5_LEGACY
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1c6cdf9d54bba..24d20138ea664 100644
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
2.52.0.239.gd5f0c6e74e-goog


