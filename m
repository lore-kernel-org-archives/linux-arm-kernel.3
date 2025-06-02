Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D755C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgwK7stiipaBbElK9ZH8eFt+KmwsSimSmMPY4y4bpeQ=; b=eoBKzIymKv3HvFgQFVB0HIsnuz
	nA7d7ti+KBVyKBjrCAyNdvEzGaoNaVaF/VeZSP9oMVc5YNbrvDjccmkGk7rU6QKbhGHm9X0RKl0r7
	+gtqN7cNHzh4KbbnpdlCVjcxNadmxyV5+wTUQr2hJ/w9WyLq1BDDfIG8+d8EuZWnwhIJF2sGSuIW1
	F5ZkPEPO80d2wOac/sQDC7OOHOtfXyjTx5LO/WVwW/F0or5uix4CyU/JV1EdL2pct8VOfCexrRjs4
	f9rPb0cWPCSYp1POzSsJ3YmfzKM3xqL2YNEMkAM/3kqWmNKa1o4DPGcqdrjq+9PggPctApgyDS56u
	ZQsn4l4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAue-00000008WCQ-0K2H;
	Mon, 02 Jun 2025 19:33:36 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqB-00000008UAa-3dlI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:01 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2e990e17650so526792fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892538; x=1749497338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgwK7stiipaBbElK9ZH8eFt+KmwsSimSmMPY4y4bpeQ=;
        b=L/+A9YamIUWSqg/PGFg9/Xsaf6R8QYmUC2JT7qj4qB4ONQIruiIACY/W7sHFj+DBlH
         VHh+IL8HWGfuoxqbP7wpI1fxHLtDDVqtYwt2MPgRQLlVUjX1K16C3+OuiV5WCJp45lLE
         ewdyQZ143dBb2/U6Ut2Wve8wGRE/iWYXfspktWJJC2m8cpZdGmP26yq+uALqpG03WljR
         mF7TA9yD2RXgOXTwaGxmr8SUbU8bSZ9bFkdvqF3BvsujiDjM6v+vQz9sDYgCcJJVuxny
         ljEdQhIp7dk0QnDsQn/9SaFXonzzsARFRtavXtwt0WeMKPqHH4J1aMLaZtCL65hGAnEK
         38XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892538; x=1749497338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgwK7stiipaBbElK9ZH8eFt+KmwsSimSmMPY4y4bpeQ=;
        b=KniIoyAh6Jq/2Oho0upkFGzRIUmEN7TLFC6aUHK9eKk1smuHl5OugVmvmOyKnxnmu3
         vIkrUaUvl571IG3I7lfWT2w2nXtWIkbrQ7r7JZrJ9op889hI9mwc+1k3l0NEqzOWl028
         QJ+I4drK1BoTp6qgKlUNKziVaCGa1osws+pVyZ9J/utD7oB51beWpqsxhrchoTZTwxUc
         LAlIKOda4hrC4/woNvhDadwYngIcVEeVYc5hGWlX3pHxYKWk5flWfOdcjTSIaLsciHQ0
         oZxjeYchoj2ZZmCbOXPZXGM1IWTE1zLqRUN2OSQSTw6r3DSA169yzIuZikNOcJiqdBew
         WfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKN6RHZe9r9IKU242l4k5aX21lMzglBLy2jQATk3IaiCzoMOZa6lRVjkr3lGG1t27SQhUSgEaVzQ9tEr2s6/B2@lists.infradead.org
X-Gm-Message-State: AOJu0YxmLWq4n0qT3KZmiBmMfGItow2h0fDGNWsQTr91ZdUPV/Aqgflp
	/23Jl86yK7QqTHZLEAEQlfmufcv63r/oIYWDF0YLg6eBSRM16h/AHRJVj1e9TGQ3hj+Q+IO8pfR
	e/0IK3w6JhPJF8SMZC7oQvL+XhQ==
X-Google-Smtp-Source: AGHT+IHY5orLOMss72/ttOtRz18RgR7Q6GomVkN3UzZeAOQY/fszGrZVl+8B2BDQNOJ4jWTDkgrOBQQZ8Rc/ZsDHgg==
X-Received: from oabgs11.prod.google.com ([2002:a05:6870:ab8b:b0:2c1:5c70:acac])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:b1cc:b0:2d8:5015:1a8f with SMTP id 586e51a60fabf-2e94881808fmr4931862fac.7.1748892538177;
 Mon, 02 Jun 2025 12:28:58 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:46 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-2-coltonlewis@google.com>
Subject: [PATCH 01/17] arm64: cpufeature: Add cpucap for HPMN0
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
X-CRM114-CacheID: sfid-20250602_122859_905608_40DA93BE 
X-CRM114-Status: GOOD (  13.20  )
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
index a3da020f1d1c..578eea321a60 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -541,6 +541,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2884,6 +2885,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
 	},
+	{
+		.desc = "Hypervisor PMU Partitioning 0 Guest Counters",
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
2.49.0.1204.g71687c7c1d-goog


