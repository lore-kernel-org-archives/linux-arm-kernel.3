Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3999DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycwbhAp7Zd2F37ixHvuXJ2dafaPBGypIo/idKjOgZXE=; b=ZFoFJn/BcB64lRWjrNSfIIrb/b
	EXyTB/croiYcqHiHnwVKSp5F1aVblzMn0cbBxZsmQxb3v4Wk+B6JFpoVY8U5wMfBdlQ39A6p3PQsn
	9XByKwlwiuFyvpOIz79UwCVxfA9XTPmVVbB5ua311P55OjomM0O3NMW/iqVZvH+Qn5jTioXfIhfAw
	xkKpMdGhEX6NYPVHagSYG/9te1j00DtoyHg/DI95YyLhoDlZtRL3Y6qfyXae0F6Sw2CVcfS3tgIDF
	++P+QDVZCS026gsVlLVjn4Nz4Y7NcfbVeIhPFP0aOM1r5frQqEUG/0uOXScuWt3wqcDe/u5DbXG58
	DXpreZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk8g-0000000GiTp-4BSj;
	Fri, 20 Jun 2025 22:23:15 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4E-0000000Ggys-0aeY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:39 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-8760733a107so183293539f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457916; x=1751062716; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycwbhAp7Zd2F37ixHvuXJ2dafaPBGypIo/idKjOgZXE=;
        b=3idtivfmQCEJzPCzUwBtozCdj7Ryg+B70IXjp83PPogEtW9k8LPLlQQTimA43I8sfP
         2+dT6beg6Oy74Rse3o/1HxrY1e4LO5P71eZx/USWoo3wX6To7ghZuINhV3iUMEgwQdce
         qOyae8mcdv5ETSeu26IgR/23KJJhKfE6UoOo9WLeEEIollbe1QrRb0y7VsPTaP4EAM3r
         jdGGkuQ7iOiM3INcDlfOEw0R96dXw4uGtj2g2MxcQWVtfaiFFuhC4oCnzKWyRatrOFto
         OFxEruXe4gc+z8hsLv5kz+Buxtvk6SvWz6flsM8W/y+Obdjf96AX+7jpW/IuxlgjhdQo
         h+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457916; x=1751062716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycwbhAp7Zd2F37ixHvuXJ2dafaPBGypIo/idKjOgZXE=;
        b=ewJgnWTpEDZ0Z92A1UeAx+BIZ7WD8EidqZJ1TyPlJgEXYyRxn3K0n3t2CVqxDEVbkz
         I+6WnLlbAm8YURwq55LOqvB2m5zHP9URtrOWoYLu0UNkQo+hYNOMq8sMXyUm2BX4oYn7
         BHIQSNMR0hgEVY0/FZySWtjSOZdf1u+7V9zI9Ax+Dwx4CTkuzzOM+du0Kv0Nmdge1sgE
         1ggK+i+kNW3ZTEKsHWaLcnjdnzSjj2vlOqZ+yfDvKhd1nZExwiimQbH/R41flsFqNfp/
         1jCLGM01CDZs2us2m1RgSesMyYj2/YKiDGM3UxZz0MsOu4t6YfswDg1fzoBdZvQwS61p
         h/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+KCqIc0l/cIuTgHmQ9Pkpl4G88vTq+2SavE2krjwt01Mjhm1+k7VzWgMsjOXkpKnkwelmO29kqvMAYA47xuOP@lists.infradead.org
X-Gm-Message-State: AOJu0YxbRl9pXqX5dNHH33Pe7Yi1tt3LctRBpHphVHUKDMd6x8walmBt
	Upatc7lfb98OaNUEbtm0Flf1IzSti8DAJQW92inik2VnfVbDN4nBrn0pf2Rn9ffs3BEHQhI4bLW
	FRD5qr0EbnrrwFK2P/4hSJYxAPQ==
X-Google-Smtp-Source: AGHT+IHdG4exJg/OMLEag+SmUtZLjuBoL7XDzzcwpjklziK4h+sFdGNrbUVUxPa6LEbWOqyaRb+b3/J1oVJBEuicPg==
X-Received: from ilbcp2.prod.google.com ([2002:a05:6e02:3982:b0:3dd:c6fb:13fb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:c26c:0:b0:3dd:c18b:c03e with SMTP id e9e14a558f8ab-3de38c21fe9mr52496035ab.5.1750457916490;
 Fri, 20 Jun 2025 15:18:36 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:01 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-2-coltonlewis@google.com>
Subject: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151838_179895_78CDCD6B 
X-CRM114-Status: GOOD (  12.28  )
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
index b34044e20128..278294fdc97d 100644
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
+		.desc = "Allow MDCR_EL2.HPMN = 0",
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
2.50.0.714.g196bf9f422-goog


