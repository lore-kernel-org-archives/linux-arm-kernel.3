Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E357AE9461D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRE+uiZ0XUNzFGmxnXVrfreBhjJPUlvjb1s52PGeIK4=; b=f9r1f4qUMhXlP6wq1G2dZsrYF6
	udNDB+gLKa+z13rnUDrowUvHglX3TPqSRi41XjWj7caV5FbovSHl1W4ykYj/SrjoaJnIHJro+MBkL
	E1pppQuEhOxZAU+151KLwNrdgBifreVXQHKz1xTF5l/6B1RBZTWdRO2Q2TpFWxVC67SruDJzlLA+i
	ITzusN0xbjVXvvzjJ+1ei5eL2JbPKMUDN+UCgeeATZpKqZrQ2vPw4sr+Ne2c6yciBqc3M6OrwsMTQ
	yLPu6JcKfDmdAG16tULLUCVg/xpuu+s3knQebuZGdg+XeP7VyGVP2PlofuUqgpzm206rvYv8RQO4W
	aW/2BLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZw1-0000000G7J9-17YU;
	Mon, 09 Feb 2026 22:40:49 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZvy-0000000G7IL-1ZB9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:40:47 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-66ad005c9dfso1579862eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676845; x=1771281645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRE+uiZ0XUNzFGmxnXVrfreBhjJPUlvjb1s52PGeIK4=;
        b=fPM8f+C2NJmp1R31MODIov36aLOmISyhiFUUR+NFh9SoYmsi6lb+nf2wFJINBJJuOu
         E4Aa8+J+ba4ry8w/h2jCJy9zgxBsEepK1v24y5FWPRAM28t0TkfK1HLPucP5U1tgcckj
         8Zi+Sadi4U8OmVkQOkvESdxo+heQOiuoKuUPs2N0G3wV7IcqiV7j48mBXhkF7ClvYfpN
         UoZxL+XeNRAuyb1u3fYO6qlrVYFFjJvzMvgE5hkO9ztNCd3g8VAWu0gw7LWoHOxcfpTa
         1aabK/VZW8Zifseei/cz9TxnnTlkhCd24GykWJ1HPzEEQA00jLQyBuRv2gT1UOADovMf
         Bpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676845; x=1771281645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRE+uiZ0XUNzFGmxnXVrfreBhjJPUlvjb1s52PGeIK4=;
        b=YVbVesu+YS9HlrSjLEpzkQBcDUN+aRFBKNHyX4vyLKhr5i9LayuFezASPEpESmFXVk
         bXeeXoBlY9pQKuwZLU9ZAmM6MtOlKkcSLc6TFSTThumwpjEtkSBo9OGxivna2OKuZ0S1
         REhZDWCwwMZ6Rcanyk9QoOsD6TX6Bymloln4NlA11Xpf78BFMs1M1HaaD+fHkdDXFUEe
         ELVZLtSdV+40Dcyv2OSJ1hOZKXS7kz/aZsM9enubkwD446Cgw3np3u0bt0zoQQ4ZG97n
         DGyfkj99BsUrPcwugKLIUpMVHzfl/cmpz0AC512RJ/WHEQ1IDdc3ojit+Cnmpe+zdO+u
         C+hw==
X-Forwarded-Encrypted: i=1; AJvYcCU/02LVWGs35nlH6r4voxY2uNll+ZBVQf1ecj5BPWZNOqcVZADYy8L2vTbxyVEPlYaTWOmq8cAnFy8ogsZoy1fQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzNVIh2REH67L2XezT39FVqml6xNfSBYHdDtcQwpd/+Vp8WlBG9
	aWGvSWKBZ/vXrsk1+ENBVt5IAsT7sT8Aa/ggtGdC06r9rjj0oRnXFMJEptoU4o0kyV6AQSXmqBG
	d+Hf0K2CPcE6dL1/uyH5NZgoeqQ==
X-Received: from jamu20.prod.google.com ([2002:a02:c054:0:b0:5ca:f895:d041])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4b17:b0:663:93:5146 with SMTP id 006d021491bc7-66d0bdae77emr5791796eaf.43.1770676844869;
 Mon, 09 Feb 2026 14:40:44 -0800 (PST)
Date: Mon,  9 Feb 2026 22:13:56 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-2-coltonlewis@google.com>
Subject: [PATCH v6 01/19] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144046_416251_151F2B48 
X-CRM114-Status: GOOD (  13.23  )
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
index c840a93b9ef95..e6a8373d8625b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -555,6 +555,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2950,6 +2951,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index 88a57ca36d96c..a460e93b1ad0a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3229,7 +3229,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 0fac75f015343..1e3f6e9cc2c86 100644
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
index 8921b51866d64..c9cf3d139c2da 100644
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
2.53.0.rc2.204.g2597b5adb4-goog


