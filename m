Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C2C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf5QNg51uN0nz7hXILxBBxSG24pHlKfzikD1/6accKA=; b=GluZuYJNu4kpMIdv0xqOlw6jJ6
	7ulqKF3xGm2jh2kgGeTKXYXEDIAkyEUWcH5MfYgorJshbwIVNt+16XMSSGrxo2WzYw7mrE8w3GFSK
	9aOnysaSh6j6HuLJgURgYUC9cJO7PFAQaoSdxUPfEiTNg4OdBjI6jOMNnPjePyqpG+8wbmc9FywNZ
	oVVKXcr+ocFEfwcmCR0QlgHrPDIyVHQxP7YZ1CNmWMA2K8qwYFVu6fA3wIny9L1F6clISXZz8doa4
	P+jC9eUnmt6ArYu/rVdVBt5kn5lna6stIJoQMjH439E5J9+l0cdXf5wslnJ/WvvBo8mkK1nKawJzN
	LEug7H7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR24-0000000CX8t-32uh;
	Thu, 03 Jul 2025 20:59:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMlu-0000000BzOG-1Wa2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B4C74378A;
	Thu,  3 Jul 2025 16:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB96C4CEF1;
	Thu,  3 Jul 2025 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751560010;
	bh=sHk5RpacHVScooaj/Y+sk96HDvaUhpAnndDJawkuV2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HedWyBd+fVrdJb7ZFB/ZzloAW5DC4A1rKR/JSNuloo+jbi7hjbeDbB7FGQlJ1KWuE
	 6NmREHEpbyfWVqH4rcAM/BJSagP6kb28oPtkWbyY2+NoxZXbfbRRWsT+dploeGpNHA
	 qnIiZPl0FmanZrR4+l/BC6mgQetitQCsKR9fAGKT9TdVXdbbxxPyQUftdMg3Iw2FJ/
	 rBq9tm3FhcZpKt5u0LbiB5HGzeMbBMkmmncxAAU9Uq5uzWyAep7rXhjBBvQndcrbzj
	 js9B1tuRUZNgboMdhGdkAdZO1hBH1v0CpcrkhA4qexOs5KJ5HnMU2iuMLVL7iKV8tN
	 +QO1yIk65wHhQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:23:22 +0100
Subject: [PATCH v2 1/3] arm64/hwcap: Add hwcap for FEAT_LSFE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-arm64-lsfe-v2-1-eced80999cb4@kernel.org>
References: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
In-Reply-To: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3594; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sHk5RpacHVScooaj/Y+sk96HDvaUhpAnndDJawkuV2o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZq9BbLBYY6ZPTr0ScopGZi7pIWUwFpkjiTLYw
 WiIYcMaHGGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGavQQAKCRAk1otyXVSH
 0Hu5B/4h6S7uymGyXHFARqr6EOo69IpLGfhMt/L+m18jiaE5K2pRwiGMm9j0TsKuyvbjw6EzASR
 5cF640qfgCn58dJlciWVoN5glmq3lkyLmwgkBT7NwWObKxqseS1mTx+H56c5dvoCPup88slMMZS
 skjgrdQN4kupB3S/B613366W9atbvcHFGkHcZFMuZt1oKIFKeUVK8Znq2uMWK1HF+Q73YpT9uZH
 YCylRwuOsIolEGK6Xcq23L+n2KDhQB8i+TPjHnt5ua4Cd8ul+kAjR98lwhsPKL7qop0an+k6GK2
 XBvbkOQKsc5C5Waner0/reOHrx104rlKcoGp5lkZd5Cfee6M
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_092650_446228_CCE14AB9 
X-CRM114-Status: GOOD (  13.14  )
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

FEAT_LSFE (Large System Float Extension), providing atomic floating point
memory operations, is optional from v9.5. This feature adds no new
architectural stare and we have no immediate use for it in the kernel so
simply provide a hwcap for it to support discovery by userspace.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 4 ++++
 arch/arm64/include/asm/hwcap.h          | 1 +
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 2 ++
 arch/arm64/kernel/cpuinfo.c             | 1 +
 5 files changed, 9 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 69d7afe56853..aafb969ca263 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -435,6 +435,10 @@ HWCAP2_SME_SF8DP4
 HWCAP2_POE
     Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
 
+HWCAP3_LSFE
+    Functionality implied by ID_AA64ISAR3_EL1.LSFE == 0b0001
+
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 1c3f9617d54f..f8d02c14e5a2 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -176,6 +176,7 @@
 #define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
 
 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
+#define KERNEL_HWCAP_LSFE		__khwcap3_feature(LSFE)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 705a7afa8e58..339b9dbf7cfc 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -143,5 +143,6 @@
 /*
  * HWCAP3 flags - for AT_HWCAP3
  */
+#define HWCAP3_LSFE		(1 << 0)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..726054ac8091 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -278,6 +278,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FPRCVT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_LSFE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FAMINMAX_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
@@ -3175,6 +3176,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
+	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
 	HWCAP_CAP(ID_AA64MMFR2_EL1, AT, IMP, CAP_HWCAP, KERNEL_HWCAP_USCAT),
 #ifdef CONFIG_ARM64_SVE
 	HWCAP_CAP(ID_AA64PFR0_EL1, SVE, IMP, CAP_HWCAP, KERNEL_HWCAP_SVE),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index c1f2b6b04b41..2a1efe8e1fdf 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
 	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
 	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
+	[KERNEL_HWCAP_LSFE]		= "lsfe",
 };
 
 #ifdef CONFIG_COMPAT

-- 
2.39.5


